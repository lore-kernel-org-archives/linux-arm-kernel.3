Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DA5F34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzauR+KKJUv0OQ342MqFlZzgfROujyztvta1hCF81lc=; b=PfDGU3AAf/mg9KedlfEi8EtAuM
	zSdHFRZotFuJWVgndQloPs3B2yZTWXLDWfn81BkYfem7r21BVQ6E3qBMYoEgZ3smANxM8l4ajMFVu
	eGx2qwUyxyQfygKPXTUSD34JVOhSZI4fJra3mVlwyGSpYyPP1wVbpHogx0FSHqxHUMde8HqZvtEF7
	U4Le1jVAQSv4hLYN8AQE+UJMTP3jr27hTJv3PFmgOi41XVT7YIqKhoq5ROrvee6P1jE1nw2F/3mvR
	4vE3DQny8jEyUcG/2PutLQMQe6Yt5acP1dwZEHZnJd/fktgIouzQtTyc3yEhUeyzNDmBP/CsYhJUD
	35Z7WmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHof-0000000FnlM-1lpJ;
	Mon, 13 Apr 2026 13:59:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHod-0000000Fnje-3Bhq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:59:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D3761A3255;
	Mon, 13 Apr 2026 13:59:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 218B65FFB9;
	Mon, 13 Apr 2026 13:59:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 391FE10450269;
	Mon, 13 Apr 2026 15:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776088740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wzauR+KKJUv0OQ342MqFlZzgfROujyztvta1hCF81lc=;
	b=Gv2FSf7y0qPnQBsW+k2lhk7HtC/MvYjLCCIx2zm5Jf2F0JMHeW/2BwWH88Zf8LINWmCcWm
	oFf8dQmGDtyKmqKTEWnDDwzYrxa7gfEcWvA+NSRn9cE2mgenHRCetEa+MBmb5WtZaoOVBD
	HD3KhDp2UVzbGG5+AHSqWsX7JBzKV2A7paVVZgCLVp17rHYunP0lxq5sDWHX0vlrBZbcWx
	qSMzzvZxypHfy5b0LTJS2HgSc2E2EiQL15g+SsrBPKDSzvC/pHVZHoLhFIgefbrduzZoT7
	qZ1YCWnpmdBt9zqBx3S5h+EjO8L30I7YphkKDNM8Nv81EwL0nTI0E4N+bVZzmQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 13 Apr 2026 15:58:35 +0200
Subject: [PATCH 03/10] drm/hisilicon/kirin: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-3-acd01cd79a1f@bootlin.com>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_065903_943063_E43E2D5C 
X-CRM114-Status: GOOD (  12.90  )
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

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. Here the bridge pointer is
only stored in a temporary variable, so a cleanup action is enough.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index e80debdc4176..7b2ef5ed2c40 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -778,7 +778,7 @@ static int dsi_host_init(struct device *dev, struct dw_dsi *dsi)
 static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
 {
 	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_bridge *bridge;
+	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
 	struct device_node *np = dsi->dev->of_node;
 	int ret;
 
@@ -786,7 +786,7 @@ static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
 	 * Get the endpoint node. In our case, dsi has one output port1
 	 * to which the external HDMI bridge is connected.
 	 */
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, NULL, &bridge);
+	ret = of_drm_get_bridge_by_endpoint(np, 1, 0, &bridge);
 	if (ret)
 		return ret;
 

-- 
2.53.0


