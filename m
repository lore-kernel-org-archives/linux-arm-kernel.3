Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F37C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhyYZoRfqIfREPPS8CErWw/Y/QryBhe2Y1Mvp9CHj5Y=; b=2iRyCmZ03XkuTdkRqxiT91pKxF
	nqdiyrhGJqUbAwGEQHTp38HDfv37f3FxnnoBqDppNEf9bGlFQLaMRgeN0xjwEITE+7EIbvw1hl7Ec
	a8kiMYdcPL4xp0Po71o8Jui0uq3EthVL4td22mQOINVOzC2bAEhYoT0AYHrEeOfo58jPi0LlvVPMh
	tx+HAZ81Jro+NTi7ucSpV0Q0SlWE/F1VfrCx51m9FnxKI//BPpcGTX4VzD5oa5o5ZH3+1XeZRKxag
	ncJZSdaPdx01RZMeqvcMbcheRBhkCD9V03cBJKxrsJ2QeJ239qrqyiTI1kSJn/zLYwYOwmVwTKI8v
	fh2cAIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsa-00000004uOa-3fsb;
	Thu, 02 Jul 2026 16:03:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsV-00000004uDp-0hHP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99937601EF;
	Thu,  2 Jul 2026 16:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502E11F00A3D;
	Thu,  2 Jul 2026 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008182;
	bh=AhyYZoRfqIfREPPS8CErWw/Y/QryBhe2Y1Mvp9CHj5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nCGDwg6iioeowZpjTP2NcDBrG7S4z6F626DLFOOTNVR23dKxzR1AP23Xlvh3oc46I
	 LTUYvmwmLd1yTGErJCxXAyoO5xy+O6G5iyIFKhR6Jc0tlXsfv12gBgHUYVua1g8HxY
	 c0JKHXAvX5O5wWxpEc+VrFU5aPkckObYt5SXffTKFSphY2Qya6Uy+JbcURgZ0FfoyT
	 4BdZpCSJp9NUDiZgn0R38aTF3R4lbC9uJdEDalm2+0d41yzr8fujpZPpgOzrDwQzsw
	 xKQRSi5hf3RZg/Y6foPEYbTgSGy9ciV1FZXS3WUkyoflZBC9IsiYsrzErtYlUUqfHJ
	 Bfofy4PSKsnig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsS-00000000ojd-2EGx;
	Thu, 02 Jul 2026 16:03:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 12/28] arm64: Add FEAT_NV2p1 detection
Date: Thu,  2 Jul 2026 17:02:32 +0100
Message-ID: <20260702160248.1377250-13-maz@kernel.org>
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

Add the necessary NV2p1 probing to the cpufeature infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120f..c9c124b0ccc8e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2620,6 +2620,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 			{ /* Sentinel */ }
 		},
 	},
+	{
+		.desc = "FEAT_NV2p1",
+		.capability = ARM64_HAS_NV2P1,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_cpuid_feature,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV2P1)
+	},
 	{
 		.capability = ARM64_HAS_32BIT_EL0_DO_NOT_USE,
 		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
-- 
2.47.3


