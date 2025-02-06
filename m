Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDEEC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMj8WKQtw2NnS6B9DO9gDH0UzdVO07zJ1hnAbUg5rEk=; b=w0tfyRN8w3NRe03vBGeLcDpiTX
	WiK0VsHNpiBnN64VamRP+ewqKiGLyWzxXkU7B/pOc7EFctN78Az8ukTvYBSPXACkGhig1PTN5Y5t1
	gue1NMi1XA0r/TYSsNj4FrZ7U/UlsnT2wui9eUYzQaHeKsefbfAnFwR9CRiDbzOEwGqSPp6YOHfOo
	KWRkiz7TSUxA/V5b3mbmxmouG5ZYhhit3KmlTl1K4nVRhcAvu7xd06VIJhk4kYMUnwFfhithUsvU4
	+Pd/nBUPDQkv78XGtWNf660XQSNSB8dZGa5MosNGfRtsYDlnox02hu4xMxtlXB5uc9yqK6DTvJjHg
	+F7nL6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3jX-00000006hQC-2v6W;
	Thu, 06 Feb 2025 15:24:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3gp-00000006h98-1E21
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 125DBA439C0;
	Thu,  6 Feb 2025 15:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35D4C4CEDD;
	Thu,  6 Feb 2025 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738855273;
	bh=R18buuzsuS125/Odab8HVwhiAwt8pdMFSvfHK7BgPUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or1/UO5XwRfczye/Xg3Gq9snuMNbD5/7D8mXMHJadtD4gAdT5tCRPNYqcWLDwAtVb
	 NQ0kdre2iz6RvesgTbw0NYtZIWCbkZ4LIea/r7sDruoUwy4xRgC3IeT7MIWnpNrLFG
	 ntGemeTwGuUEI/1VAJJLP0jfYj64zmMV9sVHbmXFEu2e9vHZAqj/dL/3AC1GcaCZcg
	 lFpn0Ty1llhSJveVbEjhW75q6PkA2NnqHkSsWwHzN3V+GEJlFn8TH+l+rtE9fpexRk
	 CO9ail4A1mn6LfqTp+DbzcwTtHWRVzidv1M2oGPmV0aBG0tUwZs9oAHVij9HnSD8T1
	 Q2Sgka8EvM1hQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg3gk-001Axu-JW;
	Thu, 06 Feb 2025 15:21:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/3] KVM: arm64: vgic: Check for unallocated PPI/SPI arrays
Date: Thu,  6 Feb 2025 15:20:59 +0000
Message-Id: <20250206152100.1107909-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206152100.1107909-1-maz@kernel.org>
References: <20250206152100.1107909-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, glider@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_072115_394138_3517BF16 
X-CRM114-Status: GOOD (  11.72  )
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

Alexander's fuzzing has exhibited a large variety of races that
all end-up with taking the address of a PPI or SPI structure while
the vgic was torn down (because nuking it is only an ioctl() away,
and syzkaller is amazing at finding holes).

In order to preserve some sanity, always evaluate whether the array
containing the PPI/SPI is allocated.

Suggested-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index cc8c6b9b5dd8b..f454cef59e24b 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -89,6 +89,8 @@ struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid)
 	/* SPIs */
 	if (intid >= VGIC_NR_PRIVATE_IRQS &&
 	    intid < (kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS)) {
+		if (unlikely(!kvm->arch.vgic.spis))
+			return NULL;
 		intid = array_index_nospec(intid, kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS);
 		return &kvm->arch.vgic.spis[intid - VGIC_NR_PRIVATE_IRQS];
 	}
@@ -107,6 +109,8 @@ struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid)
 
 	/* SGIs and PPIs */
 	if (intid < VGIC_NR_PRIVATE_IRQS) {
+		if (unlikely(!vcpu->arch.vgic_cpu.private_irqs))
+			return NULL;
 		intid = array_index_nospec(intid, VGIC_NR_PRIVATE_IRQS);
 		return &vcpu->arch.vgic_cpu.private_irqs[intid];
 	}
-- 
2.39.2


