Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4AEC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=; b=SXTRtuDPh/e5gUMT+inxZzdLY9
	RXkLnLD5L5ePwTYlDe2rkRrZAvyy5QAR24QN6UT8xQkrBHmLzw1vX5yRYvAPMJuwO426m0KDW+JXU
	awRS821Bweb0GNPv1CUQINoBMnLUHcuIch/rsmnzNADC9F5wD7HrERyCJKfKxvazZEOIyqjiaCqSN
	5KGBnHWxsSGuiexGRl5nxdLtHmi2t/E9UaV01n3lay3wZa9Pow+T6IVhd8ndM0/FgJTaOjTZ/yuBM
	eZR0/tGtpr3rnTHMK8P9O9QrYhfZ9ZA9eMJN76TOALnyQWFHzKZqffBk+SbXaXKgKl4hNzAYFtScW
	PcsWVxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrv-0000000FBxF-3T1Y;
	Thu, 10 Sep 2026 18:51:31 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jra-0000000FBeg-3F0t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:12 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92ed19f4d60so13506685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066269; x=1789671069; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=;
        b=ryYxo3kbymGNRzYRUApAQ4M4Vh/CCcaHBVwMQObhc9tYC3Myu6GYzLkkfcQ3+I27nv
         RV2S/kVVMt6U+M1+7N5rkXlZPN5IUguyxWumWHrTr6ZjgbxtQj9p1CoriNnxZDWdAcYM
         e6VUCL+rYwDRpDMVQGIBI/VKKajzoADp8Tb1lniTKRr1xpjsUUpwnlawZfttcEurDroW
         /UkbruC+Ku3YJMCm2szqus9uiYLL8Cca0Q1xtfL1CCaT275Na8UQY52LjyhqcLl7DMQh
         GvLciTuuDyM+8zFc+CKuP0Mg3mnuEzNZZzI/3VGLYYNiemgAKVanWsBTBkT7RrV2p5Xo
         tuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066269; x=1789671069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=;
        b=pX+LEEi1gozNvr5onren8DXfIEKxIHkS0hXexdu0NRqGCIAfqjK1LHZKCSlKhuQ3zA
         VMTND/U0kQfCct7U9EfOqaZjJI3P+0GP9m8rsrpCdonFotXWe/kHGBRslUcE2ZkIs6Gf
         W4RZ0AGW1XvxLbW8KMMMurHsNeXT2clGux+HWsGI0K+366NKPWxK2p4fyQ3B/fGJzwW2
         AgGHAhBVpAa5RuaPjhER4wH08W7SioQVt+NU7ejUFBxUb1wkZoxlh5utPizOkFVlZwXI
         e5mw+TZVNDK3rej3o3Xx3QDcB4ZfDV/DhfIIcg4MskQhyqBHKgdTk4sdMGZoo2GJGB39
         1Egw==
X-Forwarded-Encrypted: i=1; AKwUvBxIUb/i0hipB6399hxDH/RbTgg1b9S71EIUxVAQb3rVo9jPrlN2qW59VLAwbwpAkxIs88G3WTM+L/NCLsmc3S3m@lists.infradead.org
X-Gm-Message-State: AFuF++lPgMPt9BwTTy2Y72AYUrk+5WNJArS/hMigKWLvbMkjNLm9Xmjp
	JhilcR6oMIjJHXK1CHpFPL5J+FREIiarJkTedAfr5ck3u/oPkRzVi2ImZROaWtSv47k=
X-Gm-Gg: AYBFou2G4sm9DB70oC9/GCTEPnaT48Gu7ML0Xj/jLEFIcSX19rNrWS1rRMmf//hgksO
	IQuxaF0ppr3Lg4ZLOdhWwt+mP/ddjRdMs5vWZ5j66mlvPZ+LePuyq2X758FeCDhXWgMkFxSi7Z8
	Ag1IviXQpOX15gyOsej1TZJdZ/lqvhvfTNMgmJaR7lQaSlHhBG7rjcMA31UJLBXjYM7uPTmOaFj
	RYf5QpFxr9FrPQcuamHejljtJUEMw779/suZk6btYNvke0jk5JU1YLaRRDvrKGBfY3Nx/tIUVA8
	SFrf/kobAWjA7HYYP4ziHpcVk1cwL8W93sfeh1UALt4ksvcRcDwfkUAaydVxqz0K+fS0eFX3DEg
	dvwMxqem8Y+6ciaBXjlIj0bjO/ur4yg1KT0kOI/9hDZpq2uX9oTHqgw+7OPGTrBP8IEMikGSgIi
	SPI6SOs7zq1rCnlvZmUPfetkfLX2wrKFO4uOBOG6sKAxc108sJil41kyNv7uWC4i6BCNlLfQLpS
	9fNy8O+n1TscJbtOZceryz9hryW3Thb6PmSeBmx4Qf3OcX0uM6rLPGmxX9BhUr4tfM=
X-Received: by 2002:a05:620a:1a0a:b0:939:ca72:bef8 with SMTP id af79cd13be357-939d7fe4f58mr706492885a.41.1789066269332;
        Thu, 10 Sep 2026 11:51:09 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f1da12sm50063385a.9.2026.09.10.11.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:08 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:32 +0000
Subject: [PATCH RFC 09/13] arm64: ftrace: Maintain Tasks RCU trampoline
 nesting in ftrace_caller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-9-d4469f4cc101@toxicpanda.com>
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
X-CRM114-CacheID: sfid-20260910_115110_843767_8C6A5E99 
X-CRM114-Status: GOOD (  17.65  )
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

