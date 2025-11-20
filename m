Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA2FCF9C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7gbfuX1XkhpznJXH0c0OBHBNc4aw34pChe6K2ftgSA=; b=fRV8Nv+DowwFtZVD94DymsIEn1
	KjBpIWTbVrL0RoooyhOj5RtZlHmFgX3nPoSgAoBHTCDoiqdqgRsSJWjxVqdw61Y8msBGOQ4+T8ikb
	YGEsN+YiKfsKKA948ITIDyRNixrubMxha3uukQ4MtGmyF6ebyJSxtiIZaXTD3cJfgul3LcHx5b0GV
	8k2hqGsQ8SunofHxEirmndoc4I2DVw9k9De8lTAnHC8qoAfcLzsfwRxRmYluhz9fp9sLfpjuVJyHN
	tc+7MGIwPqV6r4ruCHrxy+qJajcZQHFkZQaGtvof+T6p/SW5Dwn+BO65J7b68VpdPWQHeDt2NNIyP
	XX0Pr6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QD-000000075xj-2tQ8;
	Thu, 20 Nov 2025 17:26:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Py-000000075e2-3Rtw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36C436020D;
	Thu, 20 Nov 2025 17:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1889C19421;
	Thu, 20 Nov 2025 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659561;
	bh=Mq07eAWTjNFWwCWLXG/M5L6neRDcPrbJTdf7eK+vuY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZUzvQss5zCfc6s51p9gSmYwujtIwZc3uR+LoCN6WiCrCw4y8qjwf2kRtyRvI5Ufi
	 44cN4f8rju+bUzXelr/oiR9rA+ka092B6HR+WTqDk58be/WjzIEF0R1BNUO4btm6ZM
	 z3avuyYqL0F/ZLG2cfyaFZSBSEOGWGQnk3SJ4GmtmMQSA8ktnvACCG/GgE1H4yrkvu
	 7vemJotSqIZns/tprYrG/LI7rIWANlTQrP6x1qAns15FuhM2clDuhJEuQwJaipp57d
	 yPc2IaqJSFU9C8wm4Yj37CaqB/TkEwlQHazchvVa/k9+NnWwWlhxTkCTz5QoMAuCkz
	 6tsEnGl7zRL7A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pw-00000006y6g-0naW;
	Thu, 20 Nov 2025 17:26:00 +0000
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
Subject: [PATCH v4 26/49] KVM: arm64: Use MI to detect groups being enabled/disabled
Date: Thu, 20 Nov 2025 17:25:16 +0000
Message-ID: <20251120172540.2267180-27-maz@kernel.org>
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

Add the maintenance interrupt to force an exit when the guest
enables/disables individual groups, so that we can resort the
ap_list accordingly.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 5 +++++
 arch/arm64/kvm/vgic/vgic-v3.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 18856186be7be..9a2de03f74c30 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -39,6 +39,11 @@ void vgic_v2_configure_hcr(struct kvm_vcpu *vcpu,
 		cpuif->vgic_hcr |= GICH_HCR_LRENPIE;
 	if (irqs_outside_lrs(als))
 		cpuif->vgic_hcr |= GICH_HCR_UIE;
+
+	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & GICH_VMCR_ENABLE_GRP0_MASK) ?
+		GICH_HCR_VGrp0DIE : GICH_HCR_VGrp0EIE;
+	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & GICH_VMCR_ENABLE_GRP1_MASK) ?
+		GICH_HCR_VGrp1DIE : GICH_HCR_VGrp1EIE;
 }
 
 static bool lr_signals_eoi_mi(u32 lr_val)
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 780cc92c79e04..312226cc2565d 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -39,6 +39,11 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
 
 	if (!als->nr_sgi)
 		cpuif->vgic_hcr |= ICH_HCR_EL2_vSGIEOICount;
+
+	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & ICH_VMCR_ENG0_MASK) ?
+		ICH_HCR_EL2_VGrp0DIE : ICH_HCR_EL2_VGrp0EIE;
+	cpuif->vgic_hcr |= (cpuif->vgic_vmcr & ICH_VMCR_ENG1_MASK) ?
+		ICH_HCR_EL2_VGrp1DIE : ICH_HCR_EL2_VGrp1EIE;
 }
 
 static bool lr_signals_eoi_mi(u64 lr_val)
-- 
2.47.3


