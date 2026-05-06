Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871F9CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYpMO9UsirEzCSyLpg3GfIDUOtIlMUjHtSOkANbDsUc=; b=F3Ou4KzUMYfHWh1oDBgVW/JOxl
	2zWn0TyU8PhGUzcanwj/SJ9JdC4wttwrqaNvA4x3Sc4DGJrgeLfCxIXKrTpg0f5NUXyM2VqkwNWOB
	nPdWVxXHXpGvJpK2KyxmXml8gKI1RzzXJQ66ruxNM+vbXVCygly0Vt4s1qOb2aMIjEJPVL8dUsWny
	T6QaSOoGP4ty7XGi+y0fuXy6lPAAkYf4FAv8HE2+nkuCZANC6qP1JnbcQWa/p0BXfEhEAe9Ubp71H
	YVw+FSWTAjSNQR7bA/6iBC4eRRZ26RkhECKK1uoCkme849tSt+FIzITNtZFl94df3XleO+jVzLHX9
	v0WuQIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdBo-000000014oc-2LIw;
	Wed, 06 May 2026 14:25:28 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdBn-000000014oC-2w0E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:25:27 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3658ff4d34dso977031a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778077527; x=1778682327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYpMO9UsirEzCSyLpg3GfIDUOtIlMUjHtSOkANbDsUc=;
        b=obr222MHjDM1bMXUc1VPoCvWlLiSXcCKnSuRbcWTOrz4WmWZvaZ5n9aBbTjfTZZc3b
         mAhviyUNXd+tyrKZaBx3h+SXLqeaO3eh9Rv1OQwOZVUa3kLA+DVYY34TuvDir4dxLpI0
         0DWEGNUsBgSJj6uBW/a2Tzt8eOiHwbM7Oq9yOalIQz/DUn0Umib6oDQFyPGU8z+H2o54
         03MVhhvqyDjEfjN8CNh90g0vHTJMdew/0XSWGqjB02FlTjT58PlTIsVdKBMbxPztjTpG
         aVxyLZg8+/HySeOqK+1aqUc9DjJU6106hCds4XTU4eWvmaIZMz2vYvUOTcEnD0s+u/mG
         svSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077527; x=1778682327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYpMO9UsirEzCSyLpg3GfIDUOtIlMUjHtSOkANbDsUc=;
        b=A69jOUbRfiOw9YcRlWuB835Vzd+LumnlXaL+zGE3W5hBab8AyFURbWNFbpNNlElob0
         G1Z4CLuT2DcTcxqD8zt+E/qU7N8gljd1SUV8hMXUFWw1Zc27hFNTV6C6FJnPYAMS5r6a
         Q+V0zqI5yVgQ85Ndy1S3PBMzCzQCUuSjtW6yNi5bJk6+8Cuq3tTCfYV9rA1yxtFo8u1n
         8lvGyhF3bNpA5CyZL0dxCKs38mPtLSdVvTDILSX2OlkJz+rTpIJiSohcpwN5CORM4BUc
         tRMPzJXpbpJhhUuDid33aLBRbPXDMtniPn5kQhmtBr8+3UrqAnzE1mAb+IvQiAjtowGg
         XbmQ==
X-Forwarded-Encrypted: i=1; AFNElJ84QsVbdMplkzILVg/AbsGV2zEUx3sR5MgGFtPEedXaDBtbpfa0fkrDTrbPLCdL/YFMpKasd+1OcxgSuxpNsEga@lists.infradead.org
X-Gm-Message-State: AOJu0YxkKndvTSetKT79VrP6T3SaC+8JHg4Wil2Et6kZWjpVGYDSzYup
	vo416eBVCGmJlYuds3HUy/GElFw+O8oqBgxyaHaGq9y8fgjSgR+1oSK+
