Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C96C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qy3LcChpmVPkZFpX/FyAcZIZ4iiBtn32rR6Vy9EHCMs=; b=NzTGUEHBnVta304Ry4bmgrJDp3
	ghmp44Zqmf+g9hAeIqD9W6elMXR3PJgQb6A30CD1vydJZeQk9j6QJjh8NJi3gHq0KJ37SV/aCdUHM
	T1IRhU8aMKNmBcQ7GDKnujYpZQpduNW7WOPs36/O8Eu5hXgYf66p/RM17gg3Gf3kpsvG0fUcbauX+
	O+w35MvhMj+9CUQ5HWm/+h/Lqd4imZ34u0YNJM4L/Xnmb2Q4U97uRWFxHiaTVlju9ancExBCdcL4C
	hf4aOxM/G01LUF1gbbPcCbNfskXoz+Q8XcxYRSglOlg8gVTMfvoBXn2Xfj1/QtQdcQ4DHr+AyFl0o
	msxC7CaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKuq-00000009gMR-3kd7;
	Thu, 30 Jul 2026 07:10:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKup-00000009gKV-26tE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45EF8412A0;
	Thu, 30 Jul 2026 07:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280351F00A3E;
	Thu, 30 Jul 2026 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395451;
	bh=qy3LcChpmVPkZFpX/FyAcZIZ4iiBtn32rR6Vy9EHCMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mI0Adkby1Y5xWOEoa427WveKzE+UPR5ih6RtRlDS2vsCHTOmChHj0iQfLOjhinISW
	 2WmWoGJxe0DXslrDqT/u6Vtv3xmlWaHrdODnPyVuAGlq/147XAVb8y43gRNBQZ0iOV
	 J4PXlDVlNWTB4ZNE2OT7rdGIakGqnq7D/HLBS4fY3S2GhIyDFV7u7PHdIuBMOMEwQa
	 YqGgi4nmD9ESr4OyivWVh2DKbm5okrC36ND6n7OXLxv57KvoySKArI2iZPyr1LjVAD
	 wWiTOu+WdcrMtq/sj2B41oHBHjm0AmqSHE73uuWO1ePM90YpS3oam3nlH0g4pc90iD
	 YxAaHMNUnCxNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKun-0000000AOpW-1jeS;
	Thu, 30 Jul 2026 07:10:49 +0000
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 05/29] KVM: arm64: Plumb HCRX_EL2.SRMASKEn in HCRX_EL2 sanitisation
Date: Thu, 30 Jul 2026 08:09:58 +0100
Message-ID: <20260730071022.296811-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
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


