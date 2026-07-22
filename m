Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3A3C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkSfQ41LGLve76G9aY2qA6qogcQZmp40O7x2f52bP9U=; b=fXacRieOgq2fKRb+/8ZrxGTUcG
	Zz6RWwWbwrDg7//J4LjyFfF7f08YAl9XSGRjNi0YAcQk7DIkq0t7b6b/HG6D4mJLDjDdM2YGqmYRR
	bKhmZWm4BGf6en2oHdn9TogdUIK0ksAjaEjMzqibILBsBkS6ydO4RezuRM4nECKI9rK4nVP7bg+tn
	HEIKj3dYt3UJFQR6bQZNscHXPk5U/qP+iD/LAwpkm8OKdrBD4QYvUww61PSdiCD5f63WmExjTUYgd
	Edv5wAxw1FZQk+3HcT9zlvr9Bq27gFatSS1hyMFH6zBKeFMnOmSzZN8Bc3hZaOzYsmnN+HDeUQB25
	BVGe7XTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagO-0000000CSD6-23Tn;
	Wed, 22 Jul 2026 17:24:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagL-0000000CSBO-1HmA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Jul 2026 17:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JkSfQ41LGLve76G9aY2qA6qogcQZmp40O7x2f52bP9U=; b=JWVV0H4s4YYtcx25tuyuwKKPak
	EwGApMs0voSwEBDsbE2MLChKkTHDBXKoBkkjczdpALSGqd97h4JBkPV627JCQ3KtmcZriT5/yBZzp
	0EwHuysmeh/zwuLoNQC4rnK8FLZU++FgXVGWb7Sk6QFODwCcmhU8A4kmSkLux1DhfTaxPZbGZX1TD
	BtUqwF1FqleW6wGUAISE4AH18yvWYxjf5YjcvdPCZdRVBbaHQZTnewYVvcn/7wQb8ZGzsRNuUrlmu
	xxw9Y6PRCNmUbz6A3r7ztAHQBsx3k99fQPVMwVTWVH268E+w8YH38jaDYoZ4500gGPU3/AVKDdIPV
	NlBTK+9w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmagH-000000014aq-0wLf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:24:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2111691;
	Wed, 22 Jul 2026 10:24:22 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7AAD83F66F;
	Wed, 22 Jul 2026 10:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784741067; bh=Kn8pH+9+puB434Y7fFq6KsqVuN6cTxleHuJprPNP4uE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dFyLqZdMDVz9RTUlNC0G0CDfEopVUZLJtThAgFD1HpW0ELuZgxRcDit51HQ+eT6O8
	 wwLg58HAA1G6NWJmYs6tsTf6+rf3aIS7FZRvPoEn02RUIA/q2ZUM87iw7wPeTaQjuI
	 Z9oaBH3dJk8iwqWF4FYJr21ZsywXZVUj3XvHsIDY=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] perf: Generic hotplug/cpumask for system PMUs
Date: Wed, 22 Jul 2026 18:24:17 +0100
Message-ID: <b8aae1114794a348ecfb4e9cf7a792b3ac300d56.1784653319.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1784653319.git.robin.murphy@arm.com>
References: <cover.1784653319.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_182429_538149_71FDE25F 
X-CRM114-Status: GOOD (  26.46  )
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

Using the distinction of "uncore" PMUs being x86-style sliced across
standard ACPI topological scopes, and "system" PMUs being arbitrary
independent instances, while the former's PERF_PMU_SCOPE_SYS_WIDE has
some overlap with the latter, it still involves some assumptions which
don't quite carry over. System PMUs may be associated with irregular
subsets of CPUs, and they usually have overflow interrupts, which
require maintaining specific CPU affinity to avoid races against
reading or scheduling out events.

Fortunately, with the generic uncore machinery in place, it doesn't
take much to extend with a new PMU-defined scope to do the job for
system PMUs - all we really need is a way for the core code to retrieve
a per-PMU cpumask, which can simply be a pointer rather than needing a
function method, plus a couple of methods to cover the driver-specific
work currently done by all the many, many open-coded hotplug states.

Not only does this save whole swathes of boilerplate in drivers, it also
finally eliminates the fiddly race condition where depending on the
order in which cpuhp_setup_state/add_instance() is called relative to
perf_pmu_register(), one would theoretically risk either missing a
hotplug event, or attempting to migrate an uninitialised PMU.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 include/linux/perf_event.h | 19 ++++++++++
 kernel/events/core.c       | 76 +++++++++++++++++++++++++++++++++-----
 2 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea..ff29c45eb082 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -317,6 +317,8 @@ enum perf_pmu_scope {
 	PERF_PMU_SCOPE_CLUSTER,
 	PERF_PMU_SCOPE_PKG,
 	PERF_PMU_SCOPE_SYS_WIDE,
+	/* Dynamically determined by PMU driver via pmu->cpumask */
+	PERF_PMU_SCOPE_CPUMASK,
 	PERF_PMU_MAX_SCOPE,
 };
 
