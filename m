Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD61F31E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcJyWEGLIvfQcO/+XwNqriHXbkQg0ffa7hvXsSEbx7M=; b=V6bmFWVlO/TDplbQvLHqnFpAOC
	apAYO9fXnz1YLEhTz2rhh0PtmtTuy5ANrBG0mBct5LDTO98tMbsPy5jjN+C43IhlNkwvIRdjd4Px5
	WFLTD86Ys6B06gJw7FvMS99dmBdIlgMts/2fwxPUyS7PPMdmlmnoKb/1Mr16VrcjDfkhfApzyW11X
	1gaN7SF4tEdA79JA3KqKRMzqH0hfOofl+jz8140Bbvs2dKjGJn3pZHhDcd8xCybar6MRXafXm9SQ0
	mPrpxdN7iw4PbHbZkQb6Vk05YEtFMXGRBLguUmIoE6CQuw3sFIITHLK+JqSqnoB0KP1HHi11HgHV7
	P40y7Ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArbh-0000000AqIL-2uma;
	Thu, 09 Apr 2026 15:47:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArbc-0000000AqBj-41xf;
	Thu, 09 Apr 2026 15:47:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775749584; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Za1iFxD0bEFwICH3LDGxbu9Yr4x+p1ucCvnR4VjK9Qf/GWKF1vyqxZdKsfjVv2hUvVHMiS1UVm1vVGLTiOvEwzMzzZXap+jKM9EKX//5iIm8GMcU+xibCnuCcAtuLImr7mZMXQHB85W5riIvFkvPnbyPHtiPKs0DMg4MOltnUqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749584; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vcJyWEGLIvfQcO/+XwNqriHXbkQg0ffa7hvXsSEbx7M=; 
	b=crPU9qMH/Pb2PxF0uQa/yc9zsEfv44U2GhX+xPBWq8y5CHJMjl0jsajHoJ1AC9Ov7JNzsBXHW94u6ZOLhkUNezNBEOvdNw8wBJwj6dNNm0HMuFSiz9gBTrOaVi4V/jcZnktMMkDC3U+jCOHgs4No8ucMscbsUl50EZTDIlELVE4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749583;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vcJyWEGLIvfQcO/+XwNqriHXbkQg0ffa7hvXsSEbx7M=;
	b=XgeIX2ih7Jc2Cqmxl6902Pmz9aEiz3SDH4TTbpZr2qHEUqIaYkayCpJ+nTMfsNkv
	wIu3G62fOXfKvZe0Q+oAo4WZaFQP2wPnjxhQPk0iGoKQV/+PQSG/XjsrO0q3Vxfu7M/
	G8NA3dGoOnf2sprpDc0VSIMIAOHqOgynxxVYbATY=
Received: by mx.zohomail.com with SMTPS id 1775749581676208.3949884614666;
	Thu, 9 Apr 2026 08:46:21 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:44:58 +0200
Subject: [PATCH v12 08/25] drm/amdgpu: Implement "color format" DRM
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-8-ce84e1817a27@collabora.com>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_084745_114159_73ACE323 
X-CRM114-Status: GOOD (  18.60  )
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

The "color format" DRM property allows userspace to explicitly pick a
color format to use. If an unsupported color format is requested,
userspace will be given an error instead of silently having its request
disobeyed.

