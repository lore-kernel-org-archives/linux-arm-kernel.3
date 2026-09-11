Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386E4C88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5run1FbtWhLPrIbIpcsdoDpDcAIfw1LixKxJKXXjMZI=; b=Y1FfzIGmGtnbxzuM4D3TkiCKkH
	2j4WSTPlu/BDQTyQHfngSoEhw2syJiHoj7qw3jHk68fu4GUQjA/GoNhT0UobAuCh1La0QzzMAbk5z
	7MvJz40/jXqKr6TcxAKrgYDmU8jjC/8xz+i6wHs22foqs8E2Lw5zcafwoTpDdYwgOZB1TzYyq5Fni
	+bh+Dw7+yJOQl9pYxX4Oz98/z3Xn7CU+e9huFml28OmimI/uAUVBC8kKreVW99FuJg+J9V2oolRrq
	ogQfj6SKsM4sQY9bt+lzINN8/gKjC4yoAmKUZp3jXNtJlflKNphXxUqY5Om7s5UcB3piVdVgbZ9/8
	6BDNy0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51x4-0000000GrDg-2uLg;
	Fri, 11 Sep 2026 14:10:02 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51wy-0000000GrAw-3AgQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:09:57 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8664769db58so7635197b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135795; x=1789740595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5run1FbtWhLPrIbIpcsdoDpDcAIfw1LixKxJKXXjMZI=;
        b=MqzJn7giT63gNtlL1gn2lklKSbRbeFKSoCIAaCB9hSbknIuCq14ZW2Uy+z1nkzRxtX
         ApyIUlHRXe3KLud/tO1x5w6SJYHRHPwlSTcVYDKgjAg5a2zgPaQD2G0dHNSoKA8eTxLO
         lvul1CrBwA6b9aLwPXhb05HCIycfeGFG5jhODVM3N4MWRZpr++wVAjfOIegNNwrNhZjs
         1nuZctnBQwcaRUixqYqCUUQyXSjlRYHM3pitXZzuR2QtLAHkngGQUciRos5krGCpza9u
         qCvG32lx59VH4Yq2aZj1nveXeMcQf41/+bvFQU+cb09+4qhElzjoYPo5pmMhlb3hX4N1
         xblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135795; x=1789740595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5run1FbtWhLPrIbIpcsdoDpDcAIfw1LixKxJKXXjMZI=;
        b=iPKcM7rynXrDiFg7TiN5rJeta3wMU5KPh/2TfBvi2XQt7E7kSQvCZJ01XseY1ot/zh
         /Ayl8S19cnnA1F/8RdKStVuX3Bapl7swkV7Toct6TDzdpYKw9efo5pBZHs/4O0mhpOk8
         n9uyNec4DoEBUX08oImsowh/qMdla71M5LBKX9hwfzu028hpPdyLUSMf3EAs3JLs1lxV
         3jq4hU3gNDenI0NtrcFiPlh9MMs1+Fe/xy/RuEthdgyUtQXndnijK0uGHSxMBoNqu2gi
         eiZi3foyWf2HwNjgY6RgZ67Gqb1AnceT9C31xnSJudG3LQEOLN+of+FlCQewFgynKngz
         WWdA==
X-Forwarded-Encrypted: i=1; AKwUvBwHIj5CqBkNQQhcqPQ9tbN6PoxiZWxY1DbmeK0H1MOysYDajpZsJ7AHWBR0dQq1QInSafmP8EM2pBGdiPWOQG4a@lists.infradead.org
X-Gm-Message-State: AFuF++nxfMyGIPf4zzDGd/IH6OLVuc19aroEC8Wr8So0i6xIPUurQaVa
	Om/vNFRsSJWbtum9C/ScXUZK5x1+IvfBJpYz23AVAy0IcKoXmNZUhLAYnyP5ue0ZAgc=
X-Gm-Gg: AYBFou0RTqA9o0IdqyWDNgnON8BQBQVst33r0ZkDNZxBOxTgkR2+wKi0txndxlFFJ6F
	vbFchlxFqWznsiidQ5JLT98bLf7MO1XefJYO1owIGEpgfR5pPUON8AKu9rCIM/C8jSfGUh0eALG
	7ndJugGAzm0ty+wBX0DJs87YMmjCibX1Oj7HOXWjLyHPpv0r74x8wrDr1oYOiX6xNj6HQR8qs1E
	5cAcWXlj0G/YR3dJRtXlJQHNcauIKLT7tBIMdKIru6APHRg9cFHte3/fOuZi2QUZt1dv6NzGST6
	UKf3W8W1vq638XYfpXOR5wgdZy36tZBsBfupOCve+JSUtW26LOFnk3ZDXSyPPnFHiXKC0IbY/Zw
	XS9muzpHTma3nqHdpCURN8iyNzLDe/yRMVSaIShYjagvEVJYw1BIEQ7TH6kqrNjoBEtIHcpn5y6
	EcHIlIk92zV0Nxn7vYzKYUkbtIRUZa11p+k17ZSlj7Y6JMvO2hnXvRBBn8gWu4i1Yxa95vHc13s
	LiyDzaCN1xGcl7HfEvbRpkFivYv2hOmunsyyTmneUt7lNxH/xAapuh4
