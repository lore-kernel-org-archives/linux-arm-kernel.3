Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB419E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdQssLOaWjPvKYW5bQH6XDLt285k0AnLDFl98X5TXRs=; b=Rp0Dmn+Mov641xQisHgjZON+Du
	hIIpjPLJouUHX6zYxjC2TnbWu8Ub5Va57IOlmCWA2B8nE3/d47FmkkI3zASE3BtrtCotkgHQGA/DE
	vUvJFfvL2jxPkPP30upNGO4W0DcCZkMQHpKWmATqpyBpYkSDpTvSQVWxR0rA5K5RgMCh8wWwl0Wt+
	JVV2dmoLJB6LdLF2F7D/1CcEXv9Jps8yd5JWRTU5pXCvsz7Gp54qoq8W7hJgRD9ABgZzfQ1RcUEXK
	5VJ3xvGjeoXLebuXjg40dcH6+C5sAOshZNax422dkfQMLRBCQaNNm4+QE7N+q3R6EhM9JIpkAI8yW
	owEo/wig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNa0z-0000000E4LD-14wM;
	Tue, 17 Dec 2024 16:01:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZk5-0000000DzzG-2GkS;
	Tue, 17 Dec 2024 15:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734450252;
	bh=eGH7M3rcGs9Lf31CwwdH6KTqEaV8ZXyuGZoV79M4nZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LYCSsHDsf/G6D1VF6NX7VX/+AJ+Kq7k1DGDDQ/Y7mqgeHYdLS8iqsJhuS1NTb3JCu
	 pmGivBuVr3d7t3QODA4loU7RPouiIelqfthKoopYx4yN+PpwQ2g2J4wVOVmXxAU7WU
	 ThhVjYubcp2toTc6xiFCf6LkExonzW/y0dKmleF5DIu7lPP26PRozkf1GE2rtHD3zj
	 KqhPNVwdgsoXpfuTou7at4N23mX8ZdK2Ex0jssLmSrKrUPBB5sYQzK5KTBAs/pNBi4
	 EBiQVjaGzZACQvY+heq11mZvhfU3K3IvriRcwcFb/7ptTT7KySjWdUqpnP3gm4YPOu
	 9O62XeOsJEUPw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A3F617E37A7;
	Tue, 17 Dec 2024 16:44:10 +0100 (CET)
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
Subject: [PATCH v3 15/33] drm/mediatek: mtk_hdmi: Disgregate function mtk_hdmi_audio_set_param()
Date: Tue, 17 Dec 2024 16:43:27 +0100
Message-ID: <20241217154345.276919-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074413_732335_4901ABBE 
X-CRM114-Status: GOOD (  13.30  )
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

As a cleanup, and in preparation for splitting common bits of this
driver, disgregate the code in function mtk_hdmi_audio_set_param()
between mtk_hdmi_audio_params() and mtk_hdmi_audio_hw_params().

The generic hdmi_audio_param copy now gets performed in the former,
and the IP specific mtk_hdmi_aud_output_config() gets called in the
latter, allowing all of the non IP version specific code to get
moved in a common file later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 8f5ab97a0261..a927d9889818 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1054,20 +1054,6 @@ static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
 	hdmi->audio_enable = false;
 }
 
-static int mtk_hdmi_audio_set_param(struct mtk_hdmi *hdmi,
-				    struct hdmi_audio_param *param)
-{
-	if (!hdmi->audio_enable) {
-		dev_err(hdmi->dev, "hdmi audio is in disable state!\n");
-		return -EINVAL;
-	}
-	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
-		param->aud_codec, param->aud_input_type,
-		param->aud_input_chan_type, param->codec_params.sample_rate);
-	memcpy(&hdmi->aud_param, param, sizeof(*param));
-	return mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
-}
-
 static int mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
 					    struct drm_display_mode *mode)
 {
@@ -1544,6 +1530,11 @@ static int mtk_hdmi_audio_params(struct mtk_hdmi *hdmi,
 		return -EINVAL;
 	}
 	memcpy(&aud_params.codec_params, params, sizeof(aud_params.codec_params));
+	memcpy(&hdmi->aud_param, &aud_params, sizeof(aud_params));
+
+	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
+		aud_params.aud_codec, aud_params.aud_input_type,
+		aud_params.aud_input_chan_type, aud_params.codec_params.sample_rate);
 
 	return 0;
 }
@@ -1553,10 +1544,14 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 				    struct hdmi_codec_params *params)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	struct hdmi_audio_param hdmi_params;
+
+	if (!hdmi->audio_enable) {
+		dev_err(hdmi->dev, "hdmi audio is in disable state!\n");
+		return -EINVAL;
+	}
 
 	mtk_hdmi_audio_params(hdmi, daifmt, params);
-	mtk_hdmi_audio_set_param(hdmi, &hdmi_params);
+	mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
 
 	return 0;
 }
-- 
2.47.0


