Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0DDE64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmTlt8yceUwYSHPAT9RsfDwAJcRxAV4NP7eizCa3WVw=; b=XoZO8YRoWM0X/9Hww5XYpGL0zd
	0rb6ptEo/ZI6n6+MYwUjiLgyZCSWu7kL11v0R1MM/H3cpPLXSvKukL57AYkPzUfm6gWRZa9z1l53b
	NH2DM3F49V9Nc9kdFwhBcQ+mT6fhSA6AHIbMt8sbIgHsrA+ZaBJC8xRvX1FBwHD0wWA2aYT+VUPc3
	1MFBzmjocWW8f/Mxlh8+qKjTGI8D2kYPyA4WTkH8sp9SWegIwzsJumL4N3Y/eqpyfF/36470qN41Y
	v1bvrVtmeQ6GxCzo1DfQoOm+Hlz8khjO6lV1L63BiTg2mYsX554Tzllj0jqX6yZwytOu5zrxQJh0j
	FR4JK19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISY4-00000009XC0-3nUe;
	Tue, 03 Dec 2024 13:02:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISK8-00000009ULT-2D5n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05E005C6CED;
	Tue,  3 Dec 2024 12:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0832DC4CED6;
	Tue,  3 Dec 2024 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733230095;
	bh=i08Tzo89Z13rb+kYRXH2bI07rV1ZZlwqvs7iq1bbVjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RLd6ENmPrTM0A34TzAcUtU1uiKIT0kVJ+FuE5vic1Vz/f14EEiVqDcDscxQ70QZJH
	 /jd82Oyg6xjbMeEeeiOjVQU0lWN8KMeItR5pKlc3rstA2RAp39whz6I73IC9VZ1Ep9
	 oMvJNYuJ50MydecPpV9rOInue5MgbRfSRfMJh+yB1+6LfF4mDm0KGRHAcUFiS9/ZLp
	 czl1/GimPnA/L6WSb2EuRUVANWIwmWObblrr6mZ4c2op/zJ9g7aIcqudeKdY8Aixvf
	 HOj0cbfHtBoCR3uWfqI8qC3HXi97lp/yj5na4Dh/3NTUtqIXyv0jRe99Hug9IU8hAy
	 X7cznEbbOUxSg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:45:56 +0000
Subject: [PATCH 4/6] arm64/signal: Consistently invalidate the in register
 FP state in restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-sme-reenable-v1-4-d853479d1b77@kernel.org>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
In-Reply-To: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=7030; i=broonie@kernel.org;
 h=from:subject:message-id; bh=i08Tzo89Z13rb+kYRXH2bI07rV1ZZlwqvs7iq1bbVjc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTv4C57b2eCs7HLjeNSCmcdMbpX+CdFHe1mg7BuJt
 nPHGwkSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ07+AgAKCRAk1otyXVSH0BCxB/
 4uPgjG9e6YkBaGPIdRsGHOnukmb1x17JGEj6UQpY/pJHCtwqJcFwnfc07vZQ6R2iRB7GvOIX3iJokl
 oLaXc6zX8Zwa8+WxPGG2sm8lnP47LDXCyi+NdtA9VOP3KUjnxai2aeN44YrAGzq9VGZ+B6a8XvOPvp
 Mn6H2Gx4ZiajcWQ7XR9SNeXUAR21k/UDEZsOqZoZPcYKHsQyXfUuRxYnMRTb9/X76CJOHM+w5Fu12q
 seHTGI72aiBJA481jDry92XRzjSJ9GRiqYA2/YEnkINviq3drGIarOQlEBt6mIcltxZPDbhcks3uKl
 3H3N7ysk4yc2poh/Avxtja8Im1pedg
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044816_656960_FDFD8710 
X-CRM114-Status: GOOD (  22.40  )
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

When restoring the SVE and SME specific floating point register states we
flush the task floating point state, marking the hardware state as stale so
that preemption does not result in us saving register state from the signal
handler on top of the restored context and forcing a reload from memory.
For the plain FPSIMD state we don't do this, we just copy the state from
userspace and then force an immediate reload of the register state.
This isn't racy against context switch since we copy the incoming data
onto the stack rather than directly into the task struct but it's still
messy and inconsistent.

Simplify things and avoid a potential source of error by moving the
invalidation of the CPU state to the main restore_sigframe() and
reworking the restore of the FPSIMD state to update the task struct and
rely on loading as part of the general do_notify_resume() handling for
return to user like we do for the SVE and SME state.

