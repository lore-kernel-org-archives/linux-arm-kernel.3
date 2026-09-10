Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB452C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAaaOhrJ7Jcw63o+Xz8kKBY4jQKDr2HCsih3+9envV4=; b=WJePmD+ZF5xwbdt4UmO4kV8MIc
	bIPnbLOzFlgQIgWCJAUGvYwUHSCGX8oMw9NoN580TPzpEx44vEN7NsT0cFsxbN9fXclQIw+YBYwyI
	qADfXr2+x9u5WrlqKCBIlLK7aQr34JpkiekCY0O+s5KyERz4yJzlhixjlaT/VweAMzbRlLAhQ2G/y
	yQtE+2BKN5XndaZnLrTwAw8WAUGHVbKfy+7k/lAijVowErCw2IHoRB/X9vDJ0ERucjdzeVK5exSYU
	4VLvcj6GEZbnddzXSz8V8jRhinCakiidNhTgyBMh77Pk0ro9wxMZ9d7vuOegXlV7+0rXciBLYQ4ra
	yN/3KQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrd-0000000FBhi-13i2;
	Thu, 10 Sep 2026 18:51:13 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrY-0000000FBcX-1nUd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:09 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5300bdf61d9so1249241cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066267; x=1789671067; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAaaOhrJ7Jcw63o+Xz8kKBY4jQKDr2HCsih3+9envV4=;
        b=OpvM2t3ek+gknhaE8RO8Zn0AdGiXs5lbjiAOQG6DNkB0RKhB/9y9RjgXZyXjsgfYdl
         eRm2tTj/bJEnhZA7e77Q+3iQZSa7VPDrNbCt8HDZwkFHhC2JHPw7Nl/ilS4LJFrLppoL
         mzG1PTlnXslPNXwXdazBJixiFx+dvFLhESz+XFzgxGZCYLog5PNTH1vsaoQc6w2NP70f
         3c+tpsHsnLF+4irozN++mJMQhdT8/pKR6gM1RvlNbOUos4zcv2Nd/1EH9uzDEFWbNzPw
         1xEetJStqeTuJxBzuFe1wvHVbRYkXs7tRpgJO0ShPWH1+Dff/KBbjpOkR69+YvyLDLzz
         S7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066267; x=1789671067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAaaOhrJ7Jcw63o+Xz8kKBY4jQKDr2HCsih3+9envV4=;
        b=AJrPbLCNQwFJBYkewnlhm20owSw/pUZ2RSM7iTGEETQOZmARCLUiVvwZUdpFVl2qzq
         mdw3zlnpwdnSw4CYdo00B7ktGI7Sq8n6HpN0K1XEL/BeWFBzIVwVHHlrq9VCoj9IHJHY
         WvQAe1Wzslz6KlwNvdDgpIiPhSIs0hy1ck/JGroX40zb+yGwkP+xheva94kibjwRjUhf
         kgu+nU0jeoPmChs5tsXkuORV8p7J9Dcpq1rtExU32CghazM8pwYX5PYfFWO0yjujn4PQ
         nWmamiYBhtNOxY0WchiNR+Py8YglyRq0+P3q7JZQRryjtbbB+PylMlp195YgpzeIXPgF
         /0LA==
X-Forwarded-Encrypted: i=1; AKwUvBxFkAbZ5/P6DoGr4S/1rLX1G9ZJQWQowLf08Qwhh7aBpPARfSB+G9w0dHRROvIKYOnjYv+llkVX9k/Y0hM+FUXy@lists.infradead.org
X-Gm-Message-State: AFuF++mVXcdtjDz0aK5awtnwP45qTpBn6oxMfzi6XMGEq/tLihGrvVBQ
	tSUYAIx2NXL5SrnXZi1+3JvBLyk3GXt0aC5U0Vvl01CbTkM5QIktZVnLeuAdXt/xWuE=
