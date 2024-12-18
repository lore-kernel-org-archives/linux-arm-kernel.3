Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F3DE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/haLBxEkL3w5x8REE76F6woRrHaJ+tBFsJGgFIA/Elk=; b=DyTpRORaAbtqlSzaicdOaeBG06
	qtQOiw3pA/Ran9dxu25DnbUZ4VQTkmzGdvl4SuZu4h2IplgOkgaEa50dydEnriwI3NkRo/GeplnXC
	ysy5UQAzAEPEkb9bAHY5TP0lXDw4lyjsmnouTYJEjBHPl9frDKWIoZud6TQDl57ILe25YIqzOuE7Z
	nXSsCerRMEZvBYO8ExrXl4JNk+aa6bsUBPkJmk6dui0K+Nw9M3Mb8xsgBwqisFVQCkl70COFuZOCL
	quFzgmdE2qowIMLAcC45S2DZCQ/7hfOYP4Wx+sOmgX5sTNSVR0RPTYChfpDmtbm9TokMl8oqktYwa
	Yed63Svw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpuL-0000000FziN-0cVv;
	Wed, 18 Dec 2024 08:59:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNptF-0000000FzXJ-0uhj;
	Wed, 18 Dec 2024 08:58:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92CA4A41F29;
	Wed, 18 Dec 2024 08:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACC1C4CECE;
	Wed, 18 Dec 2024 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734512323;
	bh=M2Wyl4Lv1wHFs941v1P1F99J3xEnjWFBD0Qgq765OIM=;
	h=From:To:Cc:Subject:Date:From;
	b=S+krT84wnor5H/vWle8Z95MXfl65nY3TVBPY607j/TfWotnt7RRwKTyIjeLsKLPmK
	 UW83mVu5r9tmTbrjy+7aWbqqdbQY1sg8OOzzUqwH0ZhRjRyGde5v1CNCVRp4rlLzbe
	 1/X/SlXMvaJ71lttwKL0YlXC4H9wIEr+imrKm+xD1Rvy7bJKyAGcvMP0vO/HdqRaU9
	 aF0VM/weLRcvsakdPPLJ7t7bsx3pC0uk5oRyilWnqMfOHwStnkRFjZhB4t7iZcxgdP
	 ysxxbfYpGGPDy9wwBvkE9S/tUnVW5Uqvf0K7jh1ucVASrQCxY+WqyDV9tInYWdg1oW
	 /EYuh7zsQNLMw==
From: Arnd Bergmann <arnd@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: stop selecting foreign drivers
Date: Wed, 18 Dec 2024 09:58:31 +0100
Message-Id: <20241218085837.2670434-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_005845_321275_EA069713 
X-CRM114-Status: GOOD (  13.14  )
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

From: Arnd Bergmann <arnd@arndb.de>

The PHY portion of the mediatek hdmi driver was originally part of
the driver it self and later split out into drivers/phy, which a
'select' to keep the prior behavior.

However, this leads to build failures when the PHY driver cannot
be built:

WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
  Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK [=y] && OF [=y] && REGULATOR [=n]
  Selected by [m]:
  - DRM_MEDIATEK_HDMI [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_MEDIATEK [=m]
ERROR: modpost: "devm_regulator_register" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!
ERROR: modpost: "rdev_get_drvdata" [drivers/phy/mediatek/phy-mtk-hdmi-drv.ko] undefined!

The best option here is to just not select the phy driver and leave that
up to the defconfig. Do the same for the other PHY and memory drivers
selected here as well for consistency.

Fixes: a481bf2f0ca4 ("drm/mediatek: Separate mtk_hdmi_phy to an independent module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/mediatek/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 1c2f56b75716..1d4f20a4f265 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -15,9 +15,6 @@ config DRM_MEDIATEK
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_MIPI_DSI
 	select DRM_PANEL
-	select MEMORY
-	select MTK_SMI
-	select PHY_MTK_MIPI_DSI
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you have a Mediatek SoCs.
@@ -28,7 +25,6 @@ config DRM_MEDIATEK
 config DRM_MEDIATEK_DP
 	tristate "DRM DPTX Support for MediaTek SoCs"
 	depends on DRM_MEDIATEK
-	select PHY_MTK_DP
 	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_DP_AUX_BUS
@@ -39,6 +35,5 @@ config DRM_MEDIATEK_HDMI
 	tristate "DRM HDMI Support for Mediatek SoCs"
 	depends on DRM_MEDIATEK
 	select SND_SOC_HDMI_CODEC if SND_SOC
-	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
-- 
2.39.5


