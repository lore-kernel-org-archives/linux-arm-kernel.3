Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78403C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LMR5vylWFXJjVBWLTvtKp/AcLzLdtKKT/apfY5nlpQ=; b=NH39BNa26JgwcLhUgowLpIT32Z
	1fCxMNhCaLOAnJyR5ggnpxa79lNx5R8w+WOZBxvsw3BSzMIgXqvNnYEs1Zo2YwVqmK/DpZSRFSOSX
	kkjXBbfQBSxyUvyuvKye6MfJnzDlBSe7ASe5ykoI02eS0SAGQKBTY8SRN/O/NRclRtYNFMRjGKpwH
	/UaKQeBYqCyfmRN7seupA6s46O14ysndPFUpEcQjrMkiXNwBGs5D/DWZNRvenLfZYiRu8KCaAi4YB
	zqivbjxRGN9DMSUriXQhFNu4XY32SI08P3Y2t1KjbzcLJI2EtYPwA3nKsVNHnlldbKWvga3FbnWV7
	Y7iIkOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ww-0000000GrA2-124u;
	Fri, 11 Sep 2026 14:09:54 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51wq-0000000Gr8L-1hvY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:09:49 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-6712bea5c91so497964d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135787; x=1789740587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LMR5vylWFXJjVBWLTvtKp/AcLzLdtKKT/apfY5nlpQ=;
        b=INE91x11IPibK/wgJOlhA8qWk58NlDJuBenfnHXxFF0ZaNn+jWwtF7JodH4Cx+Ne6B
         0GMbcu8MgNy7jl9wT3y6LTwEEG2BVTtyBzXdVov8SM7CzFRxNcWNt0xoaimY9s+bVF7n
         XQ1fQiWNkeHMv1c0Pn9u/cdPuywZt1MoG3iPNBeGyGD1UvDpCmcrje9bCsxCDBwPP0lY
         NIahCwCQvInFEmm36L5czX64awKbHjfzulWGmWxhzXHWQgzZmfa5Q/t28T10RH1PcYL7
         RR467LkGvlcQ6+W/7Sp7PLgM5Zq38pnBdSkaWIH/j/nEJJ6J+CTB3pwa3SG7VYtzt6rW
         OlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135787; x=1789740587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LMR5vylWFXJjVBWLTvtKp/AcLzLdtKKT/apfY5nlpQ=;
        b=Q05AnmQvFhnX/mxlaTiDRhPP/L/IQT+JTvPhWoIopAztURoWKraUsAJx8VLW6qNtx3
         rjF4xmclY4ey2F2ftOKl4/bNuiT3XLdLYZUwQwiwwliiWWgfqgRhwTs5MqFTmWfiRWBA
         lYsFU1ZWyHwwb2Nfj757Xc1LpDlJkAGJswU20Gs0HAcDvRyGQdMQobuNotF/Ekhb+low
         4YDLxDo26yvAjsTBXlLtg1mAqt/l5bvhPyA227bcrBqHKvqupfd0Gf4H45ERaKkQ00oM
         Lrn49e2pvVWVYcOEt649aEwFv7R1HsylnQBBGRc2uZ+JCCS9S/riUP0+eVMDVsJCgaRm
         poHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMlCrDaLB6E6S9AfXkSZFTAcSO3x3fItXrygM+uKjh6aIcza+fcVfjLtrqYyFprDGr21A3+3ES5yTCVXA7OwiX@lists.infradead.org
X-Gm-Message-State: AFuF++nqgWL75wHWKOgJ50ggii67WM02YvT5BkSLhKjz4ecXelFmOKSs
	s1XuM9jxIYWwGx5W8fyeA4m6u2YCxZfsE2plO16KSSBEQivem1fKR4+sLS5B4HPwEvc=
X-Gm-Gg: AYBFou2HvmPAq1BduaajIChhGjFYhRFm1FPWfjI5FxQdMGhxtbyZFkLXfiSM6VSCJWF
	HtjYIekVa0/Cxc0hLDxHuCeQzpkAg0ydJC+aKeB0M8wez+yKTecgKAknnK2p5/kWUZP2VHbnrrE
	RlU8HC9Y7AcfsoLjYfsv5HbzKtouf5x3OEJiWP1n9maHJDgFCFEns1fYyRV2p1mkpEsCw8MM1Pa
	Xa4NZO0CP7Lcz4LZcz5FJOXo3u3ZWNlcIve/RvxIQ72uoAYgb638OR4jScX/7vDHnpP4PSeuNmz
	R+PXpypzngfcGcPZqMYZPHWciNS3nLQoDBVhOkrX2FeuloQE8qw+odABFg1DimviFJNLuF6XzmG
	TdQkoZDnUH0m7/KVhVGm79McKPkZxrkXFVwKqSlVDEZsq5M4k6pyUZwbz1fVzlEIGPCu0kO2Yah
	rLQ1Fxbmci7fHk19T3ubdqy/F/x4cEi6pXNz98bp+JDMaT4H/XYgYybuaiUYTaNyxLZ6ma6dvWO
	C+oWViOuHXbaJ5EFX8+17EP+PuUOiLmv9DYokxwIJWSr/npBVzGBOLwSyoZIXBhaw4=
