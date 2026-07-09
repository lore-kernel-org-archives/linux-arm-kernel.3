Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7F4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsOpIbZPIpW3vePq2TGAjEbBxlV5IW78VvRPXgOdMvE=; b=XFaRrT8K2SWth+V2RHZyHlH+gH
	aMjkIqAhuwKbQoeJDiEptQJFJLkCb7wOeYNnb7R1dlpzjMgjIBwfLeuxYfBYjwmbKv+ouvQA2HDuG
	LraCTzT4eGC7Y4zQ/rP+KXqium9A77wOq9ANgFyuoEJo+jSuRLRuvfPHz8CuhA87xWjSNX04lY2yT
	SBD6qsgOzJ5/Jm0qZi3c2jOeuiHyJvt5BoNcwFwuTojcRRKEgSiFYbAblsVx7JYxSxIaRl5x5VKsi
	YOt6m54b4qYl41kTKcMe10PMuP6aHKN19H45mpXjL96qNngDYUXqsbg3fQD+S/IYEep7fUEW1FKeE
	XzhzHxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiLk-00000001BQG-03pu;
	Thu, 09 Jul 2026 06:35:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whiLh-00000001BOD-1mLa;
	Thu, 09 Jul 2026 06:35:06 +0000
X-UUID: 4f416bb27b6011f1afed4741b24580c9-20260708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UsOpIbZPIpW3vePq2TGAjEbBxlV5IW78VvRPXgOdMvE=;
	b=TmTwef20VtQuWmm3QLLjD+t1N0SFS2pN+xkU2driEp0dh/cf4uNHIUI/VCMN+UjNqG4GGDbxVP9pXLPuS1k17GVbhPmRhUnPnLMVk7cWFX4+SyRb+LXw/6g6XJumW75VCAEMU9GRbu2KRjuQewrvgxYtYRiXWqWok6EdIG7T3Rs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:8d9435c8-9a93-4c5b-b937-32ee5ae3a0e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:703069f5-d981-4e18-a7f9-85902326a8d4,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4f416bb27b6011f1afed4741b24580c9-20260708
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1758708101; Wed, 08 Jul 2026 23:35:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 14:34:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 14:34:57 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH v5 1/4] pinctrl: mediatek: use devm_gpiochip_add_data() for GPIO chip
Date: Thu, 9 Jul 2026 14:33:46 +0800
Message-ID: <20260709063450.1615041-2-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260709063450.1615041-1-justin.yeh@mediatek.com>
References: <20260709063450.1615041-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_233505_472039_2A561DE6 
X-CRM114-Status: GOOD (  15.59  )
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

The gpio_chip is allocated with device-managed memory but registered with
the non-managed gpiochip_add_data(). This was harmless while the drivers
were built-in, but once they can be built as modules and unbound/rmmod'd,
devm frees the gpio_chip's memory while it is still registered, causing a
use-after-free.

Register it with devm_gpiochip_add_data() so it shares the same
device-managed lifecycle, which also lets the manual gpiochip_remove()
error paths go away.

Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implements the generic pinctrl dt-bindings")
Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c      |  6 ++----
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++++----------
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 17e30f83dc19..38f15dbe9a28 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -594,7 +594,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->base		= -1;
 	chip->ngpio		= hw->soc->npins;
 
-	ret = gpiochip_add_data(chip, hw);
+	ret = devm_gpiochip_add_data(hw->dev, chip, hw);
 	if (ret < 0)
 		return ret;
 
@@ -608,10 +608,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	if (!of_property_present(hw->dev->of_node, "gpio-ranges")) {
 		ret = gpiochip_add_pin_range(chip, dev_name(hw->dev), 0, 0,
 					     chip->ngpio);
-		if (ret < 0) {
-			gpiochip_remove(chip);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index dd2c8aa03938..791eddd7a2c6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1130,30 +1130,24 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	pctl->chip->parent = &pdev->dev;
 	pctl->chip->base = -1;
 
-	ret = gpiochip_add_data(pctl->chip, pctl);
+	ret = devm_gpiochip_add_data(&pdev->dev, pctl->chip, pctl);
 	if (ret)
 		return -EINVAL;
 
 	/* Register the GPIO to pin mappings. */
 	ret = gpiochip_add_pin_range(pctl->chip, dev_name(&pdev->dev),
 			0, 0, pctl->devdata->npins);
-	if (ret) {
-		ret = -EINVAL;
-		goto chip_error;
-	}
+	if (ret)
+		return -EINVAL;
 
 	/* Only initialize EINT if we have EINT pins */
 	if (data->eint_hw.ap_num > 0) {
 		ret = mtk_eint_init(pctl, pdev);
 		if (ret)
-			goto chip_error;
+			return ret;
 	}
 
 	return 0;
-
-chip_error:
-	gpiochip_remove(pctl->chip);
-	return ret;
 }
 
 int mtk_pctrl_common_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 23f04b24fd65..09098b68f725 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -957,7 +957,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->base		= -1;
 	chip->ngpio		= hw->soc->npins;
 
-	ret = gpiochip_add_data(chip, hw);
+	ret = devm_gpiochip_add_data(hw->dev, chip, hw);
 	if (ret < 0)
 		return ret;
 
-- 
2.45.2


