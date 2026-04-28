Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B92DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq4/UBTJbBSIBMYrEdgu8vO+sExHQ1BWSN/SoA97xbg=; b=b4zh3fp13wxE8Dgg4BW/exj7BN
	89hO4YmSh3wlbzAQ8ZY+65UJtslSpvUt/k6yc4HvuB6NV+oDsvCPu2oilWdbLlw3H1AOiEJFehLQO
	lo4iiGw50q1ITwsCj9kN09uF07NNenPhynMmKa6rPuUb5hxFaDOVJyhUT7uaSQngLree4z2022uK6
	12lugPCCyHuXZ0Ff4X+WDc2tK0NtUkWDMcj42FijdXTgmrfDsP6+aBahcgkwYfxrm39gLpO9IgO4c
	xEnV8PzdBoSrMfizMuIq/KaJDtKbu5TpiMGoiKHaf0c51c9GPrELInYOdgP+Dp2QewND6Mnh13o0g
	kn56ut8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJY-000000026fc-1QM1;
	Tue, 28 Apr 2026 18:37:44 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJM-000000026UG-25Cf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:37:33 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82d40278103so7765017b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401451; x=1778006251; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq4/UBTJbBSIBMYrEdgu8vO+sExHQ1BWSN/SoA97xbg=;
        b=jX5SyX//su+yagiEsowZJVeHI6o3tl/aM20Pl1O6c5MLP5xKgR4LgsaY9ANbf6MphJ
         iTfDdGMB/qK7apV8fDMcr1KVzYxH9geRRyG+rKgQ+zvxhfMOc7NZ7Co8NFGlvRgFeSmt
         jqXtYqXpMg7Ae2FBEsbYcKsAo0DAzw7SfiE7V7CvwHfvybOO0Hmm0GRAQS18b4dVqp4b
         AmidMb9HtYVL/kbPfwPrc3uswMOuYpZceSrX8GxgCrrDpKDqwLJ+lFVyYB28C9U4gWvw
         V2hHPC/cljQZ3covg0EgZAyzbydFoeHCt11XxjQbKW9bgkEw6W+sJGF6av+xaJZjoajw
         cZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401451; x=1778006251;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq4/UBTJbBSIBMYrEdgu8vO+sExHQ1BWSN/SoA97xbg=;
        b=oooSpbuaZ1zu7xUyg6kExCejVGsADwDuBOE3yAFK48a84UfsYAzxJnZTelJf/euser
         OvjpZZlSKCE5vrhRaoYkjdqdn8qfg0hlClMn0vg8U0pT624MDJJxrZszddmDkRdF/jFU
         B0OXEWxzjSeeafigNAORHJWbjSg+nutIj6BIdidqlO6iiQhm3uBD/CexLm6mm+Xi4mRM
         YP6CuoZb8IbNJUcHfrbmKJEJQr55CKRsxJIZgON2Ir1XMEaSre7Xvzoayd9yMbjG8O7D
         10UsAnNmwWu2h3Gijeip2sEKju3YjL0Tzml/WizAJQqbouip+TVXmiqdd9PWzhRmRgZy
         Ojbw==
X-Forwarded-Encrypted: i=1; AFNElJ/3togX+XIxZt4ABW7aRZqQieoX4puxHBMl2u338d26nhZG2FfhS+bLqt2UlrSwLhlFm9udvlqFmgJs0rCzbNnP@lists.infradead.org
X-Gm-Message-State: AOJu0YwcfExTb2rW2M5Jwte0EfbKlfqlTKWh8VXoj+nc+uFLqpT8h7J/
	pfl5qg0vodrd77o/C+425d1w+79uh2caxKI0PSKDIddkg0cGZ7304dPfUnGj2sNuJFrj/Vu9yHo
	PlYOMrK5H7ZMGRTlCp9Wg2Ifd7w==
X-Received: from pfbif1.prod.google.com ([2002:a05:6a00:8b01:b0:82f:a396:2229])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4286:b0:82f:7182:693d with SMTP id d2e1a72fcca58-834ddbefcc3mr4672076b3a.30.1777401450692;
 Tue, 28 Apr 2026 11:37:30 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:36:43 +0000
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428183643.3796063-9-dylanbhatch@google.com>
Subject: [PATCH v5 8/8] unwind: arm64: Use sframe to unwind interrupt frames
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113732_570399_504F513D 
X-CRM114-Status: GOOD (  28.74  )
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

