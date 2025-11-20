Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7A0CF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axX75R/Jt/ESwsvL848OmQhp8ackwBHCnbjW2Li5/Dw=; b=DGbhDj1viSo672XBkxz1gz6gLA
	cblTUsyaduEzbHDUGB+YJVrRGbs9kuPeLlkWxKc6hslUD0IDr0wAgM9KwmZ1vyyJIFpxIMDTfYCLD
	vyIz9DcpByL79sYcIdFcsd45BKHZ/aJKu/VLoUN5saxXOA8qn4n1TPxvdW9CLrZOVey7Krk/m3Aoo
	wMucl+KcoDKHM0wuodQWsFwysHYDSmvHo10IzDjXhM4LGO/8irqc9U5mApPcQWT/7b+amDBHAO1N7
	vK+My/q9tiA0Z8Y8sJ/oCjtjDqySU95a5KwlacIPcBKHqgS3LhV7gxwwLOp++knOw+M+XHzOXyvlA
	sSbGYB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q8-000000075mR-2anF;
	Thu, 20 Nov 2025 17:26:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pv-000000075aI-1Aer
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5BA9601E7;
	Thu, 20 Nov 2025 17:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCE5C116C6;
	Thu, 20 Nov 2025 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659558;
	bh=yYpe3ZiXdu0kQ382PoQuTzOmEcqd+Y4/E7xAIiyvr0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/yz4Tv/3FTYweByKSMq3BQxadKiZ7enrNxDz8jMyBdoJf5NUNCpg8+Okrf1Cfnrj
	 l83DYxc836/AfAd0Ep12VbkhfTGHPhOrDa3EipNWSXvrhBN/o/ifoEc49SPUziXnGE
	 /Q9H1tAvgmmvuTjXO62BHo0Caj/KaVNK/eQa9EdiQuOCVNke/Jqyxc0KjzV1GEuiTi
	 jpwHSKaJeoj2L4Sn+KWYkMqhcssJ7pHKdXaBd8Fjz5f+vdpL6v4DuvNhv/EtUpVrfc
	 GZUSZGFma4xTyS0mk5AKE0MCaH9Hhc1KC7iKbaJdCRX5Gi1EwwY9wtfKQtNZ9TP1IW
	 dLh2Eh/YLWe6Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Ps-00000006y6g-319A;
	Thu, 20 Nov 2025 17:25:56 +0000
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
Subject: [PATCH v4 12/49] KVM: arm64: GICv3: Decouple ICH_HCR_EL2 programming from LRs
Date: Thu, 20 Nov 2025 17:25:02 +0000
Message-ID: <20251120172540.2267180-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

Not programming ICH_HCR_EL2 while no LRs are populated is a bit
of an issue, as we otherwise don't see any maintenance interrupt
when the guest interacts with the LRs.

Decouple the two and always program the control register, even when
we don't have to touch the LRs.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 9bfcbfd91118a..2509b52bbd629 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -219,20 +219,12 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 		}
 	}
 
-	if (used_lrs || cpu_if->its_vpe.its_vm) {
+	if (used_lrs) {
 		int i;
 		u32 elrsr;
 
 		elrsr = read_gicreg(ICH_ELRSR_EL2);
 
-		if (cpu_if->vgic_hcr & ICH_HCR_EL2_LRENPIE) {
-			u64 val = read_gicreg(ICH_HCR_EL2);
-			cpu_if->vgic_hcr &= ~ICH_HCR_EL2_EOIcount;
-			cpu_if->vgic_hcr |= val & ICH_HCR_EL2_EOIcount;
-		}
-
-		write_gicreg(0, ICH_HCR_EL2);
-
 		for (i = 0; i < used_lrs; i++) {
 			if (elrsr & (1 << i))
 				cpu_if->vgic_lr[i] &= ~ICH_LR_STATE;
@@ -242,6 +234,14 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 			__gic_v3_set_lr(0, i);
 		}
 	}
+
+	if (cpu_if->vgic_hcr & ICH_HCR_EL2_LRENPIE) {
+		u64 val = read_gicreg(ICH_HCR_EL2);
+		cpu_if->vgic_hcr &= ~ICH_HCR_EL2_EOIcount;
+		cpu_if->vgic_hcr |= val & ICH_HCR_EL2_EOIcount;
+	}
+
+	write_gicreg(0, ICH_HCR_EL2);
 }
 
 void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
@@ -249,12 +249,10 @@ void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
 	u64 used_lrs = cpu_if->used_lrs;
 	int i;
 
-	if (used_lrs || cpu_if->its_vpe.its_vm) {
-		write_gicreg(compute_ich_hcr(cpu_if), ICH_HCR_EL2);
+	write_gicreg(compute_ich_hcr(cpu_if), ICH_HCR_EL2);
 
-		for (i = 0; i < used_lrs; i++)
-			__gic_v3_set_lr(cpu_if->vgic_lr[i], i);
-	}
+	for (i = 0; i < used_lrs; i++)
+		__gic_v3_set_lr(cpu_if->vgic_lr[i], i);
 
 	/*
 	 * Ensure that writes to the LRs, and on non-VHE systems ensure that
-- 
2.47.3


