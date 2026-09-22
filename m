Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A43C982FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HscWMACQBaXdyi2sA4ZdN71wnPrvQNOWSxMsTvhV6Ow=; b=k5rnJ+JttURnc60Qm+kWiRcwAj
	+tWcT3SeYOh9MEOoTIl3bFz9Vmr5/bo/mqhWeLwuTIk0t06H0Kn++9tc1ulGyxSzkBoFBxugRV/Ig
	2250fK3YiKnRIxtopYKDT2SUa41I9fVaIiMvcL+17Fz/HYPkE+qsbz/PjYQ/FvwTNUF7m8UqLwtO1
	7IU8smBBr5ATvwP8m95MI2PfXjoVmwgWRRabnePPxEq1jpEVQaq3rJI5Vq+pUuDJNLBSjPq6EsoEX
	ONHuzRlq5gL+juUsZ/rbsXr4heBXVDvHU89zMeP0T8yEbKOnk6UtUFA42hNHLhMTQX+TA7B7k1O+0
	QGtzwPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qFL-00000003ygG-3OXM;
	Tue, 22 Sep 2026 02:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qFL-00000003yfl-108L
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 02:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HscWMACQBaXdyi2sA4ZdN71wnPrvQNOWSxMsTvhV6Ow=; b=pXfW8qErSejmBhwvuqW5K/qbm5
	sL8WugcD/fl2BlLJi85fbBTNJcOg5jQq54hMz4jKAD6zYF/Dsvsdb+cNauMbk6k94T5bUzxOHjDwT
	wA6DLK2H6whk1L+lZtyer+lRLIZx+zTSM3bampSXjbGF+n94aE/Xse4CiSV/kQktNo1yMzUUnFXMi
	kXe+45CHF1RYM9N5yKmDBmXhjtS02Ps0vsRf6ZSVPaY80+AMrU7Jk6xAjjULhTTNMFJu5hquZMYuA
	XOD1+GldXkx8Igmsc2C6kJIgKTjvoDCJxI7+6OusYykwSgMi42rDAij02KozZ+kKP31+0mVGrViup
	f3DuWUbg==;
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8qFG-0000000D0xp-2N6b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:28:38 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so43718856d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044112; x=1790648912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HscWMACQBaXdyi2sA4ZdN71wnPrvQNOWSxMsTvhV6Ow=;
        b=CENLqc0cNDih1YKiALJJ3oiJi3Sx7ogy1H5ZDSka/Qf/OozMnFXGg2l0sE3VzUFXtX
         MEPG5Pcb+UftYA1rtOqbWPbw7jHVKFWygGxcfzDErELk+JM8iWw72G72GzlIt+Xgl6hQ
         aXhVlbrYjvezFPmmaAnZi3guISTlY4DJIWacyHk1zKUUWQsc2zK+E5E9y1JJj3OxY85f
         QXHC+Ddncmqcc5AK6PA+9L8WlAS+jwaUbtPdEWzBHJv5eoNYC1Ft4XJl0WMKTo4zaOn4
         WAQarL9WCR2DXamV6zyxzKdZ3eHZ251ysb4JM0l7vmOFVaMkiqsVkvSyeXasZ2Ij0+pb
         OZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044112; x=1790648912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HscWMACQBaXdyi2sA4ZdN71wnPrvQNOWSxMsTvhV6Ow=;
        b=evUqFFPmUE1cqKcGpPz6LBwmJm++gFFC81Ooo9o6EKf1gTfx4RHZrpeyztTU9GI5Ep
         KadyTbMu6QQDQBEI818xL9dm1YNs62m+BQmn6b+7gtS0JlHua4CxCBrxTM2Q+HU5Db9t
         JUG1HqAzB/Hi0d5ORM4pqs8mn+Z16EuH2BQLj/TfEY3UmnCEwk0TTiu8YzYrf82EgU3g
         1QOOlQPJScvIgRxFyWafiPNEeneYy1LityY84P4mol7WJaUvsH1UEN5dZars31GMBshy
         6WY1hYCh2bZfM92+mcTBEt5ZwnDYftle/GmxqCe8gCY3C6Rh8fcZFugSU4cV9ut9uau3
         CPHA==
