Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYC8Ft7WO/9ijtWK9sD+DX7+Mw9W4ec8Qkcd3+7kWEo=; b=irs+MTEk4uOfzCUabZGbulE587
	9WDL+vRnKSM4GuiakHCQUEzyqnXar43mSz2xEM1EREaYvq4WMy97Jxyc0cU8OmKtV+s5QiuiaeYZ7
	KeI3fMONOT+ngIL8SEufNIPHohzNbCrp4O3QgqyUiOoHBlE0qceRpKUJV4KX4UjdADa+zYv63d+xb
	Wqvikh5JYtGQoKUCJK+2dJMyKWiAxJGL/O8DKlEZAsLapHXHqQmEO0L0fo8zHzFX4dyNaBnUQ9IQ0
	PTJU5pUawS7rHDYHKoVXKz9njIKn6oi1XXBT1UReaAO1PBT2zeaQAN3DFf5Y2feycaQjLmPAvcmmb
	m3nlxuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1l4z-0000000079D-2gq9;
	Mon, 07 Apr 2025 11:55:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kxf-000000004kV-0bKo;
	Mon, 07 Apr 2025 11:48:20 +0000
X-UUID: 31a6281813a611f083f2a1c9db70dae0-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HYC8Ft7WO/9ijtWK9sD+DX7+Mw9W4ec8Qkcd3+7kWEo=;
	b=dhiSF6J1UGuWIX3ZoJxXTrzLOYdYAvnm0OgcI8MPBPFZ0xXHVg9Py69Aoi3cPPBvLCc8GUISROTM+fgrcvFBTXiyfUm5ECrIHcbTnZ2jIen8lMNYXbZJnCJNaFz9RwehQzW3QsWZLvnZOQCRukcrvyAFY8TgH5KpryVSjobJtds=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2f29c14a-b1eb-40eb-8698-704b57fae50e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:21ae4e8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 31a6281813a611f083f2a1c9db70dae0-20250407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1047102374; Mon, 07 Apr 2025 04:48:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 19:48:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 19:48:13 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 02/11] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
Date: Mon, 7 Apr 2025 19:47:15 +0800
Message-ID: <20250407114759.24835-4-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250407114759.24835-1-darren.ye@mediatek.com>
References: <20250407114759.24835-1-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_044819_196698_0E3027F0 
X-CRM114-Status: GOOD (  14.71  )
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

From: Darren Ye <darren.ye@mediatek.com>

Mofify the pcm pointer interface to support 64-bit address access.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 .../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++-------
 .../mediatek/common/mtk-afe-platform-driver.h |  2 +
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 6b6330583941..a86594dca2b7 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -86,29 +86,44 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 	const struct mtk_base_memif_data *memif_data = memif->data;
 	struct regmap *regmap = afe->regmap;
 	struct device *dev = afe->dev;
-	int reg_ofs_base = memif_data->reg_ofs_base;
-	int reg_ofs_cur = memif_data->reg_ofs_cur;
-	unsigned int hw_ptr = 0, hw_base = 0;
-	int ret, pcm_ptr_bytes;
-
-	ret = regmap_read(regmap, reg_ofs_cur, &hw_ptr);
-	if (ret || hw_ptr == 0) {
-		dev_err(dev, "%s hw_ptr err\n", __func__);
-		pcm_ptr_bytes = 0;
+	unsigned int hw_ptr_lower32 = 0, hw_ptr_upper32 = 0;
+	unsigned int hw_base_lower32 = 0, hw_base_upper32 = 0;
+	unsigned long long hw_ptr = 0, hw_base = 0;
+	int ret;
+	unsigned long long pcm_ptr_bytes = 0;
+
+	ret = regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lower32);
+	if (ret || hw_ptr_lower32 == 0) {
+		dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
 		goto POINTER_RETURN_FRAMES;
 	}
 
-	ret = regmap_read(regmap, reg_ofs_base, &hw_base);
-	if (ret || hw_base == 0) {
-		dev_err(dev, "%s hw_ptr err\n", __func__);
-		pcm_ptr_bytes = 0;
-		goto POINTER_RETURN_FRAMES;
+	if (memif_data->reg_ofs_cur_msb) {
+		ret = regmap_read(regmap, memif_data->reg_ofs_cur_msb, &hw_ptr_upper32);
+		if (ret) {
+			dev_err(dev, "%s hw_ptr_upper32 err\n", __func__);
+			goto POINTER_RETURN_FRAMES;
+		}
 	}
 
-	pcm_ptr_bytes = hw_ptr - hw_base;
+	ret = regmap_read(regmap, memif_data->reg_ofs_base, &hw_base_lower32);
+	if (ret || hw_base_lower32 == 0) {
+		dev_err(dev, "%s hw_base_lower32 err\n", __func__);
+		goto POINTER_RETURN_FRAMES;
+	}
+	if (memif_data->reg_ofs_base_msb) {
+		ret = regmap_read(regmap, memif_data->reg_ofs_base_msb, &hw_base_upper32);
+		if (ret) {
+			dev_err(dev, "%s hw_base_upper32 err\n", __func__);
+			goto POINTER_RETURN_FRAMES;
+		}
+	}
+	hw_ptr = ((unsigned long long)hw_ptr_upper32 << 32) + hw_ptr_lower32;
+	hw_base = ((unsigned long long)hw_base_upper32 << 32) + hw_base_lower32;
 
 POINTER_RETURN_FRAMES:
-	return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
+	pcm_ptr_bytes = MTK_WORD_SIZE_ALIGN(hw_ptr - hw_base);
+	return bytes_to_frames(substream->runtime, (ssize_t)pcm_ptr_bytes);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
 
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
index fcc923b88f12..9809e60db511 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
@@ -12,6 +12,8 @@
 #define AFE_PCM_NAME "mtk-afe-pcm"
 extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
 
+#define MTK_WORD_SIZE_ALIGN(x) ((x) & (0xfffffffff0))
+
 struct mtk_base_afe;
 struct snd_pcm;
 struct snd_soc_component;
-- 
2.45.2


