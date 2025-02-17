Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECC4C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5TyCLS5bnQfrcFzDnkidF8MGY6DqMjTM0YybAmsN3U=; b=DPZyWpeqKyXV01Fq/AQtTrrI13
	XsubRngVKaaBGFWJbRihUxcIjlpDyO0s7So1ZRMYYvN35kyt4PQnJiYtnXV6snoIZ7ebvQNU30RFJ
	gTCuzwvPrqGpC35Sn475+XnCeMIA+F3fdtWxFrKv7Ln8QssKISXZ2fDqWZNqk6v4JRv9PvtsuYLSH
	mVKQIW52ypIO0N2ylh5zLsv7ZO0hKNYPvyr0PzBexz/IHLgt8QgYK5j1PwQ7AOLnc/sHeCBvFVcRS
	WEoU2C11UDFSmLUOxp+BXBg31aymmlDKkrKwi5YnhsW3rxGCk68G3dUPGk36t8YnHY92ZSXLKrJBi
	R9NhDtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4uQ-00000005S3G-22ZA;
	Mon, 17 Feb 2025 17:27:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3NB-00000005843-43hY;
	Mon, 17 Feb 2025 15:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807368;
	bh=VBT30cW01k0fcjrm29mhLfNmM99zJpEKPCw+voBVrmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZYF8rMv6W7LGbxb88NpCThdHxx4GOWr4mPC0jPK+PZxuDtcOP0BJii/gllWl1uJf0
	 e7YsfEJWMWeQQeOlRJOKlOD7ETsaM8OLeSpugQWKKpzrvfSm+hLljEc3PIpg0IEOxx
	 tTWLCjPL5PtWohnCExhUZKa0j1V41zJ3kV+4AtNSyLRQW/woNjX1IP0iLS/scgq6wt
	 2oqbtrC/e5t+k1xyGZlrLVbBwXnl0EeZsWrxnbpWzmSEFFcTPVZqZoD06Z90Df/wcz
	 tljynvfYBl4E5ZysCV5in78RjZMIN8+O9mFZizvWaaCJWyXfxPLA71xXPdpRZ0FaeN
	 +ZZU84vuKZguQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D53217E156A;
	Mon, 17 Feb 2025 16:49:27 +0100 (CET)
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
Subject: [PATCH v7 08/43] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
Date: Mon, 17 Feb 2025 16:48:01 +0100
Message-ID: <20250217154836.108895-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074930_154132_1BEA5898 
X-CRM114-Status: GOOD (  12.50  )
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

On some SoCs, like MT8195 and MT8188, the DPI's FIFO controller
(afifo) supports outputting either one or two pixels per round
regardless of the input being 1T1P or 1T2P.

Add a `output_1pixel` member to struct mtk_dpi_conf which, if
set, will enable outputting one pixel per clock.

In case the input is two pixel per clock (1T2P), the AFIFO HW
will automatically (and internally) convert it to 1T1P.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 9f83e82437dd..e12dc73ed79c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -147,6 +147,8 @@ struct mtk_dpi_factor {
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
  * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock, needed
  *		     for DPI registers access.
+ * @output_1pixel: Enable outputting one pixel per round; if the input is two pixel per
+ *                 round, the DPI hardware will internally transform it to 1T1P.
  */
 struct mtk_dpi_conf {
 	const struct mtk_dpi_factor *dpi_factor;
@@ -168,6 +170,7 @@ struct mtk_dpi_conf {
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
 	bool clocked_by_hdmi;
+	bool output_1pixel;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -653,7 +656,13 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	if (dpi->conf->support_direct_pin) {
 		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 		mtk_dpi_config_2n_h_fre(dpi);
-		mtk_dpi_dual_edge(dpi);
+
+		/* DPI can connect to either an external bridge or the internal HDMI encoder */
+		if (dpi->conf->output_1pixel)
+			mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DPI_OUTPUT_1T1P_EN);
+		else
+			mtk_dpi_dual_edge(dpi);
+
 		mtk_dpi_config_disable_edge(dpi);
 	}
 	if (dpi->conf->input_2p_en_bit) {
-- 
2.48.1


