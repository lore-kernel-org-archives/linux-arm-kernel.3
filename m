Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D1CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tf4LwPgibYKs02IcJSpGybbfm/OykGV9kgZwfDTVWQ=; b=fozmO5APk+Sobs3rhptKG0pd+A
	eCWGVJM8gEfzjxJpWN8j+WbvzEdiv4QEnEX7mRXTH1J89ElmGkxrkYVnFxBTTAp2c/4CNXK1QmFPf
	q/3FBBE6ctebRHEB8MyAMoWMFT0PvVioaWN4NH1QxdoYf0TaddCUF6ZitPlb0oFX49cqi6Ev0hAVV
	6rvprINhlyf5how0wNNXjX0c/wLJo2H60B32h6BsU0fICqKWUllkJEJXk2SMrKmlEkRl9fXRiA5Il
	3DyHo90U1VCnay2ag9fAfF3GoeTF84o8HFObljB1gyrXNcNYFMmmmEQVTuYbQxno+sZjfgMIVQxXI
	lBrezz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryPc-00000005gxR-0Tox;
	Fri, 29 Aug 2025 12:41:00 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw7v-00000005HS1-3WnL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:14:41 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cCvDz2tydz2VRWP;
	Fri, 29 Aug 2025 18:11:31 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 09C1C1A0188;
	Fri, 29 Aug 2025 18:14:32 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 29 Aug 2025 18:14:31 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 29 Aug 2025 18:14:31 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <hejunhao3@h-partners.com>, <linuxarm@huawei.com>,
	<fanghao11@huawei.com>
Subject: [PATCH v3 6/9] drivers/perf: hisi: Refactor the event configuration of L3C PMU
Date: Fri, 29 Aug 2025 18:14:24 +0800
Message-ID: <20250829101427.2557899-7-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250829101427.2557899-1-wangyushan12@huawei.com>
References: <20250829101427.2557899-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031436_283292_53544AAF 
X-CRM114-Status: GOOD (  15.66  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

The event register is configured using hisi_pmu::base directly since
only one address space is supported for L3C PMU. We need to extend if
events configuration locates in different address space. In order to
make preparation for such hardware, extract the event register
configuration to separate function using hw_perf_event::event_base as
each event's base address.  Implement a private
hisi_uncore_ops::get_event_idx() callback for initialize the event_base
besides get the hardware index.

No functional changes intended.

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
---
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 129 ++++++++++++-------
 1 file changed, 84 insertions(+), 45 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
index 39444f11cbad..7928b9bb3e7e 100644
--- a/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c
@@ -60,51 +60,87 @@ HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_cfg, config1, 15, 11);
 HISI_PMU_EVENT_ATTR_EXTRACTOR(datasrc_skt, config1, 16, 16);
 HISI_PMU_EVENT_ATTR_EXTRACTOR(tt_core, config2, 15, 0);
 
-static void hisi_l3c_pmu_config_req_tracetag(struct perf_event *event)
+static int hisi_l3c_pmu_get_event_idx(struct perf_event *event)
 {
 	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
+	unsigned long *used_mask = l3c_pmu->pmu_events.used_mask;
+	u32 num_counters = l3c_pmu->num_counters;
+	int idx;
+
+	idx = find_first_zero_bit(used_mask, num_counters);
+	if (idx == num_counters)
+		return -EAGAIN;
+
+	set_bit(idx, used_mask);
+	event->hw.event_base = (unsigned long)l3c_pmu->base;
+
+	return idx;
+}
+
+static u32 hisi_l3c_pmu_event_readl(struct hw_perf_event *hwc, u32 reg)
+{
+	return readl((void __iomem *)hwc->event_base + reg);
+}
+
+static void hisi_l3c_pmu_event_writel(struct hw_perf_event *hwc, u32 reg, u32 val)
+{
+	writel(val, (void __iomem *)hwc->event_base + reg);
+}
+
+static u64 hisi_l3c_pmu_event_readq(struct hw_perf_event *hwc, u32 reg)
+{
+	return readq((void __iomem *)hwc->event_base + reg);
+}
+
+static void hisi_l3c_pmu_event_writeq(struct hw_perf_event *hwc, u32 reg, u64 val)
+{
+	writeq(val, (void __iomem *)hwc->event_base + reg);
+}
+
+static void hisi_l3c_pmu_config_req_tracetag(struct perf_event *event)
+{
+	struct hw_perf_event *hwc = &event->hw;
 	u32 tt_req = hisi_get_tt_req(event);
 
 	if (tt_req) {
 		u32 val;
 
 		/* Set request-type for tracetag */
-		val = readl(l3c_pmu->base + L3C_TRACETAG_CTRL);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_TRACETAG_CTRL);
 		val |= tt_req << L3C_TRACETAG_REQ_SHIFT;
 		val |= L3C_TRACETAG_REQ_EN;
-		writel(val, l3c_pmu->base + L3C_TRACETAG_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_TRACETAG_CTRL, val);
 
 		/* Enable request-tracetag statistics */
-		val = readl(l3c_pmu->base + L3C_PERF_CTRL);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_PERF_CTRL);
 		val |= L3C_TRACETAG_EN;
