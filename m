Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA4EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHW15M8e//yknqSmhyCYn2iLaOuBjHe83do0sQRmZdo=; b=1eBChyiH8QgcMn+YTBiGKdM+i3
	cbuHVC+8+CkkYZ3bdB0NaGSBFtxu0l9eh/2EDYTVWmUhV9fWsLNmL8dM/9BniviIXk7zVIjttY/oh
	5dEdnKF1UMnOhr6AleWKKIPp4GbWmdnZi47m1BxLmPhaou2Q/WrLRPvMFhAJ7fatvvNtE4GFoCQf8
	7FD9Ca1noa4SXvf/24x7sNb5oLuY1gDdKHn3X91OaZxg3yLfqzilrfXSjvlHBrFmi84jbToRvFb+z
	mWKn80Bg9oQMTTJk5kmDhw+C9czWJk5fQWNbCNJzLxajjnVpOmN12YdopVmwfTjwo+4V3mc1he8qK
	iB0NQjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4Ha-00000005L5l-2G3p;
	Mon, 17 Feb 2025 16:47:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Ng-000000058R8-1tSG;
	Mon, 17 Feb 2025 15:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739807399;
	bh=9ser9V04e0H1kfNYQsNeqBZBiYhVURDDC93FpswPxew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XpB+oXSsiW2Mv6GAMmBfjp5CV0UesI1dKGD0romuQouJbk9axjqvYFO5UnAnoi6EX
	 vxqg0XV5ZGJWPBCgbzq5qQryL3lOTLG9A2zYjSEckDCKbPnIH3/6uFTUgG7XiMsBug
	 7kPkiSOFdR405JpbEmPBtxarabRVvbv2oYEI8GD5jMJ2gthzW3E/obmm3hIeFsTRv6
	 0W0XQa/lxt/41XS+o2sN4CXDSoWGGh1YopFa9U++xM8/z+ET+sIlZXBEP7oGabNPRc
	 1FG6f5TM22rqSzfbDT6X3Cjcphk2Y4y5a1r8YliC09lO/V0bVCx+Le1ljQprHuvVdK
	 HVBFPfb2LmryQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A121717E156E;
	Mon, 17 Feb 2025 16:49:57 +0100 (CET)
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
Subject: [PATCH v7 28/43] drm/mediatek: mtk_hdmi: Move output init to mtk_hdmi_register_audio_driver()
Date: Mon, 17 Feb 2025 16:48:21 +0100
Message-ID: <20250217154836.108895-29-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_075000_718911_CB0523A9 
X-CRM114-Status: GOOD (  12.74  )
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

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 6e4900f99b51..e79ebed21eab 100644
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
@@ -1617,6 +1603,7 @@ static void mtk_hdmi_unregister_audio_driver(void *data)
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
 		.max_i2s_channels = 2,
@@ -1626,6 +1613,13 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
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
@@ -1668,11 +1662,6 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
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
2.48.1


