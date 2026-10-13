Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E374CC6B1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJNG0UrFCFv1GRwghywdpAHlw28VEEGBTW5U88mg4A4=; b=bfNMEuan+9DvVCtv8KBvrX972u
	g8ir8koaUkp7aF7O4VrXDPF+WqM0GfLwlqs3TdhE61NJz2LZC7QIomI2GXlXPPqSGsxTk91+rreiJ
	bX81uxJ/6dtgzmUOsfUgQbkz62KlbEbDVnZ9fjeLNsKRUo/ldXduJbRPppW8yBXWaiywbEYf6NeOj
	c+u4g0UWChXkdqUNFCLgZEwWzGqGdeeXXdpwZm3G8G6mV8/4uIBusfPj5HrQZVF9bDIKfnZDr+j0c
	gyV1vtviV8A+XcwlO0T2rwPSgHf9mw4XLTmPUGEJ3IVUn+kDFDgiDrXydocuAmK3hHBCtbN2pXQpG
	GpzLnc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhg0-0000000DsHb-3uYq;
	Tue, 13 Oct 2026 18:56:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhfx-0000000DsFm-2OxP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 18:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AJNG0UrFCFv1GRwghywdpAHlw28VEEGBTW5U88mg4A4=; b=UcBzQ8cdcLkEpZPAWdb08zqECo
	IDyKIW8hUXi0LMiDw8szeGZxqIDppsY1OKGDFwkjenCf76ENwOhnPK8cMWeFfQC3IH4dbpSAZoJ2M
	umy7BWGeuxBFYFRkgrfjCabEUBBtpZ3mFFvFspWB94m1EjPPY+5rwkGpkYQv0TkMkVf4qofyJeof+
	gg1NXMq8lFMm7MWcOe6T93E8crrqWncWYhTNYc07WxvF2x9TsnDtu33MnEPx6Xj+DBO3hnNVkBRLt
	VA0t0onv2m1FYg6Jei168VQyfjHzpC8emealrGXjaBAzG0qnIxSMQd4WN3FoR74U28nkgC/hydjss
	Mn03SWwg==;
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGhfu-0000000FxLa-13NV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 18:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791917794; x=1823453794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AJNG0UrFCFv1GRwghywdpAHlw28VEEGBTW5U88mg4A4=;
  b=i2AuS/kPNMuBPBvHiWojbDk5vP3GBDFzumcIH2oRVtbiLfXI5ENqZjmf
   PE0craLvHMe+E/i/WkkQR/Y0iNeNEQ9CeDefi4kqog9Yc/asKyuHVRR79
   D8GlNQcc2CjZFA/jhvJAWZ84Ucnj+BQxnEApG25ki1M6HWeCZv+dwMSDD
   ess1m0Impfh5LHpDCxwEn0YZCx7BEheW5oufe2Nv3Ox5ISY69bJt9Vge3
   H2qQJLg4ECn9RdIQX8phmCJEYuH5K9HcPbAVklSTWWkr72j15o8towgmK
   ssvKqElOiba3GVL4WJVdR3MuAAHisNiWLfEDZGLl9rHl+RIz5ms/NPqNa
   A==;
X-CSE-ConnectionGUID: jwqJiJxfQkq3KiWE2Ehf2Q==
X-CSE-MsgGUID: U4+NN1JVRU20vMdsp3he8g==
X-IronPort-AV: E=Sophos;i="6.27,156,1787011200"; 
   d="scan'208";a="30939237"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 18:56:31 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:16021]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.56.108:2525] with esmtp (Farcaster)
 id a2151c72-2e3a-458a-9a1a-02cb0192d0a7; Tue, 13 Oct 2026 18:56:30 +0000 (UTC)
X-Farcaster-Flow-ID: a2151c72-2e3a-458a-9a1a-02cb0192d0a7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 13 Oct 2026 18:56:30 +0000
Received: from u34cccd802f2d52.amazon.com (10.187.170.30) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 13 Oct 2026 18:56:29 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
	<jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
	<adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <harisokn@amazon.com>
