Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20112C44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e5CmSTYkwSFknR5AGKkjqSMNuhrUCH0vfnwLK+Jw0JU=; b=I6YJFwq1I2rIY9diFx4w0pt0+h
	5mrLjxR7eTx4LSbWL0AB5+CcvHPzPBepfFZHBfWTRVZVSDJXabtd0hjKGVkaKK+mDOiBpzjH+99fN
	GWGHufheZ9cmWrLG8R8iBAtyjobR80QnwG+LdxNQr5edCUF1cw3WaKEYQN/GW5IsfxZDf6rpvzZ+i
	HrHOYlMCUzB2blg8SHay/lXQmpYyi5m7RjuADsJwfwurabzJgTEXd7N/fhcFSLQY9U19wXKNthay3
	Wv6r2BLFIaqXMi6Bo6hJy60X+OUi/BvtA4DqXXiOBdli8G3NKEKbLeH1A6e9Pvhv4CJTVyWpQF/oB
	PHpjODNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKJC-0000000H8Hc-2KnQ;
	Thu, 16 Jul 2026 11:31:18 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKJ9-0000000H8Fa-0eVT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 11:31:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4731f5ffa74so457353f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201473; x=1784806273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5CmSTYkwSFknR5AGKkjqSMNuhrUCH0vfnwLK+Jw0JU=;
        b=Zwm7VJFZmJ8BZrOB4PGceIFeUu1HqvjdtBt7zxwQQ2UKuj5fkeslM7ijiF6f0yoDlm
         CwgG8UK4dyBHx9/ki7w+hzFBz28Zlt6WURPjxN7JkpS+L9arJHE+5dSw+/CfsiRlXnLs
         owvDRJi5D2pmhUZ3kUjIbfrWsR0eyBGCIdx4+ywnegTosL0JdrdnyunzlSRj/XJ29sC/
         yQI2sY1sbmCXwWAbl8vTv4mEEaY81S+0cZbJ0Zkb2LNUqG3usvhWRwsqIBcL4S6awMIO
         ACz8JCD8I85fmaDzqXW8rb7+60egslekAW59B0BrUJsyGqXTOINmhVl29QVGoWL65Xyf
         TZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201473; x=1784806273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5CmSTYkwSFknR5AGKkjqSMNuhrUCH0vfnwLK+Jw0JU=;
        b=tDaTgH1fGMw00Iglc4H0QrH2t0gO+HFsJo3cts0iJCQHSXFAccUUQ/ohc/u88GizYU
         6g5IsL65tevjDQGhcuocfn2OixnemGzfV+hgjvRjghV8qAr2C9OGVD0v82ZQxFZ5juG1
         2UF7LzlaYxKYZhIi0ZweJw9O8PIlte/p06lVw20Pd5pM21Babw66L0GWk6qGXNoGBVMo
         vhGFGULaCNlqEJoiZ1F+LcwHIGpsTlB32dbOBgLMlM30nurApZe3BlvGXD6d/qFtlD50
         ENpHu7DDE/tH4G3paeQX3HpaU21MtlQhoSKQ8LWFU8QxnKylgtQfCp0XVoJ8oX8b0mVp
         XS1A==
X-Forwarded-Encrypted: i=1; AHgh+Rq2f7o+kzYRwnQEzktlE0N7s/rj0DatBQ9YPNIGAVxz1Ak9lGCQrN6CPhmTtu9/HuQjqcQzkCg80ZoXmLrSMP/w@lists.infradead.org
X-Gm-Message-State: AOJu0YxvXghEr4fH01BV5e/bVkDM8nUEJ2Iep1JTd81Z862vnAWtiZtt
	VBfW2XJNvlIf9iRL+VWN8dVr5u33NWQZlq42E8TGXPw74+rB8hPAynvC
X-Gm-Gg: AfdE7clP9hIFQr4OJYDf1sUDqA+3YEStrVFcY9w3YyLB8jrSPREsGTV5e9FPKOsPMoM
	wRd7tUye0gKl2yBLD5sf5g7FwsLHX5HifKqekAjsc736Vbl54fZov2C5gxWxPNH8cYgMmLx+fwL
	GwUVAupRwcFEDzbBj8GHMcCy+37hZJ1lRfFQaUSITddsqHRJzfghPPAL+h6hQQhsa1p+oOEsJIK
	aixX7QotrWTwwj48ng3Jj5OKpfaufmMXkan592De/V9jI9AL//wfLwRThAgPlx/o2UtS1v/7VMK
	/4ct50Hb5dll+/NrRTI6ppCuhl907WBdSYLiGueXf3ky+uKTBLofJ8AD6TpRPeTc9dBKMqqYZfn
	84JF0Cgyca45Rbg3Qy4/8Y/ic+4I22wMAVTScs8vFilRUJ8ye+r7w9G6rGI5D+zUJavVOMAZE3t
	6k+iBbJHl5FWmd816eUXZZAS8aVJJLo4em8vGrG8z1nQKBfgXtZHsvIGByUwD3lk1i6Psedj/WW
	NesSHlv8Fw=
