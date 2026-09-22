Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90615C982FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 02:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcQuspsT/gTElVk43OpaGWxo4+ZF80NPyngxmwv0iAI=; b=4AgBivrQNDMa+vsXlOSPQenkZt
	bFxuziuCXFndcc8YQKjZocorjonufKxWhIAFTaq005MS/V2sK7OVGZcHjzYKZztL0wf1Uf7K9+Tdm
	55LdOK6Exb/kosBanF3PAc6ekRLusRWMHqfJTGZPx7Vc9FDdX1oz8MhsQyAY5G10hJM34pMgeP9Wi
	goGZPu2ZXA+MT6SyjSNnFqxJafOIe3/Iogx9+EfStHh5tJ0Tmf2ZfTriINJVPysaoohnNOE9JO1eZ
	52GJWBm2yGKa2ZdpBaEwNyTiDKV6iE9X8xaI8nIaazgqvqcNJhVXVFqYQWTB50JNY/HfSXxaZtAXW
	HapfrQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qIg-00000003zRB-22Tu;
	Tue, 22 Sep 2026 02:32:06 +0000
Received: from mail-qk2-x29.google.com ([2607:f8b0:4864:34::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qIX-00000003zPm-0qpL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 02:32:05 +0000
Received: by mail-qk2-x29.google.com with SMTP id af79cd13be357-93910cc46c8so464552185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 19:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044316; x=1790649116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcQuspsT/gTElVk43OpaGWxo4+ZF80NPyngxmwv0iAI=;
        b=dgIu3dgJwSzh/VLfTLh3s+4UQ1B8fbcCnm8IGubnXOUnqlFsGoQse1d+Gb7GyHhIsz
         OLgleBuiDITujZ0Kq88kPgXdejCQLlLA3NppZPLwX9pPpDeVZJ3WsZEAiT0gSNkrdRCf
         XqDSjuowFRxN7v2liJICGz/idA1VvHN7dMjeJefL6vIgwDZGaUZZoAa5+irGb93VVo2d
         /FehGLo0lqKBrXaGwW73oNH2QIVTrwoeSetdHT0bIe5WUlxqMcvKZ3MNqm1Eh0zjZU4P
         PSPerrN3fOF7TjmrBYiYZAmdyi9ypOMJXT0BRfXYlaI/WfpENaw2Lrnd1NulqnlPnNPF
         jacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044316; x=1790649116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OcQuspsT/gTElVk43OpaGWxo4+ZF80NPyngxmwv0iAI=;
        b=wfD2reE2nXSVSdiOYIi0gXTAhjoxrvXcdz/iuszx7+I7A9HCP5x7ZvuxroI/j1fsXo
         lBFjLKh7nLbZDNFxEgmjo+VpkEcdMgigPAJVmtbcEHQ2lL/agAn+gXJH2TiWqYeN3Ghp
         eg840xmW2V9o0PIiCYJHLkK4jgwLzECOAkn5Ilhjfoi2zEuJcLGtsYYBB39wXXe76tdy
         s0QcqnwMOUjfTYNgCAzR5QJha+n0kILLIbC110ZzbXxThsQf0t2JNPJawV2kCCSZG4bC
         EJCn3S5Uet9uK4PacNrzQdIngQcGhVtS0Typk/wNumKO11kLjeiuQhLNNBO/MTf/iGMO
         I4Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwWCHSikho4WawZqaCb4fq9PFRblv7gaWMKUvz7k/GyiD4g2RnGe/6UJ/3DmR0nDDSheMKIkdfpyLF03ZyIX6YK@lists.infradead.org
X-Gm-Message-State: AFuF++lJ+3EtOFN3u3IxSXMhTyfD2L3ssFojQJ1XVTSjtlVVQfo1/23u
	90My9YK9IhE8+LiljXwD2ONlTBLu4O1vW+97s7XPbX8yvHXYwliUIgqfVOpWf9ClArs=
X-Gm-Gg: AYBFou0NxNGvpKuaWdrJCbshRDOBOxlGdeqC5VGKguBwg6sCCxcmTkHP7/QiYj+u/Kc
	Olh19TA86St1W5HURfNukMuxt4TRRxU21J1qIKi4HHG3vkOq5NJxXsK5klX34eYuS87nfd4VcH2
	94UNAMXocC43Qu1VRz/NStprTDdb/EKXeIwZ64WknAhz37d0rWARDVLwsJWIEPQbwyc72sjomIi
	ZhDyTdnil8MgJu3pwa/2G5e+Ar7gPDzDM9yCA0Evld1kz9qJ2GcG5o8cPIkNtklJ3CT3bOcsgah
	/N9L3kxG3SnP6Z2rv+sviPkDsHEhCO7gTCsRDYYOGJSVrMQMuG3v2oUqneNyUfuOZR3rFBpZzVf
	1MmFvS7IgVkkbkDdKPz8Od4dlmmwREIcmzyvXtvuuTgVK7Pav3tX4GML6Zd0Lseao0rswOtbrjZ
	cdnUBReZ4loTu1aghWeb8JNkRLdvhqWeiOHjb8ITcd+oj3S4Yt+A+yaxW7heFVJbKaRPL3S2Qel
	f5Uox8uQ4eJB7k=
X-Received: by 2002:a05:620a:4614:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93c198dc1c9mr159925485a.28.1790044315913;
        Mon, 21 Sep 2026 19:31:55 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d03b170sm22998785a.16.2026.09.21.19.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:31:55 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:28 +0000
Subject: [PATCH v5 09/13] bpf, arm64: Take a Tasks Trace reader in the
 trampoline around its call-outs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-9-410f57770bad@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=7373;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=DWFFSokO8NG0r0yBeEFehUgLH0GBe2lFI780YAKeFAM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPVoMRhiz6gAdvKlENOzZ1c8jxAfTwJ9sVEsY25YoCvyFY/4f6gXn6G4z9PxCL6u0E2EccNLDn3
 +KDAp6wx4zwk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_193159_871488_CBA1FC04 
X-CRM114-Status: GOOD (  22.31  )
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

Same scheme as x86: have the arm64 BPF JIT open-code rcu_read_lock_trace()
and rcu_read_unlock_trace() in the trampoline, one reader from after the
callee-saved registers are stored to just before the original function
is called (covering __bpf_tramp_enter() and the fentry/fmod_ret programs)
and a second from just after it returns to just before those registers
are restored (covering the fexit programs and __bpf_tramp_exit()), with
the original function itself outside both and pinned by im->pcref.  The
second reader is entered before ip_after_call and the fmod_ret cbnz
lands past it still holding the first, so exactly one is held on every
path; trampolines without an original call get a single reader.

The sequence mirrors entry-ftrace.S: current via sp_el0,
trc_reader_nesting bumped, and for the outermost reader the SRCU-fast
per-CPU counter incremented LL/SC and the counter pointer stashed in
trc_reader_scp (plus the dmb when CONFIG_TASKS_TRACE_RCU_NO_MB is not
set).  x10-x15 are scratch at every emission point.  Nothing is emitted
on other configurations.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/arm64/net/bpf_jit_comp.c | 93 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..87bbcca0298f 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -14,6 +14,7 @@
 #include <linux/filter.h>
 #include <linux/memory.h>
 #include <linux/printk.h>
+#include <linux/rcupdate_trace.h>
 #include <linux/slab.h>
 
 #include <asm/asm-extable.h>
@@ -2591,6 +2592,77 @@ static void emit_arena_arg_conv(struct jit_ctx *ctx, u8 dst, u8 src, bool nullab
 	emit(A64_SUB(0, dst, src, base_lo), ctx);
 }
 
+/*
+ * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace() for the
+ * trampoline, see CONFIG_HAVE_RCU_TRAMPOLINE_READERS and the equivalent macros
+ * in arch/arm64/kernel/entry-ftrace.S.  The SRCU-fast per-CPU increment is an
+ * LL/SC add on this CPU's counter; being migrated between reading the per-CPU
+ * offset and the store-exclusive only means another CPU's counter is
+ * incremented atomically instead, which SRCU sums over anyway.  Uses x10-x15,
+ * which are scratch at every emission point, and the flags.
+ */
+static void emit_trace_rcu_reader(struct jit_ctx *ctx, bool lock)
+{
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	const int nesting_off = offsetof(struct task_struct, trc_reader_nesting);
+	const int scp_off = offsetof(struct task_struct, trc_reader_scp);
+	const int ctr_off = lock ? offsetof(struct srcu_ctr, srcu_locks)
+			       : offsetof(struct srcu_ctr, srcu_unlocks);
+	const bool mb = !IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB);
+	const u8 tsk = A64_R(10), n = A64_R(11), tmp = A64_R(12);
+	const u8 ctr = A64_R(13), addr = A64_R(14), val = A64_R(15);
+
+	/* The plain this_cpu_inc() form of __srcu_read_lock_fast(). */
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE));
+	/* LDR/STR (immediate, unsigned offset) ranges */
+	BUILD_BUG_ON((nesting_off & 3) || nesting_off >= SZ_16K ||
+		     (scp_off & 7) || scp_off >= SZ_32K);
+
+	emit(A64_MRS_SP_EL0(tsk), ctx);			/* current */
+	emit(A64_LDR32I(n, tsk, nesting_off), ctx);
+	if (lock) {
+		emit(A64_ADD_I(0, tmp, n, 1), ctx);
+		emit(A64_STR32I(tmp, tsk, nesting_off), ctx);
+		/* interrupted a reader: done (branch to 1:) */
+		emit(A64_CBNZ(0, n, 13 + mb), ctx);
+		/* scp = rcu_tasks_trace_srcu_struct.srcu_ctrp; current->trc_reader_scp = scp */
+		emit_addr_mov_i64(ctr, (u64)&rcu_tasks_trace_srcu_struct.srcu_ctrp, ctx);
+		emit(A64_LDR64I(ctr, ctr, 0), ctx);
+		emit(A64_STR64I(ctr, tsk, scp_off), ctx);
+	} else {
+		emit(A64_SUB_I(0, n, n, 1), ctx);
+		/* still nested: just store the count (branch to 2:) */
+		emit(A64_CBNZ(0, n, 11 + mb), ctx);
+		/* outermost: pick up scp before an interrupt can see nesting == 0 */
+		emit(A64_LDR64I(ctr, tsk, scp_off), ctx);
+		emit(A64_STR32I(A64_ZR, tsk, nesting_off), ctx);
+		if (mb)
+			emit(A64_DMB_ISH, ctx);
+	}
+	/* this_cpu_inc(scp->srcu_locks / scp->srcu_unlocks) */
+	if (cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
+		emit(A64_MRS_TPIDR_EL2(addr), ctx);
+	else
+		emit(A64_MRS_TPIDR_EL1(addr), ctx);
+	emit(A64_ADD(1, addr, addr, ctr), ctx);
+	emit(A64_ADD_I(1, addr, addr, ctr_off), ctx);
+	emit(A64_LDXR(1, val, addr), ctx);
+	emit(A64_ADD_I(1, val, val, 1), ctx);
+	emit(A64_STXR(1, val, addr, tmp), ctx);
+	emit(A64_CBNZ(0, tmp, -3), ctx);
+	if (lock) {
+		if (mb)
+			emit(A64_DMB_ISH, ctx);
+		/* 1: */
+	} else {
+		emit(A64_B(2), ctx);
+		/* 2: */
+		emit(A64_STR32I(n, tsk, nesting_off), ctx);
+		/* 3: */
+	}
+#endif
+}
+
 static void save_args(struct jit_ctx *ctx, int bargs_off, int oargs_off,
 		      const struct btf_func_model *m, const struct arg_aux *a,
 		      bool for_call_origin, bool is_struct_ops, u64 arena_base)
