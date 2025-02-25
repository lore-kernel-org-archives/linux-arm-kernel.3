Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4535EC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Qi8cCPLaX4275PMkDxz1m99StqNcEg9glNxJpwmiy8=; b=yGaFY5FQYmbqZ5tzxdi5DK8ZDO
	j01vMlSHDNFUGdURBK7v2nnKLLy4izQ4U0JzIUwKZlu6OvToZc6N084YrruizjL1y1pnTAGhgOT4W
	1XCozVUAodOmhO5zzzTPwFRv1EGKxFQWlv3d6wi5T+hrjyfy3v/qbd9LMl5Yba69S5wdQJfdxFG+9
	el8llz+daI07GUTRNS7fiG2FwKLyE/TT7etiNp/p2vJKAbb90EEnsA/ZPbETEJRRyB/YErFHHsjp9
	m18tzKQpWNy3qx3imDZU5ZCHh/zGuN1etBQ4Y/t8bnPkHItEZREoBVVfZGdXASMrfGDpkaHXDTSww
	IhS9Ilsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyA-00000000HUo-2T3P;
	Tue, 25 Feb 2025 16:39:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvbE-0000000HTNY-2cxx;
	Tue, 25 Feb 2025 14:07:53 +0000
X-UUID: e4877508f38111ef83f2a1c9db70dae0-20250225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3Qi8cCPLaX4275PMkDxz1m99StqNcEg9glNxJpwmiy8=;
	b=ejpbwUCXiaPCc8W7zllBoyLbngSTIPeTBJOzUMNlpyUdgB8SsP0GR4ibkJ+zfQVcH1nEBwUuxIeeOl+e+cRWf3CIpqbBV7QiL1AuKbBo6LWUho1XF9pH/jyOMOHwDMnix4bkQdA8kxdi+MWn+de7Z4yqewcxOiqNaGcTFaE0gNE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3989b2f1-aab0-448f-a600-28d2a883b549,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:ec1ae8d9-654e-41f2-8a8e-a96c1e834c64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e4877508f38111ef83f2a1c9db70dae0-20250225
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1873765590; Tue, 25 Feb 2025 07:07:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 25 Feb 2025 22:07:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 25 Feb 2025 22:07:44 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [PATCH v4 2/3] pinctrl: mediatek: modify the method of obtaining eint address
Date: Tue, 25 Feb 2025 22:07:23 +0800
Message-ID: <20250225140732.21557-3-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
References: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_060752_670488_C51485C4 
X-CRM114-Status: GOOD (  16.68  )
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

Increase nbase for address counting and pin number for calculating
pin count on address.

Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.h           |  4 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 49 ++++++++++++++-----
 2 files changed, 40 insertions(+), 13 deletions(-)

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
index 00e95682b9f8..9e87dddafb12 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 
 #include "mtk-eint.h"
@@ -367,21 +368,40 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
+	int ret, i, j, count_reg_names;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
+	if (!hw->soc->eint_hw)
 		return -ENODEV;
 
-	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
+	count_reg_names = of_property_count_strings(np, "reg-names");
+	if (count_reg_names < hw->soc->nbase_names)
+		return -EINVAL;
+
+	hw->eint = devm_kmalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
 	if (!hw->eint)
 		return -ENOMEM;
 
-	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
-	if (IS_ERR(hw->eint->base)) {
-		ret = PTR_ERR(hw->eint->base);
+	hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
+	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
+					    sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
+	if (!hw->eint->base) {
+		ret = -ENOMEM;
+		goto err_free_base;
+	}
+
+	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
+		hw->eint->base[j] = of_iomap(np, i);
+		if (IS_ERR(hw->eint->base[j])) {
+			ret = PTR_ERR(hw->eint->base[j]);
+			goto err_free_eint;
+		}
+	}
+
+	if (!of_property_read_bool(np, "interrupt-controller")) {
+		ret = -ENODEV;
 		goto err_free_eint;
 	}
 
@@ -391,19 +411,24 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		goto err_free_eint;
 	}
 
-	if (!hw->soc->eint_hw) {
-		ret = -ENODEV;
-		goto err_free_eint;
-	}
-
 	hw->eint->dev = &pdev->dev;
 	hw->eint->hw = hw->soc->eint_hw;
 	hw->eint->pctl = hw;
 	hw->eint->gpio_xlate = &mtk_eint_xt;
 
-	return mtk_eint_do_init(hw->eint);
+	ret = mtk_eint_do_init(hw->eint);
+	if (ret)
+		goto err_free_eint;
+
+	return 0;
 
 err_free_eint:
+	for (j = 0; j < hw->eint->nbase; j++) {
+		if (hw->eint->base[j])
+			iounmap(hw->eint->base[j]);
+	}
+	devm_kfree(hw->dev, hw->eint->base);
+err_free_base:
 	devm_kfree(hw->dev, hw->eint);
 	hw->eint = NULL;
 	return ret;
-- 
2.46.0


