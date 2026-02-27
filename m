Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF13FD9E1C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/k5/BqEah/aoOJSil87LueDqk+SxhPr5/f7eVZQF6Ak=; b=0T6/41LCcjlcOOiy1V2yp7nmV9
	hQuYX6A967JHzwlMT0pywi7+O86vfF+wE0VEezeJ8F/CQPNqYnl5o+1nkDkCeBGbng4ivCYif3YIT
	AEiNWtTyarQ2EUMuwDNaYkYGIiJBRwnsmsumLgNeyfcm+QO1gb+6e4tI21ePfmJ49T05xuKo3qBH+
	7oKxLNUupN60XdC/0RmBevxBg5O8zxs5YTJLyb/eReTugNlgJ8azOrqWjWqlljO1ZGTcoul9phkl4
	nkcthHdISLMXnpjGgosOigfiMIw8WtA5/6bOQEleIurE338sMjD5Hp9y0MajpzyixayxAwdgzzjuh
	dsgLa0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3QE-00000008y0y-393u;
	Fri, 27 Feb 2026 19:22:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3QB-00000008xyG-1xRh;
	Fri, 27 Feb 2026 19:22:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772220127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gmELs3Nl/vS1UrpyYAF2cyf1WSvQbOzQBUye0NbDy5BsujxiWibWCTm3V7ilHip8F30hCudB6DhAm1vLwsf/T8a6ExpV7+mC4ybOUuZ6a8wrNm0zD4cISwDtqoIV17/kMM4MXYsudveWZ3hRcqfATS1PMViC+LHGK3JMkCxysOA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772220127; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/k5/BqEah/aoOJSil87LueDqk+SxhPr5/f7eVZQF6Ak=; 
	b=dZvQnJDQeuvipgnF2pQJ+a5/1DxsOQ4ONtUws0ECjw1mmMgrqHOFxbfABhYYDe2YNwAbt92NIm3TrUtsCUYbyjqBcEdv+Ll/v0BjMRjNngiWocjdqaaiL2dPQ5jjj2FJBJZZHDnb9BqiZe7CWUND6OqF8yl6S6Vk2fuQRFg76Jk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220127;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/k5/BqEah/aoOJSil87LueDqk+SxhPr5/f7eVZQF6Ak=;
	b=WOS2jtS92hr5dcpbdmXKLe2XTEk4g7filaYDOnN7N+dK5HK/pfrNmdLQFZlFv1DB
	h2lchROahOTivvDujSgHkJzL6ejcUUnuH1s2sZmZ1/iEyK06km6cHDBR+1rLbwo7nYt
	hzrIIsQFoXe3RNNJ/DQ8WBghMInBqXZNCCIjeLUE=
Received: by mx.zohomail.com with SMTPS id 1772220125698172.56653551643058;
	Fri, 27 Feb 2026 11:22:05 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:17 +0100
Subject: [PATCH v9 12/19] drm/bridge: dw-hdmi-qp: Implement
 atomic_get_output_bus_fmts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-12-658c3b9db7ef@collabora.com>
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
X-CRM114-CacheID: sfid-20260227_112243_591117_A54CB47D 
X-CRM114-Status: GOOD (  16.82  )
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

The atomic_get_output_bus_fmts callback is used by the DRM bridge layer
to recursively select a suitable output format in a bridge chain.

As a bridge that outputs to HDMI, dw-hdmi-qp will have its output
formats determined by which formats the platform-specific integration of
the hardware supports, and the chosen HDMI output bit depth.

Implement this callback. The returned u32* buffer is supposed to be
freed by the caller of this callback, as specified by the callback's
documentation.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 64 ++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index d649a1cf07f5..4556494f9bb1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/irq.h>
+#include <linux/media-bus-format.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -749,6 +750,68 @@ static struct i2c_adapter *dw_hdmi_qp_i2c_adapter(struct dw_hdmi_qp *hdmi)
 	return adap;
 }
 
+static u32*
+dw_hdmi_qp_bridge_get_output_bus_fmts(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state,
+				      unsigned int *num_output_fmts)
+{
+	unsigned int num_fmts = 0;
+	u32 *out_fmts;
+
+	/*
+	 * bridge->supported_formats is a bit field of the HDMI_COLORSPACE_* enums.
+	 * These enums are defined by the HDMI standard, and currently top out at
+	 * 7. Consequently, BIT(7) is the highest bit that will be set here, unless
+	 * the standard runs out of reserved pixel formats. Therefore, hweight8()
+	 * will give an accurate count of how many bus formats we'll output.
+	 */
+	out_fmts = kmalloc_array(hweight8(bridge->supported_formats), sizeof(u32),
+				 GFP_KERNEL);
+	if (!out_fmts) {
+		*num_output_fmts = 0;
+		return NULL;
+	}
+
+	switch (conn_state->hdmi.output_bpc) {
+	case 12:
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB121212_1X36;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV12_1X36;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY12_1X24;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
+		break;
+	case 10:
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB101010_1X30;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV10_1X30;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY10_1X20;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		break;
+	default:
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB888_1X24;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV8_1X24;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY8_1X16;
+		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
+			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+		break;
+	}
+
+	*num_output_fmts = num_fmts;
+
+	return out_fmts;
+}
+
 static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 					    struct drm_atomic_state *state)
 {
@@ -1192,6 +1255,7 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
 #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
 
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_get_output_bus_fmts = dw_hdmi_qp_bridge_get_output_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.53.0


