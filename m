Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A727DC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cM0JS6YT4olZ7AVRaRtwgKecRLAKOygGxdYUTeWofoI=; b=NCyi0++bjVEz+aNp0a/S2Bx1Fc
	5wriaHnMN1mPfkyjUK+DuS5LQ/CBKqB0+J/aafaB3ivUTZa2cTJoHbrehhJ9OXHSnnK94Rtdrj4LY
	vnV4Ttghxq7sgOos1ptD+6FIKuJUTYCNlgCsxF895G69VkchuOt45hTszbB1psPBzWFkUKUUl6aQH
	u9T3X7qED8fbhYdsJjF6kp6v0ezI7BhZW4htJPXcLlKw88xyZBYvMojdsZtgpKWL7hqbyeeEr623B
	ppg0wSzooigHsf1MkrAkugkl7d/WQDLQHGLlYpAY+jZKyfg7kEZq6LxMuHIj16UjPpavSeL06+mce
	RwghgJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLPQY-000000042ow-058P;
	Sat, 31 May 2025 16:51:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLPOP-000000042ju-1rly
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 16:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 127305C56A7;
	Sat, 31 May 2025 16:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88009C4CEEE;
	Sat, 31 May 2025 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748710147;
	bh=nmv3gjGoO2qejkd4rAESkNoSoD9W9mKYNx7ZzoBfDJ8=;
	h=From:To:Cc:Subject:Date:From;
	b=jnrNRp10Oe6bfe5ZIk1SWU+5UivLTimNXnWcwNfpIvscokwAGNlLvLCNqdzghKgZg
	 JjuCmQQ0+EWMJJQh1CPGnaxOB+PjNy6DZVe5GAE/xZxlFt+wATNJtVLBg13z4MHoZS
	 k8H0gSblKnkCku0bGm9OBRwyFCGtEaC6ZveK8eWqHqS++rgg+1EZBvGTc8+u8s5jXU
	 AwvLrlBznYMsbZM4Do3Of9WYhQOT1f4Zqkwz4HL9oafHWxvkuPuYv2gJWsLu1D6IMD
	 8GNe1u7R76KFUlS4c74sOKEylFhvSKLRuUg23Lge2R6OCIvitua5pw8bzuMBd/cngO
	 9sBvqi3JnmOTA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uLPOL-0029fb-9k;
	Sat, 31 May 2025 17:49:05 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Add helper to identify a nested context
Date: Sat, 31 May 2025 17:49:01 +0100
Message-Id: <20250531164901.1166892-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_094909_566725_76C0CB9F 
X-CRM114-Status: GOOD (  19.31  )
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

A common idiom in the KVM code is to check if we are currently
dealing with a "nested" context, defined as having NV enabled,
but being in the EL1&0 translation regime.

This is usually expressed as:

	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu) ... )

which is a mouthful and a bit hard to read, specially when followed
by additional conditions.

Introduce a new helper that encapsulate these two terms, allowing
the above to be written as

	if (is_nested_context(vcpu) ... )

which is both shorter and easier to read, and makes more obvious
the potential for simplification on some code paths.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h    |  5 +++++
 arch/arm64/kvm/arch_timer.c             |  2 +-
 arch/arm64/kvm/arm.c                    |  2 +-
 arch/arm64/kvm/emulate-nested.c         |  9 ++-------
 arch/arm64/kvm/handle_exit.c            | 20 +++++++-------------
 arch/arm64/kvm/hyp/include/hyp/switch.h |  8 ++++----
 arch/arm64/kvm/hyp/vgic-v3-sr.c         |  2 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c    |  2 +-
 8 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index bd020fc28aa9c..19ffe9b0d3c14 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -224,6 +224,11 @@ static inline bool vcpu_is_host_el0(const struct kvm_vcpu *vcpu)
 	return is_hyp_ctxt(vcpu) && !vcpu_is_el2(vcpu);
 }
 
+static inline bool is_nested_ctxt(struct kvm_vcpu *vcpu)
+{
+	return vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu);
+}
+
 /*
  * The layout of SPSR for an AArch32 state is different when observed from an
  * AArch64 SPSR_ELx or an AArch32 SPSR_*. This function generates the AArch32
diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 5133dcbfe9f76..f95b56e7ebb2f 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -830,7 +830,7 @@ static void timer_set_traps(struct kvm_vcpu *vcpu, struct timer_map *map)
 	 * by the guest (either FEAT_VHE or FEAT_E2H0 is implemented, but
 	 * not both). This simplifies the handling of the EL1NV* bits.
 	 */
