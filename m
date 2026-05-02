Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46F1CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xG+dopoE7tyttQuw5xxPLAnkXqhbsfbklISoHSefbCs=; b=jnp9NAbG0u2B61L9iDz+AqcjuA
	MubYbWurtUf0+siJqarVNF55ysf1V70yXTb7Y+d6q2cVn9RvkSXfmMLYiifrUuwgufoeFXcu0JOCg
	DkDuOHTJDM6CCI9nUymRu2k8NH1mx3xFwbdp8Grvd0hqgHMJwkxuW4a+en4jkPiaiHKOOTZTR+gp9
	03g5k6vzQhy2gcguU6fD/heH2e2mOyjizf/WeLrvuP40O9dnSHBVO4oFnhUUtOe7L4PYMM4x59/FZ
	uuBlu6k8gIGpKrnmUVMOIXk6igXtsnTxTW+fkTmum5KDUzMEiXKWfCObcqiL9mrcAgufS/Jd7eTM6
	0+MsUjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ8wx-00000008wdW-3e7d;
	Sat, 02 May 2026 11:55:59 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ8wv-00000008wdB-1dPu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 11:55:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f68b3aaf7so1127220b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777722956; x=1778327756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xG+dopoE7tyttQuw5xxPLAnkXqhbsfbklISoHSefbCs=;
        b=JTIyjbZkjrmI1YahC0rHgOc9wtVhU/lQ3jyS2xJYg3HkhagtqeRVjVgwBW1Aw2myy3
         tNho8tH7KnEn5nNiNGjIleCB0ebduyPTVdvbHo+xcpsAQV7iu2KCWVd38DxhKZaQ5NlE
         mWNb0/JlDh+cHTpQlPCh5R9q1wPkkkHa+haYGTJDomowXdXM31BLItz8sfkHZd0T99vZ
         GuSxSy7w6lrQm3cemHmQBE4UeGmS/szfeAJxxtwdRlZQO8Z23M/W0cL3jug4ALaXoh5M
         Tr5igivafdMRtOaQunBy4VAJ2CDOZ/Gg+qMwGoxs1u4WtGMdHq6M1igmBjTFiomrF5F3
         utBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777722956; x=1778327756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xG+dopoE7tyttQuw5xxPLAnkXqhbsfbklISoHSefbCs=;
        b=dlOBMQi6dX0LUtrMVPmfIzeMdQieDnBqsFhSAgPkNAROsPJCd5t7N0HdkO0EKlfT/V
         ka4wDDBUmU2DSZyPrDU4PBXutufUfkRWR9d6H0Xc4LauO+AqTZ+UaXqLvJZPvuB+ehFh
         NH5sA+NQJ0QgbuMYIwOweDN8enPZMFKscpf2x6NBY1ONwDeeUxSAS18G7CsuSJgGVQYI
         oj2fiR6UDejLFMkLfHdzS/ht7/0H3zxAdNND8dBaC+aaVOOh/Ooydr9bHOjhoGYn/Vik
         gRPqziKT1BoqugTknhFLlSykB0m0OVmzPr134O3ddwnid4ftTzOEw9sTdlNq5fNYx+22
         bn/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+C61CoH5INX/a3uoiBzwZ+BWzYaGE5Cr5e1qs+JcuEt8Yx9GdaC4mVG+ZKik08LHkDfUwoAKRsI4KrmiIJyjLo@lists.infradead.org
X-Gm-Message-State: AOJu0YyBth+kdkKNL2wXNfQGKEcPck6Z02eO3xrKGY2jrj/alDChaRBe
	lMW+M1xPTk1n4iE+6w14Ymkcbduuw7I4Uz1H8+DFM3SUN+9Rl6hDtp3a
X-Gm-Gg: AeBDiev7kYP45YMuraplVBePuf/uaAL4hacANisfMqbzUTqoepn9x3PMaO602me59vA
	E14DnNUMk6tvvr6+82TK+9Xvk+1UydlXlWXbFnLGSyWVrM3jbuJlTr3Ir5zYnQ/K3/FvifmBFUk
	r4PDRYt5hvLwDdXAU3VdauuDKi3ec0VwXB/RZRHxmLNyCoIEa5Z+c6sbTYRdMYhg4o1QZNEY5ia
	t2jE+q7WRCDcjYUgV2yhMHaFhCpklRNRgddx4ZE0znzhl6bYc89VxBQOSJtNaWgTU3+EEBKLppp
	eN5Mr8NbyF4InYF9hZzFOXkF9g03KYA4lEp/ov4G7ZcvqCX17JwFnj14Px467LD5wkI3XQJBfOF
	xlIBDfaHtOUUxGcHBxvE4l7oWPOJzAuYnmaCyj+v/Uwa3+fBdpGfRA/NHXPFZ00UcwEgQ/PpfKC
	AIF5BL1VimdGjpEi1WHFXfC14i
X-Received: by 2002:a05:6a00:2d10:b0:82f:96ab:e011 with SMTP id d2e1a72fcca58-8352d2f802emr2803655b3a.37.1777722955971;
        Sat, 02 May 2026 04:55:55 -0700 (PDT)
Received: from lgs.. ([101.36.109.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b01a4asm5307663b3a.43.2026.05.02.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 04:55:55 -0700 (PDT)
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
Subject: [PATCH v3] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Sat,  2 May 2026 19:55:28 +0800
Message-ID: <20260502115528.530401-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_045557_507260_4DE3670A 
X-CRM114-Status: GOOD (  18.67  )
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

This issue was found by a custom static analysis tool.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Do not change DEFINE_FREE(device_node, ...).
  - Fix the driver pattern by making
    imx8qxp_pxl2dpi_get_available_ep_from_port() return an int and
    pass the endpoint via an output argument.
  - Update both callers so __free(device_node) never holds ERR_PTR().

v2:
  - Fix DEFINE_FREE(device_node, ...) directly.

 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 55 +++++++++-----------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..a82f10218707 100644
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
@@ -287,26 +287,23 @@ static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 
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
-
-	return ret;
+	return 0;
 }
 
 static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
-- 
2.43.0


