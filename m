Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19829C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZxSdy74Ay4v2Qdu4MSA5Ypp/4SsT82/WB2mwBgc3ik=; b=QuL43cdfYFoeVf27nFWbamq9iJ
	7DdfeiO/5rrqhN8ApU3mjJRzNLoJxYCDC6F+sbtI2c8b+ckoUk4tM1gOgsmfK8LnsXjwFJ4Fs1Z3f
	xu/X5VdboRgZXTYSMx92o9/lI2EU77W3kJ7QfSvOroXVYuYv1xJp49fILFtc2NMcaS3tU9NxeT3bT
	UzZPyfQMWIGL14aQxUqFzAW69EGu9cH9HtW462olPK9y+CY0IwunQFa5XgTAFCjgzr/CNDicMe5+o
	PHMOgbk2X2IGyis9JeqU2sx+cCdqoPiz2GL3FFaxPAd4jsacqh6cdfljHgHiP381HhZBL/0oMo/zL
	ownkZKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaeG-00000005SKm-42pI;
	Sun, 19 Jul 2026 23:10:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaeF-00000005SK6-3OGz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:10:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4180760120;
	Sun, 19 Jul 2026 23:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124641F000E9;
	Sun, 19 Jul 2026 23:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502615;
	bh=7ZxSdy74Ay4v2Qdu4MSA5Ypp/4SsT82/WB2mwBgc3ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N0f57J8lqH8ZdaPRomNnI8s9v8EWpunYRvgxSafSGrad4lDc5hSR94fxzdp00OwRC
	 TvDCUn1cQBdW1fXQ7gIUem3KyN92YS5I70ldcMzwMMltkXfA09QC78WHYdMNJ/MdTS
	 4eMvsI0veanGKQA6JoyKTvmcyQ8cQJ2FgfWVWRRy+GJ+kYQuOK8ggjTeeGdw/Ai8wp
	 +VST5eGPoj0t9RnO0InBwei9nXL+2q/duyPtKksHRqVAkGNjxQNragLS4z/zrv0MDk
	 WgxvoDVz2orvUVw8vmlFQ2PSoeKNUZWUY47lmFGXyA7LOOE7oUbjzxV2eLe78j0P52
	 BrjOnauAg3cZw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:31 +0100
Subject: [PATCH v13 04/32] arm64/fpsimd: Decide to save ZT0 and streaming
 mode FFR at bind time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-4-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4661; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ee4vBGEdpju7o7htpyCkV88y2wT1UDGGt62IPZtgiFU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVkq8sb8hg2ZdWlI61m0C5jJ3WZS7AQQANu4D
 k1GNwWE1MSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZKgAKCRAk1otyXVSH
 0G5kB/9yGIAfVt7vcNEJCJuzFdqbmHVCMQl7s9L9IfX6Nw1wzdeUDjF5z4hwWs58PB7J1PZlC4f
 nIET8M81PX0K6kkvvypEMLlZTqWtGGiztkDH6JYkTHupSiWFjd4hdNyMIzwQgPjAsCKup9UnNs4
 wPEF9e6bcVwo8czvDiy3HSrr0rR8lUoRKk0UKleoyeF45hFiULSFEpM3Jylhn88fGXrZYWXcTT0
 ViYwRE8fWfy8IcX68UDL4aGJi4faFbjqXHK7E47uJQJdaVidzyGooeY9+S8xgyeIF6J096GCEHh
 pGR0nFnFxcqaTDYvxL22Z9WLTf9BsWoQIprBk25Qj963SExq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Some parts of the SME state are optional, enabled by additional features
on top of the base FEAT_SME and controlled with enable bits in SMCR_ELx. We
unconditionally enable these for the host but for KVM we will allow the
feature set exposed to guests to be restricted by the VMM. These are the
FFR register (FEAT_SME_FA64) and ZT0 (FEAT_SME2).

We defer saving of guest floating point state for non-protected guests to
the host kernel. We also want to avoid having to reconfigure the guest
floating point state if nothing used the floating point state while running
the host. If the guest was running with the optional features disabled then
traps will be enabled for them so the host kernel will need to skip
accessing that state when saving state for the guest.

