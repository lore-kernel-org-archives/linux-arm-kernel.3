Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE7EE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5l8pMuz3x3zHYJO1oeQk2SVo0jFiow8oEY+PQJYtaL4=; b=USfICJ1APUsa/GyUT8/YEgnmBD
	tZDwlT8M/pfZJvrMAI1NOaFTtQZX8HesVtsWGw5L7yeSLyLIedGcScDxBooozqmWGqIK0uo+xigoZ
	KlXIdNNgoP2v5clbr2iWQIdKTGo9XWGvGrQJbNCG3TTn0BcYAdIM3mYns9IDXq01hx16OGbvBvI2i
	EulWrkkOoiYHYFg4SAKj5Q2eO1E0s1T9+TvuN5qvFBy9e1GgVYWdCO7CMAQkD4yxsA2+90AND7Ybb
	HFwT4LfuWWRfBZ2TwQuMFnbBwimgc4sEkOqd6mUaWfaxWQGJG5G+ea5l0mfbyISKk4cqLop5RizGz
	/dmoRq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7qa-0000000E4iX-089P;
	Fri, 10 Jan 2025 05:46:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7kT-0000000E3H9-2Gh0;
	Fri, 10 Jan 2025 05:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86E435C5D89;
	Fri, 10 Jan 2025 05:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD879C4CEE8;
	Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736487595;
	bh=CP9UbudAqwoBvCWySj8azYf9NNwJceXOZUXEJzaPRD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=id1I4Q2CyehVxdl+J5Kf691m43AgsAeAmgLCFFGpRkDwRbm8TbQxxOAequPlwitWv
	 7GKylUO5jRblb5WaWdw1MYOY4cXEJFmV5ONt/7cVKtU5hK8usuxCP8ZrSwVd3je0Ub
	 OzCyjuv83JSC0ag3zDScS/iYo1BIkChJkA3g0sr/ai+5phF/UZAB3S+eNekPYDtSBb
	 /VMobkVt5Hgkxz5fBO1yBW9duF9nLr6AUGrDVjiPFnPS9mVgr68VxuxaXUcjVCrPEH
	 E2UmzwiotiAbJL2AmUyjWyHC99Y9FpeHg3OrBkrOu1qjxdgCRs386/5sYSjCK5ONyu
	 OD7v7kmx0z5Vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54DBE7719C;
	Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:39:54 +0800
Subject: [PATCH 04/11] drm: meson: add primary and overlay plane support
 for S4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-4-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=11576;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=4U1UBMlyjt5Zc6sAX/P7YN/CLGBHy2Chyz1U7fL/wAw=;
 b=KfM82SwD5kqsto6e4i+22SDcOHT4uufvChBuyIrcem90+gp3VyFgl4516CcugzEfx4VNoMC9Z
 J5aZ9P2h/heBbry2eb5t0V+YNjSMsfDsE6JRTUH91fbxxDc+R7nYKP/
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_213957_712981_92313E31 
X-CRM114-Status: GOOD (  15.74  )
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
Reply-To: ao.xu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ao Xu <ao.xu@amlogic.com>

Update plane register configurations in the Meson DRM driver
to support the Amlogic S4 SoC. These adjustments ensure proper
handling of display planes with S4-specific hardware requirements.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 drivers/gpu/drm/meson/meson_crtc.c      | 90 +++++++++++++++++++++++----------
 drivers/gpu/drm/meson/meson_overlay.c   |  7 ++-
 drivers/gpu/drm/meson/meson_plane.c     | 24 ++++++---
 drivers/gpu/drm/meson/meson_registers.h | 16 ++++++
 4 files changed, 102 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index d70616da8ce2fd974b57af6aadca5c98fbb88fce..64c7450b7f688d8997e8ad23947bff3ec6484aff 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -28,6 +28,7 @@
 #include "meson_osd_afbcd.h"
 
 #define MESON_G12A_VIU_OFFSET	0x5ec0
