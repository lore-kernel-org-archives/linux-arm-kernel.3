Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145C7CF9C7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYry40lPHoJEwz48H69ESQrwX5dKurdaEx9MKWYNhBg=; b=ZfqDx/WoPrdr4w7SkK1ZrF2Cam
	Vv75njuU3zV0x+PJgP/p/eGSSvUYzcYmL3+Y4cEzixgRqLJeElO1WtLr/9a2RdnQuhWd4gEKHh/Vs
	bHrBwwVmfbw97sWYeWx4L+CxqMv4jrAqeN5cCkDAuoTi3heFAtTLJpFQ4iGcNvqROklcxWVPY8CDb
	NK05IefQJYy/lQAmXK9DNhYNTGw3sd49FJpvQNCMRD1Jg+2yKuifcYHvYE3XgtRsi+ssfEDBVDCRC
	IzyDTEN7XS5Hlov78qvK4dIMA/i+YQ2PngjX7GAL5kYKNoSRTDwj6ijTbm16h7ED0hi+PtG7hepLT
	zJ8fvlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QE-000000075yZ-0RPG;
	Thu, 20 Nov 2025 17:26:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Px-000000075ZQ-3D1F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A197B4444E;
	Thu, 20 Nov 2025 17:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84967C116C6;
	Thu, 20 Nov 2025 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659561;
	bh=mCUOPrHWsZgohB19bFMPYL0p1tQzBnSsAdKuz7R2y/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEPDQrVauUkMMHNLlUK8x44kXa+Y9QaLHWuA/TrJAce66E+KPuouXd/FT/GGlBoeu
	 8JMPGZ5DDoePMp16iK+Nf9flaNRFEdt/F8iwR+vVhg8fy8QM3gfG7YuENgr9Rdpr0D
	 A9Vm7XxmE8V2tdHgyqvBXC6IraJLU+FqIHfHV1tpq/fcdVx6YOcEhJO9NmGmG45ckk
	 0RfHNFTNuLVNp4myJEO2r4IKdl+jwAaC+NfbYRgNnvl9vTxIlGmC6dM+HJxEq2IJtD
	 PsuKQK43OCAxbvRueHOIVVnECw1MteJ6mjqCzOOX2tyvaaLoQVs8zcZTNej+aDm4Cm
	 xvds7A7tTz0OQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pv-00000006y6g-2vNt;
	Thu, 20 Nov 2025 17:25:59 +0000
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
Subject: [PATCH v4 24/49] KVM: arm64: Invert ap_list sorting to push active interrupts out
Date: Thu, 20 Nov 2025 17:25:14 +0000
Message-ID: <20251120172540.2267180-25-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_092601_872443_816BFFC3 
X-CRM114-Status: GOOD (  14.50  )
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

Having established that pending interrupts should have priority
to be moved into the LRs over the active interrupts, implement this
in the ap_list sorting.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 004010104659a..c7a5454ac4c9f 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -270,10 +270,7 @@ struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq)
  * well, the first items in the list being the first things populated in the
  * LRs.
  *
- * A hard rule is that active interrupts can never be pushed out of the LRs
- * (and therefore take priority) since we cannot reliably trap on deactivation
- * of IRQs and therefore they have to be present in the LRs.
- *
+ * Pending, non-active interrupts must be placed at the head of the list.
  * Otherwise things should be sorted by the priority field and the GIC
  * hardware support will take care of preemption of priority groups etc.
  *
@@ -298,21 +295,21 @@ static int vgic_irq_cmp(void *priv, const struct list_head *a,
 	raw_spin_lock(&irqa->irq_lock);
 	raw_spin_lock_nested(&irqb->irq_lock, SINGLE_DEPTH_NESTING);
 
-	if (irqa->active || irqb->active) {
-		ret = (int)irqb->active - (int)irqa->active;
-		goto out;
-	}
+	penda = irqa->enabled && irq_is_pending(irqa) && !irqa->active;
+	pendb = irqb->enabled && irq_is_pending(irqb) && !irqb->active;
 
-	penda = irqa->enabled && irq_is_pending(irqa);
-	pendb = irqb->enabled && irq_is_pending(irqb);
+	ret = (int)pendb - (int)penda;
+	if (ret)
+		goto out;
 
-	if (!penda || !pendb) {
-		ret = (int)pendb - (int)penda;
+	/* Both pending and enabled, sort by priority (lower number first) */
+	ret = (int)irqa->priority - (int)irqb->priority;
+	if (ret)
 		goto out;
-	}
 
-	/* Both pending and enabled, sort by priority */
-	ret = irqa->priority - irqb->priority;
+	/* Finally, HW bit active interrupts have priority over non-HW ones */
+	ret = (int)irqb->hw - (int)irqa->hw;
+
 out:
 	raw_spin_unlock(&irqb->irq_lock);
 	raw_spin_unlock(&irqa->irq_lock);
-- 
2.47.3


