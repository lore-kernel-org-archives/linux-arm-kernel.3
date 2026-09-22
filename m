Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5517BC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgWgUyqIwCZYbNJUU+AhLYr08CuhiyxlVws3w1/8zMY=; b=IaKb7BVs998sj0XONpEQsh4uGj
	XVRXHnyH5whmThXFCop7IwedG5wRwmc9hhzrS61TRA9XTH2UaNN7UBXPRWtV0Y0S1Ceha1VT40OzF
	vNTmdru+8LS84ey4i3+Y6Tj5DMvBH78yeaFsuuQE7TmjUho+kNf9WF3vwWaIwnW3Q1tg8S4d7JBBB
	/Njvi8BDBPCSvvFG5sFvR9eM2jfgifWPnjfp7r05BSNRYa0xn/sglhNDtPOe5IXqPXrbUmhwBtTbM
	nQM2UWVw9vnxwOmZ7OBU4olaHUvM2+lB6yYtWXvkkasLDWMUVSuC1AlwLpbdV+7+Y4BzaOp6hUk3Z
	zuFjy0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98GC-00000006dXm-1A3a;
	Tue, 22 Sep 2026 21:42:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98Ft-00000006dP9-4BYA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:42:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21EB6601F1;
	Tue, 22 Sep 2026 21:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05451F00898;
	Tue, 22 Sep 2026 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790113344;
	bh=WgWgUyqIwCZYbNJUU+AhLYr08CuhiyxlVws3w1/8zMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZA9IoTucmEh77KQE0eJA+F0FHx+KViU90m+ScvETxxmrXWfXCRyvSltp7Xiak3Etz
	 zHQL6jMUh95Am3D0uuHDqvcXwaEZVlYCV3YawJZQzdhtiSXryKn1Ml7EaxwBjIBu7W
	 QMlwMvGdu/Xr4wgDVDrynvabc1psbXd4aosfKYlQC27/5vYz+ded8nk0ou4KtebNwG
	 bAOFw9qZmtKv2GLMpBcgV0PNjuH00pfFLdEgkagc4seMjm7cxSb26vnCbJuURmSg9E
	 0qq+Ijaifn3wQxwlP6faD34/8vfQh8UkzrKPHVxrskp8u0tRzPm8cZE/7uUAmrLr1X
	 RQPNVPGBOr+MA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x98Fq-0000000CFxJ-3cul;
	Tue, 22 Sep 2026 21:42:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 2/3] KVM: arm64: vgic: Take a refcount on IRQs referenced by last_lr_irq
Date: Tue, 22 Sep 2026 22:42:11 +0100
Message-ID: <20260922214212.3327146-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922214212.3327146-1-maz@kernel.org>
References: <20260922214212.3327146-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ndaugoing@gmail.com
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

Referencing the last interrupt inserted in an LR is rather fragile, as
this interrupt can vanish if a concurrently unmapped LPI.

Solve this by bumping up the refcount on the interrupt when populating
last_lr_irq, and drop it at vgic_prune_ap_list() time, when LPIs are
being reclaimed.

Fixes: 6da5e537f5afe ("KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail")
Reported-by: Yuchao Zhang <ndaugoing@gmail.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/vgic/vgic.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 425503e0c5825..5cf5a1ef86cdd 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -853,6 +853,17 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
 		goto retry;
 	}
 
+	/*
+	 * Fix the last_lr_irq refcount which was obtained while
+	 * populating the LRs. This can also result in the LPI being
+	 * deleted.
+	 */
+	irq = *host_data_ptr(last_lr_irq);
+	if (irq) {
+		deleted_lpis |= vgic_put_irq_norelease(vcpu->kvm, irq);
+		*host_data_ptr(last_lr_irq) = NULL;
+	}
+
 	raw_spin_unlock(&vgic_cpu->ap_list_lock);
 
 	if (unlikely(deleted_lpis))
@@ -1018,8 +1029,10 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 		scoped_guard(raw_spinlock,  &irq->irq_lock) {
 			if (likely(vgic_target_oracle(irq) == vcpu)) {
 				vgic_populate_lr(vcpu, irq, count++);
-				if (count == kvm_vgic_global_state.nr_lr)
+				if (count == kvm_vgic_global_state.nr_lr) {
+					vgic_get_irq_ref(irq);
 					*host_data_ptr(last_lr_irq) = irq;
+				}
 			}
 		}
 
-- 
2.47.3


