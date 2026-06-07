Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E93ACD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssTe2clp5Y5xdFQLCC1OcAD14r5D6gnoYykrOZlELeQ=; b=Xf6lss5ZpIj8YHCgDLC32DPNW2
	NJ591BVq6bDdV5wtzbaE6aGqfe0jjg1jhqeL2or5BdR9h78B4yyJJQd4MKzKBIM4CdmLsdgkl7f0v
	IZNZWJykRI/DH8aUe7Gdn1JDOYoTkoZH9+7KiGqWermYuq9G033l4FRqaqTCc49RNOsAx3FNevgO3
	lYb4BQRvE6pPfd7aCgV6lpfqtufuZeXtw3ratf8cwloWDCNyHyaGbpuIIEZZxCX+9UEm81eDHO0Yw
	yQNixj4HZt4KnkWU6ixkHDEMmbYVrhFDiz68FH9zXrYJHpN8hDZ+qYdTeJHTJeUNSb9MqfxrLkMWH
	GhTOgIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCyJ-00000002FV9-18uF;
	Sun, 07 Jun 2026 12:51:23 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCyH-00000002FU7-1V61
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 12:51:22 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1cqa3698744;
	Sun, 7 Jun 2026 05:51:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=ssTe2clp5Y5xdFQLCC1OcAD14
	r5D6gnoYykrOZlELeQ=; b=UAG6KMYoSQO1FgJzg63uIj4jkPHBlFcJDILMi0m73
	rKPtyfeDGV25U1jZuC/Dj8SPpwo/drSHkfG1ClRXwDwIedN5ki2aKriZTfLeiWYZ
	jVBkmBKbyUUuAd4dOxQWNBcuXO5/kDrKnCM2yCXiAc/NKmfaEozqaBl2OT5ETTpc
	lBumouTIupBgBDwFOeCuKvCUsd+7yztWCPGg5m1cWpQ029XhpqKcPWd6xombOTiY
	HSw3370lO50WYIW/+7f+XAiWxAoGiE0ybLq/ajeLb8BUGmCR3NNiSBmm6eZlPtCX
	93J4WqiSagDzDmV6m/J0ScVjTW5U9ioSkwb78j4olDhUQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4emk2ek3f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jun 2026 05:51:10 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 7 Jun 2026 05:51:09 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Sun, 7 Jun 2026 05:51:09 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 667C83F70C5;
	Sun,  7 Jun 2026 05:51:06 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>,
        <gakula@marvell.com>
Subject: [PATCH 1/3] perf: marvell: Add MPAM partid filtering to CN10K TAD PMU
Date: Sun, 7 Jun 2026 18:20:59 +0530
Message-ID: <20260607125101.17778-2-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260607125101.17778-1-gakula@marvell.com>
References: <20260607125101.17778-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEyOCBTYWx0ZWRfX6eNAwHk93rdF
 i8cq7/S8JYDGwb9ONmScxTJpC+z+IfJvBjnNOJCTQmkHze2TvIe2cStrbeveRv5zN3VB11rARvO
 kkp5m5MrkeC8C5y7nevf1KPE9CxmO7MMFxLP49gkD39d8VbQ/CEbPYZI9rvm5qrrTcJIYDNwSq+
 +hwI7zoVd/NzxBkTXlcwdufJtsz0jtZMlrMWgxaeMpb2HOwEcWV7p6+B0rTILxIVJX2m7xkGrsy
 PPXBZFHMxilC6U51TTs2Apg3iAfsQUmDRG6uraf56uc7cjD/U6Fxhyow8TdxjKOXus8hSxEpsiW
 psRdD+waCvlA6tUvpdmZ18rqOy9Vqz+2xCG7mNgOpFY0VREVRmK93odEo0kE+C/Ve6sl8aGzOK6
 JeiQFzzkkvO5ic98rFjVWj/AcRmmzLb1suohDzoLgs1ikkPcq5tRs5oxns7C/kc++X/AzvSVECh
 g9ds1LqTc156oKMx5bQ==
X-Proofpoint-GUID: 1TONG1-TxxNmAsaFbKYz2PD--sDYwG_a
X-Authority-Analysis: v=2.4 cv=bJUm5v+Z c=1 sm=1 tr=0 ts=6a25693e cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=QXcCYyLzdtTjyudCfB6f:22 a=M5GUcnROAAAA:8 a=bTpCh63V7_7WPrzvYe0A:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: 1TONG1-TxxNmAsaFbKYz2PD--sDYwG_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_055121_518942_965F6312 
X-CRM114-Status: GOOD (  24.42  )
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

