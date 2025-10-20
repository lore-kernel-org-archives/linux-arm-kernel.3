Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B42CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lhNOMV03OsN/47rj5ZYLId5vYuMwg5LO2FBbZ5UmtOw=; b=IosR4N/Hae0PKuF4pggNx5UTgc
	IXGXMus/qIlrA8IOW5r3n0SHDapI2vu9GxM1niQI44glRJiZCJ75OH5Ga3Am/3gn7U2k9MX+lWJLH
	Sn9sJw3lXfztdIeu9uuTCt8I+VOJeWuu8zmkMrrK9bwif3WpsKuGSn4Ds7KQ5uxC6cr0iSEaDxGYu
	Ui//Zi4SwxYbNRKk6dmrUKGoQez1LCiI4tm6nE7q9lwg1Cj+HVmTmWknrZH9WjmwvWqWpUJAL0kvV
	aFdnZu2+EhqOLeDMREU652Lpz2EGe16iWeMb+u/SNAXnWEB8f8Ygg6ssPua5cjDdx+PhUzT99Nxur
	v26hFSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoJT-0000000D6wx-1c5Q;
	Mon, 20 Oct 2025 11:44:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoJQ-0000000D6vY-3Y6v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:44:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B36CC1063;
	Mon, 20 Oct 2025 04:44:15 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.37.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D2EAF3F66E;
	Mon, 20 Oct 2025 04:44:22 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH] perf/arm-ni: Add NoC S3 support
Date: Mon, 20 Oct 2025 12:44:19 +0100
Message-Id: <ddb1dbaccce2f092bbfe1029982aad3a81bded71.1760960572.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_044428_963487_0BC3FB50 
X-CRM114-Status: GOOD (  19.41  )
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

