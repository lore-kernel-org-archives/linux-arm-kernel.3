Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2F9C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TbgCUKcFpsgpu9/BRMvgrnWfarrpc1JdUEYjXeu3rk=; b=KfT+vPdlj4b1MHpUHVDclGSkhc
	K7qbjjp+6srX/gNaGqBsv6yzZxDI6b4qlONn+982bKWy529yNPxJooV6Z3gt/QPQnPZrVc/WaI8VJ
	4I4bwkrm7lCy5vVE7udI4icbuIClwnbMh5Qagr//Ig34o3TbVlZs1GLjdzkBKNzuko8GdnbAqKjmS
	u54lZ2CHQFSA1ysQG9Xu5thWh9JOzGkK69EShxNnwNB8x+LoTDYVqdJwByTyNnoK58k7tBstFanJc
	hnPCBXDdGwgSW5qDnyzbsY03lgnaDUssz+z+Dn6PbYpOAveWhgvXvc0jFskhi/wiIQjMLQFxtz/7t
	wc1fgviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yq8-00000007ynD-46fr;
	Wed, 09 Apr 2025 17:03:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTs-00000007uyP-0MPp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CDBE1C25;
	Wed,  9 Apr 2025 09:40:52 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79D523F59E;
	Wed,  9 Apr 2025 09:40:50 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 12/13] arm64/fpsimd: signal: Always save+flush state early
Date: Wed,  9 Apr 2025 17:40:09 +0100
Message-Id: <20250409164010.3480271-13-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250409164010.3480271-1-mark.rutland@arm.com>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094052_232311_03F3A9E7 
X-CRM114-Status: GOOD (  32.53  )
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

There are several issues with the way the native signal handling code
manipulates FPSIMD/SVE/SME state, described in detail below. These
issues largely result from races with preemption and inconsistent
handling of live state vs saved state.

Known issues with native FPSIMD/SVE/SME state management include:

* On systems with FPMR, the code to save/restore the FPMR accesses the
  register while it is not owned by the current task. Consequently, this
  may corrupt the FPMR of the current task and/or may corrupt the FPMR
  of an unrelated task. The FPMR save/restore has been broken since it
  was introduced in commit:

    8c46def44409fc91 ("arm64/signal: Add FPMR signal handling")

* On systems with SME, setup_return() modifies both the live register
  state and the saved state register state regardless of whether the
  task's state is live, and without holding the cpu fpsimd context.
  Consequently:

  - This may corrupt the state an unrelated task which has PSTATE.SM set
    and/or PSTATE.ZA set.

  - The task may enter the signal handler in streaming mode, and or with
    ZA storage enabled unexpectedly.

  - The task may enter the signal handler in non-streaming SVE mode with
    stale SVE register state, which may have been inherited from
    streaming SVE mode unexpectedly. Where the streaming and
    non-streaming vector lengths differ, this may be packed into
    registers arbitrarily.

  This logic has been broken since it was introduced in commit:

    40a8e87bb32855b3 ("arm64/sme: Disable ZA and streaming mode when handling signals")

  Further incorrect manipulation of state was added in commits:

    ea64baacbc36a0d5 ("arm64/signal: Flush FPSIMD register state when disabling streaming mode")
    baa8515281b30861 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")

* Several restoration functions use fpsimd_flush_task_state() to discard
  the live FPSIMD/SVE/SME while the in-memory copy is stale.

  When a subset of the FPSIMD/SVE/SME state is restored, the remainder
  may be non-deterministically reset to a stale snapshot from some
  arbitrary point in the past.

  This non-deterministic discarding was introduced in commit:

    8cd969d28fd2848d ("arm64/sve: Signal handling support")

  As of that commit, when TIF_SVE was initially clear, failure to
  restore the SVE signal frame could reset the FPSIMD registers to a
  stale snapshot.

  The pattern of discarding unsaved state was subsequently copied into
  restoration functions for some new state in commits:

    39782210eb7e8763 ("arm64/sme: Implement ZA signal handling")
    ee072cf708048c0d ("arm64/sme: Implement signal handling for ZT")

