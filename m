Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F89EC982D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWkTccmCT3nJgrNSLZ1R/jzxD1Y0UvqRHyoXQxdCfEk=; b=KY1rhL9vWfrYSaCgD8SruN4k+X
	qJh4J+Bc7qqfbbAtyuYyL1cg4XCDJDo95w6b8WbkxeurcxGbmoQsKodtiYLt8eM4wEg09eyu/u28c
	dIGTxWEOcg8ECwB+3ciPBIPfpC/s1mVAXmE+4mVWSfRUDuEhsx4wc1MWI2qLc1qXSJVPBUKhagNFL
	n3h6U0tpiXrLA5i10uXuh+obr3oF/zwiC9vC8icwg7HtTZog1Um7+pwWmjJODxv6uum16sdlUzZWW
	TqFBujRbRxWUKgv9SjwI4bEv70tGNxWaogWcwsOG1XldwiTI1vN3e21UEFYLB39QILg9wfCbrETy9
	k2CESHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnEn-0000000EWrQ-1lnm;
	Fri, 16 Jan 2026 17:03:53 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnEh-0000000EWjB-3m7d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:03:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2E40DC1F1FC;
	Fri, 16 Jan 2026 17:03:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 004A3606F9;
	Fri, 16 Jan 2026 17:03:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A94F10B68CBF;
	Fri, 16 Jan 2026 18:03:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KWkTccmCT3nJgrNSLZ1R/jzxD1Y0UvqRHyoXQxdCfEk=;
	b=qTvzOgs+tc4rMUwHiT/QrZOzU93Knn19xArPLEb58gffYZU/JuNEc3O//HdtyBeUCAnA+p
	WDgRPipv7DjaJzUxNL192H5bePM+WtHTOLMix4MXj63HbOpeMa/eWoeHucc1gaBytuMYXM
	J9odq/Vhm0t6MlY/PcAAB6h6Ww/TD5AKEWxLyKkVeiilC2UPfxrZsiasFhN/L6bDYSNTiM
	PAwZhpMfkXqjUTJ2OsFonOtTjQ2Y6DQA/7MDuFIBHy8n8V+c6BkyDLZRGAI7GUO6DxWaIl
	OWNuIKTWk1hrH5/p7zSWqWTbyFMNJaN3I9zlQI/eheXxPMxSx/uIPqDHf3JwBg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:20 +0100
Subject: [PATCH v4 20/25] drm/tilcdc: Use devm_drm_of_get_bridge() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-20-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_090348_088027_7C5FABC6 
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

Replace drm_of_find_panel_or_bridge() with the newer
devm_drm_of_get_bridge() helper which simplifies the code by:
- Automatically handling both panel and bridge cases internally
- Managing the panel-to-bridge conversion when needed
- Using devres for resource management, eliminating manual cleanup

This removes the need for explicit panel-to-bridge conversion via
devm_drm_panel_bridge_add_typed() and the associated error handling path.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v4:
- New patch
---
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index a34a10337f6a8..546fe7e6ee815 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -55,15 +55,12 @@ int tilcdc_encoder_create(struct drm_device *ddev)
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	struct tilcdc_encoder *encoder;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	int ret;
 
-	ret = drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
-					  &panel, &bridge);
-	if (ret == -ENODEV)
+	bridge = devm_drm_of_get_bridge(ddev->dev, ddev->dev->of_node, 0, 0);
+	if (PTR_ERR(bridge) == -ENODEV)
 		return 0;
-	else if (ret)
-		return ret;
+	else if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	encoder = drmm_simple_encoder_alloc(ddev, struct tilcdc_encoder,
 					    base, DRM_MODE_ENCODER_NONE);
@@ -73,12 +70,5 @@ int tilcdc_encoder_create(struct drm_device *ddev)
 	}
 	priv->encoder = encoder;
 
-	if (panel) {
-		bridge = devm_drm_panel_bridge_add_typed(ddev->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
-
 	return tilcdc_attach_bridge(ddev, bridge);
 }

-- 
2.43.0


