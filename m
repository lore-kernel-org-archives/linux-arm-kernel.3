Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3A8D232E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvuq5NEmZ16/DzSCFHN8BV0xmbV1KisdqLZgcDHC9U8=; b=Q5iXfmzO0J/l6CqxpqG5Gmdrmk
	4qnR7bFzIiw7ILPK3luryKKj3mzHPq3EHbYIZcHRxAOcZ0s84Syyl2ry0FZbfs7wAlVsZUNQ9Uv89
	BJpMUAQqCCeVhpxce0/kArKKQCkBirN4edDjqgFSFnCCQb9yFx3xMMi/2mP/xEuRq3+Fi8htcEvpZ
	kU35hNIk+w1FxEVBIgVzWcwO7O8HdBULcCxpRQuZSFRngrLG6eR2ODgHNmknU9ySxhnGM7ChhQcwZ
	Ka/82Oq9ukn89Lj2mKCVnQDvyyjaNWKDSLUmJk8sY4elFJUIiK8szrug9a3Uhi3N9xfOr9jFKA5d5
	+fQ9QovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6yi-00000001jLQ-181E;
	Fri, 09 Jan 2026 07:32:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6yf-00000001jH7-2YCe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 07:32:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CFED7C1F6CE;
	Fri,  9 Jan 2026 07:31:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CBC060734;
	Fri,  9 Jan 2026 07:32:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60D54103C87E8;
	Fri,  9 Jan 2026 08:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pvuq5NEmZ16/DzSCFHN8BV0xmbV1KisdqLZgcDHC9U8=;
	b=jVXcrIc4JnfqfMct2bEuj9t8dkEePcr6nz63e9VJ67RavE+olD8VyP1qMO/a09x4+h/wDb
	ivg7VZ25KTYwG6Wb9vGOC/R2e0zbQjm18wPAR7OIXRFuRh/QIdichOL4F/jmXwqpUlrEMW
	X8GACYbPiHJ3MnDEvvGeerWqrYSmfayl6TODTt582TKWJ468VT57HEQ38M6lgqG5uwTFhA
	y6PMstdYOc6ShDTmndTVUSA7AVCDCssCup/n4jiIA+6FiekPnToWlC9ApQUglx/Vcy23Rh
	KSfKGTilVtWZDdw+MECb89yG6Fs/mkvIOGZEO+BzOqQGBPower3RF1fFjZnkNQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:37 +0100
Subject: [PATCH v2 06/12] drm/bridge: tpd12s015: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-6-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_233209_851800_0019BE97 
X-CRM114-Status: GOOD (  13.24  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-tpd12s015.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index dcf686c4e73d..136e47ad1a10 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -28,8 +28,6 @@ struct tpd12s015_device {
 	struct gpio_desc *ls_oe_gpio;
 	struct gpio_desc *hpd_gpio;
 	int hpd_irq;
-
-	struct drm_bridge *next_bridge;
 };
 
 static inline struct tpd12s015_device *to_tpd12s015(struct drm_bridge *bridge)
@@ -47,7 +45,7 @@ static int tpd12s015_attach(struct drm_bridge *bridge,
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	ret = drm_bridge_attach(encoder, tpd->next_bridge,
+	ret = drm_bridge_attach(encoder, tpd->bridge.next_bridge,
 				bridge, flags);
 	if (ret < 0)
 		return ret;
@@ -138,10 +136,10 @@ static int tpd12s015_probe(struct platform_device *pdev)
 	if (!node)
 		return -ENODEV;
 
-	tpd->next_bridge = of_drm_find_bridge(node);
+	tpd->bridge.next_bridge = of_drm_find_and_get_bridge(node);
 	of_node_put(node);
 
-	if (!tpd->next_bridge)
+	if (!tpd->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	/* Get the control and HPD GPIOs. */

-- 
2.52.0