X-Gm-Gg: AYBFou0anLPxT7wCTcvfdq4Jev/EN+PZJrNxC90R0pDGi5TqbfruchNUAEQyy1tpFFo
	z8HYU5mXtCZcEZ1CzElE4HngzRS5KerSRIdcwjJYSOGH4k2ALLc/2l2wKwj5/KgFfD5BwWxcBQN
	5x8sjJ18Iq+kA558ECQnIcMqTZtxPXdh6LJMn9bD93ZLrjm8wiMHuufgMmHHvvbo4QYaVj7i6FW
	0bv3SzVBN48nMs+j8TPw02xjWvvnH1vHmfk+h+ivSDFqcNfoR1vBEMP0/cq0MNnIdwU0UkN494m
	Mmy9Mc+cW3g2fR+zgQzfisITJq9tKhMXnCMxVl9gIkiEjugr9pjdiL6zAsOK00IIIkFdXS++Am8
	xJTw2Kb9qbKQao5L29v34KPzDqv+/Eddnf/3+2IuywbR104NpN508J2eLgqMUI7lzmtN2r/a9Mm
	0ZPAtcbBNUpbanot8FaQqixg1L6mebZN0rUn8yMyz0hY9MxQFg7QYfk1zB5g3+xDVwjy/sEfvPt
	/6VXE7Oaxgp0wx88C3OjRFx0T5h0a3eCDOrabkrwiODEBmauDDM+v1x
X-Received: by 2002:a05:622a:1309:b0:530:42d4:4c98 with SMTP id d75a77b69052e-530c8756e8amr10238141cf.42.1789066262237;
        Thu, 10 Sep 2026 11:51:02 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45a780sm2547836d6.10.2026.09.10.11.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:01 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:29 +0000
Subject: [PATCH RFC 06/13] x86/ftrace: Maintain Tasks RCU trampoline
 nesting in ftrace_caller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-6-d4469f4cc101@toxicpanda.com>
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
X-CRM114-CacheID: sfid-20260910_115108_511229_C0136EA6 
X-CRM114-Status: GOOD (  21.02  )
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

Bracket the call out to the ftrace_ops callback in ftrace_caller and
ftrace_regs_caller with an increment/decrement of
current->rcu_tramp_nesting.  The instructions sit inside the region that
create_trampoline() copies for per-ops dynamic trampolines, so those
inherit them; the %rip-relative per-CPU reference to current_task is
fixed up by text_poke_apply_relocation() like CALL_DEPTH_ACCOUNT's.
%rdx is dead at both points (about to be loaded with the ops pointer on
entry, restored by restore_mcount_regs on exit).

Two pieces of core text still run with the count at zero while holding
the address of a Tasks-RCU-protected trampoline they are about to
enter: the static stubs themselves, whose direct-call tails keep a BPF
trampoline address on the stack until the final RET, and, under
CONFIG_MITIGATION_RETHUNK, the return thunk that RET expands to.  Add an
ftrace_static_tramp_end marker after ftrace_stub_direct_tramp and linker
symbols around .text..__x86.return_thunk and .text..__x86.rethunk_safe,
and provide arch_rcu_tasks_ip_in_trampoline() covering
[ftrace_caller, ftrace_static_tramp_end) and both thunk ranges so the
irq-exit check treats a task interrupted there as still inside a
trampoline.

The hook is built only under CONFIG_RCU_TASKS_PREEMPT_QS, which x86 does
not select until a later patch.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/asm-offsets.c |  3 +++
 arch/x86/kernel/ftrace.c      | 37 +++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/ftrace_64.S   | 43 +++++++++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/vmlinux.lds.S |  4 ++++
 4 files changed, 87 insertions(+)

diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 081816888f7a..4f3b1caa5a30 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -46,6 +46,9 @@ static void __used common(void)
 #ifdef CONFIG_STACKPROTECTOR
 	OFFSET(TASK_stack_canary, task_struct, stack_canary);
 #endif
