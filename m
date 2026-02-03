Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CFDE6E7EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0J7QwrnMLj6IPv/b8J6urH3umx5hdgFgh5QfijNSOt0=; b=iojzWz85Tpjg36kKbaB9srYsWI
	ad1yMPZ4LUF7s98mER/laDS04YmkM/AsGPXMl2jH8LL1Q7ljN7rfchZnQ7OKamKR++q4vTx56DIts
	H8y5FmNMH+rKeuCLJEaXvhIgzyYYRLvS2LR5c+pLuTtq3Q0uImLmTVPowrRpVeuaHhXG3UrISHfnj
	39bVg52uhJ7GQfFJ8hDfgYq0ZGHy+6PV4PSka0DV2DmJYumAyQjg9CZa9+p2slazqCdbTj4YzA/4k
	r1shhQSf/hxFKVqWzBoFYVSOT0wIhMeZ/OCwbs9XYjlmNOXd3LJcQNuRJat0zgbKti0AKI1v6N0nL
	1YwpV1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDl7-00000006U5i-3Whk;
	Tue, 03 Feb 2026 10:35:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDl4-00000006U4e-2h8O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:35:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 27D6D4E423E3;
	Tue,  3 Feb 2026 10:35:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F053F60728;
	Tue,  3 Feb 2026 10:35:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 099B0119A8891;
	Tue,  3 Feb 2026 11:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770114942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0J7QwrnMLj6IPv/b8J6urH3umx5hdgFgh5QfijNSOt0=;
	b=cdvSpR4+XLR7dOJEi7ksbitsY6hcG+EvmqrKfy9qgPMzUk7PCFQlm2q9UgVtdt3/ZoMlhc
	/vfqDOJ/qaBi+Vnhd9X2cdkkpVL0n3q9veQsO5+XBKvBLmykj8jAW8N8dLQ7trnTIjdpjU
	N2tjDhYnx86jbjSFtSGqBwn+wjX0uE+uTeMXXAXlckOwmpf4hUis/9qoruEttgrz8npNUU
	YkOZQVlNQxo01RdZHao7yqUL3LzX8xkmuPvz93A5PfrFfEOakRYUoa06yP9NRSo0ucKLiL
	aISI1rbH4WK9QKS6165kRf7a1l71IYlBOUKgh25tvIfauyYj2LIL0f2FhjFrBg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 03 Feb 2026 11:35:25 +0100
Subject: [PATCH v5] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com>
References: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com>
In-Reply-To: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com>
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
X-CRM114-CacheID: sfid-20260203_023547_223577_44B08E2D 
X-CRM114-Status: GOOD (  17.87  )
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
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

To keep the code as simple and reliable as possible, get a reference for
each pointer that stores a drm_bridge address when it is stored and release
it when the pointer is overwritten or goes out of scope. Also remove the
intermediate selected_bridge variable to reduce the refcounted variables in
the function. The involved pointers are:

 * next_bridge loop-local variable:
   - get reference by of_drm_find_and_get_bridge()
   - put reference at the end of the loop iteration (__free)

 * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
   - get reference when assigned (by copy from next_bridge)
   - put reference before reassignment if reassignment happens
   - put reference when the struct imx8qxp_pixel_link embedding the
     struct drm_bridge is destroyed (struct drm_bridge::next_bridge)

Additionally, split the somewhat complex if() for readability.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v5:
- rewrite commit message after Liu's review to clarify the per-pointer
  get/put idea
- split the if()s involved in selcting the bridge
- remove intermediate selected_bridge pointer
- removed Maxime's R-by, patch changed
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 91e4f4d55469..e29e099b893a 100644
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
@@ -297,7 +295,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			continue;
 		}
 
-		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
+		struct drm_bridge *next_bridge __free(drm_bridge_put) =
+			of_drm_find_and_get_bridge(remote);
 		if (!next_bridge)
 			return -EPROBE_DEFER;
 
@@ -305,12 +304,16 @@ static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 * Select the next bridge with companion PXL2DPI if
 		 * present, otherwise default to the first bridge
 		 */
-		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
-			selected_bridge = next_bridge;
+		if (!pl->bridge.next_bridge)
+			pl->bridge.next_bridge = drm_bridge_get(next_bridge);
+
+		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
+			drm_bridge_put(pl->bridge.next_bridge);
+			pl->bridge.next_bridge = drm_bridge_get(next_bridge);
+		}
 	}
 
 	pl->mst_addr = port_id - 1;
-	pl->next_bridge = selected_bridge;
 
 	return 0;
 }

-- 
2.52.0


