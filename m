Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D929C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFDDKIwDquvfeR08dgIsB9A1bEk/JwZh0Qhl1XnN2bQ=; b=wkeQ5BZ+0TmnN3rnZaA1wpTa/4
	wN4A9Qjmv6kVX/h23VzOz7bwxwKl5u61DDROpAAZpySwjeK+QXJdNF0KwJEihSsEdXuZdvyzp8kPb
	ooapWhD0h1qdMc+iIa9Wm4iKeH72GdXoYRS99yyNwTn10XdYA0i9va4x5Aqtiq8yw81ehF0qtleTQ
	EAtTf+UdAZjHh1glE+FFQcanjmBZvrwFfDAeaDq0d+EZvYpoVgY4AD7deytg4PrCYhzcI4tclAirn
	P18Y+7cd49wl4BQbYEXqJWIpKir1XAdeAin9QBjCtSPNEkq2pfmqQjb6UTUDlsl4K8i6qjvd+gLGu
	DNmOCoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NNg-00000008SSO-0MUj;
	Wed, 23 Sep 2026 13:51:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NNf-00000008SSF-1JYg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:51:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ABAE43277;
	Wed, 23 Sep 2026 13:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D3E1F000FF;
	Wed, 23 Sep 2026 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790171486;
	bh=UFDDKIwDquvfeR08dgIsB9A1bEk/JwZh0Qhl1XnN2bQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oH0AUHlGNmBnrDncGxer3yFyFw5CKv6r9M+1BmC0IpdBKyiHIMporh6/DQhtdav89
	 UHMAl3wkBajkjxuFG23KCl8dIdoUzmTim3H3K6vKCXoX9TqpFuAsnb5V/0gj0rDH/X
	 93DSvDmzFla4cRurC9jOW8ZVL/YWWxU+nsY0KVDArC9l0f+hVSYwc4H4mLZthnuQb+
	 83n7E7j5ZSNIMVAAAoKY7pB260slYXeIddT9pkSyFnMH1unT/tOs1Jg8Non7h2fpCL
	 DvlGsMTpz7M2TlioadPAgrGjzoYwYTf3HwcRBphEUz7r4ZamD+IKKaxJlbOrZdHH+F
	 yt4O5tkN9YasA==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	rcu@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kprobes: Make optprobe optimizer multi-generational and asynchronous
Date: Wed, 23 Sep 2026 22:51:20 +0900
Message-ID: <179017148080.466588.9116221556625712980.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923164510.f3bbddefea4423f8f1bfecb8@kernel.org>
References: <20260923164510.f3bbddefea4423f8f1bfecb8@kernel.org>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Currently, kprobe_optimizer() holds kprobe_mutex, text_mutex, and
cpus_read_lock() simultaneously while executing synchronize_rcu_tasks().
Under PREEMPT_LAZY and server workloads with long-running CPU-bound kernel
tasks or heavy cgroup writeback loops, synchronize_rcu_tasks() can block
for seconds to minutes. Because text_mutex and cpus_read_lock() are held
during this entire wait, any concurrent static key updates, module
loading/unloading, CPU hotplug, or tracing updates stall, frequently
triggering hung-task detector panics.

Instead of penalizing the kernel preemption path with invasive hooks and
global hash lookups, decouple kprobe jump optimization from synchronous
waiting entirely:

1. Replace synchronize_rcu_tasks() with call_rcu_tasks(). Locks
   (text_mutex and cpus_read_lock()) are held only for the brief moment
   needed to patch instructions via arch_unoptimize_kprobes() and
   arch_optimize_kprobes() (microseconds), and are completely released
   while waiting for the Tasks RCU grace period.

2. Introduce a fixed ring of generations (optprobe_gens[OPTPROBE_GEN_MAX])
   to avoid any dynamic memory allocation (kmalloc) or -ENOMEM failure
   modes.

3. The last generation slot in the array is reserved as a "waiting room"
   and is not dispatched to RCU until another in-flight generation has
   finished. While a generation is waiting for its Tasks RCU grace period,
   any newly registered or unregistered probes accumulate in the waiting
   room generation without blocking or requiring additional slots.

