Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC629C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbexDrd8Cm85Wooj5bzsS4eBDqLvf2JHXAkjUCnVa+g=; b=M/v/Fld7lWxYrzpj+ZiSVkW1Uy
	jMXZFhpMrJ54vLgWENq2IRFQjpnXShQGY2z1b12M0n54CF/NaOA2vXoLyEVaAm8QB4ZCSpZ5yXydI
	pul9ClHk81GgBUr74fP7PaxpD0AiPmIjFHagOu4uk35SSyGZC9m1meO0iZjgtzrtwenVUlyvKdA2h
	TMC8swqJUXAYKBr/+WfKOiKrCUt//Vbmo8joAkW6lZ2gkArmetSWHsNoKJb+xHtu/4g2qB5ij0L3N
	PzXrqPAcRZDNunX25a7kMb2PcJSHzuU2gVfmPFNGqz2j13D0bHbuRvKNOQYJ9Eejn3GbggHmhdmlg
	YRLgMnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaK3I-0000000FlOG-3gWp;
	Fri, 11 Jul 2025 20:09:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIeA-0000000FXjq-3uMS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:39:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C56216F8;
	Fri, 11 Jul 2025 11:38:48 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DB673F694;
	Fri, 11 Jul 2025 11:38:55 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	James Morse <james.morse@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [RFC PATCH 35/36] arm_mpam: Add kunit test for bitmap reset
Date: Fri, 11 Jul 2025 18:36:47 +0000
Message-Id: <20250711183648.30766-36-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113859_053798_4F2E1AEF 
X-CRM114-Status: GOOD (  18.03  )
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

The bitmap reset code has been a source of bugs. Add a unit test.

This currently has to be built in, as the rest of the driver is
builtin.

Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/platform/arm64/mpam/Kconfig           | 13 ++++
 drivers/platform/arm64/mpam/mpam_devices.c    |  4 ++
 .../platform/arm64/mpam/test_mpam_devices.c   | 68 +++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/platform/arm64/mpam/test_mpam_devices.c

diff --git a/drivers/platform/arm64/mpam/Kconfig b/drivers/platform/arm64/mpam/Kconfig
index b63495d7da87..861e4b946ddc 100644
--- a/drivers/platform/arm64/mpam/Kconfig
+++ b/drivers/platform/arm64/mpam/Kconfig
@@ -4,7 +4,20 @@ config ARM_CPU_RESCTRL
 	bool
 	depends on ARM64
 
+menu "ARM64 MPAM driver options"
+
 config ARM64_MPAM_DRIVER_DEBUG
 	bool "Enable debug messages from the MPAM driver."
 	help
 	  Say yes here to enable debug messages from the MPAM driver.
+
+config MPAM_KUNIT_TEST
+	bool "KUnit tests for MPAM driver " if !KUNIT_ALL_TESTS
+	depends on KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to run tests in the MPAM driver.
+
+	  If unsure, say N.
+
+endmenu
diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 470a3709670e..a7f301b0da84 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -2904,3 +2904,7 @@ static int __init mpam_msc_driver_init(void)
 }
 /* Must occur after arm64_mpam_register_cpus() from arch_initcall() */
 subsys_initcall(mpam_msc_driver_init);
+
+#ifdef CONFIG_MPAM_KUNIT_TEST
+#include "test_mpam_devices.c"
+#endif
diff --git a/drivers/platform/arm64/mpam/test_mpam_devices.c b/drivers/platform/arm64/mpam/test_mpam_devices.c
new file mode 100644
index 000000000000..8e9d6c88171c
--- /dev/null
+++ b/drivers/platform/arm64/mpam/test_mpam_devices.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2024 Arm Ltd.
+/* This file is intended to be included into mpam_devices.c */
+
+#include <kunit/test.h>
+
+static void test_mpam_reset_msc_bitmap(struct kunit *test)
+{
+	char *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
+	struct mpam_msc fake_msc;
+	u32 *test_result;
+
+	if (!buf)
+		return;
+
+	fake_msc.mapped_hwpage = buf;
+	fake_msc.mapped_hwpage_sz = SZ_16K;
+	cpumask_copy(&fake_msc.accessibility, cpu_possible_mask);
+
+	mutex_init(&fake_msc.part_sel_lock);
+	mutex_lock(&fake_msc.part_sel_lock);
+
+	test_result = (u32 *)(buf + MPAMCFG_CPBM);
+
+	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
+	KUNIT_EXPECT_EQ(test, test_result[0], 0);
+	KUNIT_EXPECT_EQ(test, test_result[1], 0);
+	test_result[0] = 0;
+	test_result[1] = 0;
+
+	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 1);
+	KUNIT_EXPECT_EQ(test, test_result[0], 1);
+	KUNIT_EXPECT_EQ(test, test_result[1], 0);
+	test_result[0] = 0;
+	test_result[1] = 0;
+
+	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 16);
+	KUNIT_EXPECT_EQ(test, test_result[0], 0xffff);
+	KUNIT_EXPECT_EQ(test, test_result[1], 0);
+	test_result[0] = 0;
+	test_result[1] = 0;
+
+	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 32);
+	KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
+	KUNIT_EXPECT_EQ(test, test_result[1], 0);
+	test_result[0] = 0;
+	test_result[1] = 0;
+
+	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 33);
+	KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
+	KUNIT_EXPECT_EQ(test, test_result[1], 1);
+	test_result[0] = 0;
+	test_result[1] = 0;
+
+	mutex_unlock(&fake_msc.part_sel_lock);
+}
+
+static struct kunit_case mpam_devices_test_cases[] = {
+	KUNIT_CASE(test_mpam_reset_msc_bitmap),
+	{}
+};
+
+static struct kunit_suite mpam_devices_test_suite = {
+	.name = "mpam_devices_test_suite",
+	.test_cases = mpam_devices_test_cases,
+};
+
+kunit_test_suites(&mpam_devices_test_suite);
-- 
2.39.5


