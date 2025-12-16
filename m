Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CB3D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1SQgG8CDgy8pHJUhmPefyNI4mOwi1BDcEiUTUoG2qs=; b=rUcN4wfqyMG7O7TFO/G+c1hHRP
	QNrICIx8EPSaGL+ayl1qOVZUYpEKQ42+XcAjqxLh4BVy6SdTbYM/q2LHoBvWUxRh+Qwq50W+Mxo1t
	9VgZ1ex3M/cQenUyz6ZuOyISJo8NOhseo5GJ7zK/pu5deOiQbhhNgLHNRGSt9adPAll2blGmsmmBG
	SK36n8Z4icq6nnxbiwlLOtIlZsYNBQI1pRtzq+RkfQ+lt094c/q26O4LuftkxPqZO80vbZqZnt/4+
	GN0QLp8xAZqC8l+vpl5jC01kp0wav3gZ0rIDC5PvFpSqXRQoYy6CxrOjNyS1rAFoe0ALx8e6D63J3
	o7XgxpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMM-00000005fd4-2KEk;
	Tue, 16 Dec 2025 18:01:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZME-00000005fQR-16bD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 18:01:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83FA71A2256;
	Tue, 16 Dec 2025 18:01:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5824C6071C;
	Tue, 16 Dec 2025 18:01:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03259119A97F1;
	Tue, 16 Dec 2025 19:00:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q1SQgG8CDgy8pHJUhmPefyNI4mOwi1BDcEiUTUoG2qs=;
	b=K40Qm54C3qdPF1+qLRUL+AfP2p8yAX1aWTb5MdJ5M1M6JIaqfvIKIdfG/XNh3YHiSd1elV
	L/V7oyrMVc+BYvsG2C+wfa+mO6KA+3DGdlxnIHxD6L5WzwsWQsFVRYou5gLS+UJOdLHM6u
	ar6vAMFqbotLZk6bgd/f16073Qir2VWOJBDRGidTy8ulP7z9/SbnP0ocqFgL7Qo1f3zSaJ
	UYj3CLRGAXutCaTsq+fpks/CY68yAu6ds1Wbh4YU5edv1m7qvrZOj0tXnc0gJY+B7F5GnL
	QJ9dtLvpqb3tS7yHZj/CKp8HkftGnPMgAdx/66AqAwoL+eLy5ZT87ZVpe2YFmQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:54 +0100
Subject: [PATCH v3 21/22] drm/bridge: imx8qxp-pixel-link:
 imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-21-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_100110_642094_71253289 
X-CRM114-Status: GOOD (  14.38  )
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

In preparation for using bridge->next_bridge, we need to ensure that it
will never contain anything but NULL or a valid bridge pointer. Current
code stores an ERR_PTR when imx8qxp_pixel_link_find_next_bridge() errors
out. Instead of fixing that after the facts in the caller, change the
function to internally set pl->next_bridge and just return an int error
value.

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 0c5ed06eee1b..91e4f4d55469 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -256,8 +256,7 @@ static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl
 	return imx8qxp_pixel_link_disable_sync(pl);
 }
 
-static struct drm_bridge *
-imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
+static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
@@ -282,7 +281,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 
 	if (!found_port) {
 		DRM_DEV_ERROR(pl->dev, "no available output port\n");
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
@@ -300,7 +299,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 
 		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
 		if (!next_bridge)
-			return ERR_PTR(-EPROBE_DEFER);
+			return -EPROBE_DEFER;
 
 		/*
 		 * Select the next bridge with companion PXL2DPI if
@@ -311,8 +310,9 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 	}
 
 	pl->mst_addr = port_id - 1;
+	pl->next_bridge = selected_bridge;
 
-	return selected_bridge;
+	return 0;
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
@@ -368,9 +368,9 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
-	if (IS_ERR(pl->next_bridge))
-		return PTR_ERR(pl->next_bridge);
+	ret = imx8qxp_pixel_link_find_next_bridge(pl);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, pl);
 

-- 
2.52.0


