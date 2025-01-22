Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCA4C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5ekmF15/+fzo4PuU+c8z4+uaFDlYNigyE/Dwz+MhF0=; b=MDBF1sAwpMcMmZKR5LvPYg0zS/
	erMZ9a/qfpzHrAmoiNH/kBhLPZghIp/On6ibtDp4HGEA4gOGUUp9/b/aD33BIFoNuxDm4GHOP5nem
	+6mRbDV24FHHqB2G5ENsQ2VWzOxmC0QplAs3Vrh10oJ9bRXwq5++qTIXUXpT/ySsKblIwZjuFm/Xz
	IByUvICZxctGFbjLQrwD4PdYWNtTenlsb4CXPWBgW8UxTT9YfsqV/RHk4zudUZNwMvyutjpsU0VEn
	RmA8oYUX9LTH4ZAbtcVOFWiZhNj4mvCkLkh68cEm42Up4Kj4Wi+zJNruTwbfBxuwq0ykrG8JBx5q3
	c5uoBhHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabCt-0000000ALOZ-0feF;
	Wed, 22 Jan 2025 13:55:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tab9F-0000000AKdN-0G1q;
	Wed, 22 Jan 2025 13:52:02 +0000
X-UUID: 0b7b4740d8c811ef82ff63e91e7eb18c-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b5ekmF15/+fzo4PuU+c8z4+uaFDlYNigyE/Dwz+MhF0=;
	b=X5jRbGgW91u5907yM3CivA45jfa4AoR1GO7RBKh0g3xSgVT2O14cjw2/S3MyZjqbruiDIfFM0fV3HlYJE4yWys57mp4oNQWbFYukIA8QX4f9dHT9XoDVRV3IRFrJNqLryLlmzTeALpRFtIcjnrU1uoxRm2nZe5LtB4LGoQBbPwk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:d9955817-80a9-418d-8ac3-758a03014f88,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:92d88e7e-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0b7b4740d8c811ef82ff63e91e7eb18c-20250122
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1727202824; Wed, 22 Jan 2025 06:51:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 21:51:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 21:51:53 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH v2 2/3] pinctrl: mediatek: update EINT base retrieval method
Date: Wed, 22 Jan 2025 21:51:24 +0800
Message-ID: <20250122135135.15234-3-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250122135135.15234-1-ot_chhao.chang@mediatek.com>
References: <20250122135135.15234-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_055201_102878_AB3AECD7 
X-CRM114-Status: GOOD (  18.15  )
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

Change the method of obtaining the EINT base from a single value to
multiple values.
Modify the EINT base and add nbase for counting.

Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.h           |  4 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 45 ++++++++++---------
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index 44360d97a34a..c1efdf02fb49 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -64,7 +64,9 @@ struct mtk_eint_xt {
 
 struct mtk_eint {
 	struct device *dev;
-	void __iomem *base;
+	void __iomem **base;
+	u8 nbase;
+	u16 *base_pin_num;
 	struct irq_domain *domain;
 	int irq;
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 00e95682b9f8..6411c10cb637 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 
 #include "mtk-eint.h"
@@ -367,34 +368,43 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
+	unsigned int i, j, count_reg_names;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
+	if (!hw->soc->eint_hw)
 		return -ENODEV;
 
-	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
+	count_reg_names = of_property_count_strings(np, "reg-names");
+	if (count_reg_names < 0 || count_reg_names < hw->soc->nbase_names)
+		return -EINVAL;
+
+	hw->eint = devm_kmalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
 	if (!hw->eint)
 		return -ENOMEM;
 
-	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
-	if (IS_ERR(hw->eint->base)) {
-		ret = PTR_ERR(hw->eint->base);
-		goto err_free_eint;
+	hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
+	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
+					    sizeof(*hw->eint->base), GFP_KERNEL);
+	if (!hw->eint->base)
+		return -ENOMEM;
+
+	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
+		hw->eint->base[j] = of_iomap(np, i);
+		if (IS_ERR(hw->eint->base[j]))
+			return PTR_ERR(hw->eint->base[j]);
 	}
 
+	if (!of_property_read_bool(np, "interrupt-controller"))
+		return -ENODEV;
+
 	hw->eint->irq = irq_of_parse_and_map(np, 0);
-	if (!hw->eint->irq) {
-		ret = -EINVAL;
-		goto err_free_eint;
-	}
+	if (!hw->eint->irq)
+		return -EINVAL;
 
-	if (!hw->soc->eint_hw) {
-		ret = -ENODEV;
-		goto err_free_eint;
-	}
+	if (hw->soc->eint_pin)
+		hw->eint->pins = hw->soc->eint_pin;
 
 	hw->eint->dev = &pdev->dev;
 	hw->eint->hw = hw->soc->eint_hw;
@@ -402,11 +412,6 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	hw->eint->gpio_xlate = &mtk_eint_xt;
 
 	return mtk_eint_do_init(hw->eint);
-
-err_free_eint:
-	devm_kfree(hw->dev, hw->eint);
-	hw->eint = NULL;
-	return ret;
 }
 EXPORT_SYMBOL_GPL(mtk_build_eint);
 
-- 
2.34.1


