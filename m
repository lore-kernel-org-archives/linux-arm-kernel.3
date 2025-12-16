Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ED8D609D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUZmDVtQVbSET7XgjXwPjJ7VIEIK5vtHf64g0TE1q9M=; b=I6KGtsHRSu7KYJrPdAMxPx0BqL
	wSe+DKUElWuhX3iYn/YOg89rSRV/Y2vFOsbwg7SEoacGlfeeLH/wMz9qHgAIDxDLONKuoN2tFxtSH
	Hup/uN7tJbH54YbAgGZmldEJrIfxjci3oiIYtI9v23A5VfuFu9O8WIzBou8QF4zhbbY0REv231Gzc
	YxCTkGLKpCmb2DOSVe1FxryJQO0LcPUzgR4N6bE1UHP7i9B9rh/MDSTXmEZJbcy6GYqWM70tHR0/W
	yFi4DIz1fukn/FwRLm7K9tnM5GPyeOgTUzcEjToIZYxpdtWcrC3tWrPkQKeQua9YDH/5yC2vAfvhL
	g+QBvBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLe-00000005eoo-3LEy;
	Tue, 16 Dec 2025 18:00:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLb-00000005ejR-2bKc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sUZmDVtQVbSET7XgjXwPjJ7VIEIK5vtHf64g0TE1q9M=; b=czmcmdXIFAq3ltj4HwqQDbwKO6
	L9uIkOwNAzPZy0xPOlNnj9oDQCKPwgVyvFXO/PQ4lCvXJnhmlz9lNG6BYXGlpf5HW+vx9kg3mRT7f
	aX0F2BSRWc6vAGORmMPJVQarWzglXJgdjQkDkbcOm2FIBozEV2uuzBogUpd6+zq917D5g50MrTfGy
	KBrfkDYWxeeBpmdSEGATIS+da7fcHwKZAzvgHT8Bu+71jCS9XsMJpC4AMfBAtMQ9EYpVxicQ8XhOU
	KyW+CF3q7djaeh3w3PWOVcgIN1hwtqSXz3ucUST06Q3DIkfKdSIGisRn1VDF5qPMdcEwJUl3OX2Di
	A7feMILw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYU2-00000005Jgq-24mS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:05:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C53744E419EA;
	Tue, 16 Dec 2025 18:00:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98B486071C;
	Tue, 16 Dec 2025 18:00:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A6D4119A97F9;
	Tue, 16 Dec 2025 19:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sUZmDVtQVbSET7XgjXwPjJ7VIEIK5vtHf64g0TE1q9M=;
	b=rCvbQVczxnGhgmTN1HwL6qR6TnP1k95+o76okv96c5RV1UAouTbtX8N2sS8WUploHz3t7g
	eqm+UyRcprwzeTG0YSFQKDsKVha60Om0Ypj1s2ObyPskxqpk05MyK46GEXG6I/1or6umEr
	9MogC1PEfZTGxRZiIfsTNBltm1qeoq85g/tA+cNy6DDsod9anJZ0u/kXFboigJojbzHLhc
	0noGPPRQ2mLXDo1EbadMmd6BWtCppqbJMu144jQ4iIQJE3O1mxvaM2bkmWiJ1JAulK8vyT
	JYpaWC7WvRgkwgu0mjSA8zqdvunnkwIUleZZdCc/vJIG5N2x69mvYcHA7PIX4Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:46 +0100
Subject: [PATCH v3 13/22] drm/bridge: imx8qxp-pxl2dpi: simplify put of
 device_node pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-13-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251216_170512_284754_BD0E10AC 
X-CRM114-Status: GOOD (  11.92  )
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

Simplify the error-management code in
imx8qxp_pxl2dpi_get_available_ep_from_port() by using a release action for
the struct device_node pointers.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 111310acab2c..a4941f39a2e6 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -258,35 +258,28 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
 static struct drm_bridge *
 imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep, *remote;
 	struct drm_bridge *next_bridge;
 	int ret;
 
-	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
+	struct device_node *ep __free(device_node) =
+		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
 	if (IS_ERR(ep)) {
 		ret = PTR_ERR(ep);
 		return ERR_PTR(ret);
 	}
 
-	remote = of_graph_get_remote_port_parent(ep);
+	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
 	if (!remote || !of_device_is_available(remote)) {
 		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
-		next_bridge = ERR_PTR(-ENODEV);
-		goto out;
+		return ERR_PTR(-ENODEV);
 	} else if (!of_device_is_available(remote->parent)) {
 		DRM_DEV_ERROR(p2d->dev, "remote parent is not available\n");
-		next_bridge = ERR_PTR(-ENODEV);
-		goto out;
+		return ERR_PTR(-ENODEV);
 	}
 
 	next_bridge = of_drm_find_bridge(remote);
-	if (!next_bridge) {
-		next_bridge = ERR_PTR(-EPROBE_DEFER);
-		goto out;
-	}
-out:
-	of_node_put(remote);
-	of_node_put(ep);
+	if (!next_bridge)
+		return ERR_PTR(-EPROBE_DEFER);
 
 	return next_bridge;
 }

-- 
2.52.0


