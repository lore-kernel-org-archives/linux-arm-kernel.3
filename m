Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFDAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1zy4AKaHiqNQMXG5h+LXU01eSdMuOzbdR0P6vsnTdA=; b=QmV67cUeNhZTIFtKEKlyp0nro2
	j+vAqDKQcVVr8CSrtimttSYanmjfxPKEvCp//DKH/QrHUEowOQDmbLN7yIentrDzpIQdepJJcIpz9
	zrifojD3sG8dFSBkzIT/w6QJX8vpJ/tMcOiC3fLZ/KzAx7dW7eSi2QKXhvlaX6Q+2gXcwMvwhnP82
	J6dtXwV7gxjAGlDf9QlRYersGPnyPYoDESZHtBHW7eGgRZhD6JPnXzf287XMGnpHV0z+PLN7qmTu7
	Js8LJ+Jwn49IR525HjuWn0a/1qt9D6pv7sA1oIAFqb0YoI1Wpff3IY1zuRsu6Hkqtvv+QGXg+P6Ic
	kT/PUBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd1Q-00000000hQM-2BWJ;
	Thu, 09 Jul 2026 00:53:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd1L-00000000hKm-3mF2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56BD66132C;
	Thu,  9 Jul 2026 00:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0FB1F000E9;
	Thu,  9 Jul 2026 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558423;
	bh=J1zy4AKaHiqNQMXG5h+LXU01eSdMuOzbdR0P6vsnTdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IZPAcR9h5GwnCY2k3YiWta7Kt6aaCbS0EYsQqmE6G6zKXy9dNCTR0/Jw/O36vi3Lm
	 PtKC2Hjt9nfYIL3Axeln/FHxtGAwKjxDIfQddNSinzPUvLlR7OsK5FfC+JOlLKYrOe
	 oltJypCxYDzRT1aJFLf5tIDP+rNsL4MPDkMjgO2wGsTHhEJi5gMbfBMPTF/BSo/o6O
	 cX2mDlqFzkLW2z8MezhBEGRM4eOgLL5sT7aBVVhqK8/m5AO4snctGWKLh+DWHJRDjb
	 kjqjlZaEeEu6LVD4VQjSrCN0GAEUl/e2ZU1uy1jYRo1U0lwEm7VcoRLdnaTns+eKqT
	 JNcSNAI4cihhQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:52 +0100
Subject: [PATCH v11 15/29] KVM: arm64: Support SME control registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-15-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7447; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H+o/3748vgny3lGilz48bxpWfmNuNNC3E7l3zKXni58=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvDFXTcw2+7dxFOBIs/YvW8WSYfzGKTHgtYoK
 K2yfHEsSiGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wxQAKCRAk1otyXVSH
 0LkPB/9xvJ4dtAgQjUxilGoJT1G/eezBd2HgCM6ccpceaK+WJRbLsV31sEaob9jh3Kqxef10iR9
 6zGJe5mmxW75Z0Sf1uRKW79wI6A5XWqeLXot5EkgBpCQn6QuxEvBWC44w2oStEQ55nQoYluBJS9
 X8LKRKDuQezIA4la7Lg9hP6CBEckrQIMguAuUa4WhLB6ehwqnXfBiqr0Cj7SUTs2FTa4Ao1qceY
 b1Wc7IzCAQiPNSATqX+Vq7hJxbJOoH6cK+Vu5aA4NZG9qg6o3dbHmPssxdsvuunJdcVydHox+9j
 7+wgDH5Zk3NLdccLtox7DWbkfjhqxKWD8N8bMo+UmT1A989J
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

