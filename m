Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12046EDEBE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIpTWQSDAgBM5vLFSTPj8Q4pckX+CD8ehvSMWdDKUrY=; b=ndG9DClaD1jk10/BU08ureVaDw
	6JU4oCUsVep/nCJzX/0iBpX7I02XdqgnNFrC/1panlcvqjgJ0GqQVqso38DEM/wRcvBzxyu5TOVAR
	/W/5mi1acxfypQlGqjFannCHLfI29nmPBJt9sg894xOpN2NWzzy3CccLjC3jnWlb/56vPna7ctThc
	Pt1hIgNmbEk++gMQOyWE5rF0OYGdnsbpRW1lbL7N2bBIUszLmQBPBc/m58+PlUtVD41LUC/cDGObA
	9jXzXvf/wRLJcqx2XFxSdzHgWHQCxSj2W0a20wZ6U4UkoTccGHgiyMbeMaeCgbfnuiq79ZYd/XanD
	sEYFfG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVMa-0000000Fmj7-1ySW;
	Tue, 03 Mar 2026 19:25:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVMU-0000000Fmdl-49gA;
	Tue, 03 Mar 2026 19:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772565892;
	bh=qYvReqSB6UJn7rr3CRBtQrUk86GQPHVbFJQGJ77D43c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ozTA86d4habLb2jqTJQA/c+1lSV8NTtOWrp5nqdJUwdBCgd1NIH8s/zhtKCdFN175
	 w5e0oswWtdGpACDI4U7fD1GDZZUSJGWeZVuVTMwXLfFFHS8JIY53a5gXpPOf3zZBr7
	 d8AMOJDw0iSCo7Mbns3s52X3ugPy9xvh8cBDE3XiBvalc/K6FXT3akrD3jZ2UnG+ZY
	 ZYS7NnjkXjRCHBHwZLun/niYVKiuxCcotCnxu6IJjXtAfh/Pe7JFka3yIppqjagxRr
	 2HVHeN8WEESA6wplLbn4fNp+T8Yi0tzTvDUeCdGCA3xV/LB2ndXcQ1LrfDUJMxUcHJ
	 jQVQtaXRRiWdA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 509EC17E1004;
	Tue,  3 Mar 2026 20:24:52 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 03 Mar 2026 21:24:20 +0200
Subject: [PATCH v8 4/4] drm/rockchip: vop2: Support setting custom
 background color
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-rk3588-bgcolor-v8-4-fee377037ad1@collabora.com>
References: <20260303-rk3588-bgcolor-v8-0-fee377037ad1@collabora.com>
In-Reply-To: <20260303-rk3588-bgcolor-v8-0-fee377037ad1@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_112455_202978_52E63F07 
X-CRM114-Status: GOOD (  15.09  )
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

The Rockchip VOP2 display controller allows configuring the background
color of each video output port.

Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
which defaults to solid black, make use of it when programming the
hardware.

Note the maximum precision allowed by the display controller is 10bpc,
while the alpha component is not supported, hence ignored.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Reviewed-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index a195f5c819a2..843c7ef979b2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1080,6 +1080,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if ((cstate->background_color << 16) &&
+	    (fb->format->has_alpha || pstate->alpha != 0xffff)) {
+		drm_dbg_kms(vop2->drm,
+			    "Alpha-blending with background color is unsupported\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1552,6 +1559,7 @@ static void vop2_post_config(struct drm_crtc *crtc)
 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
 	struct vop2 *vop2 = vp->vop2;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	u64 bgcolor = crtc->state->background_color;
 	u16 vtotal = mode->crtc_vtotal;
 	u16 hdisplay = mode->crtc_hdisplay;
 	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
@@ -1597,7 +1605,15 @@ static void vop2_post_config(struct drm_crtc *crtc)
 		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1, val);
 	}
 
-	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
+	/*
+	 * Background color is programmed with 10 bits of precision.
+	 * Since performance is more important than accuracy here,
+	 * make use of the DRM_ARGB64_GET*_BPCS() helpers.
+	 */
+	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR_BPCS(bgcolor, 10));
+	FIELD_MODIFY(RK3568_VP_DSP_BG__DSP_BG_GREEN, &val, DRM_ARGB64_GETG_BPCS(bgcolor, 10));
+	FIELD_MODIFY(RK3568_VP_DSP_BG__DSP_BG_BLUE, &val, DRM_ARGB64_GETB_BPCS(bgcolor, 10));
+	vop2_vp_write(vp, RK3568_VP_DSP_BG, val);
 }
 
 static int us_to_vertical_line(struct drm_display_mode *mode, int us)
@@ -1983,6 +1999,10 @@ static int vop2_crtc_state_dump(struct drm_crtc *crtc, struct seq_file *s)
 		   drm_get_bus_format_name(vcstate->bus_format));
 	seq_printf(s, "\toutput_mode[%x]", vcstate->output_mode);
 	seq_printf(s, " color_space[%d]\n", vcstate->color_space);
+	seq_printf(s, "\tbackground color (10bpc): r=0x%x g=0x%x b=0x%x\n",
+		   DRM_ARGB64_GETR_BPCS(cstate->background_color, 10),
+		   DRM_ARGB64_GETG_BPCS(cstate->background_color, 10),
+		   DRM_ARGB64_GETB_BPCS(cstate->background_color, 10));
 	seq_printf(s, "    Display mode: %dx%d%s%d\n",
 		   mode->hdisplay, mode->vdisplay, interlaced ? "i" : "p",
 		   drm_mode_vrefresh(mode));
@@ -2471,6 +2491,8 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 			return dev_err_probe(drm->dev, ret,
 					     "crtc init for video_port%d failed\n", i);
 
+		drm_crtc_attach_background_color_property(&vp->crtc);
+
 		drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
 		if (vop2->lut_regs) {
 			const struct vop2_video_port_data *vp_data = &vop2_data->vp[vp->id];
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 9124191899ba..37722652844a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -658,6 +658,10 @@ enum dst_factor_mode {
 #define RK3588_VP_CLK_CTRL__DCLK_OUT_DIV		GENMASK(3, 2)
 #define RK3588_VP_CLK_CTRL__DCLK_CORE_DIV		GENMASK(1, 0)
 
+#define RK3568_VP_DSP_BG__DSP_BG_RED			GENMASK(29, 20)
+#define RK3568_VP_DSP_BG__DSP_BG_GREEN			GENMASK(19, 10)
+#define RK3568_VP_DSP_BG__DSP_BG_BLUE			GENMASK(9, 0)
+
 #define RK3568_VP_POST_SCL_CTRL__VSCALEDOWN		BIT(1)
 #define RK3568_VP_POST_SCL_CTRL__HSCALEDOWN		BIT(0)
 

-- 
2.52.0


