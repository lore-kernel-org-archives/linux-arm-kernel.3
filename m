Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B8DC88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=; b=hnN5XHhlu810X0x0SgBmax6CDV
	QW/mSEbD4YK0Zegkq0+kCQUm8T2tOzumKbTUUMGe3b5eAdYsg1mOinfuneMKY9ma6vKpe6YMygc6K
	lsH8wFYIPhn9lV4lnwr4A8BL2ybWq5w3FKLYl6kiFnS2MzumP74LUoPOBtM10mn1EYPmChWfEKdMl
	hUezDDFjtQnwT+phJYHR2PEAACP6+wMWArSnd1si7vgIRzxOfBv6uhG4OvCumIeeXjkE5lK0bMBXd
	e+oYkk1jNmsUUDmK7VUqYHQf0MvIRwuycO5NDbLk+WnD2JOcmSByzBS+7vUGWSUAa1CpWmOUDnsFd
	WlnXosUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xp-0000000Grie-1Njb;
	Fri, 11 Sep 2026 14:10:49 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51xJ-0000000GrL5-31TS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:10:21 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939eb3249c1so88571585a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135816; x=1789740616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=;
        b=F/6SzN7mX2MrEKB5lPEIdPlRsS+zScxyT22nGEnn1yPAR39JgRRJmFGJbQ354BMpuN
         Jhiv8EUw8Mp96QYG+VKpcYyquJBdABik62jqfRLbquGUGErkcIE2/bwcovoN86XW6FVq
         b9C4aIwtVu8TtNKgOdia87TPYgKGt3UdU8ix3og59EZHljjmLpONcCydIu2SlsPwtttm
         Aq4qntyZ5pIxTJd0u+9xdOloE1RkAAgj4/I+Izr52N2cF31q9Gio1IUvBJLtMIVLzLv2
         ckHOqa+Oqo66KuFE+6T8ukOMaY04QxIPGQUB4Uq0yyo1AdlSzMLa+zc2PwLYOuUuqwc0
         jDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135816; x=1789740616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=;
        b=RJk8qIVivRNE4FqQkQl8D7ur7Boh6qANYYBmVxQlLJvaAGlRgSz+dlzK7qU6ijhqzH
         4yNl98jf8tfOqG0iYeYQlVGcQwaSbMAz4rfSaj/XF3bX7mU9GLCxYsAIvCU9VwcygyL/
         2mE/oLlGEdJESzjAnWD70WJpV5A0XAcgCwKTRLJFELUkw3RElGCQqCrXILr7fnaH/nC3
         qMaAnNnrvSaoV7Wp9dru6W9fqngdL4M+nAw0+hGCGa1ytbY54FymiqTW3cU5HN7Xku5Q
         vB9EMXc9qw4ncMox91Yn+maE6Z7eOzxVb4gzbbneslwBPRSPLK3JorOS+SOAi7sNjNQN
         RBNw==
X-Forwarded-Encrypted: i=1; AKwUvBwPPUOmLD5uTTRGp6rWlQEi0kMt9oB50yzrLONzUofv3pcA5mVMQH91SzPMVUhNmhv2tafCcfA/llnUF+EQnMNU@lists.infradead.org
X-Gm-Message-State: AFuF++mzJq5KXru8DOcxNiFbTSY4uZhEPv3gWELeh3AY4nnZ9Ohf5lZE
	JngZdJa18y/tSzx6Y/oAy4azJjKfL4MsPElUli5vxNfxkWKBU+RzWPennGJM9FKRXGPwXIriMLu
	3l7InEcE=
X-Gm-Gg: AYBFou2/NkGEN6pTCW+9Qb6QcH4PyiNfy6y61aYEorYZomD4+qTSpEcNmKBuxo8VNkf
	yRzJeUMtWCyBKHOR79BvzmPTnvUCTALptRDsthhmyiwh24D7UJejf/0SDj2rre3iL1jnOIKoS6W
	oG11Cb6XIx1bwoan2OQSFk8CY7u3jl5xoxG0AfElNiEONC05eywspfV7wPhd4Cwl0sBZ/ROwVN1
	k55mRk+wUKonIXDxYcgtPUSOcdSMX+w+cmdPuVHVShUNPSVrOhUvAW4q14ubdnKhDiUUShLFuIA
	lcy4Hjs95J9BnXZmJwsz7uWQDVOPY0QdcgbgYNb6zCCyJ13PN9bMF1wqesmhvJaHldrcYbRSpEu
	GuOKORhbUvp5yZNtt2PwSTzAkH/9WH9Ktbw5vsHINl+MoqzuCWyDchj3ZpQ7g+eamy2PpzFG8Li
	eFXK4B/3quaG9eN1HsobTOVQMY74KSfAl7/g6GFEh8iS6oF58/q9L29YELjTul6sg2E0o0I/M9/
	XSa9NiOp+bXHpTEXQNZsbCdTUpv6lwYUav7rn2uI8jX0bI8Sv/uuYXI
X-Received: by 2002:a05:620a:4103:b0:939:7f14:ebc6 with SMTP id af79cd13be357-939ea036d6cmr589566285a.3.1789135815998;
        Fri, 11 Sep 2026 07:10:15 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bc225sm248184485a.36.2026.09.11.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:14 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:48 +0000