SME is configured by the system registers SMCR_EL1 and SMCR_EL2, add
definitions and userspace access for them.  These control the SME vector
length in a manner similar to that for SVE and also have feature enable
bits for SME2 and FA64.  A subsequent patch will add management of them
for guests as part of the general floating point context switch, as is
done for the equivalent SVE registers.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h  | 15 +++++++++++++++
 arch/arm64/include/asm/kvm_host.h     |  2 ++
 arch/arm64/include/asm/vncr_mapping.h |  1 +
 arch/arm64/kvm/nested.c               |  5 +++++
 arch/arm64/kvm/sys_regs.c             | 31 ++++++++++++++++++++++++++++++-
 5 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 994afbf479fc..b5dc8a4c320a 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -90,6 +90,15 @@ static inline void kvm_inject_nested_sve_trap(struct kvm_vcpu *vcpu)
 	kvm_inject_nested_sync(vcpu, esr);
 }
 
+static inline void kvm_inject_nested_sme_trap(struct kvm_vcpu *vcpu,
+					      u64 smtc)
+{
+	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SME) |
+		  ESR_ELx_IL | smtc;
+
+	kvm_inject_nested_sync(vcpu, esr);
+}
+
 #if defined(__KVM_VHE_HYPERVISOR__) || defined(__KVM_NVHE_HYPERVISOR__)
 static __always_inline bool vcpu_el1_is_32bit(struct kvm_vcpu *vcpu)
 {
@@ -689,4 +698,10 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
 	}
 }
