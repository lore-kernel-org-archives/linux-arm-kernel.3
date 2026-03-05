Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8386AEEF334
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHYqPLXfbYQ9a7z10BK1whj4ELVOVX7cZAwF9gLqch0=; b=s25kFVYGby9aTvXmahHXt2BoFB
	uYFY26JL/sIsgxjBrRNegLwRxRbqOtsiAji/8F/xvyZfAMKd1kJ4qn1Ktlh+01KBjspINBODV2tcu
	WD70EgMkM084sQMv9+woaBCiuUHj91dX+2VRI4cXbUnxKSUM1ZmBpKbdHbdL/muV8Wltdeo2V6j0M
	pEP1H65sETvaslvmaZLVnTWmohyUrX9f4tSvOnrqbAdx6eRpDmliQHEXOnnjeY3pPoa6GPDKJKw6d
	SyUY+7e+d7sXFAXv0I1CKPpgUdpuWxWIuD5911OpfbILN9MdSmejjWYlpN3b2plmbta3iyvqsnOTq
	HJoMxPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4eB-00000001Hkh-1fQh;
	Thu, 05 Mar 2026 09:05:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4e4-00000001HYh-33sn;
	Thu, 05 Mar 2026 09:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39C6E43544;
	Thu,  5 Mar 2026 09:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B135C116C6;
	Thu,  5 Mar 2026 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701524;
	bh=Uw9orBa+IcWl61fHU9gR/gF8n8W1ZP87ZlyWedYU6o0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W9n4BNeAR+a9xYl1ZZxbIMAGKMHoLvuxPzck6um0J6B+AXU8/FyuPEV/BbD3mPk/n
	 O3bY9g4aqH2VgPx/EptPTBq66yMQV+zbIwBXjOjFOJel2Hj+CGvJO28k1Yo5jjPVUZ
	 55i1ilXL9Bh3B8YvpQCybvBpvykTNze6meX1EHSSr/lc1p2dZ8io3vfZiulih2ciK0
	 0uoLY7tOhD51wr/I/6KcePj5xR9QLDBjrzh4Mob+aRU+eTIAAcKkMxd6JDmCmfrh4F
	 LsXoSWaQiED+0vli/1vhOcsrIOKeseaIvyf+yLUwYgjn8Zra34LHklr2vFlPR3ALmI
	 VUPLb2cj06zRA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:04:59 +0100
Subject: [PATCH v3 07/14] drm/bridge: cadence: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-7-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4972; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Uw9orBa+IcWl61fHU9gR/gF8n8W1ZP87ZlyWedYU6o0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3S1Lua4cNO/oqj1zN319rrD59z6jo7UnDMrl4hyU1
 bYLHMrpmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABM5XM9Yn7r0fMTxJ3+0Xu8Q
 nrR+NduCpTXGXXx9Eyudb2bM3uZdxy6z7UcXx0+HPz6SB7kM90+6yNjQf2v9cjldtjQf+/K4Elm
 2N99TG7ayWPR7qd4J4rvGI+7IVba5yGHv/7k+TCrLY5vcjwMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_010524_853898_A330395A 
X-CRM114-Status: GOOD (  17.15  )
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

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    | 24 +++++++++++-----------
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 9392c226ff5b11189a93bf40e840bc3f8b287b1f..e38d59e37a777948ddc63e3e08483362c9e3ba64 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1500,18 +1500,18 @@ static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
 
 	if (fmt->y_only)
 		return fmt->bpc;
 
 	switch (fmt->color_format) {
-	case DRM_COLOR_FORMAT_RGB444:
-	case DRM_COLOR_FORMAT_YCBCR444:
+	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
 		bpp = fmt->bpc * 3;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR422:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
 		bpp = fmt->bpc * 2;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR420:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
 		bpp = fmt->bpc * 3 / 2;
 		break;
 	default:
 		bpp = fmt->bpc * 3;
 		WARN_ON(1);
@@ -1710,30 +1710,30 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 
 	/*
 	 * If YCBCR supported and stream not SD, use ITU709
 	 * Need to handle ITU version with YCBCR420 when supported
 	 */
-	if ((pxlfmt == DRM_COLOR_FORMAT_YCBCR444 ||
-	     pxlfmt == DRM_COLOR_FORMAT_YCBCR422) && mode->crtc_vdisplay >= 720)
+	if ((pxlfmt == DRM_OUTPUT_COLOR_FORMAT_YCBCR444 ||
+	     pxlfmt == DRM_OUTPUT_COLOR_FORMAT_YCBCR422) && mode->crtc_vdisplay >= 720)
 		misc0 = DP_YCBCR_COEFFICIENTS_ITU709;
 
 	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
 
 	switch (pxlfmt) {
-	case DRM_COLOR_FORMAT_RGB444:
+	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
 		pxl_repr = CDNS_DP_FRAMER_RGB << CDNS_DP_FRAMER_PXL_FORMAT;
 		misc0 |= DP_COLOR_FORMAT_RGB;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR444:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
 		pxl_repr = CDNS_DP_FRAMER_YCBCR444 << CDNS_DP_FRAMER_PXL_FORMAT;
 		misc0 |= DP_COLOR_FORMAT_YCbCr444 | DP_TEST_DYNAMIC_RANGE_CEA;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR422:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
 		pxl_repr = CDNS_DP_FRAMER_YCBCR422 << CDNS_DP_FRAMER_PXL_FORMAT;
 		misc0 |= DP_COLOR_FORMAT_YCbCr422 | DP_TEST_DYNAMIC_RANGE_CEA;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR420:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
 		pxl_repr = CDNS_DP_FRAMER_YCBCR420 << CDNS_DP_FRAMER_PXL_FORMAT;
 		break;
 	default:
 		pxl_repr = CDNS_DP_FRAMER_Y_ONLY << CDNS_DP_FRAMER_PXL_FORMAT;
 	}
@@ -1825,11 +1825,11 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	    mode->crtc_vtotal % 2 == 0)
 		misc1 = DP_TEST_INTERLACED;
 	if (mhdp->display_fmt.y_only)
 		misc1 |= CDNS_DP_TEST_COLOR_FORMAT_RAW_Y_ONLY;
 	/* Use VSC SDP for Y420 */
-	if (pxlfmt == DRM_COLOR_FORMAT_YCBCR420)
+	if (pxlfmt == DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 		misc1 = CDNS_DP_TEST_VSC_SDP;
 
 	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_MISC(stream_id),
 			    misc0 | (misc1 << 8));
 
@@ -2479,11 +2479,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	mhdp->link.rate = mhdp->host.link_rate;
 	mhdp->link.num_lanes = mhdp->host.lanes_cnt;
 
 	/* The only currently supported format */
 	mhdp->display_fmt.y_only = false;
-	mhdp->display_fmt.color_format = DRM_COLOR_FORMAT_RGB444;
+	mhdp->display_fmt.color_format = DRM_OUTPUT_COLOR_FORMAT_RGB444;
 	mhdp->display_fmt.bpc = 8;
 
 	mhdp->bridge.of_node = pdev->dev.of_node;
 	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HPD;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c7306607a98b84730233c0e984c90576f..8e99a813db0f25eb92f0aa6675e1807c992750a6 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -304,11 +304,11 @@ struct cdns_mhdp_sink {
 	bool enhanced;
 	bool ssc;
 };
 
 struct cdns_mhdp_display_fmt {
-	u32 color_format;
+	enum drm_output_color_format color_format;
 	u32 bpc;
 	bool y_only;
 };
 
 /*

-- 
2.53.0


