Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F34CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcOHHuWLq+YTA6BfUSr302jRFdlKrJOhVg+OSstvphE=; b=JlRkMG6qTsnNoxVFP2gFa5R84C
	SBiSjyHGXtFHiT6OuZIjBbyX/Sug7IRI5QAqfqIJ/nBUHPfWj/xXydLVKmaqzItDHFq3gM0V/FRrN
	/ovJ2xc/8w4Tklf5ULX5706+y0hDbSPOAtKJlFREeTkKq3diFi3XtV6RuPA16E3I6JL4b5dmgeNQG
	I+BXNysBOzAcNrdJIYg12pzj0N+BLWKRgfBFKtexQtgSwM9e0RNcOztfo3R5X8CmtMW+Cte3LJbiQ
	s7CDYtzej6aBoMihALyXndxVxtfb/cpk1fqGWAUzJ48Hz9HdJkpi8wV7H2Wi7ZA0TA1Wdq8j0rmty
	hE6IwXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwL0-0000000Cf2D-3ulN;
	Fri, 14 Nov 2025 16:07:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwKw-0000000CezM-1sql
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:07:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63A51BB0;
	Fri, 14 Nov 2025 08:07:36 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3797B3F5A1;
	Fri, 14 Nov 2025 08:07:42 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 04/35] perf: arm_spe_pmu: Move struct arm_spe_pmu to a separate header file
Date: Fri, 14 Nov 2025 16:06:45 +0000
Message-ID: <20251114160717.163230-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080746_610356_CFCD0D21 
X-CRM114-Status: GOOD (  12.61  )
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

KVM will soon want to make use of struct arm_spe_pmu, move it to a separate
header where it will be easily accessible.

Cc: Will Deacon <will@kernel.org>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 drivers/perf/arm_spe_pmu.c       | 32 +--------------------
 include/linux/perf/arm_spe_pmu.h | 49 ++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 31 deletions(-)
 create mode 100644 include/linux/perf/arm_spe_pmu.h

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index fa50645fedda..188ea783a569 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -28,6 +28,7 @@
 #include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_spe_pmu.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
@@ -67,37 +68,6 @@ struct arm_spe_pmu_buf {
 	void					*base;
 };
 
-struct arm_spe_pmu {
-	struct pmu				pmu;
-	struct platform_device			*pdev;
-	cpumask_t				supported_cpus;
-	struct hlist_node			hotplug_node;
-
-	int					irq; /* PPI */
-	u16					pmsver;
-	u16					min_period;
-	u16					counter_sz;
-
-#define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
-#define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
-#define SPE_PMU_FEAT_FILT_LAT			(1UL << 2)
-#define SPE_PMU_FEAT_ARCH_INST			(1UL << 3)
-#define SPE_PMU_FEAT_LDS			(1UL << 4)
-#define SPE_PMU_FEAT_ERND			(1UL << 5)
-#define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
-#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
-#define SPE_PMU_FEAT_EFT			(1UL << 8)
-#define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
-	u64					features;
-
-	u64					pmsevfr_res0;
-	u16					max_record_sz;
-	u16					align;
-	struct perf_output_handle __percpu	*handle;
-};
-
-#define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
-
 /* Convert a free-running index from perf into an SPE buffer offset */
 #define PERF_IDX2OFF(idx, buf) \
 	((idx) % ((unsigned long)(buf)->nr_pages << PAGE_SHIFT))
diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
new file mode 100644
index 000000000000..86085a7559d9
--- /dev/null
+++ b/include/linux/perf/arm_spe_pmu.h
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Split from driver/perf/arm_spe_pmu.c
+ *
+ * Copyright (C) 2016 ARM Limited
+ */
+
+#ifndef __PERF_ARM_SPE_PMU_H__
+#define __PERF_ARM_SPE_PMU_H__
+
+#include <linux/cpumask.h>
+#include <linux/container_of.h>
+#include <linux/list.h>
+#include <linux/perf_event.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+struct arm_spe_pmu {
+	struct pmu				pmu;
+	struct platform_device			*pdev;
+	cpumask_t				supported_cpus;
+	struct hlist_node			hotplug_node;
+
+	int					irq; /* PPI */
+	u16					pmsver;
+	u16					min_period;
+	u16					counter_sz;
+
+#define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
+#define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
+#define SPE_PMU_FEAT_FILT_LAT			(1UL << 2)
+#define SPE_PMU_FEAT_ARCH_INST			(1UL << 3)
+#define SPE_PMU_FEAT_LDS			(1UL << 4)
+#define SPE_PMU_FEAT_ERND			(1UL << 5)
+#define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
+#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
+#define SPE_PMU_FEAT_EFT			(1UL << 8)
+#define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
+	u64					features;
+
+	u64					pmsevfr_res0;
+	u16					max_record_sz;
+	u16					align;
+	struct perf_output_handle __percpu	*handle;
+};
+
+#define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
+
+#endif /* __PERF_ARM_SPE_PMU_H__ */
-- 
2.51.2


