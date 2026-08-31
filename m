Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9F2C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhYmCE8JWDwElxQ/fb35Vb8cJTlQpSPNQqVHy+N4Zdw=; b=u+z5XpvvIeiVRLe0x4a8z3KtDi
	dh+CtvJ08jjg9UsquOgigoCBYiDkBIfY1GiLdQVNOVcS2G3A3ejg9+DR7SO0JzVpCB6CbUm1dcgUK
	sJRvcyP1y3H7Lk89jeYJtaZaX5rWqF7QCARLfbLkPgCo9z3efj7puojHdaXq3HVhrJyu8H9e+7iLl
	R+zYLyhsOLBlqCn5QLGXIqMYzFZfTacH1hvWf/ukHu8qFhBdBu9fBUu3hLwEn3QWzUP+DaaMPdEws
	85J38KIXGJkuA1fcwcOpfaIAKFf1eGver7aQpK/lmu/vn1Nl81uT/Y4u5YMRJGboBgWdn501tJ3VI
	V7bcLBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14eW-00000009zhk-3KGK;
	Mon, 31 Aug 2026 16:14:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14eL-00000009zXK-0Yke
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:14:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C65E1A1903;
	Mon, 31 Aug 2026 16:14:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EB4360231;
	Mon, 31 Aug 2026 16:14:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60D7A11C791C9;
	Mon, 31 Aug 2026 18:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NhYmCE8JWDwElxQ/fb35Vb8cJTlQpSPNQqVHy+N4Zdw=;
	b=L6VjYiMF/Tux5k/WrmkRwjCFQqDlOt9/JIy6Byv3YabST2iz7uWmSuXBKLyTXLF2/cN0zU
	kHJRn6lGbxkGYuEWoSDaQVcU8jb5fDDH8pwQPugXwUIoPgtf1e1GQlbof7jJaVbimwDCER
	OxWa1lKnBdEJPKMM5FFD22LxF6O2ZZqaMUtxzIhaMd/fcc2G5tGjqMF55yoqw1/DfLjYiY
	Rfps/3D9E7gSmhWHyrnaFwkB2syKcKxdjN4T5UqS3IyF/msuG5MYzd7mLRPT1w2hbvI//j
	1pRyZWtnbk7KfF+aFx3uUeTSxBygzB+qP82e38MzPyTU2g4T5dCqvfydACzmdw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:30 +0200
Subject: [PATCH v3 04/13] drm/bridge: ti-sn65dsi86: don't select unused
 DRM_PANEL, select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-4-50efd8168b3e@bootlin.com>
References: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
In-Reply-To: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 John Ripple <john.ripple@keysight.com>, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_091421_321743_2FD554AF 
X-CRM114-Status: GOOD (  10.88  )
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

This driver does not use the drm_panel APIs at all, so no need to select
DRM_PANEL.

But it uses devm_drm_of_get_bridge(), which is enabled by DRM_PANEL_BRIDGE.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Franz Schnyder <franz.schnyder@toradex.com>
Cc: John Ripple <john.ripple@keysight.com>
Cc: Michael Walle <mwalle@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e85952c76f02..b6754ee505d0 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -475,10 +475,10 @@ config DRM_TI_SN65DSI86
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
 	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_PANEL_BRIDGE
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 

-- 
2.55.0


