Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC36C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vr/1/6kD89CuecwWXrcFDfjNkcZoJvv75czWOOFkQAs=; b=NEVW+U9wkEbSm5eesZTRldCGQk
	6FPFjkK0TyehP9HJuWyWHNSO5kqwWdEkIczjRAmYrvmvsH4HuPitUsaAs1IrlDxy51mQIFe+HFlCa
	ciGIQXSYpO+P5hcHS3jNuwi+Jl8Il2A53vFE5qPc9hNEwbJ8vaDdusBYv+ra7x8Rk4yYnF9b4PLBU
	JJcO+qkepcTktWvV0pOrCm0ukPlEn6NkuVZ/zQwmBCkpeFQfAKEI/rCZotUO7Ao7c577OSoXgYxVV
	eBfv0qtONyxz35xYV8rDm5Be9kqWvFPC/noDbWMJ1FAKHGfvODUIM5NV744iWVX2i2Hx0yqThI6t0
	agE74dBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrV-0000000FBaQ-1osY;
	Thu, 10 Sep 2026 18:51:05 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrS-0000000FBY7-2Wl0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:03 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-52fb769ca17so1659611cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066261; x=1789671061; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr/1/6kD89CuecwWXrcFDfjNkcZoJvv75czWOOFkQAs=;
        b=MSIVxotBxLv61nzHK7b8qEt+q3v2CEnHVRozCNmeA0XXNZcdchyPSzY3K2oOX/YZ+4
         g5+mbiqLiN+b6EfUTyj88Nt6AA0RMG1vh16TtaYOnbKsL6uBhDlMmKfepkK3VjczfZY9
         Zgry+Gn6Gs/V05Y/mIAEj0xvBEVzH2DuBXr7XktmS79cMaBuyPcSbK1qZvmkqrILkR7c
         j5j7dVL6lumLIfjWRLwFemenA4DBLMX/21DLFIBd/DwRje+7csZJoQKfqxmuc1xxwb/x
         L0z2QJ6r75IU78RRtp0q+jnnsxTJDBNrS70Hy/6SCBnhiwEpUTbEMZ01E2FU2E19lgn/
         BG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066261; x=1789671061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vr/1/6kD89CuecwWXrcFDfjNkcZoJvv75czWOOFkQAs=;
        b=ZUXXDbj2yp/ffjpXgI8HOL/w9FwxxHw+Pc/H5ulVqxD7wPt6MfAGhOlzFaru/gpVXu
         c8Wx9SbA4y1L4rA77bN2xohE7sdU42AIttEGvjIYDSATX7IU2YGsXgOSyXI+xWuXDqAz
         MgtlqpMUWdIqLKJ0Kz1AF7mBma+PknC9/mk2lNgS28SO4HfV59IfndR3AlwuxqELFvkS
         i7ebQORGChTodEoFU7kNullmAtGPG8zfBOSMi4leirmSPXCwa3mRNma0WY7vQmbPQcet
         DeNfCehmI8igKgulx+0le3mKfzIhZ5wRADxntu6MUUbV6aPZEyRQmugwXEmjLxv4Zafk
         e79Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYlTxDfsgtm6J87JZPwHDz9Ln+IWb3O1iLoumMBuO/EDol4Ze3+7nPcHHuoUXU6f2PbqeOeZHVrhOI0AoNpKWM@lists.infradead.org
X-Gm-Message-State: AFuF++kR/t5qCvd9UCuhQhv53FW3dm8WpsUEU+8j/3zAljQFoSJjLXjV
	5l0/4cONQZIjxs9Q/SQn07zXLRfxfqxiEnR1rks2WbG510CqVnABu9sI5dQLmsbkM8Y=
X-Gm-Gg: AYBFou2P36EDzfFh5yXKNuYZsw0cd3AP8yzeFK+U+LBFECRATu6l8qsdiARL9H31vCw
	6gR4304uiwf0PuRHQidiL9NeUQXjzYuOr96c2aWvao5XJj0Bq6RqcnLxtayfOTWJE++omooFBZL
	QxSW9ECUK8WxsVDrnkUH7Z7dsyi67d/pHOEFDBxGQNOB1kUdeA8Cbh36XsjaFs/b/bXFdo7A/H6
	FH35Ywjy5SUr6ZOt2O2I6XTGzP72oIXzVUEZYz90/eABLG9+rADGlxspvC0g9fz87klOr4kIcld
	HsLOg3DeCM8WhoqQyV9vNR2I+V9Gv1K7Fx9dCMN2caUsjpqQcN/vuL4/Db18Tk+r7RXplNayUl2
	oOarzN65JYmtfScIwp+RrvF7khxNt2R0buvn76DB/iVD43PrrKASJU6ey5UMJvW4s3+ddAi3BTf
	bLn1eMIPe2W/9tdVR0Eo2E2+KR3bGE5O8F9d+9Jl/V69lCBBltVdpzpn1ktg3llHFXvanFYjC4B
	p9i5fR/T76k0H01Broyb5Go7FTnjUL+M4EH5b7MvzvCP2Vi4yON7D4wbeg7j7C2m5o=
