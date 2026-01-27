Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB95CA6CB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7TTJa62NVVzex0ilqED1iJGNFd2cAE2LqimJUiQmfQ=; b=kaoLpSTf2Ekqws9nIOWQTDVUtQ
	zcrqEau6mpRUJvoe4dYCcbJ1N6SN3bv7KxXezXV2sN7mcd1X78Ml71bXWRBrm9jIcaHrCv8I7NpI4
	grTs9/801/78/hAcAE0cX/4InodG2H0uUgBPNOtr3+hqd0fQrIT78vvtjhCvoTZdKfXIHHMZCCCwc
	zDuwX2Fqj5i89sse2Xde7A56TwwkuWt3shzD5Khmq00pmVVRVxvWpXfTF6SWst9MSHde9weD2wae2
	rOLElHilDf5mG96AsZJoY888osv9cP4PxVaNgsd/PxG5D9+5OV5lMebqv4qK6rpu765c5AMeCXFmU
	G1IRlp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkehv-0000000DrI3-16bK;
	Tue, 27 Jan 2026 08:45:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkehn-0000000Dr9o-255S;
	Tue, 27 Jan 2026 08:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769503544;
	bh=2eo5D3uRjMhL9EZScUKX1REqlAr7ttM5SVDwsAucTlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oCq8Xes+HYeOsTibDVztG+3E46WWIhe2VDyAA3MHzlp0Q7JiCXIznPi1oEy8QXKrv
	 Aiqgq+QcqBefsUmuzd8YNv6b4N2WgHLVjdvSYeig1pvbivN4aDxxDVEozCuRA1Zk1o
	 cjb6u8UJP6XN9DZSkPv4rOh1m4NVBav66P1dAIGKX12B5StXxSbNIWQcGk1wlLn6k5
	 rY5TyS0lk2Q1zERPoNDPkjMlmUUTebBiz7Daw6mgzxQFLx0D0nXMMUqbuJROOF9M4Z
	 9jj1YSKB5Qvlt3q5x2NSh05azWhatII3+0wZ+F+RTMKX6/50l3X0VwvCQuwtl4V9nu
	 LOAITF9RUKDCQ==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38CC717E1418;
	Tue, 27 Jan 2026 09:45:44 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 Jan 2026 10:45:34 +0200
Subject: [PATCH v5 2/4] drm: Add CRTC background color property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-rk3588-bgcolor-v5-2-b25aa8613211@collabora.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
In-Reply-To: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
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
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Matt Roper <matthew.d.roper@intel.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_004547_888878_6280BFDB 
X-CRM114-Status: GOOD (  28.42  )
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

Some display controllers can be hardware programmed to show non-black
colors for pixels that are either not covered by any plane or are
exposed through transparent regions of higher planes.  This feature can
help reduce memory bandwidth usage, e.g. in compositors managing a UI
with a solid background color while using smaller planes to render the
remaining content.

To support this capability, introduce the BACKGROUND_COLOR standard DRM
mode property, which can be attached to a CRTC through the
drm_crtc_attach_background_color_property() helper function.

Additionally, define a 64-bit ARGB format value to be built with the
help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
color components can be extracted with desired precision using the
corresponding DRM_ARGB64_GET*() macros.

Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_atomic.c              |  1 +
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_blend.c               | 39 ++++++++++++++++--
 drivers/gpu/drm/drm_mode_config.c         |  6 +++
 include/drm/drm_blend.h                   |  4 +-
 include/drm/drm_crtc.h                    | 12 ++++++
 include/drm/drm_mode_config.h             |  5 +++
 include/uapi/drm/drm_mode.h               | 67 +++++++++++++++++++++++++++++++
 9 files changed, 134 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 52738b80ddbe..c489c7c26396 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -476,6 +476,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
 	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
 	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
 	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
