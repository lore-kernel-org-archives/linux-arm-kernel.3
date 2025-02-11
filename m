Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84262C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EaqzWw+XKu3xNxxNsokk75FFhKzQlDaEC6jaCXZAUU=; b=G6yy1LryY/OAlnqJWT99ktJRES
	xgRN2hRgT6WCahgXySwkciTwzs9rUQgnD5QqwNPEReoLq5LunwLIsL3I53LxE7OyL5PgyYxfpE9wp
	8dsC1diImtWaRnJjwxnfwbMmP4xngHTb+Qs1lj015AQSjitkRiZKJ6BbkPAQMf8DSKLR83KwdHadP
	RTmBxa9xipUyLn34ZFTbgJsFRsmrU/zGpbfLGiKK/hJtzd7hMi7Uik0JKu16TVG9ZNYwhW6VtmfBc
	7qW8bEuC27JAdJWI43j1MwIeY8RmOCTMoIJtpHqwAp9guJPhCFBK+MG9Q+D1IvUwI1dZxziAULMWU
	5t3pmNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thp5A-00000003hXF-0EKc;
	Tue, 11 Feb 2025 12:09:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoXZ-00000003Ywn-1uWm;
	Tue, 11 Feb 2025 11:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273696;
	bh=kf7X+pxQJNwIg7UytCaLA0aGpgaJkvxGyTDZBh2/08U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j1b8EuzlLbCYAP5oMvz6LtW0PkxXmM5sv0G/RTmig1Xk6QkdhJfB06cAERC3XfroH
	 5eST+SfhXtyNlf7G+EGAgJIInlv9ATPCm4UtQa5YuSdpEN07U0pFtVlmfhGwT9FxtD
	 J+3JXnZ3iSfpFqSpVwWXLSweREk5yqVOlJ2+/jUsbW51jyJ9wV6iTufnCjVxUV51oq
	 Nuc7tfZUE34GxBq6g86Lv9p8Agn9N4OIkv7OF4wHX9rGiRIOUdESiS3ldUvDlK+x1W
	 4s/QNiimRC9d47vF7ncbg8P5WC4X3BzBFkZDSfelgiU7LxgdQEqPef60uBQWf8pJ14
	 fNWeDynoV7glA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDFE717E154E;
	Tue, 11 Feb 2025 12:34:54 +0100 (CET)
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
Subject: [PATCH v6 24/42] drm/mediatek: mtk_hdmi: Use dev_err_probe() in mtk_hdmi_dt_parse_pdata()
Date: Tue, 11 Feb 2025 12:33:51 +0100
Message-ID: <20250211113409.1517534-25-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033457_668683_800531D0 
X-CRM114-Status: GOOD (  11.67  )
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
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 31 ++++++++++-------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 65e9629b6b77..6140b55c2830 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1372,25 +1372,19 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
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
@@ -1413,9 +1407,8 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
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
@@ -1443,20 +1436,16 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
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
2.48.1


