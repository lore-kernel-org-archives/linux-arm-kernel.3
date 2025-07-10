Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D868CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mTdWDS/zFUPThQCH/zowB4DE9FZW+pbIK3mxmJFS8GY=; b=SZl2Fe6fjblhmBV33VNAQel2Az
	fPSw3w0dVM8VqJhDfnTFESWgg+MWa7kvSmNMLT/I2DqfnH+byFbt+E6LwlON/fS/bvkvT8GBDYUJm
	GKZuXRz7SyRlQ5hbim5+Swy/Ma7CMt8Giu+Wc9f492FmJhopMkXbrluZdNOuoJn0pZ6NW05ALgG8h
	ZeQmL6MA7KRFenVHo05EzI6qms8gVt2k8WkSUh/vkE7C/WBUkKbqEvRouojZd96hY+8nMf8xeyJsw
	0Rb4p0XdkoiFI7WLHE9m57ezrMbuPjEZhIklig26xkyDxaUAfbjwLVQ7Zmjd/JxNlaCJDvUol0TTW
	Q/bPApWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqZP-0000000Bnq0-3mxW;
	Thu, 10 Jul 2025 12:40:12 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpD7-0000000Bb9W-2Gjv;
	Thu, 10 Jul 2025 11:13:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9065120E4B;
	Thu, 10 Jul 2025 13:13:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEsDnv1RYoAT; Thu, 10 Jul 2025 13:13:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752145980; bh=9/R3I2QTvmAT11keXIpb9oxTfzuCpNx6iVbeNs8GKZ4=;
	h=From:Date:Subject:To:Cc;
	b=ejolLtlCHS97Q1CYEqWwE0gQlrPQw7JSZkvhf6n+/CrhWa1jkT9GMnZUj0FDP+hBp
	 ihfPgVCgUYva5wryaflZjvltbfLC+O+kEkQqAhXXrNncS2MbWieZN2btBeGHNQFULT
	 nPi04s7nlGAsO2B+LJoQHJTLC/+xnYmf6JrLIntfOr5RdSMV22LR4p9ZvLbGpy2V2J
	 D4DmS+WgOyV0D1/igyKdVK3haZodOrgNH0gdNw1G0lDtOfvPdbslvVYgy5GVfPG297
	 hXkTSALlq2r7GMrIO0rrmv78f6Qke4FOHuanwRpnACUreNx3QqWd5KaUzAP/MuKFlI
	 oM2NSCdWX9ttg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 10 Jul 2025 16:42:48 +0530
Subject: [PATCH v2] phy: exynos-mipi-video: correct cam0 sysreg property
 name for exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-exynos7870-mipi-phy-fix-v2-1-5cf50d69c9d7@disroot.org>
X-B4-Tracking: v=1; b=H4sIAC+gb2gC/3WNQQqDMBBFryKz7pQxJY3tynsUF2omOosaSSQo4
 t2bCl12+R7893eIHIQjPIsdAieJ4qcM6lJAP7bTwCg2MyhSmu5KI6/b5KOpDOFbZsF53NDJiub
 GpNlVD0s95PUcOOuz/GoyjxIXH7bzKJVf+2uav81UIqFidm1XdZqsq63E4P1y9WGA5jiODzI1u
 PfAAAAA
X-Change-ID: 20250625-exynos7870-mipi-phy-fix-73e05ef89d0c
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752145974; l=1740;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=9/R3I2QTvmAT11keXIpb9oxTfzuCpNx6iVbeNs8GKZ4=;
 b=6zaZcpyBYmtLQRw2NAbiS13U61IX/RUnZZ3bzEL0nX80n8mv9RvaT2jnG/9yjwHrWTu90FXDx
 uNwFk+7suv+B/95Y73oY1OLSWQhtOS0DQ2Pa/Kna1vnYtDKvCKO3YfA
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_041305_998689_D1323E3E 
X-CRM114-Status: GOOD (  10.25  )
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

Fix the cam0 sysreg property name (samsung,cam0-sysreg), which has been
erroneously declared as samsung,cam-sysreg. This follows the same name
used in Exynos5433 PHY.

Fixes: 543f5e314282 ("phy: exynos-mipi-video: introduce support for exynos7870")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
A few issues have been realized after Exynos7870 MIPI PHY support got
merged [1], this patch series aims to address them.

More information about the fixes is provided in respective commit
descriptions.

[1] https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
---
Changes in v2:
- tweaked commit message of [v1 1/2] (krzk)
- dropped useless patch [v1 2/2]
- Link to v1: https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
---
 drivers/phy/samsung/phy-exynos-mipi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index b184923b9b400f0d536a913bdf32f3156c0a1854..be925508ed97a397239bd41f34b61ead20d04d27 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -218,7 +218,7 @@ static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
 	.regmap_names = {
 		"samsung,pmu-syscon",
 		"samsung,disp-sysreg",
-		"samsung,cam-sysreg"
+		"samsung,cam0-sysreg"
 	},
 	.num_phys = 4,
 	.phys = {

---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250625-exynos7870-mipi-phy-fix-73e05ef89d0c

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


