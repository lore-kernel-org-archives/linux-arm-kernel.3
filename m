Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD85CCF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2JrcOTgieinMUiKfhAS96oFbB65HIu6rMbh6ksxVPY=; b=lA3q5tKZoBlm5XZQFr5kDczS82
	uBLp8NHI9fPSghmw2IwSJyKptjSDt76hlicqAXZXFl7gU5HAMzZ4qiIZm3jHXA/vvMBfzf5eU3wle
	JOZiesmsR3VoIwDINUQp2/DofLVguZud9TcQRvvV+F+i8iw9e0IgWHlLdAR5nZcpPZ8Ggl2kdHuGP
	gKyh/xxwAQSZ25EZc49z5OBAwK/Chrl7z+vENsy+7iBXi+62tDMBAwee4YNRrlwJoTNjMKIeOzB+F
	/tNGe1P25IyygQImT6EzKnEjH4ugj+I8842bPKtm81YJHvPXQpif4ssV4yhvjgv+kEye4F3b2hNJ2
	iE+UlnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QL-000000076DI-0ssP;
	Thu, 20 Nov 2025 17:26:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q0-000000075fX-27U2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E96E16020E;
	Thu, 20 Nov 2025 17:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05C2C19422;
	Thu, 20 Nov 2025 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659563;
	bh=I0AskgwDdaf6eWZUGhhy/0YrdanjZQLtxvD9oISnCwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l3nrJQiszcUvBj/V6/B1mhg7uXJkduR/L7rY9/ujmz5kr26O9FibYpoEOySMatwiq
	 mJURHx9so9jHceq6WOj9DIxH5iJ0Dlu6sUvC9fiOW8v7HVO2phOEXJBSgxLbgmTbBR
	 chetALD7Tmj9LLkDQp5Y/AEVDZM1kHqQBI6nGPStEld4IDkDDzCjC5rY5xdzsdP0Ga
	 TjCLUPP6AXtZwyzdukZJAwxtmhsJmzcHwYDwamLnepuActtcANYm1gyh/MH9KuS5vg
	 7CQ8SG5qRUYoLynR+gQZ9vdC9X2k+FX2PXMSTuWfZh+NHICkDiFOGZqqZJF8iNXGJH
	 /MVW0kU+ssnMw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Px-00000006y6g-3xvR;
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
Subject: [PATCH v4 33/49] KVM: arm64: GICv3: Avoid broadcast kick on CPUs lacking TDIR
Date: Thu, 20 Nov 2025 17:25:23 +0000
Message-ID: <20251120172540.2267180-34-maz@kernel.org>
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

CPUs lacking TDIR always trap ICV_DIR_EL1, no matter what, since
we have ICH_HCR_EL2.TC set permanently. For these CPUs, it is
useless to use a broadcast kick on SPI injection, as the sole
purpose of this is to set TDIR.

We can therefore skip this on these CPUs, which are challenged
enough not to be burdened by extra IPIs. As a consequence,
permanently set the TDIR bit in the shadow state to notify the
fast-path emulation code of the exit reason.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c |  6 +++++-
 arch/arm64/kvm/vgic/vgic.c    | 13 ++++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 55847fbad4d0d..968aa9d89be63 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -53,10 +53,14 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
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
index 83969c18ef035..693ec005c996c 100644
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


