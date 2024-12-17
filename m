Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE99E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhHFWrYb/mOQoFZKkVBe+pJEJcbMtsTwCremyuNvSjM=; b=GTkgeTDoLtvGwv7Gtn+dlEtGbm
	oInQEjlHYsea0NTxEN5NnuPBcsMHgi3H0dTIenTBpBadnQhr6v47HD/ikVxUUtS8sjY4vBlV4iQ2f
	4AxDh5J5pPVnreCsArp57uE/9D85i6BDuovgBa4PYb2ziGXs3F5H+IMiKwap5SQSrYIa7xNkWyWnl
	oudE6YCXwaNrEINLunteSqMsp+RymcaXLRm8yukK+87Nv2wd1AWXRXDEPWGZ6Wo0GlzJTUmv+0mlr
	MxjDpjZrMDCSAXcHxx9SczvVMtVefL2awS6AwaavASWm+X7a8rqXHfIKNcSjV2GXbaWMzdOvYeglj
	iKCf4PXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf5T-0000000ErRV-2xqc;
	Tue, 17 Dec 2024 21:26:39 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf0E-0000000EqTM-0NJu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:21:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhHFWrYb/mOQoFZKkVBe+pJEJcbMtsTwCremyuNvSjM=;
	b=r9cMm4Y4Ct0ojc/NxmhLoRSqbAO4LKLAds+rsjtXuQlN7vdvX/FTcyP2XxGNL1X7DAYnJb
	ifoyeQkgGNb+Ym0MIQpXaeiOmo/NaUqolOXCkacWeaUesvRfbrAtBDI8R94JCQpJ4dU4P1
	QienLMM+/5dvnTM1YvFhOMj174/5Xkw=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 04/18] drivers/perf: apple_m1: Provide helper for mapping PMUv3 events
Date: Tue, 17 Dec 2024 13:20:34 -0800
Message-Id: <20241217212048.3709204-5-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132114_272472_74100B78 
X-CRM114-Status: GOOD (  15.12  )
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

Apple M* parts carry some IMP DEF traps for guest accesses to PMUv3
registers, even though the underlying hardware doesn't implement PMUv3.
This means it is possible to virtualize PMUv3 for KVM guests.

Add a helper for mapping common PMUv3 event IDs onto hardware event IDs,
keeping the implementation-specific crud in the PMU driver rather than
KVM proper.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 drivers/perf/apple_m1_cpu_pmu.c | 32 ++++++++++++++++++++++++++++++++
 include/linux/perf/arm_pmu.h    |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index d6d4ff6da862..b4fe247543a6 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -12,6 +12,7 @@
 
 #include <linux/of.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
 #include <linux/platform_device.h>
 
 #include <asm/apple_m1_pmu.h>
@@ -174,6 +175,14 @@ static const unsigned m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
 	[PERF_COUNT_HW_BRANCH_MISSES]		= M1_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC,
 };
 
+#define M1_PMUV3_EVENT_MAP(pmuv3_event, m1_event)							\
+	[ARMV8_PMUV3_PERFCTR_##pmuv3_event]			= M1_PMU_PERFCTR_##m1_event
+
+static const unsigned int m1_pmu_pmceid_map[ARMV8_PMUV3_MAX_COMMON_EVENTS] = {
+	[0 ... ARMV8_PMUV3_MAX_COMMON_EVENTS - 1]	= HW_OP_UNSUPPORTED,
+	M1_PMUV3_EVENT_MAP(CPU_CYCLES,		CORE_ACTIVE_CYCLE),
+};
+
 /* sysfs definitions */
 static ssize_t m1_pmu_events_sysfs_show(struct device *dev,
 					struct device_attribute *attr,
@@ -558,6 +567,26 @@ static int m2_pmu_map_event(struct perf_event *event)
 	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
 }
 
+static int m1_pmu_map_pmuv3_event(unsigned int eventsel)
+{
+	int m1_event = HW_OP_UNSUPPORTED;
+
+	if (eventsel < ARMV8_PMUV3_MAX_COMMON_EVENTS)
+		m1_event = m1_pmu_pmceid_map[eventsel];
+
+	return m1_event == HW_OP_UNSUPPORTED ? -EOPNOTSUPP : m1_event;
+}
+
+static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
+{
+	unsigned int event;
+
+	for (event = 0; event < ARMV8_PMUV3_MAX_COMMON_EVENTS; event++) {
+		if (m1_pmu_map_pmuv3_event(event) >= 0)
+			set_bit(event, pmu->pmceid_bitmap);
+	}
+}
+
 static void m1_pmu_reset(void *info)
 {
 	int i;
@@ -618,6 +647,9 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
+	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+	m1_pmu_init_pmceid(cpu_pmu);
+
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 4b5b83677e3f..35f3778ae20e 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -100,6 +100,7 @@ struct arm_pmu {
 	void		(*stop)(struct arm_pmu *);
 	void		(*reset)(void *);
 	int		(*map_event)(struct perf_event *event);
+	int		(*map_pmuv3_event)(unsigned int eventsel);
 	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
 	bool		secure_access; /* 32-bit ARM only */
 #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
-- 
2.39.5