* On systems with SME/SME2, the entire FPSIMD/SVE/SME state may be
  loaded onto the CPU redundantly. Either restore_fpsimd_context() or
  restore_sve_fpsimd_context() will load the entire FPSIMD/SVE/SME state
  via fpsimd_update_current_state() before restore_za_context() and
  restore_zt_context() each discard the state via
  fpsimd_flush_task_state().

  This is purely redundant work, and not a functional bug.

To fix these issues, rework the native signal handling code to always
save+flush the current task's FPSIMD/SVE/SME state before manipulating
that state. This avoids races with preemption and ensures that state is
manipulated consistently regardless of whether it happened to be live
prior to manipulation. This largely involes:

* Using fpsimd_save_and_flush_current_state() to save+flush the state
  for both signal delivery and signal return, before the state is
  manipulated in any way.

* Removing fpsimd_signal_preserve_current_state() and updating
  preserve_fpsimd_context() to explicitly ensure that the FPSIMD state
  is up-to-date, as preserve_fpsimd_context() is the only consumer of
  the FPSIMD state during signal delivery.

* Modifying fpsimd_update_current_state() to not reload the FPSIMD state
  onto the CPU. Ideally we'd remove fpsimd_update_current_state()
  entirely, but I've left that for subsequent patches as there are a
  number of of other problems with the FPSIMD<->SVE conversion helpers
  that should be addressed at the same time. For now I've removed the
  misleading comment.

For setup_return(), we need to decide (for ABI reasons) whether signal
delivery should have all the side-effects of an SMSTOP. For now I've
left a TODO comment, as there are other questions in this area that I'll
address with subsequent patches.

Fixes: 8c46def44409fc91 ("arm64/signal: Add FPMR signal handling")
Fixes: 40a8e87bb32855b3 ("arm64/sme: Disable ZA and streaming mode when handling signals")
Fixes: ea64baacbc36a0d5 ("arm64/signal: Flush FPSIMD register state when disabling streaming mode")
Fixes: baa8515281b30861 ("arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE")
Fixes: 8cd969d28fd2848d ("arm64/sve: Signal handling support")
Fixes: 39782210eb7e8763 ("arm64/sme: Implement ZA signal handling")
Fixes: ee072cf708048c0d ("arm64/sme: Implement signal handling for ZT")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 -
 arch/arm64/kernel/fpsimd.c      | 28 --------------
 arch/arm64/kernel/signal.c      | 66 ++++++---------------------------
 3 files changed, 12 insertions(+), 83 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 1a18f851b6144..b7adb2c72204b 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -76,7 +76,6 @@ extern void fpsimd_load_state(struct user_fpsimd_state *state);
 extern void fpsimd_thread_switch(struct task_struct *next);
 extern void fpsimd_flush_thread(void);
 
-extern void fpsimd_signal_preserve_current_state(void);
 extern void fpsimd_preserve_current_state(void);
 extern void fpsimd_restore_current_state(void);
 extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index ea07c4577f17e..b0874402f7ecc 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1662,18 +1662,6 @@ void fpsimd_preserve_current_state(void)
 	put_cpu_fpsimd_context();
 }
 
