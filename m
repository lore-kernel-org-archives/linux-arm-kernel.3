Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C098C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIzA5blZjnn1Za4hHHyhXXOBaYZDr85xHWv+EF326Ts=; b=f9vjVxc1a8tCYR1iC7HoT1MIZv
	n2q1Mbq5rZ3FDg4WrKt62fHsATT2xSmadYkJ5myb4ofB+QPoXsZOe5aBEm3tFQpDMEpAWYgILN4OC
	bEVN40NUIR6PwpgyRBF2bJiqdO+4FePAC1lESqv2FatS46MmdqytU8u9tDjcxDA/t2Ijaiy7i8MHt
	UZLBaQM2XmYeqhKnGINU7Yu2hmYJCcf6TxZ5obNeq5q9mR66q35JnapcO0/390edbyXIR/Cwduwxp
	4vgNUi4RFatxLx7n33r6ouU1mI1/ifJJeJ6pPaOGHWOpLh8oflu21eT6erNtdADosCti/t8vX6NBx
	OW+kSE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXVW-0000000EHcT-2aop;
	Fri, 07 Mar 2025 13:12:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXNC-0000000EG5Y-2SfI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 13:04:19 +0000
X-UUID: 84f92504fb5211efa1e849db4cc18d44-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eIzA5blZjnn1Za4hHHyhXXOBaYZDr85xHWv+EF326Ts=;
	b=sTSfmRdN4nj8Ckl9jqIQbzsCX8rnOLq7ZV4WW1Y0yHkBPWloj5brN9tUE10z0s5XpHesGKZsf4Up6T1CnABzT7LS8mmQSZsWqxR4JpzBEOSxAyNf405tHgHHwK1cqlHshbPZuC1IAdEYisNiETmZgd3PWabp7ghlSkM0htcTmvU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:093522e7-964f-4e56-8f77-805d72db3bbc,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:abca0dc6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 84f92504fb5211efa1e849db4cc18d44-20250307
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1108031026; Fri, 07 Mar 2025 05:48:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:48:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:48:47 +0800
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
Subject: [PATCH 01/14] ASoC: mediatek: common: modify mtk afe common driver for mt8196
Date: Fri, 7 Mar 2025 20:47:27 +0800
Message-ID: <20250307124841.23777-2-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307124841.23777-1-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_050418_664863_E45A8999 
X-CRM114-Status: GOOD (  18.22  )
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

Export register read and write interface, add sample reate interface, and
update the mtk_memif_set_channel interface for the mt8196 platform.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 30 ++++++++++++++--------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h |  6 +++++
 sound/soc/mediatek/common/mtk-base-afe.h   | 13 ++++++++++
 3 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3809068f5620..c36dae520f04 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -18,7 +18,7 @@
 
 #define AFE_BASE_END_OFFSET 8
 
-static int mtk_regmap_update_bits(struct regmap *map, int reg,
+int mtk_regmap_update_bits(struct regmap *map, int reg,
 			   unsigned int mask,
 			   unsigned int val, int shift)
 {
@@ -26,13 +26,16 @@ static int mtk_regmap_update_bits(struct regmap *map, int reg,
 		return 0;
 	return regmap_update_bits(map, reg, mask << shift, val << shift);
 }
+EXPORT_SYMBOL(mtk_regmap_update_bits);
+
+int mtk_regmap_write(struct regmap *map, int reg, unsigned int val)
 
-static int mtk_regmap_write(struct regmap *map, int reg, unsigned int val)
 {
 	if (reg < 0)
 		return 0;
 	return regmap_write(map, reg, val);
 }
+EXPORT_SYMBOL(mtk_regmap_write);
 
 int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
@@ -459,8 +462,12 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	unsigned int mono;
 
-	if (memif->data->mono_shift < 0)
-		return 0;
+	dev_info(afe->dev, "%s(), id: %d, channel: %d\n", __func__, id, channel);
+	mono = memif->data->mono_invert ^ (channel == 1);
+
+	if (memif->data->mono_shift > 0)
+		mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
+				       0x1, mono, memif->data->mono_shift);
 
 	if (memif->data->quad_ch_mask) {
 		unsigned int quad_ch = (channel == 4) ? 1 : 0;
@@ -470,11 +477,6 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
 				       quad_ch, memif->data->quad_ch_shift);
 	}
 
-	if (memif->data->mono_invert)
-		mono = (channel == 1) ? 0 : 1;
-	else
-		mono = (channel == 1) ? 1 : 0;
-
 	/* for specific configuration of memif mono mode */
 	if (memif->data->int_odd_flag_reg)
 		mtk_regmap_update_bits(afe->regmap,
@@ -482,8 +484,14 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
 				       1, mono,
 				       memif->data->int_odd_flag_shift);
 
-	return mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
-				      1, mono, memif->data->mono_shift);
+	if (memif->data->ch_num_maskbit) {
+		dev_info(afe->dev, "%s(), set ch num id: %d, channel: %d\n", __func__, id, channel);
+		mtk_regmap_update_bits(afe->regmap, memif->data->ch_num_reg,
+				       memif->data->ch_num_maskbit,
+				       channel, memif->data->ch_num_shift);
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_memif_set_channel);
 
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
index b6d0f2b27e86..64b10ccba291 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
@@ -12,7 +12,13 @@
 struct snd_soc_dai_ops;
 struct mtk_base_afe;
 struct mtk_base_afe_memif;
+struct mtk_base_irq_data;
 
+int mtk_regmap_update_bits(struct regmap *map, int reg,
+			   unsigned int mask, unsigned int val,
+			   int shift);
+int mtk_regmap_write(struct regmap *map, int reg,
+		     unsigned int val);
 int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai);
 void mtk_afe_fe_shutdown(struct snd_pcm_substream *substream,
diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index f51578b6c50a..01c27fe92e2f 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -53,9 +53,11 @@ struct mtk_base_memif_data {
 	int enable_reg;
 	int enable_shift;
 	int hd_reg;
+	int hd_mask;
 	int hd_shift;
 	int hd_align_reg;
 	int hd_align_mshift;
+	int hd_msb_shift;
 	int msb_reg;
 	int msb_shift;
 	int msb_end_reg;
@@ -65,6 +67,10 @@ struct mtk_base_memif_data {
 	int ch_num_reg;
 	int ch_num_shift;
 	int ch_num_maskbit;
+	/* VUL 24~26 only for CM2 */
+	int out_on_use_reg;
+	int out_on_use_mask;
+	int out_on_use_shift;
 	/* playback memif only */
 	int pbuf_reg;
 	int pbuf_mask;
@@ -72,6 +78,9 @@ struct mtk_base_memif_data {
 	int minlen_reg;
 	int minlen_mask;
 	int minlen_shift;
+	int maxlen_reg;
+	int maxlen_mask;
+	int maxlen_shift;
 };
 
 struct mtk_base_irq_data {
@@ -87,6 +96,10 @@ struct mtk_base_irq_data {
 	int irq_clr_reg;
 	int irq_clr_shift;
 	int irq_status_shift;
+	int irq_ap_en_reg;
+	int irq_ap_en_shift;
+	int irq_scp_en_reg;
+	int irq_scp_en_shift;
 };
 
 struct device;
-- 
2.45.2


