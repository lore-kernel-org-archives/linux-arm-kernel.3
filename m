Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32937CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hh86UeVMueRcWQeldfInXJVdKS+j6kYtfcMzlks01qw=; b=0//9ooHlYJo/c0qF0NCAG4GSgr
	B4X+W3OGbM7ni9yDFsIvE8yuSvX3GJaCBad81OXDklfSO4Y//wjG6CMoMPwUUh4meggEwWxzA5IAu
	343W05tTJqzBg6aoXHH+qpI0jvAqJRpC49o0AsLOpcY/85gAhzXi8kpHso5DhkYhLJ0vO9anfaR4M
	7l9/KXysrwd3JhaiOjfT0qxab3nu5D/h/58MmFfR31g4TS4TYYA1RVlDkvlij1t/GtfnB5mMJwpJf
	hUNp/U1KkGYEjvpU7jbgDimJeEMIsxJMtLoxzOcjqfgJAZ8CXTCZwOoToHQfEx/7G9BhUsYtEvQ/e
	CKmTfLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqL-0000000AKRG-1Q8J;
	Mon, 03 Nov 2025 16:55:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq7-0000000AK0T-1COV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63CD343C1B;
	Mon,  3 Nov 2025 16:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EBBC116D0;
	Mon,  3 Nov 2025 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188930;
	bh=nnN7zXEZgM6iLHEpVyZS7JUZdXH2ZuFwOkTQRHKZExY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d3rDYRmGdHt6yY64AkI52+tAlPq5uesSlLExme5It8VyiG4eHjcjlFBHiqXrCclHY
	 6NPKipC6h5Ii02s8PwYRVpEcLTwBl3QkXNLH5R+5GFixPeM0QQFcrXSOyuETpNFgZk
	 zREwT3opybrkQcO5Bvx8n021NCoNjU2eyO9W1OPHtuqhpNymZNwB8zFHVuUkQ7RvGC
	 428rJvlEpzBQ8KBpLLjDnIvDoXk2YoB/vOvAorhvAI9MghW+e+o2gy3AdRuzwCjARK
	 9dwOn9Jk9uJxh1v4qA9I3ZOjXSRfCJjWPBZQhhOBb+be8UCQIot8tDEZB5bvO21S9R
	 H78diWxr+wNUQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq4-000000021VN-28o5;
	Mon, 03 Nov 2025 16:55:28 +0000
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
Subject: [PATCH 16/33] KVM: arm64: GICv2: Extract LR folding primitive
Date: Mon,  3 Nov 2025 16:55:00 +0000
Message-ID: <20251103165517.2960148-17-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251103_085531_449226_9E40E1DA 
X-CRM114-Status: GOOD (  18.02  )
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