-/*
- * Like fpsimd_preserve_current_state(), but ensure that
- * current->thread.uw.fpsimd_state is updated so that it can be copied to
- * the signal frame.
- */
-void fpsimd_signal_preserve_current_state(void)
-{
-	fpsimd_preserve_current_state();
-	if (current->thread.fp_type == FP_STATE_SVE)
-		sve_to_fpsimd(current);
-}
-
 /*
  * Associate current's FPSIMD context with this cpu
  * The caller must have ownership of the cpu FPSIMD context before calling
@@ -1766,30 +1754,14 @@ void fpsimd_restore_current_state(void)
 	put_cpu_fpsimd_context();
 }
 
-/*
- * Load an updated userland FPSIMD state for 'current' from memory and set the
- * flag that indicates that the FPSIMD register contents are the most recent
- * FPSIMD state of 'current'. This is used by the signal code to restore the
- * register state when returning from a signal handler in FPSIMD only cases,
- * any SVE context will be discarded.
- */
 void fpsimd_update_current_state(struct user_fpsimd_state const *state)
 {
 	if (WARN_ON(!system_supports_fpsimd()))
 		return;
 
-	get_cpu_fpsimd_context();
-
 	current->thread.uw.fpsimd_state = *state;
 	if (current->thread.fp_type == FP_STATE_SVE)
 		fpsimd_to_sve(current);
-
-	task_fpsimd_load();
-	fpsimd_bind_task_to_cpu();
-
-	clear_thread_flag(TIF_FOREIGN_FPSTATE);
-
-	put_cpu_fpsimd_context();
 }
 
 /*
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index a7c37afb4ebeb..0de9c452c6c0e 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -250,6 +250,8 @@ static int preserve_fpsimd_context(struct fpsimd_context __user *ctx)
 		&current->thread.uw.fpsimd_state;
 	int err;
 
+	sve_sync_to_fpsimd(current);
+
 	/* copy the FP and status/control registers */
 	err = __copy_to_user(ctx->vregs, fpsimd->vregs, sizeof(fpsimd->vregs));
 	__put_user_error(fpsimd->fpsr, &ctx->fpsr, err);
@@ -291,8 +293,6 @@ static int preserve_fpmr_context(struct fpmr_context __user *ctx)
 {
 	int err = 0;
 
-	current->thread.uw.fpmr = read_sysreg_s(SYS_FPMR);
-
 	__put_user_error(FPMR_MAGIC, &ctx->head.magic, err);
 	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
 	__put_user_error(current->thread.uw.fpmr, &ctx->fpmr, err);
@@ -310,7 +310,7 @@ static int restore_fpmr_context(struct user_ctxs *user)
 
 	__get_user_error(fpmr, &user->fpmr->fpmr, err);
 	if (!err)
-		write_sysreg_s(fpmr, SYS_FPMR);
+		current->thread.uw.fpmr = fpmr;
 
 	return err;
 }