Subject: [PATCH 2/4] perf/core: Add PERF_PMU_SCOPE_DEVICE
Date: Tue, 13 Oct 2026 13:56:01 -0500
Message-ID: <20261013185603.1347265-3-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013185603.1347265-1-harisokn@amazon.com>
References: <20261013185603.1347265-1-harisokn@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.170.30]
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_195634_894636_A7359F8F 
X-CRM114-Status: GOOD (  35.09  )
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

Add a "device" pmu::scope for PMUs counted on a single CPU drawn
from a driver-supplied set instead of a fixed topology.

This mechanism is implemented by new callbacks: filter_allowed_cpus()
is invoked to constrain the running CPU set to an allowed set for a
particular device; migrate_cpu() is used to perform any device specific
migration steps. Both are optional, e.g. for devices that can run on
any CPU or have no additional migration steps.

Placement initially happens in perf_pmu_register() before the PMU
becomes visible, and is subsequently re-evaluated on hotplug events.
A new CPU selection is made by cpumask_any_distribute() to spread out
load from multiple devices, but only when the previous CPU selection is
offline or no longer allowed by filter_allowed_cpus().

PMU events of these devices follow the chosen CPU. They are initially
bound to a CPU in perf_try_init_event() then reassigned by
perf_pmu_migrate_context() when a new CPU is selected.

The initial CPU assignment can race with migration, leaving a stranded
event. A sequence counter is added to close this gap without additional
locks. A count in struct pmu increments on each migration and is copied
to struct perf_event on init. The copied count is checked again before
the event is installed, under the same context mutex, which causes
perf_event_open() and perf_event_create_kernel_counter() to return -EBUSY
during migration periods.

Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 include/linux/perf_event.h |  26 ++++++
 kernel/events/core.c       | 181 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 202 insertions(+), 5 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 2d5e7687875b0..99c88ec99b786 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -317,6 +317,7 @@ enum perf_pmu_scope {
 	PERF_PMU_SCOPE_CLUSTER,
 	PERF_PMU_SCOPE_PKG,
 	PERF_PMU_SCOPE_SYS_WIDE,
+	PERF_PMU_SCOPE_DEVICE,
 	PERF_PMU_MAX_SCOPE,
 };
 
