Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48369CCFA0C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN/bWPQpZWPdYaHiguyPNjNMdoilV0XgZGvo+qaZIAU=; b=WYSQ/J5QLmmhfFkrHIY4Ts+AXC
	rYV0ut7aK0H+xTBM8fm11IMsPVr+3pRoBxtPlisxK9yjoJmMW2NSrL+V+Nm2Pyt5a4WWKqL8fEH65
	F74f3rfsFBZBcbdGZnS0U5Q6r2B0E3TCS4ukGTnnNXvQJhB6s3VvorCNDyDQmXu6+dvgVvUh9nLl1
	B2as9QhkFy5tyyNKXyOn3pw/ddatZHSaz2xzBjmawCSDg8dJg3b9bB94/f6iTj+aOxsBjekLFXKOX
	liU6Tnqg8d7jqnoV804e/thY4hA2lUGteVjMrxu9CY6K6WoRBdyWgcJOukLeGA4bE8XrgD8cFSCLl
	uSssaXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqA-0000000AK6v-1yVb;
	Mon, 03 Nov 2025 16:55:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq5-0000000AJyI-2ZiE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A36043C4B;
	Mon,  3 Nov 2025 16:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB99C116D0;
	Mon,  3 Nov 2025 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188928;
	bh=zXQ/Q106vwK8OH63fj9IqtJUIC0Dy3HS8nrP+/NjBZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEMLVcAp9KYhwGZKhfCi5mKO5CxO7FcBsAjy66omesCrujYP+pEiVCdnMFAhtv6SC
	 DyWNWCdNJbHwEtKx6OHlUOa1xVZ/G4CxJ/hgZrgYdPcYIGQJLeEZMA++1P3ZKNzlMU
	 DvTja6gED0d0tHM1OU8dUy75L6ZMs5M1DAjbTgho+0TW+LOEEIfVV5o1/BByHfzABg
	 hmazKc8ELPyC+jEWpd7UBi508kdQu+8CvTLInWsyibJYQ1OMdN7JomEuL/ZoOM3Z95
	 f2RM8AnNNHZ+F3iOFHvYLQnrNbQpo0uO+gz62RW0IeYJ7aDR778DDbEZZa+jpMvkHt
	 lwFvoKNxA4s2g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq2-000000021VN-1ICf;
	Mon, 03 Nov 2025 16:55:26 +0000
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
Subject: [PATCH 07/33] KVM: arm64: Add tracking of vgic_irq being present in a LR
Date: Mon,  3 Nov 2025 16:54:51 +0000
Message-ID: <20251103165517.2960148-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251103_085529_701622_84F50893 
X-CRM114-Status: GOOD (  12.96  )
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

We currently cannot identify whether an interrupt is queued into
a LR. It wasn't needed until now, but that's about to change.

Add yet another flag to track that state.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 6 ++++++
 arch/arm64/kvm/vgic/vgic-v3.c | 6 ++++++
 include/kvm/arm_vgic.h        | 1 +
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 441efef80d609..74efacba38d42 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -101,6 +101,8 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 		/* Handle resampling for mapped interrupts if required */
 		vgic_irq_handle_resampling(irq, deactivated, val & GICH_LR_PENDING_BIT);
 
+		irq->on_lr = false;
+
 		raw_spin_unlock(&irq->irq_lock);
 		vgic_put_irq(vcpu->kvm, irq);
 	}
@@ -124,6 +126,8 @@ void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	u32 val = irq->intid;
 	bool allow_pending = true;
 
+	WARN_ON(irq->on_lr);
+
 	if (irq->active) {
 		val |= GICH_LR_ACTIVE_BIT;
 		if (vgic_irq_is_sgi(irq->intid))
@@ -194,6 +198,8 @@ void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	/* The GICv2 LR only holds five bits of priority. */
 	val |= (irq->priority >> 3) << GICH_LR_PRIORITY_SHIFT;
 
+	irq->on_lr = true;
+
 	vcpu->arch.vgic_cpu.vgic_v2.vgic_lr[lr] = val;
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index e0c6e03bf9411..c71cf2bcc57c9 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -97,6 +97,8 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 		/* Handle resampling for mapped interrupts if required */
 		vgic_irq_handle_resampling(irq, deactivated, val & ICH_LR_PENDING_BIT);
 
+		irq->on_lr = false;
+
 		raw_spin_unlock(&irq->irq_lock);
 		vgic_put_irq(vcpu->kvm, irq);
 	}
@@ -111,6 +113,8 @@ void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	u64 val = irq->intid;
 	bool allow_pending = true, is_v2_sgi;
 
+	WARN_ON(irq->on_lr);
+
 	is_v2_sgi = (vgic_irq_is_sgi(irq->intid) &&
 		     model == KVM_DEV_TYPE_ARM_VGIC_V2);
 
@@ -185,6 +189,8 @@ void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	val |= (u64)irq->priority << ICH_LR_PRIORITY_SHIFT;
 
 	vcpu->arch.vgic_cpu.vgic_v3.vgic_lr[lr] = val;
+
+	irq->on_lr = true;
 }
 
 void vgic_v3_clear_lr(struct kvm_vcpu *vcpu, int lr)
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index e84a1bc5cf172..ec349c5a4a8b6 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -149,6 +149,7 @@ struct vgic_irq {
 	bool enabled:1;
 	bool active:1;
 	bool hw:1;			/* Tied to HW IRQ */
+	bool on_lr:1;			/* Present in a CPU LR */
 	refcount_t refcount;		/* Used for LPIs */
 	u32 hwintid;			/* HW INTID number */
 	unsigned int host_irq;		/* linux irq corresponding to hwintid */
-- 
2.47.3