X-Received: by 2002:a05:690c:10c:b0:873:5c0f:27f with SMTP id 00721157ae682-884b183fa8fmr15728927b3.41.1789135795285;
        Fri, 11 Sep 2026 07:09:55 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d0700sm22061896d6.38.2026.09.11.07.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:09:53 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:42 +0000
Subject: [PATCH RFC v2 04/15] kprobes: Let Tasks RCU recognise tasks
 preempted in an optprobe jump window
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-4-eaaa61ed2da4@toxicpanda.com>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=12385;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=zaxzL0DRdr6YBFEcTSGtZpzKzuVZf+tDLqNK8lLQ3vQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDkHo+7Zxxr001o9pThi3R9UNNh0hJGGQszxQdwGKWyIfzZokuP81SU5bPZjsOb84RB2Rvd/rcr
 ztRWEWANpTgE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_070956_879289_BECC4FE9 
X-CRM114-Status: GOOD (  28.21  )
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

kprobe_optimizer() is the one synchronize_rcu_tasks() user that is not
about trampoline text: it waits for tasks that were preempted on an
instruction boundary inside the bytes it is about to overwrite with the
optimized jump, so that none of them resumes into the middle of the new
instruction.  Such a task sits in ordinary kernel or module text with
rcu_tramp_nesting == 0, and can only have got there via an irq-exit
preemption.

Add kprobe_in_optimized_region(), a lockless and conservative form of
get_optimized_kprobe() that reports whether any registered kprobe lies
within MAX_OPTIMIZED_LENGTH before the given address regardless of its
optimization state.  The hash walk is only done while kprobe_optimizer()
is actually inside its synchronize_rcu_tasks(), tracked by a flag it sets
around the call; otherwise the check is a single load.  The kprobe hash
is RCU-protected and every free path waits for a grace period after
unhashing, so the lockless walk is safe from any context with preemption
disabled.

Unlike trampoline text, which a task can only be interrupted in while
the trampoline exists, these bytes are ordinary text a task may have
been parked in since before the kprobe was registered, and the optimizer
may start waiting while that task is already switched out.  So the check
cannot be made once at preemption time the way the trampoline cases are:
have irqentry_preempt() record the interrupted IP in
current->rcu_tasks_irq_ip for the duration of the preemption, and add
rcu_tasks_irq_ip_holds() to test it, to be evaluated at every
quiescent-state decision once preemption becomes a quiescent state --
each pass through __schedule() in preempt_schedule_irq()'s loop as well
as any remote check.  A task switched out synchronously cannot have a
resume point inside such a window (a call there returns beyond it), so
only the irq-exit IP needs checking, and preempt_schedule_irq() cannot
nest, so one slot per task suffices.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/kprobes.h  |  8 +++++++-
 include/linux/rcupdate.h | 17 +++++++++++++++++
 include/linux/sched.h    |  1 +
 kernel/entry/common.c    | 13 +++++++++++--
 kernel/fork.c            |  1 +
 kernel/kprobes.c         | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 kernel/rcu/tasks.h       | 23 +++++++++++++++++++++++
 7 files changed, 106 insertions(+), 3 deletions(-)

diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index e6de7ae55bda..74cc48c04417 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -530,11 +530,17 @@ static inline bool is_kprobe_insn_slot(unsigned long addr)
 }
 #endif /* !CONFIG_KPROBES */
 
-#ifndef CONFIG_OPTPROBES
+#ifdef CONFIG_OPTPROBES
+bool kprobe_in_optimized_region(unsigned long addr);
+#else /* !CONFIG_OPTPROBES */
 static inline bool is_kprobe_optinsn_slot(unsigned long addr)
 {
 	return false;
 }
+static inline bool kprobe_in_optimized_region(unsigned long addr)
+{
+	return false;
+}
 #endif /* !CONFIG_OPTPROBES */
 
 #ifdef CONFIG_KRETPROBES
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 0a408e36ea15..4cfe096d624f 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -202,6 +202,14 @@ bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip);
  * rcu_tasks_ip_in_trampoline() and holding the count elevated across
  * preempt_schedule_irq() when it matches.
  *