Add unwind_next_frame_sframe() function to unwind by sframe info if
present. Use this method at exception boundaries, falling back to
frame-pointer unwind only on failure. In such failure cases, the
stacktrace is considered unreliable.

During normal unwind, prefer frame pointer unwind (for better
performance) with sframe as a backup.

This change restores the LR behavior originally introduced in commit
c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries"),
But later removed in commit 32ed1205682e ("arm64: stacktrace: Skip
reporting LR at exception boundaries")

This can be done because the sframe data can be used to determine
whether the LR is current for the PC value recovered from pt_regs at the
exception boundary.

Signed-off-by: Weinan Liu <wnliu@google.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/stacktrace/common.h |   6 +
 arch/arm64/kernel/stacktrace.c             | 246 +++++++++++++++++++--
 2 files changed, 232 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/stacktrace/common.h b/arch/arm64/include/asm/stacktrace/common.h
index 821a8fdd31af..4df68181e1b5 100644
--- a/arch/arm64/include/asm/stacktrace/common.h
+++ b/arch/arm64/include/asm/stacktrace/common.h
@@ -21,6 +21,8 @@ struct stack_info {
  *
  * @fp:          The fp value in the frame record (or the real fp)
  * @pc:          The lr value in the frame record (or the real lr)
+ * @sp:          The sp value at the call site of the current function.
+ * @unreliable:  Stacktrace is unreliable.
  *
  * @stack:       The stack currently being unwound.
  * @stacks:      An array of stacks which can be unwound.
@@ -29,7 +31,11 @@ struct stack_info {
 struct unwind_state {
 	unsigned long fp;
 	unsigned long pc;
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	unsigned long sp;
+#endif
 
+	bool unreliable;
 	struct stack_info stack;
 	struct stack_info *stacks;
 	int nr_stacks;
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 3ebcf8c53fb0..c935323f393b 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -14,6 +14,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
 #include <linux/stacktrace.h>
+#include <linux/sframe.h>
 
 #include <asm/efi.h>
 #include <asm/irq.h>
@@ -26,6 +27,7 @@ enum kunwind_source {
 	KUNWIND_SOURCE_CALLER,
 	KUNWIND_SOURCE_TASK,
 	KUNWIND_SOURCE_REGS_PC,
+	KUNWIND_SOURCE_REGS_LR,
 };
 
 union unwind_flags {
@@ -85,6 +87,9 @@ kunwind_init_from_regs(struct kunwind_state *state,
 	state->regs = regs;
 	state->common.fp = regs->regs[29];
 	state->common.pc = regs->pc;
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	state->common.sp = regs->sp;
+#endif
 	state->source = KUNWIND_SOURCE_REGS_PC;
 }
 
@@ -103,6 +108,9 @@ kunwind_init_from_caller(struct kunwind_state *state)
 
 	state->common.fp = (unsigned long)__builtin_frame_address(1);
 	state->common.pc = (unsigned long)__builtin_return_address(0);
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	state->common.sp = (unsigned long)__builtin_frame_address(0);
+#endif
 	state->source = KUNWIND_SOURCE_CALLER;
 }
 
@@ -124,6 +132,9 @@ kunwind_init_from_task(struct kunwind_state *state,
 
 	state->common.fp = thread_saved_fp(task);
 	state->common.pc = thread_saved_pc(task);
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	state->common.sp = thread_saved_sp(task);
+#endif
 	state->source = KUNWIND_SOURCE_TASK;
 }
 
@@ -181,7 +192,6 @@ int kunwind_next_regs_pc(struct kunwind_state *state)
 	state->regs = regs;
 	state->common.pc = regs->pc;
 	state->common.fp = regs->regs[29];
-	state->regs = NULL;
 	state->source = KUNWIND_SOURCE_REGS_PC;
 	return 0;
 }
@@ -237,6 +247,9 @@ kunwind_next_frame_record(struct kunwind_state *state)
 
 	unwind_consume_stack(&state->common, info, fp, sizeof(*record));
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	state->common.sp = state->common.fp;
+#endif
 	state->common.fp = new_fp;
 	state->common.pc = new_pc;
 	state->source = KUNWIND_SOURCE_FRAME;
@@ -244,6 +257,176 @@ kunwind_next_frame_record(struct kunwind_state *state)
 	return 0;
 }
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+
+static __always_inline struct stack_info *
+get_word(struct unwind_state *state, unsigned long *word)
+{
+	unsigned long addr = *word;
+	struct stack_info *info;
+
+	info = unwind_find_stack(state, addr, sizeof(addr));
+	if (!info)
+		return info;
+
+	*word = READ_ONCE(*(unsigned long *)addr);
+
+	return info;
+}
+
+static __always_inline int
+get_consume_word(struct unwind_state *state, unsigned long *word)
+{
+	struct stack_info *info;
+	unsigned long addr = *word;
+
+	info = get_word(state, word);
+	if (!info)
+		return -EINVAL;
+
+	unwind_consume_stack(state, info, addr, sizeof(addr));
+	return 0;
+}
+
+/*
+ * Unwind to the next frame according to sframe.
+ */
+static __always_inline int
+unwind_next_frame_sframe(struct kunwind_state *state)
+{
+	struct unwind_frame frame;
+	unsigned long cfa, fp, ra;
+	enum kunwind_source source = KUNWIND_SOURCE_FRAME;
+	struct pt_regs *regs = state->regs;
+
+	int err;
+
+	/* FP/SP alignment 8 bytes */
+	if (state->common.fp & 0x7 || state->common.sp & 0x7)
+		return -EINVAL;
+
+	/*
+	 * Most/all outermost functions are not visible to sframe. So, check for
+	 * a meta frame record if the sframe lookup fails.
+	 */
+	err = sframe_find_kernel(state->common.pc, &frame);
+	if (err)
+		return kunwind_next_frame_record_meta(state);
+
+	if (frame.outermost)
+		return -ENOENT;
+
+	/* Get the Canonical Frame Address (CFA) */
+	switch (frame.cfa.rule) {
+	case UNWIND_CFA_RULE_SP_OFFSET:
+		cfa = state->common.sp;
+		break;
+	case UNWIND_CFA_RULE_FP_OFFSET:
+		if (state->common.fp < state->common.sp)
+			return -EINVAL;
+		cfa = state->common.fp;
+		break;
+	case UNWIND_CFA_RULE_REG_OFFSET:
+	case UNWIND_CFA_RULE_REG_OFFSET_DEREF:
+		/* regs only available in topmost/interrupt frame */
+		if (!regs || frame.cfa.regnum > 30)
+			return -EINVAL;
+		cfa = regs->regs[frame.cfa.regnum];
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+	cfa += frame.cfa.offset;
+
+	/*
+	 * CFA typically points to a higher address than RA or FP, so don't
+	 * consume from the stack when we read it.
+	 */
+	if (frame.cfa.rule & UNWIND_RULE_DEREF &&
+	    !get_word(&state->common, &cfa))
+		return -EINVAL;
+
+	/* CFA alignment 8 bytes */
+	if (cfa & 0x7)
+		return -EINVAL;
+
+	/* Get the Return Address (RA) */
+	switch (frame.ra.rule) {
+	case UNWIND_RULE_RETAIN:
+		/* regs only available in topmost/interrupt frame */
+		if (!regs)
+			return -EINVAL;
+		ra = regs->regs[30];
+		source = KUNWIND_SOURCE_REGS_LR;
+		break;
+	/* UNWIND_USER_RULE_CFA_OFFSET not implemented on purpose */
+	case UNWIND_RULE_CFA_OFFSET_DEREF:
+		ra = cfa + frame.ra.offset;
+		break;
+	case UNWIND_RULE_REG_OFFSET:
+	case UNWIND_RULE_REG_OFFSET_DEREF:
+		/* regs only available in topmost/interrupt frame */
+		if (!regs)
+			return -EINVAL;
+		ra = regs->regs[frame.cfa.regnum];
+		ra += frame.ra.offset;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
+	/* Get the Frame Pointer (FP) */
+	switch (frame.fp.rule) {
+	case UNWIND_RULE_RETAIN:
+		fp = state->common.fp;
+		break;
+	/* UNWIND_USER_RULE_CFA_OFFSET not implemented on purpose */
+	case UNWIND_RULE_CFA_OFFSET_DEREF:
+		fp = cfa + frame.fp.offset;
+		break;
+	case UNWIND_RULE_REG_OFFSET:
+	case UNWIND_RULE_REG_OFFSET_DEREF:
+		/* regs only available in topmost/interrupt frame */
+		if (!regs)
+			return -EINVAL;
+		fp = regs->regs[frame.fp.regnum];
+		fp += frame.fp.offset;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
+	/*
+	 * Consume RA and FP from the stack. The frame record puts FP at a lower
+	 * address than RA, so we always read FP first.
+	 */
+	if (frame.fp.rule & UNWIND_RULE_DEREF &&
+	    !get_word(&state->common, &fp))
+		return -EINVAL;
+
+	if (frame.ra.rule & UNWIND_RULE_DEREF &&
+	    get_consume_word(&state->common, &ra))
+		return -EINVAL;
+
+	state->common.pc = ra;
+	state->common.sp = cfa;
+	state->common.fp = fp;
+
+	state->source = source;
+
+	return 0;
+}
+
+#else /* !CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
+
+static __always_inline int
+unwind_next_frame_sframe(struct kunwind_state *state) { return -EINVAL; }
+
+#endif /* !CONFIG_HAVE_UNWIND_KERNEL_SFRAME*/
+
 /*
  * Unwind from one frame record (A) to the next frame record (B).
  *
@@ -259,12 +442,25 @@ kunwind_next(struct kunwind_state *state)
 	state->flags.all = 0;
 
 	switch (state->source) {
+	case KUNWIND_SOURCE_REGS_PC:
+		err = unwind_next_frame_sframe(state);
+
+		if (err && err != -ENOENT) {
+			/* Fallback to FP based unwinder */
+			err = kunwind_next_frame_record(state);
+			state->common.unreliable = true;
+		}
+		state->regs = NULL;
+		break;
 	case KUNWIND_SOURCE_FRAME:
 	case KUNWIND_SOURCE_CALLER:
 	case KUNWIND_SOURCE_TASK:
-	case KUNWIND_SOURCE_REGS_PC:
+	case KUNWIND_SOURCE_REGS_LR:
 		err = kunwind_next_frame_record(state);
+		if (err && err != -ENOENT)
+			err = unwind_next_frame_sframe(state);
 		break;
+
 	default:
 		err = -EINVAL;
 	}
@@ -350,6 +546,9 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 		.common = {
 			.stacks = stacks,
 			.nr_stacks = ARRAY_SIZE(stacks),
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+			.sp = 0,
+#endif
 		},
 	};
 
@@ -390,34 +589,40 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
 	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
 }
 
+struct kunwind_reliable_consume_entry_data {
+	stack_trace_consume_fn consume_entry;
+	void *cookie;
+	bool unreliable;
+};
+
 static __always_inline bool
-arch_reliable_kunwind_consume_entry(const struct kunwind_state *state, void *cookie)
+arch_kunwind_reliable_consume_entry(const struct kunwind_state *state, void *cookie)
 {
-	/*
-	 * At an exception boundary we can reliably consume the saved PC. We do
-	 * not know whether the LR was live when the exception was taken, and
-	 * so we cannot perform the next unwind step reliably.
-	 *
-	 * All that matters is whether the *entire* unwind is reliable, so give
-	 * up as soon as we hit an exception boundary.
-	 */
-	if (state->source == KUNWIND_SOURCE_REGS_PC)
-		return false;
+	struct kunwind_reliable_consume_entry_data *data = cookie;
 
-	return arch_kunwind_consume_entry(state, cookie);
+	if (state->common.unreliable) {
+		data->unreliable = true;
+		return false;
+	}
+	return data->consume_entry(data->cookie, state->common.pc);
 }
 
-noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
-					      void *cookie,
-					      struct task_struct *task)
+noinline notrace int arch_stack_walk_reliable(
+				stack_trace_consume_fn consume_entry,
+				void *cookie, struct task_struct *task)
 {
-	struct kunwind_consume_entry_data data = {
+	struct kunwind_reliable_consume_entry_data data = {
 		.consume_entry = consume_entry,
 		.cookie = cookie,
+		.unreliable = false,
 	};
 
-	return kunwind_stack_walk(arch_reliable_kunwind_consume_entry, &data,
-				  task, NULL);
+	kunwind_stack_walk(arch_kunwind_reliable_consume_entry, &data, task, NULL);
+
+	if (data.unreliable)
+		return -EINVAL;
+
+	return 0;
 }
 
 struct bpf_unwind_consume_entry_data {
@@ -452,6 +657,7 @@ static const char *state_source_string(const struct kunwind_state *state)
 	case KUNWIND_SOURCE_CALLER:	return "C";
 	case KUNWIND_SOURCE_TASK:	return "T";
 	case KUNWIND_SOURCE_REGS_PC:	return "P";
+	case KUNWIND_SOURCE_REGS_LR:	return "L";
 	default:			return "U";
 	}
 }
-- 
2.54.0.545.g6539524ca2-goog