Bracket the call out to the ftrace_ops callback in ftrace_caller with an
increment/decrement of current->rcu_tramp_nesting, using x12/w13 which
are scratch there.  The read-modify-write is not atomic, but only current
modifies the count and every interrupting user is balanced, so nothing is
lost.

ftrace_caller itself, including the early CALL_OPS direct path and the
late direct tail that carry a BPF trampoline address in x17 with the
count at zero, is static kernel text: add an ftrace_static_tramp_end
marker after ftrace_stub_direct_tramp and provide
arch_rcu_tasks_ip_in_trampoline() covering
[ftrace_caller, ftrace_static_tramp_end) so the irq-exit check treats a
task interrupted anywhere in it as inside a trampoline.

The hook is built only under CONFIG_RCU_TASKS_PREEMPT_QS, which arm64
does not select until a later patch.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/arm64/kernel/asm-offsets.c  |  3 +++
 arch/arm64/kernel/entry-ftrace.S | 35 +++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/ftrace.c       | 16 ++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 9c853ed3ceab..f6655a284f18 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -39,6 +39,9 @@ int main(void)
   DEFINE(TSK_STACK,		offsetof(struct task_struct, stack));
 #ifdef CONFIG_STACKPROTECTOR
   DEFINE(TSK_STACK_CANARY,	offsetof(struct task_struct, stack_canary));
+#endif
+#ifdef CONFIG_TASKS_RCU
+  DEFINE(TSK_RCU_TRAMP_NESTING,	offsetof(struct task_struct, rcu_tramp_nesting));
 #endif
   BLANK();
   DEFINE(THREAD_CPU_CONTEXT,	offsetof(struct task_struct, thread.cpu_context));
diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
index 025140caafe7..46a102e7199a 100644
--- a/arch/arm64/kernel/entry-ftrace.S
+++ b/arch/arm64/kernel/entry-ftrace.S
@@ -14,6 +14,33 @@
 #include <asm/insn.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().  The whole
+ * of ftrace_caller is treated as trampoline text by the irq-exit IP check (see
+ * arch_rcu_tasks_ip_in_trampoline()), so these only need to bracket the call
+ * out to ops->func; everything before the increment and after the decrement,
+ * including the direct-call tails that carry a BPF trampoline address in x17,
+ * is covered by that.  The count is only modified by current and every nested
+ * user (interrupts) is balanced, so a plain ldr/add/str is sufficient.
+ */
+	.macro rcu_tasks_tramp_enter, tsk:req, tmp:req
+#ifdef CONFIG_TASKS_RCU
+	mrs	\tsk, sp_el0
+	ldr	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+	add	\tmp, \tmp, #1
+	str	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+#endif
+	.endm
+
+	.macro rcu_tasks_tramp_exit, tsk:req, tmp:req
+#ifdef CONFIG_TASKS_RCU
+	mrs	\tsk, sp_el0
+	ldr	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+	sub	\tmp, \tmp, #1
+	str	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+#endif
+	.endm
+
 /*
  * Due to -fpatchable-function-entry=2, the compiler has placed two NOPs before
  * the regular function prologue. For an enabled callsite, ftrace_init_nop() and
@@ -94,6 +121,8 @@ SYM_CODE_START(ftrace_caller)
 	stp	x29, x30, [sp, #FREGS_SIZE]
 	add	x29, sp, #FREGS_SIZE
 
+	rcu_tasks_tramp_enter x12, w13
+
 	/* Prepare arguments for the tracer func */
 	sub	x0, x30, #AARCH64_INSN_SIZE		// ip (callsite's BL insn)
 	mov	x1, x9					// parent_ip (callsite's LR)
@@ -111,6 +140,8 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	bl      ftrace_stub				// func(ip, parent_ip, op, regs)
 #endif
 
+	rcu_tasks_tramp_exit x12, w13
+
 /*
  * At the callsite x0-x8 and x19-x30 were live. Any C code will have preserved
  * x19-x29 per the AAPCS, and we created frame records upon entry, so we need
@@ -178,6 +209,10 @@ SYM_CODE_START(ftrace_stub_direct_tramp)
 SYM_CODE_END(ftrace_stub_direct_tramp)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
+/* End of [ftrace_caller, ...) for arch_rcu_tasks_ip_in_trampoline(). */
+SYM_CODE_START(ftrace_static_tramp_end)
+SYM_CODE_END(ftrace_static_tramp_end)
+
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
 
 /*
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index e1a3c0b3a051..1b7ac2afed0d 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -17,6 +17,22 @@
 #include <asm/insn.h>
 #include <asm/text-patching.h>
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+extern void ftrace_static_tramp_end(void);
+
+/*
+ * See rcu_tasks_ip_in_trampoline().  ftrace_caller and ftrace_stub_direct_tramp
+ * are core kernel text but must be treated as trampolines: a task preempted in
+ * them may be carrying an ops pointer (x11) or a direct-call BPF trampoline
+ * address (x17) whose lifetime is guarded only by Tasks RCU.
+ */
+bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
+{
+	return ip >= (unsigned long)ftrace_caller &&
+	       ip <  (unsigned long)ftrace_static_tramp_end;
+}
+#endif
+
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
 struct fregs_offset {
 	const char *name;

-- 
2.55.0


