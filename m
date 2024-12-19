Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD5EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/eHr0PaiGQ2sS1UxM1MdyUxCdpaxnD74HMz+fDhjD6s=; b=0Nem1xCAIMEms2g8M+MifOHzwk
	AH3oy47VHIsakInGV+MuAy95R4B5eANwEhA8ij4iFFX2AabQf4/HH7UUmIBi2pptT7b6DTitYfuiJ
	UN8w+Wdlo2uQfte19n5ZCt7Ju6Bvb2NZcjZwudOqmAHHdxCIcrZ+eQpeNzqZN5b55diM3UAMkSJF2
	YRsr4SzP5fCDHdepZK2g4vHehBiFRTSTEu54A5d78+FK5J8apucjW3gkzaPnQfC+6rbmAlfiaZc2d
	0ZO6yhtEpmmHf1fy6pO8lzyxeEr3SLEXvgleVYgVcSCKSJ4b6dBtM/61CgMx3PKcFWcMTOn1kSRU0
	0fBo8XwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHU8-000000023bR-3PRg;
	Thu, 19 Dec 2024 14:26:40 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHSs-000000023Kr-09Mf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 14:25:23 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJDSgEP008832;
	Thu, 19 Dec 2024 06:25:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=/eHr0PaiGQ2sS1UxM1MdyUx
	CdpaxnD74HMz+fDhjD6s=; b=XiYgSb1e0NKNOBd1TJsGaq0tD7V2j7q73aNVe6c
	55aKQzIw6y1hEKI0L9aCOK4eh20Kx8oXzUXeKTX++qzS7x+fAoESQwUPDbnkerRC
	vdtzpiCkvCjY0OTNOzHs9ir5IQBnqtgO1F9KAjRy9FUJ3jQlXvVDfQRaWn5qyL0w
	GcC2iXj82AvKUPjDUYuVyMKiY2I+GtZcTjvVMTj7Ds5sc++WYRBZNxTBKfeDIpkF
	/5Fjh/X47EKV2EqDpG3Jn+Fmt8GoBya09QTRURkHHKmBTJ+eeB9s2vDw1uoNGz4F
	qg+ICaFohNsoPHycRU733NyoItwcgc1uiO7E3pYEM9h+EfQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 43mmdf039a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 06:25:08 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 19 Dec 2024 06:25:06 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 19 Dec 2024 06:25:06 -0800
Received: from virtx40.. (unknown [10.28.34.196])
	by maili.marvell.com (Postfix) with ESMTP id EF0AF5B6DC1;
	Thu, 19 Dec 2024 06:25:02 -0800 (PST)
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <shuah@kernel.org>,
        <linux-kselftest@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Linu Cherian <lcherian@marvell.com>
