Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B383C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z03ZijXmrDDuHL0sNJK8JVsVU9cXcCQDfJrfa2JVdP0=; b=gY7u5lkuCj+8RIJQu6cjobqvB4
	sEo2pms/VVBABgicMuyNXjVGWE7d+vcGKOmUtHcN6bxTca3z3doKJP+vZB4LVjL0ki/f+nzZ43Qr2
	4+iw9UihTMG/zNpjDmIc39LBtnxCgjn/Ztf68o5GEX2+Uc406evm1pUjuKpcesVh/kmhjZEIxS7zV
	G+iR0DvRk/H2Pj6ORkdExu88PHhmGd09p4EaYg9Qdz5pCnLXR84CrZiBZNYv+5QUQI2iOJgmMqCNE
	+zobu8bpSKysU8YE2begy5KTd6ijVx3VpoiE53Mkf7Qx7Dxfoh0Utl/aTH9ckk20LGzlk4tzhTJav
	Tq0PL+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilYX-0000000DMiL-2Mda;
	Fri, 14 Feb 2025 02:35:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til2B-0000000DFdT-3Ojw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:02:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D470E5C0654;
	Fri, 14 Feb 2025 02:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBF1C4CEEF;
	Fri, 14 Feb 2025 02:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498547;
	bh=nqYjBb6f0F7ndi21l9+vc1B1CfMbKXQsnrY9kauVFRE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lLHp4LjOqCUtf6L7oV7QbU1gZf1DNpCoUPxZjOIapuAYIuHU663js3YloJVtYjbZf
	 97Ggwfsebh3nzzDfhJ7Z6P7nieWYBPNpD0bFXFvOzOCCm0TClJ9gW+5N2pdUqylMma
	 HUKQNicdN85tgu2HhrZgnXWWsMQnj6q1ln4A9P4xDw6KprXbUtmzZgukbtLyJgEeeX
	 kJ41YcoudnxBMLpQlBea0/zCdDT90nojjADbObH6q2HqZX52Pm5BObgZnKoLLV7dw6
	 lqWxuyKc2Ps3oVX6RM8vETnsB+rii2HzBmmTL2vJ97zf6oPSe3xe/6Qf9ho6hTR9Tr
	 IC8wIW9LLJRng==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:58:06 +0000
Subject: [PATCH v4 23/27] KVM: arm64: Handle SME exceptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-23-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=6490; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nqYjBb6f0F7ndi21l9+vc1B1CfMbKXQsnrY9kauVFRE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPS+bT/31ABzQeA6aimPKYsZeU8ztn8c7lwhppv
 Kgww86WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66j0gAKCRAk1otyXVSH0KtoB/
 9pwQzgkosbOPi2N66QXkMJi2imbqozvBuXpsKvfWYXE6SowpEZtsfKrI9s8PZUvLJgA6U49pDLsf0a
 4dJtHdFYpk6v4DKXu/pQbxK8NYHDmJJgzxIVDn4ocb7wzxihUNJxmVoKnJ3Q+Y3Yq0OVAmkRU9yDiH
 +QWnfVmmzJNgd4k9ruMGQdolYG4CUp6PnOlfu0kXy3VLRGeSZ5kfMslQvdwWZOIq2RqDvXnswomCkO
 S3aFE7ZT7k6cx3nWXKxEzb1iTjTs7Jk+75FMoJPbf4XTVt/FlQcZ7zYLoCAdvQRHoo7q3NE4UVQWMs
 EK0W8humU1PpQ1CxjX41yJlkt94TQP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180227_945972_BF5FB9A9 
X-CRM114-Status: GOOD (  17.74  )
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

