Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12E0E6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTP2nlfF4TVr6/Gr417b9vvRxgYthN/xdBwufZt5Fp0=; b=nSkJoZhvY+6VBZRsyHcJyNzClu
	Urw3P0lPQozm2upwGvqzy/NEXWTkaMlIdZe6f3ct9mhq3eiN3gmCbGMyYNZXOmk0jK6uetRtJobb2
	ONk+Ma88eQoMdU0PhsPY/SZ1fPkFtBG5/79s5qubDAID6CnmWOX9Iahz6tk7KI0MNYUCB5gmL6hm1
	3bNw4NiI0CG/pxwUos91e1Hk4+Bgf/Qt35ArzGLChzmePDcmFQ8A43A+tlQgZe+dYdJcmfrJuIagx
	S+LVvGcfJDsaeLSqTysHuLQSHxgnvI5Oprm1bnuX24Biz5KItcSjz4OG761TR3hLFmbVacbxbzUrx
	273oHzBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6j2-0000000FtlO-0oXx;
	Tue, 23 Dec 2025 18:03:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6ir-0000000Ftcr-1Ghr;
	Tue, 23 Dec 2025 18:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766512968; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HpdUob6t1Xl2/3PjfLNrFueMsFxdAE9nbrES2kBedg2MObL6Ute7AuFC29gTH7x3lLw1XFZ3nZHsM92HGPdCuGdaCzHgCNQFjO407A4rHdAVD4Ysqri2WxHfIjPenNKNo/hHasyMeT3y67LEyYoxTSb9plrmTjBidY5sJqEF6Bo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766512968; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TTP2nlfF4TVr6/Gr417b9vvRxgYthN/xdBwufZt5Fp0=; 
	b=EhMMZwlQwQtf3zn7aVQRnDUgz+nScaDlqistZBvGUn+4TTt/PqwZYhqQ0B5vX8utMS5yj6GjYU5HkoTFJrvOMfJ4B4Wh4W4jEQYpx6Z/V3ZPjeK6b06BWhyE3sBJ6Gbj9SRaxxkf0pkFOC6Uzu5pRunXHylPLUy3AEnhSWmD3L4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512968;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=TTP2nlfF4TVr6/Gr417b9vvRxgYthN/xdBwufZt5Fp0=;
	b=ZRLzwvwk9X9Im3smvZA/0yBp4aoRr7GK2T4HzF/Ekc9bbjoWoJ2USjZukXqJ22GP
	ue1vlI9MQYmBFmsqK53/4JIFl8gHSzE2QhybWpaF/VJ9d8M+3Vvw5bBWZWy+/k+iR1e
	sHUkvL4P3HUeN9JZEVlcH1eTPvs8mxPh6dKMlN5c=
Received: by mx.zohomail.com with SMTPS id 1766512966401297.4740004327332;
	Tue, 23 Dec 2025 10:02:46 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:29 -0300
Subject: [PATCH v3 09/21] drm/colorop: Factor out common paths from
 colorops helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-9-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=8035;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=5Qni8H4yUQhtfmB3ydT1m5AL0OONphS8F8GXu44wugo=;
 b=IzIHGHHAg4aiERlzri8xSRIIzbx0Vof/Kv9r5nHjhaH7BfQCsvvmvolnAS7nGYUEbyr4QFDxd
 i7w968a9jKGC6xEv5fp7Ebg63623cB2mijjg+tmAHInvt5Zij5rad00
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_100306_317969_B2936466 
X-CRM114-Status: GOOD (  14.43  )
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Factor out the common code paths from the colorop helpers so they can be
reused by the post-blend colorop helpers.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 146 ++++++++++++++++++++++++++++--------------
 1 file changed, 99 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index bf3b8ff51571b..6a285cdb0a354 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -93,9 +93,9 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
 
 /* Init Helpers */
 
-static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, enum drm_colorop_type type,
-				  uint32_t flags)
+static int drm_common_colorop_init(struct drm_device *dev,
+				   struct drm_colorop *colorop,
+				   enum drm_colorop_type type, uint32_t flags)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property *prop;
@@ -108,7 +108,6 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	colorop->base.properties = &colorop->properties;
 	colorop->dev = dev;
 	colorop->type = type;
-	colorop->plane = plane;
 	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
@@ -157,6 +156,20 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
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
@@ -210,31 +223,13 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
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
@@ -263,6 +258,41 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
 
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
@@ -283,29 +313,16 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
 	return 0;
 }
 
-/**
- * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
- *
- * @dev: DRM device
- * @colorop: The drm_colorop object to initialize
- * @plane: The associated drm_plane
- * @lut_size: LUT size supported by driver
- * @interpolation: 1D LUT interpolation type
- * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
- * @return zero on success, -E value on failure
- */
-int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-					struct drm_plane *plane, uint32_t lut_size,
-					enum drm_colorop_lut1d_interpolation_type interpolation,
-					uint32_t flags)
+static int
+drm_common_colorop_curve_1d_lut_init(struct drm_device *dev,
+				     struct drm_colorop *colorop,
+				     uint32_t lut_size,
+				     enum drm_colorop_lut1d_interpolation_type interpolation,
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
@@ -337,17 +354,40 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 
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
@@ -356,6 +396,18 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 
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
2.51.0