-		writel(val, l3c_pmu->base + L3C_PERF_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_PERF_CTRL, val);
 	}
 }
 
 static void hisi_l3c_pmu_clear_req_tracetag(struct perf_event *event)
 {
-	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
 	u32 tt_req = hisi_get_tt_req(event);
 
 	if (tt_req) {
 		u32 val;
 
 		/* Clear request-type */
-		val = readl(l3c_pmu->base + L3C_TRACETAG_CTRL);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_TRACETAG_CTRL);
 		val &= ~(tt_req << L3C_TRACETAG_REQ_SHIFT);
 		val &= ~L3C_TRACETAG_REQ_EN;
-		writel(val, l3c_pmu->base + L3C_TRACETAG_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_TRACETAG_CTRL, val);
 
 		/* Disable request-tracetag statistics */
-		val = readl(l3c_pmu->base + L3C_PERF_CTRL);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_PERF_CTRL);
 		val &= ~L3C_TRACETAG_EN;
-		writel(val, l3c_pmu->base + L3C_PERF_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_PERF_CTRL, val);
 	}
 }
 
 static void hisi_l3c_pmu_write_ds(struct perf_event *event, u32 ds_cfg)
 {
-	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 	u32 reg, reg_idx, shift, val;
 	int idx = hwc->idx;
@@ -120,15 +156,15 @@ static void hisi_l3c_pmu_write_ds(struct perf_event *event, u32 ds_cfg)
 	reg_idx = idx % 4;
 	shift = 8 * reg_idx;
 
-	val = readl(l3c_pmu->base + reg);
+	val = hisi_l3c_pmu_event_readl(hwc, reg);
 	val &= ~(L3C_DATSRC_MASK << shift);
 	val |= ds_cfg << shift;
-	writel(val, l3c_pmu->base + reg);
+	hisi_l3c_pmu_event_writel(hwc, reg, val);
 }
 
 static void hisi_l3c_pmu_config_ds(struct perf_event *event)
 {
-	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
 	u32 ds_cfg = hisi_get_datasrc_cfg(event);
 	u32 ds_skt = hisi_get_datasrc_skt(event);
 
@@ -138,15 +174,15 @@ static void hisi_l3c_pmu_config_ds(struct perf_event *event)
 	if (ds_skt) {
 		u32 val;
 
-		val = readl(l3c_pmu->base + L3C_DATSRC_CTRL);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_DATSRC_CTRL);
 		val |= L3C_DATSRC_SKT_EN;
-		writel(val, l3c_pmu->base + L3C_DATSRC_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_DATSRC_CTRL, val);
 	}
 }
 
 static void hisi_l3c_pmu_clear_ds(struct perf_event *event)
 {
-	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
 	u32 ds_cfg = hisi_get_datasrc_cfg(event);
 	u32 ds_skt = hisi_get_datasrc_skt(event);
 
@@ -156,51 +192,51 @@ static void hisi_l3c_pmu_clear_ds(struct perf_event *event)
 	if (ds_skt) {
 		u32 val;
 
-		val = readl(l3c_pmu->base + L3C_DATSRC_CTRL);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_DATSRC_CTRL);
 		val &= ~L3C_DATSRC_SKT_EN;
-		writel(val, l3c_pmu->base + L3C_DATSRC_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_DATSRC_CTRL, val);
 	}
 }
 
 static void hisi_l3c_pmu_config_core_tracetag(struct perf_event *event)
 {
-	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
 	u32 core = hisi_get_tt_core(event);
 
 	if (core) {
 		u32 val;
 
 		/* Config and enable core information */
-		writel(core, l3c_pmu->base + L3C_CORE_CTRL);
-		val = readl(l3c_pmu->base + L3C_PERF_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_CORE_CTRL, core);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_PERF_CTRL);
 		val |= L3C_CORE_EN;
-		writel(val, l3c_pmu->base + L3C_PERF_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_PERF_CTRL, val);
 
 		/* Enable core-tracetag statistics */
-		val = readl(l3c_pmu->base + L3C_TRACETAG_CTRL);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_TRACETAG_CTRL);
 		val |= L3C_TRACETAG_CORE_EN;
