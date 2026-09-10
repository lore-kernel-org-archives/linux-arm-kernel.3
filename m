Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE81C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBIdGtm0mo8q5590yjvGhNrcgQrhEpuiN5lFQ+hlgEA=; b=IpswqmiwZkU4uBd/bKbxR37y3J
	pxbDuuANUxRfYVSNHgcRVgBqqIiKhtDJTMfp+++K+G9GoAFhHW3lEGmjYVqtp7uGmd3j0la44OQbO
	BvRSqPRlEcp8tYkUhnc0uc5FTiiL0ALl6wm2yKZ+s8NadlEQ2tKzn00Br+b8wdIA543icxq6xnKPF
	4/xcVlkM+t15KVCzRuPHW+oCB4bNC41OPma07+uOUJFDY38m9EHyETqiC1mfj23PV5Y0Mmhdb548u
	+DmxBhriVirShy/eGgpg9V/xeQ7KP5DnxiJjsQN1xOgzs7OA20cJBJXD+fm90nPHirWviBXhq9dGY
	P6lmZ+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrx-0000000FBzt-4AjA;
	Thu, 10 Sep 2026 18:51:34 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrj-0000000FBnV-1IZS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:26 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-9377f717879so14685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066278; x=1789671078; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBIdGtm0mo8q5590yjvGhNrcgQrhEpuiN5lFQ+hlgEA=;
        b=oEjrnVrAcG4sfzfQFlyLz/6/eCR4TS7KugahgVEpE3oVktFDT9TqWX89lfkPapyxVk
         eUsARc5o8Yxq2SFYNSSYv04xk12bddNXrN66VPdgLrHLBhUjb81Npv2ZdrURuTYZJIlc
         pBZP2iUk1e25j1phMoBdN7agkmeLdk75gLsOg9zOdOB6FyrIvQiZwE+iyXEZNj36uMBz
         bBDoNDN8gBIuH1XvQ74Bjgh45XOVIEJ/aWZoL77F0MnlwwuoiqgZx0c3x+MttXfzHYau
         fTQAUjYTIjIMBLJW6Op8ymr/LGitcCro55ubLLmue+JkTMzQmw01jDN3bMhTP33rm5it
         3wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066278; x=1789671078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lBIdGtm0mo8q5590yjvGhNrcgQrhEpuiN5lFQ+hlgEA=;
        b=s6bUJ7RJraPRsu55T7Mg2vAJ9Q3k1R1V12fdcjJfhO8b6c2am6X8ACF5X/MQdo/5jf
         WSCKe5Zt6Qamls4QBGkwfyBI8AmO0LxGWJt7uxc9CWG1cfYfel2AajMxJ9ssI4yDzgTq
         i0rKwSVPhjpkS4ypUXszDz1z2qXa1KxY11dW4B1dwp3UhCvrD1Widzg9SJ2KaFuFm4N1
         4ORN9mTL5ibhDMAXKI0wlT+7KBTUY5x7vntZ/jCgTs5sloqy2yuW7tWj4wEtdxUFn4E4
         HJxbp34G4+SrPParts50tHrxnOwXzbBP33CRRO5OsP+fzf0ZpOkz82d5Xd2b7Zu8WWVi
         DDnQ==
X-Forwarded-Encrypted: i=1; AKwUvByNhhNgt7U+V0jUhTUsQGTQ1G0zRc1r/xC6qXGq23pjHzmksjH0Ypuu/fv+n1vdfsAlrC/A+bhN3PyiVldTEo30@lists.infradead.org
X-Gm-Message-State: AFuF++kMqVSzaP7iecWetlGw37Sek1NzRLbB+T2dVMjSByMOdTD7NGGP
	TB5du6z2aj1I5TQncrATi0CnfZ1gG2lqrR6nb/BKimpZldlQLBgNIL2ThjJZOYQj7nU=
X-Gm-Gg: AYBFou3c5np6qSqIrNX/limnIAjE4bXP3h4f+SS8Ea3sg8UEcsbh3voor/Xzw+1/aVw
	wbGv6mCB9JCTTIUMWyywgB3TiZ8lJkbkY+XUakVMbGn1gajekpTL0+DH0bCU9NTLrJ/anS/Ayls
	YiK9QpkUFpCBDo0rQSuYN/BVpE/5OxF49dxa2+QvC002ZPwybu+IQFGzf+wY+NIouaPhpfk9/OX
	MdyX+I8QvYUhcLwlEFZrSqYLjYh9gv7ku1XJw8tubsrRaAMk8NN0QEJ0A9C+p+RrxZcqiNbBH1G
	UYSbvQJOzWD5NO58IkUL7iSA5oX8O9jPivzNDNkZbEtE5XEAdz6Z/6vPw1BanGUO+3PbSLTps/Y
	ZTL0kFqRirTgfs3h/VXuoDZYrBze/pSkNQinysO/rb14E6jutVTZZ4jFI0oNXm4n/9fqbODU5bS
	6vBza+KwzLPSwg4n0u+AtB1rML1942XeR1AEZnD5TAAWM7NBwRxLeq8tsdv7bFh/syczHgGNHK0
	hg4f71bDUz26nOb0DU5ENk0wNYHRjC42h1U2dPhlDgAuLniJHj47KL8
