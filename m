Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E30DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JW6mUSy3roTexKX2Uinzr3pXBLvMcuXipAWuhVqYq1Y=; b=e3FhHbnWEYvrclidYnH1WfVpk3
	Q4uA3LCpzKy+Xn6B/PhypZ6orw+WzTzQe5HmxJTTLxyl/Hv36KH6ylcmsRYHREtJOyGFo08j6Jm0+
	3xia53jKbYpaj4wHd1w5u1PAQK1Cz+cFnROsvP08cMEPhdY7z5di/gjV8wRsop38RcoQRwKJDIhlr
	lrw6FmsRtFjefq5h7QKAKZ8zq78qWUAaqDPilSw5z4xfzR+mgmvxZUf+M17D0ekmMMdEQE1xywMfB
	dXg7QCbp0GCdxof6rcdZxXJJPJ4li+SmUDnebDPrkJ1JMCrQZjMzoOUSG1pdVUhXhsDm47doaVw7E
	jvAUR+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXM3v-00000005Yk2-3Qje;
	Mon, 13 Jan 2025 15:09:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLoG-00000005UCa-2ayZ;
	Mon, 13 Jan 2025 14:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736779975;
	bh=phEH9pFKI9VDxFx796nN2CBtMXeARDG4yPa1NPxZevo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nkX6c/T2tuZCsTsKEHaeAEv2gtQD3JdV7mOUT4BjIQgdwFkEey9kcxXr610YM40Ly
	 xtkoL3q79MD5CpINw6igxQY0NQ8VndVXBnn2CMWR9knuHi7vb3AvmzBtaNRTMPKLrp
	 Ji6trQbVdWew7Ppn0o50alQ666IDx3Z7sEQiL7Da8RSk7gcmYTwkaQroI2vHPYDKNI
	 IY+T0YnWnZ6H+DKihaWEJ7klgLljmKSurKugihdYVhBaehfajbU/bmm8gH+FGNrXYH
	 bfDvj2UJYmXLUJjij04UTc5vgbHCvYve4nGVB8IaxvsU3677ajNOh046w8lS8jOhrD
	 wVevvrABXJhig==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09D1617E0D9D;
	Mon, 13 Jan 2025 15:52:53 +0100 (CET)
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
Subject: [PATCH v5 12/34] drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
Date: Mon, 13 Jan 2025 15:52:10 +0100
Message-ID: <20250113145232.227674-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065256_809205_0355CD3C 
X-CRM114-Status: GOOD (  16.02  )
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
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index a5471abf16dd..a9cdeede499f 100644
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
@@ -1661,6 +1662,11 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
 };
 
+static void mtk_hdmi_unregister_audio_driver(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
@@ -1671,13 +1677,20 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 		.data = hdmi,
 		.no_capture_mute = 1,
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
+	if (ret)
+		return ret;
 
 	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
 	return 0;
-- 
2.47.0