@@ -372,11 +372,6 @@ static int preserve_sve_context(struct sve_context __user *ctx)
 	err |= __copy_to_user(&ctx->__reserved, reserved, sizeof(reserved));
 
 	if (vq) {
-		/*
-		 * This assumes that the SVE state has already been saved to
-		 * the task struct by calling the function
-		 * fpsimd_signal_preserve_current_state().
-		 */
 		err |= __copy_to_user((char __user *)ctx + SVE_SIG_REGS_OFFSET,
 				      current->thread.sve_state,
 				      SVE_SIG_REGS_SIZE(vq));
@@ -432,16 +427,6 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	if (user->sve_size < SVE_SIG_CONTEXT_SIZE(vq))
 		return -EINVAL;
 
-	/*
-	 * Careful: we are about __copy_from_user() directly into
-	 * thread.sve_state with preemption enabled, so protection is
-	 * needed to prevent a racing context switch from writing stale
-	 * registers back over the new data.
-	 */
-
-	fpsimd_flush_task_state(current);
-	/* From now, fpsimd_thread_switch() won't touch thread.sve_state */
-
 	sve_alloc(current, true);
 	if (!current->thread.sve_state) {
 		clear_thread_flag(TIF_SVE);
@@ -541,11 +526,6 @@ static int preserve_za_context(struct za_context __user *ctx)
 	err |= __copy_to_user(&ctx->__reserved, reserved, sizeof(reserved));
 
 	if (vq) {
-		/*
-		 * This assumes that the ZA state has already been saved to
-		 * the task struct by calling the function
-		 * fpsimd_signal_preserve_current_state().
-		 */
 		err |= __copy_to_user((char __user *)ctx + ZA_SIG_REGS_OFFSET,
 				      current->thread.sme_state,
 				      ZA_SIG_REGS_SIZE(vq));
@@ -580,16 +560,6 @@ static int restore_za_context(struct user_ctxs *user)
 	if (user->za_size < ZA_SIG_CONTEXT_SIZE(vq))
 		return -EINVAL;
 
-	/*
-	 * Careful: we are about __copy_from_user() directly into
-	 * thread.sme_state with preemption enabled, so protection is
-	 * needed to prevent a racing context switch from writing stale
-	 * registers back over the new data.
-	 */
-
-	fpsimd_flush_task_state(current);
-	/* From now, fpsimd_thread_switch() won't touch thread.sve_state */
-
 	sme_alloc(current, true);
 	if (!current->thread.sme_state) {
 		current->thread.svcr &= ~SVCR_ZA_MASK;
@@ -627,11 +597,6 @@ static int preserve_zt_context(struct zt_context __user *ctx)
 	BUILD_BUG_ON(sizeof(ctx->__reserved) != sizeof(reserved));
 	err |= __copy_to_user(&ctx->__reserved, reserved, sizeof(reserved));
 
-	/*
-	 * This assumes that the ZT state has already been saved to
-	 * the task struct by calling the function
-	 * fpsimd_signal_preserve_current_state().
-	 */
 	err |= __copy_to_user((char __user *)ctx + ZT_SIG_REGS_OFFSET,
 			      thread_zt_state(&current->thread),
 			      ZT_SIG_REGS_SIZE(1));
@@ -657,16 +622,6 @@ static int restore_zt_context(struct user_ctxs *user)
 	if (nregs != 1)
 		return -EINVAL;
 
-	/*
-	 * Careful: we are about __copy_from_user() directly into
-	 * thread.zt_state with preemption enabled, so protection is
-	 * needed to prevent a racing context switch from writing stale
-	 * registers back over the new data.
-	 */
-
-	fpsimd_flush_task_state(current);
-	/* From now, fpsimd_thread_switch() won't touch ZT in thread state */
-
 	err = __copy_from_user(thread_zt_state(&current->thread),
 			       (char __user const *)user->zt +
 					ZT_SIG_REGS_OFFSET,
@@ -1017,6 +972,8 @@ static int restore_sigframe(struct pt_regs *regs,
 	 */
 	forget_syscall(regs);
 
+	fpsimd_save_and_flush_current_state();
+
 	err |= !valid_user_regs(&regs->user_regs, current);
 	if (err == 0)
 		err = parse_user_sigframe(&user, sf);
@@ -1510,8 +1467,11 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
 		/*
 		 * If we were in streaming mode the saved register
 		 * state was SVE but we will exit SM and use the
-		 * FPSIMD register state - flush the saved FPSIMD
-		 * register state in case it gets loaded.
+		 * FPSIMD register state.
+		 *
+		 * TODO: decide if this should behave as SMSTOP (e.g. reset
+		 * FPSR + FPMR), or whether this should only clear the scalable
+		 * registers + ZA state.
 		 */
 		if (current->thread.svcr & SVCR_SM_MASK) {
 			memset(&current->thread.uw.fpsimd_state, 0,
@@ -1519,9 +1479,7 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
 			current->thread.fp_type = FP_STATE_FPSIMD;
 		}
 
-		current->thread.svcr &= ~(SVCR_ZA_MASK |
-					  SVCR_SM_MASK);
-		sme_smstop();
+		current->thread.svcr &= ~(SVCR_ZA_MASK | SVCR_SM_MASK);
 	}
 
 	return 0;
@@ -1535,7 +1493,7 @@ static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,
 	struct user_access_state ua_state;
 	int err = 0;
 
-	fpsimd_signal_preserve_current_state();
+	fpsimd_save_and_flush_current_state();
 
 	if (get_sigframe(&user, ksig, regs))
 		return 1;
-- 
2.30.2