+ * The one non-trampoline user, kprobe jump optimization, waits for tasks
+ * preempted inside ordinary instruction bytes it is about to overwrite.  A
+ * task can be parked there from before the kprobe even existed, so that
+ * cannot be decided once at preemption time: irqentry_preempt() records the
+ * interrupted IP in current->rcu_tasks_irq_ip for the duration of the
+ * preemption and rcu_tasks_irq_ip_holds() checks it at every quiescent-state
+ * decision, locally and from the grace-period kthread.
+ *
  * Only current writes the count and only current (or an interrupt on the same
  * CPU) reads it, so plain accesses suffice.
  */
@@ -225,6 +233,13 @@ static __always_inline void rcu_tasks_trampoline_assert_none(void)
 }
 
 bool rcu_tasks_ip_in_trampoline(unsigned long ip);
+bool rcu_tasks_irq_ip_holds(struct task_struct *t);
+
+/* Record where current is being irq-preempted; 0 once it has resumed. */
+static __always_inline void rcu_tasks_note_irq_ip(unsigned long ip)
+{
+	WRITE_ONCE(current->rcu_tasks_irq_ip, ip);
+}
 
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
@@ -242,6 +257,7 @@ static inline void rcu_tasks_trampoline_enter(void) { }
 static inline void rcu_tasks_trampoline_exit(void) { }
 static inline void rcu_tasks_trampoline_assert_none(void) { }
 static inline bool rcu_tasks_ip_in_trampoline(unsigned long ip) { return false; }
+static inline void rcu_tasks_note_irq_ip(unsigned long ip) { }
 # endif
 
 #define rcu_tasks_qs(t, preempt) rcu_tasks_classic_qs((t), (preempt))
@@ -262,6 +278,7 @@ static inline void rcu_tasks_trampoline_enter(void) { }
 static inline void rcu_tasks_trampoline_exit(void) { }
 static inline void rcu_tasks_trampoline_assert_none(void) { }
 static inline bool rcu_tasks_ip_in_trampoline(unsigned long ip) { return false; }
+static inline void rcu_tasks_note_irq_ip(unsigned long ip) { }
 #define call_rcu_tasks call_rcu
 #define synchronize_rcu_tasks synchronize_rcu
 static inline void exit_tasks_rcu_start(void) { }
diff --git a/include/linux/sched.h b/include/linux/sched.h
index d2e7b1b3c9d2..7f0bdc81fba3 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -957,6 +957,7 @@ struct task_struct {
 	u8				rcu_tasks_holdout;
 	u8				rcu_tasks_idx;
 	int				rcu_tramp_nesting;
+	unsigned long			rcu_tasks_irq_ip;
 	int				rcu_tasks_idle_cpu;
 	struct list_head		rcu_tasks_holdout_list;
 	int				rcu_tasks_exit_cpu;
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index cd3feaca6420..b372f2670d4f 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -141,16 +141,25 @@ static inline bool arch_irqentry_exit_need_resched(void) { return true; }
  * across the context switch so that it is not mistaken for a Tasks RCU
  * quiescent state.  This closes the few-instruction windows at trampoline
  * entry/exit where the trampoline's own increment has not yet run or its
- * decrement already has.
+ * decrement already has.  The interrupted IP is also recorded for the
+ * duration, for conditions that must be re-evaluated at each quiescent-state
+ * decision rather than once here (see rcu_tasks_irq_ip_holds()); nested
+ * irq-exit preemption cannot happen inside preempt_schedule_irq(), so one
+ * slot per task is enough.
  */
 static void irqentry_preempt(struct pt_regs *regs)
 {
+	unsigned long ip = instruction_pointer(regs);
 	bool in_tramp = IS_ENABLED(CONFIG_RCU_TASKS_PREEMPT_QS) &&
-			rcu_tasks_ip_in_trampoline(instruction_pointer(regs));
+			rcu_tasks_ip_in_trampoline(ip);
 
 	if (in_tramp)
 		rcu_tasks_trampoline_enter();
+	if (IS_ENABLED(CONFIG_RCU_TASKS_PREEMPT_QS))
+		rcu_tasks_note_irq_ip(ip);
 	preempt_schedule_irq();
+	if (IS_ENABLED(CONFIG_RCU_TASKS_PREEMPT_QS))
+		rcu_tasks_note_irq_ip(0);
 	if (in_tramp)
 		rcu_tasks_trampoline_exit();
 }
diff --git a/kernel/fork.c b/kernel/fork.c
index cfe3a8e53fbd..1277603bc472 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1870,6 +1870,7 @@ static inline void rcu_copy_process(struct task_struct *p)
 #ifdef CONFIG_TASKS_RCU
 	p->rcu_tasks_holdout = false;
 	p->rcu_tramp_nesting = 0;
+	p->rcu_tasks_irq_ip = 0;
 	INIT_LIST_HEAD(&p->rcu_tasks_holdout_list);
 	p->rcu_tasks_idle_cpu = -1;
 	INIT_LIST_HEAD(&p->rcu_tasks_exit_list);
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 6337da5cab9e..cf2ea278fdf5 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -511,6 +511,48 @@ static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 	return NULL;
 }
 