X-Received: by 2002:a53:ac84:0:b0:671:2bb8:ceb0 with SMTP id 956f58d0204a3-6712bb8d198mr592173d50.65.1789135786904;
        Fri, 11 Sep 2026 07:09:46 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120ef650a6sm22355976d6.0.2026.09.11.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:09:44 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:39 +0000
Subject: [PATCH RFC v2 01/15] rcu-tasks: Add per-task trampoline nesting
 count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-1-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=7684;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=5hfL8mlrp+YP87pgAlSpHeSx0zMtfymEMHCNh6a40UA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPWvMx3TEehoRUZzyZvbL0GIDlx2yxh9C8YdBR0qgc4jATwF0zYzIPzSM+uo5u0rpazhBa063Yn
 SUZFFg50YiQg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_070948_509888_F8CFFFA6 
X-CRM114-Status: GOOD (  22.26  )
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

Tasks RCU exists so that ftrace, BPF and kprobes can free trampoline
text once no task can still be executing in it.  Today the only way a
task tells Tasks RCU "I am not in a trampoline" is a voluntary context
switch, so a preempted task is always assumed to be inside one.

Add task_struct::rcu_tramp_nesting so that trampolines can say so
directly: a trampoline increments it before calling out and decrements
it before returning, and while it is non-zero the task must not be
treated as Tasks-RCU quiescent.  Provide rcu_tasks_trampoline_enter()
and rcu_tasks_trampoline_exit() for C users, report the count in the
Tasks RCU stall output, and, under CONFIG_PROVE_RCU, assert that it is
zero on every return to userspace since no task can legitimately reach
userspace with a trampoline on its stack.

Only current ever writes the count and every nested user (interrupts
running their own trampolines) is balanced, so plain accesses suffice.

The callbacks reached from static trampolines (return_to_handler, the
rethook and kretprobe trampolines) are covered by the preempt_disable()
in the ftrace recursion protection rather than by the count; note that
dependency in trace_recursion.h so it is not lost if the
preempt_disable() is ever removed from there.

Nothing increments the count and nothing consults it for quiescent-state
decisions yet; both come in later patches.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/irq-entry-common.h |  2 ++
 include/linux/rcupdate.h         | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/sched.h            |  1 +
 include/linux/trace_recursion.h  | 11 +++++++++++
 kernel/fork.c                    |  1 +
 kernel/rcu/tasks.h               |  3 ++-
 6 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 0bb6c03481fa..8da571622000 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -5,6 +5,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/kmsan.h>
+#include <linux/rcupdate.h>
 #include <linux/rseq_entry.h>
 #include <linux/static_call_types.h>
 #include <linux/syscalls.h>
@@ -214,6 +215,7 @@ static __always_inline void __exit_to_user_mode_validate(void)
 {
 	/* Ensure that kernel state is sane for a return to userspace */
 	kmap_assert_nomap();
+	rcu_tasks_trampoline_assert_none();
 	lockdep_assert_irqs_disabled();
 	lockdep_sys_exit();
 }
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 44c07a66edff..b5c666c82479 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -180,6 +180,37 @@ static inline void rcu_nocb_flush_deferred_wakeup(void) { }
 #ifdef CONFIG_TASKS_RCU_GENERIC
 
 # ifdef CONFIG_TASKS_RCU
+
+/*
+ * Trampoline nesting: dynamically allocated text (ftrace trampolines, BPF
+ * trampoline images, kprobe optinsn slots) that relies on Tasks RCU for its
+ * lifetime brackets itself with an increment/decrement of
+ * current->rcu_tramp_nesting.  While the count is non-zero the task is inside,
+ * or was called from, such text and an involuntary context switch must not be
+ * treated as a Tasks RCU quiescent state.
+ *
+ * Only current writes the count and only current (or an interrupt on the same
+ * CPU) reads it, so plain accesses suffice.
+ */
+static __always_inline void rcu_tasks_trampoline_enter(void)
+{
+	current->rcu_tramp_nesting++;
+	barrier();
+}
+
+static __always_inline void rcu_tasks_trampoline_exit(void)
+{
+	barrier();
+	current->rcu_tramp_nesting--;
+}
+
+/* A task must never reach userspace with a trampoline on its stack. */
+static __always_inline void rcu_tasks_trampoline_assert_none(void)
+{
+	if (IS_ENABLED(CONFIG_PROVE_RCU))
+		WARN_ON_ONCE(current->rcu_tramp_nesting);
+}
+
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
 		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
