Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E79C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eukZ4Yw0lPupGVKUZsE6QR5EVi6K7EEsCGMJTKxA3Qg=; b=K0B9tGi1Rf2dfvnkORztoucS7o
	LbgSANXk5Igt9vKaQ8w2brdxG3IdskRMKcea4KKQ8CeIDinze1OM/UhC7nfNfnwi93Ky0DvVSb6BB
	kFK9756M31uiAJwq8p08tt9586WITgAl4GlPe5WVlo+LiFOmGUW3bbuifBWvwncJOshKQMei5ajRX
	1cqXKUzbbCW6aW3M8Es+rERnjiGYnvW7kMGN7CErdNfmagY4Y63wuzowBHRIqRX+zTL4FzJpJB+1/
	sPgLpfIsoPUIleXFZeLD48XJp7W7KZ8NNulkqEh7arz5BxE+AHfHcxuV6R/gjKY9M9bJ0uuDzLikS
	AJWZQ6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdp1-00000009F9K-0GBF;
	Sat, 08 Aug 2026 09:58:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsdoy-00000009F47-3r71
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 09:58:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47fe45db360so32589f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786183107; x=1786787907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eukZ4Yw0lPupGVKUZsE6QR5EVi6K7EEsCGMJTKxA3Qg=;
        b=tBh2zq5w+fz9J1uch4ubzAau0xb04PtWz09xsQev3UicjzORiRJ1F4lSU89Bhh4FrT
         /eghy2Zk8mjhrMIcPJvqUELVc8GDqOyxR/dtDogmhKVG+0yWKPAhjQcU0SBQmMq8vXah
         E/7XdemhzC8d/xm8C4VEh4nAy4dWGJF2jU30x7e120yg7cbnk7CkY584W5H44J8Q9PbZ
         O+5Hy8c9E4HfqNrnDf0pj/MAwOgZYor3rzlmRwSnHyi9qjR7olMCZuSgo+yagNsijyxN
         Wuhy0Wmun80N25t9TGUmI5Ed61l4NMBhlc8tA0zfmkXrX/9z0oVcO0UqEyTz0NYP3rv1
         Wq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786183107; x=1786787907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eukZ4Yw0lPupGVKUZsE6QR5EVi6K7EEsCGMJTKxA3Qg=;
        b=GN5sUtNHaHGODPMTzPEQt+yAR7cNG1Kk2CE/GluiJs5wRJkrqlj5O4CkehDa4lRkqG
         I34P9KYHri3zXQA1+aCpCzvVhhwvQD5HbKy0mjeCjwdtrUh0kfZPbKVNxw5Ez5Eaw9Kb
         sr1pbDxSwEDAYGpcjiHn+t0TDgrdS3uMTknbYLEkzdfvs2pRhzl+Mztx7ekHAn9bRinU
         z/XhsAA9EBY6ZUwjzRfMDyPcUbp9Q5rqtXGJk+wmex3wUcNpIXdxCQge+1TT/x/F4gUR
         j6sYj/6ZSOc5D4KBk5Ix8ZcNdELl3LOHXH6zYhKwMXNhr401XQQkT744wRHe2gyBOqED
         UgTA==
X-Forwarded-Encrypted: i=1; AHgh+RpPeKQQqYd031HUd84Z6pKodLxRimdAgyfSQRsmJR/zbXHHYfp3GJeH3+k7DJrdkSa4TkIzZH4Unn+zI9M71qwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwuYN2nu2wKmSewpvAbVDdJgzExayTOMhdWPSMT1xRRrdKAGnN1
	TB1YE2hBTt4qEGaZyRAwFOLPmPbdXrUURvgR0zMvNclZ9RXdDEWdZbXy
X-Gm-Gg: AR+sD10wMYIPY9aZcEcGe40/sVenZomqwz9dX/E7Jdq8b95FMUd8Z+mrC6zIDpOMuGi
	Pn6R4xrbyglV4ObcAc0wPo2KYyuE+eiqj4SKFW8DqfwL+GKBPZMeKlgIpquJueA7TJjbMF4fja+
	FQyQNcbTqJ9Bft27S0DS2sAixxRBBkSKMYiDaKJJrzBpesQMCASVMptBB4U68ZAyXPVto5fmSCG
	nEhgCVovU1wvm1nUNl4/fZSMBvRte9wxQ+ZGTuRSSp35JbB7oWnDl+98RCPLq+zdnspqDaPBppd
	w5xJSgumGH2rF3ePQAJgJPzwPIth6cJhkszOmXKoLce9yPrdaoArriSkccKWX3iw3VaXYz47Iz7
	2MI4yztEY6Uf9rIFlMBRQMnwn8kg85E+iiS8728xwJB7KquAF61JAM47yTZ3xgmakrkOllGrN8u
	/TDzB6/+g5XCaqfWr4U8iBIaR0A2Nx5aiDF6lJ2C6A6ZG2arKyF814hj/H5s/wb7wOONscwJMR1
	J7B9S372smW+Z0vCLh/bUsKGKzOiJ2CjIzi9gQDOmQb3FGeCti31YEiJmf9pgc8697xwxW3Hham
	pkuK4A==
