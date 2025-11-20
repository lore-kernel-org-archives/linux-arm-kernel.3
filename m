Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7322CF9C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbzsW2T+9YAsXCQLUyy98dckbuOZk/jN+pcRBhb2b2Q=; b=h8nNaB9835dpX/QgVDy74LkDY+
	kpzuCP+SgXTnxNKtvaVDv+FSz2YLfYTcppG+fpt/0rPfHohw17Suyx5ZivCzJxwarZndmvpuxRXrV
	UwRE+LNk0wtZU0Z1UU6xBWCwKxW1D0K1AznlbmocLfmYhrFsoLOuBJeP2OfdES7282qKafhRNhbKs
	to98Su12gG63XZioHmkmap4cLLCJTj3NKkTASVFEHwBDDXg2V177k6uvwKaX/ZkrvqD5Ch4RWAtH0
	wRrenphcZTSebi3v9vKKE/3l8uMTASSq2PmP1lXsNNXyAW/L8VME+cX5R9bXMX6RwLbpbZdRxF9a4
	k42/TwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QI-0000000768S-1oE0;
	Thu, 20 Nov 2025 17:26:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Pz-000000075ZQ-0mUh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 173B1443E4;
	Thu, 20 Nov 2025 17:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C40C116D0;
	Thu, 20 Nov 2025 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659563;
	bh=dWDeyae6N77yEGNAKHiIA8aFG+UfJsUWjTDlzOcR5Z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dkjMSsRk3fJw+aKn4gvxuLDa68dhzMojiTFGq7Z19Y+gDLq9Of1FPK+gHarTXf2I8
	 fn9D8v5pj1/vdpHZc8X2T3GCU9es/8SLVg4GchurG/kkxp9rpOAf5zxIkH5pyCWcCh
	 VRs7/H7bwjv0f5c0kbNudHBLc5gbb6/gXErHGFYtMqnzyYAM9KVdTKktBKpxqm+i/c
	 hxrC3wzi9Kah5fYmGT+FEaZJEp8jnWTmrem6M5LNHQxttWFeOFDdQs8sbd76Y4S7Gu
	 ZkWEIwSdyTLrCgj8i3TFgLiUD1JD303HdJuVFQXcy+KnrVLfTnaFYrCduTdtyHM06V
	 R8NkRWYrnvbGg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Px-00000006y6g-0reG;
	Thu, 20 Nov 2025 17:26:01 +0000
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
Subject: [PATCH v4 30/49] KVM: arm64: GICv3: Set ICH_HCR_EL2.TDIR when interrupts overflow LR capacity
Date: Thu, 20 Nov 2025 17:25:20 +0000
Message-ID: <20251120172540.2267180-31-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_092603_257405_595C8223 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

Now that we are ready to handle deactivation through ICV_DIR_EL1,
set the trap bit if we have active interrupts outside of the LRs.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 9fcee5121fe5e..09f86bf6fe7b8 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -45,6 +45,13 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 		ICH_HCR_EL2_VGrp0DIE : ICH_HCR_EL2_VGrp0EIE;
 	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & ICH_VMCR_ENG1_MASK) ?
 		ICH_HCR_EL2_VGrp1DIE : ICH_HCR_EL2_VGrp1EIE;
+
+	/*
+	 * Note that we set the trap irrespective of EOIMode, as that
+	 * can change behind our back without any warning...
+	 */
+	if (irqs_active_outside_lrs(als))
+		cpuif->vgic_hcr |= ICH_HCR_EL2_TDIR;
 }
 
 static bool lr_signals_eoi_mi(u64 lr_val)
-- 
2.47.3


