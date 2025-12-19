Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69533E668A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UIUMfDVW5v/K8bKKCcyJjFBV4QbZaMkdN6Nh3F2NeE=; b=do57VKLA0okRNn4q3dHgx8U3cc
	ILsfHaklANCapETYk/Vwa58wRpbHoWUHsM9TX1CtzMAuwEBfsYNC3toxGSpOv2eBiGyf1AkKr6nmN
	nzwzZZ6eKTEDdwn2Qg2k/DHd9ljzGcjWEmG0Y2Hf8/goAI674bkamPQucxRM+UjDqMXLKnuW5V7jD
	0ZQrHTo+7F2y0/LXRtcgQpyPyNQ/NA+dIolyGna16swQtgJnMWeOEw5YVbUQAokra+GSDRYQSFSfo
	8aMln6iwIqFLz7gsfpzoy/bduRS7rtnrxh5K1mOPXPkZ9Tkq/BpKeRMgmhoLse3Oi3bCVJvmU6pAf
	rdwM6Ymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWiK5-0000000B1Ej-1Kua;
	Fri, 19 Dec 2025 21:47:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWiJx-0000000B18T-0hB4;
	Fri, 19 Dec 2025 21:47:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766180850;
	bh=ELPlvd/HHteO5jAPXsFgQeDK91aLwt10AAxIyPMcifU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TX/yByPi/0JqZAjMlvupgrOqNNr67Ed/ug+dJwoHp0EqrX3aemI9d5q5qbpSWjq1P
	 RUu+WnB0A/KqsIDSkbxCXWTgvlX/3CpTqawCnsuBfG3OrOOwERIyv6THWSvDJweyfq
	 4T9LUTyC0o3sJ0GhoXp+Efa1yBpyI4QSujE2rwSV7Gs0B9lCVYBDdRHbny0WEO5Klu
	 4P6ta+L9m1BwxG0/I3RpPCgT97O9XLDked75oqQESZ0+UhIdPmirteQ7rpzomdNvoN
	 SmVmC+QzX5PEeW2idbV9/shLs7WoRBljiL3P8F/9xjXlgk56+yY4x5R/JSRN1m4A3j
	 DqIXTuNWINEkQ==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8233C17E1404;
	Fri, 19 Dec 2025 22:47:30 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 19 Dec 2025 23:47:00 +0200
Subject: [PATCH v4 3/4] drm/vkms: Support setting custom background color
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-rk3588-bgcolor-v4-3-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
In-Reply-To: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_134733_356848_5F826B44 
X-CRM114-Status: GOOD (  12.77  )
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

Make use of the BACKGROUND_COLOR CRTC property when filling the
background during blending.  It already defaults to solid black.

Since the internal representation of the pixel color in VKMS relies on
16 bits of precision, use the newly introduced DRM_ARGB64_GET{R|G|B}()
helpers to access the individual components of the background color
property, which is compliant with DRM_FORMAT_ARGB16161616.

It's worth noting the alpha component is ignored, hence non-opaque
background colors are not supported.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 10 ++++++++--
 drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 3cf3f26e0d8e..03dd1815dab8 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -474,8 +474,14 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
-
-	const struct pixel_argb_u16 background_color = { .a = 0xffff };
+	u64 bgcolor = crtc_state->base.background_color;
+
+	const struct pixel_argb_u16 background_color = {
+		.a = 0xffff,
+		.r = DRM_ARGB64_GETR(bgcolor),
+		.g = DRM_ARGB64_GETG(bgcolor),
+		.b = DRM_ARGB64_GETB(bgcolor),
+	};
 
 	int crtc_y_limit = crtc_state->base.mode.vdisplay;
 	int crtc_x_limit = crtc_state->base.mode.hdisplay;
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 9a7db1d51022..2514c367f710 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -228,6 +229,8 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 
 	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
 
+	drm_crtc_attach_background_color_property(crtc);
+
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
 

-- 
2.51.2