As a result of this the only user of fpsimd_update_current_state() is
the 32 bit signal code which should not have any SVE state, add an
assert there that we don't have SVE enabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c |  2 +-
 arch/arm64/kernel/signal.c | 70 +++++++++++++++-------------------------------
 2 files changed, 23 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index a3bb17c88942eba031d26e9f75ad46f37b6dc621..f02762762dbcf954e9add6dfd3575ae7055b6b0e 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1828,7 +1828,7 @@ void fpsimd_update_current_state(struct user_fpsimd_state const *state)
 	get_cpu_fpsimd_context();
 
 	current->thread.uw.fpsimd_state = *state;
-	if (test_thread_flag(TIF_SVE))
+	if (WARN_ON_ONCE(test_thread_flag(TIF_SVE)))
 		fpsimd_to_sve(current);
 
 	task_fpsimd_load();
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 14ac6fdb872b9672e4b16a097f1b577aae8dec50..abd0907061fe664bf22d1995319f9559c4bbed91 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -271,7 +271,7 @@ static int preserve_fpsimd_context(struct fpsimd_context __user *ctx)
 
 static int restore_fpsimd_context(struct user_ctxs *user)
 {
-	struct user_fpsimd_state fpsimd;
+	struct user_fpsimd_state *fpsimd = &current->thread.uw.fpsimd_state;
 	int err = 0;
 
 	/* check the size information */
@@ -279,18 +279,14 @@ static int restore_fpsimd_context(struct user_ctxs *user)
 		return -EINVAL;
 
 	/* copy the FP and status/control registers */
-	err = __copy_from_user(fpsimd.vregs, &(user->fpsimd->vregs),
-			       sizeof(fpsimd.vregs));
-	__get_user_error(fpsimd.fpsr, &(user->fpsimd->fpsr), err);
-	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
+	err = __copy_from_user(fpsimd->vregs, &(user->fpsimd->vregs),
+			       sizeof(fpsimd->vregs));
+	__get_user_error(fpsimd->fpsr, &(user->fpsimd->fpsr), err);
+	__get_user_error(fpsimd->fpcr, &(user->fpsimd->fpcr), err);
 
 	clear_thread_flag(TIF_SVE);
 	current->thread.fp_type = FP_STATE_FPSIMD;
 
-	/* load the hardware registers from the fpsimd_state structure */
-	if (!err)
-		fpsimd_update_current_state(&fpsimd);
-
 	return err ? -EFAULT : 0;
 }
 
@@ -396,7 +392,7 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 {
 	int err = 0;
 	unsigned int vl, vq;
-	struct user_fpsimd_state fpsimd;
+	struct user_fpsimd_state *fpsimd = &current->thread.uw.fpsimd_state;
 	u16 user_vl, flags;
 
 	if (user->sve_size < sizeof(*user->sve))
@@ -439,16 +435,6 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
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
@@ -471,14 +457,10 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 fpsimd_only:
 	/* copy the FP and status/control registers */
 	/* restore_sigframe() already checked that user->fpsimd != NULL. */
-	err = __copy_from_user(fpsimd.vregs, user->fpsimd->vregs,
-			       sizeof(fpsimd.vregs));
-	__get_user_error(fpsimd.fpsr, &user->fpsimd->fpsr, err);
-	__get_user_error(fpsimd.fpcr, &user->fpsimd->fpcr, err);
-
-	/* load the hardware registers from the fpsimd_state structure */
-	if (!err)
-		fpsimd_update_current_state(&fpsimd);
+	err = __copy_from_user(fpsimd->vregs, user->fpsimd->vregs,
+			       sizeof(fpsimd->vregs));
+	__get_user_error(fpsimd->fpsr, &user->fpsimd->fpsr, err);
+	__get_user_error(fpsimd->fpcr, &user->fpsimd->fpcr, err);
 
 	return err ? -EFAULT : 0;
 }
@@ -587,16 +569,6 @@ static int restore_za_context(struct user_ctxs *user)
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
@@ -664,16 +636,6 @@ static int restore_zt_context(struct user_ctxs *user)
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
@@ -1028,6 +990,18 @@ static int restore_sigframe(struct pt_regs *regs,
 	if (err == 0)
 		err = parse_user_sigframe(&user, sf);
 
+	/*
+	 * Careful: we are about __copy_from_user() directly into
+	 * thread floating point state with preemption enabled, so
+	 * protection is needed to prevent a racing context switch
+	 * from writing stale registers back over the new data. Mark
+	 * the register floating point state as invalid and unbind the
+	 * task from the CPU to force a reload before we return to
+	 * userspace. fpsimd_flush_task_state() has a check for FP
+	 * support.
+	 */
+	fpsimd_flush_task_state(current);
+
 	if (err == 0 && system_supports_fpsimd()) {
 		if (!user.fpsimd)
 			return -EINVAL;

-- 
2.39.5