4. When the Tasks RCU callback fires, it marks the generation as ready
   and wakes up the optimizer thread to finalize optimization (poking
   the jump instructions) and free cleaned probe slots. Once finalized,
   the generation is marked idle, allowing the waiting room generation
   to be dispatched next.

5. Flushing via wait_for_kprobe_optimizer() waits asynchronously for all
   in-flight and queued generations to drain without stalling other
   kernel subsystems.

On non-preemptive kernels or configs where CONFIG_TASKS_RCU=n,
call_rcu_tasks() transparently aliases to call_rcu(), preserving full
portability.

Assisted-by: LLM
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/kprobes.c |  319 ++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 225 insertions(+), 94 deletions(-)

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 6337da5cab9e..1e25980303c4 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -42,6 +42,7 @@
 #include <linux/execmem.h>
 #include <linux/cleanup.h>
 #include <linux/wait.h>
+#include <linux/rcupdate.h>
 
 #include <asm/sections.h>
 #include <asm/cacheflush.h>
@@ -66,7 +67,7 @@ static struct hlist_head kprobe_table[KPROBE_TABLE_SIZE];
 /* NOTE: change this value only with 'kprobe_mutex' held */
 static bool kprobes_all_disarmed;
 
-/* This protects 'kprobe_table' and 'optimizing_list' */
+/* This protects 'kprobe_table' and 'optprobe_gens' */
 static DEFINE_MUTEX(kprobe_mutex);
 static DEFINE_PER_CPU(struct kprobe *, kprobe_instance);
 
@@ -511,10 +512,32 @@ static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 	return NULL;
 }
 
-/* Optimization staging list, protected by 'kprobe_mutex' */
-static LIST_HEAD(optimizing_list);
-static LIST_HEAD(unoptimizing_list);
-static LIST_HEAD(freeing_list);
+#define OPTPROBE_GEN_MAX 2
+
+struct optprobe_generation {
+	struct list_head optimizing_list;
+	struct list_head unoptimizing_list;
+	struct list_head freeing_list;
+	struct rcu_head rcu;
+	bool in_flight;
+	bool ready;
+};
+
+/*
+ * Generational ring of optprobes.
+ *
+ * Incoming probe requests are queued into the waiting room generation
+ * (optprobe_gens[optprobe_cur_gen]). When dispatched, the generation
+ * unoptimizes its probes, invokes call_rcu_tasks(), and optprobe_cur_gen
+ * advances to the next slot.
+ *
+ * To ensure an idle generation is always available to collect incoming
+ * requests without dynamic allocation, the last available generation slot
+ * is never dispatched until another generation has finished.
+ */
+static struct optprobe_generation optprobe_gens[OPTPROBE_GEN_MAX];
+static int optprobe_cur_gen;
+static bool optprobe_flush_requested;
 
 static void optimize_kprobe(struct kprobe *p);
 static struct task_struct *kprobe_optimizer_task;
@@ -530,50 +553,78 @@ static DECLARE_COMPLETION(optimizer_completion);
 
 #define OPTIMIZE_DELAY 5
 
+static bool optprobe_has_queued_probes(void)
+{
+	struct optprobe_generation *gen = &optprobe_gens[optprobe_cur_gen];
+
+	return !list_empty(&gen->optimizing_list) ||
+	       !list_empty(&gen->unoptimizing_list);
+}
+
+static int optprobe_active_gens_count(void)
+{
+	int count = 0;
+	int i;
+
+	for (i = 0; i < OPTPROBE_GEN_MAX; i++) {
+		if (optprobe_gens[i].in_flight || optprobe_gens[i].ready)
+			count++;
+	}
+	return count;
+}
+
 /*
- * Optimize (replace a breakpoint with a jump) kprobes listed on
- * 'optimizing_list'.
+ * The last generation must not be fired until another generation is done.
+ * (Thus the last generation acts as the waiting room.)
  */
