Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF236E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kNNrLqf0ZlBjthUACNKN3BHsL3NeSU6BjntcOYhcw4=; b=Ttxg1xmjS90M2z3MC2CNgjO0WT
	cEyOq4o6mm0qXJnqlaRU9ng/DPzVHkCuZJ7vv0K/tSVGPSRb1IiBfZpWJSnsj3FGU/MHuJ3hypWVK
	+aSSNcpN5erZlKF2oouseiNR0eUWemi4Kb6VxCJIbwBfwn524CWnGltoXmr/dtq8av2uJ6QwZiYQF
	oenuTfoVJASWBbX0VLQbfv2O9wM/uvRVacQ9I3g2OBljPwFsXStOZnZfwdbdcE0h12qTMqmmo26VY
	E1UYue52f0gi6uubdz/N8HoYLTsn6liZv1cqfNUxqAFqARlqvX+XeGd/ZD4DUF+3jW21F2AACrTmK
	ryEBZicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUmS-00000008Lb2-0bNN;
	Wed, 08 Jan 2025 12:03:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUEs-00000008CdZ-1coW;
	Wed, 08 Jan 2025 11:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736335721;
	bh=vhBJeUADe5NUy5U8vBGHdOLg0cJ/qXRMlZ3r17v8nn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I0tybm9ronhC1gkwib4KV8+ejaCFMSFlUbR62V1Ly14KMsW58iuj6xoCAIIO9m9sI
	 FNOr7Q47WTPSwxE9e1YGPt2NbcplrrSHyvv6MSBsIeYa3GRXijvM3+7Olql+fQzs4B
	 DR5PznPbXpgyev9NXwYKeqt62DeZ73+s+C7jmlJATRxE6j/5w4WZQ80qEo4uZW41oK
	 5dIUcLGCMBzw0chue0Tet+dXGp5+XeQL+NKC428PLuoHFPJt2+87lHfmuxonKa+wKo
	 ddrCc9+9+aMk0fj52fL6ToyPwyOyzveOHc7QT4j9l/w5QeAAn3BIhcTF5Dz0er9WBX
	 GdzS1B5VS8VIQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C05F817E157A;
	Wed,  8 Jan 2025 12:28:39 +0100 (CET)
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
Subject: [PATCH v4 28/34] drm/mediatek: mtk_hdmi: Improve mtk_hdmi_get_all_clk() flexibility
Date: Wed,  8 Jan 2025 12:27:38 +0100
Message-ID: <20250108112744.64686-29-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_032842_569167_D27ABFB8 
X-CRM114-Status: GOOD (  16.83  )
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

In preparation for splitting common bits of this driver and for
introducing a new version of the MediaTek HDMI Encoder IP, improve
the flexibility	of function mtk_hdmi_get_all_clk() by adding a
pointer to the clock names array and size of it to its parameters.

Also change the array of struct clock pointers in the mtk_hdmi
structure to be dynamically allocated, and allocate it in probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a14b117286ad..62927e7cf790 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -159,7 +159,7 @@ struct mtk_hdmi {
 	struct phy *phy;
 	struct device *cec_dev;
 	struct i2c_adapter *ddc_adpt;
-	struct clk *clk[MTK_HDMI_CLK_COUNT];
+	struct clk **clk;
 	struct drm_display_mode mode;
 	bool dvi_mode;
 	struct regmap *sys_regmap;
@@ -1072,17 +1072,18 @@ static const char * const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] = {
 	[MTK_HDMI_CLK_AUD_SPDIF] = "spdif",
 };
 
-static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi,
-				struct device_node *np)
+static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+				const char * const *clock_names, size_t num_clocks)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
-		hdmi->clk[i] = of_clk_get_by_name(np,
-						  mtk_hdmi_clk_names[i]);
+	for (i = 0; i < num_clocks; i++) {
+		hdmi->clk[i] = of_clk_get_by_name(np, clock_names[i]);
+
 		if (IS_ERR(hdmi->clk[i]))
 			return PTR_ERR(hdmi->clk[i]);
 	}
+
 	return 0;
 }
 
@@ -1381,15 +1382,15 @@ static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struc
 	return 0;
 }
 
-static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-				   struct platform_device *pdev)
+static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
+				   const char * const *clk_names, size_t num_clocks)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote, *i2c_np;
 	int ret;
 
-	ret = mtk_hdmi_get_all_clk(hdmi, np);
+	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
@@ -1638,6 +1639,7 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi;
 	struct device *dev = &pdev->dev;
+	const int num_clocks = MTK_HDMI_CLK_COUNT;
 	int ret;
 
 	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
@@ -1647,7 +1649,11 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	hdmi->dev = dev;
 	hdmi->conf = of_device_get_match_data(dev);
 
-	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
+	hdmi->clk = devm_kcalloc(dev, num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
+	if (!hdmi->clk)
+		return -ENOMEM;
+
+	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names, num_clocks);
 	if (ret)
 		return ret;
 
-- 
2.47.0


