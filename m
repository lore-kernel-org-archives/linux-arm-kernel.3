Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61557CD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d3THQ3jAm9SNZMJDIRW8zIWB4cNCC2yz9o6K3Dp4Bk=; b=BjBWSjwkDxFl4ydZlYTXd1zDLG
	hgCTWYoiTQsVoYwvVyo5PTaEHTC46c+feY5PJnjhHoQBF6iOkGNz1VvBlW82TRs2atmYeZe3dd7HF
	YQUvezKLvK/u62yFO58zh92dlOGbewBFQlYsPjpdje1LuMbTjlxbE2HfSjwH1LCa9fM0os2hetoic
	ufi8MaAQdLGLhnw9abNAemb+O+RBnHnTGJI0lXl5No7ScJJnUDpTVb8gVNE72k13YZgS2sYBJmBXo
	AHlRvn7+sUg3n0vcSV4iISX9KIYwfSx8eaU6jinHpDOZqjgrUjpwiuMx2t0GazMn+ybIsVD/24Xly
	cYW3N6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92T-00000004D1f-42fD;
	Sun, 09 Nov 2025 17:17:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91n-00000004CD2-0OUN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 888B043DF0;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BD5C19423;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708594;
	bh=x/Kv22seDjzJRX62LIi+YQtCScX6F4cGrOiY1Bs4FbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RTO0tbLvPv7QaGNIIV9ngn4g371kjdLGS3E57IUDZVeIYqPnWTaamzoGo1K+Cxu8Y
	 UQCwBdXe5Ae85g3ZVcLsSueLKlmEzq3AJfu/YFCt8LLpjD/oVkD19GP6jx13l+f6+z
	 pT+Nr+kwghR7EtWOKvAjpKS/mQbjUJhrmozvlAuNfPMjXPqOYfQ/35v8uwTT3sclHU
	 cYaPFMPKltoFX9lVkr4V9bvSFkbTrfN9Cm2AtQk5H2nwW8eR9Ghl3ORLWlOCwZY/zm
	 biI34bBGgbgUKXbWdUw1B06tGBANUtPhsDrwNh9BOmydvUG00+osfuiR34czdp7zKY
	 0uT51lWs9e1Mg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91k-00000003exw-1XaK;
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
Subject: [PATCH v2 17/45] KVM: arm64: GICv2: Extract LR computing primitive
Date: Sun,  9 Nov 2025 17:15:51 +0000
Message-ID: <20251109171619.1507205-18-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091635_266094_E24D3AE4 
X-CRM114-Status: GOOD (  16.88  )
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


