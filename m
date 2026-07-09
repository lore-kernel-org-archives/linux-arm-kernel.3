Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37192C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXCEStw7jpxbfMPkl2Z/72HpjmmD/RSWBvdz3qpCcgU=; b=NipO94yCu6rCm15ZOaz/JQsIlb
	K92S2e3tvRLtJFTPxZxD3zXHLHbNP1z2vFi6o2AQAmsaS2SmKnbwto4/g8rWgQKFcw4jAS/AcsvAR
	ipcUREHyTT18P0HDYa2cHihBsFmRhWYPIG7VMd0c6JfN8j4r0wOWSSKr2InCNSaCOoOuUf6Sf9weO
	BlzczJY/2OxPvB/wZX3pnOlY+1htHEbrAIqTiUhldQqgiLffbrrlszYklofvTpoLqLYSAueqQrE1f
	8ZTZoOfvSQUwcuMMjHAOUVDWzmCq4SY2BJNBjUPsspRtgbkx8RzGCRWouFpyglAZG8frt98EOb6cw
	f9WHVIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whth2-00000003Gmi-3N4v;
	Thu, 09 Jul 2026 18:41:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whth1-00000003Gkk-0zQm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:41:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F422443C7D;
	Thu,  9 Jul 2026 18:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB701F00A3A;
	Thu,  9 Jul 2026 18:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622510;
	bh=lXCEStw7jpxbfMPkl2Z/72HpjmmD/RSWBvdz3qpCcgU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QgMOA0S+Y4eap5dVYMkcLnL/Ry5Xm/wsb+x1Cj4O6YRiaArIgeBcRxmDUbKTR2Xpf
	 UUY83AMKg6kZWp5Re3DwHf4LyUxrAbjP5Isn+KafFjvzA6K4vYJWEo217zhnKq8ZGQ
	 AUjtNh8sfi/ip2yWrJD23Gu8ptPYgMK8rMJBiMFk3cJGL/Hh7ttdo79mtPK6oo9y8U
	 8TWW5TNL1Agzy6nd+9ttMJi6RvuVtAkk2DvdAJREgJiTMKK9HglKo6JnccFQvDuZwU
	 M7k6ZVYvP2WRQ8HdOUkiW51+LEJgGhV96INcGQ3awJ/hTIciHn21ljS95CSooVtFbg
	 JBCzjGgyKR8TQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:44 +0100
Subject: [PATCH v12 23/29] KVM: arm64: Handle SME exceptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-23-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=x/XFPzNN5/J6G5E0oqhJf08B8/sFJa7dJ49zCMEJE/4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+r8VGEq0Ppk21bwZmw/Ad5l8W+roobCEAC39
 p/rAEneOFuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/q/AAKCRAk1otyXVSH
 0HAvB/9ZZ3LAZ0sJFynI6ylfiHczhjXwAbvQCmR2mK8S4I7ed29W8AD1V4vReLpAymk3bVXpug9
 VJZrP3lzKlMTp/354zE/WGENmaWnAh2zLxGHKicNQummptbImVgMZP/6Wwzu5X5rrbAIeimpISB
 WmEZ2rX0xaMMhgy6vwgx/8lqEqF+dYmxo+A9U0ibDPSTBGjgjUMNtIXRz1/5k9NBF4ycOKpxJJL
 jf18L4y45ANVMuugAY/eY5VGhWZKrT5AGJZtPN9v4YLaOyyCCFkqL/OuX+KR+vY3zfVvpmykLKm
 EPdiLB+fCnc+BPGj5rihQdkIZGl/VB3v2SP8ske12xeMT5za
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

