Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED38CEBF8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gs1lZySDkGpqwXxYZoOAuegaRpnGsTAvT6lpT/qhmRM=; b=kneJIWXyyhLpuILLEG4O3G27VM
	9s6Pzuh6m8iB+z1S0U3gPOpXW14vvAkF1mT/QiGJJWHt01pJvLYEGBqq+40WUcuWm3jII7sjiOR5D
	USgApUrIyizloy9iRkl3qIuQUa/j70yhX7Ijpr5Lx4ATjI5O51JfeljSsE8oiLPTriC5Q3yoe27lb
	k6pxISjzIGrKBG890VWdxnSDtJf7GZKWOo9TWQMBVcG/S0bTwl1zXJ4oUxHNmJoHQmeWMyoYDLivJ
	N6vv8Q85ghqR0H4npYh2DZuNMivmNguAX9n163hznl8AddeXc8lqV6pm0OKE6GTs00yJSiz8VjJVo
	qFMILa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4fn-0000000GipX-33To;
	Mon, 17 Nov 2025 19:13:59 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4fl-0000000GilZ-143p;
	Mon, 17 Nov 2025 19:13:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763406806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z21pBSIEKUkTOJiB5hdGRgDrSUkip71Dp0v3zMyBa/QIV91Bd45ohaf2V25lHpjAFmJHncl76IBuNmkhzZGhIySDuo8NpWckdf43wSSTDwYbxBpobQrQ0eCc70k6STIuxKvZmsIe13NUrOIiOKK3rMgiGUwB8x+yVlIWzWlkhXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763406806; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gs1lZySDkGpqwXxYZoOAuegaRpnGsTAvT6lpT/qhmRM=; 
	b=cpYIuOBubqMBGCEVmD8BaEQzteCMEQ0+il35O/s8LJ5DUQNuwg8JeEkpfT5tICHbVUDfAHiX7vcmZqAkPhV+8tJJzLz8FqHpSFmstFY1oLNde4Vwq+tVCI3vJo+b4/m5fhQSmrSJOEOvXOEUKrDBCRpYhliRzW7xHwgcIZ8/APk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406806;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Gs1lZySDkGpqwXxYZoOAuegaRpnGsTAvT6lpT/qhmRM=;
	b=EZq9WaACwM6nu+4207zjZ7BFLwIjrwdMyzWM0XlkTylKaYIqvf2uzfCzyI6nDfne
	iyyXiO/WxV665oIWV+zsMZ4XXeYKTTO9yDhTPabVp4RTUEqBuBhlj5W5u6y4ODqPWAT
	bAV3r+G3+tEMNB8rcuRWOCVuH2ry8WOtrCKrBhKg=
Received: by mx.zohomail.com with SMTPS id 1763406804770398.6739711663877;
	Mon, 17 Nov 2025 11:13:24 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Nov 2025 20:11:54 +0100
Subject: [PATCH v4 10/10] drm/rockchip: Implement "color format" DRM
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-color-format-v4-10-0ded72bd1b00@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
In-Reply-To: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
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
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Derek Foreman <derek.foreman@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_111357_388601_4EB0AEBB 
X-CRM114-Status: GOOD (  13.60  )
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

From: Derek Foreman <derek.foreman@collabora.com>

Register the color format property in the dw_hdmi_qp-rockchip driver,
and act on requested format changes as part of the connector state in
the vop2 video output driver.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  3 ++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c   | 46 ++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h   |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7c294751de19..7028166fdace 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -635,6 +635,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
+	if (!drm_mode_create_hdmi_color_format_property(connector, supported_colorformats))
+		drm_connector_attach_color_format_property(connector);
+
 	return drm_connector_attach_encoder(connector, encoder);
 }
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 498df0ce4680..2fc9b21c5522 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1549,6 +1549,50 @@ static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
 				DITHER_DOWN_ALLEGRO);
 }
 
+static void vop2_bcsh_config(struct drm_crtc *crtc, struct vop2_video_port *vp)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	u32 format = 0;
+	enum drm_colorspace colorspace = 0;
+	u32 val = 0;
+
+	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (!(crtc->state->connector_mask & drm_connector_mask(connector)))
+			continue;
+
+		format = connector->state->color_format;
+		colorspace = connector->state->colorspace;
+		break;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	if (format == DRM_COLOR_FORMAT_YCBCR420 ||
+	    format == DRM_COLOR_FORMAT_YCBCR444 ||
+	    format == DRM_COLOR_FORMAT_YCBCR422) {
+		val = RK3568_VP_BCSH_CTRL__BCSH_R2Y_EN | BIT(7);
+
+		switch (colorspace) {
+		case DRM_MODE_COLORIMETRY_BT2020_RGB:
+		case DRM_MODE_COLORIMETRY_BT2020_YCC:
+			val |= BIT(7) | BIT(6);
+			break;
+		case DRM_MODE_COLORIMETRY_BT709_YCC:
+			val |= BIT(6);
+			break;
+		default:
+			break;
+		}
+		if (colorspace == DRM_MODE_COLORIMETRY_BT2020_RGB ||
+		    colorspace == DRM_MODE_COLORIMETRY_BT2020_YCC)
+			val |= BIT(6);
+	}
+
+	vop2_vp_write(vp, RK3568_VP_BCSH_CTRL, val);
+	vop2_vp_write(vp, RK3568_VP_BCSH_COLOR_BAR, 0);
+}
+
 static void vop2_post_config(struct drm_crtc *crtc)
 {
 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
@@ -1600,6 +1644,8 @@ static void vop2_post_config(struct drm_crtc *crtc)
 	}
 
 	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
+
+	vop2_bcsh_config(crtc, vp);
 }
 
 static int us_to_vertical_line(struct drm_display_mode *mode, int us)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 9124191899ba..33fdc9d8d819 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -637,6 +637,8 @@ enum dst_factor_mode {
 
 #define RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN		BIT(15)
 
+#define RK3568_VP_BCSH_CTRL__BCSH_R2Y_EN		BIT(4)
+
 #define RK3568_VP_DSP_CTRL__STANDBY			BIT(31)
 #define RK3568_VP_DSP_CTRL__DSP_LUT_EN			BIT(28)
 #define RK3568_VP_DSP_CTRL__DITHER_DOWN_MODE		BIT(20)

-- 
2.51.2


