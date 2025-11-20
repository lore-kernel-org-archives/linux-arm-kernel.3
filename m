Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD19CF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zelVFi8rbLvSNaHHzqxYSTzlfl5kjG5EJjpb6w6WDjo=; b=rnlZPRlwBHzwlAE/rOlMRpr70S
	HJjFP2YI0Nrk95bHul6bJyGQakZ2vJIZ3QP/el5xAtoI9TcaPWwU5atpijOS6P8YWAOjCr/c04Xft
	UP8bA7dr8bavVEAxact1TWGhTe1hyoAHTXgcfD3XvJ8152uX4jS7vTCg6A38h0/Q4BiAO5M1mQ3ho
	l57nKiFz1DyAxJuOMRxDMcljl/E4cVT8VveTGrl2z2lqjEZGyJ+ku4azDvj82ztUxXTDer2yuuem9
	dDd+iWQbjGY/WUyfLu4Tw9OtqBx5hspeY1fkCCgGj3vKpCd/YAmttX0U1GvMTZ4GvBvQb7rGDZHX7
	CdYuWuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Qn-0000000772H-3t4g;
	Thu, 20 Nov 2025 17:26:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q7-000000075kC-1ZWg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Nov 2025 17:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zelVFi8rbLvSNaHHzqxYSTzlfl5kjG5EJjpb6w6WDjo=; b=EfVMB8udaeR7NVAc8IF9obMGX2
	Zc+arZau/0XJKJqL+uXS+xIbuS2DIGrEVrvdjrirAsmpm4EXDFD+BgA/6BpLtBYWrqU6uUr17byZZ
	Tq42cAYtMlyIt2K8bCJ4PwN3S/JpmYZmeSw8K7lvpdaAawht4VyJT3Swl0QkAgr4tK8Pq9g8zx0YM
	jIZ4vP6qPQbLL4KkMJNrIqqpecpzmGxPlUOW//o7z5dFywk5J2PCUPng8UDIuOV/mBbbBHfa/wV73
	mBIya+lQeUK13TIja+lH43RMYB7VsThon6OlS+er5DvlExsZTv/yzYit+ekrXq5+S2CoMVFjIqsQI
	M3sb7HfA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7YL-0000000F6e0-34Eu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 968CC40B8B;
	Thu, 20 Nov 2025 17:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764E6C4CEF1;
	Thu, 20 Nov 2025 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659557;
	bh=3oc3mE3MKaLJ102yx3fBNAGYLcUCEMpiniOX3bIMiXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nSEsSJTHUEDovc5GAoRPzBs1MRGyeLcDqAINpulHxzywUPzMaLi/DUi3cU+dnVCKS
	 k7jQrY/daF6FBlAgAW5jdives9UTUuGZ3/H7pnc4VJ+kia9db7XBYjaVS1lk4s3MC/
	 wyWFNTooRVKNIffXa3fya1mKxd+aWucxtePB8jBPATJobs0b+LBs3EHwRPyMofg/u6
	 KK3L+4xheSoRk6fN2Q2QfJSNgug2Rhnjjq3fOAObU0JbS7uXYeCm46TBeiIGuL83My
	 5t/kKiG+FSIJo50OOYLADakX8wJXfv6QPelF6vLTkQsp+VdtOFoQz0AgtFPR5/pN1z
	 RFdJfqWlrQO2g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pr-00000006y6g-1zaL;
	Thu, 20 Nov 2025 17:25:55 +0000
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
Subject: [PATCH v4 07/49] KVM: arm64: Repack struct vgic_irq fields
Date: Thu, 20 Nov 2025 17:24:57 +0000
Message-ID: <20251120172540.2267180-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_163042_531752_5B79B583 
X-CRM114-Status: GOOD (  15.52  )
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

struct vgic_irq has grown over the years, in a rather bad way.
Repack it using bitfields so that the individual flags, and move
things around a bit so that it a bit smaller.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v4.c |  5 ++++-
 include/kvm/arm_vgic.h        | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index 548aec9d5a728..09c3e9eb23f89 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -163,6 +163,7 @@ static void vgic_v4_disable_vsgis(struct kvm_vcpu *vcpu)
 		struct vgic_irq *irq = vgic_get_vcpu_irq(vcpu, i);
 		struct irq_desc *desc;
 		unsigned long flags;
+		bool pending;
 		int ret;
 
 		raw_spin_lock_irqsave(&irq->irq_lock, flags);
@@ -173,9 +174,11 @@ static void vgic_v4_disable_vsgis(struct kvm_vcpu *vcpu)
 		irq->hw = false;
 		ret = irq_get_irqchip_state(irq->host_irq,
 					    IRQCHIP_STATE_PENDING,
-					    &irq->pending_latch);
+					    &pending);
 		WARN_ON(ret);
 
+		irq->pending_latch = pending;
+
 		desc = irq_to_desc(irq->host_irq);
 		irq_domain_deactivate_irq(irq_desc_get_irq_data(desc));
 	unlock:
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 577723f5599bd..e84a1bc5cf172 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -123,6 +123,7 @@ struct irq_ops {
 
 struct vgic_irq {
 	raw_spinlock_t irq_lock;	/* Protects the content of the struct */
+	u32 intid;			/* Guest visible INTID */
 	struct rcu_head rcu;
 	struct list_head ap_list;
 
@@ -137,17 +138,17 @@ struct vgic_irq {
 					 * affinity reg (v3).
 					 */
 
-	u32 intid;			/* Guest visible INTID */
-	bool line_level;		/* Level only */
-	bool pending_latch;		/* The pending latch state used to calculate
-					 * the pending state for both level
-					 * and edge triggered IRQs. */
-	bool active;
-	bool pending_release;		/* Used for LPIs only, unreferenced IRQ
+	bool pending_release:1;		/* Used for LPIs only, unreferenced IRQ
 					 * pending a release */
 
-	bool enabled;
-	bool hw;			/* Tied to HW IRQ */
+	bool pending_latch:1;		/* The pending latch state used to calculate
+					 * the pending state for both level
+					 * and edge triggered IRQs. */
+	enum vgic_irq_config config:1;	/* Level or edge */
+	bool line_level:1;		/* Level only */
+	bool enabled:1;
+	bool active:1;
+	bool hw:1;			/* Tied to HW IRQ */
 	refcount_t refcount;		/* Used for LPIs */
 	u32 hwintid;			/* HW INTID number */
 	unsigned int host_irq;		/* linux irq corresponding to hwintid */
@@ -159,7 +160,6 @@ struct vgic_irq {
 	u8 active_source;		/* GICv2 SGIs only */
 	u8 priority;
 	u8 group;			/* 0 == group 0, 1 == group 1 */
-	enum vgic_irq_config config;	/* Level or edge */
 
 	struct irq_ops *ops;
 
-- 
2.47.3


