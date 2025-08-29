Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788AFCA1000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNXISkJyOJoiv9PkNpwLkkdnwYL06Cpr9xN/5puGNO8=; b=Q3RaVThsUQSx/AzEEe7+aQ3gpO
	7iWLDqo1WM+EQYjRlqEhe6XHO988pYnaRkMFgbhVMjL4M7wIOx9+g/HYYVVtZ3fI5nWK+X46I6Yj2
	98O1m6b36LL6YhU0LzzeHEr7/teRcqkuOUOWNms/k7wWUkYVyBYgJ8y/9nspe2iSSwW/MsKZ1ZHhh
	hYud7vQ9RejJDacapetC1P8APZYIDHQKEWhi8pTqajTJZnG26rmltN0t0wwp0DmK4ZjQHWXId5BmD
	wcBRPA16v8v/ugMcms/K/bdk53bQRZ/047jrx6Osx1lSj3MmUs/mktgmmfIOOABpB4QKfCRCng4H+
	xJE56DKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4tR-00000006l8s-00X9;
	Fri, 29 Aug 2025 19:36:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1MC-00000006ICw-3e5i
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 15:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bNXISkJyOJoiv9PkNpwLkkdnwYL06Cpr9xN/5puGNO8=; b=aZCoa6ujOEFSWcjYZbrkIjX+y2
	t0LIaE3F7BpGDFGCpvFfVxd8ln9RWcel5XY9wyIRmAV8uvT1mflShwkOpuLNVvxHIHOptzonGsCn9
	jDwaEHZxgYGMWJ+yygjYnBWFwHvdxaOW1Xb/0RaY+QGqJ3unsO9P2KKFw7gSvHkgJIG1AQbQbCq55
	xI/HPFuZOcvadyL1zWC7yc6XPPdRc1nYsQMTg0KJparYLaSF+fnl/4mHnZ9pk/E/T3fMPDoQNRBGh
	1mbdv44lglCayH38XAOQl7HSMgH/Tu46LMmuAWJwTKWmA5sHD2msCeq4uiGyN4LnSMgzjoaMZNEXG
	7/v3xiIA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1M9-00000003CUH-2id6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:49:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 590A444D96;
	Fri, 29 Aug 2025 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C8FC4CEF5;
	Fri, 29 Aug 2025 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756482576;
	bh=QmHeJLzWp0BmqCz+ztUiz8/RmLhDblGFFLV72Ii4meA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Onb0u1kZ3slfgnN8k1ly/s8A1GZzWzaV5YsJT04FaL2a7EmkG7WZ3lbDCaky2ngSN
	 o7ZF3jsOYN4lEWAMdZtfl0JFKyx5fSrKh4x2mYeE/HmmZuBEQpy85BLaG5wwrcd11s
	 h+wKTCtCEIlEU1wdg/jgRKM6OzrTUVBdKR/hCp6OR3R2751odueFoposm69H7XAj9K
	 RD6i4peSxwqffTswmTtIGkiV+4LKuDy4XriHKU7lqZ+7AKXlG0mEpLrcR908qdK4uo
	 M6A55zOpjr50gyZPvKHra5/tNlZAXcm6JqjbQOPgOIMQVxJnTF1Db4TOV5sp48ZXaq
	 de/A2kTsqqemA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 27/33] sched/arm64: Move fallback task cpumask to HK_TYPE_DOMAIN
Date: Fri, 29 Aug 2025 17:48:08 +0200
Message-ID: <20250829154814.47015-28-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829154814.47015-1-frederic@kernel.org>
References: <20250829154814.47015-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_164938_260656_EAD6E92A 
X-CRM114-Status: GOOD (  19.57  )
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

When none of the allowed CPUs of a task are online, it gets migrated
to the fallback cpumask which is all the non nohz_full CPUs.

However just like nohz_full CPUs, domain isolated CPUs don't want to be
disturbed by tasks that have lost their CPU affinities.

And since nohz_full rely on domain isolation to work correctly, the
housekeeping mask of domain isolated CPUs is always a subset of the
housekeeping mask of nohz_full CPUs (there can be CPUs that are domain
isolated but not nohz_full, OTOH there can't be nohz_full CPUs that are
not domain isolated):

	HK_TYPE_DOMAIN & HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN

Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
tasks and since this cpumask can be modified at runtime, make sure
that 32 bits support CPUs on ARM64 mismatched systems are not isolated
by cpusets.

CC: linux-arm-kernel@lists.infradead.org
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 18 ++++++++++++---
 include/linux/cpu.h            |  4 ++++
 kernel/cgroup/cpuset.c         | 40 +++++++++++++++++++++++-----------
 3 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9ad065f15f1d..38046489d2ea 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1653,6 +1653,18 @@ has_cpuid_feature(const struct arm64_cpu_capabilities *entry, int scope)
 	return feature_matches(val, entry);
 }
 
