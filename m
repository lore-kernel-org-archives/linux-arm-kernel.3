Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7932FC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAXkzbUe0CEgwELnwVdDfvUPkWL9QhsPoHB5RGoV4wk=; b=34AnCegaWysn5I/5ElUFD5HWOs
	1jq/yAuU6UbPiHchKg78RhcKVTHq+waiQuTa3A5yedtVPlzUC/+Eyy+Gwo8+JbBbvzyw9fhR7p6I7
	XPLSLGMoBizEJjf+/c+C3SIKbOkA/Dr3qmjUwn674mkLkiBW3YXoEYn15WabkJS1crWrKraC3KRgC
	IZd+5p6dPSXcOauOFHjQelGP9oeV8GzQtUg6uNnARjIZfOj2IJjMneNi2tTqmGG1D7x5NCWZ1hpMw
	ryALmxtSFzFTuAt4Hf3FKyOgCD5Avz2gaWMCstvADdfMoSrs5I6yQEsc06+raWSX5VGiuYX9Ocnif
	IW/q7yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4xI-00000005SY9-3nNx;
	Mon, 17 Feb 2025 17:30:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3NF-0000000586k-0FrM;
	Mon, 17 Feb 2025 15:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807371;
	bh=knRuGa81CVJP9wj5k7dwCwWYzcVeBaPor4o45VZxJc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PGVoVI3w6K2/LCMr/2mhdL8x5YyX3RnQL3K/AOvkd18W1AySZSzf0cJo+Ez+CT4yt
	 M7M5aB14hJEuPipMG3XcPE8n0V2ydJoWY/8sHyceVs1tFgIcOMiVMXCUT+nIE9bPki
	 Qpt10M3ot0s15D9FFSi32uRT16cmimxIttK+RjAVeQosezmgXZDYDX2Q9aMD6cgAXy
	 1budqOOcy3+4srbXerQSsunun3H6aXNaYNHbulWXW12pjD6qO3uz/X+AO8vtQ7wR7c
	 HVqKfCdh+dL68uc0fgpYiqgPGdJAQ0KXBwBYAoRCuaDSgjpPxBF3t5fHsjdP0Cnhy1
	 S6FbgK27/hLNw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D39217E156E;
	Mon, 17 Feb 2025 16:49:30 +0100 (CET)
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
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v7 10/43] drm/mediatek: Add support for MT8195 Digital Parallel Interface
Date: Mon, 17 Feb 2025 16:48:03 +0100
Message-ID: <20250217154836.108895-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074933_269048_2F80EEEB 
X-CRM114-Status: GOOD (  11.34  )
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

Add support for the DPI block found in the MT8195 and MT8188 SoCs.
Inside of the SoC, this block is directly connected to the HDMI IP.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 19 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  6 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index ee952785866c..d066fbd6ffb6 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1139,6 +1139,24 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8195_conf = {
+	.max_clock_khz = 594000,
+	.output_fmts = mt8183_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.pixels_per_iter = 1,
+	.is_ck_de_pol = true,
+	.swap_input_support = true,
+	.support_direct_pin = true,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
+	.input_2p_en_bit = DPI_INPUT_2P_EN,
+	.clocked_by_hdmi = true,
+	.output_1pixel = true,
+};
+
 static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.dpi_factor = dpi_factor_mt8195_dp_intf,
 	.num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8195_dp_intf),
@@ -1242,6 +1260,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8195_dpintf_conf },
 	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
 	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
+	{ .compatible = "mediatek,mt8195-dpi", .data = &mt8195_conf },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index a0b1d18bbbf7..3c24d9e9f241 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -40,6 +40,12 @@
 #define FAKE_DE_LEVEN			BIT(21)
 #define FAKE_DE_RODD			BIT(22)
 #define FAKE_DE_REVEN			BIT(23)
+
+/* DPI_CON: DPI instances */
+#define DPI_OUTPUT_1T1P_EN		BIT(24)
+#define DPI_INPUT_2P_EN			BIT(25)
+
+/* DPI_CON: DPINTF instances */
 #define DPINTF_YUV422_EN		BIT(24)
 #define DPINTF_CSC_ENABLE		BIT(26)
 #define DPINTF_INPUT_2P_EN		BIT(29)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index f22ad2882697..772c3d0f5d14 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -810,6 +810,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt8195-dp-intf",
 	  .data = (void *)MTK_DP_INTF },
+	{ .compatible = "mediatek,mt8195-dpi",
+	  .data = (void *)MTK_DPI },
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
-- 
2.48.1