X-Forwarded-Encrypted: i=1; AKwUvBzBsFnudjBnT3BhNvMsWd163m3QJV2BezNqPNo4imLjX0mVdOBHYF8v5RrG7mhT0CeBOZlhuxvVe2I8d1HgRuWU@lists.infradead.org
X-Gm-Message-State: AFuF++k3z0Dkl93U+8fPWroPypLW7xWW0R3VVBkKSv0uXeJfdInC+Z6G
	CmoNSdFcmpkl7HQmmXkD9KBcms7LJhHWh2GfzfM31q/TeHZTJ9AGg3byREde2YSzx6P09kt2b63
	y0abQVLIQ6g==
X-Gm-Gg: AYBFou3q3XKzuty775zXOxaDmE8afLgB7Q/C7bYelDnGZw0TzVv68q+kwfUw+0d2GUZ
	C1f6fr7IHo9KTg4NkmbH1NYXPUuKB/fjWgAy/wGPuBb79KZOJOzNY3GDhTyxAv4OrBqx2pfaxpU
	5kiq1s+b2dOq17tr6HgxjgJV1gSzPWVbi0BW4I49VoiP8A3iHr3bYhpL74QLUC1QBeHWbsp50OL
	zPZhp1dl2/N25g+DpI8gKNM7VMcVkMQ2FgWN4RiafTP5h1LVqZ6K7UYJGyl1YiuP2DKvhNoqMlX
	7U1A3eYWa2BlsCzzDll5AFh6INtvU5QTeKQKYqPSV8cDyc7ZDACXLLzl0YZC3kbCRmvqAbw3Kc3
	JEV1EILrlhDqUisc+zngDajTG9A4S+F4bwpDLkyqZExKVETSPh7HFhhj3i777AMjcTuZ5BGpivC
	k0KNvUwjEGbY/aTZXdznrpTNE0D2+DskFfO7tuIXSpiKK38nSaZE79nWOFdnZm8AWWq4PEmls79
	HvHUE8QUmvqXqg=
X-Received: by 2002:a05:620a:a414:20b0:93b:d7a1:ba0e with SMTP id af79cd13be357-93c166802c5mr232637985a.57.1790044112434;
        Mon, 21 Sep 2026 19:28:32 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d19ff89sm22030785a.24.2026.09.21.19.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:28:31 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:24 +0000
Subject: [PATCH v5 05/13] x86/ftrace: Take a Tasks Trace reader around
 ftrace_caller's call-out
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-5-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=10955;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=1mhltqxNnCEQ1bcCikw9zgimeks9K7E+TczS0kwNUMw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QF9CdIkGApa945J1vk2W+WTwCDI23VixB6KL4xohl05jh4SjouoFpLKPU7RYPX/mzDNzARG4WqR
 0vsgs6UviVQA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_032834_770943_B50A7112 
X-CRM114-Status: GOOD (  24.09  )
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

For HAVE_RCU_TRAMPOLINE_READERS the ftrace trampolines must be Tasks
Trace RCU readers while they call out, since that -- and not the absence
of a voluntary context switch -- is what synchronize_rcu_tasks() will
wait for before ftrace_shutdown() frees a dynamic trampoline or its ops.

Open-code rcu_read_lock_trace() and rcu_read_unlock_trace() in
ftrace_caller and ftrace_regs_caller: bump current->trc_reader_nesting
and, for the outermost reader, do the SRCU-fast per-CPU increment on
rcu_tasks_trace_srcu_struct and stash the counter pointer in
current->trc_reader_scp, exactly as the C inlines do (including the
smp_mb() when CONFIG_TASKS_TRACE_RCU_NO_MB is not set).  The lock sits
before the function_trace_op load, because between that load and the
call the ops pointer is protected only by Tasks RCU, and the unlock
after the call returns.  Note at rcu_read_lock_trace() that it now has
open-coded copies that have to be kept in step.  The sequences are inside the region that
create_trampoline() copies for per-ops trampolines; their %rip-relative
references are fixed up by text_poke_apply_relocation() like
CALL_DEPTH_ACCOUNT's.  %rax and %rcx are dead at both points.

