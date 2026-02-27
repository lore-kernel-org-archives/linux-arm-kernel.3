Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D13BFD9E1C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 19:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hg3JbOf51qGFiNWUz4/s1v5VBKG+/JhvVIcP9q/nOnU=; b=ereDrN3sQaBl8T/B5iToltoGRE
	mYUcBnyC1QoDiUAPezFtqYHCqAMMS7UBRr3csTjEYub409irf2aCCZ1qYeMTtgKa5vNYpxQrgoY2h
	UCRmLPeY2xAZLfC04lBHIQJ1uzRNax9vISHHI6eaLfgvnSRsLfRO+rxzF4Pw/eCz2/uVvb3a1QHGH
	fMvFnaKxKRxz3WuKtZ3yh8eRx0F3NN3dJj5ci2ZJq+381a3Gcv/B1XVG5M2S9QWdC3Ho0jDw6nM5Z
	k12zSwY1v5k3mv/FGLgjTzmU/13BsFd4/FQ4mOqOYEwtIzmo4FnLz+VpetFehloth0DEYb/eE/Crk
	O1EvM1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3P8-00000008xFp-2oU6;
	Fri, 27 Feb 2026 19:21:41 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3P5-00000008xD0-230b;
	Fri, 27 Feb 2026 19:21:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772220059; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a7lFIvyCcJsH9DCvDr4jZHEDLNIq1Hq76GliARJV+zQn0Pgg/lMiAJByeVcFg/RSmi3fmxWIpWGBLTJizZRvy4k5QNVgg7AmOdo3WBPNE3DLCM+7FgqLw8Y7LDEOpu2iklQauZgjoNCz6JGkrnV0l5Ow0/uK9uS3vXeZk2LHmKs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772220059; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hg3JbOf51qGFiNWUz4/s1v5VBKG+/JhvVIcP9q/nOnU=; 
	b=lHOS1T8Hrps+SdPfmbeeSAxjwFnkDJutw/Qi6k2llpvTv2O09SQ+Y4E94JQUz1cwwi7Lat1vQLD8Dn6YYJqo2OHlJ1vihu5AS9OG3w+wzo5HQSt1GwKAOyznZOFL3xYoW9hRtyZcKIC1h6FjhF0ivDRDv8VkgYz3jyQ+FJuXxrA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220059;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=hg3JbOf51qGFiNWUz4/s1v5VBKG+/JhvVIcP9q/nOnU=;
	b=CLaYwmKpY8Xjs9BOCDkT58HyGwWipr+AcLwrrKsgqAciegkltLKvTPMSNJaC3pew
	+uN3EdkSJvr9UIH8mnnHjBpHlFyJT9xeJ9QhtW8ilUrL38tXhI/G1mDgOpb/Y8LshGE
	zn6CvXQM1O3Cq1OqxQgt291EYOi6nxUoHb3gaK1Y=
Received: by mx.zohomail.com with SMTPS id 177222005703079.58928466955979;
	Fri, 27 Feb 2026 11:20:57 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:08 +0100
Subject: [PATCH v9 03/19] drm/bridge: Act on the DRM color format property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-3-658c3b9db7ef@collabora.com>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
In-Reply-To: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_112135_596585_5DE65AF2 
X-CRM114-Status: GOOD (  19.26  )
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

The new DRM color format property allows userspace to request a specific
color format on a connector. In turn, this fills the connector state's
color_format member to switch color formats.

Make drm_bridges consider the color_format set in the connector state
during the atomic bridge check. For bridges that represent HDMI bridges,
rely on whatever format the HDMI logic set. Reject any output bus
formats that do not correspond to the requested color format.

Non-HDMI last bridges with DRM_CONNECTOR_COLOR_FORMAT_AUTO set will end
up choosing the first output format that functions to make a whole
recursive bridge chain format selection succeed.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6d8947419940..5938fba0a983 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1117,6 +1117,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 	return ret;
 }
 
+static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_connector_color_format fmt)
+{
+	if (fmt == DRM_CONNECTOR_COLOR_FORMAT_AUTO)
+		return true;
+
+	switch (bus_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+		return true;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		return fmt == DRM_CONNECTOR_COLOR_FORMAT_RGB444;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_VYUY10_1X20:
+	case MEDIA_BUS_FMT_YVYU10_1X20:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+	case MEDIA_BUS_FMT_VYUY12_1X24:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
+	case MEDIA_BUS_FMT_YVYU12_1X24:
+		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		return fmt == DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
+	default:
+		return false;
+	}
+}
+
 /*
  * This function is called by &drm_atomic_bridge_chain_check() just before
  * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
@@ -1160,6 +1201,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_bridge_state *last_bridge_state;
 	unsigned int i, num_out_bus_fmts = 0;
+	enum drm_connector_color_format fmt;
 	u32 *out_bus_fmts;
 	int ret = 0;
 
@@ -1201,13 +1243,58 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
 	}
 
+	/*
+	 * On HDMI connectors, use the output format chosen by whatever does the
+	 * HDMI logic. For everyone else, just trust that the bridge out_bus_fmts
+	 * are sorted by preference for %DRM_CONNECTOR_COLOR_FORMAT_AUTO, as
+	 * bus_format_is_color_fmt() always returns true for AUTO.
+	 */
+	if (last_bridge->ops & DRM_BRIDGE_OP_HDMI) {
+		drm_dbg_kms(last_bridge->dev,
+			    "HDMI bridge requests format %s\n",
+			    drm_hdmi_connector_get_output_format_name(
+				    conn_state->hdmi.output_format));
+		switch (conn_state->hdmi.output_format) {
+		case DRM_OUTPUT_COLOR_FORMAT_RGB444:
+			fmt = DRM_CONNECTOR_COLOR_FORMAT_RGB444;
+			break;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
+			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
+			break;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
+			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
+			break;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
+			fmt = DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
+			break;
+		default:
+			ret = -EINVAL;
+			goto out_free_bus_fmts;
+		}
+	} else {
+		fmt = conn_state->color_format;
+		drm_dbg_kms(last_bridge->dev, "Non-HDMI bridge requests format %d\n", fmt);
+	}
+
 	for (i = 0; i < num_out_bus_fmts; i++) {
+		if (!bus_format_is_color_fmt(out_bus_fmts[i], fmt)) {
+			drm_dbg_kms(last_bridge->dev,
+				    "Skipping bus format 0x%04x as it doesn't match format %d\n",
+				    out_bus_fmts[i], fmt);
+			ret = -ENOTSUPP;
+			continue;
+		}
 		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
 					       conn_state, out_bus_fmts[i]);
-		if (ret != -ENOTSUPP)
+		if (ret != -ENOTSUPP) {
+			drm_dbg_kms(last_bridge->dev,
+				    "Found bridge chain ending with bus format 0x%04x\n",
+				    out_bus_fmts[i]);
 			break;
+		}
 	}
 
+out_free_bus_fmts:
 	kfree(out_bus_fmts);
 
 	return ret;

-- 
2.53.0