+#define MESON_S4_VIU_OFFSET	0xb6c0
 
 /* CRTC definition */
 
@@ -479,21 +480,60 @@ void meson_crtc_irq(struct meson_drm *priv)
 		writel_relaxed(priv->viu.vd1_if0_gen_reg,
 				priv->io_base + meson_crtc->viu_offset +
 				_REG(VD2_IF0_GEN_REG));
-		writel_relaxed(priv->viu.vd1_if0_gen_reg2,
-				priv->io_base + meson_crtc->viu_offset +
-				_REG(VD1_IF0_GEN_REG2));
-		writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
-				priv->io_base + meson_crtc->viu_offset +
-				_REG(VIU_VD1_FMT_CTRL));
-		writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
-				priv->io_base + meson_crtc->viu_offset +
-				_REG(VIU_VD2_FMT_CTRL));
-		writel_relaxed(priv->viu.viu_vd1_fmt_w,
-				priv->io_base + meson_crtc->viu_offset +
-				_REG(VIU_VD1_FMT_W));
-		writel_relaxed(priv->viu.viu_vd1_fmt_w,
-				priv->io_base + meson_crtc->viu_offset +
-				_REG(VIU_VD2_FMT_W));
+
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+			writel_relaxed(priv->viu.vd1_if0_gen_reg2,
+					priv->io_base +
+					_REG(VD1_IF0_GEN_REG2_S4));
+			writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
+					priv->io_base +
+					_REG(VIU_VD1_FMT_CTRL_S4));
+			writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
+					priv->io_base +
+					_REG(VIU_VD2_FMT_CTRL_S4));
+			writel_relaxed(priv->viu.viu_vd1_fmt_w,
+					priv->io_base +
+					_REG(VIU_VD1_FMT_W_S4));
+			writel_relaxed(priv->viu.viu_vd1_fmt_w,
+					priv->io_base +
+					_REG(VIU_VD2_FMT_W_S4));
+
+			writel_relaxed(priv->viu.vd1_range_map_y,
+					priv->io_base +
+					_REG(VD1_IF0_RANGE_MAP_Y_S4));
+			writel_relaxed(priv->viu.vd1_range_map_cb,
+					priv->io_base +
+					_REG(VD1_IF0_RANGE_MAP_CB_S4));
+			writel_relaxed(priv->viu.vd1_range_map_cr,
+					priv->io_base +
+					_REG(VD1_IF0_RANGE_MAP_CR_S4));
+		} else {
+			writel_relaxed(priv->viu.vd1_if0_gen_reg2,
+					priv->io_base + meson_crtc->viu_offset +
+					_REG(VD1_IF0_GEN_REG2));
+			writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
+					priv->io_base + meson_crtc->viu_offset +
+					_REG(VIU_VD1_FMT_CTRL));
+			writel_relaxed(priv->viu.viu_vd1_fmt_ctrl,
+					priv->io_base + meson_crtc->viu_offset +
+					_REG(VIU_VD2_FMT_CTRL));
+			writel_relaxed(priv->viu.viu_vd1_fmt_w,
+					priv->io_base + meson_crtc->viu_offset +
+					_REG(VIU_VD1_FMT_W));
+			writel_relaxed(priv->viu.viu_vd1_fmt_w,
+					priv->io_base + meson_crtc->viu_offset +
+					_REG(VIU_VD2_FMT_W));
+
+			writel_relaxed(priv->viu.vd1_range_map_y,
+					priv->io_base + meson_crtc->viu_offset +
+					_REG(VD1_IF0_RANGE_MAP_Y));
+			writel_relaxed(priv->viu.vd1_range_map_cb,
+					priv->io_base + meson_crtc->viu_offset +
+					_REG(VD1_IF0_RANGE_MAP_CB));
+			writel_relaxed(priv->viu.vd1_range_map_cr,
+					priv->io_base + meson_crtc->viu_offset +
+					_REG(VD1_IF0_RANGE_MAP_CR));
+		}
 		writel_relaxed(priv->viu.vd1_if0_canvas0,
 				priv->io_base + meson_crtc->viu_offset +
 				_REG(VD1_IF0_CANVAS0));
