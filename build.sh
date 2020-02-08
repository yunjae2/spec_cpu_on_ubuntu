#!/bin/bash

if [ $# -ne 1 ];
then
	echo "Usage: $0 <mcf|omnetpp|...>"
	exit 1
fi

CALLEE_DIR=`dirname $0`
pushd $CALLEE_DIR > /dev/null

SPEC_DIR=spec_src

pushd $SPEC_DIR > /dev/null
source ./shrc
cp config/Example-linux64-amd64-gcc43.cfg ./config/config.cfg
runspec --action build --config config.cfg --noreportable $1

popd > /dev/null

popd > /dev/null
