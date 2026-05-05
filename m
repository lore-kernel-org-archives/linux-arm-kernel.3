Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7BBFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DoyB8695OKHFJLVaXhyFdUBCqi4FGLL4BEcb0wuk4uw=; b=XNmNQDYlKL7vGFPFgr4CnEbsD0
	ykQT5cJno03DIUqUl1ml8LbZAeOE4JuVzsajPf5j9H3OXqLPT35vUUQtlFPS5kWoIvvwhXRy/f2Ly
	wmHfyaZNjs/MoCROxWxo3Sew9y8dWvulXrl4is1sLirNYbg/5QybPFM8gIMfJhJSTc2R9MJ/zpDB0
	gGu8V8RuKSHskn29gt+Ycr7RLXpw8rRCLFQTtqsSsx2dT9o32mRWdBUHFvuA+L+pMVHb4i56KO/ta
	xkz49BAosj/twxwkOK02xs4I/i0hfJ7CV5Emy1QjMi+bPxNAC7CynM3jTGwkuymUM6Y+xgI5Y1Yww
	kvuJVyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKB2l-0000000FW7T-02H7;
	Tue, 05 May 2026 08:22:15 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKB2i-0000000FW6w-1x3B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:22:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-364c5317d67so5044612a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 01:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777969331; x=1778574131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DoyB8695OKHFJLVaXhyFdUBCqi4FGLL4BEcb0wuk4uw=;
        b=daEjk/qudoE1sc1Tn+86xsN7FIy0L/9vqM4HMcjdDOhx8+22KauFXEjCK8oy4Wss5G
         JX0baX+r63sjwKoSeari/H3H8iojJeUH1Jei60wUec6xacMGoH+LoWs7Fgxxyro3oxcK
         D5IhxvPQYOqnygCv/dAw7ecoaZnkFHskyM/Faa1led0fEpUJEKn3Z0gOu6Ep4bEVZJ0U
         szXrA692F02CAx1/cNGT0ZKBHa76os4vxoLsy2EQ274jnEaE39FP3aq1IgqPeahotXpq
         wfPNNSVpp8NHBWDo0t89xjeb7qRKVaFFe24L0x8dT6aPo0afLJXAgmural1Fei5ZvQ2k
         psCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777969331; x=1778574131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoyB8695OKHFJLVaXhyFdUBCqi4FGLL4BEcb0wuk4uw=;
        b=MLzt3i/SNx/lOvDrKywLd5KI4IHfC9FWOlL3N44a67RRxSoYL1d6MkBEpjlHFgNyAP
         Ii64Tukc58oNOKPh000uURMkWiblcrJ1e6n2zvRJt240czB0z697PR+AqCSUTQuRXcrd
         OUX6voUAPFPU4ZMZj3DnEy/m57pozfbXJXIspYsB0fXdt3+EbtAaIpZozjgcSX8ANUxj
         z7/U6+3qrWw6cN74JMvfqSUuHNgvm8ZrJzUXtqNrZYOUOXFq0t8BZzEwHw0KX8JGe2yj
         CQotPurpM9KcTCKq9zub/MPi2Kj1Ct/1akmTnGF6n+lEZrDjrrUP/yODorzfiEpAW0Wr
         NdoA==
X-Forwarded-Encrypted: i=1; AFNElJ8oI1JEZ0XXFwiMtcrXxiEm+Z+0SI7hdgrrEbLRkWVuosqQhEQ2CjkSxMue+M5B/H/FiRM/y5qhPgFDrdtejbWO@lists.infradead.org
X-Gm-Message-State: AOJu0YyAKhHk6GZtJbrhOWN47agcGss2Cucg37WjjCG62T1EG2sGl/6S
	mqwvSfIMTm6n8TF2neTxuoNBAOPyC8xdPI8GeycOIamDoW0PjxOTiZxqYFB0LTPQMO6YbQ==
X-Gm-Gg: AeBDieuO1/LkFs45j9vrwNCrMoau3+dkN5KR2mrVdP/6QBU7IR0jTYkdEUkQF9SrqTK
	60RJWOTn39K5LT9gdGGCL/W6OXuD8jCFaRGPnhDWgZyQ4C1N/T5EHVS1koZbWiLL6ZYG4+2pgmK
	m/KHdbiZ6AJktK1tIw/SrOKVU+Fl7tPlrWxPp3YLqjbBiUU3rvinJIood+9vVK5Kcqj+P4kJ9cR
	FUulAuYRYq6hjtm7ybSnCJFGSPOIlnFfmDIE1ps+rGN8Z0Z6jHa1H3f4nr0HpZEbFcfCUByrx4u
	LZIYcWkV1CrSNsiaqUNEVXEMeyzCRZ4xfY4rVMvP3eFrnKI1DterCQ2bb8CNafuCowBwLgl3J6O
	PWqfZQ3/6fQW6PHYg4l8uVB56kaK/5UDNNOnXqF+WQG/5AE/icjRu9FjREbLTmBB709wsbu+fu3
	U2J0cUyqDxY7oBs5z8hdCFo7eF
