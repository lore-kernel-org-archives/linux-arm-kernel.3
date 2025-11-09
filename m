Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0EFCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hh86UeVMueRcWQeldfInXJVdKS+j6kYtfcMzlks01qw=; b=VgDTD+g02qc5Q2LYsWeFIKg1C6
	fHYVsfIBTIpz2zdvNkIrMzJ6dUiGIBRr9uNhl7UcqRIsP4NuMyBic9Jf91e0obphZaThte6da+A4i
	eEwyeGvHnc/dLF8ZFda4j8W2pl5SBFOhgGenR2YRkG09jHYT0hFiX3wrEqJfEpsNo7SsYaoOgjBh9
	zkzJ7w2URp+SPqtIgrsYiCiU0kgMTfAzMkBCJZCx4qfiD67WfR+xGrxISGLGv4o+iLbQsOdf6sxob
	yMcx+u0/JrlqVi5NgH7HTfAuS8NYxuFONJyR78mtu81angx4HwLdow30T6K6TlvP4ri6E8w+plToc
	v4tMC83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92T-00000004D0X-1MXF;
	Sun, 09 Nov 2025 17:17:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91m-00000004CCM-2g5N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57B45415F9;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27163C2BCB0;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708594;
	bh=nnN7zXEZgM6iLHEpVyZS7JUZdXH2ZuFwOkTQRHKZExY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dYVj6gbZq3cxRkjbSLzDKd+GT2InzlXlRGjIrzbDYdyKfiXIxTBJzXlDeyA8WsKom
	 DWIPIhwDVPpyOKKXcOipc+8Kmwfm1ODpD7FMyRT57M8idFah0SWq5OP26xG3a/QKn1
	 +t+LKW34TNWJOuMWh5airZ/SDmREZs58mxKTHa3nuDR9yZVekodX05VQO9XdDmVoH5
	 WDPepeddR/FrDYnWXFGosxG2a1r8TjltFofxuzE5X/8l/QvYaxUDAlesJ2Out+xMHs
	 bSpAAJ+9WSdyQOtkKzvrOlZRwPw8DbXsecx0Cre2LCwtpPtUcQl8q5e2h3jO1QYsQW
	 hg8aUNMejncaw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91k-00000003exw-0VJb;
	Sun, 09 Nov 2025 17:16:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 16/45] KVM: arm64: GICv2: Extract LR folding primitive
Date: Sun,  9 Nov 2025 17:15:50 +0000
Message-ID: <20251109171619.1507205-17-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091634_739574_482AB5DE 
X-CRM114-Status: GOOD (  18.48  )
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


