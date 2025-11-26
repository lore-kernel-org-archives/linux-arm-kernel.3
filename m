Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948EDD1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFYO1hMjh+ojxn3ao9UYcbfORVs++O50xYESXZqfA2o=; b=w6TUTMMTHAqojiX6WDZ9gtzGnH
	9TyHhuII2xSPrlUG4cddp9wOikt2Vei5iHTprQQgRyNiObfL355D79LbvzKp4OH12suaE9NJXwESO
	mL2tp7Nb5K1av/VLIE76ZN5ygZADkKUJZuUkV+QDw2nhu5MpWmrrJRE2MQ+XBDhmBGzQnrTdzWUr0
	SnBzeUxe8B5Ro2ulbKYHg55jfhdOthGw9xLROc/xBPNOADn65YglR1QUFfmJWLSniiWZu2WqY6biX
	TTyGNAJXQcMYWZaAa/3YpLrY4AlBtDo/r1It2oJS2SH/x+fWbCOFjoSNyqM94TittsTPcyRMCqo87
	ZCk44m3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJSf-0000000FPLd-0wa3;
	Wed, 26 Nov 2025 17:37:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJSF-0000000FOvH-1zUZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:37:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 168A61A1D86;
	Wed, 26 Nov 2025 17:37:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8FE360721;
	Wed, 26 Nov 2025 17:37:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC482102F22D9;
	Wed, 26 Nov 2025 18:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XFYO1hMjh+ojxn3ao9UYcbfORVs++O50xYESXZqfA2o=;
	b=Vu2M24bufGaGBUUkltDHs5AS5qHb5HuV/7MU/SkmdjHjG23HSFmAOyn1cL57gCnDS1FuNA
	dFQLvtfNzqE7/JTGA9PzLdQMMDLQa6HRrVxAy1j5znw78pyX3QNkaWwNsyd9w1/nTozxW5
	WnWd4UHE6jLn6KyZsHSQNMAuxCqMMFV9lxMmlL7CUcq86GvCIY+FvgWuO8lIVB+k+y6Vco
	nW9ZuvpQHgxny6Jswnn+/mSZpdcm+rFohVOeHqEvt7U8pr5mLHK3csPTxLF+lGjR7Cfzbg
	rH25wz99piFoZ1zCUXeQ5rurLrZ4c44tjDYpX7P8L4IK7Z2fdZepjP3z9m9S2A==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:54 +0100
Subject: [PATCH 12/21] drm/tilcdc: Rename external_encoder and
 external_connector to encoder and connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-12-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_093723_763453_974CB52D 
X-CRM114-Status: GOOD (  15.93  )
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

Remove the "external_" prefix from encoder and connector members in the
tilcdc driver. These are internal driver structures and the "external"
naming is misleading. The simpler names better reflect that these are
the primary encoder and connector managed by this driver.

Also rename tilcdc_attach_external_device() to tilcdc_encoder_create()
for consistency and to better describe the function's purpose.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c      |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 24 ++++++++++++------------
 drivers/gpu/drm/tilcdc/tilcdc_external.h |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index c9d4f462ec1bb..8a4fb75f660fe 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -324,11 +324,11 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	}
 #endif
 
-	ret = tilcdc_attach_external_device(ddev);
+	ret = tilcdc_encoder_create(ddev);
 	if (ret)
 		goto unregister_cpufreq_notif;
 
-	if (!priv->external_connector) {
+	if (!priv->connector) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
 		goto unregister_cpufreq_notif;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 717529a331009..dafb00908d1d4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -75,8 +75,8 @@ struct tilcdc_drm_private {
 
 	struct drm_crtc *crtc;
 
-	struct drm_encoder *external_encoder;
-	struct drm_connector *external_connector;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector;
 
 	bool irq_enabled;
 };
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 81c90c2754c6c..0c18d05dc7101 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -37,21 +37,21 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 	struct tilcdc_drm_private *priv = ddev->dev_private;
 	int ret;
 
-	priv->external_encoder->possible_crtcs = BIT(0);
+	priv->encoder->possible_crtcs = BIT(0);
 
-	ret = drm_bridge_attach(priv->external_encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(priv->encoder, bridge, NULL, 0);
 	if (ret)
 		return ret;
 
-	priv->external_connector =
-		tilcdc_encoder_find_connector(ddev, priv->external_encoder);
-	if (!priv->external_connector)
+	priv->connector =
+		tilcdc_encoder_find_connector(ddev, priv->encoder);
+	if (!priv->connector)
 		return -ENODEV;
 
 	return 0;
 }
 
-int tilcdc_attach_external_device(struct drm_device *ddev)
+int tilcdc_encoder_create(struct drm_device *ddev)
 {
 	struct tilcdc_drm_private *priv = ddev->dev_private;
 	struct drm_bridge *bridge;
@@ -65,13 +65,13 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	else if (ret)
 		return ret;
 
-	priv->external_encoder = devm_kzalloc(ddev->dev,
-					      sizeof(*priv->external_encoder),
-					      GFP_KERNEL);
-	if (!priv->external_encoder)
+	priv->encoder = devm_kzalloc(ddev->dev,
+				     sizeof(*priv->encoder),
+				     GFP_KERNEL);
+	if (!priv->encoder)
 		return -ENOMEM;
 
-	ret = drm_simple_encoder_init(ddev, priv->external_encoder,
+	ret = drm_simple_encoder_init(ddev, priv->encoder,
 				      DRM_MODE_ENCODER_NONE);
 	if (ret) {
 		dev_err(ddev->dev, "drm_encoder_init() failed %d\n", ret);
@@ -94,6 +94,6 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	return 0;
 
 err_encoder_cleanup:
-	drm_encoder_cleanup(priv->external_encoder);
+	drm_encoder_cleanup(priv->encoder);
 	return ret;
 }
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.h b/drivers/gpu/drm/tilcdc/tilcdc_external.h
index 285a132f3035d..c8f87f59024e6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.h
@@ -7,5 +7,5 @@
 #ifndef __TILCDC_EXTERNAL_H__
 #define __TILCDC_EXTERNAL_H__
 
-int tilcdc_attach_external_device(struct drm_device *ddev);
+int tilcdc_encoder_create(struct drm_device *ddev);
 #endif /* __TILCDC_SLAVE_H__ */

-- 
2.43.0


