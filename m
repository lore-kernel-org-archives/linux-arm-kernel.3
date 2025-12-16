Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB257D5E13D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTpHCQitfi8TKGp4ltc6l5X/3hGUd4W8RAwhKfH5B+s=; b=cj3XoImljJm79KK5bNim64w7/t
	TSxrgNN07Z74mt8ppSE2t7psuxr5KdUkoQvdukjyvljTmyWGWDED+UcxibK81olahXNsvakjAQfHf
	jYt5wXt/T2rn+mvxg3o5M0/5p1dBItnRn0Imd29xtMaTqjxlqAj/idOLZMhSVO3iqh8svgbDDETmC
	9ZVT8FirG5It4pramMoLw4vV3RS3cCqmwwClrJKCERMTdkLQysfaqD0NzezxJ9KHfPIZPnxUOa++H
	5bOwQIIyFz6SAc4ChTW8cH8YZr07oY7NnO3Lb+ZtPdaeZRSYl1owivqf0qDoBFXp7Qmq8zMNhC8cS
	r87ya9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLQ-00000005eWa-46yJ;
	Tue, 16 Dec 2025 18:00:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLO-00000005eSL-3h8C
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GTpHCQitfi8TKGp4ltc6l5X/3hGUd4W8RAwhKfH5B+s=; b=aC5hCF/ecgakPOYbCQ1QGYxGPv
	Pn+Z/Kr2TLDp1D0I3UZb54dRIni49zvIpAgo7fXOhq+SEl9iFgPcwAJqSDsMAEXOmNjA/ZqtNMG0p
	eQQmXjKPLi8i2yQMkGeyHMs07ag3tYAUNwjaIs8ko823hjR5dfdd/qISjtp9PkN0VAEK0iTu0BWuq
	Og3u6xS3fZ1YkWHNpvAvMOxD67xF7sqf4VRJUDIpYQwpUloYJAY0EFM5mAMC5dxpZqcNYWhrXHiP6
	DamoCuRXglzfBP4eTT69KpwyN/28ZTLJBxgwY28htrykQppLhReT+aZbrF4js6YRd3LN/NJrTuQT5
	YmPFPSvA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYTp-00000005JZD-1teR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:05:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AEBA1A2214;
	Tue, 16 Dec 2025 18:00:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCDBE6071C;
	Tue, 16 Dec 2025 18:00:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58956119A97D5;
	Tue, 16 Dec 2025 19:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GTpHCQitfi8TKGp4ltc6l5X/3hGUd4W8RAwhKfH5B+s=;
	b=YTYB0YhzjjTTgzdv0SfV0tdpbiL0U77KW7nyVZHlfowvzbiCHbjQIO0Rd92LvYfebaoxsX
	aARGAKYE4LBOiE9c0j0MUm/b+x/I03+9LCYx3eOfneq6yiI8dG0YrZYtU7v1U736PHBkCT
	Ymxe4fTEiykO2aucimaxodwoP5tBolmgftfM6JpwOUCOaux9GoIEt4fdMa8LZ/OPtvNKa/
	lo5xJVqZxsPasCP5cb3+C0EahLqHNLrJsyjeNcGOYDtWpUUVL3Lp2k1KlKFAaFT8q5lA7j
	i8bXREnTqViEXutDMVNTC56WF0U4b69ALtNnqW5Lw/9Bs6mCDp5M7GA5mmAwzQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:44 +0100
Subject: [PATCH v3 11/22] drm/meson: encoder_dsi: get/put the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_170459_588735_F1CC51A4 
X-CRM114-Status: GOOD (  11.91  )
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 6c6624f9ba24..eba246791c68 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -25,7 +25,6 @@
 struct meson_encoder_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct meson_drm *priv;
 };
 
@@ -38,7 +37,7 @@ static int meson_encoder_dsi_attach(struct drm_bridge *bridge,
 {
 	struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
 
-	return drm_bridge_attach(encoder, encoder_dsi->next_bridge,
+	return drm_bridge_attach(encoder, encoder_dsi->bridge.next_bridge,
 				 &encoder_dsi->bridge, flags);
 }
 
@@ -120,8 +119,8 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
-	if (!meson_encoder_dsi->next_bridge)
+	meson_encoder_dsi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	if (!meson_encoder_dsi->bridge.next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");
 

-- 
2.52.0