When the hardware is in streaming mode guest operations that are invalid in
in streaming mode will generate SME exceptions. Since these exceptions may
be routed to EL1 with no opportunity for the hypervisor to intercept them
we already have code which ensures that we exit streaming mode before
running the guest. This ensures that guests do not receive unexpected
SME exceptions.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/handle_exit.c     | 14 ++++++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c | 11 ++++++-----
 arch/arm64/kvm/hyp/vhe/switch.c  | 21 ++++++++++++++++-----
 3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 512d152233ff20eb6c65abbf731b4bcb543a7d07..036e722a8f3ce03f0bd756a84a6fbffeae9bf359 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -227,6 +227,19 @@ static int handle_sve(struct kvm_vcpu *vcpu)
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
@@ -310,6 +323,7 @@ static exit_handle_fn arm_exit_handlers[] = {
 	[ESR_ELx_EC_SVC64]	= handle_svc,
 	[ESR_ELx_EC_SYS64]	= kvm_handle_sys_reg,
 	[ESR_ELx_EC_SVE]	= handle_sve,
+	[ESR_ELx_EC_SME]	= handle_sme,
 	[ESR_ELx_EC_ERET]	= kvm_handle_eret,
 	[ESR_ELx_EC_IABT_LOW]	= kvm_handle_guest_abort,
 	[ESR_ELx_EC_DABT_LOW]	= kvm_handle_guest_abort,
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index eaeda9c8a1aa62f8f7eed36dbedc74513a453e4e..1f1883bc6f0cc270dd1ad38f96b9a0048e238e72 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -49,17 +49,16 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 			val |= CPACR_EL1_FPEN;
 			if (vcpu_has_sve(vcpu))
 				val |= CPACR_EL1_ZEN;
+			if (vcpu_has_sme(vcpu))
+				val |= CPACR_EL1_SMEN;
 		}
 
 		write_sysreg(val, cpacr_el1);
 	} else {
 		val |= CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
 
-		/*
-		 * Always trap SME since it's not supported in KVM.
-		 * TSM is RES1 if SME isn't implemented.
-		 */
-		val |= CPTR_EL2_TSM;
+		if (!vcpu_has_sme(vcpu) || !guest_owns_fp_regs())
+			val |= CPTR_EL2_TSM;
 
 		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
 			val |= CPTR_EL2_TZ;
@@ -222,6 +221,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[ESR_ELx_EC_CP15_32]		= kvm_hyp_handle_cp15_32,
 	[ESR_ELx_EC_SYS64]		= kvm_hyp_handle_sysreg,
 	[ESR_ELx_EC_SVE]		= kvm_hyp_handle_fpsimd,
+	[ESR_ELx_EC_SME]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
 	[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
@@ -233,6 +233,7 @@ static const exit_handler_fn pvm_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]		= NULL,
 	[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
 	[ESR_ELx_EC_SVE]		= kvm_handle_pvm_restricted,
+	[ESR_ELx_EC_SME]		= kvm_handle_pvm_restricted,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
 	[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 647737d6e8d0b5f41b2a8d25a06265e4703126b3..44e3f0577ceea2a1574038c97fd769fef30d7098 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -83,6 +83,8 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 		val |= CPACR_EL1_FPEN;
 		if (vcpu_has_sve(vcpu))
 			val |= CPACR_EL1_ZEN;
+		if (vcpu_has_sme(vcpu))
+			val |= CPACR_EL1_SMEN;
 	} else {
 		__activate_traps_fpsimd32(vcpu);
 	}
@@ -126,6 +128,8 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 		val &= ~CPACR_EL1_FPEN;
 	if (!(SYS_FIELD_GET(CPACR_EL1, ZEN, cptr) & BIT(0)))
 		val &= ~CPACR_EL1_ZEN;
+	if (!(SYS_FIELD_GET(CPACR_EL1, SMEN, cptr) & BIT(0)))
+		val &= ~CPACR_EL1_SMEN;
 
 	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S2POE, IMP))
 		val |= cptr & CPACR_EL1_E0POE;
@@ -486,22 +490,28 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
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
@@ -521,7 +531,7 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (kvm_hyp_handle_cpacr_el1(vcpu, exit_code))
 		return true;
 
-	if (kvm_hyp_handle_zcr_el2(vcpu, exit_code))
+	if (kvm_hyp_handle_vec_cr_el2(vcpu, exit_code))
 		return true;
 
 	return kvm_hyp_handle_sysreg(vcpu, exit_code);
@@ -531,6 +541,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]		= NULL,
 	[ESR_ELx_EC_CP15_32]		= kvm_hyp_handle_cp15_32,
 	[ESR_ELx_EC_SYS64]		= kvm_hyp_handle_sysreg_vhe,
+	[ESR_ELx_EC_SME]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_SVE]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,

-- 
2.39.5


