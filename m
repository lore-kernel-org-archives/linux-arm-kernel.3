Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6333ECD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyiwyZsBlJ/HkP/5iepBEfL8r8+05JUqMZbdo9VifCw=; b=muGhWod/lOi2aQgt0HixQ/N3oR
	Kd/Vqbk6MLSrksD9AkdjaP9B22IyJkQLX4A2jaQx2ODixjvS1zisy6y/k5yhPnaTv+QNGrshM0rmv
	vsvG4k+63ehmSiOarlQPiuI92niCUD7rveGr7hAO5Ibf774MyAwdqs3n7gsVvac4WTDcbU2lieqg4
	MfjeeJxLbXcyweY+p6N6AFW9Wc67kpZ50OWhiFvtHmJV6KMK5eGy7fcC7d4arwAwnEv4WUy42RcCc
	JhlCnasRzitOgioeOCzeZ1apXSBJULOosfOS3lRtPfksKptVWrMnj2CoVDtpjfH1tRzq+jGJRYC3S
	N8fpOFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRK-0000000EtNy-1IgQ;
	Wed, 03 Jun 2026 11:07:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRG-0000000EtI2-3NZG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:07:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E7DC32E4;
	Wed,  3 Jun 2026 04:07:04 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A57B43F86F;
	Wed,  3 Jun 2026 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484829; bh=xNHJ9PQ/4efqv59awU7DQNn/TP78+CypTKS6WME2oj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZBhMF74Vzh6APdocHPBQ5ra6LBuN+X19FRoyttJQDnglBQWDlOC73XuNnYx30O3z5
	 CQCqvLdwaUhoGA7BTnNtvuwDbmFtxIWZL5ND9xuupBBR0ZGMR3Gx8oOkTxtqgDMUQe
	 rR6VBXY/083nQbTJ5hqljuy6cw9E5R5rlbptTCB0=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 13/20] arm64: fpsimd: Split FPSR/FPCR from SVE save/restore
Date: Wed,  3 Jun 2026 12:06:23 +0100
Message-Id: <20260603110630.1027435-14-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040710_982086_B60828FF 
X-CRM114-Status: GOOD (  15.93  )
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

Regardless of whether the vector registers are saved in FPSIMD or SVE
format, we store FPSR and FPCR in user_fpsimd_state::{fpsr,fpcr}.

For historical reasons, the functions which save/restore SVE context
take a pointer to user_fpsimd_state::fpsr, and use this to access both
user_fpsimd_state::fpsr and user_fpsimd_state::fpcr. This is
unnecessarily fragile.

Move the save/restore of FPSR and FPCR into separate helper functions
which take a pointer to user_fpsimd_state. I've used read_sysreg_s() and
write_sysreg_s() as contemporary versions of LLVM will refuse to
directly assemble accesses to FPCR or FPSR unless the "fp" arch
extension is enabled.

For the moment, fpsimd_save_state() and fpsimd_load_state() are left
as-is with their own logic to save/restore FPSR and FPCR. This will be
unified in subsequent patches.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h         | 17 ++++++++++++++---
 arch/arm64/include/asm/fpsimdmacros.h   | 13 ++-----------
 arch/arm64/include/asm/kvm_hyp.h        |  4 ++--
 arch/arm64/kernel/entry-fpsimd.S        | 10 ++++------
 arch/arm64/kernel/fpsimd.c              |  5 +++--
 arch/arm64/kvm/hyp/fpsimd.S             |  4 ++--
 arch/arm64/kvm/hyp/include/hyp/switch.h |  4 ++--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  5 +++--
 8 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 36cf528e64971..6fd5cdf5e5f17 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -74,6 +74,18 @@ static inline void cpacr_restore(unsigned long cpacr)
 
 struct task_struct;
 
