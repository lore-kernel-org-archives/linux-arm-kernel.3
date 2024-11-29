Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91303D6EBEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uXaTNcizPFtrjfJCKxSTpBXDXP7TU5grf9fdjWdXyTQ=; b=yTeg3JRNu4SbMdnmwkyl7TWAlJ
	8jw0kzEs/iDMIHUkD/LB8HD4Dsr9BxVqrzqjPHNuAelA3yO2zBIfUfFjuVGVDnyeO6zTxowcCpjrk
	k8qE+SIoG+dudfYsoL21riFFPn5As4+2uweKfnqwk+h610yaMQsSxR17X9ZLu6mTsEe5bFcxgaMPF
	POOQlmqO66izESVGdhM1tUkLFvYC5zmhtBVmtU86lprOjIrTMnfPCnEvWzVvX2ZXdQCOZ8LkZUcha
	fCkA9fuQg9J6FhWkGiaW0VixMTk125vyuKbMfcqCHcEuyfOUI3JRP1etpIw1bMSCeQSq6kDFxnN4M
	xklB8XJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwXl-0000000HDDT-1IEJ;
	Fri, 29 Nov 2024 08:40:05 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwWm-0000000HD7W-3K9u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 08:39:06 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT0elD7006143;
	Fri, 29 Nov 2024 00:38:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=uXaTNcizPFtrjfJCKxSTpBX
	DXP7TU5grf9fdjWdXyTQ=; b=akR4EM/hAjhYqghMPgwENZjraaFNJIXHN/cG0dU
	oKfvZa4BdkM9UKLXMSeKIf1JuQ0yZllX/2PHxEOJSlTAMEXMp3eCcF3F0LFoe1C3
	JisSEQTPYvuyQBFBNIVXa6Wbh1lQ8mRfr/j8f5FlZH6B8y3v2h3fu/H8VhRUsZSo
	HDJpswaDP2OVzo+1VulkKAlylMNJdih3XuWJWJbl0mZCGp457iV208qLWjQn1Lg6
	1DPr5+zhUhrDgmWMuXO6XEp+ZVyXo9cX0e8afGLNJ2MY4yIQHAowo2KNb02DQN58
	CGYCiFynz/pXtKOSQhNByI7dJN9Zg5Wcmv3qNCVm/P1ck/Q==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4373908pem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 00:38:50 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 29 Nov 2024 00:38:49 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 29 Nov 2024 00:38:49 -0800
Received: from virtx40.. (unknown [10.28.34.196])
	by maili.marvell.com (Postfix) with ESMTP id 550025C68E3;
	Fri, 29 Nov 2024 00:38:46 -0800 (PST)
From: Linu Cherian <lcherian@marvell.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>, <james.clark@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <coresight@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, <shuah@kernel.org>,
        <linux-kselftest@vger.kernel.org>, <sgoutham@marvell.com>,
        <gcherian@marvell.com>, Linu Cherian <lcherian@marvell.com>
Subject: [PATCH] selftests: arm coresight: sysfsmode testing
Date: Fri, 29 Nov 2024 14:08:13 +0530
Message-ID: <20241129083813.3056909-1-lcherian@marvell.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fLBNjfFICIZSKiPtWRJvfwUFkCU59geJ
X-Proofpoint-ORIG-GUID: fLBNjfFICIZSKiPtWRJvfwUFkCU59geJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_003904_966137_C072CBF8 
X-CRM114-Status: GOOD (  19.75  )
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

Signed-off-by: Linu Cherian <lcherian@marvell.com>
---
 .../drivers/hwtracing/coresight/Makefile      |   5 +
 .../hwtracing/coresight/sysfs_test_trace.sh   | 144 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/hwtracing/coresight/Makefile
 create mode 100755 tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh

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
diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh b/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
new file mode 100755
index 000000000000..0d6307fff1d2
--- /dev/null
+++ b/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
@@ -0,0 +1,144 @@
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
+	# means the device is a sink device.
+
+	if [ -e "$1/enable_sink" ]; then
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


