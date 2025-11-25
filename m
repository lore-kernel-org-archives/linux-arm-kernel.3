Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC9CFD375
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 02:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6QtJlfCbi2vmRizwzAAbAg9tkpq0rLQMlJsmLOUvTE=; b=z+C2ymtEJamwh9G3njnSc+51vh
	gvA/XpcnrNixqSZt9BVSpxJMiHUsZ4ZJ654gJ62Sr8TV4C27WzyYjggE794an8eMzvCFOyKmTOJrU
	TqHd+jAN2alCgCDUqBS+m3dwtXXxIoqYJ/ggXWA+UqPvyxQz69uVILRaaxvB1RQwSQDNcIFc/6fXL
	jHc66Hw28HQNhyCLXAeRgT5T8ZPn30Tpel8HHBW1+DdIROk4MJAMQXsUk8CRzJzAAgxtT4jXL3Zcg
	fXV2R2fYgiqf9Q58YxFEuxpqeBTuJcUFyOaOdHNv8xytDzL0kZZAs+aN9m06IqoOj6AUrY6xUorgy
	V4rz00fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNivH-0000000Ccl0-1GmG;
	Tue, 25 Nov 2025 02:36:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNivE-0000000CcjO-03ng;
	Tue, 25 Nov 2025 02:36:53 +0000
X-UUID: 963bbc0ec9a711f0a52f393f94899d25-20251124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o6QtJlfCbi2vmRizwzAAbAg9tkpq0rLQMlJsmLOUvTE=;
	b=F1OGCNsZPRhYg/zCFEgczClQKEdyld1019ueJCFR1GT/j8lHBNEOvNMwweupXxwXhIaTltpf5aIMDFX9JeHoCGqvUz8G7wYtH3XlQHmfI4Uz6mDe0zwt027rQHEaeZ72NCf+jSRsn702LUL5fngorx5pa2nN0GcMM60Efkc1Fio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:88d750b1-47f3-4c4b-883c-587879651406,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:053b846b-ffd0-409b-bec6-a38e02803690,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 963bbc0ec9a711f0a52f393f94899d25-20251124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <lei.xue@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1419365984; Mon, 24 Nov 2025 19:36:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 25 Nov 2025 10:36:43 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 25 Nov 2025 10:36:43 +0800
From: Lei Xue <lei.xue@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<yong.mao@mediatek.com>, <lei.xue@mediatek.com>, <qingliang.li@mediatek.com>,
	<Fred-WY.Chen@mediatek.com>, <ot_cathy.xu@mediatek.com>,
	<ot_shunxi.zhang@mediatek.com>, <ot_yaoy.wang@mediatek.com>,
	<ot_ye.wang@mediatek.com>
Subject: [PATCH 2/3] pinctrl: mediatek: Add acpi support
Date: Tue, 25 Nov 2025 10:36:35 +0800
Message-ID: <20251125023639.2416546-3-lei.xue@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125023639.2416546-1-lei.xue@mediatek.com>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_183652_056188_91526EF3 
X-CRM114-Status: GOOD (  18.46  )
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

Add acpi support in the common part of pinctrl driver. Parsing
hardware base addresses and irq number to initialize eint
accroding to the acpi table data.

Signed-off-by: Lei Xue <lei.xue@mediatek.com>
---
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 24 +++++++++++++++----
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  6 +++--
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 4918d38abfc2..afa406afead2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -369,18 +369,30 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	int ret, i, j, count_reg_names;
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
+	struct resource *res;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
+	if (is_of_node(fwnode) && !of_property_read_bool(np, "interrupt-controller"))
 		return -ENODEV;
 
 	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
 	if (!hw->eint)
 		return -ENOMEM;
 
-	count_reg_names = of_property_count_strings(np, "reg-names");
+	if (is_of_node(fwnode)) {
+		count_reg_names = of_property_count_strings(np, "reg-names");
+	} else {
+		count_reg_names = 0;
+		for (i = 0; i < pdev->num_resources; i++) {
+			struct resource *r = &pdev->resource[i];
+
+			if (resource_type(r) == IORESOURCE_MEM)
+				count_reg_names++;
+		}
+	}
 	if (count_reg_names < 0)
 		return -EINVAL;
 
@@ -396,14 +408,18 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	}
 
 	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
-		hw->eint->base[j] = of_iomap(np, i);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		hw->eint->base[j] = is_of_node(fwnode) ? of_iomap(np, i) :
+					ioremap(res->start, resource_size(res));
 		if (IS_ERR(hw->eint->base[j])) {
 			ret = PTR_ERR(hw->eint->base[j]);
 			goto err_free_eint;
 		}
 	}
 
-	hw->eint->irq = irq_of_parse_and_map(np, 0);
+	hw->eint->irq = is_of_node(fwnode)
+			? irq_of_parse_and_map(np, 0)
+			: platform_get_irq(pdev, 0);
 	if (!hw->eint->irq) {
 		ret = -EINVAL;
 		goto err_free_eint;
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 2cf61cfe809e..9c2751b9b065 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -1008,6 +1008,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	int err, i;
 
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
@@ -1032,8 +1033,9 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < hw->soc->nbase_names; i++) {
-		hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
-					hw->soc->base_names[i]);
+		hw->base[i] = is_of_node(fwnode)
+			? devm_platform_ioremap_resource_byname(pdev, hw->soc->base_names[i])
+			: devm_platform_get_and_ioremap_resource(pdev, i, NULL);
 		if (IS_ERR(hw->base[i]))
 			return PTR_ERR(hw->base[i]);
 	}
-- 
2.45.2