+static inline void fpsimd_save_common(struct user_fpsimd_state *state)
+{
+	state->fpsr = read_sysreg_s(SYS_FPSR);
+	state->fpcr = read_sysreg_s(SYS_FPCR);
+}
+
+static inline void fpsimd_load_common(const struct user_fpsimd_state *state)
+{
+	write_sysreg_s(state->fpsr, SYS_FPSR);
+	write_sysreg_s(state->fpcr, SYS_FPCR);
+}
+
 extern void fpsimd_save_state(struct user_fpsimd_state *state);
 extern void fpsimd_load_state(struct user_fpsimd_state *state);
 
@@ -157,9 +169,8 @@ static inline unsigned int sve_get_vl(void)
 	return vl;
 }
 
-extern void sve_save_state(void *state, u32 *pfpsr, int save_ffr);
-extern void sve_load_state(void const *state, u32 const *pfpsr,
-			   int restore_ffr);
+extern void sve_save_state(void *state, int save_ffr);
+extern void sve_load_state(void const *state, int restore_ffr);
 extern void sve_flush_live(bool flush_ffr, unsigned long vq_minus_1);
 extern void sme_save_state(void *state, int zt);
 extern void sme_load_state(void const *state, int zt);
diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
index c724fcad7ee02..1f32e0967dcd3 100644
--- a/arch/arm64/include/asm/fpsimdmacros.h
+++ b/arch/arm64/include/asm/fpsimdmacros.h
@@ -236,7 +236,7 @@
 		_sve_wrffr	0
 .endm
 
-.macro sve_save nxbase, xpfpsr, save_ffr, nxtmp
+.macro sve_save nxbase, save_ffr
  _for n, 0, 31,	_sve_str_v	\n, \nxbase, \n - 34
  _for n, 0, 15,	_sve_str_p	\n, \nxbase, \n - 16
 		cbz		\save_ffr, 921f
@@ -247,24 +247,15 @@
 922:
 		_sve_str_p	0, \nxbase
 		_sve_ldr_p	0, \nxbase, -16