Two pieces of core text still run outside that reader while holding
the address of a Tasks-RCU-protected trampoline they are about to
enter: the static stubs themselves, whose direct-call tails keep a BPF
trampoline address on the stack until the final RET, and, under
CONFIG_MITIGATION_RETHUNK, the return thunk that RET expands to.  Add an
ftrace_static_tramp_end marker after ftrace_stub_direct_tramp and linker
symbols around .text..__x86.return_thunk and .text..__x86.rethunk_safe,
and provide arch_rcu_tasks_trampoline_text() covering
[ftrace_caller, ftrace_static_tramp_end) and both thunk ranges so the
irq-exit check treats a task interrupted there as a holdout.

All of this is built only under CONFIG_TASKS_RCU_TRAMPOLINE_READERS,
which x86 does not enable until a later patch.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/asm-offsets.c  |  8 +++++
 arch/x86/kernel/ftrace.c       | 43 ++++++++++++++++++++++++++
 arch/x86/kernel/ftrace_64.S    | 69 ++++++++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/vmlinux.lds.S  |  4 +++
 include/linux/rcupdate_trace.h |  6 ++++
 5 files changed, 130 insertions(+)

diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 081816888f7a..876c3986419a 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -9,6 +9,7 @@
 #include <linux/crypto.h>
 #include <crypto/aria.h>
 #include <linux/sched.h>
+#include <linux/srcu.h>
 #include <linux/stddef.h>
 #include <linux/hardirq.h>
 #include <linux/suspend.h>
@@ -46,6 +47,13 @@ static void __used common(void)
 #ifdef CONFIG_STACKPROTECTOR
 	OFFSET(TASK_stack_canary, task_struct, stack_canary);
 #endif
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	OFFSET(TASK_trc_reader_nesting, task_struct, trc_reader_nesting);
+	OFFSET(TASK_trc_reader_scp, task_struct, trc_reader_scp);
+	OFFSET(SRCU_srcu_ctrp, srcu_struct, srcu_ctrp);
+	OFFSET(SRCU_CTR_srcu_locks, srcu_ctr, srcu_locks);
+	OFFSET(SRCU_CTR_srcu_unlocks, srcu_ctr, srcu_unlocks);
+#endif
 
 	BLANK();
 	OFFSET(pbe_address, pbe, address);
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 17d6edfcb7e0..9babaed483eb 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -275,6 +275,49 @@ static inline void tramp_free(void *tramp)
 	execmem_free(tramp);
 }
 
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+extern void ftrace_static_tramp_end(void);
+extern char __return_thunk_start[], __return_thunk_end[];
+extern char __rethunk_safe_start[], __rethunk_safe_end[];
+
+/*
+ * The SRCU-fast increments in TRACE_RCU_READ_LOCK/UNLOCK (ftrace_64.S) are the
+ * this_cpu_inc() form.
+ */
+static_assert(!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE));
+
+/*
+ * See rcu_tasks_trampoline_text().  Some core kernel text behaves like a
+ * trampoline for Tasks RCU purposes because a task executing there outside
+ * any Tasks Trace reader may still be about to enter a Tasks-RCU-protected
+ * trampoline whose address it already holds:
+ *
+ *  - the static ftrace_caller / ftrace_regs_caller / ftrace_stub_direct_tramp
+ *    stubs, which carry a direct-call target on the stack until their final
+ *    RET, and
+ *  - the return thunks that RET expands to under CONFIG_MITIGATION_RETHUNK,
+ *    which run after leaving the stubs above and before landing in that
+ *    target.
+ */
+bool arch_rcu_tasks_trampoline_text(unsigned long ip)
+{
+	if (ip >= (unsigned long)ftrace_caller &&
+	    ip <  (unsigned long)ftrace_static_tramp_end)
+		return true;
+#ifdef CONFIG_MITIGATION_RETPOLINE
+	if (ip >= (unsigned long)__return_thunk_start &&
+	    ip <  (unsigned long)__return_thunk_end)
+		return true;
+#endif
+#ifdef CONFIG_MITIGATION_SRSO
+	if (ip >= (unsigned long)__rethunk_safe_start &&
+	    ip <  (unsigned long)__rethunk_safe_end)
+		return true;
+#endif
+	return false;
+}
+#endif /* CONFIG_TASKS_RCU_TRAMPOLINE_READERS */
+
 /* Defined as markers to the end of the ftrace default trampolines */
 extern void ftrace_regs_caller_end(void);
 extern void ftrace_caller_end(void);
diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
index 62c1c93aa1c6..5d8cb3861978 100644
--- a/arch/x86/kernel/ftrace_64.S
+++ b/arch/x86/kernel/ftrace_64.S
@@ -7,6 +7,7 @@
 #include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
+#include <asm/percpu.h>
 #include <asm/ptrace.h>
 #include <asm/ftrace.h>
 #include <asm/nospec-branch.h>
@@ -145,6 +146,53 @@ SYM_FUNC_END(ftrace_stub_graph)
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
+/*
+ * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace(), see
+ * include/linux/rcupdate_trace.h and CONFIG_HAVE_RCU_TRAMPOLINE_READERS: the
+ * trampoline and the ftrace_ops it is about to load are kept alive by Tasks
+ * RCU only while we are inside this reader, so the lock must precede the
+ * function_trace_op load and the unlock must follow the call.  These live
+ * inside the region copied into dynamic trampolines; the %rip-relative
+ * references are fixed up by text_poke_apply_relocation() in
+ * create_trampoline().  Clobbers %rax, %rcx and flags.
+ */
+.macro TRACE_RCU_READ_LOCK
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	movq	PER_CPU_VAR(current_task), %rcx
+	movl	TASK_trc_reader_nesting(%rcx), %eax
+	incl	TASK_trc_reader_nesting(%rcx)
+	testl	%eax, %eax
+	jnz	.Ltrl_nested_\@
+	movq	rcu_tasks_trace_srcu_struct+SRCU_srcu_ctrp(%rip), %rax
+	incq	%gs:SRCU_CTR_srcu_locks(%rax)
+	movq	%rax, TASK_trc_reader_scp(%rcx)
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+	lock addl $0, -4(%rsp)		/* smp_mb() */
+#endif
+.Ltrl_nested_\@:
+#endif
+.endm
+
+.macro TRACE_RCU_READ_UNLOCK
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	movq	PER_CPU_VAR(current_task), %rcx
+	movl	TASK_trc_reader_nesting(%rcx), %eax
+	subl	$1, %eax
+	jnz	.Ltru_nested_\@
+	/* Outermost: pick up scp before an interrupt can see nesting == 0. */
+	movq	TASK_trc_reader_scp(%rcx), %rax
+	movl	$0, TASK_trc_reader_nesting(%rcx)
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+	lock addl $0, -4(%rsp)		/* smp_mb() */
+#endif
+	incq	%gs:SRCU_CTR_srcu_unlocks(%rax)
+	jmp	.Ltru_done_\@
+.Ltru_nested_\@:
+	movl	%eax, TASK_trc_reader_nesting(%rcx)
+.Ltru_done_\@:
+#endif
+.endm
+
 SYM_FUNC_START(__fentry__)
 	ANNOTATE_NOENDBR
 	CALL_DEPTH_ACCOUNT
@@ -163,6 +211,8 @@ SYM_FUNC_START(ftrace_caller)
 	leaq MCOUNT_REG_SIZE+8(%rsp), %rcx
 	movq %rcx, RSP(%rsp)
 