X-Received: by 2002:a5d:584c:0:b0:47f:959f:d5e with SMTP id ffacd0b85a97d-47fec487b60mr22022705f8f.0.1786183107204;
        Sat, 08 Aug 2026 02:58:27 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480020be8f3sm13255725f8f.0.2026.08.08.02.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:58:26 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 5/5] drm/bridge: synopsys: dw-dp: Add BT.2020 colorimetry support
Date: Sat,  8 Aug 2026 11:57:24 +0200
Message-ID: <20260808095749.9428-6-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260808095749.9428-1-royalnet026@gmail.com>
References: <20260808095749.9428-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_025829_007117_1E6A5CD1 
X-CRM114-Status: GOOD (  23.04  )
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

The VSC SDP colorimetry is hardcoded: DEFAULT for RGB output and
BT709_YCC for YCbCr. HDR compositors render into a BT.2020 container
and need a way to tell the sink.

The legacy MSA MISC0 colorimetry bits cannot express BT.2020; DP 1.4a
requires the VSC SDP revision 5 pixel encoding/colorimetry format
indication, with MISC1 bit 6 set so the sink takes the format from the
VSC SDP instead of MISC0. The driver already sets MISC1 bit 6 whenever
it sends the VSC SDP, so only the trigger and the colorimetry values
need extending:

- store conn_state->colorspace in the bridge state during
  atomic_check(), next to the negotiated format;
- send the VSC SDP also when the colorspace is BT2020_RGB or
  BT2020_YCC, not only for YCbCr 4:2:0 output;
- map BT2020_RGB/BT2020_YCC to DP_COLORIMETRY_BT2020_RGB/
  DP_COLORIMETRY_BT2020_YCC in the VSC SDP; every other colorspace
  value keeps today's values. The dynamic range stays VESA for RGB and
  CTA for YCbCr output.

Sinks advertise VSC SDP colorimetry support in the DPCD
(DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED). Without it BT.2020 cannot
be signaled at all, so atomic_check() rejects such a request with
-EINVAL and userspace's TEST_ONLY probe learns the configuration is
impossible; i915 instead silently omits the VSC SDP and scans out
BT.2020 pixels without signaling them. A colorspace change on a live
stream forces a modeset, so the VSC SDP is regenerated with the new
colorimetry.

On the Rockchip side, create the DP Colorspace property with exactly
the enum values the driver implements (Default, BT2020_RGB,
BT2020_YCC). When the colorspace is BT.2020 and the negotiated bus
format is YCbCr, program s->color_space = V4L2_COLORSPACE_BT2020 so
the VOP2 uses its BT.2020 R'G'B' to Y'C'bC'r matrix for the CSC. For
RGB output the pixels leave the VOP2 unconverted and the color space
stays DEFAULT.

Userspace that leaves the property at "Default" sees no change in
behavior: the colorimetry mapping, the VSC SDP trigger and the VOP2
CSC selection all take the previous paths.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c   | 44 +++++++++++++++++++----
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 38 +++++++++++++++++++-
 2 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index ca997ea53e66..8f0ee9628dcc 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -306,6 +306,7 @@ struct dw_dp_bridge_state {
 	u8 color_format;
 	u8 bpc;
 	u8 bpp;
+	enum drm_colorspace colorspace;
 };
 
 struct dw_dp_sdp {
@@ -1125,6 +1126,12 @@ static void dw_dp_clear_sdp(struct dw_dp *dp, int nr)
 		clear_bit(nr, dp->sdp_reg_bank);
 }
 
+static bool dw_dp_colorspace_is_bt2020(enum drm_colorspace colorspace)
+{
+	return colorspace == DRM_MODE_COLORIMETRY_BT2020_RGB ||
+	       colorspace == DRM_MODE_COLORIMETRY_BT2020_YCC;
+}
+
 static int dw_dp_send_vsc_sdp(struct dw_dp *dp)
 {
 	struct dw_dp_bridge_state *state;
@@ -1160,13 +1167,25 @@ static int dw_dp_send_vsc_sdp(struct dw_dp *dp)
 		break;
 	}
 
