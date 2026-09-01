Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492C9C624D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11FIk8dcywNJhU7vX3fMrD3GTQv+b8U3zFVsgXjY8xM=; b=XpTdg/D4+xSPDOifVg/57g9Goy
	eotmIsgEUntqnPPv/Q4908M+4hJWagqp4rCwxV3Svv7rWecsN8M/YPOZ/ytCGNn7YoMFhpI9mmFLC
	ofBzKxHn1LOIW4jxtx6KRiK9AzbmVK+ogsjI5zXywA7mYVUIi//0bfTH30jBdo7JSrQSEtcV3febX
	7bAq9Peg4odJEuq6Av/7/PtHPlEgI96IiR2yC12UjwQNGFtSEZFuB7j53oOSsgJq4Tyv955zelTxx
	ZCPSIxV89T1m6TMmdoIbjr8qCZc1bN3cQvIR4jnJQ3OmkS92Q8TdzpTdtPr6jy/KNLTKrdPjXTH/J
	mPfK6UdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NfQ-0000000C7Af-0KBG;
	Tue, 01 Sep 2026 12:32:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NfP-0000000C7AX-05hy;
	Tue, 01 Sep 2026 12:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=11FIk8dcywNJhU7vX3fMrD3GTQv+b8U3zFVsgXjY8xM=; b=m3LPIu+FoN9GPmQNL+JAbX4umA
	RCUc+55B7wNBeD3QfRf+OKff006wPY1a+T19QUXMcQ8KZEi3a5TwgbOb6786lS+bW2TFXIYPIRHhE
	qRIvsbkExCXz+DP7wtsi0aHN56mVl5brXaG+jkal7C/7mYPaczD+Rl6dK7M5b3vqIeRtlPfX4Hfl/
	1LH04kzs9EHRGu7/dwrbDFrW48rrY6d1lX5LWfchOSIbd0HdayxTR9wg4Sf2mizckZ+LOabpUVMgo
	wtG/mnhCfGBbWaYhgPcFuc5AAYBFFlZ38IjafUCrsAko73fIWQLqur2GNEBKog4d2Smxl6v7uXoAA
	lF7siVdQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1NfK-0000000AwqP-2nSA;
	Tue, 01 Sep 2026 12:32:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7FE65300578; Tue, 01 Sep 2026 14:32:36 +0200 (CEST)
Date: Tue, 1 Sep 2026 14:32:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	David Stevens <stevensd@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260901123236.GA687043@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de>
 <20260828135947.GU776954@noisy.programming.kicks-ass.net>
 <20260828151018.HnR9xV1N@linutronix.de>
 <20260828150836.2d5b378c@gandalf.local.home>
 <20260828151313.5c4a5e4b@gandalf.local.home>
 <20260828151747.20035d50@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828151747.20035d50@gandalf.local.home>
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

On Fri, Aug 28, 2026 at 03:17:47PM -0400, Steven Rostedt wrote:

>   1)     8072     104   update_group_capacity+0x94/0x960
>   2)     7968     528   update_sd_lb_stats.constprop.0+0x426/0x39b0
>   3)     7440     424   sched_balance_find_src_group+0x8f/0x1150
>   4)     7016     552   sched_balance_rq+0x934/0x4130

Bah, yeah, those on-stack statistics just keep growing.

This should probably help. Very lightly tested. Also we can probably
relax the assertion to bh-disabled and avoid the extra irq-disable
around sched_balance_rq().

Anybody got time to play around with this?

---
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..0c83b0856a95 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11418,6 +11418,39 @@ struct sd_lb_stats {
 	struct sg_lb_stats local_stat;		/* Statistics of the local group */
 };
 
