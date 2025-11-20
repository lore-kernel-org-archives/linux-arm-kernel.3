Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58371CF9C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPAU3mWQGOez+nbqtq8gaSLhM/p6p1zwNwUxOVqCqB8=; b=Xbxa9hetZ1Sl5Qqfox7gZIYGIr
	PCt9ELEWW6i0Y0XGFmjL+Xk3dA01zSPvrIg4GGk+/RkXrKt9icAsAFMeMt0pU8WV1/5ir5J8GtxQD
	MxPhKDR7AeBtWv6d2+gPymMOWCfryL8KaSKba5jkPZCEapj0DwfXNS31R9ua7Wwaks96/kVy5PF96
	t28/K7GMCiG23uMQejJyS3XmtSLqRkkRaiDHNbCMMyFF4FCC7sSI/sJIsGoXWO53H5PuBoWA+LP+7
	PDm/Z2HOdcrWjHjlws0Nxq4+bchT8wn5N9oRTi8FDTm+mN1d80CSirjQ+q27jrmXK7I2Ao9h3JsTi
	bWTaZ6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q8-000000075mt-3vZ3;
	Thu, 20 Nov 2025 17:26:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pt-000000075Z3-2b5r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00017443E4;
	Thu, 20 Nov 2025 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AD9C19421;
	Thu, 20 Nov 2025 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659556;
	bh=ORVv4OIeN5y03KqFeUVwlFsCJBbZQlX1+NJbq4SJ0ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=myeV0kP7CUTRtAq2bLvv/JmtEEvO60sU+GrgC1POQCUVahWLVATI5KDpeNqyS6Bc+
	 AduJDfb4R4lrQMuhu6x7klPpBEr55bs/eeHI/rdv7IcOGFqiTxaJfXQGDeOU0b9dSS
	 3rKofJ3T6/Bbieg7jaA9ShplViQJXbZNdBDG2X9QqYVlrHLZlrKdysmHyd6+8ZqUtr
	 FXB4AiHIOSH5HY1bLbM2nXsDGAIkES9HlNf78emYN8vwtEYpBc8Og4bYS+yF2iaGmM
	 2yvjh0YsHmLLOcmZM8YFbMYpCKUYks/+6ej/MeJmbDTFuEV5Rn8ivTFTiWK9lTGVV4
	 IRiVEQE3xnqtg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pq-00000006y6g-318C;
	Thu, 20 Nov 2025 17:25:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 04/49] KVM: arm64: Turn vgic-v3 errata traps into a patched-in constant
Date: Thu, 20 Nov 2025 17:24:54 +0000
Message-ID: <20251120172540.2267180-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092557_715848_6DDB397D 
X-CRM114-Status: GOOD (  22.42  )
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

The trap bits are currently only set to manage CPU errata. However,
we are about to make use of them for purposes beyond beating broken
CPUs into submission.

For this purpose, turn these errata-driven bits into a patched-in
constant that is merged with the KVM-driven value at the point of
programming the ICH_HCR_EL2 register, rather than being directly
stored with with the shadow value..

This allows the KVM code to distinguish between a trap being handled
for the purpose of an erratum workaround, or for KVM's own need.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/image-vars.h       |  1 +
 arch/arm64/kvm/hyp/vgic-v3-sr.c      | 21 ++++---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 12 +---
 arch/arm64/kvm/vgic/vgic-v3.c        | 83 +++++++++++++++++-----------
 arch/arm64/kvm/vgic/vgic.h           | 16 ++++++
 5 files changed, 84 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 5369763606e71..85bc629270bd9 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -91,6 +91,7 @@ KVM_NVHE_ALIAS(spectre_bhb_patch_loop_mitigation_enable);
 KVM_NVHE_ALIAS(spectre_bhb_patch_wa3);
 KVM_NVHE_ALIAS(spectre_bhb_patch_clearbhb);
 KVM_NVHE_ALIAS(alt_cb_patch_nops);
+KVM_NVHE_ALIAS(kvm_compute_ich_hcr_trap_bits);
 
 /* Global kernel state accessed by nVHE hyp code. */
 KVM_NVHE_ALIAS(kvm_vgic_global_state);
diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index acd909b7f2257..e72d436dd6a36 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -14,6 +14,8 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
+#include "../../vgic/vgic.h"
+
 #define vtr_to_max_lr_idx(v)		((v) & 0xf)
 #define vtr_to_nr_pre_bits(v)		((((u32)(v) >> 26) & 7) + 1)
 #define vtr_to_nr_apr_regs(v)		(1 << (vtr_to_nr_pre_bits(v) - 5))
@@ -196,6 +198,11 @@ static u32 __vgic_v3_read_ap1rn(int n)
 	return val;
 }
 
