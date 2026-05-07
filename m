Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E341ACD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lca9GgtebxHSmlkPkYgy6Y8kn+w8BgkxfJ8muffjImk=; b=hWWInTQTt6966EfRDRLbnRhWNF
	gHoD40xRtfMzh6E7Int6m7ouR995AFudgm2Ww7wrKWDhAPcTjbSx/RscjpJlw5HjXbiLt22r5Y+1v
	SuVi62SO8fT4Y6cYnDGD+S+/FHw8jfTflA4GihgyPMs1f5VHenTQNdtKy/aPLFLlMOW3YbhfExTuy
	HCdi08JjsV+lgnzYzPJcaRh8t1aNJYMdvtS2YGpGvN6MBIXNFpGKPuZ70NmpBbX7fcSb64yjsgAxs
	P8QPK9y7NXYO/ukefp4U12pWGK7QCtOPNQIkOJ5XXl4lr+QT+tbLs4JvdQY6hS3df48tcZjmZpy/7
	s+NdX+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvez-00000003RgU-27Xc;
	Thu, 07 May 2026 10:08:49 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvew-00000003Rfh-2Xxe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 10:08:47 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f8b60e485so239499b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148526; x=1778753326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lca9GgtebxHSmlkPkYgy6Y8kn+w8BgkxfJ8muffjImk=;
        b=H9Um2iQlEn04kIk9cgHE39D5Ck9KB5bocDEjLPNnfeF37Ud6By+caqtN+iCeHjCWxq
         SK1y+CzZU75tJVOKmH34TNfV7BJNzxJYZrDulEmTKOKHnt/oaJ7YCSB324ypIMFFonaO
         5xaj3IineUbkIvjFZuRjGi+eHNYFn5sr1GLw9Nlp9kehjRWDAp2NE/D5oQDnRWTq9XKP
         v0PzCNY+GBqafoB0YKxzx33wkXONdqS+7nh5X+u+k5Vkm2MJPmr+vELiQSIS0LdHWaaS
         lkqNmk2OITYzcGd7dl/QODGKCvX2NNYvgWgrz8V1fhMJwirgE/n0Lki6INDU4LTbEgGZ
         UBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148526; x=1778753326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lca9GgtebxHSmlkPkYgy6Y8kn+w8BgkxfJ8muffjImk=;
        b=GD9wpZrA+CvzZxVFr+QK7i8lz/pDlc+gAoINWYRRx3jibMIdhYgbjJ5U5zUsd0IBxt
         ems/NyqFPffjG6UxjldUeElDMPPXUstHf27IoZDiiNWW+SUqfsiW9c8aKSWogIsGJJYW
         pSCKPlPPMf89LFRdjQmUuQF4T68ymlG02+Wv+eDE25JxBKE+qHuxlMEUZVCE4WQah+9v
         FP82MExhvCkTcHn/PevTTverR9k00Hwjq6z8ykDPXEN8WoxeFCfNqUrOlD9GUwRD2a6R
         pdnFE0FHt1COPLNumx/JmfEB9Z+YjIrCLHIq2/UxYuAib5Bx5b1QlzBtQ0LjfWsaguHi
         PY/g==
X-Forwarded-Encrypted: i=1; AFNElJ8qAuD7755OSfW2wPPdsOv7o+8A1XNh9zziRV2sIldynSiePRdQFhUmwZDUKqqRQb6qmw6wtQJSiJm5XzljDNnA@lists.infradead.org
X-Gm-Message-State: AOJu0YwTVHo3htAVLzoQEaHpL5vww+ZZqQ/XusfLpsNpHJOH5FBQyB8H
	bLSuUYIOClk5wrCELEOisX2Pmx1xtxXAnuDqin4lo+X+UNMQ1wLvpJpi
X-Gm-Gg: AeBDiesxNfbcVj4hSqdQ2Yfd/CgDO4g2sscH754ZgTcS4av7yNUodFO/9HXx30UkDQZ
	DrYhGGp7voXwN5Xgbf8GtrUoD/la8kyi2V6wyas/yRMGSgXxnuD6o1Zqplv2Qm4XqT/62EmcJme
	ivTjCH958aJMAjFbtD0cvpNgu5MHmC8rO9Ht18qDNyQlaXPF31lm0LnNXKgBS2GyF9F2c0Bd/SG
	jQVAzp5cMLFFMVaOoCBdYHfU4ZKJyObRfxo+aWakWxbm71nQtVzyPRgRBLzCvIrSSZSCYLladYa
	RrnXQJdvLoMPZasuhawgEVgpoxyw4BtmNVUjtpNJTDFRQkugMoJZuEWQGFsf8zajjAeBBJj52rz
	JXDjXwu7CGbtVfiiuScBf5CzXqBEX+AxkYRl8JRU3WIRLn9APqQ5UZOOgO32ysbkNJNhJpEmjP9
	myn4Hzkln4UG3kxpMy
X-Received: by 2002:a05:6a00:22d5:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-83a5d387595mr7014546b3a.32.1778148525580;
        Thu, 07 May 2026 03:08:45 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d38ab5sm10162541b3a.26.2026.05.07.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:08:45 -0700 (PDT)
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
Subject: [PATCH v7] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Thu,  7 May 2026 18:06:03 +0800
Message-ID: <20260507100604.667731-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_030846_659062_05ABD018 
X-CRM114-Status: GOOD (  20.31  )
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
argument to NULL so callers hold either NULL on error paths or a valid
device_node pointer on successful path.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v7:
  - Rephrase the commit message sentence about output argument
    initialization as suggested by Liu Ying.
  - Drop the unnecessary sentence about keeping explicit of_node_put()
    usage.
  - Add Liu Ying's Reviewed-by tag.
  - No code changes.

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


