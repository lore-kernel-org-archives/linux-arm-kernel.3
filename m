Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D832FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 07:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ak+IrmJ8X1Rm7EWVscODQdL/sFTQAdR45aaBM9kpbw=; b=tLtritQARzB3BDdsAbrRT8ZI03
	MEmpC2fuMDriGEVn/jbWFhBrlesnZe8pyFVMAPoitLUYCdWSX62A51yGW8AcJX4tEP26imj69UajC
	3BZ9BPJ1FwHcfJLClX6/cRPW/mQIhONUV2CvD3zsbkbcmtjr3+GgKXXV4xefE2+ajqn8c4KmGszbY
	h/9ED0rX3muoDN5yDQGXXm0jsGNYA48Aq2lRHo7BhFtPtthiw/MIE88hUTDERhZ1YJlCOEapW6ogw
	glUegcULc2u8c2oBUp/DNjlpgGGCkzoIXcLO3ZCqHfuX0sYUFwOL9H+IDu24bmB0KbIRVCawpSIYf
	+QTgj0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLtB-00000001mY8-1kR7;
	Fri, 22 Aug 2025 07:08:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH0C-00000001BkK-0Nnd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68EF8A58721;
	Fri, 22 Aug 2025 01:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC743C116B1;
	Fri, 22 Aug 2025 01:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827735;
	bh=IOvRUXTwez4vce4kM+TbWeJxICUO2t5XVZ3KjPI4DQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LkTr4XKzSXMDetbtF3VAbW2WQY9IeETcVprfxGalWVAbsO5aZi+TWpSb6MHvp+V20
	 5ETu6ZXMm9KdrwfWQXIsuB7uObYgw/hTi5zM0KAAb7h01n3YWg+7s2nBT+5K4X7ZQm
	 D0k5AXIP+xHYzuXZ+K3rydVeShuzw3PcTOL73YPJ0K4B3AKZ8Y+b4ObVdI7BuO9X3u
	 yiD5rrttGIbp7uJz7mqEHJhoB3er3srWwdw+poTgzuCczDDtBlsLS7jVOryH0s5B6c
	 F7NXYwtOJb8dx4gm8DPqkcadhubnVTBfALnEznAe3YsBqczCNVRvok6+VqVAUwg2L4
	 dGLSx3lsfAwjA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:47 +0100
Subject: [PATCH v7 18/29] KVM: arm64: Support SME identification registers
 for guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-18-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
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
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=8730; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IOvRUXTwez4vce4kM+TbWeJxICUO2t5XVZ3KjPI4DQM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop83GfeRhm6vELQacBT8HaenDNhdCViMFhS/0O
 xrz6Vm1TnqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNxgAKCRAk1otyXVSH
 0P/9B/94rs3QmdVFCbJZmIaRUyQuiw2t4Opl7ShKmrUq2jbrv7zGyVGMn4DP2gIjY90bynjPbii
 Yn2iBP8fu6WhVXqyMrDHXIX1MtQ+jtHvNAvrQtThmM99/mSDYhD5W+SVf1S56d4XTiqehhQ2+3m
 u3NlSXjPDAzDfVXAKztR/4+6rHXHNYl29yMv4W+/i18p5iwB7XQ9KB1QDUPjcVji1IUhU8dBSt3
 8F1w3h1o5pkjV3jgnEtI3LZIkd9jFmD8XiCFS74H5O3qBdjqxGhmgUDfOJFxu/QbZgsm22Yozre
 4OO74092Hm+vCYF2YaBXUd7kargwdjZZA/c3GoYySU+tb2on
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185536_276825_C9C9582B 
X-CRM114-Status: GOOD (  25.79  )
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

The primary register for identifying SME is ID_AA64PFR1_EL1.SME.  This
is hidden from guests unless SME is enabled by the VMM.
When it is visible it is writable and can be used to control the
availability of SME2.

