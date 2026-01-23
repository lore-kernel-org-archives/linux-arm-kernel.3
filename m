Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FC8D74EFB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GblQt8zBoa2ANU1FwVR4LDs1StFgzUT9KSZK3+2sTv4=; b=E3p3Sxoplk0dP36xckwiwZa2Kn
	DfA23RjJQu+rClRU/+veVq3sI57GaQbE9LLU3M2mSjpt3W68BHs+q/SFz7fANxf7XVkcMU7kNnLHw
	F+kQOb4foAQPba+OmiwAuJzyVOLmMMRvTzrL2mpNAuTMI5R/gueEYjPTmZ/dieivs0F4utyG0+FXR
	PqW3umxMpOA1If6RcDkXdHGJFxIMWmA+4DFQnsn0N/JE0hevPVsH7vpobFzpm6apix5wHUS033OE5
	lW8JP8hCvDqyHrMZKLiD6PQXEbQMny5XnHCNyT4fIgVEtdAhMGeIVtTQf5sJ/EvQfApg5CbB2ah3M
	rz6vK/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJnj-00000009As8-3hx2;
	Fri, 23 Jan 2026 16:14:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJnO-00000009AVp-0RP2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Jan 2026 16:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GblQt8zBoa2ANU1FwVR4LDs1StFgzUT9KSZK3+2sTv4=; b=B8g140yfO5Od/YbLf3sCnX9Rgo
	SBc4dkyGu6WY5sWZXVYUajl28rc1cBSNCnLKR9m9JY8DgKOnLktbMK5xrmWka+zifO6hA786i0p+N
	qUtFY+zOOUgcxu1ascN/dSEoS8RpUwcdFyCDxY8HQqQm3kFnrdc38eKEYpdJRHeVwrfXwkAIJBYPz
	v5lqSvsbmv2bTTcs0juHKteXmvUCHQ3dTKeH/N72dTI3lz5OlZ4Lne3DukmILiSenvq+GjaBH5E60
	B3vfoC3QREFAnPaolYVV/gBWhjC8Nd3nK+Ot2wZLsGjaokhE5dI+QMj277tWQAMh7a6yT6Wv1v6rn
	rlq9fwzQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJnL-00000002gOQ-0vOz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:14:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ABC44C20308;
	Fri, 23 Jan 2026 16:13:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FFEF6070A;
	Fri, 23 Jan 2026 16:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2C60119A87A9;
	Fri, 23 Jan 2026 17:13:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769184836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GblQt8zBoa2ANU1FwVR4LDs1StFgzUT9KSZK3+2sTv4=;
	b=SRlbRDF+2BRs9G/mcKoVUINiaKPtC8VB6mKHqCg5Ur9R4iX1soKevsZhSSQoKhX7KQB7Mq
	GJgZzuBygAfXXN9nJvfGL9rXIuJ/61ylpzekRsXkEbqcF7A/ERT3COFhSXXxhSlt5HbAdn
	LemE+yYiIKB/aJXTeusAH6qM2RA7gtrHbp/kuyfNMmS4x0U775DPV90QXlURdgwv4bVgjB
	YeT+iG0ycXM6625+4fmFDvMk+LgtGuu+d52VC9jnA03Q3OPNfK0J90GKymZOUQ+G/UtAN9
	eJAmdyUGnVrt721gGV9I8Nnw16fybdQxvyvgijDkpgeSPNl8TwKll8qxW4GFWA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:43 +0100
Subject: [PATCH v5 25/25] drm/tilcdc: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-25-5a44d2aa3f6f@bootlin.com>
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
X-CRM114-CacheID: sfid-20260123_161359_477448_77C92ED7 
X-CRM114-Status: GOOD (  15.82  )
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

Convert the driver to use the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag when
attaching bridges. This modernizes the driver by delegating connector
creation to the bridge subsystem through drm_bridge_connector_init()
instead of manually searching for connectors created by the bridge.

The custom tilcdc_encoder_find_connector() function is removed and
replaced with the standard drm_bridge_connector infrastructure, which
simplifies the code and aligns with current DRM bridge best practices.

This change is safe as there are now no in-tree devicetrees that
connect tilcdc to bridges which do not support the
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Changes in v5:
- Move DRM_DISPLAY_HELPER before DRM_BRIDGE_CONNECTOR for a more logical
  description.

Changes in v4:
- Select missing DRM_BRIDGE_CONNECTOR and DRM_DISPLAY_HELPER config
  dependency in Kconfig
---
 drivers/gpu/drm/tilcdc/Kconfig          |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 37 ++++++++++++++-------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index a36e809f984cd..89df7528756c8 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -6,6 +6,8 @@ config DRM_TILCDC
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_BRIDGE
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 	select BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index 546fe7e6ee815..680a2ac6ab594 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -8,45 +8,40 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "tilcdc_drv.h"
 #include "tilcdc_encoder.h"
 
-static
-struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
-						    struct drm_encoder *encoder)
-{
-	struct drm_connector *connector;
-
-	list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
-		if (drm_connector_has_possible_encoder(connector, encoder))
-			return connector;
-	}
-
-	drm_err(ddev, "No connector found for %s encoder (id %d)\n",
-		encoder->name, encoder->base.id);
-
-	return NULL;
-}
-
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
+	struct drm_connector *connector;
 	int ret;
 
 	priv->encoder->base.possible_crtcs = BIT(0);
 
-	ret = drm_bridge_attach(&priv->encoder->base, bridge, NULL, 0);
+	ret = drm_bridge_attach(&priv->encoder->base, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 
-	priv->connector = tilcdc_encoder_find_connector(ddev, &priv->encoder->base);
-	if (!priv->connector)
-		return -ENODEV;
+	connector = drm_bridge_connector_init(ddev, &priv->encoder->base);
+	if (IS_ERR(connector)) {
+		drm_err(ddev, "bridge_connector create failed\n");
+		return PTR_ERR(connector);
+	}
+
+	ret = drm_connector_attach_encoder(connector, &priv->encoder->base);
+	if (ret) {
+		drm_err(ddev, "attaching encoder to connector failed\n");
+		return ret;
+	}
 
+	priv->connector = connector;
 	return 0;
 }
 

-- 
2.43.0


