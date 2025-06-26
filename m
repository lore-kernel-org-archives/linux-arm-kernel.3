Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188BEC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JH5+48wSXaYdHewMXLk+z3QbPdZ2qJNW91CN+1RXL4=; b=f1MqzN6sKyQ9P64xsUQRAOLSkI
	pFJIUeNLEH5kvMWxlDK59Q0kTAIQA+OAxfz2apcNDqsXt2Gm9Z4E79XSThHBOBbQqbieiUEmSvyea
	J2bKNMOmHFVGiDHEvrZmUL3UkkJReCL6Preu0KnYvg37esUd/1pN52hQebAwBGyF2XWOxNYN2BQh6
	PAGAnNW3rM9zr9+Zgw2pYrPcgFPi89YVShPLfBE08JC8zvAWKHW8gIzUr6gvUoi1pteK/5SxM4Cpf
	hwIHvTkOcC3V06Fm+uO4r5MYF+x+r1ELvK69xNU9QRhkcI/muOsYcbvIuTDVTjBHFYDNjZOHWITe4
	7hgFx10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuFm-0000000CqsX-09qR;
	Thu, 26 Jun 2025 21:35:30 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsnc-0000000Cg88-1qW5;
	Thu, 26 Jun 2025 20:02:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 440482602D;
	Thu, 26 Jun 2025 22:02:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUiS0VPo8D-v; Thu, 26 Jun 2025 22:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968138; bh=ydhmfATLWHhbM+4c9MW00pJAm8CsSLrYzuzsSmtqaoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ba7oH6qU6ZOOvx6+c/+ihZu/0IaAYOoFLANamYCDpRdo7bzKfeX/FLJb8NR8we6k9
	 bYwl+6GW1Pot10ZW0euszS5TgT3nB0/jeRIKcgG/lPgpAIwivhD9wOq7fMGje8xigj
	 D4EFCYF8A+qWpCNi35AtQ6qDjuImfXfxl9q3YNXb61fR8iaFJxeS/pn7yy6JL411nQ
	 wS0OfDc5Hjg+NCGFzdIX0yC/GKxLFn82vlWrtEYzl0g3c9OeCwlmvdEWcTxqcFq4Km
	 xbaa6oJPGGkI3p4or7ZwDOusSmXatv1D6GN9oc7Wg2K36ERijHtN6n8rwEqVOegXKf
	 wH/wz3Wq56YAQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:31:54 +0530
Subject: [PATCH 1/2] phy: exynos-mipi-video: correct cam0 sysreg compatible
 for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-mipi-phy-fix-v1-1-2eefab8b50df@disroot.org>
References: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
In-Reply-To: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968127; l=999;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ydhmfATLWHhbM+4c9MW00pJAm8CsSLrYzuzsSmtqaoM=;
 b=8UzxlGLWQP1Bs9m6KMhe5vfmpFViPIPyBi3S8jqcRvLGanuRHkyEceGeYjEPRLy7VZXNHm7bO
 2ofPkwC5RR3C/brHkQfumNbbh4NdcG1e1DZQgN2jUA3tQ9mXFEcY5eM
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130220_614908_B29191FE 
X-CRM114-Status: UNSURE (   8.71  )
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

Fix the cam0 sysreg compatible (samsung,cam0-sysreg), which has been
erroneously declared as samsung,cam-sysreg. This follows the same
compatible name used in Exynos5433 PHY.

Fixes: 543f5e314282 ("phy: exynos-mipi-video: introduce support for exynos7870")
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/phy/samsung/phy-exynos-mipi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index b184923b9b400f0d536a913bdf32f3156c0a1854..1c9c340f708da0ca214639880d067706aaea8fc7 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -218,7 +218,7 @@ static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
 	.regmap_names = {
 		"samsung,pmu-syscon",
 		"samsung,disp-sysreg",
-		"samsung,cam-sysreg"
+		"samsung,cam0-sysreg",
 	},
 	.num_phys = 4,
 	.phys = {

-- 
2.49.0