The default case, which is AUTO, picks YCbCr 4:2:0 if it's a 4:2:0-only
mode, and RGB in all other cases.

Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Co-developed-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 90 ++++++++++++++++++++---
 1 file changed, 79 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ad9714382d5f..ef9c60c49001 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6762,11 +6762,14 @@ static void fill_stream_properties_from_drm_display_mode(
 	const struct dc_stream_state *old_stream,
 	int requested_bpc)
 {
+	bool is_dp_or_hdmi = dc_is_hdmi_signal(stream->signal) || dc_is_dp_signal(stream->signal);
 	struct dc_crtc_timing *timing_out = &stream->timing;
 	const struct drm_display_info *info = &connector->display_info;
 	struct amdgpu_dm_connector *aconnector = NULL;
 	struct hdmi_vendor_infoframe hv_frame;
 	struct hdmi_avi_infoframe avi_frame;
+	bool want_420;
+	bool want_422;
 	ssize_t err;
 
 	if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
@@ -6779,20 +6782,41 @@ static void fill_stream_properties_from_drm_display_mode(
 	timing_out->h_border_right = 0;
 	timing_out->v_border_top = 0;
 	timing_out->v_border_bottom = 0;
-	/* TODO: un-hardcode */
-	if (drm_mode_is_420_only(info, mode_in) ||
-	    (aconnector && aconnector->force_yuv420_output &&
-	     drm_mode_is_420_also(info, mode_in)))
+
+	want_420 = (aconnector && aconnector->force_yuv420_output) ||
+		   (connector_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420);
+	want_422 = (aconnector && aconnector->force_yuv422_output) ||
+		   (connector_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_YCBCR422);
+
+	if (drm_mode_is_420_only(info, mode_in) &&
+	    (want_420 || connector_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_AUTO)) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
-	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
-			&& aconnector
-			&& aconnector->force_yuv422_output)
+	} else if (drm_mode_is_420_also(info, mode_in) && want_420) {
+		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
+	} else if ((info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422)) &&
+		   want_422 && is_dp_or_hdmi) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR422;
-	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
-			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
+	} else if (connector_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444 &&
+		   (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)) &&
+		   is_dp_or_hdmi) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
-	else
+	} else if (connector_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_RGB444 ||
+		   connector_state->color_format == DRM_CONNECTOR_COLOR_FORMAT_AUTO) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
+	} else {
+		/*
+		 * If a format was explicitly requested but the requested format
+		 * can't be satisfied, set it to an invalid value so that an
+		 * error bubbles up to userspace. This way, userspace knows it
+		 * needs to make a better choice.
+		 */
+		if (connector_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO)
+			timing_out->pixel_encoding = PIXEL_ENCODING_UNDEFINED;
+		else if (drm_mode_is_420_only(info, mode_in))
+			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
+		else
+			timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
+	}
 
 	timing_out->timing_3d_format = TIMING_3D_FORMAT_NONE;
 	timing_out->display_color_depth = convert_color_depth_from_display_info(
@@ -8142,6 +8166,38 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 	return dc_result;
 }
 
+static enum dc_status
+dm_validate_stream_color_format(const struct drm_connector_state *drm_state,
+				const struct dc_stream_state *stream)
+{
+	enum dc_pixel_encoding encoding;
+
+	if (!drm_state->color_format)
+		return DC_OK;
+
+	switch (drm_state->color_format) {
+	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+		encoding = PIXEL_ENCODING_RGB;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+		encoding = PIXEL_ENCODING_YCBCR444;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
+		encoding = PIXEL_ENCODING_YCBCR422;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+		encoding = PIXEL_ENCODING_YCBCR420;
+		break;
+	default:
+		encoding = PIXEL_ENCODING_UNDEFINED;
+		break;
+	}
+
+	return encoding == stream->timing.pixel_encoding ?
+		DC_OK : DC_UNSUPPORTED_VALUE;
+}
+
 struct dc_stream_state *
 create_validate_stream_for_sink(struct drm_connector *connector,
 				const struct drm_display_mode *drm_mode,
@@ -8188,6 +8244,9 @@ create_validate_stream_for_sink(struct drm_connector *connector,
 		if (dc_result == DC_OK)
 			dc_result = dm_validate_stream_and_context(adev->dm.dc, stream);
 
+		if (dc_result == DC_OK)
+			dc_result = dm_validate_stream_color_format(drm_state, stream);
+
 		if (dc_result != DC_OK) {
 			drm_dbg_kms(connector->dev, "Pruned mode %d x %d (clk %d) %s %s -- %s\n",
 				      drm_mode->hdisplay,
@@ -9017,6 +9076,12 @@ static const u32 supported_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
 	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
 
+static const u32 supported_colorformats =
+	BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+	BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
+
 void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				     struct amdgpu_dm_connector *aconnector,
 				     int connector_type,
@@ -9133,8 +9198,11 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	    connector_type == DRM_MODE_CONNECTOR_eDP) {
 		drm_connector_attach_hdr_output_metadata_property(&aconnector->base);
 
-		if (!aconnector->mst_root)
+		if (!aconnector->mst_root) {
 			drm_connector_attach_vrr_capable_property(&aconnector->base);
+			drm_connector_attach_color_format_property(&aconnector->base,
+								   supported_colorformats);
+		}
 
 		if (adev->dm.hdcp_workqueue)
 			drm_connector_attach_content_protection_property(&aconnector->base, true);

-- 
2.53.0


