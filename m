Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3523CCFA09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d3THQ3jAm9SNZMJDIRW8zIWB4cNCC2yz9o6K3Dp4Bk=; b=Iuvv32OvfbHwFMjjCY3ZseMv0D
	s78HEqUlIm/oQ5SiIjzz0A8jIj6R6XUteUwfUYw2hakg9OE3h6E4nrvQesCo7NewAt2ZUzvKaBX3i
	8qJyj00KPQzcawX65AdW26TZMBCHoXk3NT4AIL3xlmWtfdrxO4gBpTbJ6MigKve8osQTP//R44PiW
	sB3aSnt8xPd9/UuZoG3zkyw0eQQ11wcGb0K5mlmfTfW9aE1EXiIzY4D3EQoblqTFzzepnnnzKcvzf
	AiTgIJHNXnWyRQXWLfOcF8ZJgdbt8MvEd3tF8D53vyOrSFjMmzXE+udRG/LtGogRFuZHwOGNMd7Zg
	p9VFp38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqE-0000000AKD1-1SH0;
	Mon, 03 Nov 2025 16:55:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq7-0000000AK0e-21e0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF0926013D;
	Mon,  3 Nov 2025 16:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEF3C116C6;
	Mon,  3 Nov 2025 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188930;
	bh=x/Kv22seDjzJRX62LIi+YQtCScX6F4cGrOiY1Bs4FbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lZPFqRpu7Yw4EnrEQNYXtGfckQ1Eg2daPzqUrDLqz7MsdIl8ZqFaSE166LB89+6tA
	 DPFznux/KNl0zl2D48/YGhREzIGLq/MVi8ujNpiwk+vJJLcJn/g5TC12XI0oOYBW/W
	 SdciBIinlWFh/a91MRrHrQ77ewH6TPY7qFhfkiUN3PGIfdxMGKTace41hufNn7EACX
	 gyxGqjZ2uRG62delOwJl0RuLKoN8GyfadSph989i1grGd2wILoG+p1Un1MWhsR/E2k
	 Gr4CsgourTETGp5WeaAwKweZcHlBd6hZw1Z+yBpGLqUh2WlbX9PodyvJqZfXDVE7kA
	 cHhlq+wS6jUCA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq4-000000021VN-32v6;
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
Subject: [PATCH 17/33] KVM: arm64: GICv2: Extract LR computing primitive
Date: Mon,  3 Nov 2025 16:55:01 +0000
Message-ID: <20251103165517.2960148-18-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
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


