Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDA6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoQNIQNSsLVgvMGsIt+4nchRolC09bX2N+MLeimiLmU=; b=uBkiJKl4IL4j9t4WIIHAyK5sxQ
	fitOUvCiq+2EoOIPTN3yclr0jIZwK/OayPtHmibzYYRCQo2zkBX0+WKq+VV+UvnutpbwyE9RQNpQb
	IS7QnqLHyclj3cVtyLwOGsAtAy9QF0jkKzJ+yPTncQaV3jyYNfkFxP2/aBCVsF4iMry1jvss25yWm
	MPsiNzuym04Xvf6yDiaNCkHM5mIJYGlnOA+EMQNTcW80ElfPBszYaORo7gJXLhy3aaMQq8/UWeGGU
	s7TV4tjjlNtbW33i7zYdUCWCVxTJgN/qCcIWuDZCxbdU3TfRrSvvxVmDlp0SYW83+eBBYOsbZibWi
	7c/E63aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilQ7-0000000DLUC-2Gfa;
	Fri, 14 Feb 2025 02:27:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til1p-0000000DFSE-1HHx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36C455C5D29;
	Fri, 14 Feb 2025 02:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131ABC4CEEB;
	Fri, 14 Feb 2025 02:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498524;
	bh=6ZKeFmUwpIKsEmKKV2CccS5FiLEKpUEnHjqvTyJuW8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OiPMHHkl1djeZ2lB8dMWaekSizYcbPZLeW5EMFvwXWfJxlVr9Ozru6+nq2Vt956Dd
	 eZAOBTEEzW5IlTH03xQjanj/hRWglpLoT5ibBAEkfYvQECt7mt5o/5rJzl24JBfjz6
	 LTuxf6R9llGGhYjv/pmMjhZABXqtDZvz6rwdRGQnSXkp+8eLae/tj4ztdPL95S4jOF
	 5HvR0NxLmqhOmwa2+tJ5fB5ordXobTHaxdqzwMHFYyBNUE2fMynmKUBeKImP1utZ3b
	 heUbWGv5x5gm8V/7NRr5xsJ6LkOWzhXNMcvmj6JhbjISVm3i2LE3lV0TDAwzCVefte
	 RJvsEqNAHETnw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:58:00 +0000
Subject: [PATCH v4 17/27] KVM: arm64: Support SME identification registers
 for guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-17-d64a681adcc2@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5505; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6ZKeFmUwpIKsEmKKV2CccS5FiLEKpUEnHjqvTyJuW8I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPN/4geYRKPPjBRvDXStddXp7T70d00Uznyao8d
 rOjSP3yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jzQAKCRAk1otyXVSH0EzoB/
 9/03HAOXhIxlxxSR+RKChEm5O/Z3N4fyOwjIKdkaCQn7Dzkg6V/2YspMfs/9IbbqAecMoM/9iEvRSN
 6U0yD5lZ/m6NenVl7xzYp/kRXl2LlEFrfuv8ijKIjqmX4ImidimNNSfRrE0bL6fYi7pxz7ILfJS1k5
 0S0nGl1EXojymVEjL7pEesXPDahAu0wVCaHqxf4x5SRXwqulPyfWVb4xHYDoTdN2/Xd0UU+CabDWsV
 7H/4tWHAKsDLS3gWz3s6e96TQ7n82t5M4uDDrdEsW99RPuQbN1a9TPYpwO6Mz5GeFTjKQeHlrIaKu/
 v1DLIaSlaYDoRJ73v+bzA7czGM9udK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180207_848108_BF1FEFF5 
X-CRM114-Status: GOOD (  20.06  )
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
space.  We do not support priority management and affinity is not
meaningful for guests so we mask out everything except for the
microarchitecture description.

