Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9BCF41994
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfYfEUmSJJu99KFkME4QJcDO9qLVgas+BeL74XBcbcE=; b=Y3kZSINHkPEyVy4ILRuSQoymGX
	C0bo7ZaL1LR3EUSEthx1WAF3m2xExdoMnX8t64/hA5LH6PwlZt0PZoJoS9nCvBMQ7HekaNIRE+p2D
	iExPHHyMB/600grseHMqnRiXIGAsAdnRHj11KAhSmKE6RRGbEHuR14ImXHJ5XAn2En2j6Kz6RAVWT
	7ww3YrcCel+AnI3ZbC1+ntLKRm/Gjh33NvGv1TYUvILheXw8pvfBh+aI58eMHKE4+vwGJM7lM2Poi
	qW/LkhrBS9WRPwyzh9+HOyyM2Cd+AKIJtUQQA90kRK4NZnRyWm4YP//OJflCKQjCXYISgy2UcmA8a
	l2x0gkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr3-0000000147V-0Tm4;
	Wed, 15 Apr 2026 11:56:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyr0-0000000145k-3pGz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 11:56:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 439B260135;
	Wed, 15 Apr 2026 11:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAED7C2BCB7;
	Wed, 15 Apr 2026 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776254182;
	bh=ciZEV3bdUIhbO6JXRIfwr1Ls+d1o4OxEStrk1ecfBEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jUkzyCkuyeWXJrd7wnZRRqvRtdX+lexgYqYJ7OjQRmh5BAkAmeZ17LMuabVc0B9xP
	 8dPwPIN+HLDCv8DLYupnFs4Dv8Tvi6F3qr76PdSmvzTuIUXkJAEob5TJbkQ9uNBcax
	 jY8bUqWzDE9gsC8HTmt3QgXDmYnCyeQ+SqDuOrT/Dz3zaJ309JK2SIj7IZ7jqsl7HA
	 g4eWGqScfFXYOUFbV0wC5V7uvnCZmvBsVq0ix3WUy+4tXjaB4GV1K0aw+Zcfz3Umaw
	 +72AJ11sK48OirLThanLeVNLm159TWjk4m+ByHT4zgA+8FP9T9PfFSEwoUbdv7AB1G
	 q8y8HA3COWsvg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wCyqx-0000000Bqsi-3wpH;
	Wed, 15 Apr 2026 11:56:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 04/18] KVM: arm64: vgic-v5: Drop pointless ARM64_HAS_GICV5_CPUIF check
Date: Wed, 15 Apr 2026 12:55:45 +0100
Message-ID: <20260415115559.2227718-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260415115559.2227718-1-maz@kernel.org>
References: <20260415115559.2227718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
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

vgic_v5_get_implemented_ppis() can only be called when we have
a GICv5, by construction.

Remove the pointless check against ARM64_HAS_GICV5_CPUIF.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 4d62b1c31fe8b..0101ec3f55283 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -18,9 +18,6 @@
  */
 static void vgic_v5_get_implemented_ppis(void)
 {
-	if (!cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF))
-		return;
-
 	/*
 	 * If we have KVM, we have EL2, which means that we have support for the
 	 * EL1 and EL2 Physical & Virtual timers.
-- 
2.47.3


