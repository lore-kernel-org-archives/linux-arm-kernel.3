Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DE1CF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSeaw1ue/9LRvaa7Z/xMMsqVV3Rjxox1ceER+Xn6mPc=; b=M+dJ4eJL/7YzS/JKYMCq2VN5VM
	mZ7hvxv5Jz3vGduMGf/ku/KxYc6eMpNjOA+nWuwfZdCb/5x4jEfIVt/JpgaJTTlHiKZxy+J2MRcr4
	yJ9ClNLLXVWxN1RentUKzJm97RG28+pMSoSZJmzP7IDdNW+/mBpMyE/SCqDeAxc2Griwdj+WGSB2I
	9mzoBJdG9gTwkZ5P53c5u0TTsAVok7tLSkafQeA0VaCUpxV9+G6B5iJQtJU7Lu6zoUWDS1Q5rTnPS
	Pv8b9kpNCadtx6K0KOgoLG5051uSD1GpXYPPCIjhRL4gz7CTAqYsA6R00y8eIVS92Lc/5aZxkh1kb
	JidB3Gfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8SY-000000078sW-0ocx;
	Thu, 20 Nov 2025 17:28:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q8-000000075lS-1jMR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Nov 2025 17:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZSeaw1ue/9LRvaa7Z/xMMsqVV3Rjxox1ceER+Xn6mPc=; b=AL/Q56uZaS+u1WPGcfG8XMnQnI
	B5KAbrCQ/KbAc68X2ok9nAje+hRSpdJTgxkZaQcVjaXDQIfYJZetE9NFXH1lLgFxaytvHUbqotkRb
	yfkwvx30a2SDsmDtzgXx9xrn5kuEKY8Tuo1COgvNisGtIFoy7EbG3O13B/OZn6HsT+GN50Rutfrwp
	3xOj/A+zBShxvxV/FNS87S4I/thgIP/4BSZBGLNbv0TpHd8ca4yS7XX50vmJxvzin5ar2s4++/1GH
	EYa4s+Z3/ttXBTmOE6VZidQx9RTmKwTf5nu98qHIgbAOq0XS3/ZqHDXHUHPOVXU2Qn58394deBGMK
	H9Ndk6ww==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7YP-0000000F6ek-2E3N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:30:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2F9B44278;
	Thu, 20 Nov 2025 17:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B751AC19421;
	Thu, 20 Nov 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659559;
	bh=vLlPo3Zk09/KBtF1mv1AED7DUfgLhllH0ekiQOicv9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aPeBfkiMnoGTd3J13ZxUYS2+z4XLkFW9wuwj5VrWA8m2iyQ16UPsU6AojttUEfJZz
	 Ekp5JTTJbQtjU8+W1p5Ue1wzjWP+tIkL/MiTq8HFUtPt0NX8/7wVfgN65UvTQFepm1
	 6n+n66OjcTW0on/78Jj3u1+QMJVG0fuAAH/0JwFbjzHbleR3B/HOZfIDBcS1DLTzLo
	 RFSBT9OlSNfM10zNTjS8CFH03oZ1MZwPp8npgY4moLjzJ8A9Dln8NhE43wDnQ6+456
	 PBGq00iD6FigT6mRAyXZq6fbAEQkAkfdOzFY7kylIkMttdeaB9st5/VRkr4FZ0pLrr
	 zdq9DQBxWw6Nw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pt-00000006y6g-43RZ;
	Thu, 20 Nov 2025 17:25:58 +0000
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
Subject: [PATCH v4 17/49] KVM: arm64: GICv2: Extract LR folding primitive
Date: Thu, 20 Nov 2025 17:25:07 +0000
Message-ID: <20251120172540.2267180-18-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_163043_329363_262BAE11 
X-CRM114-Status: GOOD (  18.07  )
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
are not in the LRs, split vgic_v2_fold_lr_state() into a helper
that deals with a single interrupt, and the function that loops
over the used LRs.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 67 +++++++++++++++++------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index a0d803c5b08ae..fb8efdd4196b1 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -39,43 +39,23 @@ static bool lr_signals_eoi_mi(u32 lr_val)
 	       !(lr_val & GICH_LR_HW);
 }
 
-/*
- * transfer the content of the LRs back into the corresponding ap_list:
- * - active bit is transferred as is
- * - pending bit is
- *   - transferred as is in case of edge sensitive IRQs
- *   - set to the line-level (resample time) for level sensitive IRQs
- */
-void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
+static void vgic_v2_fold_lr(struct kvm_vcpu *vcpu, u32 val)
 {
-	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
-	struct vgic_v2_cpu_if *cpuif = &vgic_cpu->vgic_v2;
-	int lr;
-
-	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
-
-	cpuif->vgic_hcr &= ~GICH_HCR_UIE;
+	u32 cpuid, intid = val & GICH_LR_VIRTUALID;
+	struct vgic_irq *irq;
+	bool deactivated;
 
-	for (lr = 0; lr < vgic_cpu->vgic_v2.used_lrs; lr++) {
-		u32 val = cpuif->vgic_lr[lr];
-		u32 cpuid, intid = val & GICH_LR_VIRTUALID;
-		struct vgic_irq *irq;
-		bool deactivated;
+	/* Extract the source vCPU id from the LR */
+	cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val) & 7;
 
-		/* Extract the source vCPU id from the LR */
-		cpuid = val & GICH_LR_PHYSID_CPUID;
-		cpuid >>= GICH_LR_PHYSID_CPUID_SHIFT;
-		cpuid &= 7;
+	/* Notify fds when the guest EOI'ed a level-triggered SPI */
+	if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
+		kvm_notify_acked_irq(vcpu->kvm, 0,
+				     intid - VGIC_NR_PRIVATE_IRQS);
 
-		/* Notify fds when the guest EOI'ed a level-triggered SPI */
-		if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
-			kvm_notify_acked_irq(vcpu->kvm, 0,
-					     intid - VGIC_NR_PRIVATE_IRQS);
-
-		irq = vgic_get_vcpu_irq(vcpu, intid);
-
-		raw_spin_lock(&irq->irq_lock);
+	irq = vgic_get_vcpu_irq(vcpu, intid);
 
+	scoped_guard(raw_spinlock, &irq->irq_lock) {
 		/* Always preserve the active bit, note deactivation */
 		deactivated = irq->active && !(val & GICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & GICH_LR_ACTIVE_BIT);
@@ -102,11 +82,28 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 		vgic_irq_handle_resampling(irq, deactivated, val & GICH_LR_PENDING_BIT);
 
 		irq->on_lr = false;
-
-		raw_spin_unlock(&irq->irq_lock);
-		vgic_put_irq(vcpu->kvm, irq);
 	}
 
+	vgic_put_irq(vcpu->kvm, irq);
+}
+
+/*
+ * transfer the content of the LRs back into the corresponding ap_list:
+ * - active bit is transferred as is
+ * - pending bit is
+ *   - transferred as is in case of edge sensitive IRQs
+ *   - set to the line-level (resample time) for level sensitive IRQs
+ */
+void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+	struct vgic_v2_cpu_if *cpuif = &vgic_cpu->vgic_v2;
+
+	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
+
+	for (int lr = 0; lr < vgic_cpu->vgic_v2.used_lrs; lr++)
+		vgic_v2_fold_lr(vcpu, cpuif->vgic_lr[lr]);
+
 	cpuif->used_lrs = 0;
 }
 
-- 
2.47.3