There is also a new register ID_AA64SMFR0_EL1 which we make writable,
forcing it to all bits 0 if SME is disabled.  This includes the field
SMEver giving the SME version, userspace is responsible for ensuring
the value is consistent with ID_AA64PFR1_EL1.SME.  It also includes
FA64, a separately enableable extension which provides the full FPSIMD
and SVE instruction set including FFR in streaming mode.  Userspace can
control the availability of FA64 by writing to this field.  The other
features enumerated there only add new instructions, there are no
architectural controls for these.

There is a further identification register SMIDR_EL1 which provides a
basic description of the SME microarchitecture, in a manner similar to
MIDR_EL1 for the PE.  It also describes support for priority management
and a basic affinity description for shared SME units, plus some RES0
space.  We do not support priority management for guests so this is
hidden from guests, along with any new fields.

As for MIDR_EL1 and REVIDR_EL1 we expose the implementer and revision
information to guests with the raw value from the CPU we are running on,
this may present issues for asymmetric systems or for migration as it
does for the existing registers.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h          |  3 +++
 arch/arm64/kvm/config.c                    |  8 +------
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 11 +++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c             |  4 +++-
 arch/arm64/kvm/sys_regs.c                  | 37 ++++++++++++++++++++++++++----
 5 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 632c74397fa9..5225dd9b752c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -402,6 +402,7 @@ struct kvm_arch {
 	u64 revidr_el1;
 	u64 aidr_el1;
 	u64 ctr_el0;
+	u64 smidr_el1;
 
 	/* Masks for VNCR-backed and general EL2 sysregs */
 	struct kvm_sysreg_masks	*sysreg_masks;
@@ -1646,6 +1647,8 @@ static inline u64 *__vm_id_reg(struct kvm_arch *ka, u32 reg)
 		return &ka->revidr_el1;
 	case SYS_AIDR_EL1:
 		return &ka->aidr_el1;
+	case SYS_SMIDR_EL1:
+		return &ka->smidr_el1;
 	default:
 		WARN_ON_ONCE(1);
 		return NULL;
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index da66c4a14775..a08e89e210d8 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -208,14 +208,8 @@ static bool feat_anerr(struct kvm *kvm)
 
 static bool feat_sme_smps(struct kvm *kvm)
 {
-	/*
-	 * Revists this if KVM ever supports SME -- this really should
-	 * look at the guest's view of SMIDR_EL1. Funnily enough, this
-	 * is not captured in the JSON file, but only as a note in the
-	 * ARM ARM.
-	 */
 	return (kvm_has_feat(kvm, FEAT_SME) &&
-		(read_sysreg_s(SYS_SMIDR_EL1) & SMIDR_EL1_SMPS));
+		(kvm_read_vm_id_reg(kvm, SYS_SMIDR_EL1) & SMIDR_EL1_SMPS));
 }
 
 static bool feat_spe_fds(struct kvm *kvm)
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 8c3b3d6df99f..d921db152119 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -125,6 +125,17 @@ static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
 	return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
 }
 
+static inline u64 ctxt_smidr_el1(struct kvm_cpu_context *ctxt)
+{
+	struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
+
+	if (!(ctxt_is_guest(ctxt) &&
+	      test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
+		return read_sysreg_s(SYS_SMIDR_EL1);
+
+	return kvm_read_vm_id_reg(kvm, SYS_SMIDR_EL1);
+}
+
 static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
 {
 	*ctxt_mdscr_el1(ctxt)	= read_sysreg(mdscr_el1);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 65c49a5c7091..fc9fb2e693f6 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -338,8 +338,10 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 			    host_kvm->arch.vcpu_features,
 			    KVM_VCPU_MAX_FEATURES);
 
-		if (test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &host_arch_flags))
+		if (test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &host_arch_flags)) {
 			hyp_vm->kvm.arch.midr_el1 = host_kvm->arch.midr_el1;
+			hyp_vm->kvm.arch.smidr_el1 = host_kvm->arch.smidr_el1;
+		}
 
 		return;
 	}
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 4166d396450d..36ba1986e7a1 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1612,7 +1612,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac);
 		}
 
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
+		if (!vcpu_has_sme(vcpu))
+			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
+
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_GCS);
@@ -1731,6 +1733,10 @@ static unsigned int id_visibility(const struct kvm_vcpu *vcpu,
 		if (!vcpu_has_sve(vcpu))
 			return REG_RAZ;
 		break;
+	case SYS_ID_AA64SMFR0_EL1:
+		if (!vcpu_has_sme(vcpu))
+			return REG_RAZ;
+		break;
 	}
 
 	return 0;
