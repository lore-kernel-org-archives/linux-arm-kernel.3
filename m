Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B49C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUMg2fB0et95uQDSbRtWmOzHTKa5cLqwreFUewKCGh4=; b=oIK/8m/yg/cYzldLHtVAVqtyho
	uYLYf/1ynxs+0xSBTjTycBbDBji7EJvxd2XT3mJ15g5jR4k1jG1vFxY5U2WKEPJ/Whqz5uLUFwyDj
	sBwAvNBzxV4WEN9jmXVTLJASfw+f7mmBMcFmWlGwa8/LqW2r2++caPcAbRtVVgr5c6VVCyavclSyP
	+Bzz9W6qkf8l6gJUm+nCp+QoEspnXZBul/JR0jypoai1QwVHGaAHMD665bufO9mGsAxiAYJBVG8iq
	O0BpC6XEtNQ6kvLSxNUZ7Bif9Y7V6F0LWtJriKTS2RsXfC3cdAEwsSca7o6KK0ETNss+7Qi5BLvgb
	bUHZn/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pzT-00000009JuK-42xJ;
	Wed, 16 Sep 2026 13:48:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pzD-00000009JdK-3DFb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 13:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PUMg2fB0et95uQDSbRtWmOzHTKa5cLqwreFUewKCGh4=; b=X01KHwwddRGaMN9AVka5TzpgxS
	LEEGKZMa14EbN+0P+TQcFZ/9iIGJUsoRAGKkb88aEdVDpuzldXGD4fq/gB/V1ySHw3WBCAA5YkJH3
	wYtHkwu6EsFoiNU1ORohvgTfoIadaln3oASlsQoKGd/FbEuH7KcjihAYzYgBesw5nszeeUO4B6gG8
	2E1bs2vqpMDG2cCAadHsqW1/TA3fa8EibVkoGhbtz6wlAQFtJVseUAjPd2zofy2Qje7LMCUBJoMzN
	2uiZfrrFPW2W1+BbCy57jvU/tkyKUk3vPvsN2K00qdkkXkEU4W9PDsEfw5PFFs2OuURMeM3d29bhT
	MI+wveHw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6pzA-00000007w71-2zRi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:47:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F03DDC5CD63;
	Wed, 16 Sep 2026 13:48:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFAD560337;
	Wed, 16 Sep 2026 13:47:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40C8911C7B035;
	Wed, 16 Sep 2026 15:47:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PUMg2fB0et95uQDSbRtWmOzHTKa5cLqwreFUewKCGh4=;
	b=j+LjOiVRG5C8lgeqJAN9fvYpi1btsO+fLPNR75iMBB7TCRku8/Nm5mh5mk0cRguolV2VXb
	/338lvksbKfw+ZaijX2ivihEfU5agmr2mwqHBbPpoBTTiVH3ipUaublKAYVi+z5yiI8Dcx
	F3eFlclUHoj1kNZkl90cJ5V/DxxbsEPTMNB/oc9aIKhomPybZNw7Uxy6/L6IzhGTCPAhZy
	5C2oOUBtsBS/FnJQOzeldmcxLi0zPFs2CupbbAdDsk3rc8Bz6/blNflit5TR3ShU+f2IR2
	XSO8zaecW+Fyko+HgV6gnIRfb5S6eKSRFE+5LQ+bN5V0RPNnaV/R64TMnHC6Rw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:38 +0200
Subject: [PATCH v3 14/19] drm/bridge: samsung-dsim: don't create a
 panel_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-14-83afb4f1a707@bootlin.com>
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
X-CRM114-CacheID: sfid-20260916_144740_905507_4EBE4424 
X-CRM114-Status: GOOD (  14.77  )
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
already-existing bridge using of_drm_find_and_get_bridge().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig        |  1 -
 drivers/gpu/drm/bridge/samsung-dsim.c | 24 +++++-------------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 0ab3cab92363..4be220f7335c 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -302,7 +302,6 @@ config DRM_SAMSUNG_DSIM
 	depends on OF && HAS_IOMEM
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
-	select DRM_PANEL_BRIDGE
 	select GENERIC_PHY
 	select GENERIC_PHY_MIPI_DPHY
 	help
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5457a7b02a33..ea2837384774 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -25,7 +25,6 @@
 #include <video/mipi_display.h>
 
 #include <drm/bridge/samsung-dsim.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 /* returns true iff both arguments logically differs */
@@ -1898,7 +1897,6 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
-	struct drm_panel *panel;
 	int ret = 0;
 
 	/*
@@ -1913,7 +1911,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		    of_node_name_eq(remote, "ports"))
 			continue;
 
-		goto of_find_panel_or_bridge;
+		goto of_find_bridge;
 	}
 
 	/*
@@ -1927,25 +1925,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 
 	remote = of_graph_get_remote_node(np, 1, 0);
 
-of_find_panel_or_bridge:
+of_find_bridge:
 	if (!remote)
 		return -ENODEV;
 
-	panel = of_drm_find_panel(remote);
-	if (!IS_ERR(panel)) {
-		next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		drm_panel_put(panel);
-		if (IS_ERR(next_bridge)) {
-			ret = PTR_ERR(next_bridge);
-			next_bridge = NULL; // Inhibit the cleanup action on an ERR_PTR
-		} else {
-			drm_bridge_get(next_bridge);
-		}
-	} else {
-		next_bridge = of_drm_find_and_get_bridge(remote);
-		if (!next_bridge)
-			ret = -EINVAL;
-	}
+	next_bridge = of_drm_find_and_get_bridge(remote);
+	if (!next_bridge)
+		ret = -EINVAL;
 
 	of_node_put(remote);
 

-- 
2.55.0


