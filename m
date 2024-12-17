Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E73E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBKlNwYATTlYgYLXLMDZ+I9+8TNsxYv93tm2pr4y7yM=; b=zZkvY63JYCIJl5KDQ9hOPxMEbv
	+B2ze4CO7RXPB5NpKd0SlVF04qc8yHHCx2iknFIoqYm7EBC7W+XmA5LRxU3zyvHRkayRFfiqgP/FK
	R+rapk70bt6swEkaeyJYD6Qiau4mrUW1rmGYmpWtHljv1Hb9orfA5uPrM/07Zh/I/SvQdW9R/+K5L
	n8JcfKfcifIBkXKQz0eWDJ+cOkRsKme1vbsY384MbDIPAyc+KtGsRb/C1vyUM2UMuWZ9AO7i+V9ru
	Ci2bkJHuc3t9GicZxtlfV5WkpDL29D9ET5S48Q9vGNLKUR/a6fqZooJw7twBtIfQ+4ITz5j4NWuOG
	Hv0NHZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNa6M-0000000E5dV-3Tv7;
	Tue, 17 Dec 2024 16:07:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZkC-0000000E06B-3kUm;
	Tue, 17 Dec 2024 15:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450259;
	bh=xvqKAlwxZi5qMu/HhzZvjBB2nmVM7/aMNaTJlpT98iY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SvNVIkGLkBS5bE7e/Pw4Af1qqvKKE3V0AexhP6DAih7ilYSyGjq9ThGme4gjsRC1g
	 vrME19hUEKWr11FnboIlS3UXfKmbbfRUsU4KN2rwW05hSuUll1GfTS+u2yxZ5u3HLT
	 XbCPSPcykO9kRAX9Gzp3V+bmZkQkRSftW4SwHVBwRQ/hgJ4EuMFtees+9IWLPdhII6
	 H0D3a1Y044hLsyWaNR84n9V2WkZNYSiVGj3andujZYIFal20ekDGuy6TS/PbFvJN9c
	 f3TWxQalODnkcMZEY78mnX9vBKHHYeNapcSvaQAZH6Iylxu1JOHfB+mWXTFBTh2H2r
	 ULRqAA5KQQhmg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 364E917E37CB;
	Tue, 17 Dec 2024 16:44:18 +0100 (CET)
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
	dmitry.baryshkov@linaro.org
Subject: [PATCH v3 20/33] drm/mediatek: mtk_hdmi: Move CEC device parsing in new function
Date: Tue, 17 Dec 2024 16:43:32 +0100
Message-ID: <20241217154345.276919-21-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074421_098307_43142BE5 
X-CRM114-Status: GOOD (  15.85  )
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

Move the CEC device parsing logic to a new function called
mtk_hdmi_get_cec_dev(), and move the parsing action to the end
of mtk_hdmi_dt_parse_pdata(), allowing to remove gotos in this
function, reducing code size and improving readability.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 84 ++++++++++++++---------------
 1 file changed, 40 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c20d42ec387a..c95c7b55998c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1367,24 +1367,16 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.edid_read = mtk_hdmi_bridge_edid_read,
 };
 
-static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-				   struct platform_device *pdev)
+static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *remote, *i2c_np;
 	struct platform_device *cec_pdev;
-	struct regmap *regmap;
+	struct device_node *cec_np;
 	int ret;
 
-	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get clocks\n");
-
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
 	if (!cec_np)
-		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
+		return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
@@ -1393,65 +1385,69 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 		return -EPROBE_DEFER;
 	}
 	of_node_put(cec_np);
-	hdmi->cec_dev = &cec_pdev->dev;
 
 	/*
 	 * The mediatek,syscon-hdmi property contains a phandle link to the
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
 	 * registers it contains.
 	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
-					 &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err_probe(dev, ret,
-			      "Failed to get system configuration registers\n");
-		goto put_device;
-	}
-	hdmi->sys_regmap = regmap;
+	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
+	if (IS_ERR(hdmi->sys_regmap))
+		return PTR_ERR(hdmi->sys_regmap);
+
+	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get system configuration registers\n");
+
+	hdmi->cec_dev = &cec_pdev->dev;
+	return 0;
+}
+
+static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
+				   struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *remote, *i2c_np;
+	int ret;
+
+	ret = mtk_hdmi_get_all_clk(hdmi, np);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	hdmi->regs = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(hdmi->regs)) {
-		ret = PTR_ERR(hdmi->regs);
-		goto put_device;
-	}
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
 
 	remote = of_graph_get_remote_node(np, 1, 0);
-	if (!remote) {
-		ret = -EINVAL;
-		goto put_device;
-	}
+	if (!remote)
+		return -EINVAL;
 
 	if (!of_device_is_compatible(remote, "hdmi-connector")) {
 		hdmi->next_bridge = of_drm_find_bridge(remote);
 		if (!hdmi->next_bridge) {
 			dev_err(dev, "Waiting for external bridge\n");
 			of_node_put(remote);
-			ret = -EPROBE_DEFER;
-			goto put_device;
+			return -EPROBE_DEFER;
 		}
 	}
 
 	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
 	of_node_put(remote);
-	if (!i2c_np) {
-		ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
-		goto put_device;
-	}
+	if (!i2c_np)
+		return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
 
 	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
-	if (!hdmi->ddc_adpt) {
-		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
-		goto put_device;
-	}
+	if (!hdmi->ddc_adpt)
+		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
+
+	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
+	if (ret)
+		return ret;
 
 	return 0;
-put_device:
-	put_device(hdmi->cec_dev);
-	return ret;
 }
 
 /*
-- 
2.47.0


