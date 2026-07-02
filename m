Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D8C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gz1SCcBQk1uT9BfitccY1PXQbFj9e4s1uC4Oikj/pOw=; b=stnzmYkR3bl+AYOUw7a+77W1q2
	v8ljzgKexKPhQSOvD9LV4S8aFRmpu16EICgoLb9lcgldx3CmIXitKUKKK1zIlsz/ZprcONkZs0n5J
	/6+JDPRJt4QkInr1V96frFeCUe39WD76BGzhwN/xxUxddb48R5+JgO55G7CMfsWi4ZyHt5TjofVsp
	eKMDxDTe5AF5csBbImuLztBj1gr3HEY2TwQFM4wFKZ4WinjXwdFP/4GSJ9iOG3dunyrPhkoWb19A4
	J0NUgHZFb5UKzpUy/1lHJk1bm8hymtaNNBvhhKZh5i3hrj6ZDG22pIl/UHzhGle2HpVErlaNDlveb
	wJPzpCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsZ-00000004uKb-1joN;
	Thu, 02 Jul 2026 16:03:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsT-00000004uCP-37qR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32F07601F0;
	Thu,  2 Jul 2026 16:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1E41F00AC4;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008180;
	bh=Gz1SCcBQk1uT9BfitccY1PXQbFj9e4s1uC4Oikj/pOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c2C0r3fAS3FhJF4PK/tP21s8cSFukJF/jxm22ybu32OyeIwDEaQBaHkjCjE8wL7BY
	 191x7uYfKZV5z1HrG+hpgOTHH5iuQoe39/ekivkmiOKvg+L5FSTNmW4urNAJEJtNBr
	 XRuR6eYvMK8fUE5MmXPR3HdqHoo6/j9tohcDH3rJEHNk4Mn5GgO1Rk3RxQR6+EfbRz
	 dxmy1yZ6foMY0C8b8naFI0LGAYXoAhElUvWQlgmi50A8N2qdhtON1rb+d7GI0d4kJm
	 Yv5JH03wLdL/78nROpw94VDWfPq/ZxeWcj5ET4nOp4oCpH6ceKcs7k2e1nNb7FwJZo
	 8LHby5gD1y8sw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsR-00000000ojd-0Wpb;
	Thu, 02 Jul 2026 16:02:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 05/28] KVM: arm64: Plumb HCRX_EL2.SRMASKEn in HCRX_EL2 sanitisation
Date: Thu,  2 Jul 2026 17:02:25 +0100
Message-ID: <20260702160248.1377250-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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
index 16d8148dc3f12..8d5e4aacf49c4 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -904,6 +904,7 @@ static const DECLARE_FEAT_MAP_FGT(hdfgwtr2_desc, hdfgwtr2_masks,
 
 
 static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
+	NEEDS_FEAT(HCRX_EL2_SRMASKEn, FEAT_SRMASK),
 	NEEDS_FEAT(HCRX_EL2_PACMEn, feat_pauth_lr),
 	NEEDS_FEAT(HCRX_EL2_EnFPM, FEAT_FPMR),
 	NEEDS_FEAT(HCRX_EL2_GCSEn, FEAT_GCS),
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 32e2f9856768b..c6e8117a6f9cd 100644
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


