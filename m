Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D6CCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzQY9dsQ8HXSO1qHO9vK4wagcfimdXnRjdMwL2sl/wo=; b=dr2CHnMaG5qSTeh4CyqrHVI9au
	O3pqCfcO0fOCB1/Rb9TbPpjxtYk8Dvbf/x1b+xjiYHEWbibM49XeQURnw2QWj/PPeWvwFgcOk+NAO
	EydLxNS2RvF2MVCDa4clu2QGjKglfxXOyKuuSgcVe95WCiPZRxpfejYwTsOLWj20JS2QwS+mMz7fe
	Uz2YaqTZAkPXU0ZSqFnkowJYGlD3Xbev9wMqhm8jGr9hZhzreMUksM3gwuZMKUDpsy4Wipxgm/8qy
	tfyN8uu0d8cW2Rv4TwFZkO2pAIOvhNyKphkfjMAqaburP6VFn6BHWkVJM7htVDXEL4QCq/iTa/khq
	WsuGRLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBY4W-00000003h4t-3oul;
	Tue, 29 Sep 2026 13:40:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBY4R-00000003h2s-35bn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:40:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 473541A104D;
	Tue, 29 Sep 2026 13:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16DBE601BD;
	Tue, 29 Sep 2026 13:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0591103282F2;
	Tue, 29 Sep 2026 15:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790689231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qzQY9dsQ8HXSO1qHO9vK4wagcfimdXnRjdMwL2sl/wo=;
	b=SFueFONfugayF2JQ4uFdRR4CjXg6t3G6on7fazctX6udQYnedB/kv7jlUFTG4B2d2Dj032
	e91GjzSn3GYPYdPeOjZ1p05LfX8pORJRJeHKPsTIWdz1yBeJkncZ9Nf6OjUgrTam69iu6c
	M91R8WOJBM+W6YynZVtCJSpOu0dfms4yS/hQyCM8P9y1gnDC9ET666f+NyYfMDn3wrz7FM
	27pwcjI57DLrK+aeau0WPz5ctzMoUWwLpuWQ8Fqb05/UsbtuCmliw/bDywgarA5O6lLbBA
	t4BlwqL1W8UPLzsucFQsmasz4W6G0dYMr5kxUpv7DzJMQorAfifIEUtQ69yhWA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 15:39:52 +0200
Subject: [PATCH v2 3/7] drm/bridge: dw-mipi-dsi: stop using deprecated
 devm_drm_of_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v2-3-6da431d8f180@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_064036_076028_C962DA45 
X-CRM114-Status: GOOD (  12.57  )
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

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

Fixes build failure when CONFIG_OF is disabled.

Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
Reported-by: Arnd Bergmann <arnd@kernel.org>
Closes: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609291109.9RGna4XZ-lkp@intel.com/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- fix bridge reference leak on attach error and detach paths
- mention lkp report
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 5dd475fcaacf..22d1b8cbe1d5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -244,7 +244,6 @@ struct debugfs_entries {
 struct dw_mipi_dsi {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
-	struct drm_bridge *panel_bridge;
 	struct device *dev;
 	void __iomem *base;
 
@@ -333,12 +332,12 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
+	bridge = of_drm_get_bridge_by_endpoint(dsi->dev->of_node, 1, 0);
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
 	bridge->pre_enable_prev_first = true;
-	dsi->panel_bridge = bridge;
+	dsi->bridge.next_bridge = bridge;
 
 	drm_bridge_add(&dsi->bridge);
 
@@ -352,6 +351,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 err_remove_bridge:
 	drm_bridge_remove(&dsi->bridge);
+	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
 	return ret;
 }
 
@@ -368,9 +368,8 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 			return ret;
 	}
 
-	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
-
 	drm_bridge_remove(&dsi->bridge);
+	drm_bridge_clear_and_put(&dsi->bridge.next_bridge);
 
 	return 0;
 }
@@ -1086,7 +1085,7 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 	encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(encoder, dsi->panel_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }
 

-- 
2.55.0