@@ -350,6 +352,7 @@ struct pmu {
 	 * PMU scope
 	 */
 	unsigned int			scope;
+	const struct cpumask		*cpumask;
 
 	struct perf_cpu_pmu_context * __percpu *cpu_pmu_context;
 	atomic_t			exclusive_cnt; /* < 0: cpu; > 0: tsk */
@@ -589,6 +592,22 @@ struct pmu {
 	 * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
 	 */
 	int (*check_period)		(struct perf_event *event, u64 value); /* optional */
+
+	/*
+	 * For PMUs to manage any private CPU-affine state, e.g. IRQs.
+	 *
+	 * Called from CPU hotplug. PMUs with PERF_PMU_SCOPE_CPUMASK may
+	 * return true if pmu->cpumask was updated and PMU context should be
+	 * be migrated to a new CPU; otherwise should return false.
+	 *
+	 * ->exit_cpu() runs from CPUHP_AP_PERF_OFFLINE context, unless @cpu
+	 * is already absent from pmu->cpumask
+	 * ->init_cpu() runs from CPUHP_AP_PERF_ONLINE context, unless @cpu is
+	 * already present in pmu->cpumask, plus once for each online CPU upon
+	 * initial registration
+	 */
+	bool (*exit_cpu)		(struct pmu *pmu, int cpu); /* optional */
+	bool (*init_cpu)		(struct pmu *pmu, int cpu); /* optional */
 };
 
 enum perf_addr_filter_action_t {
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 954c36e28101..506bdd3c572c 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -12651,6 +12651,13 @@ perf_event_mux_interval_ms_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(perf_event_mux_interval_ms);
 
+static void perf_scope_init_cpu(void *info)
+{
+	struct pmu *pmu = info;
+
+	pmu->init_cpu(pmu, smp_processor_id());
+}
+
 static inline const struct cpumask *perf_scope_cpu_topology_cpumask(unsigned int scope, int cpu)
 {
 	switch (scope) {
@@ -12664,9 +12671,11 @@ static inline const struct cpumask *perf_scope_cpu_topology_cpumask(unsigned int
 		return topology_core_cpumask(cpu);
 	case PERF_PMU_SCOPE_SYS_WIDE:
 		return cpu_online_mask;
+	case PERF_PMU_SCOPE_CPUMASK:
+		return cpumask_of(cpu);
+	default:
+		return NULL;
 	}
-
-	return NULL;
 }
 
 static inline struct cpumask *perf_scope_cpumask(unsigned int scope)
@@ -12682,16 +12691,26 @@ static inline struct cpumask *perf_scope_cpumask(unsigned int scope)
 		return perf_online_pkg_mask;
 	case PERF_PMU_SCOPE_SYS_WIDE:
 		return perf_online_sys_mask;
+	default:
+		return NULL;
 	}
+}
 
-	return NULL;
+static inline const struct cpumask *perf_pmu_cpumask(const struct pmu *pmu)
+{
+	switch (pmu->scope) {
+	case PERF_PMU_SCOPE_CPUMASK:
+		return pmu->cpumask;
+	default:
+		return perf_scope_cpumask(pmu->scope);
+	}
 }
 
 static ssize_t cpumask_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct pmu *pmu = dev_get_drvdata(dev);
-	struct cpumask *mask = perf_scope_cpumask(pmu->scope);
+	const struct cpumask *mask = perf_pmu_cpumask(pmu);
 
 	if (mask)
 		return cpumap_print_to_pagebuf(true, buf, mask);
@@ -12849,6 +12868,12 @@ int perf_pmu_register(struct pmu *_pmu, const char *name, int type)
 		      "Can not register a pmu with an invalid scope.\n"))
 		return -EINVAL;
 
+	if (pmu->scope == PERF_PMU_SCOPE_CPUMASK && !pmu->cpumask) {
+		if (WARN_ONCE(!pmu->init_cpu, "PMU must provide cpumask or init callback\n"))
+			return -EINVAL;
+		pmu->cpumask = cpu_none_mask;
+	}
+
 	pmu->name = name;
 
 	if (type >= 0)
@@ -12918,6 +12943,16 @@ int perf_pmu_register(struct pmu *_pmu, const char *name, int type)
 	INIT_LIST_HEAD(&pmu->events);
 	spin_lock_init(&pmu->events_lock);
 
+	/*
+	 * Finally, if appropriate give the PMU a chance to initialise any
+	 * of its own CPU-affine state. Note that we're serialised against
+	 * perf_event_{init,exit}_cpu() themselves by virtue of pmus_lock.
+	 */
+	if (pmu->init_cpu) {
+		for_each_online_cpu(cpu)
+			smp_call_function_single(cpu, perf_scope_init_cpu, pmu, 1);
+	}
+
 	/*
 	 * Now that the PMU is complete, make it visible to perf_try_init_event().
 	 */
