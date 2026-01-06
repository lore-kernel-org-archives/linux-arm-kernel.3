Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A36CEFCE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHbKPaDVZD9oIsFLb8cqetcEgclBnBCWZdurRGChSkw=; b=jXrH+75kxkYDvyfUJn/ivRoLml
	ABNcZkAnnC6EJ/0j87zYCohc49oibzxUIuIbSGrmqoVzNyR68iCTJaaxzamHcbqyyha7DH8+czBfI
	92c3qr5yGHoL16J9fJpaOZc/8zoLSJxl75sFosj0Xp+WYQFsAM0NvKYjSTG2OHK+gfwvAyI/bCJBj
	/OXtitLAUqo8/QOSOp0PyPCUJ2vewZ7upgH9fQ6JXkyxY2YhxszbjGPRL/L6qR2Y+hRI4K1aIEHhU
	CZiAPwEKQkSMV2T1zgOPMMfcxyHEJaw22jQA0RqCYajgFi1f0J4t60OVAlV8iiDoRHyLNSksPocA2
	vJh2/q0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6r-0000000DcEW-2ZXy;
	Tue, 06 Jan 2026 17:44:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6c-0000000Dbyk-2JC2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:44:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0ABFE1A26A7;
	Tue,  6 Jan 2026 17:44:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C690160739;
	Tue,  6 Jan 2026 17:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F8A0103C833E;
	Tue,  6 Jan 2026 18:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YHbKPaDVZD9oIsFLb8cqetcEgclBnBCWZdurRGChSkw=;
	b=VhL7Q/dSj2dcihWHP71l2JbQyZSCNQ131KaaZ7hivnBM3lcBpma7Nc9EYLfUZgTlGeGBI/
	VKF29eiJEj8s2qOc+OVovgsC2hETa6OIj33qmkbjFIPD06HerznXQ8Ut9jTDrzQ9GAyTes
	T4kI0GKJ3+andQSbunb5kB9Pts+fjM+afDLP4JjzyDaKr5E/VX6fjAoKbWjO0/W4+KFM7E
	rdaTFIKwm55gDsLThc4TL6+3MXvHAhoCxnZVPLl2A5F+W67bZzTZUPl0xDXtaAi6nPpXPh
	D+XbOF1sfg+aNUaWalHEXG2YiGWo94ifa+tKyydp8VltNFBkd6u84s5eJfInOw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:34 +0100
Subject: [PATCH v3 18/22] drm/bridge: tda998x: Remove component support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-18-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
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
X-CRM114-CacheID: sfid-20260106_094430_859529_9F845E30 
X-CRM114-Status: GOOD (  14.94  )
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


