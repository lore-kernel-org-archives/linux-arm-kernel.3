Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62771E9B24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xm1fiztNhqcVpz/f12o703VKKdrkLLEQud8LBS+OXEc=; b=B9/0V0/5trA2q1gf4zMNcOyjJg
	sx/K2GCxuR3pEzoyIyTCnZyyg+msEuICA85453CCCDPBkk9cZOzeNBpApVTFqUE5omBgmh6CRIHW7
	Zor+CiBNypop/NvaH/19kQJFgaHv1RxyLztFn8SLlslnkfyw9/1Y1W9bhZzrmAO2v7BwTWkcduMNd
	1ES2GPcUz03SwWY8ZQQuNeQXGEwc952kYsveX2jE63icVz3EBgKsPetJ75QJ/jZzlXF8r5HDgkMKP
	4JxPxGb47h1vUz13mdtB0B7oIHOL9fSi8dGMMU6T68FsP/132A1Y5CJIEJ98EdsyDgH0++DauWAUl
	V/VGkQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8N-00000001uBW-3mZ3;
	Tue, 24 Feb 2026 10:59:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8I-00000001u1q-2mfn;
	Tue, 24 Feb 2026 10:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBD0344568;
	Tue, 24 Feb 2026 10:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48156C19424;
	Tue, 24 Feb 2026 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930753;
	bh=hf/NkNUXRCo2Ri1QSGgEFx9bjemTYIDrRujxGyVnL38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IFtQGT3pfUeaKSrSjW4c8bar6m7KXA9N3c0j9IukXI0ZSk85BxW3LwpiXdEB3coWu
	 VcbtVHUERum0V8y/Zk2DoaNcxLwbcBrcPLhdedru0cnfWn/VEF9Iwu1Qhz2B1V4MD9
	 4OS9ZmSnFUJ5Tk9K62eMuXQj7HoEm1jMl9BAqBGsrfI5WCP/ACsOtG4nCEQUuXonnn
	 T2YATdldCPXl+WUOihzlhRQKBbepDnc0PUrYkafs2+jaTxGytGaS6WiWJxWQNL3GSG
	 pwuAYN27kUNk+O8kPNQBeVzC3rLPpBqu7u7ULVFdL0udwnQsNhaDvHjN3Xr44B2mdU
	 /6NeOIS1JhcJQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:46 +0100
Subject: [PATCH 07/14] drm/bridge: cadence: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-7-bebc76604ada@kernel.org>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
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
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4924; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hf/NkNUXRCo2Ri1QSGgEFx9bjemTYIDrRujxGyVnL38=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW1L5LIst7+xZrh7e5mHrG/IgKWevyI/QJQdjpD6Z3
 5t0m1+rYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEzkeihjnQZ/zZm5Lcz3WG/M
 u175X4OzVNa+r6x9acRhE5VPYrMWnVybVBWsummJ9uf/gVcTlggxMDb8DvHa+vvJq23PnDc1p5Q
 ynr2gtPPmuRDXjIaJm9sObt7P6Mtqb6bloxcXHfXu0+dDXlkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_025914_795244_4E913A27 
X-CRM114-Status: GOOD (  16.46  )
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

The main different is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    | 24 +++++++++++-----------
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.h    |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 38726ae1bf1504528bcd9e3e11670c658a067423..5c2165b310677cb671e57447eb854af614f849ec 100644
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
2.52.0


