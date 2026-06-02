Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCF5CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8xIPFYU6wfDv0UXLz0s+nj/6PQ14Xci+jABKOcPGUI=; b=Qia+lh4Cafc3lrLxuK0otsW3Wj
	DnQNvdidVgjYpSbz5zkFKReK5a41aaQuDMzmTUHI0T02Nby76654VS25L7bvAv4amxUFn4Cy4TZSA
	9YlvqoD1h/XH2vlXR/KDA3Wki+i4Uxug5s1i1NYwJnBQLvXKrWVtWNTszreSU0YPqPy1dNtGnpM4y
	iMZ0y/2rzBE2EbUiIHQ/rR345tSP9hUZdjfuMJeCvVENXEACh405r6LoK6nhQC2sKLI/wleXWQ1Mn
	B9pUDrgnApKiHHb27d8F6bdzTYXehJI08KT8TDaF51HIiFNh//POFGu4vsY7p8zs0vlc2zAKmGYAN
	qRgoRnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSUX-0000000DWSb-26wS;
	Tue, 02 Jun 2026 17:01:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSUU-0000000DWP4-3FPa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:01:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-46013161068so1236576f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1780419681; x=1781024481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8xIPFYU6wfDv0UXLz0s+nj/6PQ14Xci+jABKOcPGUI=;
        b=Q3JIbKkO17M117jHOXlJxqwdG0z9XiH/PNuD4l4B9jTyzJR1Uniozq+0Je7GdUf+M4
         U9dDIrUAbZSXqC3NJRPBq+BKpywND6T0B4MzsDOC2HaP9uYe+e8WZpx8Zlhptzw9t6IS
         HSO4vuuc7f7HByAeUPh4CxQRWpGMHZ838OeGLdzEduH4WOf8jAPJJdzVqG7cQ5yofc2e
         N9tmhbP72UH+S55lLs73GZvPNeONmAjbSqj700gkQzc2CdkdKf6tucKruTXLnbcd/6OJ
         ZycbLfEeo+Nk63tIFmHaIGYZRTagj54BM9HQR0TxjaRs9/cQjoDlnJ35vloDOGhGC4WG
         2Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419681; x=1781024481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8xIPFYU6wfDv0UXLz0s+nj/6PQ14Xci+jABKOcPGUI=;
        b=J2enD6VUQSWsFttS1o08voSsUg6trDG6HjUkTKA/e59lV3Kyv7DCZhfcLdWGl1Om9h
         PuwpkUeyflea18A5MHD4J7+2fdV3TkO6564vq57fbC/pm8GhjseSV1y1hH3oTmKG0tzY
         cgveP+aPUT0O+1XoCv7G0bOjoBJ9Wjc6+ygSI/F1y12gbB57SKjOFk80PaqplWoe+VGT
         r8rDHkvqKEvUZx0YsessGBButcv4nBs00yuvDi9gsJe5gZawa/QUoggDJ4QSpuFjZonJ
         ol8sbsPRvvKWRS53Gby+uBLIOT2yCf03TKK01vr/WofHgIvwZxPlfi5tK42HPht5z54V
         UbfA==
X-Forwarded-Encrypted: i=1; AFNElJ/YtLFs0PJu63NKW6gladzZF/DUGCZruukNvAq4Y5nhqyiXAGvBt0WiBBQkThs312IU2L/oyjfJiH266qxUP1RC@lists.infradead.org
X-Gm-Message-State: AOJu0YyGDziCrTvHFr3RAUZrFe5/DQf/uzYJDg9MuHD7zOiu/xbxcL2j
	IsbhFBXGNSmHNwcKB3jRVQfVvKu+UuSFbt/F2ccwJdODl+/7t+yjTV/RNLYK2V1ISII=
X-Gm-Gg: Acq92OGZH/sfVqsVaMlylMw7WiheBEoRSW+iLiiz0Tnpot8v+nXvyf1DIHsq+VGp/Pv
	trdTvTI0tetpF/pTVY4pf64UPNcYbinw2qvl0crCV9/OwxmDdNN0Ol/e7o891g28+Nnmio+pqkP
	yD02398wrTrQ/lVgkf060X5t29omC78EAvGDVt+OCnHbajKi4QTqbeBhWxvEHJww6crV3e9LUTZ
	YcBA9X0fnh6LDmHP8Q3vZuhZpmZQTCUoD92jAkOBpmvFMUSegkpxXzr/10MVhcQ8RP8DBSJFlcB
	VSd/x8qtlzoXeAFuPSsRWQViLDk+youHo1p9Qeg0ZEextxIkVS6UIrdn/vz9vzmY16J5no5mESV
	fMaYKe2GuFspzOeXDCcS9XiMcwESrrQslo6Ew1ckFonsanDtJ5RC/EBxKEuJmDy9F21HI8ja1ej
	kLlAZoRX0oPjSNeUWqHxybHaDYra1knDg0u9P3f2r0XLgESQDnfBE=
