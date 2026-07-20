Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65832C4452C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkqMxQoVEiMfKZejeC5Qcqv1rK1w4sxhkFUEo2DhpNQ=; b=od/H2NpoVG1CEdaspgWasMAgfa
	/oGXrDf+C933BMViUo8qRDTu/DNrJQqGwoUGBupq2gRS0oR9YFeso1ldLvJZKyQrI/wwTnAr5u2rD
	Z/ObN8MSmIgpeqdOT0Za2OGCTtWtm006d8G34qD1QxwGvrrMcL2idgG213F/HbyBjYscTaIYEJhKz
	pwgKAvAzhbb8C3M1VVYYFhZKDlu+vlRoqj35HNXNFUlzpg6E/QZMMXPujZBxrUWSbvW461ir1VUOM
	RA1qlwpHvcisFTrRvb1yKWU45xCSn/c2dYNvfeYkDwQPPpVtO0n1HVVDyFiQK3cpVN/oigWULRv9G
	QCed+0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxD-00000006mqN-0Pak;
	Mon, 20 Jul 2026 13:22:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxB-00000006mnz-3RV3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:22:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CEF960A90;
	Mon, 20 Jul 2026 13:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61381F00A3E;
	Mon, 20 Jul 2026 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553760;
	bh=xkqMxQoVEiMfKZejeC5Qcqv1rK1w4sxhkFUEo2DhpNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h86M0QBMbxZoTUYFETmRBVhFHkniHBIzpxhjZ1RzZI2qo9w9jSnebLw62OKOHB/eS
	 n/xEF0ZgvmAx9ua+Xch/Ap5OhmshPktoT78k3c7hxFbN5CInJ+CouUxr+K0DJIx3dT
	 MV5J1Eqi3sERmA+8s5+5Kh60/XmQi1Zd8ycQdYX3NOYTcsFE0eAPAWAIL89Z+qxJOD
	 yyQN0ecgFqJiQnOiw02oX9/ACe5Mj6uqEZOWa4X1Kd9TSxNor9aFjSc57w98txU5NE
	 c9b5b1KZvT2nTBsRkCzEcucEgzqUP7YCVPG7f3BH/jL1sy/SYfJUqc/+ebHmg9AXWp
	 gZB6UGUEZZ4mQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wlnx8-00000006oKK-3mdk;
	Mon, 20 Jul 2026 13:22:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/5] KVM: arm64: Add a helper providing an inlined literal value for ICH_VTR_EL2
Date: Mon, 20 Jul 2026 14:22:16 +0100
Message-ID: <20260720132220.2143486-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720132220.2143486-1-maz@kernel.org>
References: <20260720132220.2143486-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

We already have two ways to deal with ICH_VTR_EL2:

- directly read the system register
- read a cached copy in the vgic global state

Add a third way, in the form of an inlined literal value that will
eventually replace all of the above. This literal value is computed
at boot time, and patched in the relevant code locations.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/image-vars.h |  1 +
 arch/arm64/kvm/vgic/vgic-v3.c  | 51 ++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic.h     | 17 ++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index d4c7d45ae6bc8..459c33634ebd1 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -92,6 +92,7 @@ KVM_NVHE_ALIAS(spectre_bhb_patch_wa3);
 KVM_NVHE_ALIAS(spectre_bhb_patch_clearbhb);
 KVM_NVHE_ALIAS(alt_cb_patch_nops);
 KVM_NVHE_ALIAS(kvm_compute_ich_hcr_trap_bits);
+KVM_NVHE_ALIAS(kvm_patch_ich_vtr_el2);
 
 /* Global kernel state accessed by nVHE hyp code. */
 KVM_NVHE_ALIAS(kvm_vgic_global_state);
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 9e841e7afd4a7..ef62dd498f5cf 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -876,6 +876,57 @@ void noinstr kvm_compute_ich_hcr_trap_bits(struct alt_instr *alt,
 	*updptr = cpu_to_le32(insn);
 }
 
+void noinstr kvm_patch_ich_vtr_el2(struct alt_instr *alt,
+				   __le32 *origptr, __le32 *updptr,
+				   int nr_inst)
+{
+	struct arm_smccc_res res = {};
+	u32 insn, oinsn, rd, vtr;
+
+	/* No KVM? Nothing to do */
+	if (!is_hyp_mode_available())
+		return;
+
+	/* No v3 (or v3 compat)? Nothing to do either */
+	if (!this_cpu_has_cap(ARM64_HAS_GICV5_LEGACY) &&
+	    !this_cpu_has_cap(ARM64_HAS_GICV3_CPUIF))
+		return;
+
+	/*
+	 * At the point where this is called, we are guaranteed that if
+	 * we're running at EL1, then the EL2 stubs are still in place.
+	 */
+	if (is_kernel_in_hyp_mode())
+		res.a1 = read_sysreg_s(SYS_ICH_VTR_EL2);
+	else
+		arm_smccc_1_1_hvc(HVC_GET_ICH_VTR_EL2, &res);
+
+	if (WARN_ON(res.a0 == HVC_STUB_ERR))
+		return;
+
+	vtr = res.a1;
+
+	/* Compute target register */
+	oinsn = le32_to_cpu(*origptr);
+	rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, oinsn);
+
+	/* movz rd, #(vtr & 0xffff) */
+	insn = aarch64_insn_gen_movewide(rd,
+					 (u16)vtr,
+					 0,
+					 AARCH64_INSN_VARIANT_64BIT,
+					 AARCH64_INSN_MOVEWIDE_ZERO);
+	*updptr++ = cpu_to_le32(insn);
+
+	/* movk rd, #((vtr >> 16) & 0xffff), lsl #16 */
+	insn = aarch64_insn_gen_movewide(rd,
+					 (u16)(vtr >> 16),
+					 16,
+					 AARCH64_INSN_VARIANT_64BIT,
+					 AARCH64_INSN_MOVEWIDE_KEEP);
+	*updptr++ = cpu_to_le32(insn);
+}
+
 void vgic_v3_enable_cpuif_traps(void)
 {
 	u64 traps = vgic_ich_hcr_trap_bits();
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index f45f7e3ec4d6e..4f65a210041ff 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -180,6 +180,23 @@ static inline u64 vgic_ich_hcr_trap_bits(void)
 	return hcr;
 }
 
+void kvm_patch_ich_vtr_el2(struct alt_instr *alt,
+			   __le32 *origptr, __le32 *updptr, int nr_inst);
+
+static inline u64 vgic_ich_vtr(void)
+{
+	u64 vtr;
+
+	/* All non-RES0 bits are in the bottom 32bits */
+	asm volatile(ALTERNATIVE_CB("movz %0, #0\n"
+				    "movk %0, #0, lsl #16\n",
+				    ARM64_ALWAYS_SYSTEM,
+				    kvm_patch_ich_vtr_el2)
+		     : "=r" (vtr));
+
+	return vtr;
+}
+
 /*
  * This struct provides an intermediate representation of the fields contained
  * in the GICH_VMCR and ICH_VMCR registers, such that code exporting the GIC
-- 
2.47.3


