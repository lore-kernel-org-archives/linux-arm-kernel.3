Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B498CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoiRJGUE6y2sHvq904xr5jP85lB3q3YtMkG2TNH8O6E=; b=zPCu04VfSVN/WODMqCMpqJpZJg
	IOQ3vTqesxC637Wv05ff+JBlvVEZeo23n/w9qEXZNweRg+DelUc+aId0rp9+0aT9C2Cm981Ao1aLi
	tJ2epCwKjXfaf+sFXmLfzkNPtoCa3ZHQ61sOtt0uBfd+PZH1UTNbdNAoQs+K/Up9fPz4mG4G3itf3
	RrlIQ3zHba5OHa/89zUIxSmEMWzWTvov1AZrGT6ttddD2Jr36Nc36nZ5uU/Vf/2fMpySMDV2w+f/z
	2nTLM9NRr6LzV3MTP1wrGV5ZQLSKuBIOCbiahNZxAKw0Vj1R7tGcNUblFyQ0+TKE7ZhsN+b+uHrc5
	tykBNq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2kV-0000000Fppx-3U3N;
	Thu, 18 Sep 2025 00:43:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2kS-0000000FpnN-3DOy;
	Thu, 18 Sep 2025 00:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758156222;
	bh=oIxIPGQlrXOfjm6KSf9LsiAQyBl4V4YpT869PKJy9x8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MQEBxFJnDjGQ+h92SznrP6H0guP3tSWkQn9Bik79ix4N4j2H6uOuDZhj1Qc2aFoHB
	 MpOvOCuI8J2FSRAttJ7jQQLhVWotwu8AmD14IvZrVkXQ/3lNNtiQUaTB8HdKE7F/QS
	 UaGPKEZObyq2pAVKPPasutDQ6B7My897bOk8gWDMNyR+Xf1DPBpExbkqSptU8rBqjT
	 S6uUAjuzw8NHYt1ylVqUqRsa76QgNWgJ9SNEynDVzUmo/+tXw35uU716awulN1pmK7
	 Q94s2gku91IpjdZvhBgtWOnJnCUkZfMSKvRBlkT5IToI3V/e4FympKane7532H0z8B
	 AoFrh+1ynWUlg==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1711F17E130F;
	Thu, 18 Sep 2025 02:43:35 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:12 -0400
Subject: [PATCH RFC v2 03/20] drm: Factor out common color_pipeline
 property initialization code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-3-ac4471b44758@collabora.com>
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
X-CRM114-CacheID: sfid-20250917_174345_116909_F8B4CE76 
X-CRM114-Status: GOOD (  13.55  )
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

In preparation for sharing the initialization code for the color
pipeline property between pre- and post-blend color pipelines, factor
out the common initialization to a separate function.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_crtc.c          | 44 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h |  5 +++++
 drivers/gpu/drm/drm_plane.c         | 36 +++++-------------------------
 3 files changed, 54 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 46655339003db2a1b43441434839e26f61d79b4e..94e60cffd29972aa979ac2f1932be7a6a97f3ada 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -959,3 +959,47 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
 	return hweight32(crtc_state->encoder_mask) > 1;
 }
 EXPORT_SYMBOL(drm_crtc_in_clone_mode);
+
+struct drm_property *
+drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
+					  const struct drm_prop_enum_list *pipelines,
+					  int num_pipelines)
+{
+	struct drm_prop_enum_list *all_pipelines;
+	struct drm_property *prop;
+	int len = 0;
+	int i;
+
+	all_pipelines = kcalloc(num_pipelines + 1,
+				sizeof(*all_pipelines),
+				GFP_KERNEL);
+
+	if (!all_pipelines) {
+		drm_err(dev, "failed to allocate color pipeline\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* Create default Bypass color pipeline */
+	all_pipelines[len].type = 0;
+	all_pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add all other color pipelines */
+	for (i = 0; i < num_pipelines; i++, len++) {
+		all_pipelines[len].type = pipelines[i].type;
+		all_pipelines[len].name = pipelines[i].name;
+	}
+
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					all_pipelines, len);
+	if (IS_ERR(prop)) {
+		kfree(all_pipelines);
+		return prop;
+	}
+
+	drm_object_attach_property(obj, prop, 0);
+
+	kfree(all_pipelines);
+	return prop;
+}
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index c094092296448093c5cd192ecdc8ea9a50769c90..e3dbdcbfa385b940ec0b5476adde6146fe4afde1 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -35,6 +35,7 @@
 #ifndef __DRM_CRTC_INTERNAL_H__
 #define __DRM_CRTC_INTERNAL_H__
 
+#include <drm/drm_property.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -79,6 +80,10 @@ int drm_crtc_check_viewport(const struct drm_crtc *crtc,
 int drm_crtc_register_all(struct drm_device *dev);
 void drm_crtc_unregister_all(struct drm_device *dev);
 int drm_crtc_force_disable(struct drm_crtc *crtc);
+struct drm_property *
+drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
+					  const struct drm_prop_enum_list *pipelines,
+					  int num_pipelines);
 
 struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc);
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index f6cfa8ac090c7bc49c7f276993bba7e9800da140..60dbfcab495600dd44c15260a1fa6135db59c6e2 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1839,43 +1839,17 @@ int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
 					     const struct drm_prop_enum_list *pipelines,
 					     int num_pipelines)
 {
-	struct drm_prop_enum_list *all_pipelines;
 	struct drm_property *prop;
-	int len = 0;
-	int i;
-
-	all_pipelines = kcalloc(num_pipelines + 1,
-				sizeof(*all_pipelines),
-				GFP_KERNEL);
-
-	if (!all_pipelines) {
-		drm_err(plane->dev, "failed to allocate color pipeline\n");
-		return -ENOMEM;
-	}
 
-	/* Create default Bypass color pipeline */
-	all_pipelines[len].type = 0;
-	all_pipelines[len].name = "Bypass";
-	len++;
-
-	/* Add all other color pipelines */
-	for (i = 0; i < num_pipelines; i++, len++) {
-		all_pipelines[len].type = pipelines[i].type;
-		all_pipelines[len].name = pipelines[i].name;
-	}
-
-	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
-					"COLOR_PIPELINE",
-					all_pipelines, len);
-	if (IS_ERR(prop)) {
-		kfree(all_pipelines);
+	prop = drm_common_create_color_pipeline_property(plane->dev,
+							 &plane->base,
+							 pipelines,
+							 num_pipelines);
+	if (IS_ERR(prop))
 		return PTR_ERR(prop);
-	}
 
-	drm_object_attach_property(&plane->base, prop, 0);
 	plane->color_pipeline_property = prop;
 
-	kfree(all_pipelines);
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);

-- 
2.50.1