X-Received: by 2002:ac8:5a87:0:b0:530:8b38:b9f4 with SMTP id d75a77b69052e-530c86f329fmr16033471cf.37.1789066256481;
        Thu, 10 Sep 2026 11:50:56 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5e880csm2372196d6.49.2026.09.10.11.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:50:55 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:26 +0000
Subject: [PATCH RFC 03/13] rcu-tasks: Hold trampoline nesting across
 irq-exit preemption in trampoline text
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-3-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115102_685664_463EF5A2 
X-CRM114-Status: GOOD (  28.53  )
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

A trampoline's own rcu_tramp_nesting increment and decrement live inside
the trampoline, so there is a window of a few instructions on entry and
exit where the count is zero while the CPU is executing trampoline text
(or text on the way into one, such as a static ftrace stub holding a
direct-call target).  In that window the task has not called out, so it
can only be preempted from an interrupt, and the interrupted instruction
pointer identifies where it is.

Add rcu_tasks_ip_in_trampoline(), which treats any IP outside core
kernel and module text as potentially Tasks-RCU-protected (ftrace
trampolines, BPF images and programs, kprobe slots are all dynamically
allocated text; is_ftrace_trampoline() and friends are deliberately not
used because text being torn down may already be unregistered from them
while a task still stands on it), plus a __weak
arch_rcu_tasks_ip_in_trampoline() for core text an architecture needs
to flag.  On irq-exit preemption, if the IP matches, hold the count
elevated across preempt_schedule_irq().

Introduce ARCH_HAS_RCU_TASKS_PREEMPT_QS / RCU_TASKS_PREEMPT_QS to gate
this; no architecture selects it yet, so the check compiles away and
there is no functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/rcupdate.h | 17 +++++++++++++++++
 kernel/entry/common.c    | 23 ++++++++++++++++++++++-
 kernel/rcu/Kconfig       | 10 ++++++++++
 kernel/rcu/tasks.h       | 38 ++++++++++++++++++++++++++++++++++++++
 kernel/rcu/update.c      |  2 ++
 5 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index b5c666c82479..0a408e36ea15 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -173,6 +173,9 @@ static inline void rcu_nocb_flush_deferred_wakeup(void) { }
 
 #endif /* #else #ifdef CONFIG_RCU_NOCB_CPU */
 
+/* Arch hook for rcu_tasks_ip_in_trampoline(); see kernel/rcu/tasks.h. */
+bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip);
+
 /*
  * Note a quasi-voluntary context switch for RCU-tasks's benefit.
  * This is a macro rather than an inline function to avoid #include hell.
@@ -189,6 +192,16 @@ static inline void rcu_nocb_flush_deferred_wakeup(void) { }
  * or was called from, such text and an involuntary context switch must not be
  * treated as a Tasks RCU quiescent state.
  *
+ * The increment and decrement themselves live inside the trampoline, so there
+ * is a window of a few instructions at entry (before the increment) and exit
+ * (after the decrement) where the count is zero but the CPU is executing
+ * trampoline text, or text on the way into one (a static ftrace stub or a
+ * return thunk holding the trampoline's address).  In that window the task
+ * cannot be preempted synchronously, only from an interrupt, so the irq-exit
+ * preemption path covers it by checking regs->ip with
+ * rcu_tasks_ip_in_trampoline() and holding the count elevated across
+ * preempt_schedule_irq() when it matches.
+ *
  * Only current writes the count and only current (or an interrupt on the same
  * CPU) reads it, so plain accesses suffice.
  */
@@ -211,6 +224,8 @@ static __always_inline void rcu_tasks_trampoline_assert_none(void)
 		WARN_ON_ONCE(current->rcu_tramp_nesting);
 }
 
+bool rcu_tasks_ip_in_trampoline(unsigned long ip);
+
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
 		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
@@ -226,6 +241,7 @@ void rcu_tasks_torture_stats_print(char *tt, char *tf);
 static inline void rcu_tasks_trampoline_enter(void) { }
 static inline void rcu_tasks_trampoline_exit(void) { }
 static inline void rcu_tasks_trampoline_assert_none(void) { }
+static inline bool rcu_tasks_ip_in_trampoline(unsigned long ip) { return false; }
 # endif
 
 #define rcu_tasks_qs(t, preempt) rcu_tasks_classic_qs((t), (preempt))
@@ -245,6 +261,7 @@ void exit_tasks_rcu_finish(void);
 static inline void rcu_tasks_trampoline_enter(void) { }
 static inline void rcu_tasks_trampoline_exit(void) { }
 static inline void rcu_tasks_trampoline_assert_none(void) { }