X-Received: by 2002:a05:6000:4285:b0:473:aed9:ef1c with SMTP id ffacd0b85a97d-47f2dce2d29mr13817474f8f.7.1784201472578;
        Thu, 16 Jul 2026 04:31:12 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8DDB00EEA7E4D0825D1D4E.dsl.pool.telekom.hu. [2001:4c4e:1b8d:db00:eea7:e4d0:825d:1d4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e0e4sm25222130f8f.4.2026.07.16.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:31:12 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH] drm/rockchip: vop2: add COLOR_ENCODING and COLOR_RANGE plane properties
Date: Thu, 16 Jul 2026 13:30:24 +0200
Message-ID: <20260716113024.15357-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_043115_216729_BB4E42C0 
X-CRM114-Status: GOOD (  16.22  )
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

The VOP2 windows have a YCbCr to RGB conversion block whose coefficient
matrix is selected by a per-window CSC mode field, with hardware support
for BT.601, BT.709 (both limited range) and BT.2020, plus a BT.601 full
range mode. So far the driver hardcodes this to BT.709 limited range for
every YUV plane, so BT.601 (SD) and BT.2020 content is converted with
the wrong matrix.

Expose the standard COLOR_ENCODING and COLOR_RANGE plane properties and
program the window CSC mode from them, so userspace can request the
matrix matching the framebuffer. The default stays BT.709 limited range,
which matches the previous behaviour. The hardware has no full range
mode for the BT.709 and BT.2020 encodings, so that combination is
rejected in the plane atomic check.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 40 +++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4cce3e3..22e056b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -667,6 +667,22 @@ static int vop2_convert_csc_mode(int csc_mode)
 	}
 }
 
+static int vop2_convert_color_encoding(enum drm_color_encoding color_encoding,
+				       enum drm_color_range color_range)
+{
+	bool full_range = color_range == DRM_COLOR_YCBCR_FULL_RANGE;
+
+	switch (color_encoding) {
+	case DRM_COLOR_YCBCR_BT601:
+		return full_range ? CSC_BT601F : CSC_BT601L;
+	case DRM_COLOR_YCBCR_BT2020:
+		return CSC_BT2020L;
+	case DRM_COLOR_YCBCR_BT709:
+	default:
+		return CSC_BT709L;
+	}
+}
+
 /*
  * colorspace path:
  *      Input        Win csc                     Output
@@ -707,7 +723,6 @@ static void vop2_setup_csc_mode(struct vop2_video_port *vp,
 	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(vp->crtc.state);
 	int is_input_yuv = pstate->fb->format->is_yuv;
 	int is_output_yuv = is_yuv_output(vcstate->bus_format);
-	int input_csc = V4L2_COLORSPACE_DEFAULT;
 	int output_csc = vcstate->color_space;
 	bool r2y_en, y2r_en;
 	int csc_mode;
@@ -715,7 +730,8 @@ static void vop2_setup_csc_mode(struct vop2_video_port *vp,
 	if (is_input_yuv && !is_output_yuv) {
 		y2r_en = true;
 		r2y_en = false;
-		csc_mode = vop2_convert_csc_mode(input_csc);
+		csc_mode = vop2_convert_color_encoding(pstate->color_encoding,
+						       pstate->color_range);
 	} else if (!is_input_yuv && is_output_yuv) {
 		y2r_en = false;
 		r2y_en = true;
@@ -1109,6 +1125,18 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	if (WARN_ON(format < 0))
 		return format;
 
+	/*
+	 * The window CSC hardware has no full range mode for the BT.709 and
+	 * BT.2020 encodings, so reject that combination.
+	 */
+	if (fb->format->is_yuv &&
+	    pstate->color_range == DRM_COLOR_YCBCR_FULL_RANGE &&
+	    pstate->color_encoding != DRM_COLOR_YCBCR_BT601) {
+		drm_dbg_kms(vop2->drm,
+			    "Full range is only supported with BT.601 encoding\n");
+		return -EINVAL;
+	}
+
 	/* Co-ordinates have now been clipped */
 	src_x = src->x1 >> 16;
 	src_w = drm_rect_width(src) >> 16;
@@ -2472,6 +2500,14 @@ static int vop2_plane_init(struct vop2 *vop2, struct vop2_win *win,
 	drm_plane_create_blend_mode_property(&win->base, blend_caps);
 	drm_plane_create_zpos_property(&win->base, win->win_id, 0,
 				       vop2->registered_num_wins - 1);
+	drm_plane_create_color_properties(&win->base,
+					  BIT(DRM_COLOR_YCBCR_BT601) |
+					  BIT(DRM_COLOR_YCBCR_BT709) |
+					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  DRM_COLOR_YCBCR_BT709,
+					  DRM_COLOR_YCBCR_LIMITED_RANGE);
 
 	return 0;
 }
-- 
2.53.0