From: Tanmay Jagdale <tanmay@marvell.com>

The TAD PMU exposes counters that can be filtered by MPAM partition id
for a subset of allocation and hit events.

Add a 16-bit partid format attribute (config1) and route counter
programming through variant-specific ops so CN10K keeps MPAM-capable
programming while Odyssey keeps the reduced event set without
advertising partid in sysfs.

Example:
  perf stat -e tad/tad_alloc_any,partid=0x12/ -- <program>

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---
 drivers/perf/marvell_cn10k_tad_pmu.c | 151 ++++++++++++++++++++-------
 1 file changed, 112 insertions(+), 39 deletions(-)

diff --git a/drivers/perf/marvell_cn10k_tad_pmu.c b/drivers/perf/marvell_cn10k_tad_pmu.c
index 51ccb0befa05..7a3b659c999a 100644
--- a/drivers/perf/marvell_cn10k_tad_pmu.c
+++ b/drivers/perf/marvell_cn10k_tad_pmu.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "tad_pmu: " fmt
 
 #include <linux/io.h>
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/cpuhotplug.h>
@@ -14,11 +15,13 @@
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
 
-#define TAD_PFC_OFFSET		0x800
-#define TAD_PFC(counter)	(TAD_PFC_OFFSET | (counter << 3))
 #define TAD_PRF_OFFSET		0x900
-#define TAD_PRF(counter)	(TAD_PRF_OFFSET | (counter << 3))
+#define TAD_PFC_OFFSET		0x800
+#define TAD_PFC(base, counter)	((base) | ((u64)(counter) << 3))
+#define TAD_PRF(base, counter)	((base) | ((u64)(counter) << 3))
 #define TAD_PRF_CNTSEL_MASK	0xFF
+#define TAD_PRF_MATCH_PARTID	BIT(8)
+#define TAD_PRF_PARTID_NS	BIT(10)
 #define TAD_MAX_COUNTERS	8
 
 #define to_tad_pmu(p) (container_of(p, struct tad_pmu, pmu))
@@ -27,30 +30,92 @@ struct tad_region {
 	void __iomem	*base;
 };
 
+enum mrvl_tad_pmu_version {
+	TAD_PMU_V1 = 1,
+	TAD_PMU_V2,
+};
+
+struct tad_pmu_data {
+	int id;
+	u64 tad_prf_offset;
+	u64 tad_pfc_offset;
+};
+
 struct tad_pmu {
 	struct pmu pmu;
 	struct tad_region *regions;
 	u32 region_cnt;
 	unsigned int cpu;
+	const struct tad_pmu_ops *ops;
+	const struct tad_pmu_data *pdata;
 	struct hlist_node node;
 	struct perf_event *events[TAD_MAX_COUNTERS];
 	DECLARE_BITMAP(counters_map, TAD_MAX_COUNTERS);
 };
 