X-Received: by 2002:a05:620a:6a04:b0:937:4e12:5db6 with SMTP id af79cd13be357-939ea2a1e5dmr15410485a.43.1789066277808;
        Thu, 10 Sep 2026 11:51:17 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80f8142sm49848385a.43.2026.09.10.11.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:17 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:36 +0000
Subject: [PATCH RFC 13/13] rcu-tasks: Treat preemption outside trampolines
 as a quiescent state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-13-d4469f4cc101@toxicpanda.com>
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
X-CRM114-CacheID: sfid-20260910_115124_316126_52B21D4A 
X-CRM114-Status: GOOD (  24.48  )
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

Tasks RCU only accepts a voluntary context switch, usermode or idle as a
quiescent state, because a task that was preempted may be sitting in a
trampoline whose text is about to be freed.  On PREEMPT_LAZY kernels,
where cond_resched() is a no-op and CPU-bound kernel threads only ever
lose the CPU through preemption, that means any long-running kthread or
kworker stalls every synchronize_rcu_tasks() caller -- BPF and LSM
program detach and DYNAMIC ftrace_ops teardown via ftrace_shutdown(),
and kprobe (un)registration via the jump optimizer, which waits under
kprobe_mutex, text_mutex and cpus_read_lock() -- for its entire run,
unless someone sprinkles cond_resched_tasks_rcu_qs() into it.  A cgroup
writeback worker draining a large cgwb for eleven minutes was enough to
back 40+ tasks up behind trampoline_mutex and trip the hung-task panic.

With the previous patches, every Tasks-RCU-protected trampoline on
x86-64 and arm64 (ftrace_caller and its dynamic copies, BPF trampoline
images, the optprobe template, out-of-line direct trampolines) holds
current->rcu_tramp_nesting across its call-out, and the irq-exit
preemption path holds it across preempt_schedule_irq() whenever the
interrupted IP is somewhere the counter cannot cover: trampoline
entry/exit instructions and other dynamically allocated text, the static
ftrace stubs and x86 return thunks on the way into a direct-call target,
modules hosting their own direct trampolines, and the kprobe
jump-optimization window.  A task that is context-switched with the
count at zero therefore cannot be inside, called from, or about to
resume into anything Tasks RCU protects.

So let rcu_tasks_classic_qs() clear the holdout flag on a preemption
too when rcu_tramp_nesting is zero, on architectures that select
ARCH_HAS_RCU_TASKS_PREEMPT_QS, and select it for x86-64 and for arm64
with DYNAMIC_FTRACE_WITH_ARGS.  A running holdout is already poked via
rcu_request_urgent_qs_task(), which makes the next tick set
NEED_RESCHED; the resulting preemption -- from irq exit, or synchronously
at the next preempt_enable() -- now retires it, so a Tasks RCU grace
period is bounded by roughly a tick plus the longest preempt-disabled
section instead of by the longest stretch without a voluntary schedule().
Other architectures keep the voluntary-only rule.  Update the Tasks RCU
documentation comments and the FORCE_TASKS_RCU help text to match.

Cost: one load of current plus an inc/dec per trampoline entry and exit,
and on irq-exit preemption one core_kernel_text() check plus, with
OPTPROBES, MAX_OPTIMIZED_LENGTH-1 lockless kprobe hash lookups.

Not covered: x86-32 and the other GENERIC_IRQ_ENTRY architectures, and
return_to_handler / the rethook trampoline, whose C callees take the
ftrace recursion lock before touching any ops.

Tested under QEMU (x86-64, PREEMPT_LAZY, PREEMPT_RCU=n, PROVE_RCU, with
and without PREEMPT_DYNAMIC) against a kthread spinning in-kernel for
30s with the function tracer, an ftrace kprobe, an optimized kprobe and
fentry/fexit programs live: synchronize_rcu_tasks() 29.7s -> 0.1-0.3s,
ftrace_shutdown() of a DYNAMIC ops 27s -> 0.2-0.8s, the ftrace-direct
sample modules load/fire/unload in ~2.5s each during the spin, no
warnings.  arm64 is build-tested only.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/arm64/Kconfig       |  1 +
 arch/x86/Kconfig         |  1 +
 include/linux/rcupdate.h | 14 +++++++++++++-
 kernel/rcu/Kconfig       |  7 ++++---
 kernel/rcu/tasks.h       | 15 +++++++++++----
 5 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..0e6c1e0b236f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -44,6 +44,7 @@ config ARM64
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RCU_TASKS_PREEMPT_QS if DYNAMIC_FTRACE_WITH_ARGS
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_DIRECT_MAP
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec5ecac..0a6427019345 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -99,6 +99,7 @@ config X86
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RCU_TASKS_PREEMPT_QS	if X86_64
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_NONLEAF_PMD_YOUNG	if PGTABLE_LEVELS > 2
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if X86_64
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index e9afbbb1b061..356b1d6ef226 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -204,6 +204,11 @@ bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip);
  * non-trampoline user, kprobe jump optimization, which waits for tasks
  * preempted inside the instruction bytes it is about to overwrite.
  *
