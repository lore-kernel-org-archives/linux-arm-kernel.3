Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE84C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVC7TxDZCYbcVE0By/twP8ifnGmWpBKOF+jIQuzxUus=; b=OE6WKQgqVqNpRXGHwujv3oNu9l
	gWwijgfuQjG8d2ys3jDvC27iEV+JvScajUak1UakRDCHGA8++VH/xjPgUbmcuMFb16nZMQNAzHf+F
	T8uLl3TZ2BpD+wdMQ2LgVIDYMiuL25buIvmlD1cWxyuFoqbrA1s2mFlcdrTNsrLsPwqMt2MDDP5yU
	B+FKPisfwWBl0hyr46ts0B32PvsqH/rHryJeJ4zPXNuiUBN+3SVtTlrFj2rY7kfTULsLN7nqbnVjD
	0Mk9Rc7mN/l1HkB7tEZHxJ4jNfxA+8zaWRzP9AD4JqznnyGgu3p9eaxKE2C0f1slMNcMf7pQvDfKw
	pLEiZkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4sy-00000005Rop-3SBi;
	Mon, 17 Feb 2025 17:26:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3NA-00000005831-2RmQ;
	Mon, 17 Feb 2025 15:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807367;
	bh=ILRG7JLcjLGUI329ImFMsEOeEnrgM3T3qZx9A4pBXUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gg2r9hrhUhSyL5I7Egeze6OAy+POXJVEeNylA9jB80Ioj+/4Rb2goIycS13k1c2ep
	 gA+IAOafOcNWTYdAmOWMIyRzGp2fsMlw+L3gPEEUvRGg19wFilWfk/bnNYxXsqhhDv
	 oY0I6Xle5Fp7W6ajqhanIPb56XhAllIBC2LxmQFu+maNiYij+SCei9AtukUnzXSBl+
	 TwAJMhWERip7EZJpUaGlX40AQVV3DQn43aJh/k0HDUbGWCOgHPMSl1goSCCx+zo89f
	 exnhFNLat88gW/s7o6lTZadebxJGuAlCW5WioWjXmXUFTq2Sx12eVBhaGTWpICBQUu
	 ddcxJWQlTFiEA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D75D417E1568;
	Mon, 17 Feb 2025 16:49:25 +0100 (CET)
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
Subject: [PATCH v7 07/43] drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
Date: Mon, 17 Feb 2025 16:48:00 +0100
Message-ID: <20250217154836.108895-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074928_774844_157E210B 
X-CRM114-Status: GOOD (  13.73  )
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

On some SoCs, like MT8195 and MT8188, the DPI instance that is
reserved to the HDMI Transmitter uses a different clock topology.

In this case, the DPI is clocked by the HDMI IP, and this outputs
its clock to the MM input of dpi_pixel_clk, which is essential to
enable register access to the DPI IP.

Add a `clocked_by_hdmi` member to struct mtk_dpi_conf, and check
it to avoid enabling the DPI clocks in the mediatek-drm internal
.start() callback (and avoid disabing in the .stop() component
callback): this will make sure that the clock configuration
sequence is respected during display pipeline setup by following
the bridge ops between DPI and HDMI, where the HDMI driver is
expected to enable the clocks in the bridge's pre_enable(), and
DPI in the enable() cb.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 9a6c0f75f764..9f83e82437dd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -145,6 +145,8 @@ struct mtk_dpi_factor {
                      If present, implies that the feature must be enabled.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
+ * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock, needed
+ *		     for DPI registers access.
  */
 struct mtk_dpi_conf {
 	const struct mtk_dpi_factor *dpi_factor;
@@ -165,6 +167,7 @@ struct mtk_dpi_conf {
 	u32 input_2p_en_bit;
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
+	bool clocked_by_hdmi;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -585,7 +588,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	struct videomode vm = { 0 };
 
 	drm_display_mode_to_videomode(mode, &vm);
-	mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
+
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
 
 	dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
 	dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
@@ -920,14 +925,16 @@ void mtk_dpi_start(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_on(dpi);
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_power_on(dpi);
 }
 
 void mtk_dpi_stop(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_off(dpi);
+	if (!dpi->conf->clocked_by_hdmi)
+		mtk_dpi_power_off(dpi);
 }
 
 unsigned int mtk_dpi_encoder_index(struct device *dev)
-- 
2.48.1


