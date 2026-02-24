Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53636E9B253
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rz+rYqM9GfmTPqS/8kFuzcCGDhCSjghR5oazZZFUFVs=; b=A7A0kccWSV7bPAKKg4D+jWIBGA
	LUK5l2cewZTMfF70ba5TzItz78N2wegoRiKc7BDMxsIkFLplKWXJPSEIaAavPjNFxmv0bX72WAGjh
	LGTgk3hnYtxtkE8WuDcQBOKVMz6P4PD0hw99/Nc78EnacbAp2kzNUJ00jwfeXdFuIvLfycNY2gqny
	pKRgIizRkioL1aamQJfv0cCk3SQIKAcjJ96Qqa5k4ft1eRs4SA/iqV9KRuwxSZxHLdzyxhErCY7UX
	lbZ0WxotVGNZnonl4+3ZFDy+il8feYU3tNBJz4YPAi/Vq9keH7OIu3PIZT3Tp6EpvtQTxcUudqO2F
	36pwRO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8F-00000001txS-0aQP;
	Tue, 24 Feb 2026 10:59:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq89-00000001tov-0AON;
	Tue, 24 Feb 2026 10:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C81444595;
	Tue, 24 Feb 2026 10:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D90C19422;
	Tue, 24 Feb 2026 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930744;
	bh=LvIkSx5r1JzBowBg9zCH2JxqfL/pmpEZNnO8r2uWvD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nlJzdwmGn5lzrMc8XzSAyOlmRRlAuoF+WqWH8z4jWhI6tRM3N6WO06PgUnnB5ofBv
	 Sggd3fQ+SI9egXjDWeZSJ67rmoz9PMKV1HlZRWa1x3/tUIt8jXc38/V7AX6mKwSCki
	 WC2BI9PqUQlW/Ps/xY1UFQ2sq02FhOD27efIXNmR6tIKzJuc4NRaW+j3a5Pi1UwyA7
	 bT6hqUOtwLW2a5yjH0WBxKGPuDV8ilfNVzphnaAkzg0bzHwZigOkgEZsOX1tBH4bwH
	 nrpi9k1i4qjBmw1xQxYWRFU3xs4kUPeBDv8MaQl+zVqcDogXZ6AP1NQqaF0fVdx/39
	 FctKcbaiaeT4w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:43 +0100
Subject: [PATCH 04/14] drm/amdgpu: display: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-4-bebc76604ada@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LvIkSx5r1JzBowBg9zCH2JxqfL/pmpEZNnO8r2uWvD8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW1KOTVWYeKuO9+buqzsWzD5x4eKLy2mNWdMiqud9P
 aZ133bFt46pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwkRMhjPU+Zl2OLFznvp5X
 Yb+XdtTw9I4Vb+VPMvHIcB6PtbJaveXh7e3RrxXsUo4ecS90WyBfPYexziKxImHN0Rd+X0y+9Zl
 dZZp6qL0ifoJoS7lV137vxbP/ryh30AqbsOboLIUrC12XXUxfAQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_025905_140634_DBB59016 
X-CRM114-Status: GOOD (  13.76  )
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c3c045c8144f104ce498d8be3664438b6b799588..76348fb027dfee26c3fceaedf7d37fc29d91e7f5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6717,15 +6717,15 @@ static void fill_stream_properties_from_drm_display_mode(
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
 	else if (drm_mode_is_420_also(info, mode_in)
 			&& aconnector
 			&& aconnector->force_yuv420_output)
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 			&& aconnector
 			&& aconnector->force_yuv422_output)
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR422;
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
 	else
 		timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
 

-- 
2.52.0


