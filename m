Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B4FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 19:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jYDMn7lKraYIfnDyUnBlYqR8h6KGDWyESEreotAHAU=; b=KQjCcqTpSFhS+nFbApzx3ep0mk
	dc/lc0n12VMVZfoyG+WwBATRi4a908NlyCGrEbsNJ1XOPWNtiM0fW5YL8NJRve2/oYI9BWoCcPswm
	Z29Q7Y34MCOtWuhb6T3z9Wle/EyhPdCvNixF4s9YTchC3dM6pSVNkM0trdq0lbewRLEH59SrKR5pa
	cKUuHO6Hj011lM+p3d97EA/+xhqY4jvKXYvLazctuLx8tIAwjLhuuXLArfcYWXwkMwKHcDB0H66r7
	fRrCnvHFL6L9b0C+gEtHMVod7PNtnU/8vOzlq+7k5E6tTugkNlfPBibdvhg2JeW35pY9D8N2VN3EE
	pDEXYcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSi0p-00000007fHP-3XHt;
	Tue, 31 Dec 2024 19:34:43 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tShwD-00000007eic-0net
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 19:29:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92AE110486DA6;
	Tue, 31 Dec 2024 20:29:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735673395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jYDMn7lKraYIfnDyUnBlYqR8h6KGDWyESEreotAHAU=;
	b=h9rm6F9NWbsUU3Cjdobgv+kIpILYFn66sS8CZ5iDZA6GOU+hknbVb/Dowq11d6IzVAHF2R
	PM6Dm2vFr0BNY3cxsnKKXrBepFAhp61X0b6faPu0ujbXcnRPi52gFG3WIYiGbWSNZLO9wc
	pO7iVzm+l4JBke3aoK18IjAW5CzD8wxVGsHtjoJSrEIC60uF9rke0jLan0Lxsz7xxnZlIM
	JOmXzkDwZBvNlD77zb/NBd1XWkr5NtbxXNd0ORpexbil8ZWYU06HNa1Z6M4Y8Gh//AWRiW
	IFy4nciRHS7M3/CNyyOvztahzMz1b8hV0zYHJL/NZojqD6vnMoqnV72pNDvxMQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach
Date: Tue, 31 Dec 2024 20:28:51 +0100
Message-ID: <20241231192925.97614-4-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241231192925.97614-1-marex@denx.de>
References: <20241231192925.97614-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_112957_519151_D2E2202A 
X-CRM114-Status: GOOD (  19.60  )
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

Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
this flag in some way since then.
Newly added bridge drivers must no longer contain the connector creation and
will fail probing if this flag isn't set.

In order to be able to connect to those newly added bridges as well,
make use of drm_bridge_connector API and have the connector initialized
by the display controller.

Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")

This makes LT9611 work with i.MX8M Mini.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: Cache connector from drm_bridge_connector_init()
V3: - Add RB from Dmitry
    - Select DRM_DISPLAY_HELPER
    - Use return dev_err_probe() directly
    - Drop the single use fail path
---
 drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 31 ++++++++++++++++++++-----------
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index fe98674d5a298..eb51d38455a6c 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -10,6 +10,7 @@ config DRM_MXSFB
 	depends on COMMON_CLK
 	depends on ARCH_MXS || ARCH_MXC || COMPILE_TEST
 	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
 	select DRM_MXS
 	select DRM_KMS_HELPER
 	select DRM_BRIDGE_CONNECTOR
@@ -32,6 +33,7 @@ config DRM_IMX_LCDIF
 	select DRM_DISPLAY_HELPER
 	select DRM_MXS
 	select DRM_KMS_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65e..07784c4f5be48 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -20,6 +20,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
@@ -119,9 +120,9 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
 static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
-	struct drm_connector_list_iter iter;
-	struct drm_panel *panel;
+	struct drm_connector *connector;
 	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
@@ -139,19 +140,27 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	if (!bridge)
 		return -ENODEV;
 
-	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
 
-	mxsfb->bridge = bridge;
+	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
+	if (IS_ERR(connector)) {
+		return dev_err_probe(drm->dev, PTR_ERR(connector),
+				     "Failed to initialize bridge connector: %pe\n",
+				     connector);
+	}
 
-	/*
-	 * Get hold of the connector. This is a bit of a hack, until the bridge
-	 * API gives us bus flags and formats.
-	 */
-	drm_connector_list_iter_begin(drm, &iter);
-	mxsfb->connector = drm_connector_list_iter_next(&iter);
-	drm_connector_list_iter_end(&iter);
+	ret = drm_connector_attach_encoder(connector, &mxsfb->encoder);
+	if (ret < 0) {
+		drm_connector_cleanup(connector);
+		return dev_err_probe(drm->dev, ret,
+				     "Failed to attach encoder.\n");
+	}
+
+	mxsfb->bridge = bridge;
+	mxsfb->connector = connector;
 
 	return 0;
 }
-- 
2.45.2


