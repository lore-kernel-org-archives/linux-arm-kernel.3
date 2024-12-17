Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFF0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IVR9gKX3CV9FUyqvPyNNgolIj/zrXvPdEwtkZlxvi8=; b=dkYggf7KnxjdB5pL9cq9CfMhHy
	5H0F6JUra8haFmwqwpN83sdXgSu/8NyhrNI8pfpdaceGPHTALHRZkyZsfnV4sXiSY3xB7csTXR4v6
	/hizviy3mz8s8JFGA6nJSXVa0f5ZdSk3raoDlIv3SvjzIAdv8i6IOYnLnFeksxI49wcgyezB+Hht3
	6AX5kglWrZXtoz0aL6fq4+z2BWnxWxJlaEwLQQv/vEdXOridhBPlfpDOXDCHF0nLT0pxqxD+pSFLl
	SJz97/Q8H+OI0QZtATecMQ00rMjAS+EYT1gyo/zcozN9vfh5T6z25NEGSZ7EwmjKBuDrExeePYOtT
	YqwRMQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaIW-0000000E8nP-2eSy;
	Tue, 17 Dec 2024 16:19:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZkT-0000000E0GK-3jXV;
	Tue, 17 Dec 2024 15:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450276;
	bh=UPu5+U2SrWMYuB7B0mVnuDcO6l+LeV5HbYYzwuaF9f4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ixeHbIhXHNOP0gaI+PPy5cMplGoeNhH6sMA+Yfl6j4TBzd4H3+WQrjeCy+7gTSql6
	 U5KxMNsE/AYbwgKbalMGRa3EW+zdzzlIZO+cp55ZOlINVnd0svpLjOoXUt5vwTNEgy
	 qj5+RqfK7dPGQiQ3rdTyFyYveDpvei5MvB7VflXQuNm/Kb3tzrH0sc+Nqwv7M/528D
	 DEFx7dWAXDx6b+1AZ/+FhPEzRV2OvJ99jnV6Uo5KPEwjT4/tJWX1oJrXlL6rFrJ/of
	 qFwv9OKaVtmhRiYIqu6Ma/cx9/nbZ6twShc8oaB0ESGlg2urpiyQtxfxvKkNS7pTjH
	 Q36GFqEn8iqug==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6124017E37A4;
	Tue, 17 Dec 2024 16:44:35 +0100 (CET)
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
Subject: [PATCH v3 32/33] drm/mediatek: mtk_hdmi_common: Add var to enable interlaced modes
Date: Tue, 17 Dec 2024 16:43:44 +0100
Message-ID: <20241217154345.276919-33-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074438_080931_950494CA 
X-CRM114-Status: GOOD (  11.86  )
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
index c076e4efcd29..40b4b1d1c837 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -424,6 +424,7 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
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
index c71ecc3c1711..5b708fcc0e03 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1306,7 +1306,8 @@ static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
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


