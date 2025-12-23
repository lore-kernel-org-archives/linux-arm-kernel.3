Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E511E6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjFBKvqKqJM0baDbHeDEe97KrUvnWCeBaCOr3ku/1w0=; b=4bigJnysoZJfydCTQ7a3sZ9Ol7
	V3KRKLF65V01KCwtAMSJLtayplIgRvEcGtMQWFLtH9v1mkED/+iqM8HCbOEKT4H/YgG0y+VssAJTh
	YWlARi5L+JeLzI0OLmCZgMDSsZ2IOwWy5M9f5pbQfNXkOASRI+R1yu0v50i64w9okeX0Vnt61W0lc
	6nXyuEkzupgfeq2dY3zM51aaq1Y/QiWliliXoConuZhdH0bh9R5ifThFEcmNN937N3KYiWAdZAjqa
	d6X0LGCsHX82U7mFC2nRoNPZUxs6E9VP8AS7S2bbhOTRI7eCE1GvQBvkh7lB4UM0X6y70aa3GDrCQ
	nJv0Tvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6j6-0000000Ftq4-1QJr;
	Tue, 23 Dec 2025 18:03:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6iz-0000000FtiO-2Dn3;
	Tue, 23 Dec 2025 18:03:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766512974; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j65QkHGkCi1yf1rp0cJBQyT9hS83xTAkAimDBp1QSS/x6guhzqQ+T4Qsbb3Ydgf87AVVHnUUxajKyA3Kp1nMOCL6CitPrFvEaTickHhDzZM1HmsaijWZgrL7KQOJV2Z8xl64zq6kDd4kbiCzrVxG3HrtreK1JweaavhQK1PgD1Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766512974; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yjFBKvqKqJM0baDbHeDEe97KrUvnWCeBaCOr3ku/1w0=; 
	b=fsHE46Xfe9adAO8wINX2MtxQLI9dUzOBF4B507e5ElNxx0fKaKkwnmN0WMQshonpI0SK9m8oroC6iIqjWSXx72e4+zHOQRnVZoNqJOViM+Zwqxn+px9QQt2bsmglgJta2xamIeRGeCOzRE1sOB8hYEYYd08ZuG7Xtd5xHkL35MU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512974;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=yjFBKvqKqJM0baDbHeDEe97KrUvnWCeBaCOr3ku/1w0=;
	b=K1S+pPTIctrLP5I7DGOX81hwKzRdzoI6Un1VsoAFB8M1t/RxCO3L/lWbqECRPNsg
	poKM7NAiviNWUJMnpTdIjPhtSPaUxNCoy+ruoNaukaxGgw0nM66A6jOs4agQvK1SUX9
	P6gjNhgDxnAc90jr0lMtgWJEwWEkO4HBL3X3Rzv4=
Received: by mx.zohomail.com with SMTPS id 1766512972595326.53151661966547;
	Tue, 23 Dec 2025 10:02:52 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:30 -0300
Subject: [PATCH v3 10/21] drm/colorop: Introduce colorop helpers for crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-10-7d969f9a37a0@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=5692;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=v0EzVWC7HEgCjd42dLnml/cxbQFKAH2Q9oqX72sE3fA=;
 b=kWReBGXutszJ7qMtObxq1/TFBTxud2uZa8rd5ksSCLzA9UbuQs2UQvbLg8S1VWV6ky6VvK/tI
 P+kPxlBuHMgB6iWgALXCYyLYOxH30Lk6g/eQkDSb2IskJWDT2YCCjFQ
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_100309_617977_E9CC5E4E 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Introduce colorop helper counterparts for post-blend color pipelines
that take a CRTC instead of a plane.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  8 +++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 6a285cdb0a354..4ce93807ea565 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -170,6 +170,20 @@ static int drm_plane_colorop_init(struct drm_device *dev,
 	return ret;
 }
 
+static int drm_crtc_colorop_init(struct drm_device *dev,
+				 struct drm_colorop *colorop,
+				 struct drm_crtc *crtc,
+				 enum drm_colorop_type type, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_common_colorop_init(dev, colorop, type, flags);
+
+	colorop->crtc = crtc;
+
+	return ret;
+}
+
 /**
  * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
  *
@@ -295,6 +309,23 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
 }
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
 
+int drm_crtc_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_crtc *crtc, u64 supported_tfs, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_colorop_has_supported_tf(dev, &crtc->base, crtc->name, supported_tfs);
+	if (ret)
+		return ret;
+
+	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_1D_CURVE, flags);
+	if (ret)
+		return ret;
+
+	return drm_common_colorop_curve_1d_init(dev, colorop, supported_tfs, flags);
+}
+EXPORT_SYMBOL(drm_crtc_colorop_curve_1d_init);
+
 static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_colorop *colorop)
 {
 	struct drm_property *prop;
@@ -383,6 +414,35 @@ drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *
 }
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
 
+/**
+ * drm_crtc_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @crtc: The associated drm_crtc
+ * @lut_size: LUT size supported by driver
+ * @interpolation: 1D LUT interpolation type
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
+ * @return zero on success, -E value on failure
+ */
+int
+drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev,
+				   struct drm_colorop *colorop,
+				   struct drm_crtc *crtc, uint32_t lut_size,
+				   enum drm_colorop_lut1d_interpolation_type interpolation,
+				   uint32_t flags)
+{
+	int ret;
+
+	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_1D_LUT, flags);
+	if (ret)
+		return ret;
+
+	return drm_common_colorop_curve_1d_lut_init(dev, colorop, lut_size,
+						    interpolation, flags);
+}
+EXPORT_SYMBOL(drm_crtc_colorop_curve_1d_lut_init);
+
 static int drm_common_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 					   uint32_t flags)
 {
@@ -410,6 +470,19 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 }
 EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
 
+int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_crtc *crtc, uint32_t flags)
+{
+	int ret;
+
+	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_CTM_3X4, flags);
+	if (ret)
+		return ret;
+
+	return drm_common_colorop_ctm_3x4_init(dev, colorop, flags);
+}
+EXPORT_SYMBOL(drm_crtc_colorop_ctm_3x4_init);
+
 /**
  * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 49d342b7f8b0b..a1f81fa96f66b 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -400,14 +400,22 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 void drm_colorop_pipeline_destroy(struct drm_device *dev);
 void drm_colorop_cleanup(struct drm_colorop *colorop);
 
+int drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				       struct drm_crtc *crtc, uint32_t lut_size,
+				       enum drm_colorop_lut1d_interpolation_type interpolation,
+				       uint32_t flags);
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
+int drm_crtc_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_crtc *crtc, u64 supported_tfs, uint32_t flags);
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 					struct drm_plane *plane, uint32_t lut_size,
 					enum drm_colorop_lut1d_interpolation_type interpolation,
 					uint32_t flags);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane, uint32_t flags);
+int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_crtc *crtc, uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 				struct drm_plane *plane, uint32_t flags);
 int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,

-- 
2.51.0


