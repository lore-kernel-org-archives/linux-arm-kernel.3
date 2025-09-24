Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E885CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNNBeObjdL43LHXCCN8I8bejSq21u9A9sayNPRpBblE=; b=rMVqUd1tZJ1gBxN85a/ftnEHMV
	jJVz3//R/K1kvU9fUMFwf2bGZnI9N6Qkw2Fi5i7rUFBiEpNViH/Y6WcIp3LHO2rG+H0HnCJU7L8pe
	84qlO6Hm3T9SgsTWVowwVXJ851FBekO/DNpFIObnb0OsCxbKCNjsnVqnyx4WkDhRDeRSU4vqv+YPr
	JIjxkbz0Sjh2OhM631AZOGxpxkjnB3bYN0M0LzEnQPOHY36Mla+6OYnHoZHEpgvcIyhug9U67EuvA
	HxcFBSt53EwBei692RIRZf67VR++CJXgkb1qPPURAh+Uz6FmM+Roaj2QUzFs+zi73yAenF5Q8uFMD
	PD75J4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MsF-0000000GYc6-1xlS;
	Wed, 24 Sep 2025 10:37:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MsB-0000000GYXr-3mSi;
	Wed, 24 Sep 2025 10:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758710237;
	bh=6q4nIF9PbW8vKqtt8oUILNc6BjJu8LTWVp+LAjhBKV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KYorXydr04gRo8aD6mEUTsaAEfjf68IsYc/xPn+AY75dqEk4qsAErHToxf/23Qf50
	 V2kuQKgEinw2Avv35Et65VjGv5ABHECvVsHMSxJMZol1yF0MFMR3KXQzqNfsPSkNzj
	 X45ccvwsAx7OitpexfKtvkU/6G6WTbOTk+0sTj/TyS/8uYAM6FR3b5mEcYDP0zlnrf
	 E7/7deUpAPPZP/K42HOtBv+wvIs+cDB7lnk3R0VhuSQBJ16I+/VqttkQAW/5zIn3kC
	 FdMF2LtvJs9NqI3aSb4fkRQ5nSfRK9JkTOJl5ZdJB299L5EIvM/LesV7hzYM3qDzy1
	 knM5JDQY4v4WQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2324017E12DF;
	Wed, 24 Sep 2025 12:37:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmitry.osipenko@collabora.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/3] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
Date: Wed, 24 Sep 2025 12:37:06 +0200
Message-ID: <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_033720_103902_D1B4E9AD 
X-CRM114-Status: GOOD (  16.53  )
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

During probe, this driver is registering two platform devices: one
for the HDMI Codec driver and one for the DisplayPort PHY driver.

In the probe function, none of the error cases are unregistering
any of the two platform devices and this may cause registration
of multiple instances of those in case this driver returns one or
more probe deferral(s) in the "wrong" spots.

In order to fix this, add devm actions to unregister those and
remove the manual calls to platform_device_unregister in the
mtk_dp_remove() function, as those would otherwise be redundant.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayPort aux-bus")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index bef6eeb30d3e..9b374b8d079e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2650,6 +2650,13 @@ static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
 	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
 };
 
+static void mtk_dp_unregister_pdevs(void *data)
+{
+	struct platform_device *ext_pdev = data;
+
+	platform_device_unregister(ext_pdev);
+}
+
 static int mtk_dp_register_audio_driver(struct device *dev)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
@@ -2660,18 +2667,29 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 		.data = mtk_dp,
 		.no_capture_mute = 1,
 	};
+	int ret;
 
 	mtk_dp->audio_pdev = platform_device_register_data(dev,
 							   HDMI_CODEC_DRV_NAME,
 							   PLATFORM_DEVID_AUTO,
 							   &codec_data,
 							   sizeof(codec_data));
-	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
+	if (IS_ERR(mtk_dp->audio_pdev))
+		return PTR_ERR(mtk_dp->audio_pdev);
+
+	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->phy_dev);
+	if (ret) {
+		platform_device_unregister(mtk_dp->audio_pdev);
+		return dev_err_probe(dev, ret,
+				     "Failed to add codec unregister devm action");
+	}
+	return 0;
 }
 
 static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 {
 	struct device *dev = mtk_dp->dev;
+	int ret;
 
 	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
 							PLATFORM_DEVID_AUTO,
@@ -2681,6 +2699,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 		return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
 				     "Failed to create device mediatek-dp-phy\n");
 
+	ret = devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mtk_dp->phy_dev);
+	if (ret) {
+		platform_device_unregister(mtk_dp->phy_dev);
+		return dev_err_probe(dev, ret,
+				     "Failed to add phy unregister devm action");
+	}
+
 	mtk_dp_get_calibration_data(mtk_dp);
 
 	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
@@ -2850,9 +2875,6 @@ static void mtk_dp_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP)
 		timer_delete_sync(&mtk_dp->debounce_timer);
-	platform_device_unregister(mtk_dp->phy_dev);
-	if (mtk_dp->audio_pdev)
-		platform_device_unregister(mtk_dp->audio_pdev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.51.0


