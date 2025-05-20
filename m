Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA506C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/x15elElanL7qaFh1R7g+5W1hDLvpE2h043jJ+xM8A=; b=sPuwBPbtwIZbdTU8Geljpst5wu
	IjJAVJdQx2u6weI4qvFVd+NPOJlslXHJ2/OwLEQk34WNEiXNHxhdQc76BonpgHGK87Aatz87nV2Mv
	9v3r/7E9kpT0HJV8i3TkAc7YAUmIn94QI+HBYKvD7fbjACKKwyiXSeMOGhnuxA/gMpzS75WDxOJ/e
	/0u1zgTsRnlpc/QwNkYjodNUio+yCrDXY0TyVtMoQ5oMqZ0wjKis3zFDJzvu/JR1/6/5aetVEM0jN
	fa8vvwx0cl26IIVPBZxJlb9K+xK5v1jfG99kzzyFXBSKugGTSt/wtOeuEwvsxkqrbGhkXOzLx5EWy
	BGK9WNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQaP-0000000Df4e-2bhJ;
	Tue, 20 May 2025 17:17:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQU3-0000000DeOE-3SvV;
	Tue, 20 May 2025 17:10:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE58B152B;
	Tue, 20 May 2025 10:10:17 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 017173F5A1;
	Tue, 20 May 2025 10:10:29 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: ulf.hansson@linaro.org,
	heiko@sntech.de,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com
Cc: linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] pmdomain: rockchip: Relax SMCCC dependency
Date: Tue, 20 May 2025 18:10:17 +0100
Message-Id: <6f0a38e596c0727d0de13a29c9224f71bc7d30f1.1747760015.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com>
References: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_101031_941915_BF9A2848 
X-CRM114-Status: UNSURE (   9.55  )
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

Most 32-bit Rockchip platforms do not use PSCI, so having to select
ARM_PSCI to satisfy a dependency chain to retain working power domain
support is a bit weird and non-obvious. Now that the offending SMCCC API
is properly stubbed out for optional usage, we can relax this again.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/pmdomain/rockchip/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/Kconfig b/drivers/pmdomain/rockchip/Kconfig
index 218d43186e5b..ffe5e7b78494 100644
--- a/drivers/pmdomain/rockchip/Kconfig
+++ b/drivers/pmdomain/rockchip/Kconfig
@@ -4,7 +4,6 @@ if ARCH_ROCKCHIP || COMPILE_TEST
 config ROCKCHIP_PM_DOMAINS
 	bool "Rockchip generic power domain"
 	depends on PM
-	depends on HAVE_ARM_SMCCC_DISCOVERY
 	depends on REGULATOR
 	select PM_GENERIC_DOMAINS
 	help
-- 
2.39.2.101.g768bb238c484.dirty


