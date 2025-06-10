Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF2AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 09:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYC8Ft7WO/9ijtWK9sD+DX7+Mw9W4ec8Qkcd3+7kWEo=; b=MNifLyW39+3DG1BgWRl3/A8ug7
	Ww026IHHd9UixN/QErg/alwkbo4zchC69mLHQXVeb5p4GBT6jDz6d7Fz97z7DCvrNjkejCn+oMo6H
	oJEsEZOtRvUqi2ymXF17J6eu7UVRpxD/c/9xAvmJtL4zEPuEe0xVfM5zMvRU/Zbiy1gJsF5VKzkbM
	W53Ic0hRdMAh9Edpu4F/1/N2L9jXeDJCeRcYe8ZAAuME1FsZWwicqxPnINfSVGZ1L3ASOAx+TP12a
	37Uy62HHxVGK+fx4b7hV7jVeq6IpDsALqNkh+JdnmL19YZaxQMBspPqgKvDW/DIgOStvIzGfI8Qzl
	Ul2rMAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvgp-00000006PlV-1Q0f;
	Tue, 10 Jun 2025 09:54:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvI1-00000006L1D-1vj8;
	Tue, 10 Jun 2025 09:29:06 +0000
X-UUID: 583473c245dd11f09f706fa2197c6ceb-20250610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HYC8Ft7WO/9ijtWK9sD+DX7+Mw9W4ec8Qkcd3+7kWEo=;
	b=FyzYvjOL64uHaxQjAxJn4diNz8rnHjvgEPK1H038ZTxzic8fghjc10K8zlEY3budosT64edQOipxrnUeL+h1ufH3PRXWYZSkfHIX1dYoOkO8zc7g+bQ6i5MCPoJYp70366GZx/vVSKcXKmiY75qZh2RY9aZh45/dnDo4i0sHaF0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:dc136b51-eda5-4fed-aa58-11e62662e074,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:fd33d781-ef30-4982-a001-67a9a83f2fda,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 583473c245dd11f09f706fa2197c6ceb-20250610
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1371019941; Tue, 10 Jun 2025 02:29:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 10 Jun 2025 17:28:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 10 Jun 2025 17:28:58 +0800
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
Subject: [PATCH v4 01/10] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
Date: Tue, 10 Jun 2025 17:27:18 +0800
Message-ID: <20250610092852.21986-2-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250610092852.21986-1-darren.ye@mediatek.com>
References: <20250610092852.21986-1-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_022905_515263_A56C14E7 
X-CRM114-Status: GOOD (  14.86  )
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


