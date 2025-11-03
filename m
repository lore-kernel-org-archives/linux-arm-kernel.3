Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51544CCFA09
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiunOYTQ+4AAkuDvJHqIiV9m9BWDZGmfLAU7NMfgU0c=; b=lvihyoO64qQscWamSQSIxTwfwl
	HD0acr08lpeG11Gh6568aLkr9cwVGzEsaGeJuI4QmPH5287bkaA6xeMj7svSivwotfpwHcO7wVZnj
	Qda7rdX/4pcgQQHHRJNqUr6QFueNdp4CECPqNo/b8yW6DJ0puk9QRfhml9FbitoLPzOg3Kr/L/bDU
	0x7m4+KvIOaQKqTmhofCF2tp1RF2Yr3/DwrOJVLfs4gG/8gDKQol39QbLV2gKUi1SXUib0NXhohLW
	9fqzTotJr2657wbq3LcZ8McH8HoijZCBaAlNEdcxViGLWP1qWF6oluvAjUpfayvLBmNu3ZWBNEkby
	R5MOQ3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqG-0000000AKHO-1iAy;
	Mon, 03 Nov 2025 16:55:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq6-0000000AJzO-3Auv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 327C943C8F;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1722BC4CEE7;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188929;
	bh=QMaC0gqBcRF3hw0Xjj6IXI4r1QPU/njBPXxtSLfQ9YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q9GVfA/XE980ACjtwpBE1/betOQqaRRgRdFcXEk06XZzC/mX2t72dvq0m+fiVoFUr
	 XJbWit+auL6euD7O4eHH//Bp4oVWavirUm/ymL8TUcDySmZ9YSrXiFRnFlXE4lu4dP
	 leNPfDPMTmp8046HgzkHWGscWCdxousrFppWEEGgfCr+QyZB+F+Ivtg8yI0faRRx+p
	 7ugEi/qm66FYV8xR80if/T+zGlDC7YsNW6I2vSnuR27vXI36aRrpAUfgd/dCFZ8TDV
	 2KYohOeBzgUi9A2Vwy61HZs5Ejkia1KAXXhpnjM2E3hDQhy67ANTOZCvbC+Q0rgNa7
	 dhCEdqqAwd1Ww==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq3-000000021VN-0yl1;
	Mon, 03 Nov 2025 16:55:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 11/33] KVM: arm64: GICv3: Decouple ICH_HCR_EL2 programming from LRs
Date: Mon,  3 Nov 2025 16:54:55 +0000
Message-ID: <20251103165517.2960148-12-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085530_847437_5F1CCA4D 
X-CRM114-Status: GOOD (  13.56  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index aa04cc9cdc1ab..d001b26a21f16 100644
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
-		write_gicreg(compute_ich_hcr(cpu_if) & ~ICH_HCR_EL2_En, ICH_HCR_EL2);
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
+	write_gicreg(compute_ich_hcr(cpu_if) & ~ICH_HCR_EL2_En, ICH_HCR_EL2);
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