-		mrs		x\nxtmp, fpsr
-		str		w\nxtmp, [\xpfpsr]
-		mrs		x\nxtmp, fpcr
-		str		w\nxtmp, [\xpfpsr, #4]
 .endm
 
-.macro sve_load nxbase, xpfpsr, restore_ffr, nxtmp
+.macro sve_load nxbase, restore_ffr
  _for n, 0, 31,	_sve_ldr_v	\n, \nxbase, \n - 34
 		cbz		\restore_ffr, 921f
 		_sve_ldr_p	0, \nxbase
 		_sve_wrffr	0
 921:
  _for n, 0, 15,	_sve_ldr_p	\n, \nxbase, \n - 16
-
-		ldr		w\nxtmp, [\xpfpsr]
-		msr		fpsr, x\nxtmp
-		ldr		w\nxtmp, [\xpfpsr, #4]
-		msr		fpcr, x\nxtmp
 .endm
 
 .macro sme_save_za nxbase, xvl, nw
diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 8d06b62e7188c..0030cc1b52197 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -123,8 +123,8 @@ void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu);
 
 void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
 void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
-void __sve_save_state(void *sve_pffr, u32 *fpsr, int save_ffr);
-void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
+void __sve_save_state(void *sve, int save_ffr);
+void __sve_restore_state(void *sve, int restore_ffr);
 
 u64 __guest_enter(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kernel/entry-fpsimd.S b/arch/arm64/kernel/entry-fpsimd.S
index a124c6d3766cf..1a581597037ca 100644
--- a/arch/arm64/kernel/entry-fpsimd.S
+++ b/arch/arm64/kernel/entry-fpsimd.S
@@ -37,11 +37,10 @@ SYM_FUNC_END(fpsimd_load_state)
  * Save the SVE state
  *
  * x0 - pointer to buffer for state
- * x1 - pointer to storage for FPSR
- * w2 - Save FFR if non-zero
+ * w1 - Save FFR if non-zero
  */
 SYM_FUNC_START(sve_save_state)
-	sve_save 0, x1, w2, 3
+	sve_save 0, w1
 	ret
 SYM_FUNC_END(sve_save_state)
 
@@ -49,11 +48,10 @@ SYM_FUNC_END(sve_save_state)
  * Load the SVE state
  *
  * x0 - pointer to buffer for state
- * x1 - pointer to storage for FPSR
- * w2 - Restore FFR if non-zero
+ * w1 - Restore FFR if non-zero
  */
 SYM_FUNC_START(sve_load_state)
-	sve_load 0, x1, w2, 4
+	sve_load 0, w1
 	ret
 SYM_FUNC_END(sve_load_state)
 
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 2578c2372c89e..9806fea8fea7c 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -426,8 +426,8 @@ static void task_fpsimd_load(void)
 	if (restore_sve_regs) {
 		WARN_ON_ONCE(current->thread.fp_type != FP_STATE_SVE);
 		sve_load_state(sve_pffr(&current->thread),
-			       &current->thread.uw.fpsimd_state.fpsr,
 			       restore_ffr);
+		fpsimd_load_common(&current->thread.uw.fpsimd_state);
 	} else {
 		WARN_ON_ONCE(current->thread.fp_type != FP_STATE_FPSIMD);
 		fpsimd_load_state(&current->thread.uw.fpsimd_state);
@@ -509,7 +509,8 @@ static void fpsimd_save_user_state(void)
 
 		sve_save_state((char *)last->sve_state +
 					sve_ffr_offset(vl),
-			       &last->st->fpsr, save_ffr);
+			       save_ffr);
+		fpsimd_save_common(last->st);
 		*last->fp_type = FP_STATE_SVE;
 	} else {
 		fpsimd_save_state(last->st);
diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
index 30507c50942eb..3d5b5e93ee5e0 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -21,11 +21,11 @@ SYM_FUNC_START(__fpsimd_restore_state)
 SYM_FUNC_END(__fpsimd_restore_state)
 
 SYM_FUNC_START(__sve_restore_state)
-	sve_load 0, x1, w2, 3
+	sve_load 0, w1
 	ret
 SYM_FUNC_END(__sve_restore_state)
 
 SYM_FUNC_START(__sve_save_state)
-	sve_save 0, x1, w2, 3
+	sve_save 0, w1
 	ret
 SYM_FUNC_END(__sve_save_state)
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 6512dd3f75ae4..eb76a863ebb84 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -468,8 +468,8 @@ static inline void __hyp_sve_restore_guest(struct kvm_vcpu *vcpu)
 	 */
 	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
 	__sve_restore_state(vcpu_sve_pffr(vcpu),
-			    &vcpu->arch.ctxt.fp_regs.fpsr,
 			    true);
+	fpsimd_load_common(&vcpu->arch.ctxt.fp_regs);
 
 	/*
 	 * The effective VL for a VM could differ from the max VL when running a
@@ -490,8 +490,8 @@ static inline void __hyp_sve_save_host(void)
 	ctxt_sys_reg(hctxt, ZCR_EL1) = read_sysreg_el1(SYS_ZCR);
 	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
 	__sve_save_state(sve_regs + sve_ffr_offset(kvm_host_sve_max_vl),
-			 &hctxt->fp_regs.fpsr,
 			 true);
+	fpsimd_save_common(&hctxt->fp_regs);
 }
 
 static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 04a6d2e0ea73f..0be4577a67e7b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -35,7 +35,8 @@ static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
 	 * on the VL, so use a consistent (i.e., the maximum) guest VL.
 	 */
 	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
-	__sve_save_state(vcpu_sve_pffr(vcpu), &vcpu->arch.ctxt.fp_regs.fpsr, true);
+	__sve_save_state(vcpu_sve_pffr(vcpu), true);
+	fpsimd_save_common(&vcpu->arch.ctxt.fp_regs);
 	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
 }
 
@@ -55,8 +56,8 @@ static void __hyp_sve_restore_host(void)
 	 */
 	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
 	__sve_restore_state(sve_regs + sve_ffr_offset(kvm_host_sve_max_vl),
-			    &hctxt->fp_regs.fpsr,
 			    true);
+	fpsimd_load_common(&hctxt->fp_regs);
 	write_sysreg_el1(ctxt_sys_reg(hctxt, ZCR_EL1), SYS_ZCR);
 }
 
-- 
2.30.2


