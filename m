Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817C3CCF9E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bZwQE1mDLxxBUztNfabbjy7cB4vdwWjP483jhBdGyk=; b=j7wscqduuFQ8Ka3YpeND8pZ2Lm
	r3UQ5WS+5BzcE9JlXfE2Sk6qmpUL1z5Hz9ZFtyXAe2SK7JozMXlLV9S9AsbSqn54P1Vzce4Ev7CaY
	wZkOZbBfPqOupbTc8INvTBeltPD0/mCJtcoBA7tDZUagozvZGVgHiShoxQNzyu1+UKBPJ5OSDB22I
	IinubWjPKLg7mlMmEOCWjuRgajTg65b4tYQiUXGtyh2GTHmG5RRJ0jyuWD9tRJciwc30fqazKiBSq
	wfpS0mddFoJ1l4fzQ3K2TT0/wZ2UcQuRkJGCOrxTCqjC5Cy3jU5Mq2PON3MmM0DI2WrJhIMVxPz7Q
	0ompFiZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBscr-00000005txM-3jN1;
	Thu, 23 Oct 2025 10:32:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBscd-00000005tfZ-0CWs;
	Thu, 23 Oct 2025 10:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761215560;
	bh=2TvyPNu5cV/JCHhXd+tdUMa2Nikg4o/N2eX/6kKMUgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hTLoDbA530MyfqP/4CvgwzB3UJQV4u42GROKhiGJ2Y5BiUrpoQT17G2P4E25bBRZE
	 NecbwTJbcmuRFlHLKADrclWIVC45hvGy5Z4112vllDkXKUgJ/SaxqwWj2W263mp/gR
	 7/U33Ms17D7E/r40Aw6zfkft2LRiRjQm/wGfKXpOoZSfedgDLP/QAg4U2EMZt7MoQv
	 ewGMKCETt95NVedCC/0lNUTvVt7hxXktdiiDd8S7nT3gblxZ6bgrXei6ZBKD68nFeI
	 3daDv7VxDLTtcr3soHK2guCv3lOuNyI01N2eC99bAy/YqTb+q3QMnv0nxJXi/IAIye
	 TlQQV3R7XVstg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68A4E17E130E;
	Thu, 23 Oct 2025 12:32:40 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 23 Oct 2025 12:32:29 +0200
Subject: [PATCH v11 03/11] drm/mediatek: mtk_hdmi: Add HDMI IP version
 configuration to pdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mediatek-drm-hdmi-v2-v11-3-7873ec4a1edf@collabora.com>
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761215558; l=4617;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CNzDQZUPfHkkGk9x3Fo653c/NXrVNJlS94gq9smHrvE=;
 b=RGr+Pmbu0/cLV1w6U8EuGSUewM9zFigYDZQX4DumOKkfv1OYz5TYBqmkSo1efjZttCe7Pskcm
 5+/uZM0ljGTAdt1dMGtYYUUAojllNb+Glp/vXOasOwqwt3oYo5SA6sA
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_033243_237888_8D9178C5 
X-CRM114-Status: GOOD (  17.45  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding a driver for the HDMIv2 IP and before
moving the common bits out of this driver, add a new structure
`mtk_hdmi_ver_conf`, holding pointers to HDMI IP version specific
drm_bridge_funcs, hdmi_codec_ops and clock array used for probe,
and nest it into the mtk_hdmi_conf platform data structure.

While at it, also convert all of the direct users of
mtk_hdmi_bridge_funcs, mtk_hdmi_audio_codec_ops, mtk_hdmi_clk_names
to use pointers from the ver_conf platform data.

In order to do so, it was also necessary to fill a new version 1
specific const `mtk_hdmi_v1_ver_conf` and assign it to all of the
currently supported compatibles for this driver.

This commit brings no functional change.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 45 ++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 691e0011a8f99093655270e214717d74d1ca7121..42edf9cffa88c3191df5163b98e4b320e348d69e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -144,7 +144,15 @@ struct hdmi_audio_param {
 	struct hdmi_codec_params codec_params;
 };
 
+struct mtk_hdmi_ver_conf {
+	const struct drm_bridge_funcs *bridge_funcs;
+	const struct hdmi_codec_ops *codec_ops;
+	const char * const *mtk_hdmi_clock_names;
+	int num_clocks;
+};
+
 struct mtk_hdmi_conf {
+	const struct mtk_hdmi_ver_conf *ver_conf;
 	bool tz_disabled;
 	bool cea_modes_only;
 	unsigned long max_mode_clock;
@@ -1602,7 +1610,7 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 	struct hdmi_codec_pdata codec_data = {
-		.ops = &mtk_hdmi_audio_codec_ops,
+		.ops = hdmi->conf->ver_conf->codec_ops,
 		.max_i2s_channels = 2,
 		.i2s = 1,
 		.data = hdmi,
@@ -1635,24 +1643,32 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 
 static int mtk_hdmi_probe(struct platform_device *pdev)
 {
+	const struct mtk_hdmi_ver_conf *ver_conf;
+	const struct mtk_hdmi_conf *hdmi_conf;
 	struct mtk_hdmi *hdmi;
 	struct device *dev = &pdev->dev;
-	const int num_clocks = MTK_HDMI_CLK_COUNT;
 	int ret;
 
+	hdmi_conf = of_device_get_match_data(dev);
+	if (!hdmi_conf)
+		return -ENODEV;
+
+	ver_conf = hdmi_conf->ver_conf;
+
 	hdmi = devm_drm_bridge_alloc(dev, struct mtk_hdmi, bridge,
-				     &mtk_hdmi_bridge_funcs);
+				     ver_conf->bridge_funcs);
 	if (IS_ERR(hdmi))
 		return PTR_ERR(hdmi);
 
 	hdmi->dev = dev;
-	hdmi->conf = of_device_get_match_data(dev);
+	hdmi->conf = hdmi_conf;
 
-	hdmi->clk = devm_kcalloc(dev, num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
+	hdmi->clk = devm_kcalloc(dev, ver_conf->num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
 	if (!hdmi->clk)
 		return -ENOMEM;
 
-	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names, num_clocks);
+	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, ver_conf->mtk_hdmi_clock_names,
+				      ver_conf->num_clocks);
 	if (ret)
 		return ret;
 
@@ -1713,19 +1729,32 @@ static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
 
+static const struct mtk_hdmi_ver_conf mtk_hdmi_v1_ver_conf = {
+	.bridge_funcs = &mtk_hdmi_bridge_funcs,
+	.codec_ops = &mtk_hdmi_audio_codec_ops,
+	.mtk_hdmi_clock_names = mtk_hdmi_clk_names,
+	.num_clocks = ARRAY_SIZE(mtk_hdmi_clk_names)
+};
+
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
-	.max_mode_clock = 148500,
 	.cea_modes_only = true,
+	.max_mode_clock = 148500,
+	.ver_conf = &mtk_hdmi_v1_ver_conf
+};
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173 = {
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
 
 static const struct of_device_id mtk_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi", .data = &mtk_hdmi_conf_mt2701 },
 	{ .compatible = "mediatek,mt8167-hdmi", .data = &mtk_hdmi_conf_mt8167 },
-	{ .compatible = "mediatek,mt8173-hdmi" },
+	{ .compatible = "mediatek,mt8173-hdmi", .data = &mtk_hdmi_conf_mt8173 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);

-- 
2.51.0