+static inline bool rcu_tasks_ip_in_trampoline(unsigned long ip) { return false; }
 #define call_rcu_tasks call_rcu
 #define synchronize_rcu_tasks synchronize_rcu
 static inline void exit_tasks_rcu_start(void) { }
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e4acd50bd81a..cd3feaca6420 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -134,6 +134,27 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
 
+/*
+ * Preempt the interrupted kernel context.  If the interrupt landed in text
+ * that may be a Tasks-RCU-protected trampoline (see
+ * rcu_tasks_trampoline_enter()), hold current->rcu_tramp_nesting elevated
+ * across the context switch so that it is not mistaken for a Tasks RCU
+ * quiescent state.  This closes the few-instruction windows at trampoline
+ * entry/exit where the trampoline's own increment has not yet run or its
+ * decrement already has.
+ */
+static void irqentry_preempt(struct pt_regs *regs)
+{
+	bool in_tramp = IS_ENABLED(CONFIG_RCU_TASKS_PREEMPT_QS) &&
+			rcu_tasks_ip_in_trampoline(instruction_pointer(regs));
+
+	if (in_tramp)
+		rcu_tasks_trampoline_enter();
+	preempt_schedule_irq();
+	if (in_tramp)
+		rcu_tasks_trampoline_exit();
+}
+
 void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!preempt_count()) {
@@ -142,7 +163,7 @@ void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
 			WARN_ON_ONCE(!on_thread_stack());
 		if (need_resched() && arch_irqentry_exit_need_resched())
-			preempt_schedule_irq();
+			irqentry_preempt(regs);
 	}
 }
 #ifdef CONFIG_PREEMPT_DYNAMIC
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 332df7a7a634..999f8228a13d 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -107,6 +107,16 @@ config TASKS_RCU
 	default NEED_TASKS_RCU && PREEMPTION
 	select IRQ_WORK
 
+# Selected by architectures whose ftrace, BPF and kprobe trampolines maintain
+# current->rcu_tramp_nesting and which use the generic irqentry code, so that
+# a preemption outside any trampoline can be treated as a Tasks RCU
+# quiescent state.  See rcu_tasks_trampoline_enter().
+config ARCH_HAS_RCU_TASKS_PREEMPT_QS
+	bool
+
+config RCU_TASKS_PREEMPT_QS
+	def_bool TASKS_RCU && ARCH_HAS_RCU_TASKS_PREEMPT_QS && GENERIC_IRQ_ENTRY
+
 config FORCE_TASKS_RUDE_RCU
 	bool "Force selection of Tasks Rude RCU"
 	depends on RCU_EXPERT
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 1662ba18bf34..a801ec4a951b 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1089,6 +1089,44 @@ static void rcu_tasks_postscan(struct list_head *hop)
 		timer_delete_sync(&tasks_rcu_exit_stall_timer);
 }
 
+/*
+ * Architectures selecting ARCH_HAS_RCU_TASKS_PREEMPT_QS override this to flag
+ * core kernel text that must be treated like a trampoline, e.g. static ftrace
+ * entry stubs and return thunks that run with a trampoline address in hand.
+ */
+bool __weak arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
+{
+	return false;
+}
+
+/**
+ * rcu_tasks_ip_in_trampoline - Could a task interrupted at @ip be a Tasks RCU reader?
+ * @ip: interrupted instruction pointer
+ *
+ * Called from the irq-exit preemption path with interrupts disabled, to decide
+ * whether the imminent preemption may be reported as a Tasks RCU quiescent
+ * state when current->rcu_tramp_nesting is zero.  Returns true, meaning "do
+ * not report", when @ip is:
+ *
+ *  - outside static kernel and module text, i.e. possibly in an ftrace
+ *    trampoline, BPF trampoline image or program, kprobe insn/optinsn slot or
+ *    other dynamically allocated text whose lifetime Tasks RCU guards.  This
+ *    deliberately does not consult is_ftrace_trampoline() and friends: text
+ *    being torn down may already be unregistered there while a task still
+ *    stands on it;
+ *  - in core text the architecture flags via arch_rcu_tasks_ip_in_trampoline().
+ *
+ * A false positive only defers the quiescent state to the task's next
+ * context switch.
+ */
+bool rcu_tasks_ip_in_trampoline(unsigned long ip)
+{
+	if (core_kernel_text(ip))
+		return arch_rcu_tasks_ip_in_trampoline(ip);
+	return !is_module_text_address(ip);
+}
+NOKPROBE_SYMBOL(rcu_tasks_ip_in_trampoline);
+
 /* See if tasks are still holding out, complain if so. */
 static void check_holdout_task(struct task_struct *t,
 			       bool needreport, bool *firstreport)
diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
index b62735a67884..23be7e97c3b5 100644
--- a/kernel/rcu/update.c
+++ b/kernel/rcu/update.c
@@ -41,6 +41,8 @@
 #include <linux/rcupdate_wait.h>
 #include <linux/sched/isolation.h>
 #include <linux/kprobes.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/irq_work.h>
 #include <linux/rcupdate_trace.h>

-- 
2.55.0


