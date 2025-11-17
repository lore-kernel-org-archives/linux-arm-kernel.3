Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B474BCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkoMndG+CRUTj0LaM/Ba6eSbq1NdHiM0kkuJdBKsna8=; b=DzlTCntN8aMjrxDkYJOKpjznhU
	Q/kYFZZ2fhKxnIX6Ph3uyacqw/oXHHSvAIy/cQlUItseOXsCEhh2AthXxakrW4s6roPEvUJz0+j0G
	6ZeDHb/7+Je+nEiavqWgV9cZil6KKb+sdMjuJd2lPveiLa7Ee6dd/UxJUxdP3AhNoNoZuoVsx5NjG
	p6VXWUBcEIf2jYzGxHyduA9+0JD/U+RLunqaiXYDjzysSlTIeKOEYWG8B0rqGYU+1EtS6BNaijXgn
	BGnJYPmL6+AifxjSpEbt3r/qcbwAVqvkRxPkCF2HYBj4wuVuyC5JEitZhw+/iawWCT0A/ySRjtSkb
	l2GdUEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2dY-0000000GUfv-0YQp;
	Mon, 17 Nov 2025 17:03:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2dW-0000000GUdY-1Rdf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 17:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LkoMndG+CRUTj0LaM/Ba6eSbq1NdHiM0kkuJdBKsna8=; b=l2RkHCfMoqSA+b3ZjmY+wSORcX
	J2xfgmYJ+QHAZhqgmhcyqw21upKBEM4JCDBExjscVuYnR8mnG7AXo778C7Dk/oSQT2/Pr8vRN4tED
	vX/02GAWP5mJXCAFkSG4S9VXy3fh+p89LNsNAFAkrZBmplKasEZAKYZUOS8m4D7ohBpivp9LhESBe
	Vv7EFuVDIxMTvGtTla6ON8k2zOg/ZjsDMszgJ4v/F6B60OncBBppRRMbEb/eD5VTMyXfDxIQt4PFr
	bpxstHeCR3KaszTfXqV12fcwxtQbNUafo96xKXHLJXkqdZiHxl0V58r7lUaDrhWj7hMwCLCUNK/a5
	R0o48hww==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1lm-00000007jMv-2YNu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:08:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2DF1168F;
	Mon, 17 Nov 2025 09:03:15 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 692253F66E;
	Mon, 17 Nov 2025 09:03:18 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [PATCH v5 32/34] arm_mpam: Add kunit test for bitmap reset
Date: Mon, 17 Nov 2025 17:00:11 +0000
Message-ID: <20251117170014.4113754-33-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117170014.4113754-1-ben.horgan@arm.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_160800_549888_1A02DED8 
X-CRM114-Status: GOOD (  17.24  )
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

From: James Morse <james.morse@arm.com>

The bitmap reset code has been a source of bugs. Add a unit test.

This currently has to be built in, as the rest of the driver is
builtin.

Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/Kconfig             |  9 ++++
 drivers/resctrl/mpam_devices.c      |  4 ++
 drivers/resctrl/test_mpam_devices.c | 69 +++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 drivers/resctrl/test_mpam_devices.c

diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index 5f7f748e611e..c808e0470394 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -12,4 +12,13 @@ config ARM64_MPAM_DRIVER_DEBUG
 	help
 	  Say yes here to enable debug messages from the MPAM driver.
 
+config MPAM_KUNIT_TEST
+	bool "KUnit tests for MPAM driver " if !KUNIT_ALL_TESTS
+	depends on KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to run tests in the MPAM driver.
+
+	  If unsure, say N.
+
 endif
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index a4bc86e6127e..342525d671df 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2717,3 +2717,7 @@ static int __init mpam_msc_driver_init(void)
 
 /* Must occur after arm64_mpam_register_cpus() from arch_initcall() */
 subsys_initcall(mpam_msc_driver_init);
+
+#ifdef CONFIG_MPAM_KUNIT_TEST
+#include "test_mpam_devices.c"
+#endif
diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
new file mode 100644
index 000000000000..0cfb41b665c4
--- /dev/null
+++ b/drivers/resctrl/test_mpam_devices.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Arm Ltd.
+/* This file is intended to be included into mpam_devices.c */
+
+#include <kunit/test.h>
+
+static void test_mpam_reset_msc_bitmap(struct kunit *test)
+{
+	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
+	struct mpam_msc fake_msc = {};
+	u32 *test_result;
+
+	if (!buf)
+		return;
+
+	fake_msc.mapped_hwpage = buf;
+	fake_msc.mapped_hwpage_sz = SZ_16K;
+	cpumask_copy(&fake_msc.accessibility, cpu_possible_mask);
+
+	/* Satisfy lockdep checks */
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
2.43.0


