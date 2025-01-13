Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81077C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhUVfMMTYJauRg3XrKrv3JUl9E4wOldVgtGT4NVB+XM=; b=qm4lUuiFWpX6glnSj7lrLd7QIz
	i+9+oObGUVV75xWw79shq/joDh/DRpwSIuwtv+wc1F5ZFEzE4Pe8nD1GKMELc3m6yE3eIZevfdSkV
	SmmIRMAJ23S0qC/lgS8EaiuU37ZRaQgTkoKV0dAZmaRvT0p6fcgqf38DHSfiidJiHfujsD8z0SWQu
	XkHiBsWyogUwHJjI5X2TgOAOZWhMBbM4RDXfaYEDoKHT/ELENS7p8JAdDMH+o+Q+kqtpV2BdZJj7j
	HK+HPy6BnCrbq2pme5vbepo2gKs3SyEsMEO8aa+HBDRHrZpwYYIG0pVw1cP2mNi+Vo2cICz9B1fg7
	F5wvKY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMTG-00000005fJn-19WE;
	Mon, 13 Jan 2025 15:35:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLol-00000005Ue7-4AE6;
	Mon, 13 Jan 2025 14:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736780006;
	bh=Z0C6RU/UFQ/2LerIYU7F1fsX9ksYLRpt0mYB5iHnerU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NVMbekawgO5pe+BiWih5M5vwZ4tE/w84LhwYF+OM5hgZmPz+D5Ud6bGxg7zi94rbE
	 f6TE9vzE5V6ZipSDz4QQGc0+qicbkCiNVfOit717v8HSJZe4Zjt/OpcMyHs5j8VDSn
	 DskJKPwm3UVOTjvPrL3G8gehZ+3JboaWVCBOPBk63qTbL7aGJGPM/UEK+jmfkUzmjw
	 4GlWlKOr+zROqfjvnjWQ4T+UcJB3I4AEwhXD2y8kwpo8aoxqNBuTnucgF4p2gBK2pG
	 fVKZw20OKJJ+3BTP/PX1zu5Y0rb1BgBfbSD2cbzhcrxfNMwDVEkRzmrLG0DUkOit1R
	 pzSl/zXuEe25Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E91A17E0F97;
	Mon, 13 Jan 2025 15:53:25 +0100 (CET)
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
Subject: [PATCH v5 33/34] drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
Date: Mon, 13 Jan 2025 15:52:31 +0100
Message-ID: <20250113145232.227674-34-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065328_195894_615A4204 
X-CRM114-Status: GOOD (  10.39  )
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

Add an interlace_allowed bool member to struct mtk_hdmi_ver_conf
which will be used to signal whether interlaced modes are supported
by the bridge (in our case, the HDMI IP), and enable it for HDMIv2.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 1804fe3f986c..be9b7a8e4a87 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -428,6 +428,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
+	hdmi->bridge.interlace_allowed = ver_conf->interlace_allowed;
 
 	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index e74fe1371324..de5e064585f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -137,6 +137,7 @@ struct mtk_hdmi_ver_conf {
 	const struct hdmi_codec_ops *codec_ops;
 	const char * const *mtk_hdmi_clock_names;
 	int num_clocks;
+	bool interlace_allowed;
 };
 
 struct mtk_hdmi_conf {
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c97c77947c14..5145698158f6 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1292,6 +1292,7 @@ static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
 	.codec_ops = &mtk_hdmi_v2_audio_codec_ops,
 	.mtk_hdmi_clock_names = mtk_hdmi_v2_clk_names,
 	.num_clocks = MTK_HDMI_V2_CLK_COUNT,
+	.interlace_allowed = true,
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8188 = {
-- 
2.47.0


