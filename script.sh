#!/bin/sh

SSID_NAME=`/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I  | awk -F' SSID: '  '/ SSID: / {print $2}'`
PASS=`security find-generic-password -wa $SSID_NAME`
CODE="WIFI:S:$SSID_NAME;T:WPA;P:$PASS;;"
echo "Point your phone's camera to this qr code:"
echo $CODE | qrencode -o - -t UTF8