Support this by moving the decision about saving this state to the point
where we bind floating point state to the CPU, instead of only storing
the SME VL to use we store the SMCR value.  This includes all the enable
controls for the subfeatures along the vector length.

In order to keep the code paths for the vector extensions consistent
also adjust the SVE path to store a ZCR value instead of the VL, since
no fields other than LEN are currently defined for ZCR this is much less
of a meaningful change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  4 ++--
 arch/arm64/kernel/fpsimd.c      | 16 ++++++++--------
 arch/arm64/kvm/fpsimd.c         |  3 ++-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 59f3c4a9e390..395606e01e18 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -166,8 +166,8 @@ struct cpu_fp_state {
 	struct arm64_sme_state *sme_state;
 	u64 *svcr;
 	u64 *fpmr;
-	unsigned int sve_vl;
-	unsigned int sme_vl;
+	u64 smcr;
+	u64 zcr;
 	enum fp_type *fp_type;
 	enum fp_type to_save;
 };
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index b868db2982ee..b5535f8c9bd9 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -474,7 +474,7 @@ static void fpsimd_save_user_state(void)
 	/* set by fpsimd_bind_task_to_cpu() or fpsimd_bind_state_to_cpu() */
 	bool save_sve_regs = false;
 	bool save_ffr;
-	unsigned int vl;
+	unsigned int vq;
 
 	WARN_ON(!system_supports_fpsimd());
 	WARN_ON(preemptible());
@@ -498,7 +498,7 @@ static void fpsimd_save_user_state(void)
 	    last->to_save == FP_STATE_SVE) {
 		save_sve_regs = true;
 		save_ffr = true;
-		vl = last->sve_vl;
+		vq = SYS_FIELD_GET(ZCR_ELx, LEN, last->zcr) + 1;
 	}
 
 	if (system_supports_sme()) {
@@ -508,19 +508,19 @@ static void fpsimd_save_user_state(void)
 
 		if (*svcr & SVCR_ZA_MASK)
 			sme_save_state(last->sme_state,
-				       system_supports_sme2());
+				       last->smcr & SMCR_ELx_EZT0);
 
 		/* If we are in streaming mode override regular SVE. */
 		if (*svcr & SVCR_SM_MASK) {
 			save_sve_regs = true;
-			save_ffr = system_supports_fa64();
-			vl = last->sme_vl;
+			save_ffr = last->smcr & SMCR_ELx_FA64;
+			vq = SYS_FIELD_GET(SMCR_ELx, LEN, last->smcr) + 1;
 		}
 	}
 
 	if (IS_ENABLED(CONFIG_ARM64_SVE) && save_sve_regs) {
 		/* Get the configured VL from RDVL, will account for SM */
-		if (WARN_ON(sve_get_vl() != vl)) {
+		if (WARN_ON(sve_get_vl() != sve_vl_from_vq(vq))) {
 			/*
 			 * Can't save the user regs, so current would
 			 * re-enter user with corrupt state.
@@ -1712,8 +1712,8 @@ static void fpsimd_bind_task_to_cpu(void)
 	last->st = &current->thread.uw.fpsimd_state;
 	last->sve_state = current->thread.sve_state;
 	last->sme_state = current->thread.sme_state;
-	last->sve_vl = task_get_sve_vl(current);
-	last->sme_vl = task_get_sme_vl(current);
+	last->zcr = task_zcr(current);
+	last->smcr = task_smcr(current);
 	last->svcr = &current->thread.svcr;
 	last->fpmr = &current->thread.uw.fpmr;
 	last->fp_type = &current->thread.fp_type;
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 3f6b1e29cd6b..567dd43970c5 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -89,7 +89,8 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 		 */
 		fp_state.st = &vcpu->arch.ctxt.fp_regs;
 		fp_state.sve_state = vcpu->arch.sve_state;
-		fp_state.sve_vl = vcpu->arch.sve_max_vl;
+		fp_state.zcr = vcpu_sve_max_vq(vcpu) - 1;
+		fp_state.smcr = 0;
 		fp_state.sme_state = NULL;
 		fp_state.svcr = __ctxt_sys_reg(&vcpu->arch.ctxt, SVCR);
 		fp_state.fpmr = __ctxt_sys_reg(&vcpu->arch.ctxt, FPMR);

-- 
2.47.3


