Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1F1CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMS7dId7xvceyvozFsD7pkdmhYgaYNLQjEILXRMN06o=; b=s83yhmv37+qgEQjX75j8TMh8Tm
	oxCcONK3tb1BOtD6WldNyfTYvRtkELvbnfbKojxR62vNL8R2qrO4akzul6nxzJ6g5j2GlzMnbWbs/
	7Emkrwg/BhWCIofwLfkM6iFqg/DIdW1ts4S0tRTSdVqmfykzjxuG0iSpoEgCsNuJTNwHtrCTHoh+f
	pCKAoBvq9CW2bPCAm8S3JeEAdSuBj8OYaDocE5rcUU+AM6dYcoRwEI7n7FMhJS9a8yEEcMXdRhR53
	AgEXAbSh7UNjRnYztYRR5CKLEm8XfeIV8KGBPjpis9mxVKFC6zAzphroaZLjzQrRDuVhkDM+fkwAj
	Gdyk4c7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphy3-00000004FP9-1c8w;
	Sat, 23 Aug 2025 06:43:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upWdL-00000003JwA-3UIx;
	Fri, 22 Aug 2025 18:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755887822;
	bh=vr9BwkfpPl2aezdbMUSWAGBDTvysFxMaRfBw43Yz+S8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pRppNzg5s4uapPjn7YtBbfZGGZIxmaNVknnJRDYFOPwrbTtTsQozz/rDRL8rPzVIM
	 E24A4TrF/3enIMPnbB6oP8CqmcL/1GVeH859zU4hLJ8/MLfagz2R2G2hjwXTO6ASmC
	 Tbn/EifM5GU5s00ogR/4pDkaEJV0mx0Kuc3ke5YQ3ejOwv86jURkfdA10pRYixCXk9
	 eHN0iPOLeIRxB6YuT7kChlJJXqczOUA7TpbGnv6x9+0PnJ8OIkpVBfdzAKubptLFux
	 f5vlO8VPJyRdVR7nHYxhBy5P9mLz6MDZ7hsaV7IkR5nBk/aCTFnXTB2EvkNTeCHqTj
	 XylT6vVd2R/wQ==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B04D17E37C2;
	Fri, 22 Aug 2025 20:36:56 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 22 Aug 2025 14:36:14 -0400
Subject: [PATCH RFC 4/5] drm/mediatek: ccorr: Support post-blend color
 pipeline API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250822-mtk-post-blend-color-pipeline-v1-4-a9446d4aca82@collabora.com>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
In-Reply-To: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_113704_018136_2098DD75 
X-CRM114-Status: GOOD (  19.27  )
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

Implement the ctm_set_color_pipeline DDP component function to allow
configuring the CTM through the color pipeline API.

The color pipeline API only defines a 3x4 matrix, while the driver
currently only supports setting the coefficients for a 3x3 matrix.
However the underlying hardware does support setting the offset
coefficients that make up a 3x4 matrix, so implement support for setting
them so the 3x4 matrix structure for the API can be used as is.