As for MIDR_EL1 and REVIDR_EL1 we expose the implementer and revision
information to guests with the raw value from the CPU we are running on,
this may present issues for asymmetric systems or for migration as it
does for the existing registers.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/sys_regs.c         | 46 +++++++++++++++++++++++++++++++++++----
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c770ed6138164fcd3e11b8517ef4120b4f4486b9..14615216845668bf1a614e9fbdb6112190fec054 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -473,6 +473,7 @@ enum vcpu_sysreg {
 	/* FP/SIMD/SVE */
 	SVCR,
 	FPMR,
+	SMIDR_EL1,	/* Streaming Mode Identification Register */
 
 	/* 32bit specific registers. */
 	DACR32_EL2,	/* Domain Access Control Register */
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index eece67141480b8d4bbd2bac0f02f9208c7f86f8b..b515dfa1f27d0c744de996f6dcdff272aa184385 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -767,6 +767,38 @@ static u64 reset_mpidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 	return mpidr;
 }
 
+static u64 reset_smidr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
+{
+	u64 smidr = 0;
+
+	if (!system_supports_sme())
+		return smidr;
+
+	smidr = read_sysreg_s(SYS_SMIDR_EL1);
+
+	/*
+	 * Mask out everything except for the implementer and revison,
+	 * in particular priority management is not implemented.
+	 */
+	smidr &= SMIDR_EL1_IMPLEMENTER_MASK | SMIDR_EL1_REVISION_MASK;
+
+	vcpu_write_sys_reg(vcpu, smidr, SMIDR_EL1);
+
+	return smidr;
+}
+
+static bool access_smidr(struct kvm_vcpu *vcpu,
+			 struct sys_reg_params *p,
+			 const struct sys_reg_desc *r)
+{
+	if (p->is_write)
+		return write_to_read_only(vcpu, p, r);
+
+	p->regval = vcpu_read_sys_reg(vcpu, r->reg);
+
+	return true;
+}
+
 static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
 				   const struct sys_reg_desc *r)
 {
@@ -1593,7 +1625,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		if (!kvm_has_mte(vcpu->kvm))
 			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE);
 
-		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
+		if (!vcpu_has_sme(vcpu))
+			val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_SME);
+
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_RNDR_trap);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_NMI);
 		val &= ~ARM64_FEATURE_MASK(ID_AA64PFR1_EL1_MTE_frac);
@@ -1697,6 +1731,10 @@ static unsigned int id_visibility(const struct kvm_vcpu *vcpu,
 		if (!vcpu_has_sve(vcpu))
 			return REG_RAZ;
 		break;
+	case SYS_ID_AA64SMFR0_EL1:
+		if (!vcpu_has_sme(vcpu))
+			return REG_RAZ;
+		break;
 	}
 
 	return 0;
@@ -2637,7 +2675,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64PFR1_EL1_MTE_frac |
 				       ID_AA64PFR1_EL1_NMI |
 				       ID_AA64PFR1_EL1_RNDR_trap |
-				       ID_AA64PFR1_EL1_SME |
 				       ID_AA64PFR1_EL1_RES0 |
 				       ID_AA64PFR1_EL1_MPAM_frac |
 				       ID_AA64PFR1_EL1_RAS_frac |
@@ -2645,7 +2682,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_WRITABLE(ID_AA64PFR2_EL1, ID_AA64PFR2_EL1_FPMR),
 	ID_UNALLOCATED(4,3),
 	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
-	ID_HIDDEN(ID_AA64SMFR0_EL1),
+	ID_WRITABLE(ID_AA64SMFR0_EL1, ~ID_AA64SMFR0_EL1_RES0),
 	ID_UNALLOCATED(4,6),
 	ID_WRITABLE(ID_AA64FPFR0_EL1, ~ID_AA64FPFR0_EL1_RES0),
 
@@ -2845,7 +2882,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CLIDR_EL1), access_clidr, reset_clidr, CLIDR_EL1,
 	  .set_user = set_clidr, .val = ~CLIDR_EL1_RES0 },
 	{ SYS_DESC(SYS_CCSIDR2_EL1), undef_access },
-	{ SYS_DESC(SYS_SMIDR_EL1), undef_access },
+	{ SYS_DESC(SYS_SMIDR_EL1), .access = access_smidr, .reset = reset_smidr,
+	  .reg = SMIDR_EL1, .visibility = sme_visibility },
 	{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
 	ID_FILTERED(CTR_EL0, ctr_el0,
 		    CTR_EL0_DIC_MASK |

-- 
2.39.5