@@ -2854,6 +2926,16 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	emit(A64_STR64I(A64_R(19), A64_SP, regs_off), ctx);
 	emit(A64_STR64I(A64_R(20), A64_SP, regs_off + 8), ctx);
 
+	/*
+	 * Tasks RCU keeps this image alive only while we are a Tasks Trace
+	 * reader; the instructions before this point (and after the final
+	 * unlock) are covered by the irq-exit IP check.  One reader spans
+	 * __bpf_tramp_enter() and the fentry/fmod_ret progs, a second one the
+	 * fexit progs and __bpf_tramp_exit(); the original function runs
+	 * outside both, with the image pinned by im->pcref instead.
+	 */
+	emit_trace_rcu_reader(ctx, true);
+
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/* for the first pass, assume the worst case */
 		if (!ctx->image)
@@ -2898,12 +2980,20 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/* the original func takes kernel addresses, never converted ones */
 		save_args(ctx, bargs_off, oargs_off, m, a, true, is_struct_ops, 0);
+		emit_trace_rcu_reader(ctx, false);
 		/* call original func */
 		emit(A64_LDR64I(A64_R(10), A64_SP, retaddr_off), ctx);
 		emit(A64_ADR(A64_LR, AARCH64_INSN_SIZE * 2), ctx);
 		emit(A64_RET(A64_R(10)), ctx);
 		/* store return value */
 		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
+		/*
+		 * Second reader.  Taken before ip_after_call so that the branch
+		 * to the epilogue patched in at teardown is inside it too; the
+		 * fmod_ret early exit lands past this still holding the first
+		 * reader, so either way exactly one is held.
+		 */
+		emit_trace_rcu_reader(ctx, true);
 		/* reserve a nop for bpf_tramp_image_put */
 		im->ip_after_call = ctx->ro_image + ctx->idx;
 		emit(A64_NOP, ctx);
@@ -2945,6 +3035,9 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_RESTORE_REGS)
 		restore_args(ctx, bargs_off, a->regs_for_args);
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_trace_rcu_reader(ctx, false);
+
 	/* restore callee saved register x19 and x20 */
 	emit(A64_LDR64I(A64_R(19), A64_SP, regs_off), ctx);
 	emit(A64_LDR64I(A64_R(20), A64_SP, regs_off + 8), ctx);

-- 
2.55.0


