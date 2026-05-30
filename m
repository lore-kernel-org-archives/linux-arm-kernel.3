Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D79CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udMxTHKuJ20dCkTD67TyqCY8+b/I8UaND6lYdbnDojc=; b=fIEmAd4sI8JBiMfU0G3rTmH9Zm
	Wm2vp8ODT7onXnTbA4Qf2rvGC/kLN3mJAs6zl5Qkj8QRNskpYHVMz2xm5lm1WTGp8a0RKaeEkw/Ah
	eAQa6gHUM7plGlVwrBfUX2InmiLjazsOpTwHwHR1L08c1DShSjVZlGGcT6n9Q7YAAx4TBVBYxhZrp
	WjsIBFAQEvzMxgMFl12qL+cGKwh+5cFgbaLSzAuPS0R9O+ezj7BkiUCJsbjJhciGxk9tREoLTY32F
	/0EIqj89qhObpcQHJ55BYRiRga6dvi0bOwGVBlt5wdlTtHZFQdN1Adl8hlPTc2obRxrAr22h72xIZ
	POrsjRVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKFS-00000008mzf-1KuD;
	Sat, 30 May 2026 14:01:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKEz-00000008mn1-0cby
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D721F43995;
	Sat, 30 May 2026 14:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477BE1F00899;
	Sat, 30 May 2026 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149640;
	bh=udMxTHKuJ20dCkTD67TyqCY8+b/I8UaND6lYdbnDojc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J91LWjjF+Lt2vB4rFj0lw83Wes2zW1QOgDC4Ix2mcyanLFRtLaOHVqMrbcFFMN/wm
	 pK3mK5AHmAxrVIu3YTIY4ImDARDf8JyqlqX/SCKdCPG61pZriUmDvEC2G1z0KAO3NS
	 TDjlYbEux+94NiIT4tI2u23UWXEJWWrUlpnRPu46fLDoG5zOs1lRcVas8qMJa7pKl9
	 2DkIQMpzZmKSHIYnr8jwLyfz32P1YOvf/gzpbtIl9u42j/biwrFCm2CGQKgK+Bt8fE
	 xj0J4K17mbbI23ixVden5xuDyI2VOu2coJJ4O0lphigqScJxWSFYNwufqewQgioBzw
	 jyOO6ZWcPfxlQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:22 +0200
Subject: [PATCH 17/76] drm/bridge: imx8qxp-pxl2dpi: Switch to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-17-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Y8eZEo2uvJkKE0gTQ/stQ43vPambIHrcJfUOstCjQTc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb23e18Ys6GH3/Sh7aP3fkPK7e1ntXKfM2LlsNcvtp
 xeCVxne6ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT4f3PWF/3cj3Tb4nbcYIs
 U7vN2NUu37p98dPahEKFuH0Hpi1/4R8htWsFM3f7XslNPLfbcp9v02dsOL+p7M+KD04ZmwyXmxh
 flI89qn9c/MHPna+WuQRbXFHJWfCoOuen3Ymyo4X6Vuf1WuXlAQ==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070041_235775_4977E61F 
X-CRM114-Status: GOOD (  10.94  )
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
index 87305d3e0c39..2fc9831f7e61 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -208,11 +208,11 @@ imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pxl2dpi_bridge_attach,
 	.destroy		= imx8qxp_pxl2dpi_bridge_destroy,
 	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
 	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,

-- 
2.54.0


