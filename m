Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3782C98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fTfJXevIcVMaStjHA01fBz3QdlqN/MDUGn0cPjroCY=; b=I4WhyUwXgd2x2In9bOBC+VfES8
	hu9Q8QLNgwwrA+5FxIV9CPclpapdSkrEUVaWfiiz4Lk64Zflwq8vifCaWlY0UL0BHRYvbw+e2ibOV
	x8RYCCFWGcfd9IEbpSVGcpwg/VU+TkUsaISkj1UFyyRfkWjc0bKxeHOLV2HzUPPKUJmbWHqUEz/32
	equFlf2lOLPPOMPrx5pe+BvawBbmtgm89Q6D+oFVF3M3dQzz6sSf7s8E3nef8108Dz36J5mzX1JAF
	JSV553/W//W5SLqMalEblGD7eIGVkTal6nNoPAps5A6Za3jJxV8dMUtCNp7rOThjduslbQdeXcIam
	LqSUHkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGW-0000000BjxW-2ErL;
	Thu, 24 Sep 2026 17:29:48 +0000
Received: from mail-ot1-x345.google.com ([2607:f8b0:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGN-0000000Bjqx-1vRs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:42 +0000
Received: by mail-ot1-x345.google.com with SMTP id 46e09a7af769-805fa97ca69so34746a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270978; x=1790875778; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fTfJXevIcVMaStjHA01fBz3QdlqN/MDUGn0cPjroCY=;
        b=Clnc3jrHHXh8CTNTKzcq1/FjyFQ+tvqfd9ONoaZwWzYgF11jafD8LoXxdp/KknR1Vh
         m9GLu7NUu2ung6f0e1wT5ll7hT6q+mLefvWu/gjJ90q+jYWtB0qs1BaJaNUYA6c9+C+3
         BqMrP7EDs1uSNfv0RXvbh0P8VPguhzQadHkF0xUJ6mB+CzkvCQU3vZYHd8cfEx2EL2hG
         2xw6kW3KM/QmNVnruyhwN7Ti7+0/wb42XqIPEFN+gxphyHWacMGJnYd+L2rDrUcPd+4f
         OgMkLYYW/Z1vP8eurN0Oq78FP0QsFoOubEpSmKL5VR6VzzkUMyKCW2WN+LkAk/ium9ao
         43Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270978; x=1790875778;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fTfJXevIcVMaStjHA01fBz3QdlqN/MDUGn0cPjroCY=;
        b=2A1MQAiXlL93BhkqXagnk8DzfV1lHEjXz50zWqERvlIDuiX5ISgBeloN22BnjdEdAr
         i35QIH5FMaUgzNjdWN0Mp7TB3Vzub752q3UcYOK8ghrCW7GDKVJ14cteHvF3wMDVTOMk
         gLFhB8QcZoV9Eytyye8/hQSA7eObSMmw1YuHLJP+LukMlR5ba2MzKGrDpJzHwbGLCn24
         JmUsp+thjP3fCGVLrSXkj/pE2EyWeqwDmzGeecPl1Y1OEF21jp8SketfNePoVf4C/Tkp
         O3tDGIN+gd864YyNpAPTEB+ItxYFOE90dZFIsyARxm0+5sfXwN8xxCIde6XX4FBz0jtB
         sdPg==
X-Forwarded-Encrypted: i=1; AKwUvByOrJneuwibjudt+dS1HWJrUuNpEA03xQx/Nr3fmO+jmlyzwgyqbn4N8IS8eCSY0IBF/RNYg9WGGKI9JcuAe8Ch@lists.infradead.org
X-Gm-Message-State: AFuF++la05lsrt5o7KaXTsTsh7LF3c/Equr908MFsyXMvvNWr0UOrWQT
	KW882w+U9BVsivG03LwkfT2VgtH3PMoBz6ChDNAI4VdV+lqlNkNCPUvA/ZPYJj1KX0asIBiXQ7T
	+6nOzbnkVq2livXYI5Mf317yOhw==
X-Received: from iljw19.prod.google.com ([2002:a05:6e02:13f3:b0:509:7f67:8545])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1927:b0:4d3:3e3e:8216 with SMTP id 5614622812f47-4d72c740173mr3310428b6e.25.1790270977551;
 Thu, 24 Sep 2026 10:29:37 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:11 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-6-coltonlewis@google.com>
Subject: [PATCH v9 05/22] perf: arm_pmuv3: Move counter allocation mask to
 per-CPU struct pmu_hw_events
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102939_511529_A01C4D10 
X-CRM114-Status: GOOD (  20.32  )
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

In preparation for dynamic per-CPU PMU counter reservations when running
KVM guests with a partitioned PMU, move the counter allocation mask from
the global struct arm_pmu to per-CPU struct pmu_hw_events.

Initialize cpuc->cntr_mask from the static cpu_pmu->cntr_mask during PMU
probe and CPU hotplug startup, and update event counter allocation
helpers (armv8pmu_get_single_idx(), armv8pmu_get_chain_idx(), and
armv8pmu_get_event_idx()) to query the per-CPU mask.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmu.c       |  7 ++++++-
 drivers/perf/arm_pmuv3.c     | 18 +++++++++++++-----
 include/linux/perf/arm_pmu.h |  1 +
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 1150695653892..344adcd3521d0 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -408,9 +408,11 @@ validate_group(struct perf_event *event)
 
 	/*
 	 * Initialise the fake PMU. We only need to populate the
-	 * used_mask for the purposes of validation.
+	 * used_mask and cntr_mask for the purposes of validation.
 	 */
 	memset(&fake_pmu.used_mask, 0, sizeof(fake_pmu.used_mask));
+	bitmap_copy(fake_pmu.cntr_mask, to_arm_pmu(event->pmu)->cntr_mask,
+		    ARMPMU_MAX_HWEVENTS);
 
 	if (!validate_event(event->pmu, &fake_pmu, leader))
 		return -EINVAL;
@@ -717,6 +719,7 @@ bool arm_pmu_irq_is_nmi(void)
 static int arm_perf_starting_cpu(unsigned int cpu, struct hlist_node *node)
 {
 	struct arm_pmu *pmu = hlist_entry_safe(node, struct arm_pmu, node);
+	struct pmu_hw_events *cpuc = per_cpu_ptr(pmu->hw_events, cpu);
 	int irq;
 
 	if (!cpumask_test_cpu(cpu, &pmu->supported_cpus))
@@ -724,6 +727,8 @@ static int arm_perf_starting_cpu(unsigned int cpu, struct hlist_node *node)
 	if (pmu->reset)
 		pmu->reset(pmu);
 
+	bitmap_copy(cpuc->cntr_mask, pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
+
 	irq = armpmu_get_cpu_irq(pmu, cpu);
 	if (irq)
 		per_cpu(cpu_irq_ops, cpu)->enable_pmuirq(irq);
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 4a6c1f3bcea1f..49289e5993dd7 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -813,7 +813,7 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 		write_pmuacr(mask);
 	} else {
 		/* Clear any unused counters to avoid leaking their contents */
-		for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
+		for_each_andnot_bit(i, cpuc->cntr_mask, cpuc->used_mask,
 				    ARMPMU_MAX_HWEVENTS) {
 			if (i == ARMV8_PMU_CYCLE_IDX)
 				write_pmccntr(0);
@@ -917,7 +917,7 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	 * to prevent skews in group events.
 	 */
 	armv8pmu_stop(cpu_pmu);
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS) {
+	for_each_set_bit(idx, cpuc->cntr_mask, ARMPMU_MAX_HWEVENTS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct hw_perf_event *hwc;
 
@@ -958,7 +958,7 @@ static int armv8pmu_get_single_idx(struct pmu_hw_events *cpuc,
 {
 	int idx;
 
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+	for_each_set_bit(idx, cpuc->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -974,7 +974,7 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	 * Chaining requires two consecutive event counters, where
 	 * the lower idx must be even.
 	 */
-	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+	for_each_set_bit(idx, cpuc->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
 		if (!(idx & 0x1))
 			continue;
 		if (!test_and_set_bit(idx, cpuc->used_mask)) {
@@ -1042,7 +1042,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 */
 	if ((evtype == ARMV8_PMUV3_PERFCTR_INST_RETIRED) &&
 	    !armv8pmu_event_get_threshold(&event->attr) &&
-	    test_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask) &&
+	    test_bit(ARMV8_PMU_INSTR_IDX, cpuc->cntr_mask) &&
 	    !armv8pmu_event_want_user_access(event)) {
 		if (!test_and_set_bit(ARMV8_PMU_INSTR_IDX, cpuc->used_mask))
 			return ARMV8_PMU_INSTR_IDX;
@@ -1426,6 +1426,7 @@ static int armv8pmu_probe_pmu(struct arm_pmu *cpu_pmu)
 		.present = false,
 	};
 	int ret;
+	int cpu;
 
 	ret = smp_call_function_any(&cpu_pmu->supported_cpus,
 				    __armv8pmu_probe_pmu,
@@ -1441,6 +1442,13 @@ static int armv8pmu_probe_pmu(struct arm_pmu *cpu_pmu)
 		if (ret)
 			return ret;
 	}
+
+	for_each_possible_cpu(cpu) {
+		struct pmu_hw_events *cpuc = per_cpu_ptr(cpu_pmu->hw_events, cpu);
+
+		bitmap_copy(cpuc->cntr_mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 02d2c7f45b527..be1e345e99a77 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -62,6 +62,7 @@ struct pmu_hw_events {
 	 * an event. A 0 means that the counter can be used.
 	 */
 	DECLARE_BITMAP(used_mask, ARMPMU_MAX_HWEVENTS);
+	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
 
 	/*
 	 * When using percpu IRQs, we need a percpu dev_id. Place it here as we
-- 
2.56.0.rc1.310.g51773c2048-goog


