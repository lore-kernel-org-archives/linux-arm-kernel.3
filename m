Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1431EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoVRF44ArsE9CH9uDPlpGSrKRtCQyoVzHHwz+mFjoRo=; b=fY7sZtUFcKsXhiEf31iNcCtLXk
	RWrOK65gqK5af3iJitb/VusY0sO0MJkseh+YLx1htb/oa5UY4OfwcHqVXRwblZ673d60cqskmR36D
	MMRBf9r8fLNPKt3K9yU7ey3La4A5VaqiZdLCvJBe+JJTDcC6yCQXJrlvqRab2E2zpbm+wHlxCjU8J
	8LLczUWFKVzD3rtGrq85m/xH9yogsCeFnkz4Ki63ri5nSjWUDRCxmdMvio1Z8w/SkoGXS0WUO8cz3
	+iS0g5hwaMT4Gs42qQ/x6Wo9Xaa5f5r9LtYGRcLqv8EGn4dvbYJPxT8/aCKP8T86dXyPTACLerX4T
	AA5WEtPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whleX-00000001sGi-2jCf;
	Thu, 09 Jul 2026 10:06:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whleQ-00000001s2P-0OLm;
	Thu, 09 Jul 2026 10:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783591590;
	bh=h3lpz4bJd56r5DV0Q1lq80Z+80QK9a5R4P7aaY8+iEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jGGL/B8FtLmlhGuBOwJIugNqSo7iBqwq2E8SGvbVzzK1XhOP5YsKP1sU/m8nNF5gJ
	 iXuP7JRnd8vvz3Jbatg1tzATQ6HyBmq9pg4JdH5OGlTM8MVDAURWfGVxj+xjXP/WuL
	 ZHyrdD838RgCHJWMfs+PF/ENbNyv/IlVTCt4AMetAAFed40iqsMwwfqS81Hup4ReC6
	 C9OzNpuOfOjCJdIrM4z1Gh/IpmmO3IkV/cbpnej6ZOZzd6BCIttNtLh978wL3jeJkx
	 LXIGt2GbnpFeKtitSntkJAi261XzZpdqwr6vNBBNINlRt064sVgLAPRJkUXIvEmImd
	 xkYawdlrzZQcQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86FEC17E0CDE;
	Thu, 09 Jul 2026 12:06:29 +0200 (CEST)
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
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 07/11] drm/mediatek: mtk_dp: Add support for PHY from devicetree
Date: Thu,  9 Jul 2026 12:06:13 +0200
Message-ID: <20260709100617.42583-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
References: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_030639_049926_1A52958B 
X-CRM114-Status: GOOD (  17.84  )
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

Add support for specifying `phys` in devicetree to pass handle
to the DisplayPort PHY.

In order to retain compatibility with older devicetrees, check if
`phys` was specified: if not, initialize the regmap_mmio with the
legacy configuration and register the mediatek-dp-phy platform
device from this driver, and get the PHY calibration data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 50 ++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9c28616c6ada..34a72e0a5f1e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -426,6 +426,15 @@ static const struct regmap_config mtk_dp_regmap_legacy_config = {
 	.name = "mtk-dp-registers",
 };
 
+static const struct regmap_config mtk_dp_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = SEC_OFFSET + 0x90,
+	.name = "mtk-dp-registers",
+};
+
+
 static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dp, bridge);
@@ -1287,7 +1296,13 @@ static int mtk_dp_phy_configure(struct mtk_dp *mtk_dp,
 	if (ret)
 		return ret;
 
-	mtk_dp_set_calibration_data(mtk_dp);
+	/*
+	 * For legacy, deprecated strategy, set partial PHY calibration here.
+	 * New-style will set all PHY calibrations with phy ops instead.
+	 */
+	if (mtk_dp->phy_dev)
+		mtk_dp_set_calibration_data(mtk_dp);
+
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
 			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
 
@@ -2120,8 +2135,9 @@ static int mtk_dp_wait_hpd_asserted(struct drm_dp_aux *mtk_aux, unsigned long wa
 static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 			   struct platform_device *pdev)
 {
-	struct device_node *endpoint;
+	const struct regmap_config *regmap_cfg;
 	struct device *dev = &pdev->dev;
+	struct device_node *endpoint;
 	int ret;
 	void __iomem *base;
 	u32 linkrate;
@@ -2131,7 +2147,12 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	mtk_dp->regs = devm_regmap_init_mmio(dev, base, &mtk_dp_regmap_legacy_config);
+	if (!mtk_dp->legacy_regoff)
+		regmap_cfg = &mtk_dp_regmap_config;
+	else
+		regmap_cfg = &mtk_dp_regmap_legacy_config;
+
+	mtk_dp->regs = devm_regmap_init_mmio(dev, base, regmap_cfg);
 	if (IS_ERR(mtk_dp->regs))
 		return PTR_ERR(mtk_dp->regs);
 
@@ -2754,6 +2775,7 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 		return dev_err_probe(dev, ret,
 				     "Failed to add phy unregister devm action");
 
+	/* PHY calibration data is in mtk_dp only for legacy devicetree */
 	mtk_dp_get_calibration_data(mtk_dp);
 
 	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
@@ -2806,7 +2828,12 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->dev = dev;
 	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
-	mtk_dp->legacy_regoff = MTK_DP_TOP_OFFSET_LEGACY;
+
+	/* Prefer PHY from devicetree - if not found, this is legacy */
+	if (of_property_present(dev->of_node, "phys"))
+		mtk_dp->legacy_regoff = 0;
+	else
+		mtk_dp->legacy_regoff = MTK_DP_TOP_OFFSET_LEGACY;
 
 	ret = mtk_dp_dt_parse(mtk_dp, pdev);
 	if (ret)
@@ -2857,9 +2884,18 @@ static int mtk_dp_probe(struct platform_device *pdev)
 					     "Failed to register audio driver\n");
 	}
 
-	ret = mtk_dp_register_phy(mtk_dp);
-	if (ret)
-		return ret;
+	if (!mtk_dp->legacy_regoff) {
+		mtk_dp->phy = devm_phy_get(dev, NULL);
+		if (IS_ERR(mtk_dp->phy))
+			return dev_err_probe(dev, PTR_ERR(mtk_dp->phy),
+					     "Failed to get phy\n");
+
+		mtk_dp->phy_dev = NULL;
+	} else {
+		ret = mtk_dp_register_phy(mtk_dp);
+		if (ret)
+			return ret;
+	}
 
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
-- 
2.54.0


