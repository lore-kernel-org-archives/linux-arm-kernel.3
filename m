Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FC8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aBTfWqRw2yXJtyKU/p8Nv9ZURuZt2uxKzxZ5UP9on0=; b=BYMJl0NwAbqmrfCsy7Y4vwk8aU
	9bIM55SdFZhHnQk7acMkSHnylqhlm9ucgcIkvJCQFwyn+a7d75XZ4K1SKT2NeZ1K/z0Ail7ZzSjzU
	BQZ9glin/D7TTjFxYm/VaBsC8Hbcy8WKtAzVEt/E0lw++RAlV5/whLocLbDf7m166Tgq1WrbbI4YH
	TwnxsC8Bvon6lkGb15+BnizcAEmLa5c0tIvnyUi35eu95aJvi5cDQicjs7u5VLTlq1qkNHVCuGTVT
	iooGfqEgQ+CHOgn2AmPIIeuiOmeQC9Iga7KwmEUUoFpCs26mSrYE9XYM6SHYP0MiXZ6Pvr0kZS8yW
	dsdx6bhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMHC-00000005cA8-1kdo;
	Mon, 13 Jan 2025 15:22:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLoW-00000005UQ9-3eno;
	Mon, 13 Jan 2025 14:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736779991;
	bh=40lkq1wxaHnaUhHgGA9f/nHbe/9wC07E5JGtUfl/GZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lOMfDGJHhwq20TLIO6GL6Xmj+OZQ8pP4p5WkLYHpvd807HGR6c3I3jIOT6kPL30xJ
	 F25zhqRwbc20MNAULeXqPdSM+t3mQx3sh9tzA8QlwUmQP1hCXzN5tqXNa5oOxY98Pv
	 b5KZDWgl8GRDop/rjTC0zZRWOqkE/2OrGms4ZkvxzkNgd3K7VDdYVw8jhH8De6dq/t
	 nBr25qWAvrRPKWCaJVE+iS+o9XoRYPTkpT6ieO89N2etn0qO7BlsVAW89hckK9RxXC
	 TfaUZ7fFdDYkhtpA+iAhR67hKAhSNHPsO96ncqeiCNUqAvv3XCkdL19wurOqhC6KXl
	 j7ACke9wqVAew==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A1BF17E0FAA;
	Mon, 13 Jan 2025 15:53:10 +0100 (CET)
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
Subject: [PATCH v5 23/34] drm/mediatek: mtk_hdmi: Move output init to mtk_hdmi_register_audio_driver()
Date: Mon, 13 Jan 2025 15:52:21 +0100
Message-ID: <20250113145232.227674-24-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065313_074029_62296450 
X-CRM114-Status: GOOD (  13.35  )
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

In preparation for moving the common bits of this driver, merge the
contents of mtk_hdmi_output_init in mtk_hdmi_register_audio_driver
function to aggregate all of the initial audio setup together in
the same function and to make it clear that all of the setup that
is performed in mtk_hdmi_output_init is specifically related only
to audio and not video.

While at it, also remove the "%s driver bound to HDMI" debugging
print disguised as informative.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index e2393f7558f9..4345c91e92e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1025,20 +1025,6 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
-{
-	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
-
-	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
-	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
-	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
-	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
-	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
-
-	return 0;
-}
-
 static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
 {
 	mtk_hdmi_hw_send_aud_packet(hdmi, true);
@@ -1616,6 +1602,7 @@ static void mtk_hdmi_unregister_audio_driver(void *data)
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
 		.max_i2s_channels = 2,
@@ -1625,6 +1612,13 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	};
 	int ret;
 
+	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
+	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
+	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+
 	hdmi->audio_pdev = platform_device_register_data(dev,
 							 HDMI_CODEC_DRV_NAME,
 							 PLATFORM_DEVID_AUTO,
@@ -1638,7 +1632,6 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	if (ret)
 		return ret;
 
-	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
 	return 0;
 }
 
@@ -1667,11 +1660,6 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
-	ret = mtk_hdmi_output_init(hdmi);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to initialize hdmi output\n");
-
 	ret = mtk_hdmi_register_audio_driver(dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
-- 
2.47.0


