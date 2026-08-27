Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42976C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DF4cMpT7HMhXRKSc173deaVgeyoN8RCgYF4bsP8Paw0=; b=g3HRgQpLJ+EqiELE5J9fQh6yZ2
	MJTYNCxme2aQPSJhXzQiq4HsiLzzcPPqdVX78xaTlHhW8sCs0PWEJsFlKyn1+HScjEyl1b8gk6LfU
	LH1LpLw7iirugKGZj0Nr1llWhPZtNb4+jDU3FEAS/HLM9TSneXqt2+3NP0ImE5KhwTHiZeRwIua5Z
	35ZWUW1H1/8EaE+LithM5cHRW6iC0imSTcOtJuKw9FA+YqEAKe3q8j6iqci3EoA6uflFyk2ZhM5a6
	iujf1RVbDMppkvi/copRiXSNgvE9aTwFdTWr/zz6qQ0we6VvmD54ZNGuv8rXc1e2VMOG7O2iDK47d
	Fbu7xq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZn-00000004uRm-27mh;
	Thu, 27 Aug 2026 23:32:07 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZL-00000004u8S-1Yol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:31:43 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso702902a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873490; x=1788478290; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DF4cMpT7HMhXRKSc173deaVgeyoN8RCgYF4bsP8Paw0=;
        b=MgvlA8ozHdpyqmJxpe664kuPUepG0vmYPKbvSptXqitIcyT2BTYmZrMfqNotNj0Pb5
         7M6/BhcNDg0taD63k1lao5KncZxz6sNRegGzngh8FXrwJT2Bapa3acwMbJQIDULCRrb4
         evJ/1k+tixphpwvojmHTYZxiIqKVU4whoRJW0e8hGocZegOLq2PxJ2Cb1RiOAhSCPc0K
         3UI0vkoaI1XGIi71neUkCcBDwC1+MhIJ7SUjhnYCZPO08855xXHerHu+S40FU7od1hl1
         CrMTLRpAN6ZgXH6fh54AgLObuxOtfIBLI+rX6Q2t7X2McG0UXn7qW6YsDLZDIiWqhd63
         p2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873490; x=1788478290;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DF4cMpT7HMhXRKSc173deaVgeyoN8RCgYF4bsP8Paw0=;
        b=HeFQiNZcBNdCl3FQMXVhLMbFXq+mi0eMIRu31ingdP4tcJ4q5wWlBV/4Vw20KyFsRk
         JsntY9t/KCSxTXzBc7ZBV/RbtoyFCOHGApZ7lNOeylT2ww60xnPZRcaMbZg7kFVhAEDL
         eup14RLuLicikNeOGr7DPNugBYc9AdyF0N7EubEoOIxxHIMVDmmqh1H3eH5R4Su4eg8P
         hS9+3dg04HpR9yH/Msvn+IoK/c9HujdtHZsqi37s3rsdBrvobFDg2aWy8zl0gjMmUyP8
         KUTfjHDJiOt+t54ROdLXwlmewTrFzF+aqRmpgkKEbQ9JauNGcN+dB0ImcG7nUW6JnaZR
         CVqQ==
X-Forwarded-Encrypted: i=1; AHgh+Roobfg9J7SVKonWuXCdM58q2Ao4+qIXBLi6k2IJJygD/ChsHemPjkFRqrINNCWHJbUJYtVM+t9RXkYrmdxH06tO@lists.infradead.org
X-Gm-Message-State: AFuF++kDV07VPauQqzIX7ou/ddoAVDYToTaneLuHfeN5drOi0bIvIJ9w
	wTqVhW9f5iwTov+h3Y9BBs7rOHe0J1Dg+qm6T4SFw+CEn2q1aVFuIrezPZ9VMx1zg4mVU6eC+dV
	MeZJWVINcNmvgcA==
X-Received: from dlbdx3.prod.google.com ([2002:a05:7022:e03:b0:141:59a4:247a])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-396d0e27e11mr5441676a91.1.1787873490274;
 Thu, 27 Aug 2026 16:31:30 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:45 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-8-stevensd@google.com>
