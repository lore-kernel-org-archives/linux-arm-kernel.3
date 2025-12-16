Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D182D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUbaxiw2BnN1ox+Yu5GNCuxcygx9alGi1fjrWLi1OF4=; b=1ILAOryC04P01qKehAgiw83TwX
	KlsvvK779Dc5tpKpuMyprDR+mviRm2VoEnoNx7oe3ziB2mn5qUDfmup7SMP5umyFGHhQUgjkhdWbT
	HnTmz/hUWXtKQVBoHdFHUhiBUWgURRGGIIQLxFy/Q9aiNVc4l9+mdWS/hv5fjVCyPYAXuKemPFKAM
	Vcn0ilY3rl7Ttu6KIDALFm50aNo2I8E6UqqI+p8bNWqnXD8FYVKOjQP24pS+59A3ZPD7huIVnSJoc
	eCwC54nxUhE+I4S+pTY1v/18giMkwPefTo9kjP2zZDslQ+dYjwT8LKI+GfHoO5PGkBPtKGSSKKfHy
	Mnwlh4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLy-00000005f9B-1NyG;
	Tue, 16 Dec 2025 18:00:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLk-00000005euE-0Dvu;
	Tue, 16 Dec 2025 18:00:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 876A4C1A582;
	Tue, 16 Dec 2025 18:00:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 042AD6071C;
	Tue, 16 Dec 2025 18:00:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54C0A119A97F1;
	Tue, 16 Dec 2025 19:00:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lUbaxiw2BnN1ox+Yu5GNCuxcygx9alGi1fjrWLi1OF4=;
	b=PHTJXyolQZp12tBjpY2uxdapMynKVx6jw+EgyCgB+lF9hYbgZ3ivqEIb+OLNqItIAE/so6
	36gecuUQJlMv3XaZnQPVCMVvIg0ZHTLrYDdE+m66ZifLMcHjxj9Pm0GfDKUlONqzHmC1yL
	07FLEzDja2dhvcFnCgFl7GD/vS96r0GB/EAvYbn/XNgPnUrZvo9P+knEVR5uftjClXB6q8
	xRhf/gee+/IMuA55jShwQtbF76AT1or4OKzn6Usqbc3VnzlZM1JClQtfL9M5HHH6vDLvI1
	P7XXzww2Fgj6pu2A6eczb/uGtCmHNxrpraxGWZczhmrB2GcqB1WQmvadAJfksA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:48 +0100
Subject: [PATCH v3 15/22] drm/bridge: imx8qxp-pxl2dpi:
 imx8qxp_pxl2dpi_find_next_bridge: return int, not ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-15-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251216_100040_503665_2455080B 
X-CRM114-Status: GOOD (  13.34  )
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
code stores an ERR_PTR when imx8qxp_pxl2dpi_find_next_bridge() errors
out. Instead of fixing that after the facts in the caller, change the
function to internally set the next_pointer and just return an int error
value.

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 30 +++++++++++-----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index e03a411cb9db..2e66b003386e 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -255,33 +255,27 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
 	return ep;
 }
 
-static struct drm_bridge *
-imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
+static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct drm_bridge *next_bridge;
-	int ret;
-
 	struct device_node *ep __free(device_node) =
 		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
-	if (IS_ERR(ep)) {
-		ret = PTR_ERR(ep);
-		return ERR_PTR(ret);
-	}
+	if (IS_ERR(ep))
+		return PTR_ERR(ep);
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
 	if (!remote || !of_device_is_available(remote)) {
 		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	} else if (!of_device_is_available(remote->parent)) {
 		DRM_DEV_ERROR(p2d->dev, "remote parent is not available\n");
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
-	next_bridge = of_drm_find_bridge(remote);
-	if (!next_bridge)
-		return ERR_PTR(-EPROBE_DEFER);
+	p2d->next_bridge = of_drm_find_bridge(remote);
+	if (!p2d->next_bridge)
+		return -EPROBE_DEFER;
 
-	return next_bridge;
+	return 0;
 }
 
 static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
@@ -414,9 +408,9 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
-	if (IS_ERR(p2d->next_bridge))
-		return PTR_ERR(p2d->next_bridge);
+	ret = imx8qxp_pxl2dpi_find_next_bridge(p2d);
+	if (ret)
+		return ret;
 
 	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
 	if (ret)

-- 
2.52.0