-enum mrvl_tad_pmu_version {
-	TAD_PMU_V1 = 1,
-	TAD_PMU_V2,
-};
-
-struct tad_pmu_data {
-	int id;
+struct tad_pmu_ops {
+	void (*start_counter)(struct tad_pmu *pmu, struct perf_event *event);
 };
 
 static int tad_pmu_cpuhp_state;
 
+static void tad_pmu_start_counter(struct tad_pmu *pmu,
+				  struct perf_event *event)
+{
+	const struct tad_pmu_data *pdata = pmu->pdata;
+	struct hw_perf_event *hwc = &event->hw;
+	u32 event_idx = event->attr.config;
+	u32 counter_idx = hwc->idx;
+	u64 partid_filter = 0;
+	u64 reg_val;
+	u32 partid;
+	int i;
+
+	partid = (u32)(event->attr.config1 & GENMASK(15, 0));
+
+	for (i = 0; i < pmu->region_cnt; i++)
+		writeq_relaxed(0, pmu->regions[i].base +
+			       TAD_PFC(pdata->tad_pfc_offset, counter_idx));
+
+	if (partid && event_idx > 0x19 && event_idx < 0x21) {
+		partid_filter = TAD_PRF_MATCH_PARTID | TAD_PRF_PARTID_NS |
+				((u64)partid << 11);
+	}
+
+
+	for (i = 0; i < pmu->region_cnt; i++) {
+		reg_val = event_idx & 0xFF;
+		reg_val |= partid_filter;
+		writeq_relaxed(reg_val, pmu->regions[i].base +
+			       TAD_PRF(pdata->tad_prf_offset, counter_idx));
+	}
+}
+
+static void tad_pmu_v2_start_counter(struct tad_pmu *pmu,
+				     struct perf_event *event)
+{
+	const struct tad_pmu_data *pdata = pmu->pdata;
+	struct hw_perf_event *hwc = &event->hw;
+	u32 event_idx = event->attr.config;
+	u32 counter_idx = hwc->idx;
+	u64 reg_val;
+	int i;
+
+	for (i = 0; i < pmu->region_cnt; i++)
+		writeq_relaxed(0, pmu->regions[i].base +
+			       TAD_PFC(pdata->tad_pfc_offset, counter_idx));
+
+	for (i = 0; i < pmu->region_cnt; i++) {
+		reg_val = event_idx & 0xFF;
+		writeq_relaxed(reg_val, pmu->regions[i].base +
+			       TAD_PRF(pdata->tad_prf_offset, counter_idx));
+	}
+}
+
 static void tad_pmu_event_counter_read(struct perf_event *event)
 {
 	struct tad_pmu *tad_pmu = to_tad_pmu(event->pmu);
+	const struct tad_pmu_data *pdata = tad_pmu->pdata;
 	struct hw_perf_event *hwc = &event->hw;
 	u32 counter_idx = hwc->idx;
 	u64 prev, new;
@@ -60,7 +125,7 @@ static void tad_pmu_event_counter_read(struct perf_event *event)
 		prev = local64_read(&hwc->prev_count);
 		for (i = 0, new = 0; i < tad_pmu->region_cnt; i++)
 			new += readq(tad_pmu->regions[i].base +
-				     TAD_PFC(counter_idx));
+				     TAD_PFC(pdata->tad_pfc_offset, counter_idx));
 	} while (local64_cmpxchg(&hwc->prev_count, prev, new) != prev);
 
 	local64_add(new - prev, &event->count);
@@ -69,16 +134,14 @@ static void tad_pmu_event_counter_read(struct perf_event *event)
 static void tad_pmu_event_counter_stop(struct perf_event *event, int flags)
 {
 	struct tad_pmu *tad_pmu = to_tad_pmu(event->pmu);
+	const struct tad_pmu_data *pdata = tad_pmu->pdata;
 	struct hw_perf_event *hwc = &event->hw;
 	u32 counter_idx = hwc->idx;
 	int i;
 
-	/* TAD()_PFC() stop counting on the write
-	 * which sets TAD()_PRF()[CNTSEL] == 0
-	 */
 	for (i = 0; i < tad_pmu->region_cnt; i++) {
 		writeq_relaxed(0, tad_pmu->regions[i].base +
-			       TAD_PRF(counter_idx));
+			       TAD_PRF(pdata->tad_prf_offset, counter_idx));
 	}
 
 	tad_pmu_event_counter_read(event);
@@ -89,26 +152,10 @@ static void tad_pmu_event_counter_start(struct perf_event *event, int flags)
 {
 	struct tad_pmu *tad_pmu = to_tad_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
-	u32 event_idx = event->attr.config;
-	u32 counter_idx = hwc->idx;
-	u64 reg_val;
-	int i;
 
 	hwc->state = 0;
 
-	/* Typically TAD_PFC() are zeroed to start counting */
-	for (i = 0; i < tad_pmu->region_cnt; i++)
-		writeq_relaxed(0, tad_pmu->regions[i].base +
-			       TAD_PFC(counter_idx));
-
-	/* TAD()_PFC() start counting on the write
-	 * which sets TAD()_PRF()[CNTSEL] != 0
-	 */
-	for (i = 0; i < tad_pmu->region_cnt; i++) {
-		reg_val = event_idx & 0xFF;
-		writeq_relaxed(reg_val,	tad_pmu->regions[i].base +
-			       TAD_PRF(counter_idx));
-	}
+	tad_pmu->ops->start_counter(tad_pmu, event);
 }
 
 static void tad_pmu_event_counter_del(struct perf_event *event, int flags)
@@ -128,7 +175,6 @@ static int tad_pmu_event_counter_add(struct perf_event *event, int flags)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx;
 
-	/* Get a free counter for this event */
 	idx = find_first_zero_bit(tad_pmu->counters_map, TAD_MAX_COUNTERS);
 	if (idx == TAD_MAX_COUNTERS)
 		return -EAGAIN;
