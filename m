Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A77CC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GQjGMZfQg+DH3KlhOlhqb0SmaT5ycc155rNIUpfXbw=; b=HroJySuS07MMeKXJyhxd6EjlW2
	DC87kfvkTKffAal58kojSfsI/LUa52qIKZ2od7g6ZkbAF1CsFOKnkkLi7Qv/e8UTYHTI33nblaaHS
	S0SjQ82APhywTm0iM6oyqfj2Yzlii7Pb96PyEejvz867q/qpvBKSyKVD+aphVbzw4K39VZaivcuYg
	ErW68DEAqpdZJ77IN8SFRQa4oQEa8JsLrkjVP/Aq5/UqZWJDr/j8hHtvcJrcKA8Rrshz4U0nXU+M0
	L+ldin3IIKmqvTDjQOq+tZsmH5yTR40f8/osz9cF3zLu4VIdpJZPJvfKlfN+DwIGLcXgKOaB3IM8W
	FhCJGPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtml-0000000CnbA-00xx;
	Thu, 26 Jun 2025 21:05:31 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsT5-0000000Cc8o-2LHH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:41:09 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5FBE225AFA;
	Thu, 26 Jun 2025 21:41:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFCUli431S5E; Thu, 26 Jun 2025 21:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966865; bh=u2gNoGL1EkUKTCKTqebfk2oKp+u2JbaoBZpY/Rvkb4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Lb3j0kGrriHaoBpC4hGLaDqjZ0kTOQ4BM2YaozjNb+EISLlOKii0na8hdm/PImaRT
	 FvrKztzM616N13kJN19V3aXYIKhLwsFc4mra8+0aD0cAD4N5VlTOVF5D+Yvs90Pt4u
	 xTjFPv72FZxuXp4SrsLqvm0h19IaSYYu+fh8Xj49E6wM8lDEWqQCVD7a9Vik2cP7xT
	 LktAuxOZOCYDWRLrQHR0p1CiY42rxBOSEYT48wEWqtYotsbi3PVLJ+c4fB8rzCXQ7l
	 y/3l9FkMlr6xPyvIMMA2X3+Zhs+TGy7A48vWNtHA9J2KNFoqopyEDvR2S/avRiC4TS
	 MJxt7zPuZJoMA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:58 +0530
Subject: [PATCH v2 09/13] drm/bridge: samsung-dsim: increase timeout value
 for PLL_STABLE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-9-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=926;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=u2gNoGL1EkUKTCKTqebfk2oKp+u2JbaoBZpY/Rvkb4g=;
 b=tuIO+GEyrWvCTjkPRhokjgmcnFCs1r/Ux62zw0hOtqO2IHMl5Gi3MccQ0YL91PrCUp0knSDAm
 b7R0B69o9RuDa3Cg6gLlmbOqv+gApGtxia1YDbaGcYIyV+xmJKhMGEB
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_124107_733423_3B73DB58 
X-CRM114-Status: GOOD (  11.37  )
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

Exynos7870's DSIM requires more time to stabilize its PLL. The current
timeout value, 1000, doesn't suffice. Increase the value to 3000, which
is just about enough as observed experimentally.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 739e1d1e6d239d06896daa131b692309cfeda843..5b96a5a1c78d212aca4e4fb057952927eb90f0d4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -752,7 +752,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
-	timeout = 1000;
+	timeout = 3000;
 	do {
 		if (timeout-- == 0) {
 			dev_err(dsi->dev, "PLL failed to stabilize\n");

-- 
2.49.0


