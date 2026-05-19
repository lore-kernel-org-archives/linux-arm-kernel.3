Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603D2CD5BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blKbTTwyDFAtSUCP5vAQgBxGuxdjJMITQpGkNOB3QT8=; b=tcJDu5lfUSRFKSkmkv+Bx2iOEz
	E0FhjELlWKsm69LhYwY5yrbnsEWc6gOgF2sIpDKLzg7dTIftqy60PcWTrSdRSOXX86HEpq/ZILIl9
	S9mu9MBmE/4hH51hZS3IhV+8OaEUMMc5uHr2ebFmdVzcHcb9Swp9gK1zQHzIzs9EeP5QvfFnJMf98
	PGxN5Q3xVLcdigF9v3upU2WseDlAd43z5SJcDLZVmWF/v6QDvqGSIdF+uCxQt12DLiV3rujQhoOFU
	xhXdDKvM8PImMO1LPgCG24fB5Gs8ylu7aV5YxEStY5ZcNndhZfU8D5oG/W7g8yKqXbeBH5wbpoCI0
	Z7e6wXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHq5-0000000179L-1Xm9;
	Tue, 19 May 2026 10:38:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHq0-0000000176f-14Ey
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:38:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C0BB4E42CF2;
	Tue, 19 May 2026 10:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46C0F606E9;
	Tue, 19 May 2026 10:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C05FF107E8ABD;
	Tue, 19 May 2026 12:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=blKbTTwyDFAtSUCP5vAQgBxGuxdjJMITQpGkNOB3QT8=;
	b=i6mHAuI7Z6z0XXyfO6xvodt2fFIx7CJsxEsXRW7q8+ucjA2ZtN1qD15+9+DPBMmDDPXp0N
	L7TMVhvoLE3xeeJH1VKk4AuI1GWV7draVlvdZCbkLmNgShstoc07BVap1VQZDEXgeUWfHu
	dgFdDrhDxSgf+pqqDCNJSMDqrQ7j0XHh42yvfoFUYtHExwaODG7cdMIkRAPrVPcIN1Tjf2
	AjPgy1lr3Id3fOPvIv7TTzaQ1waE29boOCHArNDiJgFNVvy5JarkQo3J/8JKEZXm142FPO
	hgL/PY9C2miGODN0aeWlppLIXyJClO6hWfmdAFM9wDedhR747M0ViuDSxMFHpQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:18 +0200
Subject: [PATCH 01/37] drm/connector: split drmm_connector_hdmi_init() in 3
 parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-1-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_033812_434282_87515800 
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

In preparation for adding a dynamic variant of drmm_connector_hdmi_init(),
split reusable parts of the code to subfunctions.

drmm_connector_hdmi_init() currently has 3 sections:
 1. sanity checks
 2. call drmm_connector_init()
 3. initialize HDMI-specific fields not initialized at step 2

Split 1 and 3 to new functions, reusable independently.

No functional changes. Just moving code around.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_connector.c | 105 +++++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 3fa4d2082cd7..37ed73300a18 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -542,44 +542,13 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
-/**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
- * @connector: A pointer to the HDMI connector to init
- * @vendor: HDMI Controller Vendor name
- * @product: HDMI Controller Product name
- * @funcs: callbacks for this connector
- * @hdmi_funcs: HDMI-related callbacks for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
- * @supported_formats: Bitmask of @drm_output_color_format listing supported output formats
- * @max_bpc: Maximum bits per char the HDMI connector supports
- *
- * Initialises a preallocated HDMI connector. Connectors can be
- * subclassed as part of driver connector objects.
- *
- * Cleanup is automatically handled with a call to
- * drm_connector_cleanup() in a DRM-managed action.
- *
- * The connector structure should be allocated with drmm_kzalloc().
- *
- * The @drm_connector_funcs.destroy hook must be NULL.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drmm_connector_hdmi_init(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
-			     unsigned long supported_formats,
-			     unsigned int max_bpc)
+static int drm_connector_hdmi_sanity_checks(struct drm_connector *connector,
+					    const char *vendor, const char *product,
+					    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+					    int connector_type,
+					    unsigned long supported_formats,
+					    unsigned int max_bpc)
 {
-	int ret;
-
 	if (!vendor || !product)
 		return -EINVAL;
 
@@ -606,10 +575,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	    !hdmi_funcs->hdmi.write_infoframe)
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
+	return 0;
+}
 
+static void drm_connector_hdmi_init(struct drm_connector *connector,
+				    const char *vendor, const char *product,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    unsigned long supported_formats,
+				    unsigned int max_bpc)
+{
 	connector->hdmi.supported_formats = supported_formats;
 	strtomem_pad(connector->hdmi.vendor, vendor, 0);
 	strtomem_pad(connector->hdmi.product, product, 0);
@@ -628,6 +602,57 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
 	connector->hdmi.funcs = hdmi_funcs;
+}
+
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @drm_output_color_format listing supported output formats
+ * @max_bpc: Maximum bits per char the HDMI connector supports
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * The @drm_connector_funcs.destroy hook must be NULL.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
+			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
+			     unsigned int max_bpc)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_sanity_checks(connector, vendor, product, hdmi_funcs,
+					       connector_type, supported_formats, max_bpc);
+	if (ret)
+		return ret;
+
+	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	drm_connector_hdmi_init(connector, vendor, product,
+				hdmi_funcs, supported_formats, max_bpc);
 
 	return 0;
 }

-- 
2.54.0