+struct pcpu_lb_stats {
+	struct sd_lb_stats sds;
+	struct sg_lb_stats sgs;
+	struct sg_lb_stats local_sgs;
+	struct sg_lb_stats idlest_sgs;
+};
+
+static DEFINE_PER_CPU(struct pcpu_lb_stats, pcpu_lb_stats);
+
+static inline struct sd_lb_stats *this_sds(void)
+{
+	lockdep_assert_irqs_disabled();
+	return this_cpu_ptr(&pcpu_lb_stats.sds);
+}
+
+static inline struct sg_lb_stats *this_sgs(void)
+{
+	lockdep_assert_irqs_disabled();
+	return this_cpu_ptr(&pcpu_lb_stats.sgs);
+}
+
+static inline struct sg_lb_stats *this_local_sgs(void)
+{
+	lockdep_assert_irqs_disabled();
+	return this_cpu_ptr(&pcpu_lb_stats.local_sgs);
+}
+
+static inline struct sg_lb_stats *this_idlest_sgs(void)
+{
+	lockdep_assert_irqs_disabled();
+	return this_cpu_ptr(&pcpu_lb_stats.idlest_sgs);
+}
+
 static inline void init_sd_lb_stats(struct sd_lb_stats *sds)
 {
 	/*
@@ -12406,12 +12439,13 @@ static struct sched_group *
 sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int this_cpu)
 {
 	struct sched_group *idlest = NULL, *local = NULL, *group = sd->groups;
-	struct sg_lb_stats local_sgs, tmp_sgs;
+	struct sg_lb_stats *local_sgs = this_local_sgs();
 	struct sg_lb_stats *sgs;
 	unsigned long imbalance;
-	struct sg_lb_stats idlest_sgs = {
-			.avg_load = UINT_MAX,
-			.group_type = group_overloaded,
+	struct sg_lb_stats *idlest_sgs = this_idlest_sgs();
+	*idlest_sgs = (struct sg_lb_stats){
+		.avg_load = UINT_MAX,
+		.group_type = group_overloaded,
 	};
 
 	do {
@@ -12430,17 +12464,17 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 					       sched_group_span(group));
 
 		if (local_group) {
-			sgs = &local_sgs;
+			sgs = local_sgs;
 			local = group;
 		} else {
-			sgs = &tmp_sgs;
+			sgs = this_sgs();
 		}
 
 		update_sg_wakeup_stats(sd, group, sgs, p);
 
-		if (!local_group && update_pick_idlest(idlest, &idlest_sgs, group, sgs)) {
+		if (!local_group && update_pick_idlest(idlest, idlest_sgs, group, sgs)) {
 			idlest = group;
-			idlest_sgs = *sgs;
+			*idlest_sgs = *sgs;
 		}
 
 	} while (group = group->next, group != sd->groups);
@@ -12458,17 +12492,17 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 	 * If the local group is idler than the selected idlest group
 	 * don't try and push the task.
 	 */
-	if (local_sgs.group_type < idlest_sgs.group_type)
+	if (local_sgs->group_type < idlest_sgs->group_type)
 		return NULL;
 
 	/*
 	 * If the local group is busier than the selected idlest group
 	 * try and push the task.
 	 */
-	if (local_sgs.group_type > idlest_sgs.group_type)
+	if (local_sgs->group_type > idlest_sgs->group_type)
 		return idlest;
 
-	switch (local_sgs.group_type) {
+	switch (local_sgs->group_type) {
 	case group_overloaded:
 	case group_fully_busy:
 
@@ -12486,17 +12520,17 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		 */
 
 		if ((sd->flags & SD_NUMA) &&
-		    ((idlest_sgs.avg_load + imbalance) >= local_sgs.avg_load))
+		    ((idlest_sgs->avg_load + imbalance) >= local_sgs->avg_load))
 			return NULL;
 
 		/*
 		 * If the local group is less loaded than the selected
 		 * idlest group don't try and push any tasks.
 		 */
-		if (idlest_sgs.avg_load >= (local_sgs.avg_load + imbalance))
+		if (idlest_sgs->avg_load >= (local_sgs->avg_load + imbalance))
 			return NULL;
 
-		if (100 * local_sgs.avg_load <= sd->imbalance_pct * idlest_sgs.avg_load)
+		if (100 * local_sgs->avg_load <= sd->imbalance_pct * idlest_sgs->avg_load)
 			return NULL;
 		break;
 
@@ -12545,9 +12579,9 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 				imb_numa_nr = min(w, sd->imb_numa_nr);
 			}
 
-			imbalance = abs(local_sgs.idle_cpus - idlest_sgs.idle_cpus);
+			imbalance = abs(local_sgs->idle_cpus - idlest_sgs->idle_cpus);
 			if (!adjust_numa_imbalance(imbalance,
-						   local_sgs.sum_nr_running + 1,
+						   local_sgs->sum_nr_running + 1,
 						   imb_numa_nr)) {
 				return NULL;
 			}
@@ -12560,7 +12594,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		 * up that the group has less spare capacity but finally more
 		 * idle CPUs which means more opportunity to run task.
 		 */
-		if (local_sgs.idle_cpus >= idlest_sgs.idle_cpus)
+		if (local_sgs->idle_cpus >= idlest_sgs->idle_cpus)
 			return NULL;
 		break;
 	}
