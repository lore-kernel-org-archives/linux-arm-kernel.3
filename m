Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC2FCF9C7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOy6TqEI98Qe7wBXitt9qHC/gfGdt7LQu57fGURHGOo=; b=Z0PSoU6y25rBgTswRhIBQXwL7N
	FfMbyLKNQADtGpZCskcFMtaCOTdLnlo52hya95WbE7eVFP5vPoh2+7YxfbB+u2SU9/nM9ErflZu8h
	RKhYH0sJ0YALvxkhu0arZAqcxkrUfQEOY5nUDjYo7l+KcvJtP/EiHrr5e8gRFaLvLZ8TZ7hLLo/cY
	PSSt3UbhBEPQAk4riPViCCE7ddA4EocxnNS7ZzRTNXHBzfJ//z8dMBKbgdQuPsD+Q8WXllNwMwggP
	wGk31TdLFzHZVOAnxNqe7bIBH/pldUSpBpoZalOmcKiu7t6I+UfvgSqeGUz/Iq3n40mFTNlVioZoR
	EqcdIidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8SZ-000000078uF-0cDV;
	Thu, 20 Nov 2025 17:28:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q7-000000075kF-22jS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Nov 2025 17:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BOy6TqEI98Qe7wBXitt9qHC/gfGdt7LQu57fGURHGOo=; b=b5HyKgp62zUqGltu6WI+TVWntc
	fsatweMH0v603vL2Ein+uRCNul8w0TPAuutU4oOzJjbnfHswpvhgH7EnuIlrg4NvhEo/BLv5OHR2T
	5fbrYziPjD7Oz6vaOEkY6stol8EL9NyCcQQ3U54vz7KXvZOhr7f96ieKbYUkiCCP/PIL3ZYxqj6of
	xxqTcg7VtG83m3xLlHoYu0K8Lyq9ovgrf6ji4M0SxtEjMXh2pZs4Eyh7cr0OG0Jgg1R9+2Q6b0BZI
	fZKOhGrjmY/CeZDsKPZz4ZHXVLmiyMh3MdpkBe8C1z/4JgX/XMUPqbXxxs31/8g9CiFUh8kw95u5s
	zFT8kapA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7YP-0000000F6ei-1QSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A4E144287;
	Thu, 20 Nov 2025 17:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A776C16AAE;
	Thu, 20 Nov 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659559;
	bh=GJuikNEiM9aYP/YLsdMUrKCS8u0NoKs6DKQCFgpx0+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tyDE/IIpI1etUWtXxneew0sNRZ5d+61WZbmhdnp5cecxlZiOkGqip40IaDEIghM55
	 ccC/VtiWPqDsUJue0NWb3T8ME26Y5KY4pAXnU7xYVEDGpAWulBxZtpOng0OIenO/XV
	 zyOiNl6SQIEiHA23b6C7DjUO9pJTrh1h7AP1v6/O50t2DIeXhmqv9TYBlYlKyLBefm
	 0No+9cfjTrnUv4W9ecYF+rbC8I8tyiQzip/aW5Lsr6ArmQ33JqRafUfLh+qsxH3yiY
	 r3uY65IGGPf+icUXheVKsfC66FVDd2hcF5PPxyPlQFVQLS7zOLDW1JKmyOSbZbnw+Y
	 N3RNMJWFyOW4A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pt-00000006y6g-0zBq;
	Thu, 20 Nov 2025 17:25:57 +0000
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
Subject: [PATCH v4 14/49] KVM: arm64: GICv3: Extract LR computing primitive
Date: Thu, 20 Nov 2025 17:25:04 +0000
Message-ID: <20251120172540.2267180-15-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_163043_273915_A5FB5FF6 
X-CRM114-Status: GOOD (  12.91  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 49 +++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 6b7d7b4048f03..bcce7f35a6d67 100644
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