Also make sure to enable or disable the CTM function depending on
whether the block should be bypassed or not.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 100 ++++++++++++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   3 +-
 3 files changed, 93 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index ac6620e10262e3b9a4a82093f13c3101f79520de..c873b527423f51733058cbc3d0ad2a719e26bfe1 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -284,7 +284,8 @@ static const struct mtk_ddp_comp_funcs ddp_ccorr = {
 	.config = mtk_ccorr_config,
 	.start = mtk_ccorr_start,
 	.stop = mtk_ccorr_stop,
-	.ctm_set = mtk_ccorr_ctm_set,
+	.ctm_set = mtk_ccorr_ctm_set_legacy,
+	.ctm_set_color_pipeline = mtk_ccorr_ctm_set_color_pipeline,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_color = {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 10d60d2c2a568ebbe09f90e8f42a73e4c2366662..f69a7d8b97f741f0c5461e8cd6f38f70b0690e7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -28,6 +28,11 @@
 #define DISP_CCORR_COEF_2			0x0088
 #define DISP_CCORR_COEF_3			0x008C
 #define DISP_CCORR_COEF_4			0x0090
+#define DISP_CCORR_OFFSET_0			0x0100
+#define CCORR_OFFSET_EN					BIT(31)
+#define DISP_CCORR_OFFSET_1			0x0104
+#define DISP_CCORR_OFFSET_2			0x0108
+#define DISP_CCORR_OFFSET_MASK				GENMASK(26, 14)
 
 struct mtk_disp_ccorr_data {
 	u32 matrix_bits;
@@ -101,25 +106,48 @@ static u16 mtk_ctm_s31_32_to_s1_n(u64 in, u32 n)
 	return r;
 }
 
-void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
+static void mtk_ccorr_ctm_set(struct device *dev, struct cmdq_pkt *cmdq_pkt,
+			      void *ctm, bool ctm_3x4)
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
-	struct drm_property_blob *blob = state->ctm;
-	struct drm_color_ctm *ctm;
-	const u64 *input;
+	u64 coeffs_in[9];
+	u64 coeffs_offset_in[3];
 	uint16_t coeffs[9] = { 0 };
+	uint16_t coeffs_offset[3];
 	int i;
-	struct cmdq_pkt *cmdq_pkt = NULL;
 	u32 matrix_bits = ccorr->data->matrix_bits;
+	u32 val;
+
+	if (ctm_3x4) {
+		struct drm_color_ctm_3x4 *ctm_3x4 = (struct drm_color_ctm_3x4 *)ctm;
+
+		coeffs_in[0] = ctm_3x4->matrix[0];
+		coeffs_in[1] = ctm_3x4->matrix[1];
+		coeffs_in[2] = ctm_3x4->matrix[2];
+		coeffs_in[3] = ctm_3x4->matrix[4];
+		coeffs_in[4] = ctm_3x4->matrix[5];
+		coeffs_in[5] = ctm_3x4->matrix[6];
+		coeffs_in[6] = ctm_3x4->matrix[8];
+		coeffs_in[7] = ctm_3x4->matrix[9];
+		coeffs_in[8] = ctm_3x4->matrix[10];
+
+		coeffs_offset_in[0] = ctm_3x4->matrix[3];
+		coeffs_offset_in[1] = ctm_3x4->matrix[7];
+		coeffs_offset_in[2] = ctm_3x4->matrix[11];
+	} else {
+		struct drm_color_ctm *ctm_3x3 = (struct drm_color_ctm *)ctm;
 
-	if (!blob)
-		return;
-
-	ctm = (struct drm_color_ctm *)blob->data;
-	input = ctm->matrix;
+		for (i = 0; i < ARRAY_SIZE(coeffs_in); i++)
+			coeffs_in[i] = ctm_3x3->matrix[i];
+	}
 
 	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
-		coeffs[i] = mtk_ctm_s31_32_to_s1_n(input[i], matrix_bits);
+		coeffs[i] = mtk_ctm_s31_32_to_s1_n(coeffs_in[i], matrix_bits);
+
+	if (ctm_3x4) {
+		for (i = 0; i < ARRAY_SIZE(coeffs_offset); i++)
+			coeffs_offset[i] = mtk_ctm_s31_32_to_s1_n(coeffs_offset_in[i], matrix_bits);
+	}
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
@@ -131,6 +159,56 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_3);
 	mtk_ddp_write(cmdq_pkt, coeffs[8] << 16,
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_4);
+
+	if (ctm_3x4) {
+		val = CCORR_OFFSET_EN;
+		val |= FIELD_PREP(DISP_CCORR_OFFSET_MASK, coeffs_offset[0]);
+		mtk_ddp_write(cmdq_pkt, val, &ccorr->cmdq_reg,
+			      ccorr->regs, DISP_CCORR_OFFSET_0);
+		val = FIELD_PREP(DISP_CCORR_OFFSET_MASK, coeffs_offset[1]);
+		mtk_ddp_write(cmdq_pkt, val, &ccorr->cmdq_reg,
+			      ccorr->regs, DISP_CCORR_OFFSET_1);
+		val = FIELD_PREP(DISP_CCORR_OFFSET_MASK, coeffs_offset[2]);
+		mtk_ddp_write(cmdq_pkt, val, &ccorr->cmdq_reg,
+			      ccorr->regs, DISP_CCORR_OFFSET_2);
+	} else {
+		mtk_ddp_write_mask(cmdq_pkt, 0, &ccorr->cmdq_reg,
+				   ccorr->regs, DISP_CCORR_OFFSET_0,
+				   CCORR_OFFSET_EN);
+	}
+
+	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg,
+		      ccorr->regs, DISP_CCORR_CFG);
+}
+
+void mtk_ccorr_ctm_set_legacy(struct device *dev, struct drm_crtc_state *state)
+{
+	struct drm_property_blob *blob = state->ctm;
+	struct cmdq_pkt *cmdq_pkt = NULL;
+	struct drm_color_ctm *ctm;
+
+	if (!blob)
+		return;
+
+	ctm = (struct drm_color_ctm *)blob->data;
+
+	mtk_ccorr_ctm_set(dev, cmdq_pkt, ctm, false);
+}
+
+void mtk_ccorr_ctm_set_color_pipeline(struct device *dev, struct drm_color_ctm_3x4 *ctm)
+{
+	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
+	struct cmdq_pkt *cmdq_pkt = NULL;
+
+	/* Configure block to be bypassed */
+	if (!ctm) {
+		mtk_ddp_write_mask(cmdq_pkt, CCORR_RELAY_MODE, &ccorr->cmdq_reg,
+				   ccorr->regs, DISP_CCORR_CFG,
+				   CCORR_RELAY_MODE | CCORR_ENGINE_EN);
+		return;
+	}
+
+	mtk_ccorr_ctm_set(dev, cmdq_pkt, ctm, true);
 }
 
 static int mtk_disp_ccorr_bind(struct device *dev, struct device *master,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 679d413bf10be1e2fc4804a60a3fbe5d734614f6..ac84cf579150fd0535c79f43ad5942f8d412d450 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -22,7 +22,8 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state);
 void mtk_aal_start(struct device *dev);
 void mtk_aal_stop(struct device *dev);
 
-void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state);
+void mtk_ccorr_ctm_set_legacy(struct device *dev, struct drm_crtc_state *state);
+void mtk_ccorr_ctm_set_color_pipeline(struct device *dev, struct drm_color_ctm_3x4 *ctm);
 int mtk_ccorr_clk_enable(struct device *dev);
 void mtk_ccorr_clk_disable(struct device *dev);
 void mtk_ccorr_config(struct device *dev, unsigned int w,

-- 
2.47.2


