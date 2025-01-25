Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13546C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHG0wIAtoOemWkPtzFx9h/lFGmdkP7r/cg9y4ucBGZw=; b=Hja2yt3t+ZQ+8/hC1/aOgi3D9T
	Z5y8IrvnKqkeUx+fBtU5s0Pybz3G/y864MnERc6k/Lt/HE8LoLh9aOeSaApN5FJe5vc0Z1CZfUlok
	0BxzhYs/dFqCVql91Bh5YqaYtvKVoHJ3Dk5g1Sa0Bf/xBgeVwsqSycQgle1/49R7rHESVFWPNdfOH
	UIiwcCUPrx0ho8kcxYqdgTBC/P1g5JPCuLQn/Q8Ub51Jw1SKax8BMFt/sMwNWv/cm6/CtACo4W51E
	1ewC3OUoiqbEgqlj1qynuo2SU9XJ0/evqupc/4LIDdg9sfDK8yB/BRU19lg64j+fOO2+5xUwOlbu6
	UJIzonbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbWL0-0000000Fw3c-3cJn;
	Sat, 25 Jan 2025 02:55:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbWHD-0000000FvhS-2pzw;
	Sat, 25 Jan 2025 02:52:04 +0000
X-UUID: 5818d936dac711ef82ff63e91e7eb18c-20250124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vHG0wIAtoOemWkPtzFx9h/lFGmdkP7r/cg9y4ucBGZw=;
	b=U7f5PjIjFKjlioN9mNPhq1BC0h8SrwJmxKZ9vZ0CRc2Ug3uPMwzfju3bwkOUsRVq1yUKAmDidR+7yXc7lzmIB1sH0GoBc8xC0u0uRNAzBAxyi5Vm17YkQHKLakaBQpXqtCX7C9+As0Eoje4ON/9l0AEZfjtMSr5BS5RKkjY+D4U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:a57e2111-35e0-480a-92de-9f1211061deb,IP:0,U
	RL:0,TC:0,Content:29,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:4
X-CID-META: VersionHash:60aa074,CLOUDID:3672b07e-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:1,
	IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5818d936dac711ef82ff63e91e7eb18c-20250124
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1083577739; Fri, 24 Jan 2025 19:51:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 25 Jan 2025 10:51:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 25 Jan 2025 10:51:54 +0800
From: Hao Chang <ot_chhao.chang@mediatek.com>
To: Sean Wang <seann.wang@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen
	<hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Hao
 Chang <ot_chhao.chang@mediatek.com>
Subject: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
Date: Sat, 25 Jan 2025 10:51:23 +0800
Message-ID: <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250125025145.14405-1-ot_chhao.chang@mediatek.com>
References: <20250125025145.14405-1-ot_chhao.chang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_185203_714625_C4C82D33 
X-CRM114-Status: GOOD (  14.43  )
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


