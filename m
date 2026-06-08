Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68BACD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iAPpXuMRXlFvwcvPUQkEJ0mXtzDz4In8LjOEWtrQII=; b=sm3iu6UdUscNYB4a49ovd26ECq
	1GVHZIvVGIAQzM2ckZdB9aYaOCeUZ6vytVeTddVpIUV99eGbQlNJKhP6SiNO20/tcS6lhuGJ4fo/G
	BgTk529euq9IzQRigKRE/lPM3Qhzg83wzUUXv0N8WlD9FxlOpU0SMTaq5tbkUFb3iiTGRj8ZVlyzY
	aOcpmgptT6S2MMezZfyLbm9fzEptHz2gY6q/R4ohS2PPKiMgbN8utW095WOnuFph4dhgYgcCLOHmI
	0dvVXnID81zGyJOmy8+PBQM/oLTWxGXzXOGCVryqI3AAD8AW02+iJspI/NAWIMyQECBzDDG1TMVnq
	MNjVbo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb6O-00000003mCe-3AB0;
	Mon, 08 Jun 2026 14:37:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb6M-00000003mAP-08Pz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:37:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6083445B1;
	Mon,  8 Jun 2026 14:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DD21F00898;
	Mon,  8 Jun 2026 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929437;
	bh=+iAPpXuMRXlFvwcvPUQkEJ0mXtzDz4In8LjOEWtrQII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ASjPkpHV/IIMzngOrflBSLDGi2OQy64q2DMtGCxa0sQ8YLAFk3Qmu4BOOZAfgYr7e
	 sdDo+7k21W+fwFxJMc58NTkT5P/ZijfjmZuVYeiD3DJkzz6kWURwyl/mB7iB5XuVT5
	 tmS14yXI6sKGtYVq/IKv5A1sbe1CBns3RY94637L0MF5bkj93AiXzRxwP91emq3vrn
	 wModAKbf3b6rJsVVQ0QvItO6WO9+ev0b5kppPw55Dof819ueRAAlJU8t30UN/qbEjH
	 Bu5VKLWdwNkBpI8YSdgj9Fc0O8zBz21gGYi1YkZV7d/6BUrP0m2LuWDe29UsCt9+hN
	 j+Uv4l+Y/bwEw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:01 +0200
Subject: [PATCH v2 19/78] drm/bridge: imx8qxp-pxl2dpi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-19-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=mripard@kernel.org;
 h=from:subject:message-id; bh=V4SZd754SBaCkeg5CdUwftfMKo5QvdMhOIWDkLK7Xa4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql33fPDF+V/+N/4HotmAHs+tN9X+Kl69tsVy7sobRQ
 k24KONYx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIRl7Gho8Lc+IEtiz55uib
 8CZOpPQRz8WCKVP/y+jd/lUcE7T/zQObpESPGctMNDa9Y6rjDGu9wlgfdXziucevHPjv6l2IeFX
 lkGu4/NoV90VFFTd4v7wsj9TavoNF+3TaYY6F/es3eTu0PHsCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 87305d3e0c39..2fc9831f7e61 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -208,11 +208,11 @@ imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pxl2dpi_bridge_attach,
 	.destroy		= imx8qxp_pxl2dpi_bridge_destroy,
 	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
 	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,

-- 
2.54.0


