Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFE1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztCzC+Lvlvy00t5E1RNs8GskFXpdUBmmuEHVPxyMboA=; b=IbLb0ifMuj35WELVPXQbjb1uB7
	1QcV/tUbmpVyVl6MNVsQ53/59uZ5j+u+uhrbGWoF06EJbGZOZUhw52n39B1AXF4nK6C7CfnfW6OCy
	VE2frmNn7+nRbQtGCVwDFx/DmQSOiThh2hR6FQV2l+N9SARRDs3faw0HoE93i8mjO0Acy1AuLwTme
	dY5sktxrNVRxKLVzaAjQfFZGWZVkl6RcwfRKhejbWZT6aFqF0bO80hzS/pc0kSUowP/7wIEBemPYr
	36ZPV60d6UqJAZyBh0c43ZjtJ0e/F4xIZ3UBfuvUZ+wpi3E4vit2j9E2vshK/ccbACCvqKYzWKIhu
	lPnfrAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZJt-0000000DvAN-3JwY;
	Tue, 17 Dec 2024 15:17:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGv-0000000DuRb-41Bl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09C975C5FE9;
	Tue, 17 Dec 2024 15:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A69C4CED4;
	Tue, 17 Dec 2024 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448444;
	bh=ZazDMacD+OsJwszhNsJs0jzCPTWHDxmUqkqRwrsHAVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tH2eF4k1Z7NwpA2xwnn0QIHdQ+KTWMzDO+88I+NaPFIxNY9Ko6HqP8LPIP/h6v1ya
	 1az/S12OdVoI3YLzbjJF4MVw5VYCnEdeoBRh9V0sOixVKa3gMjXv/xsCyFoFd4N++5
	 UbtdXD0UsmYt7s31baU/avDzD4jzZ8A8nLhzktE5hYa9ycRG42wMZchsqcvevsE43x
	 cifd01TdyqV6Id3TI+b5KUv0h+fmS4f7ZAKfiMjYbAPHwWhQWqTUpbyYKZju2jy7yc
	 EClATAqwEkFglIYjWv7JI8tEOnsNRAHJYHcPzlFxNhl8DG+SkWR7mhHi7WPTAxDk1V
	 4D0hfGP4UE5Fg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGs-004bWV-LJ;
	Tue, 17 Dec 2024 15:14:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 01/16] arm64: sysreg: Add layout for ICH_HCR_EL2
Date: Tue, 17 Dec 2024 15:13:16 +0000
Message-Id: <20241217151331.934077-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217151331.934077-1-maz@kernel.org>
References: <20241217151331.934077-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071406_093264_76204EB3 
X-CRM114-Status: GOOD (  18.29  )
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

The ICH_HCR_EL2-related macros are missing a number of control
bits that we are about to handle. Take this opportunity to fully
describe the layout of that register as part of the automatic
generation infrastructure.

This results in a bit of churn, unfortunately.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h       | 12 ------------
 arch/arm64/kvm/emulate-nested.c       | 16 ++++++++--------
 arch/arm64/kvm/hyp/vgic-v3-sr.c       | 14 +++++++-------
 arch/arm64/kvm/vgic/vgic-v3.c         | 17 +++++++++--------
 arch/arm64/tools/sysreg               | 22 ++++++++++++++++++++++
 drivers/irqchip/irq-apple-aic.c       |  8 ++++----
 tools/arch/arm64/include/asm/sysreg.h | 12 ------------
 7 files changed, 50 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index b8303a83c0bff..3e84ef8f5b311 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -561,7 +561,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_HCR_EL2			sys_reg(3, 4, 12, 11, 0)
 #define SYS_ICH_VTR_EL2			sys_reg(3, 4, 12, 11, 1)
 #define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
@@ -1011,17 +1010,6 @@
 #define ICH_LR_PRIORITY_SHIFT	48
 #define ICH_LR_PRIORITY_MASK	(0xffULL << ICH_LR_PRIORITY_SHIFT)
 