-		writel(val, l3c_pmu->base + L3C_TRACETAG_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_TRACETAG_CTRL, val);
 	}
 }
 
 static void hisi_l3c_pmu_clear_core_tracetag(struct perf_event *event)
 {
-	struct hisi_pmu *l3c_pmu = to_hisi_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
 	u32 core = hisi_get_tt_core(event);
 
 	if (core) {
 		u32 val;
 
 		/* Clear core information */
-		writel(L3C_COER_NONE, l3c_pmu->base + L3C_CORE_CTRL);
-		val = readl(l3c_pmu->base + L3C_PERF_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_CORE_CTRL, L3C_COER_NONE);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_PERF_CTRL);
 		val &= ~L3C_CORE_EN;
-		writel(val, l3c_pmu->base + L3C_PERF_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_PERF_CTRL, val);
 
 		/* Disable core-tracetag statistics */
-		val = readl(l3c_pmu->base + L3C_TRACETAG_CTRL);
+		val = hisi_l3c_pmu_event_readl(hwc, L3C_TRACETAG_CTRL);
 		val &= ~L3C_TRACETAG_CORE_EN;
-		writel(val, l3c_pmu->base + L3C_TRACETAG_CTRL);
+		hisi_l3c_pmu_event_writel(hwc, L3C_TRACETAG_CTRL, val);
 	}
 }
 
@@ -239,18 +275,19 @@ static u32 hisi_l3c_pmu_get_counter_offset(int cntr_idx)
 static u64 hisi_l3c_pmu_read_counter(struct hisi_pmu *l3c_pmu,
 				     struct hw_perf_event *hwc)
 {
-	return readq(l3c_pmu->base + hisi_l3c_pmu_get_counter_offset(hwc->idx));
+	return hisi_l3c_pmu_event_readq(hwc, hisi_l3c_pmu_get_counter_offset(hwc->idx));
 }
 
 static void hisi_l3c_pmu_write_counter(struct hisi_pmu *l3c_pmu,
 				       struct hw_perf_event *hwc, u64 val)
 {
-	writeq(val, l3c_pmu->base + hisi_l3c_pmu_get_counter_offset(hwc->idx));
+	hisi_l3c_pmu_event_writeq(hwc, hisi_l3c_pmu_get_counter_offset(hwc->idx), val);
 }
 
 static void hisi_l3c_pmu_write_evtype(struct hisi_pmu *l3c_pmu, int idx,
 				      u32 type)
 {
+	struct hw_perf_event *hwc = &l3c_pmu->pmu_events.hw_events[idx]->hw;
 	u32 reg, reg_idx, shift, val;
 
 	/*
@@ -265,10 +302,10 @@ static void hisi_l3c_pmu_write_evtype(struct hisi_pmu *l3c_pmu, int idx,
 	shift = 8 * reg_idx;
 
 	/* Write event code to L3C_EVENT_TYPEx Register */
-	val = readl(l3c_pmu->base + reg);
+	val = hisi_l3c_pmu_event_readl(hwc, reg);
 	val &= ~(L3C_EVTYPE_NONE << shift);
 	val |= (type << shift);
-	writel(val, l3c_pmu->base + reg);
+	hisi_l3c_pmu_event_writel(hwc, reg, val);
 }
 
 static void hisi_l3c_pmu_start_counters(struct hisi_pmu *l3c_pmu)
