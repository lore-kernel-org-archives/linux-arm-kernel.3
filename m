Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B0ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKAV3r8jwYB1QjJgikcPAKEGW+oqB9mRNg3kiIwuzUc=; b=jfzp8ieWt3RLespGr56aDni34x
	kIuQqKH2OW8b/cswbcNq9ieGVtZ4VHiv1CcKRbV+2jCvOrCpaawxCsKToz4f+23oqKP9T4oslqUWh
	+DT9mPB6T3dglpOq9D9fR9b9nNL45/BSgfss+b+ZDMaubjDi2oiQCsA1tIY9KpQx+y6QculfTdG5c
	OK4h53NM7mFG0xTBoLB1GTQOBQSRiv3ThkMQJPS7Y/1R9sr33C/4OHNRlI3G3QbgWSzsqtiL0s+BR
	b2qm6+AGmDYcjAHc51vxGHZrTZiAZYnlQg7vn4q2FWBvQWX4sXwW7CosFAP3cdAYqX4eWQ8WyuePV
	JnsrrPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqJ-0000000AKOV-3C6a;
	Mon, 03 Nov 2025 16:55:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq7-0000000AK0P-0ofW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAF4A43C3D;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05F3C4CEFD;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188929;
	bh=zuhKLI7VX81K7N1waWG6RKB+bJ6LNUR7JqGCymcfMXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PozW+kgKZllTeNrjJv/g/u3+TzveJkdKg4AH1MNeKIqUai2wjCGyE9HC75KpQzCUo
	 ShNQVoIhJu4GBr4PfCnVuuYlKh73WxKEGJBksgu8Bbbotj7Wm8BWoojivw77ybZK9C
	 OvX3hmoDZjjEULrlBKm2xR67u+ct3bXXwWEd4tWog77UBJ4upYPRGWz4j/vcV8ypnK
	 DdA1DucsIF/nUobJ94ANjG6lXQArbeWMlvLrkiG/owFbj84CV0PBZ9tWKhVqsDJfyj
	 iZbghcPenDQWPguqNok/RpQMZVsyKakx1Cut8wuZYNT+KvF9EMEdO+Z88JzA+JUKYS
	 /CyEF7XVLuC1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq3-000000021VN-3LBp;
	Mon, 03 Nov 2025 16:55:27 +0000
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
Subject: [PATCH 13/33] KVM: arm64: GICv3: Extract LR computing primitive
Date: Mon,  3 Nov 2025 16:54:57 +0000
Message-ID: <20251103165517.2960148-14-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251103_085531_285921_94504D9D 
X-CRM114-Status: GOOD (  12.85  )
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

Split vgic_v3_populate_lr() into two, so that we have another
primitive that computes the LR from a vgic_irq, but doesn't
update anything in the shadow structure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 49 +++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 8f28227ae7193..ad5c0dbae2dfe 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -107,7 +107,7 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 }
 
 /* Requires the irq to be locked already */
-void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
+static u64 vgic_v3_compute_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq)
 {
 	u32 model = vcpu->kvm->arch.vgic.vgic_model;
 	u64 val = irq->intid;
@@ -154,6 +154,35 @@ void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	if (allow_pending && irq_is_pending(irq)) {
 		val |= ICH_LR_PENDING_BIT;
 
+		if (is_v2_sgi) {
+			u32 src = ffs(irq->source);
+
+			if (WARN_RATELIMIT(!src, "No SGI source for INTID %d\n",
+					   irq->intid))
+				return 0;
+
+			val |= (src - 1) << GICH_LR_PHYSID_CPUID_SHIFT;
+			if (irq->source & ~BIT(src - 1))
+				val |= ICH_LR_EOI;
+		}
+	}
+
+	if (irq->group)
+		val |= ICH_LR_GROUP;
+
+	val |= (u64)irq->priority << ICH_LR_PRIORITY_SHIFT;
+
+	return val;
+}
+
+void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
+{
+	u32 model = vcpu->kvm->arch.vgic.vgic_model;
+	u64 val = vgic_v3_compute_lr(vcpu, irq);
+
+	vcpu->arch.vgic_cpu.vgic_v3.vgic_lr[lr] = val;
+
+	if (val & ICH_LR_PENDING_BIT) {
 		if (irq->config == VGIC_CONFIG_EDGE)
 			irq->pending_latch = false;
 
@@ -161,16 +190,9 @@ void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 		    model == KVM_DEV_TYPE_ARM_VGIC_V2) {
 			u32 src = ffs(irq->source);
 
-			if (WARN_RATELIMIT(!src, "No SGI source for INTID %d\n",
-					   irq->intid))
-				return;
-
-			val |= (src - 1) << GICH_LR_PHYSID_CPUID_SHIFT;
-			irq->source &= ~(1 << (src - 1));
-			if (irq->source) {
+			irq->source &= ~BIT(src - 1);
+			if (irq->source)
 				irq->pending_latch = true;
-				val |= ICH_LR_EOI;
-			}
 		}
 	}
 
@@ -183,13 +205,6 @@ void vgic_v3_populate_lr(struct kvm_vcpu *vcpu, struct vgic_irq *irq, int lr)
 	if (vgic_irq_is_mapped_level(irq) && (val & ICH_LR_PENDING_BIT))
 		irq->line_level = false;
 
-	if (irq->group)
-		val |= ICH_LR_GROUP;
-
-	val |= (u64)irq->priority << ICH_LR_PRIORITY_SHIFT;
-
-	vcpu->arch.vgic_cpu.vgic_v3.vgic_lr[lr] = val;
-
 	irq->on_lr = true;
 }
 
-- 
2.47.3


