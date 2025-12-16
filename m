Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5854AD609DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w07+z7x1px2/5P0sD/KMZgJOKOJk0feHbjhM11jcOSE=; b=BAdeZBTOIzpPQIrbq1K3pXcj9N
	zb810m+8SzGFded2z/eN6Ca2hrj31F3rIVZCYCIWOM9bqu50auwq7wmhOcHrlxWotan8YyUoOike3
	AMga/Us/YZip/y+OGu0wvEtUc1N5Lo88WG1Ewax4ZkbmlXnQpbtuax3R69bpNRL0qQRVUPNF1K2Xm
	CGB//mPhNIdLRH0KhbQNN56u7y3OEB15vB33CkHbMIciBpPVFD3P2QXGeC7cyO3uAQqGedJV4D9DY
	kWcZhD/5QuFY6ZSAt3Jw+ZDjMAD2xYWiGDaf1Zkas952eFxj+Q+SALkOs9ODSOcQaLVF/l84t13MZ
	SyqEyYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZL6-00000005e8N-0pkl;
	Tue, 16 Dec 2025 18:00:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZL2-00000005e29-2m29;
	Tue, 16 Dec 2025 17:59:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E28754E41C34;
	Tue, 16 Dec 2025 17:59:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6D5A6072F;
	Tue, 16 Dec 2025 17:59:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A5C2119A97E8;
	Tue, 16 Dec 2025 18:59:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907991; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w07+z7x1px2/5P0sD/KMZgJOKOJk0feHbjhM11jcOSE=;
	b=Yj4JB5QjxEBsSUUmh/Tyl7o/8qHKSKegodrvvuWZHLUQhO4pBv/ziIOd/jn42KqNj0Mycc
	JHcGScdowUu9Fs3i3vJr1S8XYxhw8//xtQMQCT4v5qnlzyoXA+HjZgORReIbup5bUbmnwV
	S2FEN9KrdPMPEUIa5ymnnAMic/E11FQ7McV1OH0CrGamPVt6fmx/kQRD4uJ31xZ8jqd9Di
	Z4GpR3XfSHYlSlz8V5hBiSz98f2Q9Vd3tK3P4VNdz6KoMsqiSVyjVixpGOV381uuKSKAcl
	HpblAmiTtrxMovBRTbvqomw+dJeYXiixSn5PvTwMevz0psjPxrbf2xMgFEn80w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:40 +0100
Subject: [PATCH v3 07/22] drm/bridge: ite-it66121: get/put the next bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-7-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251216_095956_883651_F86EC6F3 
X-CRM114-Status: GOOD (  11.75  )
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 0185f61e6e59..9246e9c15a6e 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -298,7 +298,6 @@ struct it66121_chip_info {
 struct it66121_ctx {
 	struct regmap *regmap;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
 	struct device *dev;
 	struct gpio_desc *gpio_reset;
@@ -596,7 +595,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	ret = drm_bridge_attach(encoder, ctx->next_bridge, bridge, flags);
+	ret = drm_bridge_attach(encoder, ctx->bridge.next_bridge, bridge, flags);
 	if (ret)
 		return ret;
 
@@ -1543,9 +1542,9 @@ static int it66121_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ctx->next_bridge = of_drm_find_bridge(ep);
+	ctx->bridge.next_bridge = of_drm_find_and_get_bridge(ep);
 	of_node_put(ep);
-	if (!ctx->next_bridge) {
+	if (!ctx->bridge.next_bridge) {
 		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
 		return -EPROBE_DEFER;
 	}

-- 
2.52.0


