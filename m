Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA28DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxd6y8xWCXx2qwD35/Qus8yO+IDrLVV1lvVQaT0RaxQ=; b=j4BX4zeVdfvudVDv+ZnB64oOGY
	kM40NWRQKxouxUmPWEYN1fMTW+HNZ0QKowgFhysPmCB0GwcdrEEfGiYHq+Vr1hzaOjutdmw3xvSsZ
	qEdNN1atvpYjlgHCXvKpLbxoshg+I5vE/ui8OgU38OcPZvcJNzc5J58YFLGCVbZrJboTpwFOZjCac
	wygb0THYu+0XaNfQ205nPYJYHUwQwDvW9EJ8Y27LSziZl8xVanb4ViqIGHGWRnrCnh3QDDmVqPWvY
	ekcQ/sZnU6XZyYkDxqHK1ePxdgsydNecLCsfhOhT7s+0F7vUdHJkX3q6uvcAeeq6FYsEE4zVxoQ9p
	o7k6ZQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKB3-0000000EoZT-3PEa;
	Fri, 24 Jan 2025 13:56:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbK4K-0000000Ensk-3roK;
	Fri, 24 Jan 2025 13:49:58 +0000
X-UUID: 152ae62cda5a11ef9048ed6ed365623b-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mxd6y8xWCXx2qwD35/Qus8yO+IDrLVV1lvVQaT0RaxQ=;
	b=lfbW/1iokKiUSNHRjiBO4bhUFKT7SpKNoPiGtaL8hU0Imtsgf3Ljnoc3fBTxMv/mYa69p7BAdPD6UuczLhhkVOuFPtN7DYYoZpeBNfO3rJKJv0VvTtw4ovSUvAL8T9MmtmsGlqartZ0HHRl7R91ITtn7AMzkOFoU8hZHf1R+DjM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:efed1833-27fe-4705-ace5-f5d9ab554bf5,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:8877a53d-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 152ae62cda5a11ef9048ed6ed365623b-20250124
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2103134366; Fri, 24 Jan 2025 06:49:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 21:49:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 21:49:47 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Hao
 Chang" <ot_chhao.chang@mediatek.com>
Subject: [PATCH v3 1/2] pinctrl: mediatek: update EINT base retrieval method
Date: Fri, 24 Jan 2025 21:49:05 +0800
Message-ID: <20250124134918.2779-2-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250124134918.2779-1-ot_chhao.chang@mediatek.com>
References: <20250124134918.2779-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_054956_955046_86CCA5F7 
X-CRM114-Status: GOOD (  15.98  )
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

Change-Id: I708f2eaa4c57b5705201025c252a7122914c4a40
Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 50 +++++++++++++------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 6411c10cb637..e74fc68f631d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -368,7 +368,7 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	unsigned int i, j, count_reg_names;
+	int ret, i, j, count_reg_names;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
@@ -377,7 +377,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		return -ENODEV;
 
 	count_reg_names = of_property_count_strings(np, "reg-names");
-	if (count_reg_names < 0 || count_reg_names < hw->soc->nbase_names)
+	if (count_reg_names < hw->soc->nbase_names)
 		return -EINVAL;
 
 	hw->eint = devm_kmalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
@@ -385,33 +385,53 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		return -ENOMEM;
 
 	hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
-	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
+	hw->eint->base = devm_kmalloc_array(hw->dev, hw->eint->nbase,
 					    sizeof(*hw->eint->base), GFP_KERNEL);
-	if (!hw->eint->base)
-		return -ENOMEM;
+	if (!hw->eint->base) {
+		ret = -ENOMEM;
+		goto err_free_eint;
+	}
 
 	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
 		hw->eint->base[j] = of_iomap(np, i);
-		if (IS_ERR(hw->eint->base[j]))
-			return PTR_ERR(hw->eint->base[j]);
+		if (IS_ERR(hw->eint->base[j])) {
+			ret = PTR_ERR(hw->eint->base[j]);
+			goto err_free_eint;
+		}
 	}
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
-		return -ENODEV;
+	if (!of_property_read_bool(np, "interrupt-controller")) {
+		ret = -ENODEV;
+		goto err_free_eint;
+	}
 
 	hw->eint->irq = irq_of_parse_and_map(np, 0);
-	if (!hw->eint->irq)
-		return -EINVAL;
-
-	if (hw->soc->eint_pin)
-		hw->eint->pins = hw->soc->eint_pin;
+	if (!hw->eint->irq) {
+		ret = -EINVAL;
+		goto err_free_eint;
+	}
 
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
+
+err_free_eint:
+	for (j = 0; j < hw->eint->nbase; j++) {
+		if (hw->eint->base[j])
+			iounmap(hw->eint->base[j]);
+	}
+	if (hw->eint->base)
+		devm_kfree(hw->dev, hw->eint->base);
+	devm_kfree(hw->dev, hw->eint);
+	hw->eint = NULL;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mtk_build_eint);
 
-- 
2.46.0


