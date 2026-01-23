Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F06BD74EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHbKPaDVZD9oIsFLb8cqetcEgclBnBCWZdurRGChSkw=; b=z2mO3i25gRtyEb9AaoJNwdyRTu
	DEAc1KXrC75jevKNJDFTPTH1D4JXkpku/gToSvD3FnLKHyb/QJzXbhZ5ooWwTD+F9QZMTptu4wtoj
	TIaKzpQRHiZIWYq2qWfj8DzXLN5X5+dMoNYqZIDN2IQ2J3sjTIPeV61KiuoCjh5Ve0vvekUW4zTEx
	8Dfe87EBBQYQwE2UweHiEtz7w1gtXaPCveQ7mw+wFzxdLnviicDipQoxapqb6tZiXLM7Lw5LRyjSv
	FN4nHM7JptRZCuA2XLuAzPUf4z/sA+RP1j8YtlclJBaidUu2yBEWMUu8FaRFmG5rRucTPcikdcirU
	7n/Op37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJnd-00000009AlV-2rCx;
	Fri, 23 Jan 2026 16:14:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJn9-00000009AFi-3JHB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:13:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 607581A2A64;
	Fri, 23 Jan 2026 16:13:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D42B6070A;
	Fri, 23 Jan 2026 16:13:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72451119A87DD;
	Fri, 23 Jan 2026 17:13:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769184824; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YHbKPaDVZD9oIsFLb8cqetcEgclBnBCWZdurRGChSkw=;
	b=1kWLeA3wkhRHAa49z7tr6TvHUWMjOb7YiYss45br2qDTJiihGY3XM6gt9+Jr7x9jNeTLXk
	mK+6YZ4gleeCQQhH7HBTeG9Unl3N43Jzw2wH6ThLq+rROOnDRniLzJJJofv6bJgQtc5a51
	AWM8lWkIqfEiNQwAGZh64i/uNxjHrvN2sPPUT3cJBt7BgVmZ+rSGlmKRAIaz3Gbwmk1eY5
	pk/GtkzexYBmt3KwkY4JY/p4EBAi0pfzn0swo5wOSEilMp+ZPiLItPYg9nOtJ8Q+M60EBB
	hLWZasrnZ/BhM5zsOijaKBenESm9Ud1EjVGt9FmCR4botoYt6og1x7EAzSDc7Q==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:39 +0100
Subject: [PATCH v5 21/25] drm/bridge: tda998x: Remove component support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-21-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
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
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_081348_054388_F6BFEE62 
X-CRM114-Status: GOOD (  14.04  )
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

The tilcdc driver no longer uses the component framework to bind the
tda998x bridge driver. The component bind/unbind operations and the
encoder initialization code are now dead code and can be safely removed.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 69 +-----------------------------------
 1 file changed, 1 insertion(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index e636459d91857..865285ba2bd8c 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -4,7 +4,6 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/component.h>
 #include <linux/gpio/consumer.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
@@ -1963,85 +1962,19 @@ static int tda998x_create(struct device *dev)
 	return ret;
 }
 
-/* DRM encoder functions */
-
-static int tda998x_encoder_init(struct device *dev, struct drm_device *drm)
-{
-	struct tda998x_priv *priv = dev_get_drvdata(dev);
-	u32 crtcs = 0;
-	int ret;
-
-	if (dev->of_node)
-		crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-
-	/* If no CRTCs were found, fall back to our old behaviour */
-	if (crtcs == 0) {
-		dev_warn(dev, "Falling back to first CRTC\n");
-		crtcs = 1 << 0;
-	}
-
-	priv->encoder.possible_crtcs = crtcs;
-
-	ret = drm_simple_encoder_init(drm, &priv->encoder,
-				      DRM_MODE_ENCODER_TMDS);
-	if (ret)
-		goto err_encoder;
-
-	ret = drm_bridge_attach(&priv->encoder, &priv->bridge, NULL, 0);
-	if (ret)
-		goto err_bridge;
-
-	return 0;
-
-err_bridge:
-	drm_encoder_cleanup(&priv->encoder);
-err_encoder:
-	return ret;
-}
-
-static int tda998x_bind(struct device *dev, struct device *master, void *data)
-{
-	struct drm_device *drm = data;
-
-	return tda998x_encoder_init(dev, drm);
-}
-
-static void tda998x_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct tda998x_priv *priv = dev_get_drvdata(dev);
-
-	drm_encoder_cleanup(&priv->encoder);
-}
-
-static const struct component_ops tda998x_ops = {
-	.bind = tda998x_bind,
-	.unbind = tda998x_unbind,
-};
-
 static int
 tda998x_probe(struct i2c_client *client)
 {
-	int ret;
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_warn(&client->dev, "adapter does not support I2C\n");
 		return -EIO;
 	}
 
-	ret = tda998x_create(&client->dev);
-	if (ret)
-		return ret;
-
-	ret = component_add(&client->dev, &tda998x_ops);
-	if (ret)
-		tda998x_destroy(&client->dev);
-	return ret;
+	return tda998x_create(&client->dev);
 }
 
 static void tda998x_remove(struct i2c_client *client)
 {
-	component_del(&client->dev, &tda998x_ops);
 	tda998x_destroy(&client->dev);
 }
 

-- 
2.43.0


