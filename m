Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735EBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBIXxrcBrCU8gSPBHd/jAHltxSRSe7nuoZNbpUeVov8=; b=hlG0ldjfZmyGMGRmg7fhew7nhA
	thcxlTMM0WuFfNF1KWnZs5CE+DxzNjF8L7ndo2zlbjfLHhVMHVMqHgr6yyEYmVhukGaHbVcaLsF+d
	OvB3re3cSGCA9xKJfydjI0LSJ7bhIYbPxEJU+7+ewLAD5K0sqCOrHjRZMLy9WHhNASgNFU6uv2oon
	k/jXJh1a7KKdJn0bCDqg21XFeb6N4X3WUQhpCL/l3rqOzGti4O4I4Jgp4UKVc+UJOhLKrey3GHGAA
	WDa0Uzy1Q/k1RqFGZuvx6gAdK5mDDaTL89MoJ2+UIk7NXuhBKPeTJ8G46vBeJoAB2GpDizPQB3/Ra
	izgG+ZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeHv-0000000FUDK-0VnZ;
	Fri, 07 Mar 2025 20:27:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeEl-0000000FTl6-1uFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:24:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D6271477;
	Fri,  7 Mar 2025 12:24:15 -0800 (PST)
Received: from e128066.arm.com (unknown [10.57.40.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B5CE3F5A1;
	Fri,  7 Mar 2025 12:23:59 -0800 (PST)
From: mark.barnett@arm.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: ben.gainey@arm.com,
	deepak.surti@arm.com,
	ak@linux.intel.com,
	will@kernel.org,
	james.clark@arm.com,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Barnett <mark.barnett@arm.com>
Subject: [PATCH v3 1/5] perf: Record sample last_period before updating
Date: Fri,  7 Mar 2025 20:22:43 +0000
Message-Id: <20250307202247.648633-2-mark.barnett@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250307202247.648633-1-mark.barnett@arm.com>
References: <20250307202247.648633-1-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_122403_594799_8C78C113 
X-CRM114-Status: GOOD (  15.37  )
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

From: Mark Barnett <mark.barnett@arm.com>

This change alters the PowerPC and x86 driver implementations to record
the last sample period before the event is updated for the next period.

A common pattern in PMU driver implementations is to have a
"*_event_set_period" function which takes care of updating the various
period-related fields in a perf_event structure. In most cases, the
drivers choose to call this function after initializing a sample data
structure with perf_sample_data_init. The x86 and PowerPC drivers
deviate from this, choosing to update the period before initializing the
sample data. When using an event with an alternate sample period, this
causes an incorrect period to be written to the sample data that gets
reported to userspace.

Link: https://lore.kernel.org/r/20240515193610.2350456-4-yabinc@google.com
Signed-off-by: Mark Barnett <mark.barnett@arm.com>
---
 arch/powerpc/perf/core-book3s.c  | 3 ++-
 arch/powerpc/perf/core-fsl-emb.c | 3 ++-
 arch/x86/events/core.c           | 4 +++-
 arch/x86/events/intel/core.c     | 5 ++++-
 arch/x86/events/intel/knc.c      | 4 +++-
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 2b79171ee185..234803441caa 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2231,6 +2231,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 			       struct pt_regs *regs)
 {
 	u64 period = event->hw.sample_period;
+	const u64 last_period = event->hw.last_period;
 	s64 prev, delta, left;
 	int record = 0;
 
@@ -2296,7 +2297,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	if (record) {
 		struct perf_sample_data data;
 
-		perf_sample_data_init(&data, ~0ULL, event->hw.last_period);
+		perf_sample_data_init(&data, ~0ULL, last_period);
 
 		if (event->attr.sample_type & PERF_SAMPLE_ADDR_TYPE)
 			perf_get_data_addr(event, regs, &data.addr);
diff --git a/arch/powerpc/perf/core-fsl-emb.c b/arch/powerpc/perf/core-fsl-emb.c
index 1a53ab08447c..d2ffcc7021c5 100644
--- a/arch/powerpc/perf/core-fsl-emb.c
+++ b/arch/powerpc/perf/core-fsl-emb.c
@@ -590,6 +590,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 			       struct pt_regs *regs)
 {
 	u64 period = event->hw.sample_period;
+	const u64 last_period = event->hw.last_period;
 	s64 prev, delta, left;
 	int record = 0;
 
@@ -632,7 +633,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 	if (record) {
 		struct perf_sample_data data;
 
-		perf_sample_data_init(&data, 0, event->hw.last_period);
+		perf_sample_data_init(&data, 0, last_period);
 
 		if (perf_event_overflow(event, &data, regs))
 			fsl_emb_pmu_stop(event, 0);
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 8f218ac0d445..a78a8f3244ef 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1673,6 +1673,7 @@ int x86_pmu_handle_irq(struct pt_regs *regs)
 	struct cpu_hw_events *cpuc;
 	struct perf_event *event;
 	int idx, handled = 0;
+	u64 last_period;
 	u64 val;
 
 	cpuc = this_cpu_ptr(&cpu_hw_events);
@@ -1692,6 +1693,7 @@ int x86_pmu_handle_irq(struct pt_regs *regs)
 			continue;
 
 		event = cpuc->events[idx];
+		last_period = event->hw.last_period;
 
 		val = static_call(x86_pmu_update)(event);
 		if (val & (1ULL << (x86_pmu.cntval_bits - 1)))
@@ -1705,7 +1707,7 @@ int x86_pmu_handle_irq(struct pt_regs *regs)
 		if (!static_call(x86_pmu_set_period)(event))
 			continue;
 
-		perf_sample_data_init(&data, 0, event->hw.last_period);
+		perf_sample_data_init(&data, 0, last_period);
 
 		perf_sample_save_brstack(&data, event, &cpuc->lbr_stack, NULL);
 
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 7601196d1d18..add791c6e3d9 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3116,16 +3116,19 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 
 	for_each_set_bit(bit, (unsigned long *)&status, X86_PMC_IDX_MAX) {
 		struct perf_event *event = cpuc->events[bit];
+		u64 last_period;
 
 		handled++;
 
 		if (!test_bit(bit, cpuc->active_mask))
 			continue;
 
+		last_period = event->hw.last_period;
+
 		if (!intel_pmu_save_and_restart(event))
 			continue;
 
-		perf_sample_data_init(&data, 0, event->hw.last_period);
+		perf_sample_data_init(&data, 0, last_period);
 
 		if (has_branch_stack(event))
 			intel_pmu_lbr_save_brstack(&data, cpuc, event);
diff --git a/arch/x86/events/intel/knc.c b/arch/x86/events/intel/knc.c
index 034a1f6a457c..3e8ec049b46d 100644
--- a/arch/x86/events/intel/knc.c
+++ b/arch/x86/events/intel/knc.c
@@ -241,16 +241,18 @@ static int knc_pmu_handle_irq(struct pt_regs *regs)
 
 	for_each_set_bit(bit, (unsigned long *)&status, X86_PMC_IDX_MAX) {
 		struct perf_event *event = cpuc->events[bit];
+		u64 last_period;
 
 		handled++;
 
 		if (!test_bit(bit, cpuc->active_mask))
 			continue;
 
+		last_period = event->hw.last_period;
 		if (!intel_pmu_save_and_restart(event))
 			continue;
 
-		perf_sample_data_init(&data, 0, event->hw.last_period);
+		perf_sample_data_init(&data, 0, last_period);
 
 		if (perf_event_overflow(event, &data, regs))
 			x86_pmu_stop(event, 0);
-- 
2.43.0


