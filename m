Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA43F31E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH5low48GM+yv78IQ9owPpTrmwFuFjqqYcrTkdlKUr4=; b=J9gtSf610EHJA7Y0QlGP8a0I0Y
	VqMemaop5jeq1XJFvPSKlTlEpoO7YcPdyr44VKUozrKjpa2+1XJ25PGysRApTWaJiH6o0ksOW8paM
	6Kbs9uyLtfzhzPrSasyyaUS8cm0g4f3YDk0gf0ERSiaXMPa5ZiJmkv8mQGj9IL1JN6tuQMRlD76tj
	Ek/+CuhjQE/wvtbGmoI1pn3vagCr/+6X4dDyh0k+o211oY7LPQztoi4pcq/i3cer+nEoRoqr23/Y3
	N4fHOOyzkl1CB57mRj6MHBLpRwEPPmjoLhiunEmRupI5oUQAn9tpeV6VguxQWg6upVVMd06nq5Hzg
	+2rlQcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAraU-0000000ApFM-2kvh;
	Thu, 09 Apr 2026 15:46:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAraS-0000000ApCx-3Wbo;
	Thu, 09 Apr 2026 15:46:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775749560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H9PJ8yAaLMa84xX6DZGd/sP0UZey1aJRIDY5NFJk/pk36/S0pENQT6LjssxJHYdmUagCzEBpPvQgbuGX4r6jzM0Oa5YzjZuzSC2jm+MkDuV2mzWGj6MicGqSzKpejDRzfOUiHqJJRDUuy3cgGPvdLdBz0F3cc3YLXNroUDImUIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749560; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IH5low48GM+yv78IQ9owPpTrmwFuFjqqYcrTkdlKUr4=; 
	b=dqHF1RaXysaC6WeitzbiXTEatQPWr2sZ/nJAwsYnWi9EaWVEC/mxo4gPj81y/wFI3mvpoa5PFo2sgTxWFO6L3mv422rDD0s8c3kJV5kBTkSui5P0+Xfg4VqqdDAD8qjnYVUyOzrYOQKa5h/uqi/120OF3HTRRwUH3halQpawyJI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749559;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=IH5low48GM+yv78IQ9owPpTrmwFuFjqqYcrTkdlKUr4=;
	b=YNvn3ZwXuDa0vee5YdPF78ndhM5Z7WXVK0hSYa/yK6fA5iaXJc6bzlqa3O740iOx
	Lq4YUICOcCZl69YVIqel2Yj7aOCtEpMMPI8ZiumEO+2xVNlJsaFBW059JGq6AVUhF3d
	gJZaLVYxOsOpg8882hkwTzPVRPhVhCEG6XNXPiJc=
Received: by mx.zohomail.com with SMTPS id 1775749558554589.8455527326919;
	Thu, 9 Apr 2026 08:45:58 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:44:55 +0200
Subject: [PATCH v12 05/25] drm/atomic-helper: Add HDMI bridge output bus
 formats helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-5-ce84e1817a27@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_084632_921508_A4498E37 
X-CRM114-Status: GOOD (  19.84  )
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

The drm_bridge_funcs atomic_get_output_bus_fmts operation should be the
same for likely every HDMI connector bridge, unless such an HDMI
connector bridge has some special hardware restrictions that I cannot
envision yet.

To avoid code duplication and standardize on a set of media bus formats
that the HDMI output color formats translate to, add a common helper
function that implements this operation to the drm bridge helpers.

The function returns a list of output bus formats based on the HDMI
bridge's current output bits-per-component, and its bitmask of supported
color formats.

To guard against future expansion of DRM_OUTPUT_COLOR_FORMAT outgrowing
the hweight8 call, add a BUILD_BUG_ON statement where it's used that
checks for DRM_OUTPUT_COLOR_FORMAT_COUNT. The justification for not
using hweight32 in all cases is that not all ISAs have a popcount
instruction, and will benefit from a smaller/faster software
implementation that doesn't have to operate across all bits.

The justification for not defining an hweight_color depending on the
value of DRM_OUTPUT_COLOR_FORMAT_COUNT is that this count enum value is
only known at compile time, not at preprocessor time.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic_helper.h     |  7 ++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 0de9748a82c6..9e62a24ab4b4 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -28,6 +28,7 @@
 #include <linux/export.h>
 #include <linux/dma-fence.h>
 #include <linux/ktime.h>
+#include <linux/media-bus-format.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -4095,3 +4096,83 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 	return input_fmts;
 }
 EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
+
+/**
+ * drm_atomic_helper_bridge_get_hdmi_output_bus_fmts - helper implementing
+ *                                           atomic_get_output_bus_fmts for HDMI
+ * @bridge: pointer to &struct drm_bridge
+ * @bridge_state: pointer to the current bridge state
+ * @crtc_state: pointer to the current CRTC state
+ * @conn_state: pointer to the current connector state
+ * @num_output_fmts: pointer to where the number of entries in the returned array
+ *                   will be stored. Set to 0 if unsuccessful.
+ *
+ * Common implementation for the &drm_bridge_funcs.atomic_get_output_bus_fmts
+ * operation that's applicable to HDMI connectors.
+ *
+ * Returns: a newly allocated array of u32 values of length \*@num_output_fmts,
+ * representing all the MEDIA_BUS_FMTS\_ for the current connector state's
+ * chosen HDMI output bits per compoennt, or %NULL if it fails to allocate one.
+ */
+u32 *
+drm_atomic_helper_bridge_get_hdmi_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	unsigned int num_fmts = 0;
+	u32 *out_fmts;
+
+	/*
+	 * bridge->supported_formats is a bit field of BIT(enum drm_output_color_format)
+	 * values. The smallest hweight that is smaller than or equal to
+	 * %DRM_OUTPUT_COLOR_FORMAT_COUNT will do for counting set bits here.
+	 */
+	BUILD_BUG_ON(const_true(DRM_OUTPUT_COLOR_FORMAT_COUNT > 8));
+	out_fmts = kmalloc_array(hweight8(bridge->supported_formats),
+				 sizeof(u32), GFP_KERNEL);
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
+EXPORT_SYMBOL(drm_atomic_helper_bridge_get_hdmi_output_bus_fmts);
+
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index e154ee4f0696..7256eaca109b 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -295,4 +295,11 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 					u32 output_fmt,
 					unsigned int *num_input_fmts);
 
+u32 *
+drm_atomic_helper_bridge_get_hdmi_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts);
+
 #endif /* DRM_ATOMIC_HELPER_H_ */

-- 
2.53.0


