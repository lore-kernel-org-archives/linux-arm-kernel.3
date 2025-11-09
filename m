Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8AFCD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6Lp7gCe+omuPtct51PzY/9oCUHrmI3Le+gyqqPCMyk=; b=qj0USQjtTm3HeHxpyRibh5P39y
	4GxQoy+j/Mfee80csR+Ua4yzMBTA0i7Yp1CDMmxA/K12QYomYAp12EqgTlbJ0xqza4rzlQiroGBBV
	if+Wdxpmi78fI2u0dH+ZV8tA091YQgUA08uJ036lzvXpYnzD3cRZPwbgxrqhanNyKpujPOreq0wHK
	I+MupIC3sfL+SOpart6+5bu9E8edvXGiqpsSf5xSVnB1nKcytgnVu3Go3n2x9kB/zeUFEJ4dtw7cE
	3dzL4rAuadVUCx3QP0Gjv5Y5+5/14SdV/W5cmHDOht71ia22o6J0nFRCjROUeQxKFgUiCZQ3dIs6d
	GUVwzAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91z-00000004CSe-3EJs;
	Sun, 09 Nov 2025 17:16:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91m-00000004CCO-3YLF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4130A60052;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEFBC2BCB2;
	Sun,  9 Nov 2025 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708593;
	bh=FMwu06lK7Q6CryDZ52WbXhfFTuUdJV55nVDRrDJIZtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VySJk9bWfs8XT1J6Dzik2ULj/DfMxue+CY+e/EQ8VW+LeJTm+vhMBFPBoii+6mc+o
	 tHcasjdSDmKlxbcfYqJK6ECXbXcOtPo1s+DGBgmUv3IAbMWZ/eLqOFn2B1s+xykMcc
	 G35VmZfy7zlIs7ZNv5BDriWQDJM3lBUWLbWWK7amNugtfWMSQLlO8E5o8JBsl5aLmS
	 NgWibEMpg7oI96cZkUdcaReVJFYS81WK0rBGl5C5j965XhXWBooQ9yDrO+aIDkR2+a
	 R9AWv7b+B8HFEtS6tvhVILzBPxWf2ymmlYoPu97qi/Z87zSFO3s9zw2FBpFrdt4G17
	 b1+icRzcp8VAg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91j-00000003exw-3nEt;
	Sun, 09 Nov 2025 17:16:31 +0000
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
Subject: [PATCH v2 15/45] KVM: arm64: GICv2: Decouple GICH_HCR programming from LRs being loaded
Date: Sun,  9 Nov 2025 17:15:49 +0000
Message-ID: <20251109171619.1507205-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
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

Not programming GICH_HCR while no LRs are populated is a bit
of an issue, as we otherwise don't see any maintenance interrupt
when the guest interacts with the LRs.

Decouple the two and always program the control register, even when
we don't have to touch the LRs.

This is very similar to what we are already doing for GICv3.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 5cfbe58983428..a0d803c5b08ae 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -430,22 +430,25 @@ static void save_lrs(struct kvm_vcpu *vcpu, void __iomem *base)
 
 void vgic_v2_save_state(struct kvm_vcpu *vcpu)
 {
+	struct vgic_v2_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v2;
 	void __iomem *base = kvm_vgic_global_state.vctrl_base;
 	u64 used_lrs = vcpu->arch.vgic_cpu.vgic_v2.used_lrs;
 
 	if (!base)
 		return;
 
-	if (used_lrs) {
-		if (vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr & GICH_HCR_LRENPIE) {
-			u32 val = readl_relaxed(base + GICH_HCR);
 
-			vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr &= ~GICH_HCR_EOICOUNT;
-			vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr |= val & GICH_HCR_EOICOUNT;
-		}
+	if (used_lrs)
 		save_lrs(vcpu, base);
-		writel_relaxed(0, base + GICH_HCR);
+
+	if (cpu_if->vgic_hcr & GICH_HCR_LRENPIE) {
+		u32 val = readl_relaxed(base + GICH_HCR);
+
+		cpu_if->vgic_hcr &= ~GICH_HCR_EOICOUNT;
+		cpu_if->vgic_hcr |= val & GICH_HCR_EOICOUNT;
 	}
+
+	writel_relaxed(0, base + GICH_HCR);
 }
 
 void vgic_v2_restore_state(struct kvm_vcpu *vcpu)
@@ -458,13 +461,10 @@ void vgic_v2_restore_state(struct kvm_vcpu *vcpu)
 	if (!base)
 		return;
 
-	if (used_lrs) {
-		writel_relaxed(cpu_if->vgic_hcr, base + GICH_HCR);
-		for (i = 0; i < used_lrs; i++) {
-			writel_relaxed(cpu_if->vgic_lr[i],
-				       base + GICH_LR0 + (i * 4));
-		}
-	}
+	writel_relaxed(cpu_if->vgic_hcr, base + GICH_HCR);
+
+	for (i = 0; i < used_lrs; i++)
+		writel_relaxed(cpu_if->vgic_lr[i], base + GICH_LR0 + (i * 4));
 }
 
 void vgic_v2_load(struct kvm_vcpu *vcpu)
-- 
2.47.3