+#ifdef CONFIG_TASKS_RCU
+	OFFSET(TASK_rcu_tramp_nesting, task_struct, rcu_tramp_nesting);
+#endif
 
 	BLANK();
 	OFFSET(pbe_address, pbe, address);
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 17d6edfcb7e0..8f63cd4b543c 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -275,6 +275,43 @@ static inline void tramp_free(void *tramp)
 	execmem_free(tramp);
 }
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+extern void ftrace_static_tramp_end(void);
+extern char __return_thunk_start[], __return_thunk_end[];
+extern char __rethunk_safe_start[], __rethunk_safe_end[];
+
+/*
+ * See rcu_tasks_ip_in_trampoline().  Some core kernel text behaves like a
+ * trampoline for Tasks RCU purposes because a task executing there with
+ * rcu_tramp_nesting == 0 may still be about to enter a Tasks-RCU-protected
+ * trampoline whose address it already holds:
+ *
+ *  - the static ftrace_caller / ftrace_regs_caller / ftrace_stub_direct_tramp
+ *    stubs, which carry a direct-call target on the stack until their final
+ *    RET, and
+ *  - the return thunks that RET expands to under CONFIG_MITIGATION_RETHUNK,
+ *    which run after leaving the stubs above and before landing in that
+ *    target.
+ */
+bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
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
+#endif /* CONFIG_RCU_TASKS_PREEMPT_QS */
+
 /* Defined as markers to the end of the ftrace default trampolines */
 extern void ftrace_regs_caller_end(void);
 extern void ftrace_caller_end(void);
diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
index 62c1c93aa1c6..902472c41798 100644
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
@@ -145,6 +146,27 @@ SYM_FUNC_END(ftrace_stub_graph)
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().  These live
+ * inside the region copied into dynamic trampolines; the %rip-relative per-CPU
+ * reference is fixed up by text_poke_apply_relocation() in create_trampoline().
+ * The increment must precede the function_trace_op load: between that load and
+ * the call, the ops pointer in %rdx is protected only by Tasks RCU.
+ */
+.macro RCU_TASKS_TRAMP_ENTER reg:req
+#ifdef CONFIG_TASKS_RCU
+	movq PER_CPU_VAR(current_task), \reg
+	incl TASK_rcu_tramp_nesting(\reg)
+#endif
+.endm
+
+.macro RCU_TASKS_TRAMP_EXIT reg:req
+#ifdef CONFIG_TASKS_RCU
+	movq PER_CPU_VAR(current_task), \reg
+	decl TASK_rcu_tramp_nesting(\reg)
+#endif
+.endm
+
 SYM_FUNC_START(__fentry__)
 	ANNOTATE_NOENDBR
 	CALL_DEPTH_ACCOUNT
@@ -163,6 +185,8 @@ SYM_FUNC_START(ftrace_caller)
 	leaq MCOUNT_REG_SIZE+8(%rsp), %rcx
 	movq %rcx, RSP(%rsp)
 
+	RCU_TASKS_TRAMP_ENTER %rdx
+
 SYM_INNER_LABEL(ftrace_caller_op_ptr, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	/* Load the ftrace_ops into the 3rd parameter */
@@ -181,6 +205,8 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	call ftrace_stub
 
+	RCU_TASKS_TRAMP_EXIT %rdx
+
 	/* Handlers can change the RIP */
 	movq RIP(%rsp), %rax
 	movq %rax, MCOUNT_REG_SIZE(%rsp)
@@ -209,6 +235,8 @@ SYM_FUNC_START(ftrace_regs_caller)
 
 	CALL_DEPTH_ACCOUNT
 
+	RCU_TASKS_TRAMP_ENTER %rdx
+
 SYM_INNER_LABEL(ftrace_regs_caller_op_ptr, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	/* Load the ftrace_ops into the 3rd parameter */
@@ -246,6 +274,8 @@ SYM_INNER_LABEL(ftrace_regs_call, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	call ftrace_stub
 
+	RCU_TASKS_TRAMP_EXIT %rdx
+
 	/* Copy flags back to SS, to restore them */
 	movq EFLAGS(%rsp), %rax
 	movq %rax, MCOUNT_REG_SIZE(%rsp)
@@ -328,6 +358,19 @@ SYM_FUNC_START(ftrace_stub_direct_tramp)
 	RET
 SYM_FUNC_END(ftrace_stub_direct_tramp)
 
+/*
+ * [ftrace_caller, ftrace_static_tramp_end) is treated as trampoline text by
+ * rcu_tasks_ip_in_trampoline(): after RCU_TASKS_TRAMP_EXIT the stubs may
+ * still hold a direct-call target (a BPF trampoline) on the stack until the
+ * final RET, and that target's lifetime is guarded by Tasks RCU.  With
+ * return thunks the RET itself runs elsewhere; arch_rcu_tasks_ip_in_trampoline()
+ * covers the thunk text too.
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

-- 
2.55.0