@@ -12647,14 +12681,13 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 {
 	struct sched_group *sg = env->sd->groups;
 	struct sg_lb_stats *local = &sds->local_stat;
-	struct sg_lb_stats tmp_sgs;
 	unsigned long sum_util = 0;
 	bool sg_overloaded = 0, sg_overutilized = 0;
 
 	env->dst_core_idle = !sched_smt_active() || is_core_idle(env->dst_cpu);
 
 	do {
-		struct sg_lb_stats *sgs = &tmp_sgs;
+		struct sg_lb_stats *sgs = this_sgs();
 		int local_group;
 
 		local_group = cpumask_test_cpu(env->dst_cpu, sched_group_span(sg));
@@ -12929,21 +12962,21 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 {
 	struct sg_lb_stats *local, *busiest;
-	struct sd_lb_stats sds;
+	struct sd_lb_stats *sds = this_sds();
 
-	init_sd_lb_stats(&sds);
+	init_sd_lb_stats(sds);
 
 	/*
 	 * Compute the various statistics relevant for load balancing at
 	 * this level.
 	 */
-	update_sd_lb_stats(env, &sds);
+	update_sd_lb_stats(env, sds);
 
 	/* There is no busy sibling group to pull tasks from */
-	if (!sds.busiest)
+	if (!sds->busiest)
 		goto out_balanced;
 
-	busiest = &sds.busiest_stat;
+	busiest = &sds->busiest_stat;
 
 	/* Misfit tasks should be dealt with regardless of the avg load */
 	if (busiest->group_type == group_misfit_task)
@@ -12965,7 +12998,7 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	if (busiest->group_type == group_imbalanced)
 		goto force_balance;
 
-	local = &sds.local_stat;
+	local = &sds->local_stat;
 	/*
 	 * If the local group is busier than the selected busiest group
 	 * don't try and pull any tasks.
@@ -12986,14 +13019,14 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 			goto out_balanced;
 
 		/* XXX broken for overlapping NUMA groups */
-		sds.avg_load = (sds.total_load * SCHED_CAPACITY_SCALE) /
-				sds.total_capacity;
+		sds->avg_load = (sds->total_load * SCHED_CAPACITY_SCALE) /
+				sds->total_capacity;
 
 		/*
 		 * Don't pull any tasks if this group is already above the
 		 * domain average load.
 		 */
-		if (local->avg_load >= sds.avg_load)
+		if (local->avg_load >= sds->avg_load)
 			goto out_balanced;
 
 		/*
@@ -13009,9 +13042,9 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	 * Try to move all excess tasks to a sibling domain of the busiest
 	 * group's child domain.
 	 */
-	if (sds.prefer_sibling && local->group_type == group_has_spare &&
+	if (sds->prefer_sibling && local->group_type == group_has_spare &&
 	    (busiest->group_type == group_llc_balance ||
-	    sibling_imbalance(env, &sds, busiest, local) > 1))
+	    sibling_imbalance(env, sds, busiest, local) > 1))
 		goto force_balance;
 
 	if (busiest->group_type != group_overloaded) {
@@ -13025,7 +13058,7 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 		}
 
 		if (busiest->group_type == group_smt_balance &&
-		    smt_vs_nonsmt_groups(sds.local, sds.busiest)) {
+		    smt_vs_nonsmt_groups(sds->local, sds->busiest)) {
 			/* Let non SMT CPU pull from SMT CPU sharing with sibling */
 			goto force_balance;
 		}
@@ -13054,8 +13087,8 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 
 force_balance:
 	/* Looks like there is an imbalance. Compute it */
-	calculate_imbalance(env, &sds);
-	return env->imbalance ? sds.busiest : NULL;
+	calculate_imbalance(env, sds);
+	return env->imbalance ? sds->busiest : NULL;
 
 out_balanced:
 	env->imbalance = 0;
@@ -13958,6 +13991,7 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 
 		interval = get_sd_balance_interval(sd, busy);
 		if (time_after_eq(jiffies, sd->last_balance + interval)) {
+			guard(irqsave)();
 			if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
 				/*
 				 * The LBF_DST_PINNED logic could have changed