@@ -592,15 +632,7 @@ void meson_crtc_irq(struct meson_drm *priv)
 				_REG(VD2_IF0_LUMA_PSEL));
 		writel_relaxed(0, priv->io_base + meson_crtc->viu_offset +
 				_REG(VD2_IF0_CHROMA_PSEL));
-		writel_relaxed(priv->viu.vd1_range_map_y,
-				priv->io_base + meson_crtc->viu_offset +
-				_REG(VD1_IF0_RANGE_MAP_Y));
-		writel_relaxed(priv->viu.vd1_range_map_cb,
-				priv->io_base + meson_crtc->viu_offset +
-				_REG(VD1_IF0_RANGE_MAP_CB));
-		writel_relaxed(priv->viu.vd1_range_map_cr,
-				priv->io_base + meson_crtc->viu_offset +
-				_REG(VD1_IF0_RANGE_MAP_CR));
+
 		writel_relaxed(VPP_VSC_BANK_LENGTH(4) |
 			       VPP_HSC_BANK_LENGTH(4) |
 			       VPP_SC_VD_EN_ENABLE |
@@ -692,10 +724,16 @@ int meson_crtc_create(struct meson_drm *priv)
 		return ret;
 	}
 
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
 		meson_crtc->enable_osd1 = meson_g12a_crtc_enable_osd1;
 		meson_crtc->enable_vd1 = meson_g12a_crtc_enable_vd1;
-		meson_crtc->viu_offset = MESON_G12A_VIU_OFFSET;
+
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
+			meson_crtc->viu_offset = MESON_S4_VIU_OFFSET;
+		else
+			meson_crtc->viu_offset = MESON_G12A_VIU_OFFSET;
+
 		meson_crtc->enable_osd1_afbc =
 					meson_crtc_g12a_enable_osd1_afbc;
 		meson_crtc->disable_osd1_afbc =
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 7f98de38842bf932ca3388707ec3e2f2c38d97e3..3cf2efa407849d6af9b010a5ad53e611155b6c9f 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -733,7 +733,12 @@ static void meson_overlay_atomic_disable(struct drm_plane *plane,
 	priv->viu.vd1_enabled = false;
 
 	/* Disable VD1 */
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
+		writel_relaxed(0, priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
+		writel_relaxed(0, priv->io_base + _REG(VD2_BLEND_SRC_CTRL));
+		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_GEN_REG + 0x2db0));
+		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_GEN_REG + 0x2db0));
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		writel_relaxed(0, priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
 		writel_relaxed(0, priv->io_base + _REG(VD2_BLEND_SRC_CTRL));
 		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_GEN_REG + 0x17b0));
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b43ac61201f3123e58effa9c4b734c23cfd3d5df..79cfa42af00f34f23993ab4b7af8b7bdfb23abce 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -161,7 +161,8 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 
 	/* Check if AFBC decoder is required for this buffer */
 	if ((meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
-	     meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) &&
+	     meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) ||
+	     meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) &&
 	    fb->modifier & DRM_FORMAT_MOD_ARM_AFBC(MESON_MOD_AFBC_VALID_BITS))
 		priv->viu.osd1_afbcd = true;
 	else
@@ -181,7 +182,8 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	priv->viu.osd1_blk0_cfg[0] = canvas_id_osd1 << OSD_CANVAS_SEL;
 
 	if (priv->viu.osd1_afbcd) {
-		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) ||
+		    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
 			/* This is the internal decoding memory address */
 			priv->viu.osd1_blk1_cfg4 = MESON_G12A_AFBCD_OUT_ADDR;
 			priv->viu.osd1_blk0_cfg[0] |= OSD_ENDIANNESS_BE;
