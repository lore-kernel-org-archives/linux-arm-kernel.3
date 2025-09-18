Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7633CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTgWa3BlyaIcVWhM/eRd41EMuIQ1t3gbLMzGbDdH4gM=; b=vF7OcqwRh0HejAnkT7kkn2JFT/
	n+JK2VDVFBprQJLrTE4wG7GFKlNoOr210K33ZhaNM1fC0AKkkgIGahKNqriHEADmodJAFwwhIoLA7
	ZzhoouUr64U21MZdFZPVdSPO+LwTi6TON7RwP/zxEchgFmYRlfo8T+W91rBJAN97vWpE6b7GFUZLj
	+wMkIwqIoZI8d1DpnFq3L/sBfRfSUxQloh1wCod3fMPfXwHRhMSsjNGpkWLuPUVNas9ZsahB6FT+t
	jtruWjPezx7LoX3kPyniq/uTVEMASmiWXT+lEQcwYJ0kEAVtj0mtYVFog3hkTt2OgyA8hVgG6RUbB
	EKQVqj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2lN-0000000Fqgd-3zif;
	Thu, 18 Sep 2025 00:44:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2lI-0000000FqZE-2cVV;
	Thu, 18 Sep 2025 00:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758156274;
	bh=OxWLj5jfPrUF57pe227+c8Mwkg2BLt4f9isetceWqR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PE8e4h3jHf5dUGwYCWBIriCbcq2MygFYpoxC3HHe2ExfkesRWWa9LVl5qIgzhLPQf
	 hgT6oAMiGLVaOT28ZYTlQamdH6Q3xRh1ynjFShkLVRnzmcHn9/Q9C5Gu1a0BCjZXPu
	 Zr5vxgRrdwZKM1IEw3U1eoxNOjUHEe2D5z/T+arftp/6n/BGhDzoHlY5912JrwlG6V
	 CPEJdjoDt0jMSlhU2GenQSbT8MMCLt8YdDrFJqy1WlPxL7L6JHU29qmh6R8D+SiWRy
	 VotWwsDDgaOxsng7hhlmdeTjNmVnZ4pvq9naVB51LY58g9MsnCLG4zdJAJMcydd7gu
	 5KEriZYMEsquQ==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC06E17E0EB8;
	Thu, 18 Sep 2025 02:44:27 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:19 -0400
Subject: [PATCH RFC v2 10/20] drm/colorop: Introduce colorop helpers for
 crtc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-10-ac4471b44758@collabora.com>
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
X-CRM114-CacheID: sfid-20250917_174436_863509_84D3B508 
X-CRM114-Status: UNSURE (   9.77  )
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

Introduce colorop helper counterparts for post-blend color pipelines
that take a CRTC instead of a plane.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_colorop.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  8 +++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index db137169effa6cd9e6d5805f65bdfd1cc6882075..b0c3216f4dac22f3408cbd537a20f38d03abc0a7 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -168,6 +168,20 @@ static int drm_plane_colorop_init(struct drm_device *dev,
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
@@ -293,6 +307,23 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
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
@@ -381,6 +412,35 @@ drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *
 }
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
 
+/**
+ * drm_crtc_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @crtc: The associated drm_crtc
+ * @lut_size: LUT size supported by driver
+ * @lut1d_interpolation: 1D LUT interpolation type
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
+ * @return zero on success, -E value on failure
+ */
+int
+drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev,
+				   struct drm_colorop *colorop,
+				   struct drm_crtc *crtc, uint32_t lut_size,
+				   enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+				   uint32_t flags)
+{
+	int ret;
+
+	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_1D_LUT, flags);
+	if (ret)
+		return ret;
+
+	return drm_common_colorop_curve_1d_lut_init(dev, colorop, lut_size,
+						    lut1d_interpolation, flags);
+}
+EXPORT_SYMBOL(drm_crtc_colorop_curve_1d_lut_init);
+
 static int drm_common_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 					   uint32_t flags)
 {
@@ -408,6 +468,19 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
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
index 3e223f3b3597978c5d702ce7622ae30b8aa9dddb..e7d1e5e95a901b1bd91fd8580e2fcb367c0253ce 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -377,14 +377,22 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 
 void drm_colorop_pipeline_destroy(struct drm_device *dev);
 
+int drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				       struct drm_crtc *crtc, uint32_t lut_size,
+				       enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
+				       uint32_t flags);
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
+int drm_crtc_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_crtc *crtc, u64 supported_tfs, uint32_t flags);
 int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
 					struct drm_plane *plane, uint32_t lut_size,
 					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
 					uint32_t flags);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane, uint32_t flags);
+int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_crtc *crtc, uint32_t flags);
 int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 				struct drm_plane *plane, uint32_t flags);
 int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,

-- 
2.50.1