-static void do_optimize_kprobes(void)
+static bool optprobe_can_fire(void)
 {
-	lockdep_assert_held(&text_mutex);
-	/*
-	 * The optimization/unoptimization refers 'online_cpus' via
-	 * stop_machine() and cpu-hotplug modifies the 'online_cpus'.
-	 * And same time, 'text_mutex' will be held in cpu-hotplug and here.
-	 * This combination can cause a deadlock (cpu-hotplug tries to lock
-	 * 'text_mutex' but stop_machine() can not be done because
-	 * the 'online_cpus' has been changed)
-	 * To avoid this deadlock, caller must have locked cpu-hotplug
-	 * for preventing cpu-hotplug outside of 'text_mutex' locking.
-	 */
-	lockdep_assert_cpus_held();
+	return optprobe_active_gens_count() < OPTPROBE_GEN_MAX - 1;
+}
 
-	/* Optimization never be done when disarmed */
-	if (kprobes_all_disarmed || !kprobes_allow_optimization ||
-	    list_empty(&optimizing_list))
-		return;
+static bool optprobe_has_ready_gens(void)
+{
+	int i;
+
+	for (i = 0; i < OPTPROBE_GEN_MAX; i++) {
+		if (READ_ONCE(optprobe_gens[i].ready))
+			return true;
+	}
+	return false;
+}
 
-	arch_optimize_kprobes(&optimizing_list);
+static bool optprobe_optimizer_busy(void)
+{
+	return optprobe_has_queued_probes() || (optprobe_active_gens_count() > 0);
 }
 
 /*
  * Unoptimize (replace a jump with a breakpoint and remove the breakpoint
- * if need) kprobes listed on 'unoptimizing_list'.
+ * if need) kprobes listed on 'unopt_list'.
  */
-static void do_unoptimize_kprobes(void)
+static void do_unoptimize_kprobes(struct list_head *unopt_list,
+				  struct list_head *free_list)
 {
 	struct optimized_kprobe *op, *tmp;
 
 	lockdep_assert_held(&text_mutex);
-	/* See comment in do_optimize_kprobes() */
+	/*
+	 * The optimization/unoptimization refers 'online_cpus' via
+	 * stop_machine() and cpu-hotplug modifies the 'online_cpus'.
+	 * And same time, 'text_mutex' will be held in cpu-hotplug and here.
+	 * This combination can cause a deadlock (cpu-hotplug tries to lock
+	 * 'text_mutex' but stop_machine() can not be done because
+	 * the 'online_cpus' has been changed)
+	 * To avoid this deadlock, caller must have locked cpu-hotplug
+	 * for preventing cpu-hotplug outside of 'text_mutex' locking.
+	 */
 	lockdep_assert_cpus_held();
 
-	if (!list_empty(&unoptimizing_list))
-		arch_unoptimize_kprobes(&unoptimizing_list, &freeing_list);
+	if (!list_empty(unopt_list))
+		arch_unoptimize_kprobes(unopt_list, free_list);
 
-	/* Loop on 'freeing_list' for disarming and removing from kprobe hash list */
-	list_for_each_entry_safe(op, tmp, &freeing_list, list) {
+	/* Loop on 'free_list' for disarming and removing from kprobe hash list */
+	list_for_each_entry_safe(op, tmp, free_list, list) {
 		/* Switching from detour code to origin */
 		op->kp.flags &= ~KPROBE_FLAG_OPTIMIZED;
 		/* Disarm probes if marked disabled and not gone */
@@ -586,17 +637,20 @@ static void do_unoptimize_kprobes(void)
 			 * (reclaiming is done by do_free_cleaned_kprobes().)
 			 */
 			hlist_del_rcu(&op->kp.hlist);
-		} else
+		} else {
 			list_del_init(&op->list);
+		}
 	}
 }
 
