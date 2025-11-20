Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006E5CF9C7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErRB4mRuAjwM0oySTm0KYNmozHy9AT8M1XLEVlF5ofE=; b=gI13b0U1IiwlRm908KJIp6nbfm
	iRTbzPxoyXAwLz/L3M81UxyySR9LODaItXDBDebu/mQxYlg6xl9WNGBg0qrgOGcMdGTEawKn/wgQA
	2ZnFt+M6APTBtLWWL4hEKOg9Ijo0Y1Moc+RVOVaH70VgJZFkshiOO2GwJYaRXtb6uWg5nrSGrtha+
	P4b4g4RdfUQOoxCQ1I2oejkAlqY5Xe/AVBhhR1v24yhJF71AsrxAilhRbcVRHkzbDMcn546u5R7Ku
	pAicaDbf0Z+W09GaKlKKYvCOJIy9uDg1qhTN+9gFS8iOuRiVZQh4WI1ucJitQQlyDtUobnEvfpuI3
	AEpRnYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q9-000000075pU-3VGz;
	Thu, 20 Nov 2025 17:26:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pw-000000075bb-3Fke
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D9B4601EF;
	Thu, 20 Nov 2025 17:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8187C4CEF1;
	Thu, 20 Nov 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659559;
	bh=+Tg0lzsrYBfmnrwDBIpAImqT1N4cfKAmCDeyZzlZfU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ap9/KVSIUsVZ3eUzH+cOWhuqpnKq/H+MhQ+2PBTWJ1WcGgn0WRyROsmk8UNWA0vsV
	 cOYLPBTf+laj4GpbMSr5jEatLEGU9ntBwNiNnWjsmM0cakh5EpJ+RGPrBQIxSYuEUS
	 WlAvjOYtiiLHqL014ylh/jzzORU7lTuYFXoqPgJA/nurHZnEdyTwG7mrg62NaPUDAP
	 tuvRdyjbwqF5QcZxLEF5YMZPFSjKdUefkZa6EB1MGg0OLMtcwyOvB4KuQAXJyv5Wx9
	 xssAPsLgQYco4buWLVmIVAXlnNHR4tA/5Wg/x0YsZpJ2MhhTmo8/HB/xTLVuaovn0m
	 OpE0KpsDBCuug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pu-00000006y6g-0qLo;
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
Subject: [PATCH v4 18/49] KVM: arm64: GICv2: Extract LR computing primitive
Date: Thu, 20 Nov 2025 17:25:08 +0000
Message-ID: <20251120172540.2267180-19-maz@kernel.org>
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

Split vgic_v2_populate_lr() into two helpers, so that we have another
primitive that computes the LR from a vgic_irq, but doesn't update
anything in the shadow structure.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 61 ++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index fb8efdd4196b1..5a2165a8d22c0 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -107,18 +107,7 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 	cpuif->used_lrs = 0;
 }
 
-/*
- * Populates the particular LR with the state of a given IRQ:
- * - for an edge sensitive IRQ the pending state is cleared in struct vgic_irq
- * - for a level sensitive IRQ the pending state value is unchanged;
- *   it is dictated directly by the input level
- *
- * If @irq describes an SGI with multiple sources, we choose the
- * lowest-numbered source VCPU and clear that bit in the source bitmap.
- *
- * The irq_lock must be held by the caller.
- */
-void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
+static u32 vgic_v2_compute_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq)
 {
 	u32 val = irq->intid;
 	bool allow_pending = true;
@@ -164,22 +153,52 @@ void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	if (allow_pending && irq_is_pending(irq)) {
 		val |= GICH_LR_PENDING_BIT;
 
-		if (irq->config == VGIC_CONFIG_EDGE)
-			irq->pending_latch = false;
-
 		if (vgic_irq_is_sgi(irq->intid)) {
 			u32 src = ffs(irq->source);
 
 			if (WARN_RATELIMIT(!src, "No SGI source for INTID %d\n",
 					   irq->intid))
-				return;
+				return 0;
 
 			val |= (src - 1) << GICH_LR_PHYSID_CPUID_SHIFT;
-			irq->source &= ~(1 << (src - 1));
-			if (irq->source) {
-				irq->pending_latch = true;
+			if (irq->source & ~BIT(src - 1))
 				val |= GICH_LR_EOI;
-			}
+		}
+	}
+
+	/* The GICv2 LR only holds five bits of priority. */
+	val |= (irq->priority >> 3) << GICH_LR_PRIORITY_SHIFT;
+
+	return val;
+}
+
+/*
+ * Populates the particular LR with the state of a given IRQ:
+ * - for an edge sensitive IRQ the pending state is cleared in struct vgic_irq
+ * - for a level sensitive IRQ the pending state value is unchanged;
+ *   it is dictated directly by the input level
+ *
+ * If @irq describes an SGI with multiple sources, we choose the
+ * lowest-numbered source VCPU and clear that bit in the source bitmap.
+ *
+ * The irq_lock must be held by the caller.
+ */
+void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
+{
+	u32 val = vgic_v2_compute_lr(vcpu, irq);
+
+	vcpu->arch.vgic_cpu.vgic_v2.vgic_lr[lr] = val;
+
+	if (val & GICH_LR_PENDING_BIT) {
+		if (irq->config == VGIC_CONFIG_EDGE)
+			irq->pending_latch = false;
+
+		if (vgic_irq_is_sgi(irq->intid)) {
+			u32 src = ffs(irq->source);
+
+			irq->source &= ~BIT(src - 1);
+			if (irq->source)
+				irq->pending_latch = true;
 		}
 	}
 
@@ -196,8 +215,6 @@ void vgic_v2_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	val |= (irq->priority >> 3) << GICH_LR_PRIORITY_SHIFT;
 
 	irq->on_lr = true;
-
-	vcpu->arch.vgic_cpu.vgic_v2.vgic_lr[lr] = val;
 }
 
 void vgic_v2_clear_lr(struct kvm_vcpu *vcpu, int lr)
-- 
2.47.3


