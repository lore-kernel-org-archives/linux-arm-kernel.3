Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2498ACF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsLMs0Kqzi75ctr/qJvQdS2OGQirQYabyONNHDtS358=; b=Wvzk+FdMq6RupyDziwwyzlePOz
	jsIUEtIWZtmEymQbpr601BgXHsHIeJpWg1sza3+o0zzxbLu/OThKbW3VuR2fPqr5CpwQbq1JcY7UG
	H3pYu7SKsWkomlWY4QvK3IGFE1r7h/PnpoJpRLGP5eeRyxNyECUCZ26Ote+UoPvkNbhZs+vjNMZWS
	IzqSnAd/POxAG8QRtzAHAfLZvzkqcFppQbq7xRdXbfxq7FnHEclTulIrgZ8+6PTHdkSwkozTDhQTL
	AReuBIZRsRq9NJvge9b8wobCU6VHSDYZeauMrIOZvoevGN+nYWrksc9XVWhkb9UzdEGuA7ShqAYHL
	pkkaHFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q9-000000075nv-17Jd;
	Thu, 20 Nov 2025 17:26:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pv-000000075aX-2Xkm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10A9F601EE;
	Thu, 20 Nov 2025 17:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC341C116D0;
	Thu, 20 Nov 2025 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659558;
	bh=yExkdJn0xWinwENS6undeAKjlYasHh9CwWs4DLIcGVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a1+IxqTRkVKRiKjBEhFOGnXVqPXl67imlrNWiQGHywumKL4d2aDLtBE1Lbfj0uvgY
	 JRoTQDngR3ssGKd1iYu4M+n26aocMrGRVWZs4TEkb7xJ3iRxgLXJqyuTjpUb0jwXie
	 oKJowNizOIy4GYkCbSXc/dWwdLGAShsJDCialMFfptSqTo7147Y+YaVBjnAIvsqaO1
	 1MsUNlsBUP+yRGkFl3tVVlx0VkVEou3FPUXQ+mVAGLt0kbJ7dkMHQ8x9gCFMVl/z1J
	 RSVspRoe44uf1Y081l6h3v1lG91HbKiTVEkJI6uPdzUmVQ2gWmtmLbMG43MSxwwBD0
	 nssPmkdcT8sNQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Ps-00000006y6g-43d3;
	Thu, 20 Nov 2025 17:25:57 +0000
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
Subject: [PATCH v4 13/49] KVM: arm64: GICv3: Extract LR folding primitive
Date: Thu, 20 Nov 2025 17:25:03 +0000
Message-ID: <20251120172540.2267180-14-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

As we are going to need to handle deactivation for interrupts that
are not in the LRs, split vgic_v3_fold_lr_state() into a helper
that deals with a single interrupt, and the function that loops
over the used LRs.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 88 +++++++++++++++++------------------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 81d22f615fa66..6b7d7b4048f03 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -33,78 +33,76 @@ static bool lr_signals_eoi_mi(u64 lr_val)
 	       !(lr_val & ICH_LR_HW);
 }
 
-void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
+static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 {
-	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
-	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
-	u32 model = vcpu->kvm->arch.vgic.vgic_model;
-	int lr;
-
-	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
-
-	cpuif->vgic_hcr &= ~ICH_HCR_EL2_UIE;
-
-	for (lr = 0; lr < cpuif->used_lrs; lr++) {
-		u64 val = cpuif->vgic_lr[lr];
-		u32 intid, cpuid;
-		struct vgic_irq *irq;
-		bool is_v2_sgi = false;
-		bool deactivated;
-
-		cpuid = val & GICH_LR_PHYSID_CPUID;
-		cpuid >>= GICH_LR_PHYSID_CPUID_SHIFT;
-
-		if (model == KVM_DEV_TYPE_ARM_VGIC_V3) {
-			intid = val & ICH_LR_VIRTUAL_ID_MASK;
-		} else {
-			intid = val & GICH_LR_VIRTUALID;
-			is_v2_sgi = vgic_irq_is_sgi(intid);
-		}
+	struct vgic_irq *irq;
+	bool is_v2_sgi = false;
+	bool deactivated;
+	u32 intid;
 
-		/* Notify fds when the guest EOI'ed a level-triggered IRQ */
-		if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
-			kvm_notify_acked_irq(vcpu->kvm, 0,
-					     intid - VGIC_NR_PRIVATE_IRQS);
+	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
+		intid = val & ICH_LR_VIRTUAL_ID_MASK;
+	} else {
+		intid = val & GICH_LR_VIRTUALID;
+		is_v2_sgi = vgic_irq_is_sgi(intid);
+	}
 
-		irq = vgic_get_vcpu_irq(vcpu, intid);
-		if (!irq)	/* An LPI could have been unmapped. */
-			continue;
+	irq = vgic_get_vcpu_irq(vcpu, intid);
+	if (!irq)	/* An LPI could have been unmapped. */
+		return;
 
-		raw_spin_lock(&irq->irq_lock);
+	/* Notify fds when the guest EOI'ed a level-triggered IRQ */
+	if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
+		kvm_notify_acked_irq(vcpu->kvm, 0,
+				     intid - VGIC_NR_PRIVATE_IRQS);
 
+	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		/* Always preserve the active bit for !LPIs, note deactivation */
 		if (irq->intid >= VGIC_MIN_LPI)
 			val &= ~ICH_LR_ACTIVE_BIT;
 		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
 
-		if (irq->active && is_v2_sgi)
-			irq->active_source = cpuid;
-
 		/* Edge is the only case where we preserve the pending bit */
 		if (irq->config == VGIC_CONFIG_EDGE &&
-		    (val & ICH_LR_PENDING_BIT)) {
+		    (val & ICH_LR_PENDING_BIT))
 			irq->pending_latch = true;
 
-			if (is_v2_sgi)
-				irq->source |= (1 << cpuid);
-		}
-
 		/*
 		 * Clear soft pending state when level irqs have been acked.
 		 */
 		if (irq->config == VGIC_CONFIG_LEVEL && !(val & ICH_LR_STATE))
 			irq->pending_latch = false;
 
+		if (is_v2_sgi) {
+			u8 cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val);
+
+			if (irq->active)
+				irq->active_source = cpuid;
+
+			if (val & ICH_LR_PENDING_BIT)
+				irq->source |= BIT(cpuid);
+		}
+
 		/* Handle resampling for mapped interrupts if required */
 		vgic_irq_handle_resampling(irq, deactivated, val & ICH_LR_PENDING_BIT);
 
 		irq->on_lr = false;
-
-		raw_spin_unlock(&irq->irq_lock);
-		vgic_put_irq(vcpu->kvm, irq);
 	}
 
+	vgic_put_irq(vcpu->kvm, irq);
+}
+
+void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
+
+	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
+
+	for (int lr = 0; lr < cpuif->used_lrs; lr++)
+		vgic_v3_fold_lr(vcpu, cpuif->vgic_lr[lr]);
+
 	cpuif->used_lrs = 0;
 }
 
-- 
2.47.3