+static u64 compute_ich_hcr(struct vgic_v3_cpu_if *cpu_if)
+{
+	return cpu_if->vgic_hcr | vgic_ich_hcr_trap_bits();
+}
+
 void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 {
 	u64 used_lrs = cpu_if->used_lrs;
@@ -218,7 +225,7 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 
 		elrsr = read_gicreg(ICH_ELRSR_EL2);
 
-		write_gicreg(cpu_if->vgic_hcr & ~ICH_HCR_EL2_En, ICH_HCR_EL2);
+		write_gicreg(0, ICH_HCR_EL2);
 
 		for (i = 0; i < used_lrs; i++) {
 			if (elrsr & (1 << i))
@@ -237,7 +244,7 @@ void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
 	int i;
 
 	if (used_lrs || cpu_if->its_vpe.its_vm) {
-		write_gicreg(cpu_if->vgic_hcr, ICH_HCR_EL2);
+		write_gicreg(compute_ich_hcr(cpu_if), ICH_HCR_EL2);
 
 		for (i = 0; i < used_lrs; i++)
 			__gic_v3_set_lr(cpu_if->vgic_lr[i], i);
@@ -307,14 +314,14 @@ void __vgic_v3_activate_traps(struct vgic_v3_cpu_if *cpu_if)
 	}
 
 	/*
-	 * If we need to trap system registers, we must write
-	 * ICH_HCR_EL2 anyway, even if no interrupts are being
-	 * injected. Note that this also applies if we don't expect
-	 * any system register access (no vgic at all).
+	 * If we need to trap system registers, we must write ICH_HCR_EL2
+	 * anyway, even if no interrupts are being injected. Note that this
+	 * also applies if we don't expect any system register access (no
+	 * vgic at all). In any case, no need to provide MI configuration.
 	 */
 	if (static_branch_unlikely(&vgic_v3_cpuif_trap) ||
 	    cpu_if->its_vpe.its_vm || !cpu_if->vgic_sre)
-		write_gicreg(cpu_if->vgic_hcr, ICH_HCR_EL2);
+		write_gicreg(vgic_ich_hcr_trap_bits() | ICH_HCR_EL2_En, ICH_HCR_EL2);
 }
 
 void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if)
diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 7f1259b49c505..1fc9e0780abe6 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -298,19 +298,9 @@ static void vgic_v3_create_shadow_state(struct kvm_vcpu *vcpu,
 					struct vgic_v3_cpu_if *s_cpu_if)
 {
 	struct vgic_v3_cpu_if *host_if = &vcpu->arch.vgic_cpu.vgic_v3;
-	u64 val = 0;
 	int i;
 
-	/*
-	 * If we're on a system with a broken vgic that requires
-	 * trapping, propagate the trapping requirements.
-	 *
-	 * Ah, the smell of rotten fruits...
-	 */
-	if (static_branch_unlikely(&vgic_v3_cpuif_trap))
-		val = host_if->vgic_hcr & (ICH_HCR_EL2_TALL0 | ICH_HCR_EL2_TALL1 |
-					   ICH_HCR_EL2_TC | ICH_HCR_EL2_TDIR);
-	s_cpu_if->vgic_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) | val;
+	s_cpu_if->vgic_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
 	s_cpu_if->vgic_vmcr = __vcpu_sys_reg(vcpu, ICH_VMCR_EL2);
 	s_cpu_if->vgic_sre = host_if->vgic_sre;
 
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 6fbb4b0998552..8c14945086821 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -301,20 +301,9 @@ void vcpu_set_ich_hcr(struct kvm_vcpu *vcpu)
 		return;
 
 	/* Hide GICv3 sysreg if necessary */
-	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V2) {
+	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V2)
 		vgic_v3->vgic_hcr |= (ICH_HCR_EL2_TALL0 | ICH_HCR_EL2_TALL1 |
 				      ICH_HCR_EL2_TC);
-		return;
-	}
-
-	if (group0_trap)
-		vgic_v3->vgic_hcr |= ICH_HCR_EL2_TALL0;
-	if (group1_trap)
-		vgic_v3->vgic_hcr |= ICH_HCR_EL2_TALL1;
-	if (common_trap)
-		vgic_v3->vgic_hcr |= ICH_HCR_EL2_TC;
-	if (dir_trap)
-		vgic_v3->vgic_hcr |= ICH_HCR_EL2_TDIR;
 }
 
 int vgic_v3_lpi_sync_pending_status(struct kvm *kvm, struct vgic_irq *irq)