Subject: [RFC 07/10] Reclaim stacks via a shrinker
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_163140_189524_3BC82805 
X-CRM114-Status: GOOD (  30.36  )
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

Use a shrinker to reclaim unused portions of blocked task stacks. The
core of the shrinker is a list_lru. A referenced bit is used to require
that a stack remains unused for long enough to be seen by the shrinker
twice.

To minimize how much work is done in the scheduler path and under the
pi_lock, tasks are initially put onto a regular list before being moved
onto the list_lru by a shrinker. Additionally, tasks are not proactively
removed from the lru when they become unblocked - again, to reduce what
happens in the scheduler path.

Signed-off-by: David Stevens <stevensd@google.com>
---
 include/linux/sched.h   |  13 +-
 kernel/stack_shrinker.c | 400 ++++++++++++++++++++++++++++++++++------
 2 files changed, 357 insertions(+), 56 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index c93a234fac96..dc241d1c058f 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -83,7 +83,6 @@ struct sched_dl_entity;
 struct seq_file;
 struct sighand_struct;
 struct signal_struct;
-struct stack_reclaim_work;
 struct task_delay_info;
 struct task_exec_state;
 struct task_group;
@@ -835,9 +834,17 @@ enum stack_reclaim_enum {
 	STACK_RECLAIMED		= 5,
 } __packed;
 