+ * With both in place, on architectures that select
+ * ARCH_HAS_RCU_TASKS_PREEMPT_QS, a preemption with rcu_tramp_nesting == 0 is
+ * a Tasks RCU quiescent state, and a CPU-bound kernel thread no longer needs
+ * to volunteer one via cond_resched_tasks_rcu_qs().
+ *
  * Only current writes the count and only current (or an interrupt on the same
  * CPU) reads it, so plain accesses suffice.
  */
@@ -228,9 +233,16 @@ static __always_inline void rcu_tasks_trampoline_assert_none(void)
 
 bool rcu_tasks_ip_in_trampoline(unsigned long ip);
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+#define rcu_tasks_preempt_is_qs(t)	(!READ_ONCE((t)->rcu_tramp_nesting))
+#else
+#define rcu_tasks_preempt_is_qs(t)	false
+#endif
+
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
-		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
+		if (READ_ONCE((t)->rcu_tasks_holdout) &&		\
+		    (!(preempt) || rcu_tasks_preempt_is_qs(t)))		\
 			WRITE_ONCE((t)->rcu_tasks_holdout, false);	\
 	} while (0)
 void call_rcu_tasks(struct rcu_head *head, rcu_callback_t func);
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 999f8228a13d..8e7c94329105 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -94,9 +94,10 @@ config FORCE_TASKS_RCU
 	default n
 	help
 	  This option force-enables a task-based RCU implementation
-	  that uses only voluntary context switch (not preemption!),
-	  idle, and user-mode execution as quiescent states.  Not for
-	  manual selection in most cases.
+	  that uses only voluntary context switch (not preemption, unless
+	  the architecture selects ARCH_HAS_RCU_TASKS_PREEMPT_QS and the
+	  task is outside any trampoline), idle, and user-mode execution
+	  as quiescent states.  Not for manual selection in most cases.
 
 config NEED_TASKS_RCU
 	bool
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index df68a330769a..78d2b78d3043 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -905,7 +905,10 @@ static void rcu_tasks_wait_gp(struct rcu_tasks *rtp)
 //
 // Simple variant of RCU whose quiescent states are voluntary context
 // switch, cond_resched_tasks_rcu_qs(), user-space execution, and idle.
-// As such, grace periods can take one good long time.  There are no
+// With CONFIG_RCU_TASKS_PREEMPT_QS, a preemption taken while the task is
+// not inside a trampoline (current->rcu_tramp_nesting == 0, see
+// rcu_tasks_trampoline_enter()) is a quiescent state as well; without it,
+// grace periods can take one good long time.  There are no
 // read-side primitives similar to rcu_read_lock() and rcu_read_unlock()
 // because this implementation is intended to get the system into a safe
 // state for some of the manipulations involved in tracing and the like.
@@ -1246,8 +1249,11 @@ static void tasks_rcu_exit_stall(struct timer_list *unused)
  * period elapses, in other words after all currently executing rcu-tasks
  * read-side critical sections have completed. call_rcu_tasks() assumes
  * that the read-side critical sections end at a voluntary context
- * switch (not a preemption!), cond_resched_tasks_rcu_qs(), entry into idle,
- * or transition to usermode execution.  As such, there are no read-side
+ * switch, cond_resched_tasks_rcu_qs(), entry into idle, transition to
+ * usermode execution, or, with CONFIG_RCU_TASKS_PREEMPT_QS, a preemption
+ * taken outside any trampoline (current->rcu_tramp_nesting == 0, see
+ * rcu_tasks_trampoline_enter()); otherwise a preemption is not a
+ * quiescent state.  As such, there are no read-side
  * primitives analogous to rcu_read_lock() and rcu_read_unlock() because
  * this primitive is intended to determine that all tasks have passed
  * through a safe state, not so much for data-structure synchronization.
@@ -1269,7 +1275,8 @@ EXPORT_SYMBOL_GPL(call_rcu_tasks);
  * executing rcu-tasks read-side critical sections have elapsed.  These
  * read-side critical sections are delimited by calls to schedule(),
  * cond_resched_tasks_rcu_qs(), idle execution, userspace execution, calls
- * to synchronize_rcu_tasks(), and (in theory, anyway) cond_resched().
+ * to synchronize_rcu_tasks(), (in theory, anyway) cond_resched(), and,
+ * with CONFIG_RCU_TASKS_PREEMPT_QS, preemption outside any trampoline.
  *
  * This is a very specialized primitive, intended only for a few uses in
  * tracing and other situations requiring manipulation of function

-- 
2.55.0


