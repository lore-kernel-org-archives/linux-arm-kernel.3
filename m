Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2CAFEFB4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pG2CXnHLpJt9IvVrRPC4lU81Gv8pS/PyDirwSt9j080=; b=oWdzrh0LDn18QOUHmmBqK0FKCI
	58/EizBNuZpdrzN0Cj3GpAgjtYwhdlNCv4sN5nb79V4RVGw5VuKNV2vxDqplUA7qo5j2z9sD7WHpP
	zVLp5zFXXiGNs6w0z0l54UPac4U4UjE6H9JxDAdDzndhBzC3l+nMD0PJUDZIBNyJ7xK8S6vS91J0S
	MHlY4QLyGObnhjsJrmYiDpqfd7A8g1c1GlU5QDAbEoj7JDX+o0+v/al7LcaXCXjoFKWgRvPi6pDDo
	aLqk3r1LSrr4icbJ5OPVJk1e0mGZrx+rR4mkMk/1Mp4WY12leE/Wie5wG3N+PWGdFAClwW/UdwhoT
	3WNZnSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyOf-00000008RSY-1Slo;
	Fri, 27 Feb 2026 14:00:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyOK-00000008QyI-23FJ;
	Fri, 27 Feb 2026 14:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B744600AA;
	Fri, 27 Feb 2026 14:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B42C19423;
	Fri, 27 Feb 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200827;
	bh=skFI5P2haIGjdD0+W8BO9ttWB17k7eh3BIV8frGuT1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OVuqYxxVosJaZvlaSAxD1wNFUzIXwFaoC+zjwuLuLSiTayScMcGIugaIUoAx378xq
	 mMmFNqMqPku7/0ZC1B+yFnsPk+dN2gn7B4bpnKrQQP+5B/950G1td+im81uogsnPpU
	 szfYwIPFrRc1qv5VoZN6abJfcavvpfbSP5tldfRNivSW0kvk8coO7YzxY9zOYWNFR9
	 wRZ38urlkNpz3CpogWe1N4fdQMNvNLamG2kWUxrGbOO2A86pM3MhGjpg92A0VUGdFI
	 jpNGJ7Y/TfCtHzOAVidRrPTf6ebh6z7T4GQiGlTXX6IfJRQSO+BzVydngr+TzWsBVA
	 tWM9sqkNp6Bcw==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:55 +0100
Subject: [PATCH v2 11/14] drm/mediatek: dp: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-11-8bd278e2af9d@kernel.org>
References: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
In-Reply-To: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376; i=mripard@kernel.org;
 h=from:subject:message-id; bh=skFI5P2haIGjdD0+W8BO9ttWB17k7eh3BIV8frGuT1I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLF4dP1JdPOR58uuXK0+8z9EQCp0bbRKdO/nI0u2nq4
 g9S6Q5hHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAim54zNryae/D8ioC61UzG
 bb5Rd/4q/XaxVPr8aEL85+Z7ordNlxz0dGdaGMAqpNLFmmnM7jw/nLGGs5v1ztISrc0SvjtahTM
 frGlwSlRa877r+jP9ltdntDgjGFiY8k8wPNCbffBz2E0tzWoA
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

The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 08c4d64b87b944dbcf57294dc48c740a37374469..c52cc7c2e20063b9dcc99be46bc7de50d67b0d6b 100644
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
2.53.0