+	TRACE_RCU_READ_LOCK
+
 SYM_INNER_LABEL(ftrace_caller_op_ptr, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	/* Load the ftrace_ops into the 3rd parameter */
@@ -181,6 +231,8 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	call ftrace_stub
 
+	TRACE_RCU_READ_UNLOCK
+
 	/* Handlers can change the RIP */
 	movq RIP(%rsp), %rax
 	movq %rax, MCOUNT_REG_SIZE(%rsp)
@@ -209,6 +261,8 @@ SYM_FUNC_START(ftrace_regs_caller)
 
 	CALL_DEPTH_ACCOUNT
 
+	TRACE_RCU_READ_LOCK
+
 SYM_INNER_LABEL(ftrace_regs_caller_op_ptr, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	/* Load the ftrace_ops into the 3rd parameter */
@@ -246,6 +300,8 @@ SYM_INNER_LABEL(ftrace_regs_call, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	call ftrace_stub
 
+	TRACE_RCU_READ_UNLOCK
+
 	/* Copy flags back to SS, to restore them */
 	movq EFLAGS(%rsp), %rax
 	movq %rax, MCOUNT_REG_SIZE(%rsp)
@@ -328,6 +384,19 @@ SYM_FUNC_START(ftrace_stub_direct_tramp)
 	RET
 SYM_FUNC_END(ftrace_stub_direct_tramp)
 
+/*
+ * [ftrace_caller, ftrace_static_tramp_end) is treated as trampoline text by
+ * rcu_tasks_trampoline_text(): outside TRACE_RCU_READ_LOCK/UNLOCK the stubs
+ * may still hold a direct-call trampoline address (ORIG_RAX / the return
+ * address they RET to) that only Tasks RCU keeps alive.  With return thunks
+ * the RET itself runs elsewhere; arch_rcu_tasks_trampoline_text() covers
+ * those too.
+ */
+SYM_CODE_START_NOALIGN(ftrace_static_tramp_end)
+	UNWIND_HINT_UNDEFINED
+	ANNOTATE_NOENDBR
+SYM_CODE_END(ftrace_static_tramp_end)
+
 #else /* ! CONFIG_DYNAMIC_FTRACE */
 
 SYM_FUNC_START(__fentry__)
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2438b89a4620..e546283dc267 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -151,7 +151,9 @@ SECTIONS
 		 * definition.
 		 */
 		. = srso_alias_untrain_ret | (1 << 2) | (1 << 8) | (1 << 14) | (1 << 20);
+		__rethunk_safe_start = .;
 		*(.text..__x86.rethunk_safe)
+		__rethunk_safe_end = .;
 #endif
 		ALIGN_ENTRY_TEXT_END
 
@@ -162,7 +164,9 @@ SECTIONS
 		SOFTIRQENTRY_TEXT
 #ifdef CONFIG_MITIGATION_RETPOLINE
 		*(.text..__x86.indirect_thunk)
+		__return_thunk_start = .;
 		*(.text..__x86.return_thunk)
+		__return_thunk_end = .;
 #endif
 		STATIC_CALL_TEXT
 		*(.gnu.warning)
diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
index 273c59a03251..dcdb11643496 100644
--- a/include/linux/rcupdate_trace.h
+++ b/include/linux/rcupdate_trace.h
@@ -92,6 +92,12 @@ static inline void rcu_read_unlock_tasks_trace(struct srcu_ctr __percpu *scp)
  * the all the other tasks exit their critical sections.
  *
  * For more details, please see the documentation for rcu_read_lock().
+ *
+ * CONFIG_HAVE_RCU_TRAMPOLINE_READERS architectures open-code this pair in
+ * their ftrace and BPF trampolines (arch/x86/kernel/ftrace_64.S,
+ * arch/x86/kernel/kprobes/opt.c, arch/x86/net/bpf_jit_comp.c,
+ * arch/arm64/kernel/entry-ftrace.S, arch/arm64/net/bpf_jit_comp.c,
+ * samples/ftrace/ftrace-direct.h); changes here need to be mirrored there.
  */
 static inline void rcu_read_lock_trace(void)
 {

-- 
2.55.0


