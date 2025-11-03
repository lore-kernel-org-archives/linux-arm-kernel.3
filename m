Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0130BCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6Lp7gCe+omuPtct51PzY/9oCUHrmI3Le+gyqqPCMyk=; b=DXJlW780l1C+C2O4RKAtwfU5Za
	00qG26OOqkG5Dlrouctvm1P5T1gr6ILwfhG1/5JSVTDyJizH8rTsArhp11hd3YFHv6iYaN0UARznj
	4pc3Z7Hb7gitQsrLzBD4/PiKmdllT4AIyxSUMs7LOS+m2eIMuNz+RblQVfhdH4Xn016GdNUhUwjEp
	0zEDuCDLoE3L/QWPA3h5XEcpMG4X16czTOl93Wg2Gg47D4LDsAZMgCtFn0YX1HXZGH2F9k1v5GdeK
	QC680iGa9QiL5ZJDq3pqWXQg8YZv6Fj2qaDItCTkYtPhh4fJOHBiRVj+DppoH9ouM7z816CSUBQTW
	k1YGPLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqC-0000000AK9W-0d0Q;
	Mon, 03 Nov 2025 16:55:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq6-0000000AJzQ-3xYV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CF0D60140;
	Mon,  3 Nov 2025 16:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7C4C19421;
	Mon,  3 Nov 2025 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188930;
	bh=FMwu06lK7Q6CryDZ52WbXhfFTuUdJV55nVDRrDJIZtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aOCuFx2EDzly2p88N1IsrJeEr6bhP8mfVtXrKV3suAEZgKv2GwgGLCQJzxr2OfAqr
	 pC55uhIKOHmCE16uI24k3AWfykkKVaiQJkMHrZUM+SxFxjV3qIuCPSfCnAjIAK6B5i
	 D74dcum93yaTo/pa8sRNtHQ6vxXp9uSMEIs5h+0tv89ZvCFniuh/tUBHGRZh2cFC2/
	 4bgDrQ/nAUN3beZiQOVYLlzVHU0dXtzRrM/NCHPf4iYZ9HPoPAqWyLaZhepEZc4MFc
	 inn9hvnWCHhK4vViFrRJsMWm4qKZw2/eF3SEBKiyQKG86YMYVwX0vTa+dx8xcmTeAe
	 8ab8KR1L5iwug==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq4-000000021VN-1BmN;
	Mon, 03 Nov 2025 16:55:28 +0000
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
Subject: [PATCH 15/33] KVM: arm64: GICv2: Decouple GICH_HCR programming from LRs being loaded
Date: Mon,  3 Nov 2025 16:54:59 +0000
Message-ID: <20251103165517.2960148-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
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


