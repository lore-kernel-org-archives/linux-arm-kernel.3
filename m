Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9571C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8cY/iQXo/TDFoSsAUyRfzYopAfoD86sWfH2T0S03zo=; b=iuUq25sa9Juk4P1AL2nywukwK+
	mPetUc/hyBFbo1rlj7tTq5obww+81FVWUfLw+MLEVYV2lR6sKAoyHgvlJ4rci+Ls0+ElkHZKpaxbL
	gc8XORCL6nU7A/beRdBi8UiNhc6ppQEW+hABhMshlIGl0oYw0Xpx/FXbwMl/DxmpCs3ttl2yG7rJI
	MeB+Rc36o7a0UGyv3q/7pxM2LWOB92INMrDYgTUssr2DjxMKmnvk64/zp8W0qePtBOaxE8PocJGV4
	lP8cq7HrkhVDDmDffI8OXvex7jVe2IYH8hgCHEM2lm0VJ35B6rz2iWjD3+BZDI0QWOdRpAfptNKEm
	TICP9OYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvZ-00000009ghM-27sk;
	Thu, 30 Jul 2026 07:11:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKur-00000009gN0-2I7y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2616600B1;
	Thu, 30 Jul 2026 07:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE711F01559;
	Thu, 30 Jul 2026 07:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395452;
	bh=z8cY/iQXo/TDFoSsAUyRfzYopAfoD86sWfH2T0S03zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XD9MLmlrVBZfdEOH9WMwmVH22u80Nl/6Mc1d1APYi+25nu4m3SAdlCSq5EIgeLPa3
	 SGcO9eek20QV0zB5m2kK8C9jKF0IPY5NAQPqu5klNs7gD+2eS1prYlhznrqqXpAauL
	 vs5HIoh9leskeR2ZFYOw2m3nYu4Qk0yXIYYZwkn6KIg8TOhs0GUl7fAiC59f9kptvj
	 BRJVuqozGjBlYDMqrEUOTJW9Sj+WWC+cwvmbeg7/6aTCoHdSAjeHfovl50qRCmgpE6
	 9moqO8QCwhiiUv51wJaHiuzvhAPEMw3IHkx3ePshhny6IpaLENvuLP7Bnx+R1WdavR
	 jf6ITrwCZcjKg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKuo-0000000AOpW-47OR;
	Thu, 30 Jul 2026 07:10:51 +0000
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
Subject: [PATCH v4 12/29] arm64: Add FEAT_NV2p1 detection
Date: Thu, 30 Jul 2026 08:10:05 +0100
Message-ID: <20260730071022.296811-13-maz@kernel.org>
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

Add the necessary NV2p1 probing to the cpufeature infrastructure.

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
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


