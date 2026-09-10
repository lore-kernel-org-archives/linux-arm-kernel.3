Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE2EC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=; b=z6vD/QQYRrqiXf2JoeDDfxjU8w
	ExedHQeZ0Wqb6kOjB6GwvoIZMqqF+N2K04HgqBUUEQLs0g2g99NhkHIYlwtOrahOVpGU2KfWAy9rN
	t4w20xu1eftnWqAK6TLX+cTr5wdCzEnBKGCPIxIwNHOITwpqHwSed4mhrk83KUSd3B74tjoZ5rYol
	PO5RAOpL3xaWHZRGdQIaqoFroCir7PHpW2SchKrvaaho2g2u2/odQXeEHlFJp87Nn2p8wnQERs4Yq
	zpF3KTR9kf22whFb5WxO1L1n7162Rpu24nVJ7T/TIXwcFW1uSdkbw8QUlKP9F4edOYDJE8iKsF47A
	mUL6lKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrv-0000000FBxc-45wn;
	Thu, 10 Sep 2026 18:51:31 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrc-0000000FBfX-33mM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:14 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-9106f4c3a4dso270466d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066271; x=1789671071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=;
        b=dB2kGuPd2zj3wR3AkmG/8XfYyoOvZjvnT3NZmPFyqOps/vZcvGkKKm1rTZI5U8kJ0X
         XelCHKj7wnfkEH+LNXkjY/IO+xoWc6EOOIj+fz4UHBpP+j3RdnEiheMPaHQVlCmX8+7h
         Rt5HUKiwm3lFf8coM1dtjEZHs9zEGuIxmdtaFSqDYJ7oPruv6llVnNi0tyZRofHbCZOl
         VtjEuOFFTPFu3NhfCkLVoFJ2bP86iqxXUUpeX/KapMVlW9d/jfqoaZ1KpNZ8Y++gEOP4
         H5/FbRMP1oKOgDw2aTrv1lXj+AQXwZpiwID9m8L81jHZ5ofsuRE0yZEe7rmIY7ny4aGg
         bjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066271; x=1789671071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=;
        b=ZFXZPriJdmGK36PkAVoIHR/GGnrp6lS7bRig0klBWcHOrDf/kl3khoqst0R+s+tJS5
         tUyLQi3s2PMwcJtRfAbXOCuOUOFK/Qh8OSXWpJb7+PpxUwXBP1rJk0jtyCIouT0NApi2
         2z+D6k7RjWtD3h2Qke/y9DWploaR42sDmWpHh8sNxI5AowOeRPBRIYuQQVdI6d3i3BWo
         n3XST5Hig/dCuUC+4tnNqTexnVx3H/FKtGX2DI5iAwQDzdZcItoAMKRvcZZcnvm0bHv4
         /fcXEoAfgJjWwitrzJvyKJP6erJzEtiASgA8Ebmw4+Z9lG4aux9yga6u80FB81Si6k7g
         mAMw==
X-Forwarded-Encrypted: i=1; AKwUvBxBsV0/A0+415nRn4jRSacErUXBu1h5UT8szX3Hjg/Lo31CTuTVmSK28hdcnJH2bOu6WCGP6GRJrQ//XU0R1FrR@lists.infradead.org
X-Gm-Message-State: AFuF++k3qmyPZa9aHWTMCD8syS3EVZdHuw27hnpKgKauqJ/3z0DSmsK5
	87w5TZfoDL5aYfZrHRVMrdmdxyuE1a+7PmOYcF8uZf7Ahh5NlpyaPG5HADEclY/h9GU=
X-Gm-Gg: AYBFou3KuGFSCOX7ilwPjv9ekAtO70xOEtjacgMH7uEKode3UAJQh5e9+HSkp/YS/jB
	EAHyiApIrTmvR1Axa5Xx1vYG11pdMalilhBJgMUk6bCKfzvaLc+pOYDb7bYcxyStS4JS+f5rqmj
	ZiwMxXa4oAcVI/NHSrV2b1suzPOHmcjw9q9U0t/IgrkGa5Gxk9xgDKRWo2CK9EYjqGrK5wk5sWV
	LQwlMj+KvJYyCHG4mHLL4CvkbNjVpBE0mgzFwOeMjWzuk/oqG43zwxdnYseu4sTVzYZP7/66AZi
	40M74UZMivlNmIb1pq1Huyytmt/1k9xEn2+nvxBsxEL0DpBjHMFeyHKgbhUckn7rvqpesOdfuLq
	FKp6nFiohndGsdyzOwL4PQKqbbMzQP1gTo3X5tvXGLgrdUz7IP1EsE8rh+bJmQJX0zJHKfgm+cL
	3fJE13MMZrewUIJIvlfyTsphDhB80zivyDvvax7ZiKLbNHmcjo/qWXyw7ekJ1y52py9IIfZQPes
	mewN+YaZGjxHOJgIGPnubslCElq8pCO4SJZ8D4Q9Jq7X4UWsY2LqjBh
X-Received: by 2002:a05:6214:5544:b0:910:52ab:59dc with SMTP id 6a1803df08f44-912120e2526mr945166d6.23.1789066271231;
        Thu, 10 Sep 2026 11:51:11 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49444bsm2501436d6.29.2026.09.10.11.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:10 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:33 +0000
Subject: [PATCH RFC 10/13] bpf, arm64: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-10-d4469f4cc101@toxicpanda.com>
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
X-CRM114-CacheID: sfid-20260910_115112_827384_5E8FB04F 
X-CRM114-Status: GOOD (  16.87  )
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


