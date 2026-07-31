Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA6BC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3/Uy/rn4h53HDtKLQ0XHsN06nkb7JDX5KsW8tDNg8Q=; b=JX/vXgZqnyn7rwXVbtM2NvKq2X
	sT8GBfXtU8DYJpAghruzRAA/X5o8pNFwKeqdXM/GFlkolwLXA2BGIzZXVdiGJwwjqaf167y7HsPud
	OSSGh/vjqjcKErwFUeSjvNzVfmxBUvGKfRw/iA69HiFnYqVcuHzLzmaib48RAnVMbMcoH+KQ8LrMO
	cNGX1ixT+vEi7YQPN0GFDKxLaFMcPLH+Q3EZpan/a4hvi2ntqQc7Arws5iLPROA7HfQQBX4QQ2vDf
	pHlcbLDZefBiOSMD5JKtRw0nsyDd86FMBX7lcZdxL3fP1IUiMxN5cZVoL75FjRONSFvpBq7POHvXQ
	qcJXsUaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq2j-0000000D5Yz-2pbG;
	Fri, 31 Jul 2026 16:25:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxv-0000000CzzA-2wGD;
	Fri, 31 Jul 2026 16:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514801;
	bh=kOveINEPDFE/jpZ1VqhFveSV7JndBzIfgD4lhHc2Xo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m8DFbOHEzohSYO8ghsln1aKvFG4vYuqTVR9UJvs4pq9rrLSEuhF3YtvhRhSJB/IUa
	 6rmYffFPV5hwtmRhSY8B5BhaxLkPofyj132CkAZtT+/XpohuJGCyvEZPYPa9+Wrtnp
	 5Wx+urHWE93QSFQVCii4XutprFif2/Ig6GPocW3SoazXMpR0++VJ5cBSmHngN0vNPM
	 aoBiB0tmrXqCNYYv08pTcwnE8Su02BW5ty7aes9n8am30ZB5ekG2pa2kqv7d1oU8HE
	 7Zamw8BrsGv3e2R7OAaA2Ee4gDbDlzpWnOknPkqUe7CLCnM/Q4RG2XKD2PZBBiePN5
	 8NRzH35MjWRNA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9230D17E0B18;
	Fri, 31 Jul 2026 18:20:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:20:13 +0300
Subject: [PATCH v10 66/69] drm/connector: Remove drmm_connector_hdmi_ini2()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-66-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_092007_947871_44A9DF94 
X-CRM114-Status: GOOD (  13.30  )
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

All callers have been converted to the new drmm_connector_hdmi_init()
signature.  Remove the transitional drmm_connector_hdmi_ini2() function,
its declaration, its EXPORT_SYMBOL() and its kernel-doc.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 106 ----------------------------------------
 include/drm/drm_connector.h     |   9 ----
 2 files changed, 115 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a18410faf040..b2e8d99c0e9a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -696,112 +696,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
-/**
- * drmm_connector_hdmi_ini2 - Init a preallocated HDMI connector
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
-int drmm_connector_hdmi_ini2(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
-			     unsigned long supported_formats,
-			     unsigned int max_bpc)
-{
-	int ret;
-
-	if (!vendor || !product)
-		return -EINVAL;
-
-	if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
-	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
-		return -EINVAL;
-
-	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
-		return -EINVAL;
-
-	if (!supported_formats || !(supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444)))
-		return -EINVAL;
-
-	if (connector->ycbcr_420_allowed != !!(supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420)))
-		return -EINVAL;
-
-	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
-		return -EINVAL;
-
-	if (!hdmi_funcs->avi.clear_infoframe ||
-	    !hdmi_funcs->avi.write_infoframe ||
-	    !hdmi_funcs->hdmi.clear_infoframe ||
-	    !hdmi_funcs->hdmi.write_infoframe)
-		return -EINVAL;
-
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
-
-	connector->hdmi.supported_formats = supported_formats;
-	strtomem_pad(connector->hdmi.vendor, vendor, 0);
-	strtomem_pad(connector->hdmi.product, product, 0);
-
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	if (connector->funcs->atomic_create_state) {
-		struct drm_connector_state *state;
-
-		state = connector->funcs->atomic_create_state(connector);
-		if (IS_ERR(state))
-			return PTR_ERR(state);
-
-		connector->state = state;
-	} else if (connector->funcs->reset) {
-		connector->funcs->reset(connector);
-		if (!connector->state)
-			return -ENOMEM;
-	}
-
-	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
-	connector->max_bpc = max_bpc;
-
-	if (max_bpc > 8)
-		drm_connector_attach_hdr_output_metadata_property(connector);
-
-	ret = drm_connector_attach_color_format_property(connector, supported_formats);
-	if (ret)
-		return ret;
-
-	connector->hdmi.funcs = hdmi_funcs;
-
-	return 0;
-}
-EXPORT_SYMBOL(drmm_connector_hdmi_ini2);
-
 /**
  * drm_connector_attach_edid_property - attach edid property.
  * @connector: the connector
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 89a140d6f064..2ad8d1611e84 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2676,15 +2676,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc);
-int drmm_connector_hdmi_ini2(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
-			     unsigned long supported_formats,
-			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 int drm_connector_dynamic_register(struct drm_connector *connector);

-- 
2.55.0


