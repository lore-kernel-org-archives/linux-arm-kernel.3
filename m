Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48802C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=; b=3rBnVBx94jNvkxBc6/F46axGuD
	X7zZwc8hKhukxxJuVfZ2owQ+TDFM4xOZiIwh3FkGZUTLjDQG2+U/glY5Zanc1tLz0gCMlQbj1CKmV
	Ry3frXOcCvC4xyBZ0jPnlH+O3xJzaV3d0Ub9m2bh0yte2AWFWEu6hYIwPg4NbcK3uJIeKpmvvb9o1
	ivGzOkkh2ViObdRUVoiYXxsjPL3cLCx162C4fa3qqwHDHVuCLEM4zqlqqA3voY+6KOLLfLzBXlmA+
	OD+L4SVjj+RrDGCXrky4sawcitJyxXt6IszN89iWCJz5p+e5ioxMz0nBTZBdgbGz4go7RE5oKpbUg
	o2Ad3/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xo-0000000GriD-40Ai;
	Fri, 11 Sep 2026 14:10:48 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xF-0000000GrHb-3xiC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:10:15 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-939f30a2d3cso46323585a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135813; x=1789740613; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=;
        b=CjZVZaoIvBtSb/aIya1z93AJMXWzOw6xsMlI0oE0FBbuMKdHGMnwgTwXdc1FT8XHI1
         RNAdj9F2k8Ozqgw/j7Zn+4JKL4X4IWqqN6EuVBIURRFaE+OjqT03cbnCfKETYMcxt5sy
         XqAl2tC2YRSlslt6nWt46giRKztJyiaTGQcHYtl5+eSAtP7JYMISBIpCbQIHa5yM06G8
         a2xX+0JvyWNNkIt4s2/0p+Dt5zbYtG23tPIML5j9SfsXFFQYjcG1RC4IqiYwN5zazlPD
         B5YUjUwDHJMQIe6wKp5MwBiKw8l2YkdJ4wNLUc1iuMn6xKjqpSAqJvVHOuZviNqoHVCa
         Qefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135813; x=1789740613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=;
        b=b7wNznV78HQ5KSqAa+LYyS/KchbNbRSZa/tWyubrAGLzA/VuuxkflDAFscq4CMBcuP
         vrGllOrpgyn2LIfUPw60FM1eW9Q/4kOycZgSXqyurInJa+QOQRw1zZEW6IwKbttLtP1H
         iMMw7LnvPv9XCdZARj8UtoDLUKomMjSyxNkeIQ4PdNInY11zmBhQeCZKIBfxbCdXJUAi
         rV9toEuTNlJHQtN/eXCBeRxcP55ldo9ZdkWlAd2ygel6Q4spyiXFW6vqPgUKnjL7Zs2x
         A/WuJ5Hc72BkxuT61MD0nobLkpezmDxLyObeKFGmfPCaa4wFXZUAHMxB48Z/WCRzHfdJ
         AzFQ==
X-Forwarded-Encrypted: i=1; AKwUvBydUPBEaDZbbReAcHzhabnv2ZD4jrI/96OEsg74FOMjH3ieR/gI17HcP2t+N/7/T4tx/Qs0i8xjpf69/1U16f+R@lists.infradead.org
X-Gm-Message-State: AFuF++l6wZhsCdFV4i29s9Jt27R8KtCyLuULchZfu36xqhKs2VB/aI9E
	47A5OxUar3jcC6LbdV3cSIDhv9VmZ3LPY+j96HGuG6QH/U/Ln4GS7QamnidFjND3eqI=
X-Gm-Gg: AYBFou3ThFXaB18aGw6jyTX3eTI4FNbP5+n+sSBI22QtdOhm3MkCnYU+bR9pDpUPLBy
	MbzIK5+/JCRHqF7Cz5acXpwr5XD1QqMFt1LMFMiMBb/eJVnsj/HJT9OsbUmxLqjBz7E9LeSaJ+J
	/nfL3+nrbSvToSHru+NmFQlDpZfgtz/EBZ1ZRXctxnSDvU1ysNr1tNCuWG55WbT/cuMdXZIywLd
	8lwbhQvxXep6mJYmRJnVrbhytSA0SvqqzyZ28iMbnprs8vigBcHz6lLAuHicm873Q8WwhuiXSbO
	ZPjAFn7NXQPem46wkTQqJPjmsXjRkL8MjCcG1exrKe8BSNlUD30V4+EEZaVe1Klcg4+H2rGtKBW
	e/sNEcy24g8RO9Dj6tXNOiOTM1f7NOGp+5r4YkPQphq/6hWn8o5cMiP1ehCPYeoU8od2p7tyTTF
	y42M0zglATruO380UOM+LxnRDI5w+i1U0URfnqEmBu5vpRuuOYTTDMAGodSMFAQXEPThNOojQF9
	+i83P8zN/NIa9HAX91DFVtXQ54lpu6TFydYLMQRlVGn4bqkv4zCiXGz
X-Received: by 2002:a05:620a:6287:b0:939:6dea:374b with SMTP id af79cd13be357-939ea1af385mr553869585a.47.1789135812492;
        Fri, 11 Sep 2026 07:10:12 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bbab7sm247620785a.34.2026.09.11.07.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:10 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:47 +0000
Subject: [PATCH RFC v2 09/15] arm64: ftrace: Maintain Tasks RCU trampoline
 nesting in ftrace_caller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-9-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=5217;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=xqTPn5S4ER1XAZhtIYfJFNG5V6jdP8hXJAwXIfHAJeM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDdDEdIwM05h7b7JvpgB0Ncpvko1HStiAd9VzLg7h8HjWsQnjthe7VWx1bLRiDUbfVMTbRgUiKe
 YsgeGrk28wQI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071014_000896_8AEF0756 
X-CRM114-Status: GOOD (  17.37  )
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


