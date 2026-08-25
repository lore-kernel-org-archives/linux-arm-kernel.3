Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFAEC61DB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uARNe6VN+s1tkRKTutkLW+RJC97YGCdMUaQW0r6CuJE=; b=syZ61bdFlYeop1CJ4f0QJGq9zf
	HHz/QXjRWDRIRpj4KZ1RASBXNZJYQwrDihOV6RgWm4h8/owFXp5euguYc2BRD/9UnwFKU8p2GuoBk
	QjXwVLteQWX7fXmDw2IsELxfTGV/PtSA875vC/gftDyT0+4z0qosFMs4DWzMUft/74gqz+kFIyrd7
	paGQEvSpP/8oaEUyXrH0EmU0yxkXQnaqbQLEuRGq6+lIY0U/vrEilTF2afv7Vur5PqoQCuad0STAN
	Z+9JE/DL2Bpb+R90YybYmh46A1Qskb1SkE3Y+cDSCZ2jF88+JM0kLzbR9xhIPl4ffn36NL5NErDkt
	YfJgsYdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo7v-00000000Yyj-3lKH;
	Tue, 25 Aug 2026 10:11:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyo7m-00000000Yrb-02dY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:11:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 82F5F4E412E5;
	Tue, 25 Aug 2026 10:11:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5651B604C4;
	Tue, 25 Aug 2026 10:11:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E698511C7A3C5;
	Tue, 25 Aug 2026 12:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787652675; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uARNe6VN+s1tkRKTutkLW+RJC97YGCdMUaQW0r6CuJE=;
	b=i/5L0Z/7n8y+hHHZKeDAYGjziy0tTwBcX/xv6NsEq2EN38y1FYiwIZ+S+qdSFzdJlsL1Fv
	kgnU3ICi1k02d9d0DK8ZVxr1VqxFcOCNWOM6Ep6S3xaWnQjVE8Mw9SK7sVFjgoRZhmMUfY
	ZYYoYyvJnHg0uZjvXHq+yToaM58aaqP0/GhhDBELWmwP8Q0xEgK3kyPRr4c9ZANndobyal
	zcNtU4rVWkl9HXJz9ZV50MpbXFcFuUd6cGsra+0h14RkEP/Jtayw/LUBICAFbnFtfLrpOY
	7sEflYZO1FrPw5hap5vDrLvKWUiHHPKDPtsCzkwpPX4XZ8QKfNcxQU9nCItFvg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Aug 2026 12:09:38 +0200
Subject: [PATCH v2 05/12] drm/bridge: ti-sn65dsi83: select DRM_PANEL_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-drm-bridge-drm_panel-cleanup-v2-5-c6c88ba7ffd2@bootlin.com>
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>, 
 Sudarshan Shetty <tessolveupstream@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Herve Codina <herve.codina@bootlin.com>, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_031125_939057_63891A77 
X-CRM114-Status: GOOD (  11.17  )
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

This driver uses the drm_panel_bridge API and not the drm_panel API so it
should select DRM_PANEL_BRIDGE and not DRM_PANEL.

Cc: Marek Vasut <marex@denx.de>
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Esben Haabendal <esben@geanix.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index d46aa2eb01b5..03f52dcbba6f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -461,7 +461,7 @@ config DRM_TI_SN65DSI83
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	select DRM_MIPI_DSI
 	help
 	  Texas Instruments SN65DSI83 and SN65DSI84 DSI to LVDS Bridge driver

-- 
2.55.0


