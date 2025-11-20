Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B02CF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VNjKKYdvGSPJ+o6DEmkrFrDiqHJH8L19UWT0dbLjKw=; b=bTVmId8jBVrSUvipuxCEnhL/Fh
	75Tx7mluLac1EFAVfFN3ojP9W7DnM0aBEHMfTPWFR4/WvDkbS6xT5Uc6qMetCM7V7eSjXeEMfeqOb
	OLztA7xwwF14E+SkQEANbgypxW+iBIDWKmu/Mnu5yyXEKILtxVh9LjKpp5iu4TFyQJpwFqMftyN65
	YxWNVVnVXxv73kfEtExIPjjWBtIJd59DNRgJu/ay9u/rRC/H+BtvmO4wC5ETYSvuVBLl7B2eeTMPL
	IBf4KKBR1KPXxAMuzPd+V/wE64SPI8aH3V7A/JoRVcC9v5BJhn/uK+WEQJG++PM4GD6BWqsg8ESjK
	d/J2D1gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QN-000000076Ig-2BDL;
	Thu, 20 Nov 2025 17:26:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q0-000000075Zw-1rhA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56001443E4;
	Thu, 20 Nov 2025 17:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35494C19423;
	Thu, 20 Nov 2025 17:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659564;
	bh=wdtlW7oExSxObQ4jKYqfqHWLDRMqqpy/Zk8W2VvDjQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W9ltta9nazT3SQ2ZamyMQlAZ+yuH6hyU5zlXNJ07C7fm45he3Q/Xv1bSNq0GVlbzy
	 X2af6GKESAGI7dhS+cj0/+wkk/wUA5Q6XvhABLqIIM0pTwyqLnbBzvIWtRnIq3uqpm
	 C6TACMU+Z7K1tAJP5l7qVb05FN4CmQLDd7tcrJoScrUKFbu05u5egwM6D9Id/e4Uo1
	 +zH8vxJF/LaBOWEbnH82oMGkciCUGV8CNn1w92trWhE0mJOyLF3mcnvrULmXBSOTC4
	 3ffwG1KsFpDBXIB6IkA5vZVF1evq3dTH8xbOA2NZyuUegeeiVqulPjL6hB8Di5bVwi
	 ZBNx2qB0kEQcQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Py-00000006y6g-1qDX;
	Thu, 20 Nov 2025 17:26:02 +0000
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
Subject: [PATCH v4 35/49] KVM: arm64: GICv3: nv: Plug L1 LR sync into deactivation primitive
Date: Thu, 20 Nov 2025 17:25:25 +0000
Message-ID: <20251120172540.2267180-36-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_092604_535392_2E61A379 
X-CRM114-Status: GOOD (  13.27  )
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

Pretty much like the rest of the LR handling, deactivation of an
L2 interrupt gets reflected in the L1 LRs, and therefore must be
propagated into the L1 shadow state if the interrupt is HW-bound.

Instead of directly handling the active state (which looks a bit
off as it ignores locking and L1->L0 HW propagation), use the new
deactivation primitive to perform the deactivation and deal with
the required maintenance.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 40f7a37e0685c..15e7033a7937e 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -280,7 +280,6 @@ void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
 
 	for_each_set_bit(i, &shadow_if->lr_map, kvm_vgic_global_state.nr_lr) {
 		u64 val, host_lr, lr;
-		struct vgic_irq *irq;
 
 		host_lr = __gic_v3_get_lr(lr_map_idx_to_shadow_idx(shadow_if, i));
 
@@ -290,7 +289,14 @@ void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
 		val |= host_lr & ICH_LR_STATE;
 		__vcpu_assign_sys_reg(vcpu, ICH_LRN(i), val);
 
-		if (!(lr & ICH_LR_HW) || !(lr & ICH_LR_STATE))
+		/*
+		 * Deactivation of a HW interrupt: the LR must have the HW
+		 * bit set, have been in a non-invalid state before the run,
+		 * and now be in an invalid state. If any of that doesn't
+		 * hold, we're done with this LR.
+		 */
+		if (!((lr & ICH_LR_HW) && (lr & ICH_LR_STATE) &&
+		      !(host_lr & ICH_LR_STATE)))
 			continue;
 
 		/*
@@ -298,14 +304,7 @@ void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
 		 * need to emulate the HW effect between the guest hypervisor
 		 * and the nested guest.
 		 */
-		irq = vgic_get_vcpu_irq(vcpu, FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
-		if (WARN_ON(!irq)) /* Shouldn't happen as we check on load */
-			continue;
-
-		if (!(host_lr & ICH_LR_STATE))
-			irq->active = false;
-
-		vgic_put_irq(vcpu->kvm, irq);
+		vgic_v3_deactivate(vcpu, FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
 	}
 
 	/* We need these to be synchronised to generate the MI */
-- 
2.47.3


