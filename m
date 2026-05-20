Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0927CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW/95UAqJVjJyk5NumyqoWPmDlgdsGENa/yA7wIIcgE=; b=yogf127Mp2VGwlucxdGwvUhheA
	JHAb4kI5PTxVPv2D6QBshhOmVU4gJ/YLpL1aEksLozxGmXLVoUlXZP+P9KSucLaEZSOg4GFcPjwYj
	vA9KxRzwpoxxLcGR0L14jTAVOHOGvUQgqHkPOwp4D4aabb24zi1Yg4fTqznNi76S4kN1dhlnEH+6W
	2/qBF+XnabZK5bOEs+RK8nqCCct8PEAUcccwLWFDNQCE7b60Uf4nCs1Qm3LPGoqcZPnaXc/VenqWE
	MM+14SQc/kXrxKYq8lmr0lGu9BqCx8YgDPjQMBTYxd8/z6rOPhCe3hAP0QtqtRz4sQ1F3hiH6+Dsu
	/NZLgV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdkg-00000004GP7-43WD;
	Wed, 20 May 2026 10:02:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPdkf-00000004GNj-1FTX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:02:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF01F60200;
	Wed, 20 May 2026 10:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EE21F0089A;
	Wed, 20 May 2026 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271328;
	bh=GW/95UAqJVjJyk5NumyqoWPmDlgdsGENa/yA7wIIcgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NMSUv7mqPt7A1IayyUvF6KomI0iJsvk6XugotWZlwKG0yAIjlQ9oSVke4Sh0sCWPt
	 Q+OBGnRZeF65CRE+d4wYfS8zxqhCfMuloq/BToviIWtY8N6GktARgC0Dm+bimkPfjS
	 y+1DXQtMGH5rHqrKNrXrWeQhsIi8+KY5rgmbWWHtKpqcGwaar0O+4LblXpPLon8jev
	 NPLcHtkrNaLW6z/ackQTwInGp8k+ByKHinSg3x9a5v7x5XT2Zi49J+LnM1eEyzf/sh
	 LhDjaOpd8WLNA70lmadykx5S2DGNmlHv7GHopyEaW/jIevqBy8VM+vw7hwmclFgqN/
	 cT2kL3HJ8z+jA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPdkc-00000004Jio-2wVN;
	Wed, 20 May 2026 10:02:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Deepanshu Kartikey <kartikey406@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v3 6/6] KVM: arm64: vgic-v2: Don't init the vgic on in-kernel interrupt injection
Date: Wed, 20 May 2026 11:02:00 +0100
Message-ID: <20260520100200.543845-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520100200.543845-1-maz@kernel.org>
References: <20260520100200.543845-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kartikey406@gmail.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

We how have the lazy init on three paths:

- on first run of a vcpu
- on first injection of an interrupt from userspace and irqfd
- on first injection of an interrupt from kernel space as
  part of the device emulation (timers, PMU, vgic MI)

Given that we recompute the state of each in-kernel interrupt
every time we are about to enter the guest, we can drop the lazy
init from the kernel injection path.

This solves a bunch of issues related to vgic_lazy_init() being called
in non-preemptible context, such as vcpu reset.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 1e9fe8764584d..9e29f03d3463c 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -534,11 +534,9 @@ int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
 {
 	struct vgic_irq *irq;
 	unsigned long flags;
-	int ret;
 
-	ret = vgic_lazy_init(kvm);
-	if (ret)
-		return ret;
+	if (unlikely(!vgic_initialized(kvm)))
+		return 0;
 
 	if (!vcpu && irq_is_private(kvm, intid))
 		return -EINVAL;
-- 
2.47.3