-	if (state->color_format == DRM_OUTPUT_COLOR_FORMAT_RGB444) {
-		vsc.colorimetry = DP_COLORIMETRY_DEFAULT;
+	switch (state->colorspace) {
+	case DRM_MODE_COLORIMETRY_BT2020_RGB:
+		vsc.colorimetry = DP_COLORIMETRY_BT2020_RGB;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_YCC:
+		vsc.colorimetry = DP_COLORIMETRY_BT2020_YCC;
+		break;
+	default:
+		if (state->color_format == DRM_OUTPUT_COLOR_FORMAT_RGB444)
+			vsc.colorimetry = DP_COLORIMETRY_DEFAULT;
+		else
+			vsc.colorimetry = DP_COLORIMETRY_BT709_YCC;
+		break;
+	}
+
+	if (state->color_format == DRM_OUTPUT_COLOR_FORMAT_RGB444)
 		vsc.dynamic_range = DP_DYNAMIC_RANGE_VESA;
-	} else {
-		vsc.colorimetry = DP_COLORIMETRY_BT709_YCC;
+	else
 		vsc.dynamic_range = DP_DYNAMIC_RANGE_CTA;
-	}
 
 	drm_dp_vsc_sdp_pack(&vsc, &sdp.base);
 
@@ -1227,7 +1246,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
 	if (state->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 		return true;
 
-	return false;
+	return dw_dp_colorspace_is_bt2020(state->colorspace);
 }
 
 static int dw_dp_video_set_msa(struct dw_dp *dp,
@@ -1644,10 +1663,21 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	state->color_format = fmt->color_format;
 	state->bpc = fmt->bpc;
 	state->bpp = fmt->bpp;
+	state->colorspace = conn_state->colorspace;
+
+	/*
+	 * BT.2020 cannot be signaled through the legacy MSA MISC0
+	 * colorimetry bits; it requires the VSC SDP colorimetry format
+	 * indication, which the sink must support.
+	 */
+	if (dw_dp_colorspace_is_bt2020(conn_state->colorspace) &&
+	    !dp->link.vsc_sdp_supported)
+		return -EINVAL;
 
 	old_conn_state = drm_atomic_get_old_connector_state(conn_state->state,
 							    conn_state->connector);
-	if (!drm_connector_atomic_hdr_metadata_equal(old_conn_state, conn_state))
+	if (!drm_connector_atomic_hdr_metadata_equal(old_conn_state, conn_state) ||
+	    old_conn_state->colorspace != conn_state->colorspace)
 		crtc_state->mode_changed = true;
 
 	if ((adjusted_mode->hsync_start - adjusted_mode->hdisplay) & 0x1) {
diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index c5bc178c0a50..798d82893f98 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -69,6 +69,21 @@ static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
 		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, hpd));
 }
 
+static bool dw_dp_yuv_bus_format(u32 bus_format)
+{
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int dw_dp_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_crtc_state *crtc_state,
 				      struct drm_connector_state *conn_state)
@@ -102,7 +117,17 @@ static int dw_dp_encoder_atomic_check(struct drm_encoder *encoder,
 	s->output_type = DRM_MODE_CONNECTOR_DisplayPort;
 	s->bus_format = bus_format;
 	s->bus_flags = di->bus_flags;
-	s->color_space = V4L2_COLORSPACE_DEFAULT;
+
+	/*
+	 * For BT.2020 YCbCr output the VOP2 must use its BT.2020 R'G'B' to
+	 * Y'C'bC'r matrix; BT.2020 RGB is passed through unconverted.
+	 */
+	if ((conn_state->colorspace == DRM_MODE_COLORIMETRY_BT2020_RGB ||
+	     conn_state->colorspace == DRM_MODE_COLORIMETRY_BT2020_YCC) &&
+	    dw_dp_yuv_bus_format(bus_format))
+		s->color_space = V4L2_COLORSPACE_BT2020;
+	else
+		s->color_space = V4L2_COLORSPACE_DEFAULT;
 
 	return 0;
 }
@@ -200,6 +225,17 @@ static int dw_dp_rockchip_bind(struct device *dev, struct device *master, void *
 
 	drm_connector_attach_hdr_output_metadata_property(connector);
 
+	ret = drm_mode_create_dp_colorspace_property(connector,
+						     BIT(DRM_MODE_COLORIMETRY_DEFAULT) |
+						     BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
+						     BIT(DRM_MODE_COLORIMETRY_BT2020_YCC));
+	if (ret) {
+		dw_dp_unbind(dp->base);
+		return ret;
+	}
+
+	drm_connector_attach_colorspace_property(connector);
+
 	return 0;
 }
 
-- 
2.43.0


