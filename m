Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D96E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5jahKz2BpqiOE2DPQn0yqLFmRewC3MUyXH5wVOWTyU=; b=WDevHA0puzfiO2BDmcgkwJHeIg
	ihv4ij+JTE0fujeBRtriJiU/Kl00WkN20J/bZI9tY8JFp4VDzQDEnPLJ9Odlqig6Kcy7PD89HWZIx
	3YFSgMzXjrU/LPd3qlgJRE1js00I/REvXQRSk6OpP7bOipsD5E3qVX/rYuTYWMaRYIrAzujXm6Y5Q
	PpL5vegwGoXAJNncobtBtro5zvZIvngULPrjjqKqIQEIDjGX8Q2PZ2dpJARp4jpiyVzCoXTfcM4Es
	0mOPlkgj6W56MrcObAr2H5GtzDrynV5m7p96/iqtbiJWNPedO7vVCnLY8RqU2s4JqPUOQykCqjuGe
	LxXD44xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUsI-00000008MW2-4BVZ;
	Wed, 08 Jan 2025 12:09:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUF0-00000008Cjc-0vs6;
	Wed, 08 Jan 2025 11:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736335728;
	bh=bW2Q6udBnRutTIp7P/AXDgwZQ5xd7Fw9EAFVpMVD/h8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7J0Je0wR0Zfag4/Jukwcuaeotpoc4pFYpgLl76poBJii2yPzocqc5SpEg3QzFLZ8
	 Fe64fr4l0Mlu5hz1OPfLConW6Qeu1Pg02zIiquCv36Wlfg6MqMzGiGgu9CXx9hEJ2C
	 GGUprBfI1uYM/V2JvsMHaZYjbyuX94oj4Hkl8qdlmSztyvufu++wsRd54Dc+QoAdJ0
	 h9hGuWX0g2Edr2HkeZvTfeAF5VbZEQ0ntCE2faX3QCXZYPjS97Jdg3fnIMdxFsY4mx
	 yT0yiX2PVerLtXShH5VkS/H2Y+DHShlP0qmhc/Olg59Yomr/65hDqrL0WrGbkW1wIm
	 Rq3EEkI0iHNvg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C44C17E157C;
	Wed,  8 Jan 2025 12:28:47 +0100 (CET)
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
Subject: [PATCH v4 33/34] drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
Date: Wed,  8 Jan 2025 12:27:43 +0100
Message-ID: <20250108112744.64686-34-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_032850_430614_A841B84E 
X-CRM114-Status: GOOD (  11.94  )
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
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

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
index 4cecfef1466b..8841fa4e476a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1301,7 +1301,8 @@ static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
 	.bridge_funcs = &mtk_v2_hdmi_bridge_funcs,
 	.codec_ops = &mtk_hdmi_v2_audio_codec_ops,
 	.mtk_hdmi_clock_names = mtk_hdmi_v2_clk_names,
-	.num_clocks = MTK_HDMI_V2_CLK_COUNT
+	.num_clocks = MTK_HDMI_V2_CLK_COUNT,
+	.interlace_allowed = true
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8188 = {
-- 
2.47.0


