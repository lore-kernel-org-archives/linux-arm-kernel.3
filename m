Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46139C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YKZgSoMuTXktamYFQTdo3ZV/YxOMNDKsaOxZk019Kc=; b=hrqASlFmRuAfLXRLLe+WwdHI4f
	f8khTYMkgVeRpVNfaeQeC3nIMRf8oSOINq6Zc4mLOPOAaPFCHvdbKzHxUzJjS2qI7B7DIjll5Qh9x
	u0z15DcdhZmCab+L4DTVv/VY6E+bi7pptpu6bJpiVcnngoW7mmIfqVVwqTFR6bvXrPM8pxG8qBYij
	nN4J+ryeAzDbgI1l81jfwQl5mHuAz/CN/n/95LjxxEPperY0OZnQLW1uda5lQZA40zT2PYiHVXVTR
	Ew8z13Sh28Touh+0WZgMhOVBLlChLIkwQCfsGIl0KstKTmN07iRrC7PCSJzn3nZeNpo5zqTndfYNX
	4+7+cv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXDa-0000000EEn9-2wyx;
	Fri, 07 Mar 2025 12:54:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqX8P-0000000EDlK-2Tmk;
	Fri, 07 Mar 2025 12:49:02 +0000
X-UUID: 8968e9b2fb5211efa1e849db4cc18d44-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3YKZgSoMuTXktamYFQTdo3ZV/YxOMNDKsaOxZk019Kc=;
	b=ZECAXa767BcFHiJMBToLMtyuqrBSeeXcyRVCVfJRCpiTsRWbMsq0JnHx9yI7Okg46OPTkfnsjxhmmzcHwOyknDpV8FqMBZdyt6sunjMp7RZ3QQjV/Gtf3tyDidpzJLcBk56FbbKTtgYWpMqoaiUS7rhYRU1+wY9sow/XU5sJQ6k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9dbd4278-e8bb-49f6-b37a-70f87c3327b9,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:7613d249-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8968e9b2fb5211efa1e849db4cc18d44-20250307
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1219185272; Fri, 07 Mar 2025 05:48:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:48:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:48:54 +0800
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
Subject: [PATCH 04/14] ASoC: mediatek: mt8196: add common interface for mt8196 DAI driver
Date: Fri, 7 Mar 2025 20:47:30 +0800
Message-ID: <20250307124841.23777-5-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307124841.23777-1-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_044901_639667_C89D0C04 
X-CRM114-Status: GOOD (  15.38  )
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

Implement sample rate conversion and set private data for mt8196.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 .../soc/mediatek/mt8196/mt8196-afe-control.c  | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-control.c

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-control.c b/sound/soc/mediatek/mt8196/mt8196-afe-control.c
new file mode 100644
index 000000000000..bb85f4ad8585
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-control.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  MediaTek ALSA SoC Audio Control
+ *
+ *  Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include "mt8196-afe-common.h"
+#include <linux/pm_runtime.h>
+
+unsigned int mt8196_general_rate_transform(struct device *dev,
+					   unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_IPM2P0_RATE_8K;
+	case 11025:
+		return MTK_AFE_IPM2P0_RATE_11K;
+	case 12000:
+		return MTK_AFE_IPM2P0_RATE_12K;
+	case 16000:
+		return MTK_AFE_IPM2P0_RATE_16K;
+	case 22050:
+		return MTK_AFE_IPM2P0_RATE_22K;
+	case 24000:
+		return MTK_AFE_IPM2P0_RATE_24K;
+	case 32000:
+		return MTK_AFE_IPM2P0_RATE_32K;
+	case 44100:
+		return MTK_AFE_IPM2P0_RATE_44K;
+	case 48000:
+		return MTK_AFE_IPM2P0_RATE_48K;
+	case 88200:
+		return MTK_AFE_IPM2P0_RATE_88K;
+	case 96000:
+		return MTK_AFE_IPM2P0_RATE_96K;
+	case 176400:
+		return MTK_AFE_IPM2P0_RATE_176K;
+	case 192000:
+		return MTK_AFE_IPM2P0_RATE_192K;
+	/* not support 260K */
+	case 352800:
+		return MTK_AFE_IPM2P0_RATE_352K;
+	case 384000:
+		return MTK_AFE_IPM2P0_RATE_384K;
+	default:
+		dev_info(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_IPM2P0_RATE_48K);
+		return MTK_AFE_IPM2P0_RATE_48K;
+	}
+}
+
+static unsigned int pcm_rate_transform(struct device *dev,
+				       unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_PCM_RATE_8K;
+	case 16000:
+		return MTK_AFE_PCM_RATE_16K;
+	case 32000:
+		return MTK_AFE_PCM_RATE_32K;
+	case 48000:
+		return MTK_AFE_PCM_RATE_48K;
+	default:
+		dev_info(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_PCM_RATE_32K);
+		return MTK_AFE_PCM_RATE_32K;
+	}
+}
+
+unsigned int mt8196_rate_transform(struct device *dev,
+				   unsigned int rate, int aud_blk)
+{
+	switch (aud_blk) {
+	case MT8196_DAI_PCM_0:
+	case MT8196_DAI_PCM_1:
+		return pcm_rate_transform(dev, rate);
+	default:
+		return mt8196_general_rate_transform(dev, rate);
+	}
+}
+
+int mt8196_dai_set_priv(struct mtk_base_afe *afe, int id,
+			int priv_size, const void *priv_data)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	void *temp_data;
+
+	temp_data = devm_kzalloc(afe->dev,
+				 priv_size,
+				 GFP_KERNEL);
+	if (!temp_data)
+		return -ENOMEM;
+
+	if (priv_data)
+		memcpy(temp_data, priv_data, priv_size);
+
+	if (id >= MT8196_DAI_NUM || id < 0)
+		return -EINVAL;
+
+	afe_priv->dai_priv[id] = temp_data;
+
+	return 0;
+}
+
-- 
2.45.2


