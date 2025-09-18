Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A6DCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Trw8E3oy8liaxQKvPSzaV70xujWliefFL3C3oBsKcdI=; b=ogYFLblqijfLL04aaOx97uREY+
	2pVAxZookgU3iSApBC5RIGcQEK7iIdPqyb6Jf8MYuPNoiTt3SghEPQvgX/1JfT1JGNx9E0sfUEHWY
	tH8fp+i7C/Ds/Y/y0svVJWU2/BR9GXcLQSE2nQJidBFPwKFUwB/3r2nxvnk1LZqkJ0DbFBpVw4fTB
	bqNc8IxEPbYUZeuneqjLUkUHbmODd8pq7gJ+buiaMrJtdPDTo9shwMYZ2oHjZMsKSwbI63PYbMCyG
	ezTVyY0ebQ4vxBa/iNoynqU5CmxtyHcvZm5/3SEF521h0wKOVfvgWqkBjFgpFwM+5keqhlF97XBQB
	+k1tT45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2mR-0000000Froi-0SKp;
	Thu, 18 Sep 2025 00:45:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2mN-0000000Frj7-1X3m;
	Thu, 18 Sep 2025 00:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758156341;
	bh=Ubb2RwOlCe865fSK4jeKJoKkExIANG86ANonO6mf70A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qv9fKRr4nqEe7T9EM5WO9nUsxOf2nNDGBQkY/d/B1m17/4+bKYzbEkXxUnqPjxDMo
	 0g6f6UmY0zWxz2jMGxrUEhcdYZfZVX5Rk+8uOb3F67cXh4bQ5WllKToo9r2OV/yN7F
	 6KFlY9Jt/G0cAyOIXcQqt5GqoRYjzoVtKGPYLJi3KZ+ghsfnPL/TrYEMF9XZX5U80g
	 /YBNrfjrBT8+92t+s6oWpiR3/KTzY+sU5v8xglHHv59TDTZhPA/9Sbi9bRssB+YWkC
	 yRDtaazh0CoyJdsW4fX3nP75wkCTfjZVI0Sw+JP4EtcXvATJgh98EZ1cdFx7f/3Q+A
	 kpk6FHUGlXb4g==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C793317E13C1;
	Thu, 18 Sep 2025 02:45:34 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:28 -0400
Subject: [PATCH RFC v2 19/20] drm/vkms: Introduce support for post-blend
 color pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-19-ac4471b44758@collabora.com>
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
X-CRM114-CacheID: sfid-20250917_174543_610235_6FE371B5 
X-CRM114-Status: GOOD (  15.32  )
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

Introduce a post-blend color pipeline with the same colorop blocks as
the pre-blend color pipeline.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_colorop.c  | 98 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_composer.c |  5 +-
 drivers/gpu/drm/vkms/vkms_crtc.c     |  1 +
 drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
 4 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 5924ae2bd40fc904048f99bc9b96308140709e25..54c512db68eef16435d5f79453784f7784d540fb 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -98,6 +98,86 @@ vkms_initialize_pre_blend_color_pipeline(struct drm_plane *plane,
 	return ret;
 }
 
+static int
+vkms_initialize_post_blend_color_pipeline(struct drm_crtc *crtc,
+					  struct drm_prop_enum_list *list)
+{
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_device *dev = crtc->dev;
+	int ret;
+	int i = 0;
+
+	memset(ops, 0, sizeof(ops));
+
+	/* 1st op: 1d curve */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_crtc_colorop_curve_1d_init(dev, ops[i], crtc, supported_tfs,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	list->type = ops[i]->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
+
+	i++;
+
+	/* 2nd op: 3x4 matrix */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_crtc_colorop_ctm_3x4_init(dev, ops[i], crtc, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
+	/* 3rd op: 3x4 matrix */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_crtc_colorop_ctm_3x4_init(dev, ops[i], crtc, DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
+	/* 4th op: 1d curve */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_crtc_colorop_curve_1d_init(dev, ops[i], crtc, supported_tfs,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	return 0;
+
+cleanup:
+	drm_colorop_pipeline_destroy(dev);
+
+	return ret;
+}
+
 int vkms_initialize_pre_blend_colorops(struct drm_plane *plane)
 {
 	struct drm_prop_enum_list pipeline;
@@ -115,3 +195,21 @@ int vkms_initialize_pre_blend_colorops(struct drm_plane *plane)
 
 	return 0;
 }
+
+int vkms_initialize_post_blend_colorops(struct drm_crtc *crtc)
+{
+	struct drm_prop_enum_list pipeline;
+	int ret;
+
+	/* Add color pipeline */
+	ret = vkms_initialize_post_blend_color_pipeline(crtc, &pipeline);
+	if (ret)
+		return ret;
+
+	/* Create COLOR_PIPELINE property and attach */
+	ret = drm_crtc_create_color_pipeline_property(crtc, &pipeline, 1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 05e1551d6330e4dc14563d3a399b3544d11c6576..efe09538768b01108a305f0ace765246220b487b 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -495,7 +495,10 @@ static void blend(struct vkms_writeback_job *wb,
 			blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
 		}
 
-		apply_lut(crtc_state, output_buffer);
+		if (crtc_state->base.color_pipeline_enabled)
+			color_transform(crtc_state->base.color_pipeline, output_buffer);
+		else
+			apply_lut(crtc_state, output_buffer);
 
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index e60573e0f3e9510252e1f198b00e28bcc7987620..04737c1fb70e4f0aef480a180e57a76fbc279dfa 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -295,6 +295,7 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 	}
 
 	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
+	vkms_initialize_post_blend_colorops(crtc);
 
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 37ee569474223b2cf01e3cc0e4f119777533ae23..a0308c2263d1858a72906853960ea7d1bbecd03e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -306,5 +306,6 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_out
 
 /* Colorops */
 int vkms_initialize_pre_blend_colorops(struct drm_plane *plane);
+int vkms_initialize_post_blend_colorops(struct drm_crtc *crtc);
 
 #endif /* _VKMS_DRV_H_ */

-- 
2.50.1