+	drm_printf(p, "\tbackground_color=%llx\n", state->background_color);
 
 	if (crtc->funcs->atomic_print_state)
 		crtc->funcs->atomic_print_state(p, state);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index cee6d8fc44ad..57668f1c9460 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -75,6 +75,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *crtc_state,
 				     struct drm_crtc *crtc)
 {
 	crtc_state->crtc = crtc;
+	crtc_state->background_color = DRM_ARGB64_PREP(0xffff, 0, 0, 0);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index dc013a22bf26..20f59a9a7ebc 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -454,6 +454,8 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == config->background_color_property) {
+		state->background_color = val;
 	} else if (property == config->prop_out_fence_ptr) {
 		s32 __user *fence_ptr = u64_to_user_ptr(val);
 
@@ -501,6 +503,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->ctm) ? state->ctm->base.id : 0;
 	else if (property == config->gamma_lut_property)
 		*val = (state->gamma_lut) ? state->gamma_lut->base.id : 0;
+	else if (property == config->background_color_property)
+		*val = state->background_color;
 	else if (property == config->prop_out_fence_ptr)
 		*val = 0;
 	else if (property == crtc->scaling_filter_property)
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6852d73c931c..f249af2a11af 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -191,10 +191,6 @@
  *		 plane does not expose the "alpha" property, then this is
  *		 assumed to be 1.0
  *
- * Note that all the property extensions described here apply either to the
- * plane or the CRTC (e.g. for the background color, which currently is not
- * exposed and assumed to be black).
- *
  * SCALING_FILTER:
  *     Indicates scaling filter to be used for plane scaler
  *
@@ -207,6 +203,25 @@
  *
  * Drivers can set up this property for a plane by calling
  * drm_plane_create_scaling_filter_property
+ *
+ * The property extensions described above all apply to the plane.  Drivers
+ * may also expose the following crtc property extension:
+ *
+ * BACKGROUND_COLOR:
+ *	Background color is set up with drm_crtc_attach_background_color_property(),
+ *	and expects a 64-bit ARGB value following DRM_FORMAT_ARGB16161616, as
+ *	generated by the DRM_ARGB64_PREP*() helpers. It controls the color of a
+ *	full-screen layer that exists below all planes. This color will be used
+ *	for pixels not covered by any plane and may also be blended with plane
+ *	contents as allowed by a plane's alpha values.
+ *	The background color defaults to black, and is assumed to be black for
+ *	drivers that do not expose this property. Although background color
+ *	isn't a plane, it is assumed that the color provided here undergoes the
+ *	CRTC degamma/CSC/gamma transformations applied after the planes blending.
+ *	Note that the color value includes an alpha channel, hence non-opaque
+ *	background color values are allowed, but since physically transparent
+ *	monitors do not (yet) exists, the final alpha value may not reach the
+ *	video sink or it may simply ignore it.
  */
 
 /**
@@ -621,3 +636,19 @@ int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
+
+/**
+ * drm_crtc_attach_background_color_property - attach background color property
+ * @crtc: drm crtc
+ *
+ * Attaches the background color property to @crtc.  The property defaults to
+ * solid black and will accept 64-bit ARGB values in the format generated by
+ * DRM_ARGB64_PREP*() helpers.
+ */
+void drm_crtc_attach_background_color_property(struct drm_crtc *crtc)
+{
+	drm_object_attach_property(&crtc->base,
+				   crtc->dev->mode_config.background_color_property,
+				   DRM_ARGB64_PREP(0xffff, 0, 0, 0));
+}
+EXPORT_SYMBOL(drm_crtc_attach_background_color_property);
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index d12db9b0bab8..dba7aa871246 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -380,6 +380,12 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.gamma_lut_size_property = prop;
 
