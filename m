Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D88CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TIzKuY83q97U1U+0f8lUwk8XwQIwJ6OrTSRAlmEejI=; b=jGMRsluoxPvDm/cf7fRCrZx2Rc
	BT5xIa9h8rugAdUZ+KKddHBiVl4AFePhKI5NcjCNxtXqGOPP8W7eT1oIlELJDDDlZgohC9rY6NFj0
	GR0LcI1t4xTG0blhggDx/VdfMM7V03Ph6F98D6+WJcsBDEn2mP55ASSNCgZCGwfcZzTscpZ9MEGPH
	ljZSClDO9LWfgYmIqjPu8qmWOXrQYz74YESYsO+k9OnjOEDbZSoevFVcj3yjqpfOZ6bmjE1GFPW1F
	3pAGqmUcBlPQTgASl7pVKJKoNtYJgD7rqvXeEjCesznSa9CPODa+m5V0rJVv7A7Rycwyyof74mzDN
	p7KEXBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6Z-000000047nA-3ou5;
	Wed, 20 May 2026 09:20:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6Q-000000047U3-3VLp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1TIzKuY83q97U1U+0f8lUwk8XwQIwJ6OrTSRAlmEejI=; b=JC1CijkvHqEuqHa2Sqk+/qjQNX
	w1ZeuxPWDtvs69HcvHLBk2lj6m++JysdPzs0OjC+BhAl5cvAMoAZHI9Ni7GPcSnfRJZxGuNbRnyVy
	AtfdouVkF6JAM7Qg86p8GWT4MNqLHgH+x2rkOTrqnK2o+xhUyKxTtCwL4u5zuj7E5k6t85TA+wBPo
	oDQpg+ggAsbm3Frj4Y6JFVt56xI/qtmrFi/06J1OKf8kS1OzFwnqquZT08wNqKGq8jUWRJsUBh7jp
	mXyXGhMDWc56fGAn/3LBGsA/n1dRVaRtXlbtEnUR4ZMyHAxeBMF5mZpic/1vRVQM//lOQTWfpF9uh
	T3yi7TPA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd66-0000000GKUL-16lH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 471FC40A20;
	Wed, 20 May 2026 09:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2984F1F00898;
	Wed, 20 May 2026 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268813;
	bh=1TIzKuY83q97U1U+0f8lUwk8XwQIwJ6OrTSRAlmEejI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cLV3pc9/PX5HDAD/BE3FqjE0SYANog0dx37qTlsgIML1uUo11+E71W5YzJ9XnCPG1
	 TgwBt95CzdT+hVKA/Tv0pbL1IMGMHu8Drxyzj9uPOArpi1W8az8LvkX+PAD5zYbbRP
	 169iYbXYnc3pBqNBVQpj4GGO7/TNyDiMaMLAeNI8aKjeG+SfErvAW2WnDMcKuGWNk2
	 o6QO/csRcuXIrb7B8v//rLRtI2KhfMAF15EagxYoJ6EFgmGflXDSZcRFy2HjZFIEnF
	 r/hdLJcoZeF7A++kkc1X/+zba4o7l69zghrCUYhXVBVk9NpDpUFNPdgLNb5HVhRiSc
	 LM5ighT0q3nqA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd63-00000004IaV-1nFT;
	Wed, 20 May 2026 09:20:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 06/18] KVM: arm64: vgic: Consolidate vgic_allocate_private_irqs_locked()
Date: Wed, 20 May 2026 10:19:37 +0100
Message-ID: <20260520091949.542365-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102015_931601_2A25E5B5 
X-CRM114-Status: GOOD (  16.87  )
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

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
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