@@ -303,9 +340,9 @@ static void hisi_l3c_pmu_enable_counter(struct hisi_pmu *l3c_pmu,
 	u32 val;
 
 	/* Enable counter index in L3C_EVENT_CTRL register */
-	val = readl(l3c_pmu->base + L3C_EVENT_CTRL);
+	val = hisi_l3c_pmu_event_readl(hwc, L3C_EVENT_CTRL);
 	val |= (1 << hwc->idx);
-	writel(val, l3c_pmu->base + L3C_EVENT_CTRL);
+	hisi_l3c_pmu_event_writel(hwc, L3C_EVENT_CTRL, val);
 }
 
 static void hisi_l3c_pmu_disable_counter(struct hisi_pmu *l3c_pmu,
@@ -314,9 +351,9 @@ static void hisi_l3c_pmu_disable_counter(struct hisi_pmu *l3c_pmu,
 	u32 val;
 
 	/* Clear counter index in L3C_EVENT_CTRL register */
-	val = readl(l3c_pmu->base + L3C_EVENT_CTRL);
+	val = hisi_l3c_pmu_event_readl(hwc, L3C_EVENT_CTRL);
 	val &= ~(1 << hwc->idx);
-	writel(val, l3c_pmu->base + L3C_EVENT_CTRL);
+	hisi_l3c_pmu_event_writel(hwc, L3C_EVENT_CTRL, val);
 }
 
 static void hisi_l3c_pmu_enable_counter_int(struct hisi_pmu *l3c_pmu,
@@ -324,10 +361,10 @@ static void hisi_l3c_pmu_enable_counter_int(struct hisi_pmu *l3c_pmu,
 {
 	u32 val;
 
-	val = readl(l3c_pmu->base + L3C_INT_MASK);
+	val = hisi_l3c_pmu_event_readl(hwc, L3C_INT_MASK);
 	/* Write 0 to enable interrupt */
 	val &= ~(1 << hwc->idx);
-	writel(val, l3c_pmu->base + L3C_INT_MASK);
+	hisi_l3c_pmu_event_writel(hwc, L3C_INT_MASK, val);
 }
 
 static void hisi_l3c_pmu_disable_counter_int(struct hisi_pmu *l3c_pmu,
@@ -335,10 +372,10 @@ static void hisi_l3c_pmu_disable_counter_int(struct hisi_pmu *l3c_pmu,
 {
 	u32 val;
 
-	val = readl(l3c_pmu->base + L3C_INT_MASK);
+	val = hisi_l3c_pmu_event_readl(hwc, L3C_INT_MASK);
 	/* Write 1 to mask interrupt */
 	val |= (1 << hwc->idx);
-	writel(val, l3c_pmu->base + L3C_INT_MASK);
+	hisi_l3c_pmu_event_writel(hwc, L3C_INT_MASK, val);
 }
 
 static u32 hisi_l3c_pmu_get_int_status(struct hisi_pmu *l3c_pmu)
@@ -348,7 +385,9 @@ static u32 hisi_l3c_pmu_get_int_status(struct hisi_pmu *l3c_pmu)
 
 static void hisi_l3c_pmu_clear_int_status(struct hisi_pmu *l3c_pmu, int idx)
 {
-	writel(1 << idx, l3c_pmu->base + L3C_INT_CLEAR);
+	struct hw_perf_event *hwc = &l3c_pmu->pmu_events.hw_events[idx]->hw;
+
+	hisi_l3c_pmu_event_writel(hwc, L3C_INT_CLEAR, 1 << idx);
 }
 
 static int hisi_l3c_pmu_init_data(struct platform_device *pdev,
@@ -474,7 +513,7 @@ static const struct hisi_pmu_dev_info hisi_l3c_pmu_v2 = {
 
 static const struct hisi_uncore_ops hisi_uncore_l3c_ops = {
 	.write_evtype		= hisi_l3c_pmu_write_evtype,
-	.get_event_idx		= hisi_uncore_pmu_get_event_idx,
+	.get_event_idx		= hisi_l3c_pmu_get_event_idx,
 	.start_counters		= hisi_l3c_pmu_start_counters,
 	.stop_counters		= hisi_l3c_pmu_stop_counters,
 	.enable_counter		= hisi_l3c_pmu_enable_counter,
-- 
2.33.0


