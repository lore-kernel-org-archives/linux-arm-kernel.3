Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0DCD46C18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1vdu4HGF+nCl/yGaNDHxk/AMkj1gn9ZGtgP4VE80Ss=; b=UGcd6F78WjtJBMGBZ0FL3EE47A
	UBbFFEvAJgfKpjlqwRG0fG7GjVrMvVRttqDzRWwsuvfFKRm/iCSUhPRKyKH1WBaZz2bPH4pLEaODo
	hiO4T7JR1cksQpTW8mgoGVF7UVb3I397OdTw4ScKkMdWiQHuduR5UF0v0hSWyaD6nrGgNtt/IsOCO
	nc/CTOGNeSZkP9gUWyyogpH9+3dW/UHwd8VocAiHQrWg3MN8mXT1oFnqol99F6Q0DO4XRBDc2L8Qs
	kv/WJEatBeVd06Wh+2FjQpXBtMZbIOcUOku7qpzfkI6xb8LFGSu/yhWKDk5fsExjIOIur+saya+P8
	PQZ58xaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGNu-0000000H185-1y50;
	Thu, 29 Jan 2026 00:59:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGNb-0000000H0sV-1lVu;
	Thu, 29 Jan 2026 00:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769648363;
	bh=/L0lTmhcZkxDMMrnCZSUmTG7CK9mTVDRkVjSQ2g9G1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B1CuSe69IMVPX4/EXUGdK0A0KbLVlApwXEAOHflM9csO3FAyndCARODeKkk/Aoyxv
	 Ok/NBIDWqN1XNoBH5khn1FtoFFxkBNCaSdtG1kcFVafx+eyE86YcbVDUs+0BFZUbuQ
	 r1WtbvUfYqfTKadBd64BV9QxO+sNfnjmMxIpqGHN4mh/emASyPUZlUXNnycBTLO4Tp
	 nikvW0CZZMHDKt6L1WPE5utBppPecNT71sp/HZVwBQQmZVJMoi6yuTyNa4Rqi+esmv
	 Mnk18Y/WgH9+9AUh7KBgQ7EJ9jljWpG1CEHc+6QFML8J87SBQXc3IuhHaQBT9dx3rR
	 zdWPIF5Z/VewA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E4E817E14F2;
	Thu, 29 Jan 2026 01:59:23 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 29 Jan 2026 02:58:53 +0200
Subject: [PATCH v6 3/4] drm/vkms: Support setting custom background color
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260129-rk3588-bgcolor-v6-3-c15f755a4055@collabora.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
In-Reply-To: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
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
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_165927_631501_C4E27C35 
X-CRM114-Status: GOOD (  12.37  )
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

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 10 ++++++++--
 drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index cd85de4ffd03..83d217085ad0 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -475,8 +475,14 @@ static void blend(struct vkms_writeback_job *wb,
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
2.52.0