+	prop = drm_property_create_range(dev, 0,
+					 "BACKGROUND_COLOR", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.background_color_property = prop;
+
 	prop = drm_property_create(dev,
 				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
 				   "IN_FORMATS", 0);
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..c7e888767c81 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -31,8 +31,9 @@
 #define DRM_MODE_BLEND_COVERAGE		1
 #define DRM_MODE_BLEND_PIXEL_NONE	2
 
-struct drm_device;
 struct drm_atomic_state;
+struct drm_crtc;
+struct drm_device;
 struct drm_plane;
 
 static inline bool drm_rotation_90_or_270(unsigned int rotation)
@@ -58,4 +59,5 @@ int drm_atomic_normalize_zpos(struct drm_device *dev,
 			      struct drm_atomic_state *state);
 int drm_plane_create_blend_mode_property(struct drm_plane *plane,
 					 unsigned int supported_modes);
+void drm_crtc_attach_background_color_property(struct drm_crtc *crtc);
 #endif
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd6..312fc1e745d2 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -274,6 +274,18 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @background_color:
+	 *
+	 * RGB value representing the CRTC's background color.  The background
+	 * color (aka "canvas color") of a CRTC is the color that will be used
+	 * for pixels not covered by a plane, or covered by transparent pixels
+	 * of a plane.  The value here should be built using DRM_ARGB64_PREP*()
+	 * helpers, while the individual color components can be extracted with
+	 * desired precision via the DRM_ARGB64_GET*() macros.
+	 */
+	u64 background_color;
+
 	/**
 	 * @target_vblank:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 895fb820dba0..14fc41da2ae6 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -832,6 +832,11 @@ struct drm_mode_config {
 	 * gamma LUT as supported by the driver (read-only).
 	 */
 	struct drm_property *gamma_lut_size_property;
+	/**
+	 * @background_color_property: Optional CRTC property to set the
+	 * background color.
+	 */
+	struct drm_property *background_color_property;
 
 	/**
 	 * @suggested_x_property: Optional connector property with a hint for
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index cbbbfc1dfe2b..dd9ef5af982f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -27,6 +27,8 @@
 #ifndef _DRM_MODE_H
 #define _DRM_MODE_H
 
+#include <linux/const.h>
+
 #include "drm.h"
 
 #if defined(__cplusplus)
@@ -1545,6 +1547,71 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/*
+ * Put 16-bit ARGB values into a standard 64-bit representation that can be
+ * used for ioctl parameters, inter-driver communication, etc.
+ *
+ * If the component values being provided contain less than 16 bits of
+ * precision, use a conversion ratio to get a better color approximation.
+ * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
+ * the input and output precision, respectively.
+ */
+#define __DRM_ARGB64_PREP(c, shift)					\
+	(((__u64)(c) & 0xffffU) << (shift))
+
+#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)(				\
+{									\
+	__u16 mask = (1U << (bpc)) - 1;					\
+	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
+						0xffffU, mask);		\
+	__DRM_ARGB64_PREP(conv, shift);					\
+}									\
+)
+
+#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)(		\
+{									\
+	__typeof__(bpc) __bpc = bpc;					\
+	__DRM_ARGB64_PREP_BPC(alpha, 48, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(red,   32, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(green, 16, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(blue,   0, __bpc);			\
+}									\
+)
+
+#define DRM_ARGB64_PREP(alpha, red, green, blue)			\
+	(__DRM_ARGB64_PREP(alpha, 48) |					\
+	 __DRM_ARGB64_PREP(red,   32) |					\
+	 __DRM_ARGB64_PREP(green, 16) |					\
+	 __DRM_ARGB64_PREP(blue,   0))
+
+/*
+ * Extract the specified color component from a standard 64-bit ARGB value.
+ *
+ * If the requested precision is less than 16 bits, make use of a conversion
+ * ratio calculated as (2^bpc - 1) / (2^16 - 1), where bpc and 16 are the
+ * output and input precision, respectively.
+ */
+#define __DRM_ARGB64_GET(c, shift)					\
+	((__u16)(((__u64)(c) >> (shift)) & 0xffffU))
+
+#define __DRM_ARGB64_GET_BPC(c, shift, bpc)(				\
+{									\
+	__u16 comp = __DRM_ARGB64_GET(c, shift);			\
+	__KERNEL_DIV_ROUND_CLOSEST(comp * ((1U << (bpc)) - 1),		\
+				   0xffffU);				\
+}									\
+)
+
+#define DRM_ARGB64_GETA_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 48, bpc)
+#define DRM_ARGB64_GETR_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 32, bpc)
+#define DRM_ARGB64_GETG_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 16, bpc)
+#define DRM_ARGB64_GETB_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 0, bpc)
+
+#define DRM_ARGB64_GETA(c)		__DRM_ARGB64_GET(c, 48)
+#define DRM_ARGB64_GETR(c)		__DRM_ARGB64_GET(c, 32)
+#define DRM_ARGB64_GETG(c)		__DRM_ARGB64_GET(c, 16)
+#define DRM_ARGB64_GETB(c)		__DRM_ARGB64_GET(c, 0)
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.52.0


