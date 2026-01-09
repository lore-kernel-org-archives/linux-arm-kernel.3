Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D28CD232E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxKIdaKvfopekWvG3hWQtDnNeXJiX7i9YK2gyW5SATs=; b=k7AJibLsK4xqjakkHGuh5EbXvF
	J4cQf+of9CQ3HBJsCD27m4l1wnFXroIp/PjS4CbRbTXqQzTXXSnpNSghddBzqqQetZQQ1vcUvzsNY
	ZY9IgOgltj2149dhKozUyuwTkrEpDZNV1r+DmK3Pny62/1/DXRRt6f0p4hYh/K/cRMGMbi1rSINnD
	LK1B+GO+GMcD4Wj7BbKQ+MPHJCeK4lxibwRTz7cnAjCxSBA9It3OC9alAxZW9GpmllOT5MoOYeDeh
	aMgssiSN/tvSEyVP68rGXsX0T7KjwocWLhvvNU875XJn1XtrZNfLSdE87Z3iPnuK595DC/GpiLZGC
	wL/yBZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6ys-00000001jUR-37pD;
	Fri, 09 Jan 2026 07:32:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6yo-00000001jPA-0Hnf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 07:32:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C1AF4E4201A;
	Fri,  9 Jan 2026 07:32:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FE6A60734;
	Fri,  9 Jan 2026 07:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00DDA103C881F;
	Fri,  9 Jan 2026 08:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GxKIdaKvfopekWvG3hWQtDnNeXJiX7i9YK2gyW5SATs=;
	b=uGrm2Yh8nMAkdUDVxEMReHX/rp073WAEC8AuKIwYdsjF7jvVbJWnZVLt/HMUXJ456u9I2k
	T+sHC/WNkPQAl91yt58yr4H93+vm3bHo9tBVYc8iB3pMJrAsugXLt0lOrvje6bwsA5HT/4
	9mskfawdl3gHTEJEsJhWmRCBTONx4pNMMDoc6poS+9SRrGrKz+xamS74fQaEtvWD7KyfSu
	fVQU7HhTnzkHJ5DqK3Lconib10bEPvwO+uLwGWpLXvt0Zg/4aUF69UoguJOT4rwHdWEWFk
	9vBEBtdq0X01kgxwRvBw4vxjdfkUTDuNIx4L40Qoit2RdKup8SofWc+EqirxSA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:39 +0100
Subject: [PATCH v2 08/12] drm/bridge: imx8mp-hdmi-pvi: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-8-8bad3ef90b9f@bootlin.com>
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
X-CRM114-CacheID: sfid-20260108_233218_438648_A1C0301D 
X-CRM114-Status: GOOD (  14.45  )
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
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 3a6f8587a257..15fbb1be07cd 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -29,7 +29,6 @@
 struct imx8mp_hdmi_pvi {
 	struct drm_bridge	bridge;
 	struct device		*dev;
-	struct drm_bridge	*next_bridge;
 	void __iomem		*regs;
 };
 
@@ -45,7 +44,7 @@ static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
 
-	return drm_bridge_attach(encoder, pvi->next_bridge,
+	return drm_bridge_attach(encoder, pvi->bridge.next_bridge,
 				 bridge, flags);
 }
 
@@ -78,8 +77,8 @@ static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		val |= PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
 
-	if (pvi->next_bridge->timings)
-		bus_flags = pvi->next_bridge->timings->input_bus_flags;
+	if (pvi->bridge.next_bridge->timings)
+		bus_flags = pvi->bridge.next_bridge->timings->input_bus_flags;
 	else if (bridge_state)
 		bus_flags = bridge_state->input_bus_cfg.flags;
 
@@ -108,7 +107,7 @@ imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 					  unsigned int *num_input_fmts)
 {
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
-	struct drm_bridge *next_bridge = pvi->next_bridge;
+	struct drm_bridge *next_bridge = pvi->bridge.next_bridge;
 	struct drm_bridge_state *next_state;
 
 	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
@@ -157,10 +156,10 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 	if (!remote)
 		return -EINVAL;
 
-	pvi->next_bridge = of_drm_find_bridge(remote);
+	pvi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
 
-	if (!pvi->next_bridge)
+	if (!pvi->bridge.next_bridge)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
 				     "could not find next bridge\n");
 
@@ -168,7 +167,7 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 
 	/* Register the bridge. */
 	pvi->bridge.of_node = pdev->dev.of_node;
-	pvi->bridge.timings = pvi->next_bridge->timings;
+	pvi->bridge.timings = pvi->bridge.next_bridge->timings;
 
 	drm_bridge_add(&pvi->bridge);
 

-- 
2.52.0


