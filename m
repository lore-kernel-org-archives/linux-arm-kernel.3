Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87437FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHVhNcXkfNqOg5cUFe93QecGkIFDiHj44uNOGg8CdCo=; b=rwpPgnopPkpQKqahNsCg7v6k17
	/rE2qsI91C+ZXtEbtaL8jOkZPeCc8O6YS8M8mYj5EuCWn4njv/3GLp6sxULjeSRAiWObjUjejj4Lf
	0nz5/hX4jJSjsA2jbfC+4iTUIUsqkRdorhI8zeJwcgQCS94zoJjofLHhLIoVXmOwc4NrK+OTsRDO7
	cLavP5zJ35Xq50v3QWXKkgu4oiLXjrUTdv3spxte98s+evBpikk6J22d99a3maCFgNFqEGJSDlXvf
	HrVqsm5vVam5+dr/KB9mQ9ntBHZoc9kLXytuRyaKzApczlbY6xOyoqI4b+98Lm1Gz846NJzjtult2
	J8sGAvbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyO4-00000008Qdc-3C6B;
	Fri, 27 Feb 2026 14:00:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyO0-00000008QWn-3EBm;
	Fri, 27 Feb 2026 14:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 165D460103;
	Fri, 27 Feb 2026 14:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE09C19423;
	Fri, 27 Feb 2026 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200807;
	bh=Bi7dzqSb0xTzyJ/T4zIX0511vvg8pddfBkr4pnB64SM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GohLcTuYqlCpvsdkbjgY6knmX2/mJU6xDmQr39NAaSMdVgm0+vJjOqtUK4woss4Yx
	 GrSprZN0cE1aoK599cv93c5jZIt3igoFcgkZ2GEr95F8XESuOnnvinU8cMHSV5RYw4
	 FKYCf11HP4jpgl0cjQ7WpUZG+6u4XcHfQ3UAKxMA6oRCKh8BwmPI8Boj9p2NQWDzQ/
	 3OJ7zkga0r7lonHXBbDG3rGgdybymvLjJoxgbtybvYzCvDvfCWzWUzwABBJIW1POtK
	 I7TspvMZTdD8MNfQDkawUdTsvAPsAhBhNZ+8mEZExNSNejlJ2+0cG/BPKjmePACv8V
	 6GS2v3fTVMLvQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:48 +0100
Subject: [PATCH v2 04/14] drm/amdgpu: display: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-4-8bd278e2af9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Bi7dzqSb0xTzyJ/T4zIX0511vvg8pddfBkr4pnB64SM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLF4f4Ra7ewKdauD7McQVbcoTR7xVBQfcPlX9ccey63
 dNblqyNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiubmM9UWXAwIu/lWwbec3
 XKOyNb34Wurkjr9xFzldX6meLL4mnnrlvHLGO82/BqcTWOZ6yXZWMTYcCajXeDCd888eufY/ux/
 O3XS3oOrHK/t6z8Wfed8s6v0b97iG9diGqplZmW0Pg18dv8YBAA==
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

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a8e4e3ab5e40276b3c723297ca6520688079e0a7..2fe9044e1e91d7581fd5032b9883548f8e5e1b43 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6723,15 +6723,15 @@ static void fill_stream_properties_from_drm_display_mode(
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
2.53.0


