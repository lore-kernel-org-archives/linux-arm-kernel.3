Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E930C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SRar6MGHG1xObe7Mk77mQs+iai0bo020Zv7w6PayHM=; b=hjJGTBcTFN/l05zhCZCxfPTsOH
	VK3Hxeurtnx6cVev8WtzUktEkuB6+lC1tPHz00U9xFfP2car9UE0jN2FHSn1VrVLp0uPoDzKmXlvW
	XlgZ4FuI1hszPYA7fqGjdGub7Chy5kX29dJffCfwUPgEmnHzKbEOH18opHljhGmC/NQ7Ag05infN7
	056vMx5PkORA1LhWovd6zWzKFcT0ej84uDgDiUsGq0gz/NbU5MGPnuDZjJg4yESqqTu1xGRN/3Lov
	HJ8H21EjLvec5cuT0DUkFpMfS2p0BCDKhMAgPybz43fJ0E/crKU80v9SzOpIOf6xew0U5Zvlmuken
	P75bXDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoiQ-00000003cap-1yuu;
	Tue, 11 Feb 2025 11:46:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoX8-00000003YVh-31ab;
	Tue, 11 Feb 2025 11:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273669;
	bh=XMWOWL24gBRtlT/Oi19T7IB/aDtle5upg0g4+u+CtdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1lC8y/pFNISyAavVX7rZUfo+cVMx0k3S3oYB0/XB8keOLvEvOuS16HCW4+o83Fu6
	 9g4xUnNIYu3MujRfXT9GhzCsp4zyC0dmjNy9wqDFBKuDgW70Lsm6b2U38TTCBzisBE
	 SCg1WMwsA0kpDEEAH+TEBDe+isjDXYLAT7feBIig+6MOYBK7re3hdmzcdyWSniyzpa
	 SWxOcFhH4mxSdWIXsRQvhVCEvbe1+S8gUziNXuRU/mywYKgfy7FntsGVtfAfSB/Cdo
	 /lO1IEnbz9nagsWgzhm69mZ8eoSAz5hZXXSnia2eftrDf/0QfbXVvlE2LBuXqQqgnO
	 f0yL/lp7capOg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2EC1117E154C;
	Tue, 11 Feb 2025 12:34:28 +0100 (CET)
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
Subject: [PATCH v6 06/42] drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
Date: Tue, 11 Feb 2025 12:33:33 +0100
Message-ID: <20250211113409.1517534-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033430_901371_97E927DD 
X-CRM114-Status: GOOD (  13.04  )
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

In preparation for adding support for MT8195's HDMI reserved DPI
instance, move the input_2p_en bit for DP_INTF to platform data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bb1a17f1384b..ad07005ad56e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -143,6 +143,7 @@ struct mtk_dpi_factor {
  * @channel_swap_shift: Shift value of channel swap.
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
+ * @input_2p_en_bit: Enable bit of two pixel per round feature
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
  */
@@ -163,6 +164,7 @@ struct mtk_dpi_conf {
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
+	u32 input_2p_en_bit;
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
 };
@@ -651,9 +653,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 		mtk_dpi_dual_edge(dpi);
 		mtk_dpi_config_disable_edge(dpi);
 	}
-	if (dpi->conf->input_2pixel) {
-		mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
-			     DPINTF_INPUT_2P_EN);
+	if (dpi->conf->input_2p_en_bit && dpi->conf->input_2pixel) {
+		mtk_dpi_mask(dpi, DPI_CON, dpi->conf->input_2p_en_bit,
+			     dpi->conf->input_2p_en_bit);
 	}
 	mtk_dpi_sw_reset(dpi, false);
 
@@ -1127,6 +1129,7 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.channel_swap_shift = DPINTF_CH_SWAP,
 	.yuv422_en_bit = DPINTF_YUV422_EN,
 	.csc_enable_bit = DPINTF_CSC_ENABLE,
+	.input_2p_en_bit = DPINTF_INPUT_2P_EN,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
-- 
2.48.1