-	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
+	if (is_nested_ctxt(vcpu)) {
 		u64 val = __vcpu_sys_reg(vcpu, CNTHCTL_EL2);
 
 		/* Use the VHE format for mental sanity */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 36cfcffb40d89..094480b271a42 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -521,7 +521,7 @@ static void vcpu_set_pauth_traps(struct kvm_vcpu *vcpu)
 		 * Either we're running an L2 guest, and the API/APK bits come
 		 * from L1's HCR_EL2, or API/APK are both set.
 		 */
-		if (unlikely(vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))) {
+		if (unlikely(is_nested_ctxt(vcpu))) {
 			u64 val;
 
 			val = __vcpu_sys_reg(vcpu, HCR_EL2);
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3a384e9660b83..1de4a9001d9d5 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2592,13 +2592,8 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 
 static bool __forward_traps(struct kvm_vcpu *vcpu, unsigned int reg, u64 control_bit)
 {
-	bool control_bit_set;
-
-	if (!vcpu_has_nv(vcpu))
-		return false;
-
-	control_bit_set = __vcpu_sys_reg(vcpu, reg) & control_bit;
-	if (!is_hyp_ctxt(vcpu) && control_bit_set) {
+	if (is_nested_ctxt(vcpu) &&
+	    (__vcpu_sys_reg(vcpu, reg) & control_bit)) {
 		kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
 		return true;
 	}
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 453266c964819..c37c58d9d25d6 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -252,7 +252,7 @@ static int kvm_handle_ptrauth(struct kvm_vcpu *vcpu)
 		return 1;
 	}
 
-	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
+	if (is_nested_ctxt(vcpu)) {
 		kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
 		return 1;
 	}
@@ -311,12 +311,11 @@ static int kvm_handle_gcs(struct kvm_vcpu *vcpu)
 
 static int handle_other(struct kvm_vcpu *vcpu)
 {
-	bool is_l2 = vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu);
+	bool allowed, fwd = is_nested_ctxt(vcpu);
 	u64 hcrx = __vcpu_sys_reg(vcpu, HCRX_EL2);
 	u64 esr = kvm_vcpu_get_esr(vcpu);
 	u64 iss = ESR_ELx_ISS(esr);
 	struct kvm *kvm = vcpu->kvm;
-	bool allowed, fwd = false;
 
 	/*
 	 * We only trap for two reasons:
@@ -335,28 +334,23 @@ static int handle_other(struct kvm_vcpu *vcpu)
 	switch (iss) {
 	case ESR_ELx_ISS_OTHER_ST64BV:
 		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V);
-		if (is_l2)
-			fwd = !(hcrx & HCRX_EL2_EnASR);
+		fwd &= !(hcrx & HCRX_EL2_EnASR);
 		break;
 	case ESR_ELx_ISS_OTHER_ST64BV0:
 		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
-		if (is_l2)
-			fwd = !(hcrx & HCRX_EL2_EnAS0);
+		fwd &= !(hcrx & HCRX_EL2_EnAS0);
 		break;
 	case ESR_ELx_ISS_OTHER_LDST64B:
 		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64);
-		if (is_l2)
-			fwd = !(hcrx & HCRX_EL2_EnALS);
+		fwd &= !(hcrx & HCRX_EL2_EnALS);
 		break;
 	case ESR_ELx_ISS_OTHER_TSBCSYNC:
 		allowed = kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, TRBE_V1P1);
-		if (is_l2)
-			fwd = (__vcpu_sys_reg(vcpu, HFGITR2_EL2) & HFGITR2_EL2_TSBCSYNC);
+		fwd &= (__vcpu_sys_reg(vcpu, HFGITR2_EL2) & HFGITR2_EL2_TSBCSYNC);
 		break;
 	case ESR_ELx_ISS_OTHER_PSBCSYNC:
 		allowed = kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P5);
-		if (is_l2)
-			fwd = (__vcpu_sys_reg(vcpu, HFGITR_EL2) & HFGITR_EL2_PSBCSYNC);
+		fwd &= (__vcpu_sys_reg(vcpu, HFGITR_EL2) & HFGITR_EL2_PSBCSYNC);
 		break;
 	default:
 		/* Clearly, we're missing something. */
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index eef310cdbdbd5..310ce4084adb4 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -168,7 +168,7 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		u64 val;						\
 									\
 		ctxt_sys_reg(hctxt, reg) = read_sysreg_s(SYS_ ## reg);	\
-		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))		\
+		if (is_nested_ctxt(vcpu))				\
 			compute_clr_set(vcpu, reg, c, s);		\
 									\
 		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
@@ -307,7 +307,7 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 
 	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
 		u64 hcrx = vcpu->arch.hcrx_el2;
-		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
+		if (is_nested_ctxt(vcpu)) {
 			u64 val = __vcpu_sys_reg(vcpu, HCRX_EL2);
 			hcrx |= val & __HCRX_EL2_MASK;
 			hcrx &= ~(~val & __HCRX_EL2_nMASK);
@@ -402,7 +402,7 @@ static inline void __hyp_sve_restore_guest(struct kvm_vcpu *vcpu)
 	 * nested guest, as the guest hypervisor could select a smaller VL. Slap
 	 * that into hardware before wrapping up.
 	 */
-	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))
+	if (is_nested_ctxt(vcpu))
 		sve_cond_update_zcr_vq(__vcpu_sys_reg(vcpu, ZCR_EL2), SYS_ZCR_EL2);
 
 	write_sysreg_el1(__vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu)), SYS_ZCR);
@@ -428,7 +428,7 @@ static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
 
 	if (vcpu_has_sve(vcpu)) {
 		/* A guest hypervisor may restrict the effective max VL. */
-		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))
+		if (is_nested_ctxt(vcpu))
 			zcr_el2 = __vcpu_sys_reg(vcpu, ZCR_EL2);
 		else
 			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index f162b0df5cae5..ac84710fa14e8 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -1050,7 +1050,7 @@ static bool __vgic_v3_check_trap_forwarding(struct kvm_vcpu *vcpu,
 {
 	u64 ich_hcr;
 
-	if (!vcpu_has_nv(vcpu) || is_hyp_ctxt(vcpu))
+	if (!is_nested_ctxt(vcpu))
 		return false;
 
 	ich_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 4f6954c306747..18daa59c7b137 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -111,7 +111,7 @@ bool vgic_state_is_nested(struct kvm_vcpu *vcpu)
 {
 	u64 xmo;
 
-	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
+	if (is_nested_ctxt(vcpu)) {
 		xmo = __vcpu_sys_reg(vcpu, HCR_EL2) & (HCR_IMO | HCR_FMO);
 		WARN_ONCE(xmo && xmo != (HCR_IMO | HCR_FMO),
 			  "Separate virtual IRQ/FIQ settings not supported\n");
-- 
2.39.2