@@ -1758,10 +1764,25 @@ static unsigned int raz_visibility(const struct kvm_vcpu *vcpu,
 
 /* cpufeature ID register access trap handlers */
 
+static bool hidden_id_reg(struct kvm_vcpu *vcpu,
+			  struct sys_reg_params *p,
+			  const struct sys_reg_desc *r)
+{
+	switch (reg_to_encoding(r)) {
+	case SYS_SMIDR_EL1:
+		return !vcpu_has_sme(vcpu);
+	default:
+		return false;
+	}
+}
+
 static bool access_id_reg(struct kvm_vcpu *vcpu,
 			  struct sys_reg_params *p,
 			  const struct sys_reg_desc *r)
 {
+	if (hidden_id_reg(vcpu, p, r))
+		return bad_trap(vcpu, p, r, "write to hidden ID register");
+
 	if (p->is_write)
 		return write_to_read_only(vcpu, p, r);
 
@@ -2789,12 +2810,15 @@ static bool access_imp_id_reg(struct kvm_vcpu *vcpu,
 static u64 __ro_after_init boot_cpu_midr_val;
 static u64 __ro_after_init boot_cpu_revidr_val;
 static u64 __ro_after_init boot_cpu_aidr_val;
+static u64 __ro_after_init boot_cpu_smidr_val;
 
 static void init_imp_id_regs(void)
 {
 	boot_cpu_midr_val = read_sysreg(midr_el1);
 	boot_cpu_revidr_val = read_sysreg(revidr_el1);
 	boot_cpu_aidr_val = read_sysreg(aidr_el1);
+	if (system_supports_sme())
+		boot_cpu_smidr_val = read_sysreg_s(SYS_SMIDR_EL1);
 }
 
 static u64 reset_imp_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
@@ -2806,6 +2830,8 @@ static u64 reset_imp_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 		return boot_cpu_revidr_val;
 	case SYS_AIDR_EL1:
 		return boot_cpu_aidr_val;
+	case SYS_SMIDR_EL1:
+		return boot_cpu_smidr_val;
 	default:
 		KVM_BUG_ON(1, vcpu->kvm);
 		return 0;
@@ -2972,7 +2998,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64PFR1_EL1_MTE_frac |
 				       ID_AA64PFR1_EL1_NMI |
 				       ID_AA64PFR1_EL1_RNDR_trap |
-				       ID_AA64PFR1_EL1_SME |
 				       ID_AA64PFR1_EL1_RES0 |
 				       ID_AA64PFR1_EL1_MPAM_frac |
 				       ID_AA64PFR1_EL1_RAS_frac |
@@ -2983,7 +3008,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 		    ID_AA64PFR2_EL1_MTESTOREONLY),
 	ID_UNALLOCATED(4,3),
 	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
-	ID_HIDDEN(ID_AA64SMFR0_EL1),
+	ID_WRITABLE(ID_AA64SMFR0_EL1, ~ID_AA64SMFR0_EL1_RES0),
 	ID_UNALLOCATED(4,6),
 	ID_WRITABLE(ID_AA64FPFR0_EL1, ~ID_AA64FPFR0_EL1_RES0),
 
@@ -3185,7 +3210,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
 	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
-	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
+	IMPLEMENTATION_ID(SMIDR_EL1, (SMIDR_EL1_NSMC | SMIDR_EL1_HIP |
+				      SMIDR_EL1_AFFINITY2 |
+				      SMIDR_EL1_IMPLEMENTER |
+				      SMIDR_EL1_REVISION | SMIDR_EL1_SH |
+				      SMIDR_EL1_AFFINITY)),
 	IMPLEMENTATION_ID(AIDR_EL1, GENMASK_ULL(63, 0)),
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	ID_FILTERED(CTR_EL0, ctr_el0,

-- 
2.39.5


