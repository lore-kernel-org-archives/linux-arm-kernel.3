Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBC7CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1bCXSacjn80AVyQe5HgqrLAneXvbxXHt7RPkyZGDWo=; b=fypQNhLTAzvE/5Sa9n6iti2X9b
	tarNpVQB5jw+lA6MzXRCpcPu7ke6m9rHKamINkfl39Q4ZywXZNlThbzz61YiKrbFIibZR/ALLkSiD
	Qp28zXpowMntcPFpXKF0LoCEswy3rEcXV/8j2T++El7sTOKLWoUCGGCAXwuYfbjwU8WlbAy3oDfXK
	nouq1ZZ0gsMP5D3OfURBd4tdNiN6bFYjWp1Kro+Tc1Dl63abH8yw61PiU1LbIkO+lr/K4gGQa/N2+
	aK+Pa5/fPeEUjAzh9qACnZx1IVx9WYn5MBVZ2v/KqFc7CUZXMg6aZJ7sYgbi0c90xjsofB1WQs2TK
	5o1ii0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92g-00000004DOH-0W2w;
	Sun, 09 Nov 2025 17:17:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91q-00000004CD2-0249
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC228446C7;
	Sun,  9 Nov 2025 17:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FB8C2BCAF;
	Sun,  9 Nov 2025 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708597;
	bh=SLRiFgk9c+wOGfa2B+I0f696jbLpPaxhNQ3kVExvE1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tfG5h49kBf1krDdwQH1lptaqNElPI5xEFPDaAzQyPGE8CESvD8UFQHJtMsO+3dLGs
	 Qjs/H6P3jxtSW/FuZhDr419AQeyYeU1Z/IvjPKzaO0g5Eih3OHo82XEX8uA917yTN4
	 Y7Z1TLfhBd3hoMnmiaK8VhAU8bzFBAcBEhvcUBapc7IOln/HphKBpmMYkqehjuxSm1
	 y3S+/HG58oEIxVfuXmhy3QqF52y+AMrg63Bp4jsydk+lCfqSm87nC8T1DvOm/xmU2D
	 dVN6NZyOiKBdQqCJsQenqzB1fWfqBOifXrzunXk1/UcqG/4VO7Sf0af79t7g/01C4H
	 bRzS5wZDJcLnA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91n-00000003exw-3swL;
	Sun, 09 Nov 2025 17:16:36 +0000
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
Subject: [PATCH v2 32/45] KVM: arm64: GICv3: Avoid broadcast kick on CPUs lacking TDIR
Date: Sun,  9 Nov 2025 17:16:06 +0000
Message-ID: <20251109171619.1507205-33-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091638_139021_DC68C2B7 
X-CRM114-Status: GOOD (  16.53  )
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

CPUs lacking TDIR always trap ICV_DIR_EL1, no matter what, since
we have ICH_HCR_EL2.TC set permanently. For these CPUs, it is
useless to use a broadcast kick on SPI injection, as the sole
purpose of this is to set TDIR.

We can therefore skip this on these CPUs, which are challenged
enough not to be burdened by extra IPIs. As a consequence,
permanently set the TDIR bit in the shadow state to notify the
fast-path emulation code of the exit reason.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c |  6 +++++-
 arch/arm64/kvm/vgic/vgic.c    | 13 ++++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index bf4dde158d516..32654ea51418b 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -50,10 +50,14 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 	 * need to deal with SPIs that can be deactivated on another
 	 * CPU.
 	 *
+	 * On systems that do not implement TDIR, force the bit in the
+	 * shadow state anyway to avoid IPI-ing on these poor sods.
+	 *
 	 * Note that we set the trap irrespective of EOIMode, as that
 	 * can change behind our back without any warning...
 	 */
-	if (irqs_active_outside_lrs(als)		     ||
+	if (!cpus_have_final_cap(ARM64_HAS_ICH_HCR_EL2_TDIR) ||
+	    irqs_active_outside_lrs(als)		     ||
 	    atomic_read(&vcpu->kvm->arch.vgic.active_spis))
 		cpuif->vgic_hcr |= ICH_HCR_EL2_TDIR;
 }
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 60bdddf3472e7..a4c42884f1e16 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -370,12 +370,15 @@ static bool vgic_validate_injection(struct vgic_irq *irq, bool level, void *owne
 static bool vgic_model_needs_bcst_kick(struct kvm *kvm)
 {
 	/*
-	 * A GICv3 (or GICv3-like) system exposing a GICv3 to the
-	 * guest needs a broadcast kick to set TDIR globally, even if
-	 * the bit doesn't really exist (we still need to check for
-	 * the shadow bit in the DIR emulation fast-path).
+	 * A GICv3 (or GICv3-like) system exposing a GICv3 to the guest
+	 * needs a broadcast kick to set TDIR globally.
+	 *
+	 * For systems that do not have TDIR (ARM's own v8.0 CPUs), the
+	 * shadow TDIR bit is always set, and so is the register's TC bit,
+	 * so no need to kick the CPUs.
 	 */
-	return (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3);
+	return (cpus_have_final_cap(ARM64_HAS_ICH_HCR_EL2_TDIR) &&
+		kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3);
 }
 
 /*
-- 
2.47.3


