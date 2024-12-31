Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB138E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zjnnI3iPrWwOE0R208z670xT6TwIYqYj6odvgiZrgw=; b=r0XZeWWdLSLryi6XQOoxChJKJm
	/YvHQTHDzwHd5YH1nGZrjIzbuI+mvQWQHxbJoWdtPYyLdAH529XN6I67P7ZgBpLBv9VWcRtwLU+Gd
	3010KiBua0T5JX4ZdUJwQH4lecV3EDPYKcZsHRc/MP1yxLneqQG/BU7GXoF5aekSMThnFCu0ttgg2
	XcHki8zVcts7j/r5sl3N7yw50KJ56ABXfUPlDpULJnJsBgRTmACjfdiQdyB8UB1y50ivg9UECaan6
	F76rq1iQ/8XdJUGxDNbt96+uQ5b5aQmZM8yl7nFYOLSHW15K5I1JviHSzmP2PnBsI/jqpjon5e9Fe
	JLTB0fjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tShze-00000007f8F-0gOZ;
	Tue, 31 Dec 2024 19:33:30 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tShwB-00000007eiI-2pSh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 19:29:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 822C810486D9F;
	Tue, 31 Dec 2024 20:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735673393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+zjnnI3iPrWwOE0R208z670xT6TwIYqYj6odvgiZrgw=;
	b=IUOEsjQZRLNPIjI7Ed+UsxthNvxR028jHVDEfiqfTA2JOEEImbpUOYkKZqo+9YbAIBcoBZ
	j/nPXfW4Fh3xsgX67siwVYtGzU9Cqx9QP9ei7eRbnnbsSzGPJjZ3VqcoTLK3QmBzE3ggRK
	l5eKR9CMQBJtn6Pkq+6SGSSUbd1QA+j9DNlhOKLdzUZCuBIr+1h3IfUg52QWEt1Y0m7aDv
	yCCeAg0zAiMf24ewR0qIfhu2/6ZWfPjFT9ZQmBYjIIshvSftPMK4BIKCt+VwsqZP0Vkb8x
	t8296MP6z5byvs5yqjWj/7ypJcpUxiloC1Sc2EBZJ8OSTTqMxWQUWa6LFzLhOQ==
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
Subject: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach
Date: Tue, 31 Dec 2024 20:28:50 +0100
Message-ID: <20241231192925.97614-3-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241231192925.97614-1-marex@denx.de>
References: <20241231192925.97614-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_112956_033291_DD719365 
X-CRM114-Status: GOOD (  19.73  )
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

This makes LT9611 work with i.MX8M Plus.

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
V2: Add RB from Dmitry
V3: - Select DRM_DISPLAY_HELPER
    - Use return dev_err_probe() directly
    - Add missing of_node_put(ep)
    - Add test using drm_bridge_get_next_bridge() to try and determine
      if the HDMI connector was missing in DT or not, and if it was
      missing, if it was created by the HDMI bridge driver.
---
 drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 30 ++++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 264e74f455547..fe98674d5a298 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -12,6 +12,7 @@ config DRM_MXSFB
 	select DRM_CLIENT_SELECTION
 	select DRM_MXS
 	select DRM_KMS_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
@@ -28,6 +29,7 @@ config DRM_IMX_LCDIF
 	depends on COMMON_CLK
 	depends on ARCH_MXC || COMPILE_TEST
 	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
 	select DRM_MXS
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 8ee00f59ca821..dc39adabb3cd9 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -17,6 +17,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_dma.h>
@@ -48,8 +49,10 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
 static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct device *dev = lcdif->drm->dev;
+	struct drm_device *drm = lcdif->drm;
+	struct drm_connector *connector;
 	struct device_node *ep;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge, *nextbridge;
 	int ret;
 
 	for_each_endpoint_of_node(dev->of_node, ep) {
@@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 			return ret;
 		}
 
-		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+		ret = drm_bridge_attach(encoder, bridge, NULL,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
 			of_node_put(ep);
 			return dev_err_probe(dev, ret,
 					     "Failed to attach bridge for endpoint%u\n",
 					     of_ep.id);
 		}
+
+		nextbridge = drm_bridge_get_next_bridge(bridge);
+		nextbridge = drm_bridge_get_next_bridge(nextbridge);
+		/* Test if connector node in DT, if not, it was created already */
+		if (!nextbridge)
+			continue;
+
+		connector = drm_bridge_connector_init(drm, encoder);
+		if (IS_ERR(connector)) {
+			of_node_put(ep);
+			return dev_err_probe(drm->dev, PTR_ERR(connector),
+					     "Failed to initialize bridge connector: %pe\n",
+					     connector);
+		}
+
+		ret = drm_connector_attach_encoder(connector, encoder);
+		if (ret < 0) {
+			of_node_put(ep);
+			drm_connector_cleanup(connector);
+			return dev_err_probe(drm->dev, ret,
+					     "Failed to attach encoder.\n");
+		}
 	}
 
 	return 0;
-- 
2.45.2


