Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8055ACAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HA2VnjO7vz44kPKOGvFfCLsg20ACBsUu+XDMFL/IemM=; b=upMoDI2Fs6bJ6g8J5NTrsTT7vx
	SFsCJCft6abUUCCRlkBFR3q1j6BcZLZuQb0aSCNl73tC5Y5dVsBOYVviXCPqYJKhfeUE6+krIRl8B
	BK9bo4z3348DQwWuCbr2fP2oxZSe956Zx63UZZQa2DQOWcLCg8eb820yJM5KzwqMl3eMYYJSfBUSw
	hEPclQkNDvspYe2GXpL+MSohpi8y367p7lZyth++U4qkBO8S8u9DtJMt+Gv2O4akcJu4feHg89NF1
	BTBSmfRHIJj+vXJxgQvHe3Ky6DtYSmiyUONaMyp0vFfvWPcBY873L7RGoQz4V1jtS0idzUdYJHksM
	zM8ubw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2lG-0000000FqYz-3wPF;
	Thu, 18 Sep 2025 00:44:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2lB-0000000FqSF-3vta;
	Thu, 18 Sep 2025 00:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758156267;
	bh=CpXYHCgr/H0IADYTINL+KjQ23R45XKJg3/L9eD5C7Ks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nZDDDI/p4Ma5O/Vjq0+8tKeRdR+tTnkzl3fH7c26spnQYo548QH1pjwSx7lbhLSWA
	 gQL9aUERg6HKvM4IZc1NGQfL3jgFgdhNK5giG34ZFwLlDWxfCQdp8Si3pZS1QJ/CbE
	 gHFVUBC40oaSNbEVd9Z1f0lsTnVp0EHNZeuuC5VUrow9QPdiDWexV94SBTJWjkyPSu
	 lSqSDvUOhkr0H7RSgBY33SmoUBSpSEpyXbz0pcl0bn6Yn4yi4X1Hp0OuAiT+L6zQCT
	 hvgdm1xp8VEkb4ctvbDSZjUINB2Rkqjzyt/TTvrXXbTzAjZxAhvOHmwpN1nDe2HpTf
	 oQ7pKbEBVT1qg==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A85517E1067;
	Thu, 18 Sep 2025 02:44:20 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:18 -0400
Subject: [PATCH RFC v2 09/20] drm/colorop: Factor out common paths from
 colorops helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-9-ac4471b44758@collabora.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_174430_205292_0261814A 
X-CRM114-Status: GOOD (  15.02  )
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

Factor out the common code paths from the colorop helpers so they can be
reused by the post-blend colorop helpers.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_colorop.c | 145 ++++++++++++++++++++++++++++--------------
 1 file changed, 99 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 1384a259605fa4945aa74402901886d7e1fde0d1..db137169effa6cd9e6d5805f65bdfd1cc6882075 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -91,8 +91,9 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
 
 /* Init Helpers */
 
-static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-			    struct drm_plane *plane, enum drm_colorop_type type, uint32_t flags)
+static int drm_common_colorop_init(struct drm_device *dev,
+				   struct drm_colorop *colorop,
+				   enum drm_colorop_type type, uint32_t flags)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -105,7 +106,6 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	colorop->base.properties = &colorop->properties;
 	colorop->dev = dev;
 	colorop->type = type;
-	colorop->plane = plane;
 	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
@@ -154,6 +154,20 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	return ret;
 }
 
+static int drm_plane_colorop_init(struct drm_device *dev,
+				  struct drm_colorop *colorop,
+				  struct drm_plane *plane,
+				  enum drm_colorop_type type, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_common_colorop_init(dev, colorop, type, flags);
+
+	colorop->plane = plane;
+
+	return ret;
+}
+
 /**
  * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
  *
@@ -206,31 +220,13 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
  * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
  * @return zero on success, -E value on failure
  */
-int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
-				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags)
+static int drm_common_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+					    u64 supported_tfs, uint32_t flags)
 {
 	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
 	int i, len;
 
 	struct drm_property *prop;
-	int ret;
-
-	if (!supported_tfs) {
-		drm_err(dev,
-			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
-			plane->base.id, plane->name);
-		return -EINVAL;
-	}
-
-	if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
-		drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
-			plane->base.id, plane->name);
-		return -EINVAL;
-	}
-
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE, flags);
-	if (ret)
-		return ret;
 
 	len = 0;
 	for (i = 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
@@ -260,6 +256,41 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
 
 	return 0;
 }
+
+static int drm_colorop_has_supported_tf(struct drm_device *dev, struct drm_mode_object *obj,
+					const char *name, u64 supported_tfs)
+{
+	if (!supported_tfs) {
+		drm_err(dev,
+			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
+			obj->id, name);
+		return -EINVAL;
+	}
+
+	if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
+		drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
+			obj->id, name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_colorop_has_supported_tf(dev, &plane->base, plane->name, supported_tfs);
+	if (ret)
+		return ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE, flags);
+	if (ret)
+		return ret;
+
+	return drm_common_colorop_curve_1d_init(dev, colorop, supported_tfs, flags);
+}
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
 
 static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_colorop *colorop)
@@ -280,29 +311,16 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
 	return 0;
 }
 
-/**
- * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
- *
- * @dev: DRM device
- * @colorop: The drm_colorop object to initialize
- * @plane: The associated drm_plane
- * @lut_size: LUT size supported by driver
- * @lut1d_interpolation: 1D LUT interpolation type
- * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
- * @return zero on success, -E value on failure
- */
-int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-					struct drm_plane *plane, uint32_t lut_size,
-					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
-					uint32_t flags)
+static int
+drm_common_colorop_curve_1d_lut_init(struct drm_device *dev,
+				     struct drm_colorop *colorop,
+				     uint32_t lut_size,
+				     enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+				     uint32_t flags)
 {
 	struct drm_property *prop;
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
-	if (ret)
-		return ret;
-
 	/* initialize 1D LUT only attribute */
 	/* LUT size */
 	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
@@ -334,17 +352,40 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
 
-int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
-				   struct drm_plane *plane, uint32_t flags)
+/**
+ * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @lut_size: LUT size supported by driver
+ * @lut1d_interpolation: 1D LUT interpolation type
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
+ * @return zero on success, -E value on failure
+ */
+int
+drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				    struct drm_plane *plane, uint32_t lut_size,
+				    enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+				    uint32_t flags)
 {
 	int ret;
 
-	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT, flags);
 	if (ret)
 		return ret;
 
+	return drm_common_colorop_curve_1d_lut_init(dev, colorop, lut_size,
+						    lut1d_interpolation, flags);
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
+
+static int drm_common_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+					   uint32_t flags)
+{
+	int ret;
+
 	ret = drm_colorop_create_data_prop(dev, colorop);
 	if (ret)
 		return ret;
@@ -353,6 +394,18 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 
 	return 0;
 }
+
+int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4, flags);
+	if (ret)
+		return ret;
+
+	return drm_common_colorop_ctm_3x4_init(dev, colorop, flags);
+}
 EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
 
 /**

-- 
2.50.1


