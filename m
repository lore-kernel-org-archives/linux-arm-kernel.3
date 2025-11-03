Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA2BCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NO2kyYxw3N1bzG+Qwk8gf4kzvQ/BA+zpL8zaaJ9CYo=; b=XQrpzogTpaRIDUsls+tfMGZ+CJ
	j63RHF7JPaDU2WAXTQBx0YkcwCQF1/kblESyILSC830/uxCthJJ0b4S3OB07WNEa54yTln3UwKJMa
	DQMmZI3ciY2JmoKPcdo7zOZR3PBwe7yDrmzqb7rwpi8JYRoe0mZPta6GLEpgaSKiSDd6IcaVuVWlH
	UANM3br7XvSFFRoYmDvHPB1ZiiJ+CVXCs8Jap6w1BGt35W4V65WUkyOBlfvjJrVGByzLE3DiTOpTL
	0HcbYENV/gs1890CkSS5bCf/jKX/RBs2CCyusRFkAFuTEeFkYD2qJLfnMzrrEt7satXsHAYA2lzSc
	rZKReUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqF-0000000AKGQ-42QI;
	Mon, 03 Nov 2025 16:55:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq6-0000000AJzP-3CZ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B7A043CA3;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D609C19422;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188929;
	bh=8vW7hVXkdmFLbBP8mgsVQ0V5dZeUtkUr2bYWHI7FQb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X3dpGie9B+GO+Zf6XZ8EeRbhRirHrJePrEYww5mIe+WTPxL6x+JmvOpXbVOfRNurQ
	 faXiAslnUxbTvh8R6jynORGSttFbU1L3Z/T9wRvt6/QUM2VCVLhNDaW4I3fNq8ZX1S
	 lFVJAMppPCHnjolMnLTjDKpRZxWJLBcJaISjfhrIqKYEYw3zg1vSwpeMl5jimS4nVC
	 GB7dXvTzMU64zBJfanN2MeZIM6T7jdJvZaW2bPo/EeC9R8K7y2leh8e2WX5ilntjRq
	 5gMiny8OoCjZgJKnrLTqcYY/6GmH3egUbpQNAMqsCRJUjgHIrWzGytMDVESqks9Kkm
	 92WVeFhDfx3Nw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq3-000000021VN-2JzG;
	Mon, 03 Nov 2025 16:55:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 12/33] KVM: arm64: GICv3: Extract LR folding primitive
Date: Mon,  3 Nov 2025 16:54:56 +0000
Message-ID: <20251103165517.2960148-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085530_839520_6986F05F 
X-CRM114-Status: GOOD (  17.76  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 88 +++++++++++++++++------------------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index ba2b9d4d0c778..8f28227ae7193 100644
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


