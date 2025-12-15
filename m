Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E089D5B174
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BzVHZ5UzwtJKFk0YsqAhN5NuXK4u9MPaOYkFOIEvZ4=; b=JcmH/dnzL7P9JoM8N2nP7+mEXp
	EH3VFzOHXjd6rU4w9W4ijPjVvjRU5or7iq/EW8zO2b3kHMx/eICSGMQI8uLqLRbeG44WV+timf+Af
	Qt8aNprD5FhyICrzjfrMdhQFOLj7MXcq8Jxz4GgwRISZUD/e4+C8E0fvinDIIWUGPcKmr1FTzEK8q
	E1VURquAzKdwVAwmKX4SGXwlqvCbX7CuLOMnlYhaBXWIrYcRFjDa5gUisZnnLKQ6Z0TqwEo+r3Oih
	Q+xwtecQiU+5q/PamvVS4PZAVxXdXXlnlV62PZLuea6OVWwHVoXsCs52ofGi34piiTc3AmW5P60DV
	GNAMDRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8GJ-00000003fMy-2ygk;
	Mon, 15 Dec 2025 13:05:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8GG-00000003fL2-0Uc9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:05:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88B01FEC;
	Mon, 15 Dec 2025 05:05:01 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B329F3F73B;
	Mon, 15 Dec 2025 05:05:07 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 1/3] perf/arm_dsu: Support DSU-110
Date: Mon, 15 Dec 2025 13:04:58 +0000
Message-Id: <5aa884a673f7a53f4793176662e64e4851e394d8.1765802897.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1765802897.git.robin.murphy@arm.com>
References: <cover.1765802897.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_050512_288974_9292BFB6 
X-CRM114-Status: GOOD (  12.73  )
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

DSU-110 sneakily made all the event counters 64-bit, perhaps related
to no longer having AArch32 EL1 to worry about. While the DSU version
itself is not easily discoverable, the size of a counter certainly is.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_dsu_pmu.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index cb4fb59fe04b..8663721ee018 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -66,13 +66,6 @@
  */
 #define DSU_PMU_IDX_CYCLE_COUNTER	31
 
-/* All event counters are 32bit, with a 64bit Cycle counter */
-#define DSU_PMU_COUNTER_WIDTH(idx)	\
-	(((idx) == DSU_PMU_IDX_CYCLE_COUNTER) ? 64 : 32)
-
-#define DSU_PMU_COUNTER_MASK(idx)	\
-	GENMASK_ULL((DSU_PMU_COUNTER_WIDTH((idx)) - 1), 0)
-
 #define DSU_EXT_ATTR(_name, _func, _config)		\
 	(&((struct dev_ext_attribute[]) {				\
 		{							\
@@ -107,6 +100,7 @@ struct dsu_hw_events {
  * @num_counters	: Number of event counters implemented by the PMU,
  *			  excluding the cycle counter.
  * @irq			: Interrupt line for counter overflow.
+ * @has_32b_pmevcntr	: Are the non-cycle counters only 32-bit?
  * @cpmceid_bitmap	: Bitmap for the availability of architected common
  *			  events (event_code < 0x40).
  */
@@ -120,6 +114,7 @@ struct dsu_pmu {
 	struct hlist_node		cpuhp_node;
 	s8				num_counters;
 	int				irq;
+	bool				has_32b_pmevcntr;
 	DECLARE_BITMAP(cpmceid_bitmap, DSU_PMU_MAX_COMMON_EVENTS);
 };
 
@@ -328,6 +323,11 @@ static inline void dsu_pmu_set_event(struct dsu_pmu *dsu_pmu,
 	raw_spin_unlock_irqrestore(&dsu_pmu->pmu_lock, flags);
 }
 
+static u64 dsu_pmu_counter_mask(struct hw_perf_event *hw)
+{
+	return (hw->flags && hw->idx != DSU_PMU_IDX_CYCLE_COUNTER) ? U32_MAX : U64_MAX;
+}
+
 static void dsu_pmu_event_update(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -339,7 +339,7 @@ static void dsu_pmu_event_update(struct perf_event *event)
 		new_count = dsu_pmu_read_counter(event);
 	} while (local64_cmpxchg(&hwc->prev_count, prev_count, new_count) !=
 			prev_count);
-	delta = (new_count - prev_count) & DSU_PMU_COUNTER_MASK(hwc->idx);
+	delta = (new_count - prev_count) & dsu_pmu_counter_mask(hwc);
 	local64_add(delta, &event->count);
 }
 
@@ -362,8 +362,7 @@ static inline u32 dsu_pmu_get_reset_overflow(void)
  */
 static void dsu_pmu_set_event_period(struct perf_event *event)
 {
-	int idx = event->hw.idx;
-	u64 val = DSU_PMU_COUNTER_MASK(idx) >> 1;
+	u64 val = dsu_pmu_counter_mask(&event->hw) >> 1;
 
 	local64_set(&event->hw.prev_count, val);
 	dsu_pmu_write_counter(event, val);
@@ -564,6 +563,7 @@ static int dsu_pmu_event_init(struct perf_event *event)
 		return -EINVAL;
 
 	event->hw.config_base = event->attr.config;
+	event->hw.flags = dsu_pmu->has_32b_pmevcntr;
 	return 0;
 }
 
@@ -664,6 +664,10 @@ static void dsu_pmu_probe_pmu(struct dsu_pmu *dsu_pmu)
 	cpmceid[1] = __dsu_pmu_read_pmceid(1);
 	bitmap_from_arr32(dsu_pmu->cpmceid_bitmap, cpmceid,
 			  DSU_PMU_MAX_COMMON_EVENTS);
+	/* Newer DSUs have 64-bit counters */
+	__dsu_pmu_write_counter(0, U64_MAX);
+	if (__dsu_pmu_read_counter(0) != U64_MAX)
+		dsu_pmu->has_32b_pmevcntr = true;
 }
 
 static void dsu_pmu_set_active_cpu(int cpu, struct dsu_pmu *dsu_pmu)
-- 
2.39.2.101.g768bb238c484.dirty


