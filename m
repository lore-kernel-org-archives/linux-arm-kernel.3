Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81196CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n1eaaaLhHfOFbxAJagGnDrxVIWvFH1LsKNYnm8c+v3M=; b=hIVaKnrqnJSV8V6xCHh2soNBG9
	g48pKda39WvHziXYtQMVoMza8hEtJ/Fcw9qrUujENiIiiVerYgmPFtxVjGePNI7pDmbfpQv05vffA
	y2JmlnArKjvg85OG6dn00cbl4ZUnOOAgJdspc4Jh+eBZgvomuOwgx29CAODn79d6CYPFCnJO5MmTE
	r8WxDmhPA904tfctLMkHXyheKpvX6dO9gAPF7qFe259yOVcHznETAncw7kB/63UtwbV2bvByLPzD3
	jqRaMc9fzA3VvQgEK2JA0gBsObVbBu9B8o24Z0WCEd5BG3yq1tJAd7scujTIRNYLy6i5PzhU1uZR0
	9/R0WBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBrX-0000000EiXc-0Uia;
	Mon, 15 Jun 2026 18:16:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBrW-0000000EiXU-0FcS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 18:16:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 604A442ACB;
	Mon, 15 Jun 2026 18:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423E81F000E9;
	Mon, 15 Jun 2026 18:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781547401;
	bh=n1eaaaLhHfOFbxAJagGnDrxVIWvFH1LsKNYnm8c+v3M=;
	h=From:To:Cc:Subject:Date;
	b=UvnOPzvN76/moeBApU72HK7x5mIN+qxqSJRw6nO6E20ymNPinnLpqicky+C69tMmr
	 a0l2Vd3YpJRp4NR3W2O0m/cpiWK8pgt7OrVksP6uR6LF7Bbk4cZRWN9i0JX5xQE6ik
	 WIjAHYK2Hbmv8WPl9xBbehG8xKP7gPXwV2X/WM/KVW92UY/eD75gv4oIs/t0pA7SUc
	 fXZs06tsBvbOdAvOz9GnU5+zr4n1LBKghy7j3xPcx5bEcVc/7xv4hhh74BuTz2/M1x
	 TPZtqN6QBhJcNlWXqN/25Ep69tfLS3NlkX6OVPxGaS0AVjtQlQLu3RtqRB15U9cr8n
	 wi9epXyovYl8Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wZBrS-0000000D2dy-33YN;
	Mon, 15 Jun 2026 18:16:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: [PATCH] KVM: arm64: Handle race between interrupt affinity change and LPI disabling
Date: Mon, 15 Jun 2026 19:16:25 +0100
Message-ID: <20260615181625.3029352-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, imv4bel@gmail.com
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

Hyunwoo Kim reports some really bad races should the following
situation occur:

- LPI-I is pending in vcpu-B's AP list
- vcpu-A writes to vcpu-B's RD to disable its LPIs
- vcpu-C moves I from B to C

If the last two race nicely enough, vgic_prune_ap_list() can drop
the irq and AP list locks, reacquire them, and in the interval
the irq has been freed. UAF follows.

The fix is two-fold:

- Before dropping the irq and ap_list locks, take a reference on
  the irq

- Do not try to handle migration of the pending bit: there is no
  expectation that this state is retained, as per the architecture

With that, we're sure that the interrupt is still around, and we
safely remove it from the AP list as it has no target at this
stage (unless another interrupt fires, but that's another story).

Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
Tested-by: Hyunwoo Kim <imv4bel@gmail.com>
Link: https://lore.kernel.org/r/ailsCnyoS82r_QRz@v4bel
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 5a4768d8cd4f3..70a161383e5a6 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -203,6 +203,7 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
 	list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list) {
 		if (irq_is_lpi(vcpu->kvm, irq->intid)) {
 			raw_spin_lock(&irq->irq_lock);
+			irq->pending_latch = false;
 			list_del(&irq->ap_list);
 			irq->vcpu = NULL;
 			raw_spin_unlock(&irq->irq_lock);
@@ -792,7 +793,11 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
 			continue;
 		}
 
-		/* This interrupt looks like it has to be migrated. */
+		/*
+		 * This interrupt looks like it has to be migrated,
+		 * make sure it is kept alive while locks are dropped.
+		 */
+		vgic_get_irq_ref(irq);
 
 		raw_spin_unlock(&irq->irq_lock);
 		raw_spin_unlock(&vgic_cpu->ap_list_lock);
@@ -836,6 +841,8 @@ static void vgic_prune_ap_list(struct kvm_vcpu *vcpu)
 		raw_spin_unlock(&vcpuB->arch.vgic_cpu.ap_list_lock);
 		raw_spin_unlock(&vcpuA->arch.vgic_cpu.ap_list_lock);
 
+		deleted_lpis |= vgic_put_irq_norelease(vcpu->kvm, irq);
+
 		if (target_vcpu_needs_kick) {
 			kvm_make_request(KVM_REQ_IRQ_PENDING, target_vcpu);
 			kvm_vcpu_kick(target_vcpu);
-- 
2.47.3


