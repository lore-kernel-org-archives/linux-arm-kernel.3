Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1F1CF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aGTRPFswueXeCZiT71gmlSuW3wbHwKGbQpdBTPnGXM=; b=QFWWLEFkiwHDHER00BkBbOGxYl
	/Z+p2jW5PRSo4duv2HEVvasBNohKsELDvqvKe4x9Bxq5Z9WCix5S83AwK+nXRCJmZNu65Lkd5o8re
	t7oQUgA+JENWEFJTMobIXudR7dCJkZpe7B99x/cnaYCucYrfSeAEmqfnRCoWMbJAJ796Lb4BFUcoL
	aIL1iBLl1r9PTkXP/EBaQzSOHZB+5fivANy91yZDO/EjiGW6OMRqMFXjEwvVBH64E7qRw43gj73kB
	goXLx9+veXtHpisSUSpVrOvLmpXOFbHOcdZhm7p3Eg7BVHe/xfQJ6GtDDgFHT+KBZeaJqA52f/Jpp
	sFhVseqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cn4-0000000Eq6f-3o2c;
	Wed, 23 Oct 2024 14:56:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckC-0000000EpGs-3ca6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7ECCA44FB1;
	Wed, 23 Oct 2024 14:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27FAC4CEE6;
	Wed, 23 Oct 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695231;
	bh=iNfYJ4JXlpAYVqAHGPpB7Ak03akbgaV2OHGu0ciE5wM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mOa9l1fLqxHoh/XYX8XHW0anBL3x6wpjc4bpwozLdbM2uPVZtcuFmFLvh4I2duAIF
	 kv2RAx1vnmSjRv14ItIOx/RYeYxHLfDV0Y+R6niwTzgbSyv7UOvMmqzI7xxIGnJ78B
	 jQCXnee4CQTSuXEXhYmpLkLhrDGJ7ngqQ/88eaGK0KsvAKgif1CevJ+PjhafKHYNuL
	 avRFIQAMVE+gsyfqxuvvcm+SgCTXnyrzPyRiJzhZ/G+5GZyVJab0zYeLC6GDyuG8Zo
	 tBHZC5LJdqsMefKpJ+6fJNydVOIx2/sP6I8FyOqRAiR86Dx+1rOHATT7oPRhak+/JE
	 ZFBIJPJOQTeKw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ck9-0068vz-N6;
	Wed, 23 Oct 2024 15:53:49 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 01/37] arm64: Drop SKL0/SKL1 from TCR2_EL2
Date: Wed, 23 Oct 2024 15:53:09 +0100
Message-Id: <20241023145345.1613824-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075352_983216_247158CE 
X-CRM114-Status: GOOD (  11.04  )
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

Despite what the documentation says, TCR2_EL2.{SKL0,SKL1} do not exist,
and the corresponding information is in the respective TTBRx_EL2. This
is a leftover from a development version of the architecture.

This change makes TCR2_EL2 similar to TCR2_EL1 in that respect.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8d637ac4b7c6b..ee3adec6a7c82 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2819,8 +2819,7 @@ Field	13	AMEC1
 Field	12	AMEC0
 Field	11	HAFT
 Field	10	PTTWI
-Field	9:8	SKL1
-Field	7:6	SKL0
+Res0	9:6
 Field	5	D128
 Field	4	AIE
 Field	3	POE
-- 
2.39.2