-/* ICH_HCR_EL2 bit definitions */
-#define ICH_HCR_EN		(1 << 0)
-#define ICH_HCR_UIE		(1 << 1)
-#define ICH_HCR_NPIE		(1 << 3)
-#define ICH_HCR_TC		(1 << 10)
-#define ICH_HCR_TALL0		(1 << 11)
-#define ICH_HCR_TALL1		(1 << 12)
-#define ICH_HCR_TDIR		(1 << 14)
-#define ICH_HCR_EOIcount_SHIFT	27
-#define ICH_HCR_EOIcount_MASK	(0x1f << ICH_HCR_EOIcount_SHIFT)
-
 /* ICH_VMCR_EL2 bit definitions */
 #define ICH_VMCR_ACK_CTL_SHIFT	2
 #define ICH_VMCR_ACK_CTL_MASK	(1 << ICH_VMCR_ACK_CTL_SHIFT)
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 1ffbfd1c3cf2e..c460b8403aec5 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -395,26 +395,26 @@ static const struct trap_bits coarse_trap_bits[] = {
 	},
 	[CGT_ICH_HCR_TC] = {
 		.index		= ICH_HCR_EL2,
-		.value		= ICH_HCR_TC,
-		.mask		= ICH_HCR_TC,
+		.value		= ICH_HCR_EL2_TC,
+		.mask		= ICH_HCR_EL2_TC,
 		.behaviour	= BEHAVE_FORWARD_RW,
 	},
 	[CGT_ICH_HCR_TALL0] = {
 		.index		= ICH_HCR_EL2,
-		.value		= ICH_HCR_TALL0,
-		.mask		= ICH_HCR_TALL0,
+		.value		= ICH_HCR_EL2_TALL0,
+		.mask		= ICH_HCR_EL2_TALL0,
 		.behaviour	= BEHAVE_FORWARD_RW,
 	},
 	[CGT_ICH_HCR_TALL1] = {
 		.index		= ICH_HCR_EL2,
-		.value		= ICH_HCR_TALL1,
-		.mask		= ICH_HCR_TALL1,
+		.value		= ICH_HCR_EL2_TALL1,
+		.mask		= ICH_HCR_EL2_TALL1,
 		.behaviour	= BEHAVE_FORWARD_RW,
 	},
 	[CGT_ICH_HCR_TDIR] = {
 		.index		= ICH_HCR_EL2,
-		.value		= ICH_HCR_TDIR,
-		.mask		= ICH_HCR_TDIR,
+		.value		= ICH_HCR_EL2_TDIR,
+		.mask		= ICH_HCR_EL2_TDIR,
 		.behaviour	= BEHAVE_FORWARD_RW,
 	},
 };
diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 3f9741e51d41b..b47dede973b3c 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -218,7 +218,7 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 
 		elrsr = read_gicreg(ICH_ELRSR_EL2);
 