@@ -192,6 +223,9 @@ void rcu_tasks_torture_stats_print(char *tt, char *tf);
 # define rcu_tasks_classic_qs(t, preempt) do { } while (0)
 # define call_rcu_tasks call_rcu
 # define synchronize_rcu_tasks synchronize_rcu
+static inline void rcu_tasks_trampoline_enter(void) { }
+static inline void rcu_tasks_trampoline_exit(void) { }
+static inline void rcu_tasks_trampoline_assert_none(void) { }
 # endif
 
 #define rcu_tasks_qs(t, preempt) rcu_tasks_classic_qs((t), (preempt))
@@ -208,6 +242,9 @@ void exit_tasks_rcu_finish(void);
 #define rcu_tasks_classic_qs(t, preempt) do { } while (0)
 #define rcu_tasks_qs(t, preempt) do { } while (0)
 #define rcu_note_voluntary_context_switch(t) do { } while (0)
+static inline void rcu_tasks_trampoline_enter(void) { }
+static inline void rcu_tasks_trampoline_exit(void) { }
+static inline void rcu_tasks_trampoline_assert_none(void) { }
 #define call_rcu_tasks call_rcu
 #define synchronize_rcu_tasks synchronize_rcu
 static inline void exit_tasks_rcu_start(void) { }
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..d2e7b1b3c9d2 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -956,6 +956,7 @@ struct task_struct {
 	unsigned long			rcu_tasks_nvcsw;
 	u8				rcu_tasks_holdout;
 	u8				rcu_tasks_idx;
+	int				rcu_tramp_nesting;
 	int				rcu_tasks_idle_cpu;
 	struct list_head		rcu_tasks_holdout_list;
 	int				rcu_tasks_exit_cpu;
diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index e6ca052b2a85..2da23a52ca4a 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -153,6 +153,17 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	current->trace_recursion = val;
 	barrier();
 
+	/*
+	 * Callbacks reached from static trampoline text (return_to_handler,
+	 * the rethook and kretprobe trampolines) do not maintain
+	 * current->rcu_tramp_nesting themselves; they rely on this
+	 * preempt_disable() to keep the task from being preempted, and thus
+	 * from reporting a Tasks RCU quiescent state, while an ftrace_ops or
+	 * its data is in use.  If the preempt_disable() is ever removed from
+	 * the recursion protection, this must rcu_tasks_trampoline_enter()
+	 * here and rcu_tasks_trampoline_exit() in trace_clear_recursion()
+	 * instead.  See CONFIG_RCU_TASKS_PREEMPT_QS.
+	 */
 	preempt_disable_notrace();
 
 	return bit;
diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..cfe3a8e53fbd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1869,6 +1869,7 @@ static inline void rcu_copy_process(struct task_struct *p)
 #endif /* #ifdef CONFIG_PREEMPT_RCU */
 #ifdef CONFIG_TASKS_RCU
 	p->rcu_tasks_holdout = false;
+	p->rcu_tramp_nesting = 0;
 	INIT_LIST_HEAD(&p->rcu_tasks_holdout_list);
 	p->rcu_tasks_idle_cpu = -1;
 	INIT_LIST_HEAD(&p->rcu_tasks_exit_list);
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 627295396cd9..1662ba18bf34 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1113,10 +1113,11 @@ static void check_holdout_task(struct task_struct *t,
 		*firstreport = false;
 	}
 	cpu = task_cpu(t);
-	pr_alert("%p: %c%c nvcsw: %lu/%lu holdout: %d idle_cpu: %d/%d\n",
+	pr_alert("%p: %c%c nvcsw: %lu/%lu holdout: %d tramp_nesting: %d idle_cpu: %d/%d\n",
 		 t, ".I"[is_idle_task(t)],
 		 "N."[cpu < 0 || !tick_nohz_full_cpu(cpu)],
 		 t->rcu_tasks_nvcsw, t->nvcsw, t->rcu_tasks_holdout,
+		 data_race(t->rcu_tramp_nesting),
 		 data_race(t->rcu_tasks_idle_cpu), cpu);
 	sched_show_task(t);
 }

-- 
2.55.0


