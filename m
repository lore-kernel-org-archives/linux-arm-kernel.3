Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BAED5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDhEnBNCyMrz14TNf5NFxeypsfVJR0RbVAFJwdsRG18=; b=ej0yvlnEQHvHwBj/VNyetuvJxu
	F4sDLodbDHasUypGffK1zonTILy4dx4n5CS1s6TSnhRO79C0NlJOltR7/4oLRtcQRIVZMRtZNsFeQ
	U2UwgW+AoHtcaji5ja9ZxVRzP5q5oCxUsUIV+6daUgDZgGqGMNPmfLzOMIXhS39HPKlLmIIxrUmZT
	s09pnd1cEdQItgmZps0Z+S7cb7DIEmMkR5jfIXfqo8R+o3AnTQxuCG0wZDt4szClRGqbtEUJnrYRJ
	oWocQIWzcW57QgJyojVKMluoP9iW6mfQoqUqq7/5Du+cMMkHqzhNmSGLoBhBbbJag0biInKDtEPmR
	tOReqoxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8GM-00000003fO9-1Hct;
	Mon, 15 Dec 2025 13:05:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8GG-00000003fL3-2jfc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:05:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCA3D1655;
	Mon, 15 Dec 2025 05:05:02 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E6453F73B;
	Mon, 15 Dec 2025 05:05:08 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 2/3] perf/arm_dsu: Support DSU-120
Date: Mon, 15 Dec 2025 13:04:59 +0000
Message-Id: <346d4d9cda0e6c8dec44c28b8911e2bd944c389c.1765802897.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1765802897.git.robin.murphy@arm.com>
References: <cover.1765802897.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_050512_733083_BEFF1F28 
X-CRM114-Status: GOOD (  11.18  )
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

DSU-120 has the same system register interface as previous DSUs, but
no longer offers a dedicated cycle counter. While this is not directly
discoverable via PMCR, the PMCCNTR register is still defined to exist
with RAZ/WI behaviour, allowing for a straightforward heuristic.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_dsu_pmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index 8663721ee018..56c592f0dae3 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -101,6 +101,7 @@ struct dsu_hw_events {
  *			  excluding the cycle counter.
  * @irq			: Interrupt line for counter overflow.
  * @has_32b_pmevcntr	: Are the non-cycle counters only 32-bit?
+ * @has_pmccntr		: Do we even have a dedicated cycle counter?
  * @cpmceid_bitmap	: Bitmap for the availability of architected common
  *			  events (event_code < 0x40).
  */
@@ -115,6 +116,7 @@ struct dsu_pmu {
 	s8				num_counters;
 	int				irq;
 	bool				has_32b_pmevcntr;
+	bool				has_pmccntr;
 	DECLARE_BITMAP(cpmceid_bitmap, DSU_PMU_MAX_COMMON_EVENTS);
 };
 
@@ -281,7 +283,7 @@ static int dsu_pmu_get_event_idx(struct dsu_hw_events *hw_events,
 	struct dsu_pmu *dsu_pmu = to_dsu_pmu(event->pmu);
 	unsigned long *used_mask = hw_events->used_mask;
 
-	if (evtype == DSU_PMU_EVT_CYCLES) {
+	if (evtype == DSU_PMU_EVT_CYCLES && dsu_pmu->has_pmccntr) {
 		if (test_and_set_bit(DSU_PMU_IDX_CYCLE_COUNTER, used_mask))
 			return -EAGAIN;
 		return DSU_PMU_IDX_CYCLE_COUNTER;
@@ -668,6 +670,10 @@ static void dsu_pmu_probe_pmu(struct dsu_pmu *dsu_pmu)
 	__dsu_pmu_write_counter(0, U64_MAX);
 	if (__dsu_pmu_read_counter(0) != U64_MAX)
 		dsu_pmu->has_32b_pmevcntr = true;
+	/* On even newer DSUs, PMCCNTR is RAZ/WI */
+	__dsu_pmu_write_pmccntr(U64_MAX);
+	if (__dsu_pmu_read_pmccntr() == U64_MAX)
+		dsu_pmu->has_pmccntr = true;
 }
 
 static void dsu_pmu_set_active_cpu(int cpu, struct dsu_pmu *dsu_pmu)
-- 
2.39.2.101.g768bb238c484.dirty


