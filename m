Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C60CD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OV9Dd+0rLNvHmSh4v8BOCB4t7n6rhdaiUF6W04OhJxE=; b=dmucKrxlfw7JA8l6dmqxFPiZl7
	umszKIQhlKsFg4VUviWFuyASPIn0PBnksFBNF0/2557jb2NRtRLVwIk2BZ//vuzbRINRZ0G/xT55C
	mnrCfmSDG8SrsrQqu7t4TvPHoLuC2ZfE/Zm8Gm/uDT5X2b3C2/U+Fhij597A46EglBPWtX/qAT+V+
	ICBwmKbo2XQNixmxQDummRzKHDorgKunQqw3ZcVl5N8qK6BbUQ5l8gUCubVRfHz7dJtV9soDy3uv5
	x2LCvtfT/D4EYdC80czmK7CBtEwwA7d9D1zQAMZbaPp99JrWcSNOzBmihkLYnoZ5vUduvTM4RNadF
	ay+7OcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91p-00000004CI7-39yP;
	Sun, 09 Nov 2025 17:16:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91j-00000004C9C-3VwM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8531B43F15;
	Sun,  9 Nov 2025 17:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9FBC4CEF7;
	Sun,  9 Nov 2025 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708591;
	bh=uG/sGiah4ee3+/bxdFax57bVH6y6zvhTVa/pehRU4hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mnp+iVHc2YktQXudTjhFUeLHW0D20JEA+AWEGx5Xl6yt9Mxihq3stnx9f153dpti8
	 w1GFiWjeN+Ib4TD1C5bifR5zBCvziu++n8waxRyFMVYoX55cKuAN5PkfMU2F0zBThB
	 bivWYNySEt9IbGevSmy0qcabpCKe35oM8yD8SVt7h+jAmalcTCHM3DXjqPrqE8ScFY
	 4aADJoTtZv5FpsfxrLIx+4XukePTJYqzduoUWbOER+oGlp8NX1rQd4ls7dcxwn8Jmu
	 FeziqXNmYmHWLYsopxaFhsZuQsGnwKs8zoPiDl4815oPlyH7ur+D75tqroFpJljqkZ
	 6qHRhsv6z/Cnw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91h-00000003exw-0yMW;
	Sun, 09 Nov 2025 17:16:29 +0000
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
Subject: [PATCH v2 06/45] KVM: arm64: Repack struct vgic_irq fields
Date: Sun,  9 Nov 2025 17:15:40 +0000
Message-ID: <20251109171619.1507205-7-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091631_927706_8DC1FFE4 
X-CRM114-Status: GOOD (  15.93  )
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