X-Received: by 2002:a17:90b:3807:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-36577487bccmr2309864a91.13.1777969331396;
        Tue, 05 May 2026 01:22:11 -0700 (PDT)
Received: from lgs.. ([152.32.133.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3650e94126dsm11439814a91.5.2026.05.05.01.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 01:22:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Tue,  5 May 2026 16:21:45 +0800
Message-ID: <20260505082145.603262-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_012212_515900_FEF59B73 
X-CRM114-Status: GOOD (  19.30  )
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

imx8qxp_pxl2dpi_get_available_ep_from_port() returns ERR_PTR()
on errors. imx8qxp_pxl2dpi_find_next_bridge() stores its return
value in a __free(device_node) variable before checking IS_ERR().
When the function returns on the error path, the cleanup action calls
of_node_put() on the ERR_PTR() value.

Do not let a device_node cleanup variable hold error pointers. Return
the error code from imx8qxp_pxl2dpi_get_available_ep_from_port()
directly and pass the endpoint node through an output argument. This
keeps the cleanup action operating only on NULL or a valid device_node,
while preserving the existing error codes.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v4:
  - Drop the sentence mentioning the custom static analysis tool.
  - Add Frank's Reviewed-by tag.
  - No functional code changes.

v3:
  - Do not change DEFINE_FREE(device_node, ...).
  - Fix the driver pattern by making
    imx8qxp_pxl2dpi_get_available_ep_from_port() return an int and
    pass the endpoint via an output argument.
  - Update both callers so __free(device_node) never holds ERR_PTR().

v2:
  - Fix DEFINE_FREE(device_node, ...) directly.

 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 54 ++++++++++----------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..881ebb811eb3 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -222,52 +222,52 @@ static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 			imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts,
 };
 
-static struct device_node *
+static int
 imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
-					   u32 port_id)
+					   u32 port_id,
+					   struct device_node **ep)
 {
-	struct device_node *port, *ep;
+	struct device_node *port __free(device_node) =
+		of_graph_get_port_by_id(p2d->dev->of_node, port_id);
 	int ep_cnt;
 
-	port = of_graph_get_port_by_id(p2d->dev->of_node, port_id);
+	*ep = NULL;
 	if (!port) {
 		DRM_DEV_ERROR(p2d->dev, "failed to get port@%u\n", port_id);
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	ep_cnt = of_get_available_child_count(port);
 	if (ep_cnt == 0) {
 		DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-ENODEV);
-		goto out;
+		return -ENODEV;
 	} else if (ep_cnt > 1) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "invalid available endpoints of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-EINVAL);
-		goto out;
+		return -EINVAL;
 	}
 
-	ep = of_get_next_available_child(port, NULL);
-	if (!ep) {
+	*ep = of_get_next_available_child(port, NULL);
+	if (!*ep) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "failed to get available endpoint of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-ENODEV);
-		goto out;
+		return -ENODEV;
 	}
-out:
-	of_node_put(port);
-	return ep;
+
+	return 0;
 }
 
 static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep __free(device_node) =
-		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
-	if (IS_ERR(ep))
-		return PTR_ERR(ep);
+	struct device_node *ep __free(device_node) = NULL;
+	int ret;
+
+	ret = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1, &ep);
+	if (ret)
+		return ret;
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
 	if (!remote || !of_device_is_available(remote)) {
@@ -287,26 +287,24 @@ static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 
 static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep;
+	struct device_node *ep __free(device_node) = NULL;
 	struct of_endpoint endpoint;
 	int ret;
 
-	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0);
-	if (IS_ERR(ep))
-		return PTR_ERR(ep);
+	ret = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0, &ep);
+	if (ret)
+		return ret;
 
 	ret = of_graph_parse_endpoint(ep, &endpoint);
 	if (ret) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "failed to parse endpoint of port@0: %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	p2d->pl_sel = endpoint.id;
-out:
-	of_node_put(ep);
 
-	return ret;
+	return 0;
 }
 
 static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
-- 
2.43.0