@@ -351,6 +352,15 @@ struct pmu {
 	 */
 	unsigned int			scope;
 
+	/* The CPU this PMU counts on for PERF_PMU_SCOPE_DEVICE */
+	int				cpu;
+
+	/*
+	 * Ticks before and after changes to pmu::cpu, so that an event
+	 * being created can tell whether the PMU moved under it.
+	 */
+	unsigned int			migrate_seq;
+
 	struct perf_cpu_pmu_context * __percpu *cpu_pmu_context;
 	atomic_t			exclusive_cnt; /* < 0: cpu; > 0: tsk */
 	int				task_ctx_nr;
@@ -589,6 +599,16 @@ struct pmu {
 	 * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
 	 */
 	int (*check_period)		(struct perf_event *event, u64 value); /* optional */
+
+	/*
+	 * Narrow @allowed_cpus (a set of candidate CPUs) down to the ones this
+	 * PMU can be counted on. Called on PERF_PMU_SCOPE_DEVICE PMUs when CPU
+	 * assignment needs to be reconsidered.
+	 */
+	int (*filter_allowed_cpus)(struct pmu *pmu, struct cpumask *allowed_cpus); /* optional */
+
+	/* Called when a PERF_PMU_SCOPE_DEVICE PMU is assigned a different CPU */
+	void (*migrate_cpu)(struct pmu *pmu, unsigned int cpu); /* optional */
 };
 
 enum perf_addr_filter_action_t {
@@ -855,6 +875,12 @@ struct perf_event {
 	int				oncpu;
 	int				cpu;
 
+	/*
+	 * Copy of pmu::migrate_seq on event init to detect migration of PMU
+	 * under PERF_PMU_SCOPE_DEVICE.
+	 */
+	unsigned int			pmu_migrate_seq;
+
 	struct list_head		owner_entry;
 	struct task_struct		*owner;
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7caba4d528301..0d4e2c6d71584 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -470,6 +470,7 @@ static cpumask_var_t perf_online_die_mask;
 static cpumask_var_t perf_online_cluster_mask;
 static cpumask_var_t perf_online_pkg_mask;
 static cpumask_var_t perf_online_sys_mask;
+static cpumask_var_t perf_device_scope_mask;
 static struct kmem_cache *perf_event_cache;
 
 #ifdef CONFIG_PERF_GUEST_MEDIATED_PMU
@@ -12684,12 +12685,93 @@ static inline struct cpumask *perf_scope_cpumask(unsigned int scope)
 	return NULL;
 }
 
+/*
+ * Move a PERF_PMU_SCOPE_DEVICE PMU to one of @requested_cpus.
+ *
+ * Uses the pre-allocated perf_device_scope_mask global to avoid
+ * allocation during hotplug; protected by pmus_lock.
+ */
+static int perf_pmu_set_cpu(struct pmu *pmu,
+			    const struct cpumask *requested_cpus)
+{
+	struct cpumask *allowed_cpus = perf_device_scope_mask;
+	int new_cpu, ret;
+
+	lockdep_assert_held(&pmus_lock);
+
+	/* A PMU can only be counted on a CPU that perf has online. */
+	cpumask_and(allowed_cpus, requested_cpus, perf_online_mask);
+	if (cpumask_empty(allowed_cpus))
+		return -ENODEV;
+
+	if (pmu->filter_allowed_cpus) {
+		ret = pmu->filter_allowed_cpus(pmu, allowed_cpus);
+		if (ret)
+			return ret;
+
+		if (cpumask_empty(allowed_cpus))
+			return -ENODEV;
+	}
+
+	/* Stay where we are for as long as that CPU is still allowed. */
+	if ((unsigned int)pmu->cpu < nr_cpu_ids &&
+	    cpumask_test_cpu(pmu->cpu, allowed_cpus))
+		return 0;
+
+	/* Spreads PMUs across allowed CPUs. */
+	new_cpu = cpumask_any_distribute(allowed_cpus);
+
+	WRITE_ONCE(pmu->migrate_seq, pmu->migrate_seq + 1);
+	smp_wmb(); /* pairs with the smp_rmb() in perf_try_init_event() */
+
+	/*
+	 * A PMU being placed for the first time (pmu->cpu = -1) has no events
+	 * yet, and no CPU to migrate them from.
+	 */
+	if ((unsigned int)pmu->cpu < nr_cpu_ids)
+		perf_pmu_migrate_context(pmu, pmu->cpu, new_cpu);
+
+	if (pmu->migrate_cpu)
+		pmu->migrate_cpu(pmu, new_cpu);
+
+	pmu->cpu = new_cpu;
+
+	smp_wmb(); /* pairs with the smp_rmb() in perf_try_init_event() */
+	WRITE_ONCE(pmu->migrate_seq, pmu->migrate_seq + 1);
+
+	return 0;
+}
+
+/* Did the PMU move after event was initialized? */
+static bool perf_event_pmu_moved(struct perf_event *event)
+{
+	struct pmu *pmu = event->pmu;
+
+	if (pmu->scope != PERF_PMU_SCOPE_DEVICE)
+		return false;
+
+	/*
+	 * An odd seq means the event was created during a move, so treat it
+	 * as moved.
+	 */
+	return (event->pmu_migrate_seq & 1) ||
+	       READ_ONCE(pmu->migrate_seq) != event->pmu_migrate_seq;
+}
+
 static ssize_t cpumask_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	struct pmu *pmu = dev_get_drvdata(dev);
-	struct cpumask *mask = perf_scope_cpumask(pmu->scope);
+	struct cpumask *mask;
 
+	/* These PMU devices count on a single CPU, see pmu::cpu. */
+	if (pmu->scope == PERF_PMU_SCOPE_DEVICE) {
+		if ((unsigned int)pmu->cpu >= nr_cpu_ids)
+			return 0;
+		return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpumask_of(pmu->cpu)));
+	}
+
+	mask = perf_scope_cpumask(pmu->scope);
 	if (mask)
 		return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(mask));
 	return 0;
