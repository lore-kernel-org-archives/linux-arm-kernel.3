Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE274F4198F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJY6CEf0m1R49S4FUV2lHw0/9QkD/lEy6qQ93zFF7c8=; b=XuWV9/vhFnnJ50rV0RWy2+7BFT
	qiIKLIgMCoLZ6zV7nRVrw6ChTOvKfl5Ot56bajdssNYmto6ZmcMaT/7eypIvvDxDlD9Q8KUqWIZYg
	k5HPK1K4FauasgtujuY4DBk08Xv+F2/RwFKqOlzewE2q6X4BodTgIouIrNXZctzo8HdvQi8EutnAv
	3Y8bP7/IhHKtyQsp3GSBpZfNaGs0zzV8eNkA28YxKUWZRKwCDYfKL3Z94QncchYsCNLB34fnlAvGQ
	WIwLKNbfB8t0EevcnDGa0Wrzar39qjhzbc+pFu8TPSknZlohhtRhj2Q5wijAoev0to0nYhfMyTG09
	iw2MfYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr3-0000000148D-2vs6;
	Wed, 15 Apr 2026 11:56:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr1-0000000145w-0EkV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7715360139;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CF4C2BCB4;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254182;
	bh=fqi8+j3VLK2GKCx0QN+AaZDVi8dXqXSJ7jWCYMLAgyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f2IGajP/2GB4lw+sx79c8n8N0qi/5JlQJu3jofEoE+S/mRhWVbZbSa16gnlDMjxiG
	 k8GTSFyWZPlwoIZpeiQt4RNfnzQVv2A01rwswsEsCSXH0dkJcgx7I9mE2UaKNwPRe3
	 VdVazD0kHF1CqVgqdIfH1d68w0f0z7r3JdGLwX40zRmI0LIMcTEKIuxG8YMTLmOZ5y
	 vPWWk56gCoEGvHGbVpxkS7emA9Z4Kc9OP5FPDNYs+GATUB8qTq3/CwgcY5+FaYnw3d
	 LX7JxMRNOd21ZHBa0P16rh0ABd593ClikAxZoH/LgOyjL8iM2hQeKh1ddR7l41p9GH
	 5ondyihw7cKGg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqy-0000000Bqsi-1PhV;
	Wed, 15 Apr 2026 11:56:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 06/18] KVM: arm64: vgic: Consolidate vgic_allocate_private_irqs_locked()
Date: Wed, 15 Apr 2026 12:55:47 +0100
Message-ID: <20260415115559.2227718-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
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

vgic_allocate_private_irqs_locked() calls two helpers, oddly named
vgic_{,v5_}allocate_private_irq().

Not only these helpers don't allocate anything, but they also
contain duplicate init code that would be better placed in the
caller.

Consolidate the common init code in the caller, rename the helpers
to vgic_{,v5_}setup_private_irq(), and pass the irq pointer around
instead of the index of the interrupt.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 45 +++++++++++++--------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 933983bb20052..907057881b26a 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -271,18 +271,12 @@ int kvm_vgic_vcpu_nv_init(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-static void vgic_allocate_private_irq(struct kvm_vcpu *vcpu, int i, u32 type)
+static void vgic_setup_private_irq(struct kvm_vcpu *vcpu, struct vgic_irq *irq,
+				   u32 type)
 {
-	struct vgic_irq *irq = &vcpu->arch.vgic_cpu.private_irqs[i];
+	irq->intid = irq - &vcpu->arch.vgic_cpu.private_irqs[0];
 
-	INIT_LIST_HEAD(&irq->ap_list);
-	raw_spin_lock_init(&irq->irq_lock);
-	irq->vcpu = NULL;
-	irq->target_vcpu = vcpu;
-	refcount_set(&irq->refcount, 0);
-
-	irq->intid = i;
-	if (vgic_irq_is_sgi(i)) {
+	if (vgic_irq_is_sgi(irq->intid)) {
 		/* SGIs */
 		irq->enabled = 1;
 		irq->config = VGIC_CONFIG_EDGE;
@@ -303,18 +297,11 @@ static void vgic_allocate_private_irq(struct kvm_vcpu *vcpu, int i, u32 type)
 	}
 }
 
-static void vgic_v5_allocate_private_irq(struct kvm_vcpu *vcpu, int i, u32 type)
+static void vgic_v5_setup_private_irq(struct kvm_vcpu *vcpu, struct vgic_irq *irq)
 {
-	struct vgic_irq *irq = &vcpu->arch.vgic_cpu.private_irqs[i];
-	u32 intid = vgic_v5_make_ppi(i);
-
-	INIT_LIST_HEAD(&irq->ap_list);
-	raw_spin_lock_init(&irq->irq_lock);
-	irq->vcpu = NULL;
-	irq->target_vcpu = vcpu;
-	refcount_set(&irq->refcount, 0);
+	int i = irq - &vcpu->arch.vgic_cpu.private_irqs[0];
 
-	irq->intid = intid;
+	irq->intid = vgic_v5_make_ppi(i);
 
 	/* The only Edge architected PPI is the SW_PPI */
 	if (i == GICV5_ARCH_PPI_SW_PPI)
@@ -323,7 +310,7 @@ static void vgic_v5_allocate_private_irq(struct kvm_vcpu *vcpu, int i, u32 type)
 		irq->config = VGIC_CONFIG_LEVEL;
 
 	/* Register the GICv5-specific PPI ops */
-	vgic_v5_set_ppi_ops(vcpu, intid);
+	vgic_v5_set_ppi_ops(vcpu, irq->intid);
 }
 
 static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type)
@@ -349,15 +336,19 @@ static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type)
 	if (!vgic_cpu->private_irqs)
 		return -ENOMEM;
 
-	/*
-	 * Enable and configure all SGIs to be edge-triggered and
-	 * configure all PPIs as level-triggered.
-	 */
 	for (i = 0; i < num_private_irqs; i++) {
+		struct vgic_irq *irq = &vcpu->arch.vgic_cpu.private_irqs[i];
+
+		INIT_LIST_HEAD(&irq->ap_list);
+		raw_spin_lock_init(&irq->irq_lock);
+		irq->vcpu = NULL;
+		irq->target_vcpu = vcpu;
+		refcount_set(&irq->refcount, 0);
+
 		if (vgic_is_v5(vcpu->kvm))
-			vgic_v5_allocate_private_irq(vcpu, i, type);
+			vgic_v5_setup_private_irq(vcpu, irq);
 		else
-			vgic_allocate_private_irq(vcpu, i, type);
+			vgic_setup_private_irq(vcpu, irq, type);
 	}
 
 	return 0;
-- 
2.47.3


