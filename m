Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF533C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46TuSHd10UP8OUoJJnde8lojq/wh9uzhaE+3oLPotOE=; b=iQ0Y2vsL3N9m6z5CGQSZmPoPVy
	qxG1df3rBFA06mzDqWFo+twVdkiKBJV1LzHr6xe5qhsk0ZJVRhu47OZ1LXyCHDuNUUxjlHL65riv0
	aVl6c6eJEj0z/Fzm42z2dCKV9UcyCMSNiPNQaPWhkKi49MRKZwaZupUcB3ZEqx43O3gaRt2YORlM9
	B1Wd/eg/74nmrI+jzU+oianPA6pmzcGhE4lefU1Niyn095smTvEOzaE3PGEsUdykP3M5yCFSQ8vg0
	oMaSQ6Jp4jtcxWuCQ3MtSN+L0E+omBovbPKIAuMOoF4RzTG7Ve5EcqyWuTm1lcTmIfzHmday1Ylno
	RKdQpIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXLl-0000000EFoq-1ffL;
	Fri, 07 Mar 2025 13:02:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqX8c-0000000EDpR-1mc1;
	Fri, 07 Mar 2025 12:49:15 +0000
X-UUID: 9143e1befb5211ef83f2a1c9db70dae0-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=46TuSHd10UP8OUoJJnde8lojq/wh9uzhaE+3oLPotOE=;
	b=D8E1kDCG3lez9XLOa7ME45S4aqW5M1vAdwFaj9tCzIeCPgEYFq8JhTltP/ag6ZbZA4Xpmlue/U0I7bQ7E1dFHtrUqSjUFu47wYFQLE5AamgT70rwxbNKIGn0CvQ60pQHfVdEEG34bfQ5I5X6WQFcI1KwWLDUcE1z1NSOlVR/t+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b625178d-d6e8-4c30-a47d-3956963fc1e2,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:dc13d249-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9143e1befb5211ef83f2a1c9db70dae0-20250307
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1874811707; Fri, 07 Mar 2025 05:49:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:49:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:49:07 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 10/14] ASoC: mediatek: mt8196: support CM in platform driver
Date: Fri, 7 Mar 2025 20:47:36 +0800
Message-ID: <20250307124841.23777-11-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307124841.23777-1-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_044914_469503_66CCA950 
X-CRM114-Status: GOOD (  15.92  )
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

Add mt8196 CM driver support for ADDA multi-channel.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-cm.c | 94 +++++++++++++++++++++++
 sound/soc/mediatek/mt8196/mt8196-afe-cm.h | 23 ++++++
 2 files changed, 117 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-cm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-cm.h

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-cm.c b/sound/soc/mediatek/mt8196/mt8196-afe-cm.c
new file mode 100644
index 000000000000..b923844a76f8
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-cm.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 MediaTek Inc.
+ * Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "mtk-afe-fe-dai.h"
+#include "mtk-base-afe.h"
+
+#include "mt8196-afe-cm.h"
+#include "mt8196-afe-common.h"
+
+void mt8196_set_cm_rate(struct mtk_base_afe *afe, int id, unsigned int rate)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	afe_priv->cm_rate[id] = rate;
+}
+EXPORT_SYMBOL_GPL(mt8196_set_cm_rate);
+
+static int mt8196_convert_cm_ch(unsigned int ch)
+{
+	return ch - 1;
+}
+
+static unsigned int calculate_cm_update(int rate, int ch)
+{
+	unsigned int update_val;
+
+	update_val = 26000000 / rate / (ch / 2);
+	update_val = update_val * 10 / 7;
+	if (update_val > 100)
+		update_val = 100;
+	if (update_val < 7)
+		update_val = 7;
+
+	return update_val;
+}
+
+int mt8196_set_cm(struct mtk_base_afe *afe, int id,
+		  bool update, bool swap, unsigned int ch)
+{
+	unsigned int rate = 0;
+	unsigned int update_val = 0;
+	int reg;
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	dev_dbg(afe->dev, "%s()-0, CM%d, rate %d, update %d, swap %d, ch %d\n",
+		__func__, id, rate, update, swap, ch);
+
+	rate = afe_priv->cm_rate[id];
+	update_val = update ? calculate_cm_update(rate, (int)ch) : 0x64;
+
+	reg = AFE_CM0_CON0 + 0x10 * id;
+	/* update cnt */
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_UPDATE_CNT_MASK,
+			       update_val, AFE_CM_UPDATE_CNT_SFT);
+
+	/* rate */
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_1X_EN_SEL_FS_MASK,
+			       rate, AFE_CM_1X_EN_SEL_FS_SFT);
+
+	/* ch num */
+	ch = mt8196_convert_cm_ch(ch);
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_CH_NUM_MASK,
+			       ch, AFE_CM_CH_NUM_SFT);
+
+	/* swap */
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_BYTE_SWAP_MASK,
+			       swap, AFE_CM_BYTE_SWAP_SFT);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8196_set_cm);
+
+int mt8196_enable_cm_bypass(struct mtk_base_afe *afe, int id, bool en)
+{
+	int reg = AFE_CM0_CON0 + 0x10 * id;
+
+	mtk_regmap_update_bits(afe->regmap, reg, AFE_CM_BYPASS_MODE_MASK,
+			       en, AFE_CM_BYPASS_MODE_SFT);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8196_enable_cm_bypass);
+
+MODULE_DESCRIPTION("Mediatek afe cm");
+MODULE_AUTHOR("darren ye <darren.ye@mediatek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-cm.h b/sound/soc/mediatek/mt8196/mt8196-afe-cm.h
new file mode 100644
index 000000000000..18115ec8fa70
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-cm.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 MediaTek Inc.
+ * Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#ifndef MTK_AFE_CM_H_
+#define MTK_AFE_CM_H_
+enum {
+	CM0,
+	CM1,
+	CM2,
+	CM_NUM,
+};
+
+void mt8196_set_cm_rate(struct mtk_base_afe *afe, int id, unsigned int rate);
+
+int mt8196_set_cm(struct mtk_base_afe *afe, int id, bool update,
+		  bool swap, unsigned int ch);
+int mt8196_enable_cm_bypass(struct mtk_base_afe *afe, int id, bool en);
+
+#endif /* MTK_AFE_CM_H_ */
+
-- 
2.45.2


