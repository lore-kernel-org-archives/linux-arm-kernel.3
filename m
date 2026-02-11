Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54385ECD6E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHjTKyUMnae6tYGvVXBopaGafWE5D2GEW7x/Ab5dymQ=; b=NAczeZ/coDUcw3YLoPzj3XrETM
	N7JvUbbrxhySZE9BVjRTmScRyhaAqSSdDY6PDgm/KIbx5fsaMbWIQU8hzBx4ReS9T3ZT2kDemknZS
	y4aDW1DX5ASAcOFdVz0BSbd5HOKTk0uf05V9EE6MWJJgSyI51lNgZYT41I0z8inLuqujgM/5StxfH
	BtppAJQJ39G8mfZMph+6cdUe3q+N+5+h6dI989vbfIpFIh2I/ppMCTv7YrGb637u9Mfpqn+Ofqech
	Drza4jy+Jq6gf3VsUrAoWQlLZuvvK5B3KivBRBRrcXCWPCoxHRkQTAVKOZtcCkXrEa890gS54EWxI
	ri1NNCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHwT-000000015gw-0Wik;
	Wed, 11 Feb 2026 21:40:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHwQ-000000015fl-2kZZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 21:40:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 43C541A0E17;
	Wed, 11 Feb 2026 21:40:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12C0C606B1;
	Wed, 11 Feb 2026 21:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF8CC11949531;
	Wed, 11 Feb 2026 22:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770846006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KHjTKyUMnae6tYGvVXBopaGafWE5D2GEW7x/Ab5dymQ=;
	b=JQvfHHcLEbWPtH3bGqB+yuadTQv9OG6OEvQoebbz4fBa0oJIf0ySze3+RY7PU80FD+vPfh
	GERCKCgxvWujtOrmA+fBCp/xgEWwta+sTz8D1p+do8EESWsd5pwPFRjAAOvz0mVmgbG/tC
	dp+xWdtUAI++2KEAOBtJzsYCHAUVp/LZwTawtoMoF1pGB00Oew6FmyhFZThnmLe2y09iJM
	JtOgaicmfZ+xrzDMLJ6GfeZq+dzxfceKff4fLtOVsBXepzxPq4ipnCnwAzJRpY4uzA7Inq
	3+akA5riNpHSTkujwaiIgQThOZJAZ08/2s7ZhLF/yasKLnZO0N5F3HBuLcWZKw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 11 Feb 2026 22:39:49 +0100
Subject: [PATCH v6] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-1-651ddfd13bdb@bootlin.com>
References: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-0-651ddfd13bdb@bootlin.com>
In-Reply-To: <20260211-drm-bridge-alloc-getput-drm_of_find_bridge-v6-0-651ddfd13bdb@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15-dev-5464f
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_134010_837309_4E541810 
X-CRM114-Status: GOOD (  17.08  )
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated, so move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

To keep the code as simple and reliable as possible remove the intermediate
next_bridge and selected_bridge variables.

Get/put operations on the remaining pointer is pl->bridge.next_bridge,
which is tied to the struct imx8qxp_pixel_link lifetime, are:
 - get reference when assigned (by of_drm_find_and_get_bridge())
 - put reference before reassignment if reassignment happens
 - put reference when the struct imx8qxp_pixel_link embedding the
   struct drm_bridge is destroyed (struct drm_bridge::next_bridge)

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v6:
- rewrite as suggested by Liu, removing the next_bridge pointer too
  and splitting the comment for maximum clarity
- adapt commit message accordingly

Changes in v5:
- rewrite commit message after Liu's review to clarify the per-pointer
  get/put idea
- split the if()s involved in selcting the bridge
- remove intermediate selected_bridge pointer
- removed Maxime's R-by, patch changed
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 27 ++++++++++++-------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 91e4f4d55469..055b94d75eb6 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -23,7 +23,6 @@
 
 struct imx8qxp_pixel_link {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct device *dev;
 	struct imx_sc_ipc *ipc_handle;
 	u8 stream_id;
@@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	return drm_bridge_attach(encoder,
-				 pl->next_bridge, bridge,
+				 pl->bridge.next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
@@ -260,7 +259,6 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
-	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
 	int reg;
@@ -297,20 +295,21 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
-		if (!next_bridge)
-			return -EPROBE_DEFER;
-
-		/*
-		 * Select the next bridge with companion PXL2DPI if
-		 * present, otherwise default to the first bridge
-		 */
-		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
-			selected_bridge = next_bridge;
+		if (!pl->bridge.next_bridge) {
+			/* Select the first bridge by default... */
+			pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+			if (!pl->bridge.next_bridge)
+				return -EPROBE_DEFER;
+		} else if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
+			/* ... but prefer the companion PXL2DPI if present */
+			drm_bridge_put(pl->bridge.next_bridge);
+			pl->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+			if (!pl->bridge.next_bridge)
+				return -EPROBE_DEFER;
+		}
 	}
 
 	pl->mst_addr = port_id - 1;
-	pl->next_bridge = selected_bridge;
 
 	return 0;
 }

-- 
2.52.0