-/* Reclaim all kprobes on the 'freeing_list' */
-static void do_free_cleaned_kprobes(void)
+/* Reclaim all kprobes on the 'free_list' */
+static void do_free_cleaned_kprobes(struct list_head *free_list)
 {
 	struct optimized_kprobe *op, *tmp;
 
-	list_for_each_entry_safe(op, tmp, &freeing_list, list) {
+	list_for_each_entry_safe(op, tmp, free_list, list) {
+		struct kprobe *_p;
+
 		list_del_init(&op->list);
 		if (WARN_ON_ONCE(!kprobe_unused(&op->kp))) {
 			/*
@@ -608,11 +662,10 @@ static void do_free_cleaned_kprobes(void)
 
 		/*
 		 * The aggregator was holding back another probe while it sat on the
-		 * unoptimizing/freeing lists.  Now that the aggregator has been fully
+		 * unoptimizing/freeing lists. Now that the aggregator has been fully
 		 * reverted we can safely retry the optimization of that sibling.
 		 */
-
-		struct kprobe *_p = get_optimized_kprobe(op->kp.addr);
+		_p = get_optimized_kprobe(op->kp.addr);
 		if (unlikely(_p))
 			optimize_kprobe(_p);
 
@@ -622,67 +675,119 @@ static void do_free_cleaned_kprobes(void)
 
 static void kick_kprobe_optimizer(void);
 
-/* Kprobe jump optimizer */
-static void kprobe_optimizer(void)
+static void optprobe_generation_rcu_cb(struct rcu_head *rcu)
 {
-	guard(mutex)(&kprobe_mutex);
+	struct optprobe_generation *gen;
+
+	gen = container_of(rcu, struct optprobe_generation, rcu);
+	WRITE_ONCE(gen->ready, true);
+	wake_up(&kprobe_optimizer_wait);
+}
+
+static void optprobe_finalize_generation(struct optprobe_generation *gen)
+{
+	lockdep_assert_held(&kprobe_mutex);
 
 	scoped_guard(cpus_read_lock) {
 		guard(mutex)(&text_mutex);
 
-		/*
-		 * Step 1: Unoptimize kprobes and collect cleaned (unused and disarmed)
-		 * kprobes before waiting for quiesence period.
-		 */
-		do_unoptimize_kprobes();
+		/* Optimization never be done when disarmed */
+		if (!kprobes_all_disarmed && kprobes_allow_optimization &&
+		    !list_empty(&gen->optimizing_list))
+			arch_optimize_kprobes(&gen->optimizing_list);
+	}
+
+	/* Free cleaned kprobes after quiescence period */
+	do_free_cleaned_kprobes(&gen->freeing_list);
+
+	gen->in_flight = false;
+	WRITE_ONCE(gen->ready, false);
+}
+
+static void optprobe_dispatch_generation(void)
+{
+	struct optprobe_generation *gen;
+
+	lockdep_assert_held(&kprobe_mutex);
+
+	if (!optprobe_can_fire() || !optprobe_has_queued_probes())
+		return;
+
+	gen = &optprobe_gens[optprobe_cur_gen];
+
+	scoped_guard(cpus_read_lock) {
+		guard(mutex)(&text_mutex);
 
 		/*
-		 * Step 2: Wait for quiesence period to ensure all potentially
-		 * preempted tasks to have normally scheduled. Because optprobe
-		 * may modify multiple instructions, there is a chance that Nth
-		 * instruction is preempted. In that case, such tasks can return
-		 * to 2nd-Nth byte of jump instruction. This wait is for avoiding it.
-		 * Note that on non-preemptive kernel, this is transparently converted
-		 * to synchronoze_sched() to wait for all interrupts to have completed.
+		 * Unoptimize kprobes and collect cleaned (unused and disarmed)
+		 * kprobes before waiting for quiescence period.
 		 */
-		synchronize_rcu_tasks();
+		do_unoptimize_kprobes(&gen->unoptimizing_list, &gen->freeing_list);
+	}
+
+	/* Advance cur_gen to the next generation slot */
+	optprobe_cur_gen = (optprobe_cur_gen + 1) % OPTPROBE_GEN_MAX;
+
+	gen->in_flight = true;
+	WRITE_ONCE(gen->ready, false);
 
-		/* Step 3: Optimize kprobes after quiesence period */
-		do_optimize_kprobes();
+	call_rcu_tasks(&gen->rcu, optprobe_generation_rcu_cb);
+}
 
-		/* Step 4: Free cleaned kprobes after quiesence period */
-		do_free_cleaned_kprobes();
+/* Kprobe jump optimizer */
+static void kprobe_optimizer(void)
+{
+	int i;
+
+	guard(mutex)(&kprobe_mutex);
+
+	/* Step 1: Finalize any generation whose Tasks RCU grace period completed */
+	for (i = 0; i < OPTPROBE_GEN_MAX; i++) {
+		if (READ_ONCE(optprobe_gens[i].ready))
+			optprobe_finalize_generation(&optprobe_gens[i]);
 	}
 
-	/* Step 5: Kick optimizer again if needed. But if there is a flush requested, */
-	if (completion_done(&optimizer_completion))
-		complete(&optimizer_completion);
+	/* Step 2: Dispatch waiting room generation if allowed */
+	optprobe_dispatch_generation();
 
-	if (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list))
-		kick_kprobe_optimizer();	/*normal kick*/
+	/* Step 3: Check completion if flush was requested */
+	if (!optprobe_optimizer_busy()) {
+		if (optprobe_flush_requested) {
+			optprobe_flush_requested = false;
+			complete_all(&optimizer_completion);
+		}
+	} else if (optprobe_has_queued_probes() && optprobe_can_fire()) {
+		/* Probes remain and can be fired immediately (e.g. retried siblings) */
+		kick_kprobe_optimizer();
+	}
 }
 
 static int kprobe_optimizer_thread(void *data)
 {
 	while (!kthread_should_stop()) {
-		/* To avoid hung_task, wait in interruptible state. */
+		/* Wait until there is work to do or a generation is ready */
 		wait_event_interruptible(kprobe_optimizer_wait,
-			   atomic_read(&optimizer_state) != OPTIMIZER_ST_IDLE ||
-			   kthread_should_stop());
+			atomic_read(&optimizer_state) != OPTIMIZER_ST_IDLE ||
+			optprobe_has_ready_gens() ||
+			kthread_should_stop());
 
 		if (kthread_should_stop())
 			break;
 
 		/*
-		 * If it was a normal kick, wait for OPTIMIZE_DELAY.
-		 * This wait can be interrupted by a flush request.
+		 * If it was a normal kick and no generation is ready to finalize,
+		 * wait for OPTIMIZE_DELAY to batch incoming requests.
+		 * This wait can be interrupted by a flush request or a ready generation.
 		 */
-		if (atomic_read(&optimizer_state) == 1)
+		if (atomic_read(&optimizer_state) == OPTIMIZER_ST_KICKED &&
+		    !optprobe_has_ready_gens()) {
 			wait_event_interruptible_timeout(
 				kprobe_optimizer_wait,
 				atomic_read(&optimizer_state) == OPTIMIZER_ST_FLUSHING ||
+				optprobe_has_ready_gens() ||
 				kthread_should_stop(),
 				OPTIMIZE_DELAY);
+		}
 
 		if (kthread_should_stop())
 			break;
@@ -707,12 +812,11 @@ static void wait_for_kprobe_optimizer_locked(void)
 {
 	lockdep_assert_held(&kprobe_mutex);
 
-	while (!list_empty(&optimizing_list) || !list_empty(&unoptimizing_list)) {
+	while (optprobe_optimizer_busy()) {
 		init_completion(&optimizer_completion);
-		/*
-		 * Set state to OPTIMIZER_ST_FLUSHING and wake up the thread if it's
-		 * idle. If it's already kicked, it will see the state change.
-		 */
+		optprobe_flush_requested = true;
+
+		/* Wake up optimizer thread */
 		if (atomic_xchg_acquire(&optimizer_state,
 			OPTIMIZER_ST_FLUSHING) != OPTIMIZER_ST_FLUSHING)
 			wake_up(&kprobe_optimizer_wait);
@@ -734,10 +838,28 @@ void wait_for_kprobe_optimizer(void)
 bool optprobe_queued_unopt(struct optimized_kprobe *op)
 {
 	struct optimized_kprobe *_op;
+	int i;
 
-	list_for_each_entry(_op, &unoptimizing_list, list) {
-		if (op == _op)
-			return true;
+	for (i = 0; i < OPTPROBE_GEN_MAX; i++) {
+		list_for_each_entry(_op, &optprobe_gens[i].unoptimizing_list, list) {
+			if (op == _op)
+				return true;
+		}
+	}
+
+	return false;
+}
+
+static bool optprobe_queued_freeing(struct optimized_kprobe *op)
+{
+	struct optimized_kprobe *_op;
+	int i;
+
+	for (i = 0; i < OPTPROBE_GEN_MAX; i++) {
+		list_for_each_entry(_op, &optprobe_gens[i].freeing_list, list) {
+			if (op == _op)
+				return true;
+		}
 	}
 
 	return false;
@@ -780,7 +902,7 @@ static void optimize_kprobe(struct kprobe *p)
 	if (WARN_ON_ONCE(!list_empty(&op->list)))
 		return;
 
-	list_add(&op->list, &optimizing_list);
+	list_add(&op->list, &optprobe_gens[optprobe_cur_gen].optimizing_list);
 	kick_kprobe_optimizer();
 }
 
@@ -813,7 +935,7 @@ static void unoptimize_kprobe(struct kprobe *p, bool force)
 				 * in the freeing list for release afterwards.
 				 */
 				force_unoptimize_kprobe(op);
-				list_move(&op->list, &freeing_list);
+				list_move(&op->list, &optprobe_gens[optprobe_cur_gen].freeing_list);
 			}
 		} else {
 			/* Dequeue from the optimizing queue */
@@ -828,7 +950,7 @@ static void unoptimize_kprobe(struct kprobe *p, bool force)
 		/* Forcibly update the code: this is a special case */
 		force_unoptimize_kprobe(op);
 	} else {
-		list_add(&op->list, &unoptimizing_list);
+		list_add(&op->list, &optprobe_gens[optprobe_cur_gen].unoptimizing_list);
 		kick_kprobe_optimizer();
 	}
 }
@@ -860,20 +982,17 @@ static void kill_optimized_kprobe(struct kprobe *p)
 	struct optimized_kprobe *op;
 
 	op = container_of(p, struct optimized_kprobe, kp);
-	if (!list_empty(&op->list))
-		/* Dequeue from the (un)optimization queue */
-		list_del_init(&op->list);
-	op->kp.flags &= ~KPROBE_FLAG_OPTIMIZED;
-
-	if (kprobe_unused(p)) {
-		/*
-		 * Unused kprobe is on unoptimizing or freeing list. We move it
-		 * to freeing_list and let the kprobe_optimizer() remove it from
-		 * the kprobe hash list and free it.
-		 */
-		if (optprobe_queued_unopt(op))
-			list_move(&op->list, &freeing_list);
+	if (!list_empty(&op->list)) {
+		if (kprobe_unused(p)) {
+			if (optprobe_queued_unopt(op))
+				list_move(&op->list, &optprobe_gens[optprobe_cur_gen].freeing_list);
+			else if (!optprobe_queued_freeing(op))
+				list_del_init(&op->list);
+		} else {
+			list_del_init(&op->list);
+		}
 	}
+	op->kp.flags &= ~KPROBE_FLAG_OPTIMIZED;
 
 	/* Don't touch the code, because it is already freed. */
 	arch_remove_optimized_kprobe(op);
@@ -1073,11 +1192,23 @@ static void __disarm_kprobe(struct kprobe *p, bool reopt)
 
 static void __init init_optprobe(void)
 {
+	int i;
+
 #ifdef __ARCH_WANT_KPROBES_INSN_SLOT
 	/* Init 'kprobe_optinsn_slots' for allocation */
 	kprobe_optinsn_slots.insn_size = MAX_OPTINSN_SIZE;
 #endif
 
+	for (i = 0; i < OPTPROBE_GEN_MAX; i++) {
+		INIT_LIST_HEAD(&optprobe_gens[i].optimizing_list);
+		INIT_LIST_HEAD(&optprobe_gens[i].unoptimizing_list);
+		INIT_LIST_HEAD(&optprobe_gens[i].freeing_list);
+		optprobe_gens[i].in_flight = false;
+		optprobe_gens[i].ready = false;
+	}
+	optprobe_cur_gen = 0;
+	optprobe_flush_requested = false;
+
 	init_waitqueue_head(&kprobe_optimizer_wait);
 	atomic_set(&optimizer_state, OPTIMIZER_ST_IDLE);
 	kprobe_optimizer_task = kthread_run(kprobe_optimizer_thread, NULL,


