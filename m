Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F357C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 13:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHG0wIAtoOemWkPtzFx9h/lFGmdkP7r/cg9y4ucBGZw=; b=I7SWxi8+dF9i895JTRZxveX+0M
	e2+8sfCPgaN2LCdHsc/zJStSDLm+zbmWxjQn2UGrjBgakYTM3opSBqREjBqQWpjYOrEJLyBfQTQ3Q
	QyYbQFJZaCFp9JcWhEhy28RaZ/cxb74v9Md3ja1djwkgdtRp/ik78oFsvCOMExZDiZH0fsgx4uymM
	xX9u4/EZocZYkOjuW3sf1Tm9YHgRfHRHXIte1+22o5j1ahHL6pKqjEr8//cuZtIkcMewHYuji7khh
	LPhhPbr7OLzqz1BStaREjd7yKmavIV6CA8oFcoufO6+021VvqIJPPxrC+mOnk6BiSBd5F6ByKqvJt
	nEnpV9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJzS-0000000EnFQ-0aKR;
	Fri, 24 Jan 2025 13:44:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJvq-0000000EmPO-2va1;
	Fri, 24 Jan 2025 13:41:11 +0000
X-UUID: dcb8b342da5811ef82ff63e91e7eb18c-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vHG0wIAtoOemWkPtzFx9h/lFGmdkP7r/cg9y4ucBGZw=;
	b=FbbuCz5rig0R7dbLi2deTTtoi+6AIC9FRf9g4jLH63nUgcKz/R2ihcB1kI+ijtmBxWKIt+nnWRAQgtIMaRY5TXJ2C/sM34GXczh/bqnqehi+13IlDNBwZr9up/J1DdqDYnuaXZF2VVa85WmQg+3PBYxzLVJovghWuVXcbipoFXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:947f6ff0-43c3-48e4-9d10-f0c6faebdf2c,IP:0,U
	RL:0,TC:0,Content:29,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:4
X-CID-META: VersionHash:60aa074,CLOUDID:7117c0fe-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dcb8b342da5811ef82ff63e91e7eb18c-20250124
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 87694891; Fri, 24 Jan 2025 06:41:06 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 24 Jan 2025 21:41:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 24 Jan 2025 21:41:03 +0800
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
Subject: [PATCH v3 2/2] pinctrl: mediatek: adapt to multi-base design
Date: Fri, 24 Jan 2025 21:40:14 +0800
Message-ID: <20250124134025.2666-3-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250124134025.2666-1-ot_chhao.chang@mediatek.com>
References: <20250124134025.2666-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_054110_758139_2ECB4C82 
X-CRM114-Status: GOOD (  14.92  )
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

The eint num will obtain the operation address through pins.
Change the traversal method of irq handle from traversing a set of
registers to traversing one by one.

Change-Id: I3962b78042d32501a73153201cddf52c6b62a695
Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 38 +++++++++++++++++++----------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 540245c3128d..949a20196f74 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -513,6 +513,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 int mtk_eint_do_init(struct mtk_eint *eint)
 {
 	unsigned int size, i, port;
+	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
 
 	/* If clients don't assign a specific regs, let's use generic one */
 	if (!eint->regs)
@@ -523,11 +524,11 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 	if (!eint->base_pin_num)
 		return -ENOMEM;
 
-	if (!eint->pins) {
+	if (eint->nbase == 1) {
 		size = eint->hw->ap_num * sizeof(struct mtk_eint_pin);
 		eint->pins = devm_kmalloc(eint->dev, size, GFP_KERNEL);
 		if (!eint->pins)
-			return -ENOMEM;
+			goto err_eint;
 
 		eint->base_pin_num[0] = eint->hw->ap_num;
 		for (i = 0; i < eint->hw->ap_num; i++) {
@@ -536,34 +537,29 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
 		}
 	} else {
+		eint->pins = hw->soc->eint_pin;
 		for (i = 0; i < eint->hw->ap_num; i++)
 			eint->base_pin_num[eint->pins[i].instance]++;
 	}
 
 	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
-	if (!eint->wake_mask)
-		return -ENOMEM;
-
 	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
-	if (!eint->wake_mask)
-		return -ENOMEM;
+	if (!eint->wake_mask || !eint->wake_mask)
+		goto err_eint;
 
 	for (i = 0; i < eint->nbase; i++) {
 		port = (eint->base_pin_num[i] + 31) / 32;
 		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
-		if (!eint->wake_mask[i])
-			return -ENOMEM;
-
 		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
-		if (!eint->cur_mask[i])
-			return -ENOMEM;
+		if (!eint->cur_mask[i] || !eint->wake_mask[i])
+			goto err_eint;
 	}
 
 	eint->domain = irq_domain_add_linear(eint->dev->of_node,
 					     eint->hw->ap_num,
 					     &irq_domain_simple_ops, NULL);
 	if (!eint->domain)
-		return -ENOMEM;
+		goto err_eint;
 
 	if (eint->hw->db_time) {
 		for (i = 0; i < MTK_EINT_DBNC_MAX; i++)
@@ -585,6 +581,22 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 					 eint);
 
 	return 0;
+
+err_eint:
+	for (i = 0; i < eint->nbase; i++) {
+		if (eint->wake_mask[i])
+			devm_kfree(eint->dev, eint->wake_mask[i]);
+		if (eint->cur_mask[i])
+			devm_kfree(eint->dev, eint->cur_mask[i]);
+	}
+	if (eint->cur_mask)
+		devm_kfree(eint->dev, eint->cur_mask);
+	if (eint->wake_mask)
+		devm_kfree(eint->dev, eint->wake_mask);
+	if (eint->nbase == 1)
+		devm_kfree(eint->dev, eint->pins);
+	devm_kfree(eint->dev, eint->base_pin_num);
+	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(mtk_eint_do_init);
 
-- 
2.46.0