+enum stack_reclaim_lru_state_enum {
+	STACK_LRU_NOT_PRESENT	= 0,
+	STACK_LRU_PENDING	= 1,
+	STACK_LRU_NEW		= 2,
+	STACK_LRU_OLD		= 3,
+} __packed;
+
 union stack_reclaim_state {
 	struct {
 		enum stack_reclaim_enum stack_state;
+		enum stack_reclaim_lru_state_enum lru_state;
 		u16 node;
 	};
 	u32 val;
@@ -845,6 +852,7 @@ union stack_reclaim_state {
 
 union stack_reclaim_list {
 	struct llist_node refill_entry;
+	struct list_head reclaim_entry;
 };
 #endif
 
@@ -1618,9 +1626,6 @@ struct task_struct {
 #ifdef CONFIG_MEMCG
 	struct obj_cgroup		*stack_obj_cgroup;
 #endif
-
-	// TODO: Replace these with a shrinker
-	struct stack_reclaim_work	*stack_reclaim_work;
 #endif
 #endif
 #ifdef CONFIG_THREAD_INFO_IN_TASK
diff --git a/kernel/stack_shrinker.c b/kernel/stack_shrinker.c
index d7b1a7dfa716..62cc5303d69b 100644
--- a/kernel/stack_shrinker.c
+++ b/kernel/stack_shrinker.c
@@ -26,28 +26,41 @@ struct repopulate_work {
 
 static DEFINE_PER_CPU(struct repopulate_work, repopulate_work);
 
-// TODO: replace with shrinker
-struct stack_reclaim_work {
-	struct task_struct *tsk;
-	struct irq_work irq_work;
-	struct work_struct work;
-};
+static DEFINE_RAW_SPINLOCK(new_reclaimable_stacks_lock);
+static LIST_HEAD(new_reclaimable_stacks);
 
-static void schedule_stack_reclaim_work(struct irq_work *w)
-{
-	struct stack_reclaim_work *work = container_of(w, typeof(*work), irq_work);
+static struct list_lru reclaimable_stacks_lru;
 
-	if (!queue_work(system_wq, &work->work))
-		put_task_struct(work->tsk);
-}
+/*
+ * do_shrink_slab() wants us to scan (nr_obj / (1 << priority)), but unless
+ * reclaim is really struggling, that can round down to 0 for a lot of
+ * memcgs. Compensate for that by scaling count and batch size.
+ */
+#define STACK_COUNT_SHIFT DEF_PRIORITY
+/*
+ * Large batch sizes (like the 128 default) can result in spiky behavior, where
+ * deferred work acculmulates and then all of a memcg's stacks get scanned all
+ * at once.
+ */
+#define STACK_BATCH_SIZE 4
 
-static void do_reclaim_stack(struct task_struct *tsk);
+/*
+ * For purposes of shrinker iteration, a stack allocated with NUMA_NO_NODE is
+ * associated with the node that created it. This extra bit allows us to
+ * determine if NUMA_NO_NODE or the saved node should be used for repopulation.
+ */
+#define TASK_NUMA_NO_NODE_FLAG BIT(15)
 
-static void do_stack_reclaim_work(struct work_struct *w)
+static int task_shrinker_node(struct task_struct *tsk)
 {
-	struct task_struct *tsk = container_of(w, struct stack_reclaim_work, work)->tsk;
+	return tsk->stack_reclaim_state.node & ~TASK_NUMA_NO_NODE_FLAG;
+}
 
-	do_reclaim_stack(tsk);
+static int task_alloc_node(struct task_struct *tsk)
+{
+	if (tsk->stack_reclaim_state.node & TASK_NUMA_NO_NODE_FLAG)
+		return NUMA_NO_NODE;
+	return tsk->stack_reclaim_state.node;
 }
 
 #ifdef CONFIG_MEMCG
@@ -85,17 +98,13 @@ void add_to_stack_shrinker(struct task_struct *tsk, int node)
 
 	tsk->stack_reclaim_state.val = 0;
 	tsk->stack_reclaim_state.stack_state = STACK_IN_USE;
-	tsk->stack_reclaim_state.node = node;
+	tsk->stack_reclaim_state.lru_state = STACK_LRU_NOT_PRESENT;
 	set_stack_obj_cgroup(tsk);
-	init_llist_node(&tsk->stack_reclaim_list.refill_entry);
+	INIT_LIST_HEAD(&tsk->stack_reclaim_list.reclaim_entry);
 
-	// TODO: replace with shrinker
-	tsk->stack_reclaim_work = kmalloc_obj(*tsk->stack_reclaim_work, GFP_KERNEL);
-	BUG_ON(!tsk->stack_reclaim_work);
-
-	tsk->stack_reclaim_work->tsk = tsk;
-	init_irq_work(&tsk->stack_reclaim_work->irq_work, schedule_stack_reclaim_work);
-	INIT_WORK(&tsk->stack_reclaim_work->work, do_stack_reclaim_work);
+	if (node == NUMA_NO_NODE)
+		node = numa_node_id() | TASK_NUMA_NO_NODE_FLAG;
+	tsk->stack_reclaim_state.node = node;
 }
 
 static inline int calculate_num_unused_pages(struct task_struct *tsk)
@@ -118,8 +127,7 @@ static bool repopulate_stack(struct task_struct *tsk, bool is_deferred,
 	struct vm_struct *vm_area = tsk->stack_vm_area;
 	unsigned long addr = (unsigned long)vm_area->addr;
 	struct mem_cgroup *tsk_memcg, *old_active_memcg;
-	int node = tsk->stack_reclaim_state.node == U16_MAX ? NUMA_NO_NODE
-							    : tsk->stack_reclaim_state.node;
+	int node = task_alloc_node(tsk);
 
 	num_missing_pages = (THREAD_SIZE >> PAGE_SHIFT) - vm_area->nr_pages;
 	if (num_missing_pages == 0)
@@ -239,21 +247,6 @@ static void do_reclaim_stack(struct task_struct *tsk)
 {
 	union stack_reclaim_state prev_state, target_state;
 
-	prev_state.val = READ_ONCE(tsk->stack_reclaim_state.val);
-	do {
-		target_state.val = prev_state.val;
-		if (prev_state.stack_state == STACK_RECLAIMABLE)
-			target_state.stack_state = STACK_RECLAIMING;
-	} while (!try_cmpxchg(&tsk->stack_reclaim_state.val, &prev_state.val, target_state.val));
-
-	/*
-	 * If target_state.stack_state == STACK_RECLAIMING, we know tsk is still
-	 * alive and can't run until we're done, so putting the ref here is safe.
-	 */
-	put_task_struct(tsk);
-	if (target_state.stack_state != STACK_RECLAIMING)
-		return;
-
 	release_stack(tsk);
 
 	prev_state.val = READ_ONCE(tsk->stack_reclaim_state.val);
@@ -271,6 +264,245 @@ static void do_reclaim_stack(struct task_struct *tsk)
 	}
 }
 
+static void process_one_new_reclaimable_stack(struct task_struct *tsk, struct list_head *new_stacks)
+{
+	union stack_reclaim_state prev_state, target_state;
+
+	prev_state.val = READ_ONCE(tsk->stack_reclaim_state.val);
+	do {
+		target_state.val = prev_state.val;
+
+		switch (prev_state.stack_state) {
+		case STACK_IN_USE:
+		case STACK_PREPARE_RECLAIM:
+			target_state.lru_state = STACK_LRU_NOT_PRESENT;
+			break;
+		case STACK_RECLAIMABLE:
+			target_state.lru_state = STACK_LRU_NEW;
+			break;
+		case STACK_RECLAIMING:
+		case STACK_RECLAIMING_IN_USE:
+		case STACK_RECLAIMED:
+			/*
+			 * These states only happen after a shrinker has started
+			 * processing a stack, so seeing one of these means
+			 * multiple shrinkers are somehow targeting one stack.
+			 */
+			WARN(1, "task with stack state %x on list\n", prev_state.val);
+			put_task_struct(tsk);
+			return;
+		}
+	} while (!try_cmpxchg(&tsk->stack_reclaim_state.val, &prev_state.val, target_state.val));
+
+	if (target_state.stack_state == STACK_RECLAIMABLE)
+		list_add(&tsk->stack_reclaim_list.reclaim_entry, new_stacks);
+	else
+		put_task_struct(tsk);
+}
+
+static void process_new_reclaimable_stacks(void)
+{
+	LIST_HEAD(new_stacks);
+	struct task_struct *tsk, *tmp;
+
+	scoped_guard(raw_spinlock_irq, &new_reclaimable_stacks_lock) {
+		while ((tsk = list_first_entry_or_null(&new_reclaimable_stacks,
+						       typeof(*tsk),
+						       stack_reclaim_list.reclaim_entry))) {
+			list_del_init(&tsk->stack_reclaim_list.reclaim_entry);
+
+			/*
+			 * We hold a ref on the task during the interval when a
+			 * stack is being moved from new_reclaimable_stacks
+			 * onto the lru, to avoid needing to deal with races
+			 * against remove_from_stack_shrinker(). If tryget
+			 * fails here, tsk is about to be deleted, so we can
+			 * just skip it.
+			 */
+			if (!tryget_task_struct(tsk))
+				continue;
+
+			raw_spin_unlock_irq(&new_reclaimable_stacks_lock);
+
+			process_one_new_reclaimable_stack(tsk, &new_stacks);
+
+			raw_spin_lock_irq(&new_reclaimable_stacks_lock);
+		}
+	}
+
+	list_for_each_entry_safe(tsk, tmp, &new_stacks, stack_reclaim_list.reclaim_entry) {
+		struct mem_cgroup *memcg = get_stack_memcg(tsk);
+
+		list_del_init(&tsk->stack_reclaim_list.reclaim_entry);
+
+		if (memcg_list_lru_alloc(memcg, &reclaimable_stacks_lru, GFP_ATOMIC) == 0) {
+			local_bh_disable();
+			list_lru_add(&reclaimable_stacks_lru,
+				     &tsk->stack_reclaim_list.reclaim_entry,
+				     task_shrinker_node(tsk), memcg);
+			local_bh_enable();
+		} else {
+			union stack_reclaim_state prev_state, target_state;
+
+			pr_warn_ratelimited("failed to allocate stack reclaim metadata\n");
+
+			/*
+			 * Just give up if memcg_list_lru_alloc() fails. We
+			 * could try immediately reclaiming the stack, but
+			 * reclaiming a single stack isn't going to help if
+			 * things are so bad a GFP_ATOMIC slab allocation fails.
+			 */
+			prev_state.val = READ_ONCE(tsk->stack_reclaim_state.val);
+			do {
+				target_state.val = prev_state.val;
+				if (prev_state.stack_state == STACK_RECLAIMABLE)
+					target_state.stack_state = STACK_RECLAIMED;
+				target_state.lru_state = STACK_LRU_NOT_PRESENT;
+			} while (!try_cmpxchg(&tsk->stack_reclaim_state.val,
+					      &prev_state.val, target_state.val));
+		}
+
+		mem_cgroup_put(memcg);
+		put_task_struct(tsk);
+	}
+}
+
+static enum lru_status isolate_lru_stack(struct list_head *item,
+					 struct list_lru_one *lru, void *arg)
+{
+	struct list_head *to_reclaim = arg;
+	struct task_struct *tsk = container_of(item, struct task_struct,
+					       stack_reclaim_list.reclaim_entry);
+	union stack_reclaim_state prev_state, target_state;
+	enum lru_status ret;
+	bool is_isolated = false;
+
+	prev_state.val = READ_ONCE(tsk->stack_reclaim_state.val);
+	do {
+		target_state.val = prev_state.val;
+
+		switch (prev_state.stack_state) {
+		case STACK_IN_USE:
+		case STACK_PREPARE_RECLAIM:
+			target_state.lru_state = STACK_LRU_NOT_PRESENT;
+			ret = LRU_REMOVED;
+			break;
+		case STACK_RECLAIMABLE:
+			switch (prev_state.lru_state) {
+			case STACK_LRU_NEW:
+				target_state.lru_state = STACK_LRU_OLD;
+				ret = LRU_ROTATE;
+				break;
+			case STACK_LRU_OLD:
+				target_state.stack_state = STACK_RECLAIMING;
+				target_state.lru_state = STACK_LRU_NOT_PRESENT;
+				ret = LRU_REMOVED;
+				break;
+			case STACK_LRU_NOT_PRESENT:
+			case STACK_LRU_PENDING:
+				WARN(1, "item on stack reclaim lru with bad state\n");
+				list_lru_isolate(lru, item);
+				return LRU_REMOVED;
+			}
+			break;
+		case STACK_RECLAIMING:
+		case STACK_RECLAIMING_IN_USE:
+		case STACK_RECLAIMED:
+			/*
+			 * These states only happen after a shrinker has started
+			 * processing a stack, so seeing one of these means
+			 * multiple shrinkers are somehow targeting one stack.
+			 */
+			WARN(1, "stack with state %x on list\n", prev_state.val);
+			list_lru_isolate(lru, item);
+			return LRU_REMOVED;
+		}
+
+		/*
+		 * We need to isolate the item before the cmpxchg to prevent
+		 * races with process_one_new_reclaimable_stack() adding the
+		 * entry to its new_stacks list.
+		 */
+		if (ret == LRU_REMOVED && !is_isolated) {
+			is_isolated = true;
+			list_lru_isolate(lru, item);
+		}
+	} while (!try_cmpxchg(&tsk->stack_reclaim_state.val, &prev_state.val, target_state.val));
+
+	if (target_state.stack_state == STACK_RECLAIMING) {
+		/*
+		 * The task can't be freed since STACK_RECLAIMING prevents
+		 * it from running and exiting, so no need to hold a ref.
+		 */
+		list_add_tail(item, to_reclaim);
+	} else if (target_state.stack_state == STACK_RECLAIMABLE) {
+		/*
+		 * If we isolated but then lost a cmpxchg race against
+		 * __allow_stack_reclaim(), we need to undo the isolation.
+		 *
+		 * STACK_RECLAIMABLE means we observed the task blocked (i.e.
+		 * not dead). Even if the task dies and its refcount hits zero,
+		 * RCU cleanup of the task will be delayed because the lru walk
+		 * is guarded by local_bh_disable(), so unlocking won't cause
+		 * races with remove_from_stack_shrinker().
+		 */
+		if (is_isolated) {
+			struct mem_cgroup *lru_memcg;
+
+			spin_unlock(&lru->lock);
+
+			lru_memcg = get_stack_memcg(tsk);
+			list_lru_add(&reclaimable_stacks_lru, item,
+				     task_shrinker_node(tsk), lru_memcg);
+			mem_cgroup_put(lru_memcg);
+
+			ret = LRU_REMOVED_RETRY;
+
+		} else {
+			WARN(target_state.lru_state != STACK_LRU_OLD,
+			     "Reclaimable stack with bad state %x\n", target_state.val);
+		}
+	} else {
+		WARN(target_state.lru_state != STACK_LRU_NOT_PRESENT,
+		     "Isolate stack with bad state %x\n", target_state.val);
+	}
+
+	return ret;
+}
+
+static unsigned long scan_reclaimable_stacks(struct shrinker *shrinker,
+					     struct shrink_control *sc)
+{
+	unsigned long freed = 0;
+	LIST_HEAD(to_reclaim);
+	struct task_struct *tsk, *tmp;
+
+	sc->nr_to_scan >>= STACK_COUNT_SHIFT;
+	local_bh_disable();
+	list_lru_shrink_walk(&reclaimable_stacks_lru, sc,
+			     isolate_lru_stack, &to_reclaim);
+	local_bh_enable();
+
+	list_for_each_entry_safe(tsk, tmp, &to_reclaim, stack_reclaim_list.reclaim_entry) {
+		freed++;
+		list_del_init(&tsk->stack_reclaim_list.reclaim_entry);
+		do_reclaim_stack(tsk);
+	}
+
+	return freed << STACK_COUNT_SHIFT;
+}
+
+static unsigned long get_reclaimable_stack_count(struct shrinker *shrinker,
+						 struct shrink_control *sc)
+{
+	unsigned long count;
+
+	process_new_reclaimable_stacks();
+	count = list_lru_shrink_count(&reclaimable_stacks_lru, sc);
+
+	return count ? (unsigned long)(count << STACK_COUNT_SHIFT) : SHRINK_EMPTY;
+}
+
 static void do_repopulate_stacks(struct work_struct *w)
 {
 	struct repopulate_work *work = container_of(w, struct repopulate_work, work);
@@ -285,7 +517,7 @@ static void do_repopulate_stacks(struct work_struct *w)
 				wake_up_state(tsk, TASK_STACK_RECLAIM);
 			} else {
 				/*
-				 * Repopulate only failes due to low memory. If
+				 * Repopulate only fails due to low memory. If
 				 * that happens, give the rest of the system a
 				 * chance to free some memory.
 				 */
@@ -387,6 +619,7 @@ void __prepare_stack_for_reclaim(struct task_struct *tsk)
 void __allow_stack_reclaim(struct task_struct *tsk)
 {
 	union stack_reclaim_state prev_state, target_state;
+	bool add_to_list = false;
 
 	if (WARN_ON_ONCE(tsk->__state == TASK_DEAD))
 		return;
@@ -401,14 +634,17 @@ void __allow_stack_reclaim(struct task_struct *tsk)
 			return;
 		}
 		target_state.stack_state = STACK_RECLAIMABLE;
+		if (prev_state.lru_state == STACK_LRU_NOT_PRESENT) {
+			target_state.lru_state = STACK_LRU_PENDING;
+			add_to_list = true;
+		} else if (prev_state.lru_state == STACK_LRU_OLD) {
+			target_state.lru_state = STACK_LRU_NEW;
+		}
 	} while (!try_cmpxchg(&tsk->stack_reclaim_state.val, &prev_state.val, target_state.val));
 
-	if (irq_work_queue(&tsk->stack_reclaim_work->irq_work)) {
-		/*
-		 * Take a ref that gets released by do_reclaim_stack() so we don't
-		 * have to worry about races with remove_from_stack_shrinker().
-		 */
-		get_task_struct(tsk);
+	if (add_to_list) {
+		guard(raw_spinlock_irqsave)(&new_reclaimable_stacks_lock);
+		list_add(&tsk->stack_reclaim_list.reclaim_entry, &new_reclaimable_stacks);
 	}
 }
 
@@ -421,8 +657,34 @@ void __allow_stack_reclaim(struct task_struct *tsk)
  */
 void remove_from_stack_shrinker(struct task_struct *tsk)
 {
+	struct mem_cgroup *lru_memcg;
+
+	/*
+	 * Since tsk is being deleted, the tryget_task_struct() call in
+	 * process_new_reclaimable_stacks() excludes racing with a shrinker
+	 * moving the task from STACK_LRU_PENDING -> STACK_LRU_NEW. A race can
+	 * just result in the delete operation being a no-op.
+	 */
+	switch (READ_ONCE(tsk->stack_reclaim_state.lru_state)) {
+	case STACK_LRU_NOT_PRESENT:
+		break;
+	case STACK_LRU_PENDING:
+		scoped_guard(raw_spinlock_irqsave, &new_reclaimable_stacks_lock) {
+			if (!list_empty(&tsk->stack_reclaim_list.reclaim_entry))
+				list_del_init(&tsk->stack_reclaim_list.reclaim_entry);
+		}
+		break;
+	case STACK_LRU_NEW:
+	case STACK_LRU_OLD:
+		lru_memcg = get_stack_memcg(tsk);
+		local_bh_disable();
+		list_lru_del(&reclaimable_stacks_lru, &tsk->stack_reclaim_list.reclaim_entry,
+			     task_shrinker_node(tsk), lru_memcg);
+		local_bh_enable();
+		mem_cgroup_put(lru_memcg);
+		break;
+	}
 	put_stack_obj_cgroup(tsk);
-	kfree(tsk->stack_reclaim_work);
 }
 
 void wake_stack_repopulate(void)
@@ -431,6 +693,8 @@ void wake_stack_repopulate(void)
 	preempt_enable();
 }
 
+static struct lock_class_key stack_shrinker_key;
+
 static int stack_shrinker_cpuhp_setup(unsigned int cpu)
 {
 	struct repopulate_work *work = per_cpu_ptr(&repopulate_work, cpu);
@@ -448,16 +712,48 @@ static int stack_shrinker_cpuhp_teardown(unsigned int cpu)
 
 static int __init fork_late_init(void)
 {
+	struct shrinker *shrinker;
+	const char *msg;
 	int ret;
+	enum cpuhp_state cpuhp_val;
 
 	ret = cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "stack_shrinker",
 				stack_shrinker_cpuhp_setup,
 				stack_shrinker_cpuhp_teardown);
 	if (ret < 0) {
-		WARN(1, "Failed to initialize stack_shrinker cpuhp %d\n", ret);
-		return 0;
+		msg = "cpuhp failure";
+		goto cpuhp_setup_fail;
+	}
+	cpuhp_val = ret;
+
+	shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
+				  "stack_shrinker");
+	if (!shrinker) {
+		msg = "shrinker alloc failure";
+		ret = -ENOMEM;
+		goto shrinker_alloc_fail;
 	}
 
+	ret = list_lru_init_memcg_key(&reclaimable_stacks_lru, shrinker,
+				      &stack_shrinker_key);
+	if (ret != 0) {
+		msg = "list_lru_init failure";
+		goto list_lru_init_fail;
+	}
+
+	shrinker->count_objects = get_reclaimable_stack_count;
+	shrinker->scan_objects = scan_reclaimable_stacks;
+	shrinker->seeks = 4;
+	shrinker->batch = STACK_BATCH_SIZE << STACK_COUNT_SHIFT;
+	shrinker_register(shrinker);
+	return 0;
+
+list_lru_init_fail:
+	shrinker_free(shrinker);
+shrinker_alloc_fail:
+	cpuhp_remove_state(cpuhp_val);
+cpuhp_setup_fail:
+	WARN(1, "Failed to initialize stack_shrinker %s: %d\n", msg, ret);
 	return 0;
 }
 
-- 
2.55.0.897.gb25b4bd76c-goog