X-Received: by 2002:a5d:5c8a:0:b0:43c:ffee:ee94 with SMTP id ffacd0b85a97d-4601f4e5644mr315246f8f.11.1780419680809;
        Tue, 02 Jun 2026 10:01:20 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm588495f8f.8.2026.06.02.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 10:01:20 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 02 Jun 2026 21:00:39 +0400
Subject: [PATCH 1/2] drm/rockchip: vop2: honor TV margins from CRTC state
 for overscan compensation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-hdmi-overscan-v1-1-31f71b817c80@flipper.net>
References: <20260602-hdmi-overscan-v1-0-31f71b817c80@flipper.net>
In-Reply-To: <20260602-hdmi-overscan-v1-0-31f71b817c80@flipper.net>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3039; i=alchark@flipper.net;
 h=from:subject:message-id; bh=4HOiDswIVjSXnFgQ5UeLjf28Vzb7ocv1OaHcngkgLQk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTJ84TmGZ3sfxZTdFhC7ewCsdiPOkFTdsjtlf7RoeLDe
 0E+y0a5YyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKn2L2NkuLLg2GlFg+nnnxamX6+ptZyqFFHX61jNr374x5utgZ+ebmRkeHnt+5m
 ZsUsOltdqF03wbsuumrZ1tdMVnUXPZkqtTDi0mwMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_100122_839566_8DF90D32 
X-CRM114-Status: GOOD (  12.60  )
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

Replace the hard-coded percent values with pixel margins carried in struct
rockchip_crtc_state, sourced from the standard DRM "left/right/top/bottom
margin" connector properties (struct drm_connector_tv_margins) to pave way
for HDMI overscan compensation support.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h  |  2 ++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 17 +++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 2e86ad00979c..83f8ec4f3319 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -10,6 +10,7 @@
 #define _ROCKCHIP_DRM_DRV_H
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_gem.h>
 
 #include <linux/bits.h>
@@ -53,6 +54,7 @@ struct rockchip_crtc_state {
 	u32 bus_format;
 	u32 bus_flags;
 	int color_space;
+	struct drm_connector_tv_margins tv_margins;
 };
 #define to_rockchip_crtc_state(s) \
 		container_of(s, struct rockchip_crtc_state, base)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index a160077a507f..55307b8493ae 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1558,30 +1558,35 @@ static void vop2_post_config(struct drm_crtc *crtc)
 {
 	struct vop2_video_port *vp = to_vop2_video_port(crtc);
 	struct vop2 *vop2 = vp->vop2;
+	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	const struct drm_connector_tv_margins *m = &vcstate->tv_margins;
 	u64 bgcolor = crtc->state->background_color;
 	u16 vtotal = mode->crtc_vtotal;
 	u16 hdisplay = mode->crtc_hdisplay;
 	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
 	u16 vdisplay = mode->crtc_vdisplay;
 	u16 vact_st = mode->crtc_vtotal - mode->crtc_vsync_start;
-	u32 left_margin = 100, right_margin = 100;
-	u32 top_margin = 100, bottom_margin = 100;
-	u16 hsize = hdisplay * (left_margin + right_margin) / 200;
-	u16 vsize = vdisplay * (top_margin + bottom_margin) / 200;
+	u16 hsize = hdisplay;
+	u16 vsize = vdisplay;
 	u16 hact_end, vact_end;
 	u32 val;
 
 	vop2->ops->setup_bg_dly(vp);
 
+	if (m->left + m->right < hdisplay)
+		hsize = hdisplay - m->left - m->right;
+	if (m->top + m->bottom < vdisplay)
+		vsize = vdisplay - m->top - m->bottom;
+
 	vsize = rounddown(vsize, 2);
 	hsize = rounddown(hsize, 2);
-	hact_st += hdisplay * (100 - left_margin) / 200;
+	hact_st += m->left;
 	hact_end = hact_st + hsize;
 	val = hact_st << 16;
 	val |= hact_end;
 	vop2_vp_write(vp, RK3568_VP_POST_DSP_HACT_INFO, val);
-	vact_st += vdisplay * (100 - top_margin) / 200;
+	vact_st += m->top;
 	vact_end = vact_st + vsize;
 	val = vact_st << 16;
 	val |= vact_end;

-- 
2.52.0


