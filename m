Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44A1C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qy3LcChpmVPkZFpX/FyAcZIZ4iiBtn32rR6Vy9EHCMs=; b=BybNCLhdkzBje0izQPNP5o2XBh
	SC5E91LNHLdc/w+2kQqbdDfpnZhozB9XYDN909/G3rLSWE4O7n4QPETGZ46yKQhBFy/lKWSTaAYBJ
	DsEDrakdqHYzO1LIf3kZ3UYswWcYuPB8V6nsg0LXs4ZAAHLjsB4WWipKKLuFGTdO1U+Xaqga/8aGL
	xbEY1DTHe4QKh5dwHNNPSKJoekXfRdWEknPotlLpIfJpDzk3Rsu0kAPK4DwHDAZ4l+zSKzIy2Vnc7
	NBhF5A2nVGfUmYUsodsyyTOyGMpp9bClZ7/KNQQoXPqwj/hlF2rswvZUM8X1pSA1W20U0jW/fgp+z
	e8wAjNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbX-0000000B6ig-0m1m;
	Wed, 22 Jul 2026 07:42:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbV-0000000B6gC-1cML
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:42:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28FD543766;
	Wed, 22 Jul 2026 07:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8161F00ACF;
	Wed, 22 Jul 2026 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706177;
	bh=qy3LcChpmVPkZFpX/FyAcZIZ4iiBtn32rR6Vy9EHCMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VJGGt7AJVNILRClh3RMmco73Rs4s7M5u3ND5wdy9AVz66MBPTeO84ZAJMvxeQ+Ftr
	 Su8Si7TsXZvQOLpHYLFltuk/lHuR5leQmaDmtiVunDd4l54kVHUwD+slQdqGKxSt+C
	 oV1grVE7MXo7lTZReIEnvzqqA/SKAb7Bc1mbjzl008lCJ8GkSdYRENB5UGuzynWiQo
	 nkClCulBXim4KCuoO8rJdu1SdxSmzZMrH6XClFHDz7iUkPwAcYLFGjNfawR+Qm9sd5
	 Jib4o8NFKFijFpJYpXSlA1nmRQOFcEFaDQE/qZ+nt2c/Z5ouQSijDtrVGmw5jpMQcf
	 qaDtacYok4DRw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbT-00000007VfN-1J70;
	Wed, 22 Jul 2026 07:42:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 05/28] KVM: arm64: Plumb HCRX_EL2.SRMASKEn in HCRX_EL2 sanitisation
Date: Wed, 22 Jul 2026 08:42:11 +0100
Message-ID: <20260722074234.3330999-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722074234.3330999-1-maz@kernel.org>
References: <20260722074234.3330999-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com
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

HCRX_EL2.SRMASKEn is a new bit enabling FEAT_SRMASK for a guest.
We don't plan to support it any time soon, but it doesn't hurt to
actively document it, specially as we are going to add more bits
we actually care about.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 1 +
 arch/arm64/tools/sysreg | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 96ddcefc71eb5..c61d62b796023 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -904,6 +904,7 @@ static const DECLARE_FEAT_MAP_FGT(hdfgwtr2_desc, hdfgwtr2_masks,
 
 
 static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
+	NEEDS_FEAT(HCRX_EL2_SRMASKEn, FEAT_SRMASK),
 	NEEDS_FEAT(HCRX_EL2_PACMEn, feat_pauth_lr),
 	NEEDS_FEAT(HCRX_EL2_EnFPM, FEAT_FPMR),
 	NEEDS_FEAT(HCRX_EL2_GCSEn, FEAT_GCS),
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 3171c87eb2447..28755f70f0bf0 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4545,7 +4545,9 @@ Fields	ZCR_ELx
 EndSysreg
 
 Sysreg	HCRX_EL2	3	4	1	2	2
-Res0	63:25
+Res0	63:27
+Field	26	SRMASKEn
+Res0	25
 Field	24	PACMEn
 Field	23	EnFPM
 Field	22	GCSEn
-- 
2.47.3


