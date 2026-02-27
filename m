Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70446FEFB55
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5zephCgeNxQPJw+E+JglMfzSJdrTSKTFnFGqE8i+B0=; b=MLri7egdl/nst86NAUwan2o0Gz
	U3A57Aazk05FEVscZdW6R0C6DzspxXQ1oW4yhKb/uLe+jKu0i2u6RQ1PEweiMZbWNv/d7X+rvnxDn
	U2kP3S5IlbZm269N/+dFOiEkTezgGslRam8vlI49YjmNffASbVN8DWHJszBrQqwOb9CliaWTcs9TG
	OfKh2URbZlSF0MuHPPAADJqfW1PvalE+C1KlDZI5ARYxIAHugf/BVlN/mcqFmkL/l1JM5KxGnN/jD
	M6SqeYo6n5bmAIEesWIctLMTgc+yDdsNWmU2K+gOlsp6qbjPWi2aGYscBGK2wYYEtKmfDFzmRb5w7
	hJWiReFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyO1-00000008QYO-174J;
	Fri, 27 Feb 2026 14:00:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyNy-00000008QUb-2CZZ;
	Fri, 27 Feb 2026 14:00:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9CAF41E46;
	Fri, 27 Feb 2026 14:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5036CC116C6;
	Fri, 27 Feb 2026 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772200804;
	bh=whHPoq+vF7W1Ov0nFP1p1BLZRLXz5nTvlyVtCZGm2ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sutkrBVPIHhEKRjQ5w6GPu6ZjlEQsesQdZm4aITAkbWMHm3+EJxgpvOSK28nD2KpI
	 zsVOK/WmwY7OQfnp5nNpupY/Nr0AP/xxR4hlC5Qexp3fC5XeM8cqTHXmyUyMVugq/6
	 NAf2tKA4nPPLvmW3O3kvTG816sWS5FDND+4IMDaB2aYjzE5xJEOyc4ZAw/sWzoKWc0
	 HmSzsKEgH89LPJN9eb/5muRdJySCihNSPKiVZf4wrbgpo7WeSE6EMBO1uksIQYwMZ/
	 XH8Wx70quJlj1TzI8V5DLmJUtXDyoVho1a9b1iyqjobdaDQDm8Ssdd0/777bKcv48Y
	 AWBenXWBWwxiQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:47 +0100
Subject: [PATCH v2 03/14] drm/display: hdmi: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-3-8bd278e2af9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=mripard@kernel.org;
 h=from:subject:message-id; bh=whHPoq+vF7W1Ov0nFP1p1BLZRLXz5nTvlyVtCZGm2ds=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLF4esfvbi82NOpo8d1pdsQioWFnxa9ExZi+2R0fPqO
 YsLX17u6pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATeRfD2PA+efGbmzufSnom
 mtTHpJT9MvGcJXzQV9Jvv8g6Jw2t+38P1OySO7vvp6PLjZ9zH7n/387YMHmby4KHEjmr3lufj7B
 vSriyJulC08PmhUt+7LjXoBDi4/ztc37hypqnXB2zJYOmR5W1AgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_060006_633561_002BCF56 
X-CRM114-Status: GOOD (  13.99  )
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
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a1d16762ac7a9ebdc48f081c5d2f5e200d406099..f2aec6f65e7a374cea9a1e3adafb4f1cc4d6ab9a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -426,11 +426,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		 * color_formats field will be blank and not report any
 		 * format supported. In such a case, assume that RGB is
 		 * supported so we can keep things going and light up
 		 * the display.
 		 */
-		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444)))
 			drm_warn(dev, "HDMI Sink doesn't support RGB, something's wrong.\n");
 
 		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
 			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
 			return false;
@@ -446,11 +446,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return true;
 
 	case HDMI_COLORSPACE_YUV420:
 		drm_dbg_kms(dev, "YUV420 format, checking the constraints.\n");
 
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR420)) {
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))) {
 			drm_dbg_kms(dev, "Sink doesn't support YUV420.\n");
 			return false;
 		}
 
 		if (!drm_mode_is_420(info, mode)) {
@@ -478,11 +478,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return true;
 
 	case HDMI_COLORSPACE_YUV422:
 		drm_dbg_kms(dev, "YUV422 format, checking the constraints.\n");
 
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))) {
 			drm_dbg_kms(dev, "Sink doesn't support YUV422.\n");
 			return false;
 		}
 
 		if (bpc > 12) {
@@ -501,11 +501,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return true;
 
 	case HDMI_COLORSPACE_YUV444:
 		drm_dbg_kms(dev, "YUV444 format, checking the constraints.\n");
 
-		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))) {
 			drm_dbg_kms(dev, "Sink doesn't support YUV444.\n");
 			return false;
 		}
 
 		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {

-- 
2.53.0