+
+static inline bool guest_hyp_sme_traps_enabled(const struct kvm_vcpu *vcpu)
+{
+	return __guest_hyp_cptr_xen_trap_enabled(vcpu, SMEN);
+}
+
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 858341eb1e8f..796b6e3a50f7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -546,6 +546,7 @@ enum vcpu_sysreg {
 	MDCR_EL2,	/* Monitor Debug Configuration Register (EL2) */
 	CNTHCTL_EL2,	/* Counter-timer Hypervisor Control register */
 	ZCR_EL2,	/* SVE Control Register (EL2) */
+	SMCR_EL2,	/* SME Control Register (EL2) */
 
 	/* Any VNCR-capable reg goes after this point */
 	MARKER(__VNCR_START__),
@@ -554,6 +555,7 @@ enum vcpu_sysreg {
 	VNCR(ACTLR_EL1),/* Auxiliary Control Register */
 	VNCR(CPACR_EL1),/* Coprocessor Access Control */
 	VNCR(ZCR_EL1),	/* SVE Control */
+	VNCR(SMCR_EL1),	/* SME Control */
 	VNCR(TTBR0_EL1),/* Translation Table Base Register 0 */
 	VNCR(TTBR1_EL1),/* Translation Table Base Register 1 */
 	VNCR(TCR_EL1),	/* Translation Control Register */
diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index 14366d35ce82..c3bf92ac52d4 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -44,6 +44,7 @@
 #define VNCR_HDFGWTR_EL2	0x1D8
 #define VNCR_ZCR_EL1            0x1E0
 #define VNCR_HAFGRTR_EL2	0x1E8
+#define VNCR_SMCR_EL1		0x1F0
 #define VNCR_TTBR0_EL1          0x200
 #define VNCR_TTBR1_EL1          0x210
 #define VNCR_FAR_EL1            0x220
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index fb54f6dad995..50e25ab9b604 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1920,6 +1920,11 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	resx.res1 = ZCR_ELx_RES1;
 	set_sysreg_masks(kvm, ZCR_EL2, resx);
 
+	/* SMCR_EL2 - bits 8:4 are RAZ/WI so treat them as RES0 */
+	resx.res0 = SMCR_ELx_RES0 | GENMASK_ULL(8, 4);
+	resx.res1 = SMCR_ELx_RES1;
+	set_sysreg_masks(kvm, SMCR_EL2, resx);
+
 out:
 	for (enum vcpu_sysreg sr = __SANITISED_REG_START__; sr < NR_SYS_REGS; sr++)
 		__vcpu_rmw_sys_reg(vcpu, sr, |=, 0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ba8a3ed8f5ff..24bbe30c075a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -121,6 +121,7 @@ static enum sr_loc_attr locate_direct_register(const struct kvm_vcpu *vcpu,
 	case ELR_EL1:
 	case SPSR_EL1:
 	case ZCR_EL1:
+	case SMCR_EL1:
 	case SCTLR2_EL1:
 		/*
 		 * EL1 registers which have an ELx2 mapping are loaded if
@@ -241,6 +242,7 @@ static u64 read_sr_from_cpu(enum vcpu_sysreg reg)
 	case ELR_EL1:		val = read_sysreg_s(SYS_ELR_EL12);	break;
 	case SPSR_EL1:		val = read_sysreg_s(SYS_SPSR_EL12);	break;
 	case ZCR_EL1:		val = read_sysreg_s(SYS_ZCR_EL12);	break;
+	case SMCR_EL1:		val = read_sysreg_s(SYS_SMCR_EL12);	break;
 	case SCTLR2_EL1:	val = read_sysreg_s(SYS_SCTLR2_EL12);	break;
 	case TPIDR_EL0:		val = read_sysreg_s(SYS_TPIDR_EL0);	break;
 	case TPIDRRO_EL0:	val = read_sysreg_s(SYS_TPIDRRO_EL0);	break;
@@ -279,6 +281,7 @@ static void write_sr_to_cpu(enum vcpu_sysreg reg, u64 val)
 	case ELR_EL1:		write_sysreg_s(val, SYS_ELR_EL12);	break;
 	case SPSR_EL1:		write_sysreg_s(val, SYS_SPSR_EL12);	break;
 	case ZCR_EL1:		write_sysreg_s(val, SYS_ZCR_EL12);	break;
+	case SMCR_EL1:		write_sysreg_s(val, SYS_SMCR_EL12);	break;
 	case SCTLR2_EL1:	write_sysreg_s(val, SYS_SCTLR2_EL12);	break;
 	case TPIDR_EL0:		write_sysreg_s(val, SYS_TPIDR_EL0);	break;
 	case TPIDRRO_EL0:	write_sysreg_s(val, SYS_TPIDRRO_EL0);	break;
@@ -2830,6 +2833,12 @@ static unsigned int sve_el2_visibility(const struct kvm_vcpu *vcpu,
 	return __el2_visibility(vcpu, rd, sve_visibility);
 }
 
+static unsigned int sme_el2_visibility(const struct kvm_vcpu *vcpu,
+				       const struct sys_reg_desc *rd)
+{
+	return __el2_visibility(vcpu, rd, sme_visibility);
+}
+
 static unsigned int vncr_el2_visibility(const struct kvm_vcpu *vcpu,
 					const struct sys_reg_desc *rd)
 {
@@ -2872,6 +2881,23 @@ static bool access_zcr_el2(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool access_smcr_el2(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	if (guest_hyp_sme_traps_enabled(vcpu)) {
+		kvm_inject_nested_sme_trap(vcpu, ESR_ELx_SME_ISS_SMTC_SME_DISABLED);
+		return false;
+	}
+
+	if (!p->is_write)
+		p->regval = __vcpu_sys_reg(vcpu, SMCR_EL2);
+	else
+		__vcpu_assign_sys_reg(vcpu, SMCR_EL2, p->regval);
+
+	return true;
+}
+
 static bool access_gic_vtr(struct kvm_vcpu *vcpu,
 			   struct sys_reg_params *p,
 			   const struct sys_reg_desc *r)
@@ -3386,7 +3412,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
 	{ SYS_DESC(SYS_TRFCR_EL1), undef_access },
 	{ SYS_DESC(SYS_SMPRI_EL1), undef_access },
-	{ SYS_DESC(SYS_SMCR_EL1), undef_access },
+	{ SYS_DESC(SYS_SMCR_EL1), NULL, reset_val, SMCR_EL1, 0, .visibility = sme_visibility },
 	{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
 	{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
 	{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
@@ -3754,6 +3780,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
 
+	EL2_REG_FILTERED(SMCR_EL2, access_smcr_el2, reset_val, 0,
+			 sme_el2_visibility),
+
 	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
 	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
 	EL2_REG(TCR_EL2, access_rw, reset_val, TCR_EL2_RES1),

-- 
2.47.3