NoC S3 and its SI L1 sibling look largely similar to their predecessors,
but add the notion of subfeatures to the discovery process, which we now
use to find the event muxes for each device node. Plus, as ever, more
mildly annoying shuffling around of some of the PMU registers (this time
it's the counters...)

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-ni.c | 92 +++++++++++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 21 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 1615a0564031..aa824abc629e 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -21,6 +21,11 @@
 
 #define NI_CHILD_NODE_INFO	0x004
 #define NI_CHILD_PTR(n)		(0x008 + (n) * 4)
+#define NI_NUM_SUB_FEATURES	0x100
+#define NI_SUB_FEATURE_TYPE(n)	(0x108 + (n) * 8)
+#define NI_SUB_FEATURE_PTR(n)	(0x10c + (n) * 8)
+
+#define NI_SUB_FEATURE_TYPE_FCU	0x2
 
 #define NI700_PMUSELA		0x00c
 
@@ -33,9 +38,10 @@
 #define NI_PIDR2_VERSION	GENMASK(7, 4)
 
 /* PMU node */
-#define NI_PMEVCNTR(n)		(0x008 + (n) * 8)
-#define NI_PMCCNTR_L		0x0f8
-#define NI_PMCCNTR_U		0x0fc
+#define NI700_PMEVCNTR(n)	(0x008 + (n) * 8)
+#define NI700_PMCCNTR_L		0x0f8
+#define NI_PMEVCNTR(n)		(0x200 + (n) * 8)
+#define NI_PMCCNTR_L		0x2f8
 #define NI_PMEVTYPER(n)		(0x400 + (n) * 4)
 #define NI_PMEVTYPER_NODE_TYPE	GENMASK(12, 9)
 #define NI_PMEVTYPER_NODE_ID	GENMASK(8, 0)
@@ -66,6 +72,8 @@
 enum ni_part {
 	PART_NI_700 = 0x43b,
 	PART_NI_710AE = 0x43d,
+	PART_NOC_S3 = 0x43f,
+	PART_SI_L1 = 0x455,
 };
 
 enum ni_node_type {
@@ -79,6 +87,10 @@ enum ni_node_type {
 	NI_HSNI,
 	NI_HMNI,
 	NI_PMNI,
+	NI_TSNI,
+	NI_TMNI,
+	NI_CMNI = 0x0e,
+	NI_MCN = 0x63,
 };
 
 struct arm_ni_node {
@@ -179,6 +191,9 @@ static struct attribute *arm_ni_event_attrs[] = {
 	NI_EVENT_ATTR(hsni, NI_HSNI),
 	NI_EVENT_ATTR(hmni, NI_HMNI),
 	NI_EVENT_ATTR(pmni, NI_PMNI),
+	NI_EVENT_ATTR(tsni, NI_TSNI),
+	NI_EVENT_ATTR(tmni, NI_TMNI),
+	NI_EVENT_ATTR(cmni, NI_CMNI),
 	NULL
 };
 
@@ -332,16 +347,16 @@ static int arm_ni_event_init(struct perf_event *event)
 	return -EINVAL;
 }
 
-static u64 arm_ni_read_ccnt(struct arm_ni_cd *cd)
+static u64 arm_ni_read_ccnt(void __iomem *pmccntr)
 {
 	u64 l, u_old, u_new;
 	int retries = 3; /* 1st time unlucky, 2nd improbable, 3rd just broken */
 
-	u_new = readl_relaxed(cd->pmu_base + NI_PMCCNTR_U);
+	u_new = readl_relaxed(pmccntr + 4);
 	do {
 		u_old = u_new;
-		l = readl_relaxed(cd->pmu_base + NI_PMCCNTR_L);
-		u_new = readl_relaxed(cd->pmu_base + NI_PMCCNTR_U);
+		l = readl_relaxed(pmccntr);
+		u_new = readl_relaxed(pmccntr + 4);
 	} while (u_new != u_old && --retries);
 	WARN_ON(!retries);
 
@@ -350,7 +365,6 @@ static u64 arm_ni_read_ccnt(struct arm_ni_cd *cd)
 
 static void arm_ni_event_read(struct perf_event *event)
 {
-	struct arm_ni_cd *cd = pmu_to_cd(event->pmu);
 	struct hw_perf_event *hw = &event->hw;
 	u64 count, prev;
 	bool ccnt = hw->idx == NI_CCNT_IDX;
@@ -358,9 +372,9 @@ static void arm_ni_event_read(struct perf_event *event)
 	do {
 		prev = local64_read(&hw->prev_count);
 		if (ccnt)
-			count = arm_ni_read_ccnt(cd);
+			count = arm_ni_read_ccnt((void __iomem *)event->hw.event_base);
 		else
-			count = readl_relaxed(cd->pmu_base + NI_PMEVCNTR(hw->idx));
+			count = readl_relaxed((void __iomem *)event->hw.event_base);
 	} while (local64_cmpxchg(&hw->prev_count, prev, count) != prev);
 
 	count -= prev;
@@ -385,16 +399,21 @@ static void arm_ni_event_stop(struct perf_event *event, int flags)
 		arm_ni_event_read(event);
 }
 
-static void arm_ni_init_ccnt(struct arm_ni_cd *cd)
+static void arm_ni_init_ccnt(struct hw_perf_event *hw)
 {
-	local64_set(&cd->ccnt->hw.prev_count, S64_MIN);
-	lo_hi_writeq_relaxed(S64_MIN, cd->pmu_base + NI_PMCCNTR_L);
+	local64_set(&hw->prev_count, S64_MIN);
+	lo_hi_writeq_relaxed(S64_MIN, (void __iomem *)hw->event_base);
 }
 
-static void arm_ni_init_evcnt(struct arm_ni_cd *cd, int idx)
+static void arm_ni_init_evcnt(struct hw_perf_event *hw)
 {
-	local64_set(&cd->evcnt[idx]->hw.prev_count, S32_MIN);
-	writel_relaxed(S32_MIN, cd->pmu_base + NI_PMEVCNTR(idx));
+	local64_set(&hw->prev_count, S32_MIN);
+	writel_relaxed(S32_MIN, (void __iomem *)hw->event_base);
+}
+
+static bool arm_ni_is_7xx(const struct arm_ni *ni)
+{
+	return ni->part == PART_NI_700 || ni->part == PART_NI_710AE;
 }
 
 static int arm_ni_event_add(struct perf_event *event, int flags)
@@ -403,14 +422,17 @@ static int arm_ni_event_add(struct perf_event *event, int flags)
 	struct hw_perf_event *hw = &event->hw;
 	struct arm_ni_unit *unit;
 	enum ni_node_type type = NI_EVENT_TYPE(event);
+	bool is_7xx = arm_ni_is_7xx(cd_to_ni(cd));
 	u32 reg;
 
 	if (type == NI_PMU) {
 		if (cd->ccnt)
 			return -ENOSPC;
 		hw->idx = NI_CCNT_IDX;
+		hw->event_base = (unsigned long)cd->pmu_base +
+				 is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
 		cd->ccnt = event;
-		arm_ni_init_ccnt(cd);
+		arm_ni_init_ccnt(hw);
 	} else {
 		hw->idx = 0;
 		while (cd->evcnt[hw->idx]) {
@@ -420,7 +442,9 @@ static int arm_ni_event_add(struct perf_event *event, int flags)
 		cd->evcnt[hw->idx] = event;
 		unit = (void *)hw->config_base;
 		unit->event[hw->idx] = NI_EVENT_EVENTID(event);
-		arm_ni_init_evcnt(cd, hw->idx);
+		hw->event_base = (unsigned long)cd->pmu_base +
+				 is_7xx ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx);
+		arm_ni_init_evcnt(hw);
 		lo_hi_writeq_relaxed(le64_to_cpu(unit->pmusel), unit->pmusela);
 
 		reg = FIELD_PREP(NI_PMEVTYPER_NODE_TYPE, type) |
@@ -457,7 +481,7 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
 			ret = IRQ_HANDLED;
 			if (!(WARN_ON(!cd->ccnt))) {
 				arm_ni_event_read(cd->ccnt);
-				arm_ni_init_ccnt(cd);
+				arm_ni_init_ccnt(&cd->ccnt->hw);
 			}
 		}
 		for (int i = 0; i < NI_NUM_COUNTERS; i++) {
@@ -466,7 +490,7 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
 			ret = IRQ_HANDLED;
 			if (!(WARN_ON(!cd->evcnt[i]))) {
 				arm_ni_event_read(cd->evcnt[i]);
-				arm_ni_init_evcnt(cd, i);
+				arm_ni_init_evcnt(&cd->evcnt[i]->hw);
 			}
 		}
 		writel_relaxed(reg, cd->pmu_base + NI_PMOVSCLR);
@@ -476,6 +500,25 @@ static irqreturn_t arm_ni_handle_irq(int irq, void *dev_id)
 	}
 }
 
+static void __iomem *arm_ni_get_pmusel(struct arm_ni *ni, void __iomem *unit_base)
+{
+	u32 type, ptr, num;
+
+	if (arm_ni_is_7xx(ni))
+		return unit_base + NI700_PMUSELA;
+
+	num = readl_relaxed(unit_base + NI_NUM_SUB_FEATURES);
+	for (int i = 0; i < num; i++) {
+		type = readl_relaxed(unit_base + NI_SUB_FEATURE_TYPE(i));
+		if (type != NI_SUB_FEATURE_TYPE_FCU)
+			continue;
+		ptr = readl_relaxed(unit_base + NI_SUB_FEATURE_PTR(i));
+		return ni->base + ptr;
+	}
+	/* Should be impossible */
+	return NULL;
+}
+
 static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_start)
 {
 	struct arm_ni_cd *cd = ni->cds + node->id;
@@ -512,13 +555,18 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 		case NI_HSNI:
 		case NI_HMNI:
 		case NI_PMNI:
-			unit->pmusela = unit_base + NI700_PMUSELA;
+		case NI_TSNI:
+		case NI_TMNI:
+		case NI_CMNI:
+			unit->pmusela = arm_ni_get_pmusel(ni, unit_base);
 			writel_relaxed(1, unit->pmusela);
 			if (readl_relaxed(unit->pmusela) != 1)
 				dev_info(ni->dev, "No access to node 0x%04x%04x\n", unit->id, unit->type);
 			else
 				unit->ns = true;
 			break;
+		case NI_MCN:
+			break;
 		default:
 			/*
 			 * e.g. FMU - thankfully bits 3:2 of FMU_ERR_FR0 are RES0 so
@@ -649,6 +697,8 @@ static int arm_ni_probe(struct platform_device *pdev)
 	switch (part) {
 	case PART_NI_700:
 	case PART_NI_710AE:
+	case PART_NOC_S3:
+	case PART_SI_L1:
 		break;
 	default:
 		dev_WARN(&pdev->dev, "Unknown part number: 0x%03x, this may go badly\n", part);
-- 
2.34.1