X-Gm-Gg: AeBDieuC5jjB45HGDMCdPjeeX8IzXSSTbKBneZovzfAxb9Gg+JVJ1DBOCAqSijenRpz
	ws3LxjD2cUvgb0i7k47nZKEzOvd+hDWsU8n4LjMC8LBmFa6bxlPMiaWSjk/iNb8Do8f6YHbhIll
	nOxwK/yby3+C16yW+VTznAwnrM/1sMNU5ruRMkmiA/yazBxHYSk48YOo4hJWAOkloLpMPsntx6S
	nyOZ/KL3z40f4rsZC6hd9HE5ixn4icFzwOCYkN6eIh1QLltQY65cOlee257WNfGVQCwsUKIVCoN
	6Z7PmkSnv4wuOpsico64Db6Is1VBdTuDzj47K51kNesqk71XW6DYcQi19v6nim2w3CKAuqtVkL+
	dXDt5khUJg7RwrUvgzieUCVqrobpRq0dRgdF0hvghr6uMYyUvK4F0SUAhnKIXEjDmXCiiWdNllH
	+uTZFEFjUIiEJ3PjH8cLgP64SW
X-Received: by 2002:a17:90b:4d90:b0:365:b93a:1ebc with SMTP id 98e67ed59e1d1-365b93a1fe0mr2522723a91.3.1778077526592;
        Wed, 06 May 2026 07:25:26 -0700 (PDT)
Received: from lgs.. ([152.32.214.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b08fb3fdsm1118066a91.8.2026.05.06.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 07:25:26 -0700 (PDT)
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
Subject: [PATCH v6] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Wed,  6 May 2026 22:24:34 +0800
Message-ID: <20260506142434.643523-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_072527_738478_A6E7E903 
X-CRM114-Status: GOOD (  19.83  )
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

Do not let a device_node cleanup variable hold error pointers. Change
imx8qxp_pxl2dpi_get_available_ep_from_port() to return an int and pass
the endpoint node through an output argument. Initialize the output
argument to NULL so callers using cleanup variables hold either NULL or
a valid device_node pointer on error paths.

Keep explicit of_node_put() usage in the helper and in
imx8qxp_pxl2dpi_set_pixel_link_sel() so the fix avoids adding more
cleanup action usage there.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v6:
  - Change imx8qxp_pxl2dpi_get_available_ep_from_port() to return int
    and pass the endpoint through an output argument.
  - Keep using __free(device_node) in imx8qxp_pxl2dpi_find_next_bridge().
  - Keep ep initialized to NULL in imx8qxp_pxl2dpi_find_next_bridge()
    to satisfy the __free pointer initialization requirement.
  - Do not add cleanup action usage in
    imx8qxp_pxl2dpi_get_available_ep_from_port() or
    imx8qxp_pxl2dpi_set_pixel_link_sel().

v5:
  - Make the fix minimal for stable by avoiding __free(device_node)
    for the endpoint node in imx8qxp_pxl2dpi_find_next_bridge().
  - Keep imx8qxp_pxl2dpi_get_available_ep_from_port() unchanged.
  - Do not change imx8qxp_pxl2dpi_set_pixel_link_sel().
  - Drop Frank's Reviewed-by tag due to the implementation change.

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

 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 40 +++++++++++---------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..d64e328bf542 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -222,52 +222,58 @@ static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
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
+	struct device_node *port;
+	int ret = 0;
 	int ep_cnt;
 
+	*ep = NULL;
+
 	port = of_graph_get_port_by_id(p2d->dev->of_node, port_id);
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
+		ret = -ENODEV;
 		goto out;
 	} else if (ep_cnt > 1) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "invalid available endpoints of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-EINVAL);
+		ret = -EINVAL;
 		goto out;
 	}
 
-	ep = of_get_next_available_child(port, NULL);
-	if (!ep) {
+	*ep = of_get_next_available_child(port, NULL);
+	if (!*ep) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "failed to get available endpoint of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-ENODEV);
+		ret = -ENODEV;
 		goto out;
 	}
 out:
 	of_node_put(port);
-	return ep;
+	return ret;
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
@@ -291,9 +297,9 @@ static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
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
-- 
2.43.0