@@ -232,7 +278,7 @@ static struct attribute *ody_tad_pmu_event_attrs[] = {
 	TAD_PMU_EVENT_ATTR(tad_hit_ltg, 0x1e),
 	TAD_PMU_EVENT_ATTR(tad_hit_any, 0x1f),
 	TAD_PMU_EVENT_ATTR(tad_tag_rd, 0x20),
-	TAD_PMU_EVENT_ATTR(tad_tot_cycle, 0xFF),
+	TAD_PMU_EVENT_ATTR(tad_tot_cycle, 0xff),
 	NULL
 };
 
@@ -242,9 +288,11 @@ static const struct attribute_group ody_tad_pmu_events_attr_group = {
 };
 
 PMU_FORMAT_ATTR(event, "config:0-7");
+PMU_FORMAT_ATTR(partid, "config1:0-15");
 
 static struct attribute *tad_pmu_format_attrs[] = {
 	&format_attr_event.attr,
+	&format_attr_partid.attr,
 	NULL
 };
 
@@ -253,6 +301,16 @@ static struct attribute_group tad_pmu_format_attr_group = {
 	.attrs = tad_pmu_format_attrs,
 };
 
+static struct attribute *ody_tad_pmu_format_attrs[] = {
+	&format_attr_event.attr,
+	NULL
+};
+
+static struct attribute_group ody_tad_pmu_format_attr_group = {
+	.name = "format",
+	.attrs = ody_tad_pmu_format_attrs,
+};
+
 static ssize_t tad_pmu_cpumask_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -281,11 +339,19 @@ static const struct attribute_group *tad_pmu_attr_groups[] = {
 
 static const struct attribute_group *ody_tad_pmu_attr_groups[] = {
 	&ody_tad_pmu_events_attr_group,
-	&tad_pmu_format_attr_group,
+	&ody_tad_pmu_format_attr_group,
 	&tad_pmu_cpumask_attr_group,
 	NULL
 };
 
+static const struct tad_pmu_ops tad_pmu_ops = {
+	.start_counter = tad_pmu_start_counter,
+};
+
+static const struct tad_pmu_ops tad_pmu_v2_ops = {
+	.start_counter = tad_pmu_v2_start_counter,
+};
+
 static int tad_pmu_probe(struct platform_device *pdev)
 {
 	const struct tad_pmu_data *dev_data;
@@ -312,6 +378,7 @@ static int tad_pmu_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	version = dev_data->id;
+	tad_pmu->pdata = dev_data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -344,7 +411,6 @@ static int tad_pmu_probe(struct platform_device *pdev)
 	if (!regions)
 		return -ENOMEM;
 
-	/* ioremap the distributed TAD pmu regions */
 	for (i = 0; i < tad_cnt && res->start < res->end; i++) {
 		regions[i].base = devm_ioremap(&pdev->dev,
 					       res->start,
@@ -374,14 +440,16 @@ static int tad_pmu_probe(struct platform_device *pdev)
 		.read		= tad_pmu_event_counter_read,
 	};
 
-	if (version == TAD_PMU_V1)
+	if (version == TAD_PMU_V1) {
 		tad_pmu->pmu.attr_groups = tad_pmu_attr_groups;
-	else
+		tad_pmu->ops		 = &tad_pmu_ops;
+	} else {
 		tad_pmu->pmu.attr_groups = ody_tad_pmu_attr_groups;
+		tad_pmu->ops		 = &tad_pmu_v2_ops;
+	}
 
 	tad_pmu->cpu = raw_smp_processor_id();
 
-	/* Register pmu instance for cpu hotplug */
 	ret = cpuhp_state_add_instance_nocalls(tad_pmu_cpuhp_state,
 					       &tad_pmu->node);
 	if (ret) {
@@ -410,12 +478,17 @@ static void tad_pmu_remove(struct platform_device *pdev)
 #if defined(CONFIG_OF) || defined(CONFIG_ACPI)
 static const struct tad_pmu_data tad_pmu_data = {
 	.id   = TAD_PMU_V1,
+	.tad_prf_offset = TAD_PRF_OFFSET,
+	.tad_pfc_offset = TAD_PFC_OFFSET,
 };
+
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct tad_pmu_data tad_pmu_v2_data = {
 	.id   = TAD_PMU_V2,
+	.tad_prf_offset = TAD_PRF_OFFSET,
+	.tad_pfc_offset = TAD_PFC_OFFSET,
 };
 #endif
 
-- 
2.25.1


