Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC818C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyRu1dsQstRF2Q+N0CMp8ToTFe+JOEaHzDErtcbNMEQ=; b=1ktsKtjUZ4Mn/65dGKOUTrvuTl
	Ktyt0yyTW2atg7IP+v/xBmfB1ZXT6UEmsXATn6fCHvi0+w3SMDiypS2mU+NPgWvodfNvjlhEw2HU1
	h3KlzLK9Kmv12lFYekLvNI65OmsFHCXw7BGGB0O7qNBo1qLclcGbgwE5l5tOPyPQkRVfTbxOOm9kK
	WrPD8+6yqWPnRVixoHxaCthMT/XBMuoFq8+fCR9l2VMDVP2w/P0fekw2FzOnw/e62y1qFnMFqHVOz
	Eu93cAzE32A/hCZscfZKztTknvFm7B6b5XmBVMs5o2Npp6q9LEY3BsVNitORsmTcMAPT18a1yPNDB
	Ay+rxvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZz-0000000Bjn7-0V6M;
	Tue, 14 Jul 2026 11:45:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZH-0000000Biio-3mTc;
	Tue, 14 Jul 2026 11:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029494;
	bh=xZZjjOrgMbV7Ra3pKmZ0s066Z1elHcoXLMSmk4InLzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0dWFygiPSjp9wQOUt/BCeO2hYaQZsww80kJ2DAyXOWKtZtHOzxYDxceGBDTqZS+I
	 rAyC1VG6YJc00IhXFdMYSs1d4PITOoYVB0zfyniuG8GzaQNfA8Ji1QpEQnK4avCkVn
	 AncmMQX/np81NobukWuEu//+3xpMwLGqiLZXrYshF/IzVuXRbUKOnFdUmADvKizE8W
	 jI4IR5zcmsZGaZo16VDlohwoBOIpwkcOOkLn+MAn3tBtn5G91Ac8y+NxPxwP8CyKV4
	 bvVVuycqXkllLsG0oNO7GCzCSg/TQ9YwnqNKyuVOtrkSAvugL0PS84Xv3o5IqpcKfy
	 BGj3WSL0KaOmQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4555F17E0B89;
	Tue, 14 Jul 2026 13:44:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 20/46] drm/mediatek: mtk_crtc: Dynamically find vblank/cfg component indices
Date: Tue, 14 Jul 2026 13:43:48 +0200
Message-ID: <20260714114414.184512-21-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044456_171544_E90BAEB6 
X-CRM114-Status: GOOD (  28.29  )
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

As of now mtk_crtc assumes that, on all MediaTek SoCs, both the
vblank and configuration components are the same one, and also
that this would always be the first one in a display pipeline.

This is not true!

Or at least, it's true for the display pipelines supported by the
legacy SoCs like MT8173, and also for the ones that are currently
used in the upstream boards on more recent SoCs like MT8188/95,
but for the latter ones it just happens to be like this because
of how the boards are configured.

