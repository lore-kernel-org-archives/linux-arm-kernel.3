Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE0EC4452E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtxOHlbnPHBVtBuAcQ7cm5gSMi7F1IghKeq2ZP/DQ0o=; b=WLN0SZ0Zbb3DF6d3oBWYf6qMgG
	9C6pwX2YXymqvGvef6FBsALFqspirnNXBMavZiIF4yKuvXASDCXWHdumrczo7ouiOgJqOkueJLkdB
	yOB4DLTxe0v5kH43bCoW2k02GtPyWRizkJz+GMEJk+6XrGSvINeiveRYT7+85WGQLtJWiApEaDuAc
	Jz/Crix/v0VFuCVxBUSFpAtcma5F/n99zsu1Ur5gC9+K+mLWuGuAIQ/YRs6JCSTK7fbguiRLPoC5Q
	fl/IzfveuUkN7nqzlM1dR0vSPA34NALcu39cHyYRtLur4GaziaKR4vvL0hlffBUS/3Ti0Zi+X9aVj
	xg/5NcpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxC-00000006mq3-4BqK;
	Mon, 20 Jul 2026 13:22:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnxB-00000006mnw-35Lb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:22:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29E9560A8C;
	Mon, 20 Jul 2026 13:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37941F00A3D;
	Mon, 20 Jul 2026 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553760;
	bh=VtxOHlbnPHBVtBuAcQ7cm5gSMi7F1IghKeq2ZP/DQ0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fMd2UR+uH7EakMHuzfhW/sNV5reM/ytmaLXLAyDUz9ycKZ6mamKqYw+z3qqhRK9OL
	 RXGdT3CAdTxf94J+rdOoT5bpNIGPY6IMzjAGRyoRd3RvRJhmxU0P85SKvxl/Eofqm8
	 MBP+mJlA6Ok5Wcu6vU+c7duQvvRG0V17lIftgBZbJ+pxX1MHI0u/KPKdBRsYMq072X
	 LbraCt7YjZYlJpkcQ2p9mrGFLOQKozZp0ZHma80+gu4926c8grxQN5AtUMsWiGtNDJ
	 jqYSBYDW71T/AMke2mROMmB2zG/h5V0wnFVNufiAuZ1g1DvI+eMeWA0lOxQ2bRyNgo
	 JQAZ8XstVDX/Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wlnx9-00000006oKK-0U31;
	Mon, 20 Jul 2026 13:22:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/5] KVM: arm64: Add a helper providing an inlined litteral value for ICH_VTR_EL2
Date: Mon, 20 Jul 2026 14:22:17 +0100
Message-ID: <20260720132220.2143486-4-maz@kernel.org>
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

Add a third way, in the form of an inlined litteral value that will
eventually replace all of the above. This litteral value is computed
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


