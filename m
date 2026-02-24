Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF58E9B252
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5L3G/Laie87l8+jUnaOPXSbbu3j98p7j3yIWlQ1Mxs=; b=XNLSxA79+9rRve/D0API+FgrXh
	LF8Z+uDXuRTvh2eXBC/a9nIGFvzS811OIPTk18jwlybcB1NUHCMBolfZaPtGYPHFLOIrifnsAJ7IU
	7vLLoZVfkCSg9nazxwPu1uqwnxhmNSyc2L62SY44fv6A375ZSFQzCLj0hRHg0qBSmEq11xRfq5UbB
	ydq4F4S0LkvTpAGqipIBcfASXpfinXzEKv0X0YpR6wbbKs0Wzq/ojIAMs+zwwGJaw9FHWtIAgvXVH
	b2+uOkK0eNXOFwBsdLq8drghZlRcbad8Xi0b+xu+/h/p8e3+uNaQ9H/7VcQhsdaqHM6GBsOgoCHLu
	fzL5oYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8a-00000001uVf-21Gm;
	Tue, 24 Feb 2026 10:59:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8U-00000001uLg-3Tvw;
	Tue, 24 Feb 2026 10:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19DC16133A;
	Tue, 24 Feb 2026 10:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393FAC2BCB1;
	Tue, 24 Feb 2026 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930765;
	bh=KceesNBAfhTx1KQMcVuNTGiWT8NUDulfkXBoEqFevAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RhAqQ0DykuMab0KDdOBwoqd5MMn98l/KZLcVsdfnlmUy0PLhDLaqiBd6+azWlFo2h
	 IYOwSV0Y4G7aDFNHO92T5ewOod0HUhA8uC4GtqF+5vfBNOOtk3VKOUrkSGFCBFMZtY
	 4Q9k5BzeZqS/eESBHQIlKRLDtrxkGRGeBxGcKC9bWD/jsqJiaJo81yG82KTPGKm4xt
	 RJq81ygT48uj6U8fAAoBsBqvrR9YL96pZ/IBVSBNNsodxcEUzHyUY9LlmjTkSwKhnd
	 iqntgNZmC2yiqSNCeu7y1g/VXogMNHuIMJG3kww5pS9gBh75zpcj8bbQLvLMmzCmu0
	 v0xaUI0fFcXnw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:50 +0100
Subject: [PATCH 11/14] drm/mediatek: dp: Convert to drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-11-bebc76604ada@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2275; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KceesNBAfhTx1KQMcVuNTGiWT8NUDulfkXBoEqFevAA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW9K3//rzv+f63L1Hpotv8v72tE656t/MiemunlWT9
 l5bMf/oi46pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwkR5PxvqSu433iz0P3v4b
 OfvoDq3zT5Yc2P/kS9DczQts9VjuGHM1BX2+et0tsnvrq2MbpdzPcr1nrBXas8zy8FJBddOkRcs
 nFJkFFU18aOvj6cTbsLB7ccj+s4t27K+dGeZozJoY3+Am4S+qBwA=
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 5e67dab6e2e91de880282289479cf109087af3f2..24b1b62c286635e51f7f4ddc27d07f4dcef01723 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2452,11 +2452,11 @@ static enum drm_mode_status
 mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
 			 const struct drm_display_info *info,
 			 const struct drm_display_mode *mode)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
-	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 : 24;
+	u32 bpp = info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) ? 16 : 24;
 	u32 lane_count_min = mtk_dp->train_info.lane_count;
 	u32 rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate) *
 		   lane_count_min;
 
 	/*
@@ -2519,11 +2519,11 @@ static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	 * datarate of YUV422 and sink device supports YUV422, we output YUV422
 	 * format. Use this condition, we can support more resolution.
 	 */
 	if (((rate * 97 / 100) < (mode->clock * 24 / 8)) &&
 	    ((rate * 97 / 100) > (mode->clock * 16 / 8)) &&
-	    (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+	    (display_info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))) {
 		input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
 		if (!input_fmts)
 			return NULL;
 		*num_input_fmts = 1;
 		input_fmts[0] = MEDIA_BUS_FMT_YUYV8_1X16;

-- 
2.52.0


