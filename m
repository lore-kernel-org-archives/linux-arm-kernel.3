Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F49D609D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3venDDom+DGFVL2bgaoBeY8hl48k7Az+c/QW6Kq99o=; b=ARCp92Klo47QINlSFE+Qm7tYjg
	CB0XpRfsAQN4PLwKMgggBmL2ZlK0VoxLeiDGj7GYOw5Je+bV44UBxhOJFMD4+kfdJma/w+dZDUfo6
	YheY1k9hFo53md/ZIWOBlvIFTOY5pS4WNmYVsS3GrZkxe/+7ga6izuTUR1+wcnyP2wnomqptePcfE
	a+l/KGga8nAOy9vaQ0X9rlmE9XfBcTF/puvfMlhphSdRwCS/1weaP7YyYBVFjbgNIZMWhp1wKJGD3
	3ZIimK6I23MU/mdn28yc/QDqlOtfzahvM7h/LXbwKpKsJgTYhQzdy7y1XvbISclP01zMw6m1MNwgy
	wC3r9vBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZM0-00000005fCX-2j5N;
	Tue, 16 Dec 2025 18:00:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLw-00000005f7W-40AP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E3venDDom+DGFVL2bgaoBeY8hl48k7Az+c/QW6Kq99o=; b=QsnNFc4zAnOnjDBx3Uoarol/jb
	Fh4M812XXP6GBqo8YwmcdqWNZUTaOnQyqMp/f6WP1EbvilLL8gqA/563LlyM38FJpCpwscb79HhFO
	hPuk2rSxiDx8ixVy3HlAiOxOYoJmv+RpmA1WTsGEMz7hSvtROEkVLq7oX2KSEZijmVWI80vAAYztq
	Z1YDy7Y5+3ifPxEm1ij3xtzTBKxLpTlXTfz4Pdsux/nQFHCU/bs7OdCpzVFACQAYspRSxlWbDV7Wd
	gHHunUM8dql5xt03rO3Kjp3VFLy9R5vigpwZlHnYxGH9+UzTcsSsDc5mcNKGYLs+CjuU9pjRnMZIw
	nJZNgnmg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYUQ-00000005Js0-31u9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:05:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 40BD64E419EA;
	Tue, 16 Dec 2025 18:00:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10E286071C;
	Tue, 16 Dec 2025 18:00:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FECC119A97F1;
	Tue, 16 Dec 2025 19:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E3venDDom+DGFVL2bgaoBeY8hl48k7Az+c/QW6Kq99o=;
	b=yR5sfELEKiDsl6homJx8wSE/k1REIQEFf5NXXHzizUBK3BAAa2Y0fcoFe6RQ7WxKJSXkDg
	0Cy/3b46ZAqF6OmFmbHfe4CGoK7+ni1KnwlWwKmer5zc15o5unWt58yBwkhmgDyRVwxMMf
	F+Tp/d/qlCVqWAwJqziid9YCm+rVJh07PMgZzGgJmFh0CnEGbc4Brp8POrKw6ZKuKH7XDT
	gcYMAWBTcCtA7ZJFa1lgkMyOf2VI19Bv/w1bQHAf2jQqieWKxr6WNV4LPkd+xU6Zz4tPY9
	zTb2K5wpbZ6He0CLEhK5/IXHbpoJhn3O4wTzbHurzwg+Xmz/1jyARlwuLNQTdQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:50 +0100
Subject: [PATCH v3 17/22] drm/bridge: imx8qxp-pxl2dpi: get/put the
 companion bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-17-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251216_170534_974825_E7ADCAB7 
X-CRM114-Status: GOOD (  11.81  )
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
refcounted and use the destroy hook to put the reference on deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 556aec3b3734..2c40ca86e319 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -63,6 +63,13 @@ static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
+static void imx8qxp_pxl2dpi_bridge_destroy(struct drm_bridge *bridge)
+{
+	struct imx8qxp_pxl2dpi *p2d = bridge->driver_private;
+
+	drm_bridge_put(p2d->companion);
+}
+
 static int
 imx8qxp_pxl2dpi_bridge_atomic_check(struct drm_bridge *bridge,
 				    struct drm_bridge_state *bridge_state,
@@ -205,6 +212,7 @@ static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.attach			= imx8qxp_pxl2dpi_bridge_attach,
+	.destroy		= imx8qxp_pxl2dpi_bridge_destroy,
 	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
 	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,
@@ -333,7 +341,7 @@ static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
 		goto out;
 	}
 
-	p2d->companion = of_drm_find_bridge(companion);
+	p2d->companion = of_drm_find_and_get_bridge(companion);
 	if (!p2d->companion) {
 		ret = -EPROBE_DEFER;
 		DRM_DEV_DEBUG_DRIVER(p2d->dev,

-- 
2.52.0