Subject: [PATCH RFC v2 10/15] bpf, arm64: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-10-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=4364;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=MVjrbMDjnAqQ8aHx7Jc4sWMH68fI2crdoTABU++vCCI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLeRHDw//rEtUsP8CEBuDuvfZIDhzXHIZMrHDgrgPTpnzRVCinhLEvplAgnBDiwNcYGB3QeJu+7
 QOU1v97vhHA4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_071019_257526_27496377 
X-CRM114-Status: GOOD (  16.70  )
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

Same scheme as x86: emit "mrs x10, sp_el0; ldr/add|sub/str w11" to bump
current->rcu_tramp_nesting after the callee-saved registers are stored
and to drop it before they are restored, and release it around the call
to the original function, which im->pcref protects and which must not
pin a Tasks RCU grace period.  x10/x11 are scratch at every emission
point; the fmod_ret cbnz target lies after the decrement/increment pair
around the original call, and the ip_after_call nop follows the
re-increment, so the count is balanced on every path.  BUILD_BUG_ON
guards the LDR/STR immediate range for the task_struct offset.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/arm64/net/bpf_jit_comp.c | 46 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..5c9a7bde5cc9 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2591,6 +2591,34 @@ static void emit_arena_arg_conv(struct jit_ctx *ctx, u8 dst, u8 src, bool nullab
 	emit(A64_SUB(0, dst, src, base_lo), ctx);
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
+ *
+ *   mrs  x10, sp_el0
+ *   ldr  w11, [x10, #offsetof(struct task_struct, rcu_tramp_nesting)]
+ *   add/sub w11, w11, #1
+ *   str  w11, [x10, #...]
+ *
+ * x10/x11 are scratch in the trampoline at every point this is emitted.
+ */
+static void emit_rcu_tasks_tramp_nesting(struct jit_ctx *ctx, bool enter)
+{
+#ifdef CONFIG_TASKS_RCU
+	const int off = offsetof(struct task_struct, rcu_tramp_nesting);
+	const u8 tsk = A64_R(10), cnt = A64_R(11);
+
+	BUILD_BUG_ON(off & 3 || off >= SZ_16K);	/* LDR/STR (imm12, scaled) */
+
+	emit(A64_MRS_SP_EL0(tsk), ctx);
+	emit(A64_LDR32I(cnt, tsk, off), ctx);
+	if (enter)
+		emit(A64_ADD_I(0, cnt, cnt, 1), ctx);
+	else
+		emit(A64_SUB_I(0, cnt, cnt, 1), ctx);
+	emit(A64_STR32I(cnt, tsk, off), ctx);
+#endif
+}
+
 static void save_args(struct jit_ctx *ctx, int bargs_off, int oargs_off,
 		      const struct btf_func_model *m, const struct arg_aux *a,
 		      bool for_call_origin, bool is_struct_ops, u64 arena_base)
@@ -2854,6 +2882,13 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	emit(A64_STR64I(A64_R(19), A64_SP, regs_off), ctx);
 	emit(A64_STR64I(A64_R(20), A64_SP, regs_off + 8), ctx);
 
+	/*
+	 * From here until the matching decrement in the epilogue, a preemption
+	 * of this task is not a Tasks RCU quiescent state.  The instructions
+	 * above this point are covered by the irq-exit IP check.
+	 */
+	emit_rcu_tasks_tramp_nesting(ctx, true);
+
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/* for the first pass, assume the worst case */
 		if (!ctx->image)
@@ -2898,12 +2933,20 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/* the original func takes kernel addresses, never converted ones */
 		save_args(ctx, bargs_off, oargs_off, m, a, true, is_struct_ops, 0);
+		/*
+		 * The original function may run for a long time without
+		 * sleeping; do not let it pin a Tasks RCU grace period.  The
+		 * trampoline frame above it is held by im->pcref
+		 * (__bpf_tramp_enter()), not by Tasks RCU, across the call.
+		 */
+		emit_rcu_tasks_tramp_nesting(ctx, false);
 		/* call original func */
 		emit(A64_LDR64I(A64_R(10), A64_SP, retaddr_off), ctx);
 		emit(A64_ADR(A64_LR, AARCH64_INSN_SIZE * 2), ctx);
 		emit(A64_RET(A64_R(10)), ctx);
 		/* store return value */
 		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
+		emit_rcu_tasks_tramp_nesting(ctx, true);
 		/* reserve a nop for bpf_tramp_image_put */
 		im->ip_after_call = ctx->ro_image + ctx->idx;
 		emit(A64_NOP, ctx);
@@ -2945,6 +2988,9 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_RESTORE_REGS)
 		restore_args(ctx, bargs_off, a->regs_for_args);
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_rcu_tasks_tramp_nesting(ctx, false);
+
 	/* restore callee saved register x19 and x20 */
 	emit(A64_LDR64I(A64_R(19), A64_SP, regs_off), ctx);
 	emit(A64_LDR64I(A64_R(20), A64_SP, regs_off + 8), ctx);

-- 
2.55.0


