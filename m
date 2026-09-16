Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B9C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MZSf+qxx8/Ty98JkFRndwTvdhbHq5kenzts5ncPb5U=; b=1dlia2ultKySM9tuV6tbR4Ty4E
	F1Jc/lVSpMTARbbLOen2j1oXokcR67F5lVjx73W4Dgz9uPraHFC+OpqFQeTPKeJ77Gl9RFHWnJyeg
	Vp5QjrsFWWcsSSYtJCzqk/LSYL7uH8M4Yv0IkcfpcEm1yWYGLdFHlWgSb7n/awPsuBgZzjwUi469/
	9X7zRhOkdrJ492mUOIdc3jUjbYlp8veBLuKZNoMr51x6Rw0efmN3w6E+ZVz+2yBCB5cs2vknzTLU8
	USVGng9Ml+XW18HDxuqzJLkZMNCj2ADS20nqHTgI3FSDhvC1EdFYVYlJZ+UMyK2JyD1Px8L5fIbjU
	JdI/d80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q03-00000009KL4-3rj4;
	Wed, 16 Sep 2026 13:48:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pzV-00000009Jvn-2tg5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 13:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9MZSf+qxx8/Ty98JkFRndwTvdhbHq5kenzts5ncPb5U=; b=SpbSiRR1dRY5H0I34saZ5YDa6l
	wKjOeKcSDkWFVXEWQ2XetQjkK3/OCy/7Mu6hmtzy1r02H2vtpuBNzrPUu5oJ0fBkdKjlXqO42XCSO
	WfroBgu1XWGhR3A6xPJrPGYwrwnUK0EbZO2zlKkpnOwmTpLWCHtuOii6vLvdR1JgbKWsFPoJtGf2s
	m/mv7Ab+IVY0ZJy0lIubIpEUOV+Om9rb5sKK7fxGHNdzVvZFA7gPA/8bYgR6v3ZTY0F/OYrA9F77V
	RHfISwMUhIyGeea1XbAvKmGiSwbMMsxhUZTBE0cEd63Yv5SFgdiqoU90QdMV4dAIFn4959u0OD3TS
	rEhZ/cHQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6pzQ-00000007wAa-19nv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:48:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 915E84E40727;
	Wed, 16 Sep 2026 13:47:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C34860337;
	Wed, 16 Sep 2026 13:47:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DD3511C7B038;
	Wed, 16 Sep 2026 15:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9MZSf+qxx8/Ty98JkFRndwTvdhbHq5kenzts5ncPb5U=;
	b=FsjDM4CGhKTpGI7EPMnp1qVnUDiWZ/MvYCX8oJMcOhlwceApl0fdlmtaPgTFfCjdloIJUq
	BcyX4XERNbeVj00xyKgOysccMA9MzsBVQgCrAV6xhR3oUQZ84Fe0LXU+5ifFco3zRTD/M9
	Td5NgPF+IhklwWZehRnZRLwnowV0HuhOgof5SJrHwZuhP64CGoZq47pcVBj4e1wowetaCi
	OwkdwMfw2X5QkU0cp+OQSQwTnGsVIi4eKkytfJw8DITMQNE4FSiMNU8yNvJrLkp9qGwEyP
	lMdG5wZ9Vxznx3WQ0A0ZLNdev5B+D7vM4m9N71DkdWlavyuPEZZyVle1JP7GPQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:40 +0200
Subject: [PATCH v3 16/19] drm/bridge: ssd2825: don't create a panel_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-16-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_144759_103603_38D2828F 
X-CRM114-Status: GOOD (  14.82  )
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

Now a panel_bridge is automatically created for every drm_panel and the
panel-bridge API is just a deprecated wrapper to access it.

Update and simplify the code by just getting a reference to the
already-existing bridge using of_drm_get_bridge_by_endpoint().

As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
of putting the bridge reference when not used anymore.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig   |  2 --
 drivers/gpu/drm/bridge/ssd2825.c | 23 +++++------------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 847a6397eb10..c7da6b02d7b6 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -349,8 +349,6 @@ config DRM_SOLOMON_SSD2825
 	depends on SPI_MASTER && OF
 	select DRM_MIPI_DSI
 	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_PANEL_BRIDGE
 	help
 	  Say Y here if you want support for the Solomon SSD2825 RGB/DSI
 	  SPI bridge driver.
diff --git a/drivers/gpu/drm/bridge/ssd2825.c b/drivers/gpu/drm/bridge/ssd2825.c
index b0142d6d40dc..71877699dfab 100644
--- a/drivers/gpu/drm/bridge/ssd2825.c
+++ b/drivers/gpu/drm/bridge/ssd2825.c
@@ -17,7 +17,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <video/mipi_display.h>
 
 #define SSD2825_DEVICE_ID_REG			0xb0
@@ -114,7 +113,6 @@ static const struct regulator_bulk_data ssd2825_supplies[] = {
 
 struct ssd2825_dsi_output {
 	struct mipi_dsi_device *dev;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 };
 
@@ -277,7 +275,6 @@ static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host, struct mipi_dsi_d
 {
 	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	struct device_node *ep;
 	int ret;
 
@@ -295,20 +292,14 @@ static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host, struct mipi_dsi_d
 		return -EOPNOTSUPP;
 	}
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel, &bridge);
-	if (ret)
-		return ret;
+	bridge = of_drm_get_bridge_by_endpoint(host->dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel, DRM_MODE_CONNECTOR_DSI);
-		drm_panel_put(panel);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
+	bridge->type = DRM_MODE_CONNECTOR_DSI;
 
 	priv->output.dev = dev;
 	priv->output.bridge = bridge;
-	priv->output.panel = panel;
 
 	priv->dsi_lanes = dev->lanes;
 
@@ -333,8 +324,7 @@ static int ssd2825_dsi_host_detach(struct mipi_dsi_host *host, struct mipi_dsi_d
 	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
 
 	drm_bridge_remove(&priv->bridge);
-	if (priv->output.panel)
-		drm_panel_bridge_remove(priv->output.bridge);
+	drm_bridge_put(priv->output.bridge);
 
 	return 0;
 }
@@ -579,9 +569,6 @@ static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Initial DSI configuration register set */
 	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
 	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
-
-	if (priv->output.panel)
-		drm_panel_enable(priv->output.panel);
 }
 
 static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,

-- 
2.55.0