@@ -13124,11 +13159,11 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 
 	if (pmu->scope != PERF_PMU_SCOPE_NONE && event->cpu >= 0) {
 		const struct cpumask *cpumask;
-		struct cpumask *pmu_cpumask;
+		const struct cpumask *pmu_cpumask;
 		int cpu;
 
 		cpumask = perf_scope_cpu_topology_cpumask(pmu->scope, event->cpu);
-		pmu_cpumask = perf_scope_cpumask(pmu->scope);
+		pmu_cpumask = perf_pmu_cpumask(pmu);
 
 		ret = -ENODEV;
 		if (!pmu_cpumask || !cpumask)
@@ -13138,7 +13173,8 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 		if (cpu >= nr_cpu_ids)
 			goto err_destroy;
 
-		event->event_caps |= PERF_EV_CAP_READ_SCOPE;
+		if (pmu->scope <= PERF_PMU_SCOPE_SYS_WIDE)
+			event->event_caps |= PERF_EV_CAP_READ_SCOPE;
 	}
 
 	return 0;
@@ -15169,7 +15205,7 @@ static void perf_event_clear_cpumask(unsigned int cpu)
 
 	cpumask_clear_cpu(cpu, perf_online_mask);
 
-	for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
+	for (scope = PERF_PMU_SCOPE_NONE + 1; scope <= PERF_PMU_SCOPE_SYS_WIDE; scope++) {
 		const struct cpumask *cpumask = perf_scope_cpu_topology_cpumask(scope, cpu);
 		struct cpumask *pmu_cpumask = perf_scope_cpumask(scope);
 
@@ -15186,10 +15222,19 @@ static void perf_event_clear_cpumask(unsigned int cpu)
 
 	/* migrate */
 	list_for_each_entry(pmu, &pmus, entry) {
+		bool cpumask_migrate = false;
+
+		if (pmu->init_cpu && (!pmu->cpumask || cpumask_test_cpu(cpu, pmu->cpumask)))
+			cpumask_migrate = pmu->exit_cpu(pmu, cpu);
+
 		if (pmu->scope == PERF_PMU_SCOPE_NONE ||
 		    WARN_ON_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE))
 			continue;
 
+		target[PERF_PMU_SCOPE_CPUMASK] = -1;
+		if (cpumask_migrate && !WARN_ON_ONCE(!pmu->cpumask))
+			target[PERF_PMU_SCOPE_CPUMASK] = cpumask_any_but(pmu->cpumask, cpu);
+
 		if (target[pmu->scope] >= 0 && target[pmu->scope] < nr_cpu_ids)
 			perf_pmu_migrate_context(pmu, cpu, target[pmu->scope]);
 	}
@@ -15227,6 +15272,7 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 {
 	struct cpumask *pmu_cpumask;
 	unsigned int scope;
+	struct pmu *pmu;
 
 	/*
 	 * Early boot stage, the cpumask hasn't been set yet.
@@ -15234,7 +15280,7 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 	 * Always unconditionally set the boot CPU for the perf_online_<domain>_masks.
 	 */
 	if (cpumask_empty(perf_online_mask)) {
-		for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
+		for (scope = PERF_PMU_SCOPE_NONE + 1; scope <= PERF_PMU_SCOPE_SYS_WIDE; scope++) {
 			pmu_cpumask = perf_scope_cpumask(scope);
 			if (WARN_ON_ONCE(!pmu_cpumask))
 				continue;
@@ -15243,7 +15289,7 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 		goto end;
 	}
 
-	for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
+	for (scope = PERF_PMU_SCOPE_NONE + 1; scope <= PERF_PMU_SCOPE_CPUMASK; scope++) {
 		const struct cpumask *cpumask = perf_scope_cpu_topology_cpumask(scope, cpu);
 
 		pmu_cpumask = perf_scope_cpumask(scope);
@@ -15255,6 +15301,16 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 		    cpumask_any_and(pmu_cpumask, cpumask) >= nr_cpu_ids)
 			cpumask_set_cpu(cpu, pmu_cpumask);
 	}
+
+	/* Allow migrating if the new CPU is preferable (e.g. NUMA locality) */
+	list_for_each_entry(pmu, &pmus, entry) {
+		bool cpumask_migrate = false;
+
+		if (pmu->init_cpu && (!pmu->cpumask || !cpumask_test_cpu(cpu, pmu->cpumask)))
+			cpumask_migrate = pmu->init_cpu(pmu, cpu);
+		if (cpumask_migrate && !WARN_ON_ONCE(!pmu->cpumask))
+			perf_pmu_migrate_context(pmu, cpu, cpumask_any(pmu->cpumask));
+	}
 end:
 	cpumask_set_cpu(cpu, perf_online_mask);
 }
-- 
2.54.0.dirty