+/*
+ * True while kprobe_optimizer() is waiting for its Tasks RCU grace period.
+ * Only in that window can a preemption inside an optprobe's jump region
+ * matter to it, so kprobe_in_optimized_region() does no work otherwise.
+ */
+static bool kprobe_optimizer_waiting;
+
+/**
+ * kprobe_in_optimized_region - Could @addr be inside bytes a jump-optimized
+ *	kprobe replaces?
+ * @addr: kernel text address, typically an interrupted instruction pointer
+ *
+ * kprobe_optimizer() relies on synchronize_rcu_tasks() to wait for tasks that
+ * were preempted on an instruction boundary inside the region about to be
+ * overwritten by the optimized jump; such a task must not report a Tasks RCU
+ * quiescent state when it is preempted (see rcu_tasks_ip_in_trampoline()).
+ * This is the lockless, conservative form of get_optimized_kprobe(): it does
+ * not care whether the kprobe found is, or ever will be, optimized.  May be
+ * called from any context with preemption disabled; the kprobe hash is
+ * RCU-protected and every free path waits for a grace period after unhashing.
+ *
+ * The hash walk only runs while the optimizer is actually waiting.  A
+ * preemption that does not observe kprobe_optimizer_waiting predates the
+ * grace period (its leading synchronize_rcu() publishes the store to every
+ * interrupts-disabled reader before any task is sampled as a holdout); such a
+ * task is then an ordinary preempted holdout, and the jump is not written
+ * until it has run again and left the region.
+ */
+bool kprobe_in_optimized_region(unsigned long addr)
+{
+	int i;
+
+	if (!READ_ONCE(kprobe_optimizer_waiting))
+		return false;
+
+	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
+		if (get_kprobe((kprobe_opcode_t *)addr - i))
+			return true;
+	return false;
+}
+NOKPROBE_SYMBOL(kprobe_in_optimized_region);
+
 /* Optimization staging list, protected by 'kprobe_mutex' */
 static LIST_HEAD(optimizing_list);
 static LIST_HEAD(unoptimizing_list);
@@ -644,8 +686,12 @@ static void kprobe_optimizer(void)
 		 * to 2nd-Nth byte of jump instruction. This wait is for avoiding it.
 		 * Note that on non-preemptive kernel, this is transparently converted
 		 * to synchronoze_sched() to wait for all interrupts to have completed.
+		 * kprobe_optimizer_waiting lets Tasks RCU recognise tasks preempted
+		 * in such a region while we wait, see kprobe_in_optimized_region().
 		 */
+		WRITE_ONCE(kprobe_optimizer_waiting, true);
 		synchronize_rcu_tasks();
+		WRITE_ONCE(kprobe_optimizer_waiting, false);
 
 		/* Step 3: Optimize kprobes after quiesence period */
 		do_optimize_kprobes();
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index a801ec4a951b..0e46d8fe4d8e 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1127,6 +1127,29 @@ bool rcu_tasks_ip_in_trampoline(unsigned long ip)
 }
 NOKPROBE_SYMBOL(rcu_tasks_ip_in_trampoline);
 
+/**
+ * rcu_tasks_irq_ip_holds - Is @t irq-preempted somewhere that must hold off Tasks RCU?
+ * @t: a task inside preempt_schedule_irq() (t->rcu_tasks_irq_ip != 0), or not
+ *
+ * Unlike trampoline text, which a task can only be interrupted in while the
+ * trampoline exists, the bytes kprobe_optimizer() is about to overwrite with a
+ * jump are ordinary text a task may have been parked in since before the
+ * kprobe was registered, and the optimizer may start waiting while the task is
+ * already switched out.  So this is evaluated against the IP recorded by
+ * irqentry_preempt() at every quiescent-state decision -- each pass through
+ * __schedule() in preempt_schedule_irq()'s loop, and the grace-period
+ * kthread's scans -- rather than once at preemption time.  A task switched out
+ * synchronously cannot have a resume point inside such a window (a call there
+ * returns beyond it), so only the irq-exit IP needs checking.
+ */
+bool rcu_tasks_irq_ip_holds(struct task_struct *t)
+{
+	unsigned long ip = READ_ONCE(t->rcu_tasks_irq_ip);
+
+	return ip && kprobe_in_optimized_region(ip);
+}
+NOKPROBE_SYMBOL(rcu_tasks_irq_ip_holds);
+
 /* See if tasks are still holding out, complain if so. */
 static void check_holdout_task(struct task_struct *t,
 			       bool needreport, bool *firstreport)

-- 
2.55.0


