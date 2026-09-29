Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8E0CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6sEMz+sle2+vRKQR9x7yi93xoB+ZcFnzxRhK6q+PUo=; b=rtFQfc/L9UOGuVw3QurmUse2mb
	E830fye0znby26VzQHWZcrkXM7vCOzWPEQk92TqvR/MabjoNwWXQZIZbQU/nHDJCbgn0yuzzSGIFv
	AgZE28ilGPBzfB/kzB/Mz5y6bqEmTOAZTeJL6gjw8kO+TDUWkqBLMzLhEbBupxUOPHq5/HlaKZVGe
	2miNF587iOsjZwt0e5+TRLHjhxpGoDt5dGGfFUhUQeenrAS7h91hs44w/SEJWymk8x45VQBMdTsDj
	HinHNO+uoeJ/yxSQlKL7p65NL080aq/CIg8+qDiMm/noQsFFglflmjzgR5uRsd+Ic4Z5rKbdXM9rp
	YkN44c7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUHN-00000002zDo-34MN;
	Tue, 29 Sep 2026 09:37:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUGQ-00000002yje-1vVG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:36:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCFF660136;
	Tue, 29 Sep 2026 09:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821E61F0089A;
	Tue, 29 Sep 2026 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790674601;
	bh=f6sEMz+sle2+vRKQR9x7yi93xoB+ZcFnzxRhK6q+PUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UYI23eZt/xXaG0hcQNuVsIHd5hhQ2VDuJyUpjdaWB9A+uDuqTVObPko0oGFhFZEy+
	 wDAV4q0TvbqUWta/xzGFvg9sVur3hAWD5y7/dHotJoSpUYiXiVgnMh4XwASpsIPri3
	 gClEEyIdWWeEi6SuOr32JNO5aKyQYxh2wjWFD5MHMj9h/fs7UMkVVVyJr7edNs6yIu
	 UCgZAOzmlKblV3zMzqnrtjznj+vqOKSBOOS7/csVIXUrFqA4ZXDKEbXEGKnA/uZdAd
	 QJCmK0QMl/SYqAMVvpP1umYKfB5s9BQYFTUJLnF9Kl3vk3ZicUWlw4Nn2u+A1ZWAzI
	 bKzOVxo0lc+zw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xBUGN-0000000ElEa-3EdP;
	Tue, 29 Sep 2026 09:36:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 6/7] KVM: arm64: vgic-its: Fix MOVALL handling of source redistributor
Date: Tue, 29 Sep 2026 10:35:47 +0100
Message-ID: <20260929093548.3598547-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929093548.3598547-1-maz@kernel.org>
References: <20260929093548.3598547-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ndaugoing@gmail.com, stable@vger.kernel.org
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

The MOVALL command moves the pending state of all LPIs targeting a given
redistributor to another one. However, we seem to have lost the
filtering on the source RD, which means we move all LPIs to the target.

Not quite what the spec mandates.

Hack update_affinity() to take an optional source vcpu that is used as a
filter when non-NULL, restoring the filtering that was performed by
vgic_copy_lpi_list() back in the days.

Fixes: 11f4f8f3e6e06 ("KVM: arm64: vgic-its: Walk LPI xarray in vgic_its_cmd_handle_movall()")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/vgic/vgic-its.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 9e782a4fea7e5..cc02d9b62bd95 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -319,12 +319,16 @@ static int update_lpi_config(struct kvm *kvm, struct vgic_irq *irq,
 	return ret;
 }
 
-static int update_affinity(struct vgic_irq *irq, struct kvm_vcpu *vcpu)
+static int update_affinity(struct vgic_irq *irq,
+			   struct kvm_vcpu *from_vcpu, struct kvm_vcpu *vcpu)
 {
 	struct its_vlpi_map map;
 	int ret;
 
 	guard(raw_spinlock_irqsave)(&irq->irq_lock);
+	if (from_vcpu && irq->target_vcpu != from_vcpu)
+		return 0;
+
 	irq->target_vcpu = vcpu;
 
 	if (!irq->hw)
@@ -362,7 +366,7 @@ static void update_affinity_ite(struct kvm *kvm, struct its_ite *ite)
 		return;
 
 	vcpu = collection_to_vcpu(kvm, ite->collection);
-	update_affinity(ite->irq, vcpu);
+	update_affinity(ite->irq, NULL, vcpu);
 }
 
 /*
@@ -856,7 +860,7 @@ static int vgic_its_cmd_handle_movi(struct kvm *kvm, struct vgic_its *its,
 
 	vgic_its_invalidate_cache(its);
 
-	return update_affinity(ite->irq, vcpu);
+	return update_affinity(ite->irq, NULL, vcpu);
 }
 
 static bool __is_visible_gfn_locked(struct vgic_its *its, gpa_t gpa)
@@ -1383,7 +1387,7 @@ static int vgic_its_cmd_handle_movall(struct kvm *kvm, struct vgic_its *its,
 		if (!irq)
 			continue;
 
-		update_affinity(irq, vcpu2);
+		update_affinity(irq, vcpu1, vcpu2);
 
 		vgic_put_irq(kvm, irq);
 	}
-- 
2.47.3