+/*
+ * 32 bits support CPUs can't be isolated because tasks may be
+ * arbitrarily affine to them, defeating the purpose of isolation.
+ */
+bool arch_isolated_cpus_can_update(struct cpumask *new_cpus)
+{
+	if (static_branch_unlikely(&arm64_mismatched_32bit_el0))
+		return !cpumask_intersects(cpu_32bit_el0_mask, new_cpus);
+	else
+		return true;
+}
+
 const struct cpumask *system_32bit_el0_cpumask(void)
 {
 	if (!system_supports_32bit_el0())
@@ -1666,7 +1678,7 @@ const struct cpumask *system_32bit_el0_cpumask(void)
 
 const struct cpumask *task_cpu_fallback_mask(struct task_struct *p)
 {
-	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_TICK));
+	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_DOMAIN));
 }
 
 static int __init parse_32bit_el0_param(char *str)
@@ -3963,8 +3975,8 @@ static int enable_mismatched_32bit_el0(unsigned int cpu)
 	bool cpu_32bit = false;
 
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
-		if (!housekeeping_cpu(cpu, HK_TYPE_TICK))
-			pr_info("Treating adaptive-ticks CPU %u as 64-bit only\n", cpu);
+		if (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN))
+			pr_info("Treating domain isolated CPU %u as 64-bit only\n", cpu);
 		else
 			cpu_32bit = true;
 	}
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index b91b993f58ee..8bb239080534 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -228,4 +228,8 @@ static inline bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
 #define smt_mitigations SMT_MITIGATIONS_OFF
 #endif
 
+struct cpumask;
+
+bool arch_isolated_cpus_can_update(struct cpumask *new_cpus);
+
 #endif /* _LINUX_CPU_H_ */
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 8260dd699fd8..cf99ea844c1d 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1352,33 +1352,47 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
 	return isolcpus_updated;
 }
 
+bool __weak arch_isolated_cpus_can_update(struct cpumask *new_cpus)
+{
+	return true;
+}
+
 /*
- * isolcpus_nohz_conflict - check for isolated & nohz_full conflicts
+ * isolated_cpus_can_update - check for conflicts against housekeeping and
+ *                            CPUs capabilities.
  * @new_cpus: cpu mask for cpus that are going to be isolated
- * Return: true if there is conflict, false otherwise
+ * Return: true if there no conflict, false otherwise
  *
- * If nohz_full is enabled and we have isolated CPUs, their combination must
- * still leave housekeeping CPUs.
+ * Check for conflicts:
+ * - If nohz_full is enabled and there are isolated CPUs, their combination must
+ *   still leave housekeeping CPUs.
+ * - Architecture has CPU capabilities incompatible with being isolated
  */
-static bool isolcpus_nohz_conflict(struct cpumask *new_cpus)
+static bool isolated_cpus_can_update(struct cpumask *new_cpus)
 {
 	cpumask_var_t full_hk_cpus;
-	int res = false;
+	bool res;
+
+	if (!arch_isolated_cpus_can_update(new_cpus))
+		return false;
 
 	if (!housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
-		return false;
+		return true;
 
 	if (!alloc_cpumask_var(&full_hk_cpus, GFP_KERNEL))
-		return true;
+		return false;
+
+	res = true;
 
 	cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
 		    housekeeping_cpumask(HK_TYPE_DOMAIN));
 	cpumask_andnot(full_hk_cpus, full_hk_cpus, isolated_cpus);
 	cpumask_and(full_hk_cpus, full_hk_cpus, cpu_online_mask);
 	if (!cpumask_weight_andnot(full_hk_cpus, new_cpus))
-		res = true;
+		res = false;
 
 	free_cpumask_var(full_hk_cpus);
+
 	return res;
 }
 
@@ -1497,7 +1511,7 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 	    cpumask_subset(top_cpuset.effective_cpus, tmp->new_cpus))
 		return PERR_INVCPUS;
 	if (isolated_cpus_should_update(new_prs, NULL) &&
-	    isolcpus_nohz_conflict(tmp->new_cpus))
+	    !isolated_cpus_can_update(tmp->new_cpus))
 		return PERR_HKEEPING;
 
 	spin_lock_irq(&callback_lock);
@@ -1599,7 +1613,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 			 cpumask_subset(top_cpuset.effective_cpus, tmp->addmask))
 			cs->prs_err = PERR_NOCPUS;
 		else if (isolated_cpus_should_update(prs, NULL) &&
-			 isolcpus_nohz_conflict(tmp->addmask))
+			 !isolated_cpus_can_update(tmp->addmask))
 			cs->prs_err = PERR_HKEEPING;
 		if (cs->prs_err)
 			goto invalidate;
@@ -1954,7 +1968,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 	}
 
 	if (deleting && isolated_cpus_should_update(new_prs, parent) &&
-	    isolcpus_nohz_conflict(tmp->delmask)) {
+	    !isolated_cpus_can_update(tmp->delmask)) {
 		cs->prs_err = PERR_HKEEPING;
 		return PERR_HKEEPING;
 	}
@@ -2979,7 +2993,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 		 * Need to update isolated_cpus.
 		 */
 		isolcpus_updated = true;
-		if (isolcpus_nohz_conflict(cs->effective_xcpus))
+		if (!isolated_cpus_can_update(cs->effective_xcpus))
 			err = PERR_HKEEPING;
 	} else {
 		/*
-- 
2.51.0


