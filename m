Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4313CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2VE7zoH3MmhPr8zA0L/+afRi2fRMyCxx8RSJzgatXg=; b=w6HZ5DV8Fc38+Hy6+jP5nZ3P6j
	JZabCn4xeZcbDI4FfeZUYP3kjP1IaN+kJKMGAGtx4Qj1pGkFVnYeuDQdeZJVQCX7DGtljGEI3GJe/
	T5lda4l0mwt4fjSTF6oO0/DQb7CBHUkHZKfJ9ZM8alWpDh9cu6liy1abRqWPVbyEfnV5d8GwlbTlZ
	dr08OdCCu79ir//N0I7qBs4qVBCdt2zhlNVoakTKZb6hycX9nWye6uzjn0lAK/93THubrP1NRVHiN
	JHjadRSdtCi3gRi7rH6Xb4zgn/hhNnBWCXa7UKkoAxUZk8j2JCRtUFUpnkqq/1MDV5cla6dn0gKvU
	bN+Dh5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DuL-000000058ld-2aMS;
	Tue, 08 Apr 2025 18:42:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CYX-00000004weS-3Ypm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 17:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k2VE7zoH3MmhPr8zA0L/+afRi2fRMyCxx8RSJzgatXg=; b=EbjSYsIY7ZNSf26yioWVYQLKAa
	b4SKhlJMZ7JlQDcc1O+KHvuuFCC2cRqblW1HDzZROlkoQSUffoBGAq6/CVyPSQQ3oNsDoKH9/8Uz5
	A42Yuj48STZNV1SJZ42l3A3Ou7jPxj5Q7x9jW67ZbcVdCXS/6pLsIIi6wQW7bBexzf3m8vmb5/Y7a
	6PyGtZSQlKFJJsoSoqJF+CFhu3IniwtiIoOvNTZXGCueE+66FAxsunuN2OTed59/0n7qcIwVqJBQf
	aoChT/ra42BlDMI3fIo4hbXVO56fU3KyxOcUJ3RIs54FWz2ONS6VKqpPfsYDY2BNnTSZK1vh+AT8u
	BmuFLhUw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2CYU-00000008LZe-1NhJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 17:16:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA4BC1688;
	Tue,  8 Apr 2025 10:16:09 -0700 (PDT)
Received: from e128066.cambridge.arm.com (e128066.cambridge.arm.com [10.1.26.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71F743F59E;
	Tue,  8 Apr 2025 10:16:05 -0700 (PDT)
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
Subject: [PATCH v4 1/5] perf: Record sample last_period before updating
Date: Tue,  8 Apr 2025 18:15:26 +0100
Message-Id: <20250408171530.140858-2-mark.barnett@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408171530.140858-1-mark.barnett@arm.com>
References: <20250408171530.140858-1-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_181610_863008_16F7B9FD 
X-CRM114-Status: GOOD (  15.92  )
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
index b906d28f74fd..42ff4d167acc 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2239,6 +2239,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 			       struct pt_regs *regs)
 {
 	u64 period = event->hw.sample_period;
+	const u64 last_period = event->hw.last_period;
 	s64 prev, delta, left;
 	int record = 0;
 
@@ -2320,7 +2321,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
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
index 6866cc5acb0b..4ccf44943370 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1683,6 +1683,7 @@ int x86_pmu_handle_irq(struct pt_regs *regs)
 	struct cpu_hw_events *cpuc;
 	struct perf_event *event;
 	int idx, handled = 0;
+	u64 last_period;
 	u64 val;
 
 	cpuc = this_cpu_ptr(&cpu_hw_events);
@@ -1702,6 +1703,7 @@ int x86_pmu_handle_irq(struct pt_regs *regs)
 			continue;
 
 		event = cpuc->events[idx];
+		last_period = event->hw.last_period;
 
 		val = static_call(x86_pmu_update)(event);
 		if (val & (1ULL << (x86_pmu.cntval_bits - 1)))
@@ -1715,7 +1717,7 @@ int x86_pmu_handle_irq(struct pt_regs *regs)
 		if (!static_call(x86_pmu_set_period)(event))
 			continue;
 
-		perf_sample_data_init(&data, 0, event->hw.last_period);
+		perf_sample_data_init(&data, 0, last_period);
 
 		perf_sample_save_brstack(&data, event, &cpuc->lbr_stack, NULL);
 
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 09d2d66c9f21..9c0afdbf9d78 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3132,6 +3132,7 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 
 	for_each_set_bit(bit, (unsigned long *)&status, X86_PMC_IDX_MAX) {
 		struct perf_event *event = cpuc->events[bit];
+		u64 last_period;
 
 		handled++;
 
@@ -3159,10 +3160,12 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 		if (is_pebs_counter_event_group(event))
 			x86_pmu.drain_pebs(regs, &data);
 
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