This is done both in preparation for adding support for complex
Display Controller pipelines like needed in MT8196 and MT8894, but
also for supporting display pipelines in MT8188/89/95 (and others
from the same generation) that are not starting with a component
that handles both vblank and layer configuration at the same time.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 56 ++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 2cdf28a0e2ff..72d5caedc4af 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -59,6 +59,8 @@ struct mtk_crtc_hw_layer {
  * @mmsys_dev:       Pointer to the MMSYS device for configuration registers
  * @dma_dev:         Pointer to the DMA device (usually linked to an IOMMU)
  * @mutex:           Pointer to the MediaTek MuteX device for HW triggers mute/unmuting
+ * @vblank_comp_idx: Index of HW component where to enable sending VBlanks
+ * @config_comp_idx: Index of main HW component to use for plane configuration
  * @ddp_comp_nr:     Number of HW components in ddp_comp structure
  * @num_conn_routes: Number of alternative connection routes for a pipeline
  * @conn_routes:     Array of HW components usable as alternative connection route
@@ -90,6 +92,8 @@ struct mtk_crtc {
 	struct device			*mmsys_dev;
 	struct device			*dma_dev;
 	struct mtk_mutex		*mutex;
+	s8				vblank_comp_idx;
+	s8				config_comp_idx;
 	unsigned int			ddp_comp_nr;
 	unsigned int			num_conn_routes;
 	const struct mtk_drm_route	*conn_routes;
@@ -523,7 +527,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->config_comp_idx];
 	unsigned int i;
 
 	/*
@@ -693,7 +697,7 @@ static void mtk_crtc_ddp_irq(void *data)
 static int mtk_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->vblank_comp_idx];
 
 	mtk_ddp_comp_enable_vblank(comp);
 
@@ -703,7 +707,7 @@ static int mtk_crtc_enable_vblank(struct drm_crtc *crtc)
 static void mtk_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->vblank_comp_idx];
 
 	mtk_ddp_comp_disable_vblank(comp);
 }
@@ -816,7 +820,7 @@ static void mtk_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_atomic_commit *state)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->config_comp_idx];
 	struct drm_device *dev = mtk_crtc->base.dev;
 	int ret;
 
@@ -844,7 +848,7 @@ static void mtk_crtc_atomic_disable(struct drm_crtc *crtc,
 				    struct drm_atomic_commit *state)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
-	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
+	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[mtk_crtc->config_comp_idx];
 	struct drm_device *dev = mtk_crtc->base.dev;
 	int i;
 
@@ -1179,6 +1183,10 @@ int mtk_crtc_create(struct drm_device *drm_dev,
 		return ret;
 	}
 
+	/* Component 0 would be valid so initialize vblank and config idx to -EINVAL */
+	mtk_crtc->vblank_comp_idx = -EINVAL;
+	mtk_crtc->config_comp_idx = -EINVAL;
+
 	for (i = 0, j = 0; i < mtk_crtc->ddp_comp_nr; i++, j++) {
 		unsigned int comp_id = output_path->comp[i].type;
 		struct mtk_ddp_comp *comp;
@@ -1201,12 +1209,50 @@ int mtk_crtc_create(struct drm_device *drm_dev,
 
 			if (comp->funcs->ctm_set)
 				has_ctm = true;
+
+			/*
+			 * Assumes that there can only be one vblank enabler per CRTC,
+			 * and that should there be more than one, the one that should
+			 * handle vblanks has to be the bottom-most HW component.
+			 */
+			if (mtk_crtc->vblank_comp_idx < 0 && comp->funcs->enable_vblank)
+				mtk_crtc->vblank_comp_idx = j;
+
+			/*
+			 * Assumes that there can only be one main configuration
+			 * component per CRTC, and that if more than one has to
+			 * be configured for at each frame, the main one would
+			 * take care of the config chain.
+			 *
+			 * As a note, such component has specific characteristics:
+			 * - It is configurable, and supports per-layer properties;
+			 * - It is a main layer component and not a layer stage;
+			 * - It is always the first one (the bottom-most) in the
+			 *   pipeline that has the characteristics explaned above.
+			 *
+			 * Such hardware is usually an OVL, RDMA or exDMA.
+			 *
+			 * This may change in the future with more complex pipelines.
+			 */
+			if (mtk_crtc->config_comp_idx < 0 && comp->funcs->config &&
+			    comp->funcs->layer_config && comp->funcs->layer_nr)
+				mtk_crtc->config_comp_idx = j;
 		}
 
 		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
 						&mtk_crtc->base);
 	}
 
+	if (mtk_crtc->config_comp_idx < 0) {
+		dev_err(dev, "No HW component for layer configuration. Bailing out.\n");
+		return -EINVAL;
+	}
+
+	if (mtk_crtc->vblank_comp_idx < 0) {
+		dev_info(dev, "No vblank enabler component found! Expect timeouts.\n");
+		mtk_crtc->vblank_comp_idx = 0;
+	}
+
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
 
-- 
2.54.0


