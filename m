Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D915E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4ur/fe//qoNZvKYeWZdsKYHeBqlhDp4hFCSTheX8iI=; b=07MFhCI7cB9+2awxhmT+5xR4gY
	djooxKdHfUuiM1opl52PhxYpsMacMVKwR4X3bVXmJMRZAL5fxMa4nylqEV6Yng9QtM27dHXEEF39c
	LoF6PARSZLHSfHZjV0r47GiKu7hyFtm+w4gcM1EJwRLdQ8hZnz9aILzLHTQPXRN6bV8mmR1ZbvLsA
	gtccraREaTKnE8ueOxkFvW22MMRO6ickInPzZtu+yLQ5q8xsaxAaZCfk+i7pKiuO03F5znwOpj9lQ
	gsqRoerHxDTyxjSPczR8EMiYLJ+ssXz6/uzc+xd6s5v/SNbi5+Swlb0iZUH9C+dygYqwF7NpyOoNh
	qclj6UTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZwh-0000000E3IX-43Lv;
	Tue, 17 Dec 2024 15:57:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZk0-0000000DzvZ-08sb;
	Tue, 17 Dec 2024 15:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450246;
	bh=Z+9XCQXqww8E1v5WxQ3JEwgLLVJQhwLlXiI1sp1XKxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TA12z7Ut8AGv+aFs7jVhad//ZmUzxDGR+XmS01p/eOVne4pz68np3uEYsOgnIgtb2
	 nY/5FdQKuvtdZLrHaZ2xQBmRXE4fZdvmL3sO9Jmh9lPKrF3w8lKVILuvmuJHeNvJw6
	 bAb+QbpAV0bCJb3ifJ8VwVyQhEZ9EN8mBlQoz9wNTHtyR7kuoAyllrIkd4jxDurXwI
	 gafi0T4yLKaLJoTbCSLc0BvrCW/l9k6GKGNf4MRtoCr+XMVsdtRMMUygVRsFXd0zN2
	 qKxfZN7uQXCChjYe91MOkbfLF6nueh7BSCqfEucH+BsT3CHJ5UXsEjBPl5FuPPb39T
	 lklPksnSCZlkA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42AF717E37C1;
	Tue, 17 Dec 2024 16:44:05 +0100 (CET)
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
Subject: [PATCH v3 11/33] drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
Date: Tue, 17 Dec 2024 16:43:23 +0100
Message-ID: <20241217154345.276919-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074408_242274_D6873F5B 
X-CRM114-Status: GOOD (  17.02  )
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

The probe function of this driver may fail after registering the
audio platform device: in that case, the state is not getting
cleaned up, leaving this device registered.

Adding up to the mix, should the probe function of this driver
return a probe deferral for N times, we're registering up to N
audio platform devices and, again, never freeing them up.

To fix this, add a pointer to the audio platform device in the
mtk_hdmi structure, and add a devm action to unregister it upon
driver removal or probe failure.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 59a8a81fa0ec..9131c2fdfba8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -172,6 +172,7 @@ struct mtk_hdmi {
 	unsigned int sys_offset;
 	void __iomem *regs;
 	enum hdmi_colorspace csp;
+	struct platform_device *audio_pdev;
 	struct hdmi_audio_param aud_param;
 	bool audio_enable;
 	bool powered;
@@ -1662,6 +1663,11 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.no_capture_mute = 1,
 };
 
+static void mtk_hdmi_unregister_audio_driver(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
@@ -1671,13 +1677,22 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 		.i2s = 1,
 		.data = hdmi,
 	};
-	struct platform_device *pdev;
+	int ret;
 
-	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					     PLATFORM_DEVID_AUTO, &codec_data,
-					     sizeof(codec_data));
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	hdmi->audio_pdev = platform_device_register_data(dev,
+							 HDMI_CODEC_DRV_NAME,
+							 PLATFORM_DEVID_AUTO,
+							 &codec_data,
+							 sizeof(codec_data));
+	if (IS_ERR(hdmi->audio_pdev))
+		return PTR_ERR(hdmi->audio_pdev);
+
+	ret = devm_add_action_or_reset(dev, mtk_hdmi_unregister_audio_driver,
+				       hdmi->audio_pdev);
+	if (ret) {
+		platform_device_unregister(hdmi->audio_pdev);
+		return ret;
+	}
 
 	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
 	return 0;
-- 
2.47.0