@@ -12846,6 +12928,12 @@ int perf_pmu_register(struct pmu *_pmu, const char *name, int type)
 		      "Can not register a pmu with an invalid scope.\n"))
 		return -EINVAL;
 
+	if (WARN_ONCE(pmu->scope != PERF_PMU_SCOPE_DEVICE &&
+		      (pmu->filter_allowed_cpus || pmu->migrate_cpu),
+		      "Can not register a pmu with CPU callbacks outside device scope.\n"))
+		return -EINVAL;
+
+	pmu->cpu = -1; /* chosen below for PERF_PMU_SCOPE_DEVICE */
 	pmu->name = name;
 
 	if (type >= 0)
@@ -12915,6 +13003,14 @@ int perf_pmu_register(struct pmu *_pmu, const char *name, int type)
 	INIT_LIST_HEAD(&pmu->events);
 	spin_lock_init(&pmu->events_lock);
 
+	/* Pick the initial CPU to count on */
+	if (pmu->scope == PERF_PMU_SCOPE_DEVICE) {
+		int ret = perf_pmu_set_cpu(pmu, perf_online_mask);
+
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Now that the PMU is complete, make it visible to perf_try_init_event().
 	 */
@@ -13120,7 +13216,18 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 		goto err_destroy;
 	}
 