The access control for SME follows the same structure as for the base FP
and SVE extensions, with control being via CPACR_ELx.SMEN and CPTR_EL2.TSM
mirroring the equivalent FPSIMD and SVE controls in those registers. Add
handling for these controls and exceptions mirroring the existing handling
for FPSIMD and SVE.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c            | 14 ++++++++++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 11 ++++++-----
 arch/arm64/kvm/hyp/nvhe/switch.c        |  2 ++
 arch/arm64/kvm/hyp/vhe/switch.c         | 17 ++++++++++++-----
 4 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 54aedf93c78b..e69bdb87f19d 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -237,6 +237,19 @@ static int handle_sve(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+/*
+ * Guest access to SME registers should be routed to this handler only
+ * when the system doesn't support SME.
+ */
+static int handle_sme(struct kvm_vcpu *vcpu)
+{
+	if (guest_hyp_sme_traps_enabled(vcpu))
+		return kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+
+	kvm_inject_undefined(vcpu);
+	return 1;
+}
+
 /*
  * Two possibilities to handle a trapping ptrauth instruction:
  *
@@ -390,6 +403,7 @@ static exit_handle_fn arm_exit_handlers[] = {
 	[ESR_ELx_EC_SVC64]	= handle_svc,
 	[ESR_ELx_EC_SYS64]	= kvm_handle_sys_reg,
 	[ESR_ELx_EC_SVE]	= handle_sve,
+	[ESR_ELx_EC_SME]	= handle_sme,
 	[ESR_ELx_EC_ERET]	= kvm_handle_eret,
 	[ESR_ELx_EC_IABT_LOW]	= kvm_handle_guest_abort,
 	[ESR_ELx_EC_DABT_LOW]	= kvm_handle_guest_abort,
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 7c913da9babb..47f523a37cbe 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -67,11 +67,8 @@ static inline void __activate_cptr_traps_nvhe(struct kvm_vcpu *vcpu)
 {
 	u64 val = CPTR_NVHE_EL2_RES1 | CPTR_EL2_TAM | CPTR_EL2_TTA;
 
-	/*
-	 * Always trap SME since it's not supported in KVM.
-	 * TSM is RES1 if SME isn't implemented.
-	 */
-	val |= CPTR_EL2_TSM;
+	if (!vcpu_has_sme(vcpu) || !guest_owns_fp_regs())
+		val |= CPTR_EL2_TSM;
 
 	if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
 		val |= CPTR_EL2_TZ;
@@ -99,6 +96,8 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
 		val |= CPACR_EL1_FPEN;
 		if (vcpu_has_sve(vcpu))
 			val |= CPACR_EL1_ZEN;
+		if (vcpu_has_sme(vcpu))
+			val |= CPACR_EL1_SMEN;
 	}
 
 	if (!vcpu_has_nv(vcpu))
@@ -140,6 +139,8 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
 		val &= ~CPACR_EL1_FPEN;
 	if (!(SYS_FIELD_GET(CPACR_EL1, ZEN, cptr) & BIT(0)))
 		val &= ~CPACR_EL1_ZEN;
+	if (!(SYS_FIELD_GET(CPACR_EL1, SMEN, cptr) & BIT(0)))
+		val &= ~CPACR_EL1_SMEN;
 
 	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S1POE, IMP))
 		val |= cptr & CPACR_EL1_E0POE;
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7318e3e6a5f3..2d5029dbfb00 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -196,6 +196,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[ESR_ELx_EC_CP15_32]		= kvm_hyp_handle_cp15_32,
 	[ESR_ELx_EC_SYS64]		= kvm_hyp_handle_sysreg,
 	[ESR_ELx_EC_SVE]		= kvm_hyp_handle_fpsimd,
+	[ESR_ELx_EC_SME]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
 	[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
@@ -208,6 +209,7 @@ static const exit_handler_fn pvm_exit_handlers[] = {
 	[ESR_ELx_EC_HVC64]		= kvm_handle_pvm_hvc64,
 	[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
 	[ESR_ELx_EC_SVE]		= kvm_handle_pvm_restricted,
+	[ESR_ELx_EC_SME]		= kvm_handle_pvm_restricted,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
 	[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index bbe9cebd3d9d..5fc677afcaf9 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -458,22 +458,28 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
 	return true;
 }
 
-static bool kvm_hyp_handle_zcr_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
+static bool kvm_hyp_handle_vec_cr_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	u32 sysreg = esr_sys64_to_sysreg(kvm_vcpu_get_esr(vcpu));
 
 	if (!vcpu_has_nv(vcpu))
 		return false;
 
-	if (sysreg != SYS_ZCR_EL2)
+	switch (sysreg) {
+	case SYS_ZCR_EL2:
+	case SYS_SMCR_EL2:
+		break;
+	default:
 		return false;
+	}
 
 	if (guest_owns_fp_regs())
 		return false;
 
 	/*
-	 * ZCR_EL2 traps are handled in the slow path, with the expectation
-	 * that the guest's FP context has already been loaded onto the CPU.
+	 * ZCR_EL2 and SMCR_EL2 traps are handled in the slow path,
+	 * with the expectation that the guest's FP context has
+	 * already been loaded onto the CPU.
 	 *
 	 * Load the guest's FP context and unconditionally forward to the
 	 * slow path for handling (i.e. return false).
@@ -493,7 +499,7 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (kvm_hyp_handle_cpacr_el1(vcpu, exit_code))
 		return true;
 
-	if (kvm_hyp_handle_zcr_el2(vcpu, exit_code))
+	if (kvm_hyp_handle_vec_cr_el2(vcpu, exit_code))
 		return true;
 
 	return kvm_hyp_handle_sysreg(vcpu, exit_code);
@@ -522,6 +528,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]		= NULL,
 	[ESR_ELx_EC_CP15_32]		= kvm_hyp_handle_cp15_32,
 	[ESR_ELx_EC_SYS64]		= kvm_hyp_handle_sysreg_vhe,
+	[ESR_ELx_EC_SME]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_SVE]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,

-- 
2.47.3