Subject: [PATCH v2] selftests: arm coresight: sysfsmode testing
Date: Thu, 19 Dec 2024 19:54:56 +0530
Message-ID: <20241219142456.3474879-1-lcherian@marvell.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UWsjZAguFfkB_e1KdjHJm-Hb8myvNo5o
X-Proofpoint-GUID: UWsjZAguFfkB_e1KdjHJm-Hb8myvNo5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_062522_189715_20EC3B2E 
X-CRM114-Status: GOOD (  26.00  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add sysfs mode selftest for ARM Coresight hardware tracer.

The test will run below sequence for all possible sinks for every
trace source available on the system.
1. Enable source and sink device to start tracing in sysfs mode
3. Run a standard dd command to be traced
4. Stop tracing
5. Readback tracedata

- Test case is pass if the readback of tracedata is success else
failure.
- In case of ETR sink, the test is run with both default buffer mode and
reserved buffer mode(if available).

Sample output:

 selftests: drivers/hwtracing/coresight: sysfs_test_trace.sh
 Running sysfs trace with default settings
 64+0 records in
 64+0 records out
 67108864 bytes (67 MB, 64 MiB) copied, 0.196945 s, 341 MB/s
 32+0 records in
 32+0 records out
 16384 bytes (16 kB, 16 KiB) copied, 0.000805288 s, 20.3 MB/s
 CoreSight path testing (CPU0 -> tmc_etf0): PASS

Signed-off-by: Linu Cherian <lcherian@marvell.com>
---
Changelog from v1:
- Added test description in commit message suggested by Shuah
- Added config dependency file suggested by Shuah 
- Added TARGETS as suggested by James
- Skipped TPIU as suggested by James 
- Added Reviewed-by tag


 tools/testing/selftests/Makefile              |   1 +
 .../drivers/hwtracing/coresight/Makefile      |   5 +
 .../drivers/hwtracing/coresight/config        |   7 +
 .../hwtracing/coresight/sysfs_test_trace.sh   | 146 ++++++++++++++++++
 4 files changed, 159 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/hwtracing/coresight/Makefile
 create mode 100644 tools/testing/selftests/drivers/hwtracing/coresight/config
 create mode 100755 tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 363d031a16f7..15788c32de6b 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -18,6 +18,7 @@ TARGETS += devices/error_logs
 TARGETS += devices/probe
 TARGETS += dmabuf-heaps
 TARGETS += drivers/dma-buf
+TARGETS += drivers/hwtracing/coresight
 TARGETS += drivers/s390x/uvdevice
 TARGETS += drivers/net
 TARGETS += drivers/net/bonding
diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/Makefile b/tools/testing/selftests/drivers/hwtracing/coresight/Makefile
new file mode 100644
index 000000000000..7dc68ae1c0a9
--- /dev/null
+++ b/tools/testing/selftests/drivers/hwtracing/coresight/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_PROGS = sysfs_test_trace.sh
+
+include ../../../lib.mk
diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/config b/tools/testing/selftests/drivers/hwtracing/coresight/config
new file mode 100644
index 000000000000..47e9256957d3
--- /dev/null
+++ b/tools/testing/selftests/drivers/hwtracing/coresight/config
@@ -0,0 +1,7 @@
+CONFIG_CORESIGHT=y
+CONFIG_CORESIGHT_LINKS_AND_SINKS=y
+CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y
+CONFIG_CORESIGHT_SINK_ETBV10
+CONFIG_CORESIGHT_SOURCE_ETM3X
+CONFIG_CORESIGHT_SOURCE_ETM4X=y
+CONFIG_CORESIGHT_TRBE=y
diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh b/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
new file mode 100755
index 000000000000..1939bbede1af
--- /dev/null
+++ b/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
@@ -0,0 +1,146 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2024 Marvell.
+
+# Test Arm CoreSight trace capture in sysfs mode
+# Based on tools/perf/tests/shell/test_arm_coresight.sh
+
+glb_err=0
+
+arm_cs_report() {
+	if [ $2 != 0 ]; then
+		echo "$1: FAIL"
+		glb_err=$2
+	else
+		echo "$1: PASS"
+	fi
+}
+
+is_device_sink() {
+	# If the node of "enable_sink" is existed under the device path, this
+	# means the device is a sink device. Need to exclude 'tpiu' since it
+	# doesn't have a readable file.
+	echo "$1" | grep -E -q -v "tpiu"
+
+	if [ $? -eq 0 ] && [ -e "$1/enable_sink" ]; then
+
+		return 0
+	else
+		return 1
+	fi
+}
+
+# Configure sink for buffer mode
+cfg_sink_buf_mode() {
+	sink_dev=$1
+	mode=$2
+	# Set buffer mode if supported
+	if [ -e "$sink_dev/buf_modes_available" ]; then
+		cat $sink_dev/buf_modes_available | grep -E -q $mode
+		if [ $? -eq 0 ]; then
+			echo $mode > $sink_dev/buf_mode_preferred
+			return 0
+		fi
+	fi
+
+	return 1
+}
+
+run_app() {
+
+	taskset -c $1 dd if=/dev/urandom  of=/dev/null bs=1M count=64
+}
+
+sysfs_trace() {
+	src_dev=$1
+	sink_dev=$2
+	cpu=$3
+
+	# Enable sink device
+	echo 1 > $sink_dev/enable_sink
+	# Enable source device
+	echo 1 > $src_dev/enable_source
+
+	# Run app to be traced
+	run_app $cpu
+
+	# Read back trace data
+	dd if=/dev/$sink_dev_name of=/tmp/tracedata
+
+	# Verify if read is successful
+	err=$?
+
+	# Disable source device
+	echo 0 > $src_dev/enable_source
+
+	# Diskable sink device
+	echo 0 > $sink_dev/enable_sink
+
+	arm_cs_report "CoreSight path testing (CPU$cpu -> $sink_dev_name)" $err
+}
+
+try_sysfs_trace_resrv_buf() {
+	src_dev=$1
+	sink_dev=$2
+	cpu=$3
+
+	# Configure the resrved buffer mode if available
+	cfg_sink_buf_mode $sink_dev "resrv"
+	if [ $? -eq 0 ]; then
+		echo "Running sysfs trace with resrv buf mode"
+		sysfs_trace $src_dev $sink_dev $cpu
+		# Restore buffer mode
+		cfg_sink_buf_mode $sink_dev "auto"
+		if [ $? -eq 1 ]; then
+			echo "Failed to restore default buf mode"
+		fi
+	fi
+}
+
+arm_cs_iterate_devices() {
+	src_dev=$1
+	cpu=$3
+	for cdev in $2/connections/out\:*; do
+
+		# Skip testing if it's not a directory
+		! [ -d $cdev ] && continue;
+
+		# Read out its symbol link file name
+		sink_dev=`readlink -f $cdev`
+
+		# Extract device name from path, e.g.
+		#   sink_dev = '/sys/devices/platform/20010000.etf/tmc_etf0'
+		#     `> sink_dev_name = 'tmc_etf0'
+		sink_dev_name=$(basename $sink_dev)
+
+		if is_device_sink $sink_dev; then
+			# Run trace with resrv buf mode (if available)
+			try_sysfs_trace_resrv_buf $src_dev $sink_dev $cpu
+
+			# Run the default mode
+			echo "Running sysfs trace with default settings"
+			sysfs_trace $src_dev $sink_dev $cpu
+		fi
+
+		arm_cs_iterate_devices $src_dev $cdev $cpu
+
+	done
+}
+
+arm_cs_etm_traverse_path_test() {
+	# Iterate for every ETM device
+	for dev in /sys/bus/event_source/devices/cs_etm/cpu*; do
+		# Canonicalize the path
+		dev=`readlink -f $dev`
+
+		# Find the ETM device belonging to which CPU
+		cpu=`cat $dev/cpu`
+
+		# Use depth-first search (DFS) to iterate outputs
+		arm_cs_iterate_devices $dev $dev $cpu
+	done
+}
+
+arm_cs_etm_traverse_path_test
+
+exit $glb_err
-- 
2.34.1


