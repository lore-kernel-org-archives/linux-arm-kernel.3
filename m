Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBC9CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcHdI6qcIbZRru+epTGYwHq+JtnbwIYAlw5Lb861Jl0=; b=U3FQsQA9It6ytDFPrKff88yqzv
	W6/gx4mC3oSB1rMzEOrS7wTrnryV5sdu4XoY3Rw6mpiEa9joW3J3gTjoGdVy/7++Y1F/ERZv1LpCm
	D6dcBh2W+SUcXpSYtaOJycnCxFa0MkzKMm+qKouV5NdX82kxx/ypj/MoKLmfBH/OAqC7EFhVOCdRo
	32LM8EZz7sVabYbA4Hs45wfXBTC0NPPL5GARCEXImbjGwE7bxufyoV7JvoPyWaPhfl34xc5i5BT91
	YSfxDkCJaFFFvLibnpLn+wnAhUjQbCg4tackAch+dRUZ6wjvaAXU4XBFgRcZlgP2/yp+bPuj+nChZ
	/jYabdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQsIT-0000000DpGQ-47c6;
	Sat, 23 May 2026 19:46:09 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQsIO-0000000Dp8v-1zz0;
	Sat, 23 May 2026 19:46:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779565532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IMHX5KGZKKVZ54AEt8SV6WNFtJdbNIvL4cJpzFnAvR59EabibCb9qPEA3dZZIyTVtaeaTGMM+lY/KQ1aMhrduNCq32welpf2LLzv1CIh8Hf9v4fJDJJDvMehe2XR2qkn9G3VYjcJah6g+/J3+VKGrI+l23GGcgbrZN/zVfWPYpI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779565532; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QcHdI6qcIbZRru+epTGYwHq+JtnbwIYAlw5Lb861Jl0=; 
	b=CbIlYFIqUXnq7efk4ba+UY8pjERg6u2/TgCUCA17RBpjRZ4X7Td0lTCHWRExwkuv9nrNcVSTehc7zR3Kb0th1iR5gyngDkYpx50if3/QOUUqnKm8UiI/yJoKNiPoUPY1buyPh6LLY44RT9YnEqqf8hp++S/Lp3LzYRXHYvuCnj8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779565532;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QcHdI6qcIbZRru+epTGYwHq+JtnbwIYAlw5Lb861Jl0=;
	b=LyfykuGcylXGeFPeM+vwY92nuHd2FCAIrdrrqviI8epLFGd9DV31zD+F7bgZeyhz
	9Budc1w+cTwQqCLb/EkCeYHeA3F0fBUwfrVK+kAJBAn4d7sAsmX2AmcPpeP/YMZ4L1w
	byZCLKS3FtiGbrS+hEC4EcSEr3ruOrLn3ljO7oDQ=
Received: by mx.zohomail.com with SMTPS id 177956553085518.919082045884807;
	Sat, 23 May 2026 12:45:30 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 23 May 2026 21:43:41 +0200
Subject: [PATCH v16 06/28] drm/bridge: Act on the DRM color format property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-color-format-v16-6-24340c5e4732@collabora.com>
References: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
In-Reply-To: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_124604_550620_523F0282 
X-CRM114-Status: GOOD (  18.55  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 64 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 687b36eea0c7..6ec8c23b36b5 100644
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
2.54.0