@@ -635,8 +624,50 @@ static const struct midr_range broken_seis[] = {
 
 static bool vgic_v3_broken_seis(void)
 {
-	return ((kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_SEIS) &&
-		is_midr_in_range_list(broken_seis));
+	return (is_kernel_in_hyp_mode() &&
+		is_midr_in_range_list(broken_seis) &&
+		(read_sysreg_s(SYS_ICH_VTR_EL2) & ICH_VTR_EL2_SEIS));
+}
+
+void noinstr kvm_compute_ich_hcr_trap_bits(struct alt_instr *alt,
+					   __le32 *origptr, __le32 *updptr,
+					   int nr_inst)
+{
+	u32 insn, oinsn, rd;
+	u64 hcr = 0;
+
+	if (cpus_have_cap(ARM64_WORKAROUND_CAVIUM_30115)) {
+		group0_trap = true;
+		group1_trap = true;
+	}
+
+	if (vgic_v3_broken_seis()) {
+		/* We know that these machines have ICH_HCR_EL2.TDIR */
+		group0_trap = true;
+		group1_trap = true;
+		dir_trap = true;
+	}
+
+	if (group0_trap)
+		hcr |= ICH_HCR_EL2_TALL0;
+	if (group1_trap)
+		hcr |= ICH_HCR_EL2_TALL1;
+	if (common_trap)
+		hcr |= ICH_HCR_EL2_TC;
+	if (dir_trap)
+		hcr |= ICH_HCR_EL2_TDIR;
+
+	/* Compute target register */
+	oinsn = le32_to_cpu(*origptr);
+	rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, oinsn);
+
+	/* movz rd, #(val & 0xffff) */
+	insn = aarch64_insn_gen_movewide(rd,
+					 (u16)hcr,
+					 0,
+					 AARCH64_INSN_VARIANT_64BIT,
+					 AARCH64_INSN_MOVEWIDE_ZERO);
+	*updptr = cpu_to_le32(insn);
 }
 
 /**
@@ -650,6 +681,7 @@ int vgic_v3_probe(const struct gic_kvm_info *info)
 {
 	u64 ich_vtr_el2 = kvm_call_hyp_ret(__vgic_v3_get_gic_config);
 	bool has_v2;
+	u64 traps;
 	int ret;
 
 	has_v2 = ich_vtr_el2 >> 63;
@@ -708,29 +740,18 @@ int vgic_v3_probe(const struct gic_kvm_info *info)
 	if (has_v2)
 		static_branch_enable(&vgic_v3_has_v2_compat);
 
-	if (cpus_have_final_cap(ARM64_WORKAROUND_CAVIUM_30115)) {
-		group0_trap = true;
-		group1_trap = true;
-	}
-
 	if (vgic_v3_broken_seis()) {
 		kvm_info("GICv3 with broken locally generated SEI\n");
-
 		kvm_vgic_global_state.ich_vtr_el2 &= ~ICH_VTR_EL2_SEIS;
-		group0_trap = true;
-		group1_trap = true;
-		if (ich_vtr_el2 & ICH_VTR_EL2_TDS)
-			dir_trap = true;
-		else
-			common_trap = true;
 	}
 
-	if (group0_trap || group1_trap || common_trap | dir_trap) {
+	traps = vgic_ich_hcr_trap_bits();
+	if (traps) {
 		kvm_info("GICv3 sysreg trapping enabled ([%s%s%s%s], reduced performance)\n",
-			 group0_trap ? "G0" : "",
-			 group1_trap ? "G1" : "",
-			 common_trap ? "C"  : "",
-			 dir_trap    ? "D"  : "");
+			 (traps & ICH_HCR_EL2_TALL0) ? "G0" : "",
+			 (traps & ICH_HCR_EL2_TALL1) ? "G1" : "",
+			 (traps & ICH_HCR_EL2_TC)    ? "C"  : "",
+			 (traps & ICH_HCR_EL2_TDIR)  ? "D"  : "");
 		static_branch_enable(&vgic_v3_cpuif_trap);
 	}
 
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index ac5f9c5d2b980..0ecadfa00397d 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -164,6 +164,22 @@ static inline int vgic_write_guest_lock(struct kvm *kvm, gpa_t gpa,
 	return ret;
 }
 
+void kvm_compute_ich_hcr_trap_bits(struct alt_instr *alt,
+				   __le32 *origptr, __le32 *updptr, int nr_inst);
+
+static inline u64 vgic_ich_hcr_trap_bits(void)
+{
+	u64 hcr;
+
+	/* All the traps are in the bottom 16bits */
+	asm volatile(ALTERNATIVE_CB("movz %0, #0\n",
+				    ARM64_ALWAYS_SYSTEM,
+				    kvm_compute_ich_hcr_trap_bits)
+		     : "=r" (hcr));
+
+	return hcr;
+}
+
 /*
  * This struct provides an intermediate representation of the fields contained
  * in the GICH_VMCR and ICH_VMCR registers, such that code exporting the GIC
-- 
2.47.3


