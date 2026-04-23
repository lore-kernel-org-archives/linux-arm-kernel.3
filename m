Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BA8FDEE47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=024R+OyK2Y65smjr4llyfGFA6gT+sH/YI8b5V01zwpU=; b=K+55YJDFsPUop/iHNHrb3+U1Vo
	6syY6MS7MYrPeggjzLzdmSVynaF8qFFAlzSHZ+hV1nkmyeUw1IUTa631KJpun+xnqb0B9DhR4MdBD
	fkR0d7850iMPRyIpEA8ztZL4OonSDtfOb7xhY8K61LUAegWJgJmPKCBHnc6AdFmC5/4mXpi9b56Jc
	qriTgZaFU7l9pXBzC6QHFl41jGSU2smXjn/h+LvrOjNI3FEBAVHX4kg1x23UHqHeoBwMAHqGKOQUW
	Z6kHCUIV/RZI1Zxarbo7u/HGIGtgSdDiJPN79i/zPGewzJEMlXs4jcD+NWolTurpGvi33h1R55jyU
	MiVdXcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzMR-0000000CA4L-3H4B;
	Thu, 23 Apr 2026 19:05:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzMP-0000000CA1v-33G8;
	Thu, 23 Apr 2026 19:05:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776971082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GDkHHvoz1F9sUbpNWbmvad8z2KGOHdzSP91CpSncwkDw0hUb+heiYaRNT6VfQUstZZo2FyWaJ5tbXrCIu2FTzwmyVLvB+ahrqslfhMUHlUa2URdGQSuiydWxQtiRGOEQR/1miS3BbQoGsEmfcyk2s5LQRJH5IdSakaBMiaAjhhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971082; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=024R+OyK2Y65smjr4llyfGFA6gT+sH/YI8b5V01zwpU=; 
	b=adfL7p8iY56WhKwwG3t6bOuqI2EOb0HIhW7KL3LxuaLRmsmgA4fsnYu9SLZDzRCrXmJ9ELm+nv5dnonm0zgNtKfVjhgdO30DxY2uzl4w8smDNPicwA1A4szHNLlgiWpqUHjfj0pt3PT6SefSX72vylQp10EY8sPvDILrr+OVfxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971082;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=024R+OyK2Y65smjr4llyfGFA6gT+sH/YI8b5V01zwpU=;
	b=JTrGLU7NkY0536Xi1JaAdvfGzneh1kURfSfi6JAOi8O/NJaUGsv8YKWfosJsWKme
	qxFXVl1Smsyq8tWSCpksuc3KX2DT7yINMYVgGGJ6w7yre74NZoUqtNi9aCJxSmtd/bx
	oHs/egIIUUG9iQNgVASANLdrAUJYsICS8TvWUCQw=
Received: by mx.zohomail.com with SMTPS id 1776971079542100.68534778731896;
	Thu, 23 Apr 2026 12:04:39 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:29 +0200
Subject: [PATCH v14 06/28] drm/bridge: Act on the DRM color format property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-6-449a419ccbd4@collabora.com>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
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
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_120513_850908_6FAA490B 
X-CRM114-Status: GOOD (  18.02  )
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
during the atomic bridge check. Call into the connector function to get
the connector state's connector color format. For bridge connectors
including an HDMI bridge, this will make use of whatever the HDMI
implementation set as output formats, and AUTO will never be part of the
rejection logic.

Reject any output bus formats that do not correspond to the requested
color format. DRM_CONNECTOR_COLOR_FORMAT_AUTO is always accepted as a
matching color format for a bus format, meaning that non-HDMI bridge
chains will end up picking the first bus format choice that works, as
has already been the case previously.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 64 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 986e4c79a4e0..3843d45a82cb 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1149,6 +1149,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
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
@@ -1192,6 +1233,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_bridge_state *last_bridge_state;
 	unsigned int i, num_out_bus_fmts = 0;
+	enum drm_connector_color_format fmt;
 	u32 *out_bus_fmts;
 	int ret = 0;
 
@@ -1233,11 +1275,31 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
 	}
 
+	/*
+	 * Instead of directly accessing conn_state.color_format, call into a
+	 * connector function that allows connector implementations (e.g. for
+	 * bridge connectors including HDMI bridges, where the HDMI helpers will
+	 * have already chosen an appropriate output format) to override the
+	 * selected format.
+	 */
+	fmt = drm_connector_get_color_format(conn_state);
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
 
 	kfree(out_bus_fmts);

-- 
2.53.0


