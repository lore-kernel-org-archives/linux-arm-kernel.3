Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79333CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXQOdX7XBEkUxBf47iwF7kiEHlst61A3B18dKmOcFSo=; b=WvVW1KxU3NwHFiHjbEncpabk4J
	jp4unn3qoB08R+LsCVKZ4KnIxmmUYiWxXhrJED5s7Bpx88H7yWbcXznmFyjntdl/wrBbnCC2dAAf6
	64HlUNATBE6tKjCXF3uO5H53cffHEHIxIymXYvoq1FF/2BHcfJKyXNhqaqEWqDiJmDcqVnBq2X5Zk
	gzaZIXw9uYR2TDeYyeapjZ3OBxZ1vgg/0Nh0cXKZkL0ezzNFHh+mOyMZOvr/FYBTYO8KVgTf+6j40
	kRsxxXaZSPCO0yCBUHXFon1UdwNMtL0GI/HYUJ+JBQBMZxHF5E3v4Vftvz5SkB2ESjSUx3MZvyg28
	z5iIVNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYI1-00000002O2D-0pbW;
	Fri, 19 Jun 2026 12:25:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYHz-00000002O0N-03wA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:25:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE7F54185B;
	Fri, 19 Jun 2026 12:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF7B1F000E9;
	Fri, 19 Jun 2026 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871938;
	bh=DXQOdX7XBEkUxBf47iwF7kiEHlst61A3B18dKmOcFSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eWAq/pjoQjk8ExHrC7w0y+gamZZ1eEMEXz8nU3C1yc66Mg1n8JG4tfFhIQT00JitJ
	 Jlv8VJFcXyb9w8cB/3vlZwYChlt9uwvPqnjY2Bc1evnVE3ENzvOMb+IZnpDqh6/bYC
	 8bfbtjxEyDeJ7PEVerxzimD6PA4wHJD55TNUB8UfhFg0VDDUOPGu6rsPI/GPrwAMQp
	 z8o3PwyMniRKSb0Pje4UPLFvBYsmyk3ne3ZhpeL9Ig4hTeXFh3l0Iz2FIFsl8qZTEP
	 QGIdwtYJ0kB+alCIJSdoz3LUvcpU7fG73+cJ7zjUie+i3OJgI7ksCG5KFx9fAkgysr
	 GdZRhpqeyEbSQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:24 +0200
Subject: [PATCH v3 19/78] drm/bridge: imx8qxp-pxl2dpi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-19-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vVVp8GsFRRm3nFu++DWX1HhXskP6Cx0EuWCKzLtmKBI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJp9uPcyeFVzH/fjTwqNPzsqWGW+cYxZ2tseZtb0/7
 FnPhPDwjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRICHGhkPrarketanKr+1d
 JzqxVJGjbtaFzvapyenCa29MLe7/qzd/7a1LvUsiilp/mO0Rs/hjwtjQ62X5+HBv8Zk75kk2ill
 /Ck1Cdx2N3rPHf5XZOo+Ofa5vjL7NPiCjo+MzP8/gZ8nsjYIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 87305d3e0c39..dce1a5b36024 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -208,11 +208,11 @@ imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pxl2dpi_bridge_attach,
 	.destroy		= imx8qxp_pxl2dpi_bridge_destroy,
 	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
 	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,

-- 
2.54.0


