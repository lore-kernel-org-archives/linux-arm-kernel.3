Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A362E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pk7EQzDB1i9l7VKHdFESbo+QRn6uUY1d9V16g70hjBg=; b=V/HRTEDok3NnRpgNLNsB0mvVTv
	E4KlD+D7ZyuJVg2pyP6y+5fBGhB+RTLa6cUra8uo3UDzdgBt9ASRl6CNr1ZMqU2kKyCsc7ooSpctG
	hbPyZmmtx2HiGJ2CSG13VgCPrn26dAXolvStMY9+qSrkB0sjM6gJXux+yS+DC1ACF8MYOLYsB5d4k
	WcCy1OaQP/qUs2np+hmpFoelPaFU9J5gxj7PfRq7lyF/nEwbcVXI7LYN6MAPaMe7fw51HN955p9Sc
	B95VLyGyyq5CszCtGTPTbYmMGHgDYtg8y57+tFd/pNiaZGqDnjUlg9tn5IDmrc+JBZ5e5p1sdlmBb
	47ER83cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUd2-00000008J69-0LvU;
	Wed, 08 Jan 2025 11:53:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUEg-00000008CU2-1OtS;
	Wed, 08 Jan 2025 11:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736335708;
	bh=MGDi6G7IlxIfQ4rsQ/pnsjcLKxBBNMus5UhZPN3ufAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IbvtME0yaOgcoHUj45xF434rhDzaWRlGIVvcw2FkPfMQUQ9aQ8lcd+Z1SffXRtPhI
	 tm2HXZo+cEC8M/qoJBbKWcn5jmDimEMZsYSAasl+t2i5c83ihnuICmkaniKczkbVYQ
	 wNgJHvs84yoYciCCJ1+zSbF7mNC28cd4EXtpSF9XLRBsMABMKYEXgXMG90/cSoRt8g
	 zumD37PHUmhWF7kmKEK6zMATIShhQ2Jd4kWSU8OY0MF6Q/rERZl1zmqc7oRDmGgQ65
	 gJzVNnKicXLwycCbXVKBpjH9Q5qK5Y5VchxWBwHDonbF0uuaqdo7WXsUVSj5vyMt9e
	 kjLZjoKfZlZrg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89AEB17E158A;
	Wed,  8 Jan 2025 12:28:27 +0100 (CET)
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
Subject: [PATCH v4 20/34] drm/mediatek: mtk_hdmi: Use dev_err_probe() in mtk_hdmi_dt_parse_pdata()
Date: Wed,  8 Jan 2025 12:27:30 +0100
Message-ID: <20250108112744.64686-21-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_032830_535850_C1B30B3D 
X-CRM114-Status: GOOD (  12.61  )
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

Change error prints to use dev_err_probe() instead of dev_err()
where possible in function mtk_hdmi_dt_parse_pdata(), used only
during device probe.
While at it, also beautify some prints.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 34 ++++++++++-------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index cde5f1f7e9e0..42e6d1f64ab3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1372,30 +1372,23 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *cec_np, *remote, *i2c_np;
+	struct device_node *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clocks: %d\n", ret);
-
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	/* The CEC module handles HDMI hotplug detection */
 	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
+	if (!cec_np)
+		return dev_err_probe(dev, -EINVAL, "Failed to find CEC node\n");
 
 	cec_pdev = of_find_device_by_node(cec_np);
 	if (!cec_pdev) {
-		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
-			cec_np);
+		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
 		of_node_put(cec_np);
 		return -EPROBE_DEFER;
 	}
@@ -1413,9 +1406,8 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	if (IS_ERR(regmap))
 		ret = PTR_ERR(regmap);
 	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
+		dev_err_probe(dev, ret,
+			      "Failed to get system configuration registers\n");
 		goto put_device;
 	}
 	hdmi->sys_regmap = regmap;
@@ -1443,20 +1435,16 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 
 	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
+	of_node_put(remote);
 	if (!i2c_np) {
-		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
-			remote);
-		of_node_put(remote);
-		ret = -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
 		goto put_device;
 	}
-	of_node_put(remote);
 
 	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
 	of_node_put(i2c_np);
 	if (!hdmi->ddc_adpt) {
-		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		ret = -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
 		goto put_device;
 	}
 
-- 
2.47.0