-		write_gicreg(cpu_if->vgic_hcr & ~ICH_HCR_EN, ICH_HCR_EL2);
+		write_gicreg(cpu_if->vgic_hcr & ~ICH_HCR_EL2_En, ICH_HCR_EL2);
 
 		for (i = 0; i < used_lrs; i++) {
 			if (elrsr & (1 << i))
@@ -274,7 +274,7 @@ void __vgic_v3_activate_traps(struct vgic_v3_cpu_if *cpu_if)
 	 * system registers to trap to EL1 (duh), force ICC_SRE_EL1.SRE to 1
 	 * so that the trap bits can take effect. Yes, we *loves* the GIC.
 	 */
-	if (!(cpu_if->vgic_hcr & ICH_HCR_EN)) {
+	if (!(cpu_if->vgic_hcr & ICH_HCR_EL2_En)) {
 		write_gicreg(ICC_SRE_EL1_SRE, ICC_SRE_EL1);
 		isb();
 	} else if (!cpu_if->vgic_sre) {
@@ -752,7 +752,7 @@ static void __vgic_v3_bump_eoicount(void)
 	u32 hcr;
 
 	hcr = read_gicreg(ICH_HCR_EL2);
-	hcr += 1 << ICH_HCR_EOIcount_SHIFT;
+	hcr += 1 << ICH_HCR_EL2_EOIcount_SHIFT;
 	write_gicreg(hcr, ICH_HCR_EL2);
 }
 
@@ -1069,7 +1069,7 @@ static bool __vgic_v3_check_trap_forwarding(struct kvm_vcpu *vcpu,
 	case SYS_ICC_EOIR0_EL1:
 	case SYS_ICC_HPPIR0_EL1:
 	case SYS_ICC_IAR0_EL1:
-		return ich_hcr & ICH_HCR_TALL0;
+		return ich_hcr & ICH_HCR_EL2_TALL0;
 
 	case SYS_ICC_IGRPEN1_EL1:
 		if (is_read &&
@@ -1090,10 +1090,10 @@ static bool __vgic_v3_check_trap_forwarding(struct kvm_vcpu *vcpu,
 	case SYS_ICC_EOIR1_EL1:
 	case SYS_ICC_HPPIR1_EL1:
 	case SYS_ICC_IAR1_EL1:
-		return ich_hcr & ICH_HCR_TALL1;
+		return ich_hcr & ICH_HCR_EL2_TALL1;
 
 	case SYS_ICC_DIR_EL1:
-		if (ich_hcr & ICH_HCR_TDIR)
+		if (ich_hcr & ICH_HCR_EL2_TDIR)
 			return true;
 
 		fallthrough;
@@ -1101,7 +1101,7 @@ static bool __vgic_v3_check_trap_forwarding(struct kvm_vcpu *vcpu,
 	case SYS_ICC_RPR_EL1:
 	case SYS_ICC_CTLR_EL1:
 	case SYS_ICC_PMR_EL1:
-		return ich_hcr & ICH_HCR_TC;
+		return ich_hcr & ICH_HCR_EL2_TC;
 
 	default:
 		return false;
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index f267bc2486a18..6c21be12959d6 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -23,7 +23,7 @@ void vgic_v3_set_underflow(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v3_cpu_if *cpuif = &vcpu->arch.vgic_cpu.vgic_v3;
 
-	cpuif->vgic_hcr |= ICH_HCR_UIE;
+	cpuif->vgic_hcr |= ICH_HCR_EL2_UIE;
 }
 
 static bool lr_signals_eoi_mi(u64 lr_val)
@@ -41,7 +41,7 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 
 	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
 
-	cpuif->vgic_hcr &= ~ICH_HCR_UIE;
+	cpuif->vgic_hcr &= ~ICH_HCR_EL2_UIE;
 
 	for (lr = 0; lr < cpuif->used_lrs; lr++) {
 		u64 val = cpuif->vgic_lr[lr];
@@ -291,7 +291,7 @@ void vgic_v3_enable(struct kvm_vcpu *vcpu)
 					    ICH_VTR_PRI_BITS_SHIFT) + 1;
 
 	/* Get the show on the road... */
-	vgic_v3->vgic_hcr = ICH_HCR_EN;
+	vgic_v3->vgic_hcr = ICH_HCR_EL2_En;
 }
 
 void vcpu_set_ich_hcr(struct kvm_vcpu *vcpu)
@@ -300,18 +300,19 @@ void vcpu_set_ich_hcr(struct kvm_vcpu *vcpu)
 
 	/* Hide GICv3 sysreg if necessary */
 	if (!kvm_has_gicv3(vcpu->kvm)) {
-		vgic_v3->vgic_hcr |= ICH_HCR_TALL0 | ICH_HCR_TALL1 | ICH_HCR_TC;
+		vgic_v3->vgic_hcr |= (ICH_HCR_EL2_TALL0 | ICH_HCR_EL2_TALL1 |
+				      ICH_HCR_EL2_TC);
 		return;
 	}
 
 	if (group0_trap)
-		vgic_v3->vgic_hcr |= ICH_HCR_TALL0;
+		vgic_v3->vgic_hcr |= ICH_HCR_EL2_TALL0;
 	if (group1_trap)
-		vgic_v3->vgic_hcr |= ICH_HCR_TALL1;
+		vgic_v3->vgic_hcr |= ICH_HCR_EL2_TALL1;
 	if (common_trap)
-		vgic_v3->vgic_hcr |= ICH_HCR_TC;
+		vgic_v3->vgic_hcr |= ICH_HCR_EL2_TC;
 	if (dir_trap)
-		vgic_v3->vgic_hcr |= ICH_HCR_TDIR;
+		vgic_v3->vgic_hcr |= ICH_HCR_EL2_TDIR;
 }
 
 int vgic_v3_lpi_sync_pending_status(struct kvm *kvm, struct vgic_irq *irq)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b081b54d6d227..9938926421b5c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2938,6 +2938,28 @@ Field	31:16	PhyPARTID29
 Field	15:0	PhyPARTID28
 EndSysreg
 
+Sysreg	ICH_HCR_EL2	3	4	12	11	0
+Res0	63:32
+Field	31:27	EOIcount
+Res0	26:16
+Field	15	DVIM
+Field	14	TDIR
+Field	13	TSEI
+Field	12	TALL1
+Field	11	TALL0
+Field	10	TC
+Res0	9
+Field	8	vSGIEOICount
+Field	7	VGrp1DIE
+Field	6	VGrp1EIE
+Field	5	VGrp0DIE
+Field	4	VGrp0EIE
+Field	3	NPIE
+Field	2	LRENPIE
+Field	1	UIE
+Field	0	En
+EndSysreg
+
 Sysreg	CONTEXTIDR_EL2	3	4	13	0	1
 Fields	CONTEXTIDR_ELx
 EndSysreg
diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index da5250f0155cf..7a5cc26529f82 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -409,15 +409,15 @@ static void __exception_irq_entry aic_handle_irq(struct pt_regs *regs)
 	 * in use, and be cleared when coming back from the handler.
 	 */
 	if (is_kernel_in_hyp_mode() &&
-	    (read_sysreg_s(SYS_ICH_HCR_EL2) & ICH_HCR_EN) &&
+	    (read_sysreg_s(SYS_ICH_HCR_EL2) & ICH_HCR_EL2_En) &&
 	    read_sysreg_s(SYS_ICH_MISR_EL2) != 0) {
 		generic_handle_domain_irq(aic_irqc->hw_domain,
 					  AIC_FIQ_HWIRQ(AIC_VGIC_MI));
 
-		if (unlikely((read_sysreg_s(SYS_ICH_HCR_EL2) & ICH_HCR_EN) &&
+		if (unlikely((read_sysreg_s(SYS_ICH_HCR_EL2) & ICH_HCR_EL2_En) &&
 			     read_sysreg_s(SYS_ICH_MISR_EL2))) {
 			pr_err_ratelimited("vGIC IRQ fired and not handled by KVM, disabling.\n");
-			sysreg_clear_set_s(SYS_ICH_HCR_EL2, ICH_HCR_EN, 0);
+			sysreg_clear_set_s(SYS_ICH_HCR_EL2, ICH_HCR_EL2_En, 0);
 		}
 	}
 }
@@ -840,7 +840,7 @@ static int aic_init_cpu(unsigned int cpu)
 				   VM_TMR_FIQ_ENABLE_V | VM_TMR_FIQ_ENABLE_P, 0);
 
 		/* vGIC maintenance IRQ */
-		sysreg_clear_set_s(SYS_ICH_HCR_EL2, ICH_HCR_EN, 0);
+		sysreg_clear_set_s(SYS_ICH_HCR_EL2, ICH_HCR_EL2_En, 0);
 	}
 
 	/* PMC FIQ */
diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index cd8420e8c3ad8..d314ccab7560a 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -420,7 +420,6 @@
 
 #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
 #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
-#define SYS_ICH_HCR_EL2			sys_reg(3, 4, 12, 11, 0)
 #define SYS_ICH_VTR_EL2			sys_reg(3, 4, 12, 11, 1)
 #define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
 #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
@@ -654,17 +653,6 @@
 #define ICH_LR_PRIORITY_SHIFT	48
 #define ICH_LR_PRIORITY_MASK	(0xffULL << ICH_LR_PRIORITY_SHIFT)
 
-/* ICH_HCR_EL2 bit definitions */
-#define ICH_HCR_EN		(1 << 0)
-#define ICH_HCR_UIE		(1 << 1)
-#define ICH_HCR_NPIE		(1 << 3)
-#define ICH_HCR_TC		(1 << 10)
-#define ICH_HCR_TALL0		(1 << 11)
-#define ICH_HCR_TALL1		(1 << 12)
-#define ICH_HCR_TDIR		(1 << 14)
-#define ICH_HCR_EOIcount_SHIFT	27
-#define ICH_HCR_EOIcount_MASK	(0x1f << ICH_HCR_EOIcount_SHIFT)
-
 /* ICH_VMCR_EL2 bit definitions */
 #define ICH_VMCR_ACK_CTL_SHIFT	2
 #define ICH_VMCR_ACK_CTL_MASK	(1 << ICH_VMCR_ACK_CTL_SHIFT)
-- 
2.39.2


