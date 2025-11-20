Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E193BCF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww/YhtqDITRgrf8vrK21rCxXjV4kf1dj0dTPQacuksg=; b=a/ZhxgyEBIxcfhLqXsc0NIAP5G
	+4PHFE+D8Rb+1bGfWWU8fSR97eW0NQ6oxcZZx63q8QDgOvFeoqBb/mtoY5zUxpQOK4P9G4nB8YAk+
	XIPT000u2HRBa44A/zysp1MaC3tgLkEs+NQmdOZbjixgyD0bXuonxZTTetiJJzKTX2Eb5cHBX9zE9
	k/ZQCU9bX5nZ/iZzsSUybewB7K0ulqosbed2vK7NO5ttvflTtSiISYM5lsHBMvsxU8SEdcScCUliS
	g+RJ9fBmXpFFInQIL+bNiyZU0lli7/Lej9Mmmx7u6V/9VoJbDeY51U//s2MV8SvWd6f55C+upB9y7
	R7crlWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QB-000000075tR-2fyr;
	Thu, 20 Nov 2025 17:26:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pv-000000075bE-44zz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DF8944431;
	Thu, 20 Nov 2025 17:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3A8C116D0;
	Thu, 20 Nov 2025 17:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659559;
	bh=fEboDabzfdT1z+/aMTmm6yEOOvmNnX4iNfBHI1NhwLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FckTF/7VWZ32XbP6p5wjpbKBSNwR/zOVRsK+IEGtbZ1gg+emwHMOr3MqK9p9Pz6c0
	 p/35HB6+UgmYtaJy7v6sP9XVRZcGeIH4WBB+Jdd+tAO8RD7HdT7hebDAH3mNyFsKnA
	 kq7H5L1wDCx2vFnIEI+q07WhjGTMLRhHZyy6hUqMxm18JEINhWS50NP4Yt+eB9h436
	 1k30DMduabELcCDBrmFHXf3iYoBQsLn6CgD67tHxgNUJTQw3Whs45qLnzwlrMGSBst
	 xJMOSERBHrsAFafPAJR88JIUE45VnvQ44HRuQaz66YIrYIlAPUlqshmPIlIrFpC6+r
	 uYPGaH86orTcQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pt-00000006y6g-33bK;
	Thu, 20 Nov 2025 17:25:57 +0000
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
Subject: [PATCH v4 16/49] KVM: arm64: GICv2: Decouple GICH_HCR programming from LRs being loaded
Date: Thu, 20 Nov 2025 17:25:06 +0000
Message-ID: <20251120172540.2267180-17-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_092600_221954_9A3BC56B 
X-CRM114-Status: GOOD (  14.54  )
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

Tested-by: Fuad Tabba <tabba@google.com>
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