-	if (pmu->scope != PERF_PMU_SCOPE_NONE && event->cpu >= 0) {
+	if (pmu->scope == PERF_PMU_SCOPE_DEVICE) {
+		/* A device is not per-task; its counters cannot follow one. */
+		if (event->attach_state & PERF_ATTACH_TASK) {
+			ret = -EINVAL;
+			goto err_destroy;
+		}
+
+		event->pmu_migrate_seq = READ_ONCE(pmu->migrate_seq);
+		smp_rmb(); /* pairs with the smp_wmb()s in perf_pmu_set_cpu() */
+
+		event->cpu = pmu->cpu;
+	} else if (pmu->scope != PERF_PMU_SCOPE_NONE && event->cpu >= 0) {
 		const struct cpumask *cpumask;
 		struct cpumask *pmu_cpumask;
 		int cpu;
@@ -14072,6 +14179,12 @@ SYSCALL_DEFINE5(perf_event_open,
 		}
 	}
 
+	/* The PMU may have moved since it was picked, retry if so. */
+	if (perf_event_pmu_moved(event)) {
+		err = -EBUSY;
+		goto err_locked;
+	}
+
 	if (group_leader) {
 		err = -EINVAL;
 
@@ -14369,6 +14482,12 @@ perf_event_create_kernel_counter(struct perf_event_attr *attr, int cpu,
 		}
 	}
 
+	/* The PMU may have moved since it was picked, retry if so. */
+	if (perf_event_pmu_moved(event)) {
+		err = -EBUSY;
+		goto err_pmu_ctx;
+	}
+
 	if (!exclusive_event_installable(event, ctx)) {
 		err = -EBUSY;
 		goto err_pmu_ctx;
@@ -15129,6 +15248,7 @@ static void __init perf_event_init_all_cpus(void)
 	zalloc_cpumask_var(&perf_online_cluster_mask, GFP_KERNEL);
 	zalloc_cpumask_var(&perf_online_pkg_mask, GFP_KERNEL);
 	zalloc_cpumask_var(&perf_online_sys_mask, GFP_KERNEL);
+	zalloc_cpumask_var(&perf_device_scope_mask, GFP_KERNEL);
 
 
 	for_each_possible_cpu(cpu) {
@@ -15165,6 +15285,36 @@ static void perf_swevent_init_cpu(unsigned int cpu)
 	mutex_unlock(&swhash->hlist_mutex);
 }
 
+static void perf_pmu_rebind(struct pmu *pmu)
+{
+	int ret;
+
+	/*
+	 * An empty mask legitimately happens for the last CPU in the
+	 * perf_reboot() teardown, when there is nothing left to migrate to.
+	 */
+	if (cpumask_empty(perf_online_mask))
+		return;
+
+	/* Failing to pick out of every online CPU is a PMU bug. */
+	ret = perf_pmu_set_cpu(pmu, perf_online_mask);
+	WARN_ON_ONCE(ret);
+}
+
+static void perf_pmu_rebind_all(void)
+{
+	struct pmu *pmu;
+
+	lockdep_assert_held(&pmus_lock);
+
+	list_for_each_entry(pmu, &pmus, entry) {
+		if (pmu->scope != PERF_PMU_SCOPE_DEVICE)
+			continue;
+
+		perf_pmu_rebind(pmu);
+	}
+}
+
 #if defined CONFIG_HOTPLUG_CPU || defined CONFIG_KEXEC_CORE
 static void __perf_event_exit_context(void *__info)
 {
@@ -15188,10 +15338,17 @@ static void perf_event_clear_cpumask(unsigned int cpu)
 	cpumask_clear_cpu(cpu, perf_online_mask);
 
 	for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
-		const struct cpumask *cpumask = perf_scope_cpu_topology_cpumask(scope, cpu);
-		struct cpumask *pmu_cpumask = perf_scope_cpumask(scope);
+		const struct cpumask *cpumask;
+		struct cpumask *pmu_cpumask;
 
 		target[scope] = -1;
+
+		if (scope == PERF_PMU_SCOPE_DEVICE)
+			continue;
+
+		cpumask = perf_scope_cpu_topology_cpumask(scope, cpu);
+		pmu_cpumask = perf_scope_cpumask(scope);
+
 		if (WARN_ON_ONCE(!pmu_cpumask || !cpumask))
 			continue;
 
@@ -15208,6 +15365,12 @@ static void perf_event_clear_cpumask(unsigned int cpu)
 		    WARN_ON_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE))
 			continue;
 
+		if (pmu->scope == PERF_PMU_SCOPE_DEVICE) {
+			if (pmu->cpu == (int)cpu)
+				perf_pmu_rebind(pmu);
+			continue;
+		}
+
 		if (target[pmu->scope] >= 0 && target[pmu->scope] < nr_cpu_ids)
 			perf_pmu_migrate_context(pmu, cpu, target[pmu->scope]);
 	}
@@ -15253,6 +15416,9 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 	 */
 	if (cpumask_empty(perf_online_mask)) {
 		for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
+			if (scope == PERF_PMU_SCOPE_DEVICE)
+				continue;
+
 			pmu_cpumask = perf_scope_cpumask(scope);
 			if (WARN_ON_ONCE(!pmu_cpumask))
 				continue;
@@ -15262,8 +15428,12 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 	}
 
 	for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
-		const struct cpumask *cpumask = perf_scope_cpu_topology_cpumask(scope, cpu);
+		const struct cpumask *cpumask;
+
+		if (scope == PERF_PMU_SCOPE_DEVICE)
+			continue;
 
+		cpumask = perf_scope_cpu_topology_cpumask(scope, cpu);
 		pmu_cpumask = perf_scope_cpumask(scope);
 
 		if (WARN_ON_ONCE(!pmu_cpumask || !cpumask))
@@ -15292,6 +15462,7 @@ int perf_event_init_cpu(unsigned int cpu)
 	mutex_lock(&ctx->mutex);
 	cpuctx->online = 1;
 	mutex_unlock(&ctx->mutex);
+	perf_pmu_rebind_all();
 	mutex_unlock(&pmus_lock);
 
 	return 0;
-- 
Haris Okanovic
AWS Graviton