@@ -205,7 +207,8 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		priv->viu.osd1_blk0_cfg[0] |= OSD_OUTPUT_COLOR_RGB;
 
 	if (priv->viu.osd1_afbcd &&
-	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+	    (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) ||
+	     meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))) {
 		priv->viu.osd1_blk0_cfg[0] |= OSD_MALI_SRC_EN |
 			priv->afbcd.ops->fmt_to_blk_mode(fb->modifier,
 							  fb->format->format);
@@ -357,7 +360,8 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	priv->viu.osd1_blk0_cfg[3] = ((dest.x2 - 1) << 16) | dest.x1;
 	priv->viu.osd1_blk0_cfg[4] = ((dest.y2 - 1) << 16) | dest.y1;
 
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
 		priv->viu.osd_blend_din0_scope_h = ((dest.x2 - 1) << 16) | dest.x1;
 		priv->viu.osd_blend_din0_scope_v = ((dest.y2 - 1) << 16) | dest.y1;
 		priv->viu.osb_blend0_size = dst_h << 16 | dst_w;
@@ -377,7 +381,8 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		priv->afbcd.format = fb->format->format;
 
 		/* Calculate decoder write stride */
-		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) ||
+		    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
 			priv->viu.osd1_blk2_cfg4 =
 				meson_g12a_afbcd_line_stride(priv);
 	}
@@ -408,7 +413,8 @@ static void meson_plane_atomic_disable(struct drm_plane *plane,
 	}
 
 	/* Disable OSD1 */
-	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) ||
+	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
 		writel_bits_relaxed(VIU_OSD1_POSTBLD_SRC_OSD1, 0,
 				    priv->io_base + _REG(OSD1_BLEND_SRC_CTRL));
 	else
@@ -439,7 +445,8 @@ static bool meson_plane_format_mod_supported(struct drm_plane *plane,
 		return true;
 
 	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) &&
-	    !meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+	    !meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) &&
+	    !meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
 		return false;
 
 	if (modifier & ~DRM_FORMAT_MOD_ARM_AFBC(MESON_MOD_AFBC_VALID_BITS))
@@ -546,7 +553,8 @@ int meson_plane_create(struct meson_drm *priv)
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM))
 		format_modifiers = format_modifiers_afbc_gxm;
-	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A) ||
+		 meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
 		format_modifiers = format_modifiers_afbc_g12a;
 
 	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 3d73d00a1f4c64cb90d2ab78f74133311d028197..c62ee8bac272be035e92dbc8e743b2d4f864bc55 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -328,6 +328,22 @@
 #define VIU_VD2_FMT_CTRL 0x1a88
 #define VIU_VD2_FMT_W 0x1a89
 
+#define VD1_IF0_RANGE_MAP_Y_S4 0x4816
+#define VD1_IF0_RANGE_MAP_CB_S4 0x4817
+#define VD1_IF0_RANGE_MAP_CR_S4 0x4818
+#define VD1_IF0_GEN_REG2_S4 0x4819
+#define VD1_IF0_GEN_REG3_S4 0x481c
+#define VIU_VD1_FMT_CTRL_S4 0x481d
+#define VIU_VD1_FMT_W_S4 0x481e
+
+#define VD2_IF0_RANGE_MAP_Y_S4 0x4896
+#define VD2_IF0_RANGE_MAP_CB_S4 0x4897
+#define VD2_IF0_RANGE_MAP_CR_S4  0x4898
+#define VD2_IF0_GEN_REG2_S4 0x4899
+#define VD2_IF0_GEN_REG3_S4 0x489c
+#define VIU_VD2_FMT_CTRL_S4 0x489d
+#define VIU_VD2_FMT_W_S4    0x489e
+
 /* VIU Matrix Registers */
 #define VIU_OSD1_MATRIX_CTRL 0x1a90
 #define VIU_OSD1_MATRIX_COEF00_01 0x1a91

-- 
2.43.0



