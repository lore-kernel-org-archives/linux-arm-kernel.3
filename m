Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE5ECA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bc16xX9qD06gdsauctqvDBLJA5yBRH8bgqPpDJfsmqs=; b=AlsLHqrG0ONX/XUou38LgwQcdk
	7xYVo3P1X8OAWZsdhY5CKlexkgeQkpncH8MVbLYLVPBNFW6ab1W3YGHuCNvNiDuwjXnD59fbpiVti
	OLOYl/zPHP9YI2YH2FdpTePGYZzJeY7Icu8oFa8FCYv5xpopmDQGSiop9XT1d71bvRCYsmtA1xTs9
	kCYf4BbwhwXxb/pbf/leTXU+497GLh2bLeZU5WsdAMs9EouuDDFq9VomW4TpgumhncASHdyY4VSRU
	l10yQq66KA1cpGQbsa+IUfVpTBw8lhd5fHo9d6QOT+ZFVSQWDKVqAJaA3M3kPgwKXLvJMguSF6whh
	Ta6D4K1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRvh-00000000Ks1-3A8c;
	Tue, 02 Sep 2025 14:24:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPSm-0000000GzN5-29nr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 353B940601;
	Tue,  2 Sep 2025 11:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C12DC4CEED;
	Tue,  2 Sep 2025 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813572;
	bh=NTFrR4Ul2FjKNCZg2te+RhXOLPTLiTRbz6mCjfo2Vis=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LU/fN+g127OF0iEEH5mh9j4gTeSNuspKfz0iLbiV0e7pJj7Bjg6o4A504i1I6hSXc
	 Or3FyGb/wisfYdoq+OF/yxKWZmUEbdzJTAfU+PZR2lrsEWY0p+DOmPlugmJAazoJVc
	 NTipps/n2A9xgky2mxR/b8jsZ13ai6vSjJ4caGM9RUmu7eHPcPLWPhfaXXbhAFOi+1
	 3JyoUtkLUXrV8BOMJfjuI641GRCoOEQGmFtBhkEY7qPYEmce5eEZshZ7+/BnDN5jpV
	 hEP9j9cCdsKvRS3y6Fmz5rR1ZaKYIAQOinPhxkCisp0XdvQkMHUAqgdHz4aGK+agRa
	 ZJ1Fnr6doa2zw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:28 +0100
Subject: [PATCH v8 25/29] KVM: arm64: Handle SME exceptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-25-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=6175; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NTFrR4Ul2FjKNCZg2te+RhXOLPTLiTRbz6mCjfo2Vis=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBottiNqgPfkaWMCSeQ2d8u5PqsX4XybQjxBRtlB
 s0L51CavqyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYjQAKCRAk1otyXVSH
 0KJWB/43c6WsW+Bi69WMyiwE1PeIMs5+KboO9kaMDTUp1dRAzMKf6SZW+Nt/TgMvtyZaRzdXzqT
 r6xVWyojMTDtY1Wr8Nnc9l7PR7sQMVOGzs0lYu57GoMW4OnsQtxCLxtxu28NxdJhClfAbXHCYBp
 rQ2waBf+wppakR4Lq/FYARQiWMxPJbTu127zGR70Q8uR8W9vL4TIFYN3w7Lw+OFAQjF+OJf0FcX
 jHNTuyKtEXry/58P3RRVw7z8ySGfX3xkytQLxdJaI7VECxm/2G478BsP83fgBUv6CjlQT3WpOJT
 40mITMw3kI53loFSXuNaw9qi6Z0mezwN+1qKBkoJfYqyStvA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_044612_599387_3F3DEEC8 
X-CRM114-Status: GOOD (  18.13  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c            | 14 ++++++++++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 11 ++++++-----
 arch/arm64/kvm/hyp/nvhe/switch.c        |  4 +++-
 arch/arm64/kvm/hyp/vhe/switch.c         | 17 ++++++++++++-----
 4 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index a598072f36d2..d96f3a585d70 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -232,6 +232,19 @@ static int handle_sve(struct kvm_vcpu *vcpu)
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
@@ -385,6 +398,7 @@ static exit_handle_fn arm_exit_handlers[] = {
 	[ESR_ELx_EC_SVC64]	= handle_svc,
 	[ESR_ELx_EC_SYS64]	= kvm_handle_sys_reg,
 	[ESR_ELx_EC_SVE]	= handle_sve,
+	[ESR_ELx_EC_SME]	= handle_sme,
 	[ESR_ELx_EC_ERET]	= kvm_handle_eret,
 	[ESR_ELx_EC_IABT_LOW]	= kvm_handle_guest_abort,
 	[ESR_ELx_EC_DABT_LOW]	= kvm_handle_guest_abort,
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index c128b4d25a2d..9375afa96b71 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -69,11 +69,8 @@ static inline void __activate_cptr_traps_nvhe(struct kvm_vcpu *vcpu)
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
@@ -101,6 +98,8 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
 		val |= CPACR_EL1_FPEN;
 		if (vcpu_has_sve(vcpu))
 			val |= CPACR_EL1_ZEN;
+		if (vcpu_has_sme(vcpu))
+			val |= CPACR_EL1_SMEN;
 	}
 
 	if (!vcpu_has_nv(vcpu))
@@ -142,6 +141,8 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
 		val &= ~CPACR_EL1_FPEN;
 	if (!(SYS_FIELD_GET(CPACR_EL1, ZEN, cptr) & BIT(0)))
 		val &= ~CPACR_EL1_ZEN;
+	if (!(SYS_FIELD_GET(CPACR_EL1, SMEN, cptr) & BIT(0)))
+		val &= ~CPACR_EL1_SMEN;
 
 	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S2POE, IMP))
 		val |= cptr & CPACR_EL1_E0POE;
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index ccd575d5f6de..79a3e5c290f9 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -175,6 +175,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[ESR_ELx_EC_CP15_32]		= kvm_hyp_handle_cp15_32,
 	[ESR_ELx_EC_SYS64]		= kvm_hyp_handle_sysreg,
 	[ESR_ELx_EC_SVE]		= kvm_hyp_handle_fpsimd,
+	[ESR_ELx_EC_SME]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
 	[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
@@ -186,7 +187,8 @@ static const exit_handler_fn pvm_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]		= NULL,
 	[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
 	[ESR_ELx_EC_SVE]		= kvm_handle_pvm_restricted,
-	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
+	[ESR_ELx_EC_SME]		= kvm_handle_pvm_restricted,
+	[ESR_ELx_EC_FP_ASIMD]		= kvm_handle_pvm_restricted,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
 	[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
 	[ESR_ELx_EC_WATCHPT_LOW]	= kvm_hyp_handle_watchpt_low,
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index e482181c6632..86a892966a18 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -448,22 +448,28 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
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
@@ -483,7 +489,7 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (kvm_hyp_handle_cpacr_el1(vcpu, exit_code))
 		return true;
 
-	if (kvm_hyp_handle_zcr_el2(vcpu, exit_code))
+	if (kvm_hyp_handle_vec_cr_el2(vcpu, exit_code))
 		return true;
 
 	return kvm_hyp_handle_sysreg(vcpu, exit_code);
@@ -512,6 +518,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]		= NULL,
 	[ESR_ELx_EC_CP15_32]		= kvm_hyp_handle_cp15_32,
 	[ESR_ELx_EC_SYS64]		= kvm_hyp_handle_sysreg_vhe,
+	[ESR_ELx_EC_SME]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_SVE]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,

-- 
2.39.5


