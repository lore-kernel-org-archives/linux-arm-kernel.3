Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FA8C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mud+iDg4MCst5FqYuld9wlN2wQNOH84EC+hVthJ8uLo=; b=ejTSc1Aw52ZMJ7KQp2rMbBDCRN
	+ADdQJvATYc3hDwBvOv1LRS9HAsQw5HWKhOLqC6TSnkhOa7+gjbobK6zaMvDnEUxdKas5OAkn52us
	Zuf4SH0dKSUcikFu+V4njsDIXNTkFXhWwpwe/6sNsW5g2j2A1agRiy0vY4IAyd52j5g/ruXFYtLuc
	CwhXeAwK5N0oJ81+vaevFUo43PQMALQsAY0uE0nrIVmrZZ5Yw7PK3RcsacfOFSt94Wsp+zNNl/xCV
	e2edU2iZIIj84VrFHAdVnbNqKypYBqlzUYjySpbu5NrjTtmif4lGZV8WHM9GKNyjsfDhYyTRbW9zg
	GEE8rLDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyMEO-0000000Ed9G-0ncg;
	Sat, 29 Mar 2025 02:47:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyMCe-0000000Ed4z-1Swp;
	Sat, 29 Mar 2025 02:45:45 +0000
X-UUID: e63216ae0c4711f083f2a1c9db70dae0-20250328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Mud+iDg4MCst5FqYuld9wlN2wQNOH84EC+hVthJ8uLo=;
	b=VtcpE4Gt5/Fm5lGshyGRnCNCwOrErrahaOJDD3FYHasvLEhlRXC4YfiUX6xXjDTkLeO45v9bFJLGYYCf+S8KSNkUYSf987S8aPnNclmA8mrrQ6r59zlDj6I0Hq3tPtNeTN+CR7SR/D8rUCMx3Up8LSekSm1tVM8rD4JD0OBXcf0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:79736d77-f08c-47ba-826d-c9e47513c624,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:37a9b34a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e63216ae0c4711f083f2a1c9db70dae0-20250328
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ot_chhao.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1151922104; Fri, 28 Mar 2025 19:45:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 29 Mar 2025 10:45:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 29 Mar 2025 10:45:35 +0800
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
Subject: [PATCH] pinctrl: mediatek: Fix the invalid conditions
Date: Sat, 29 Mar 2025 10:40:29 +0800
Message-ID: <20250329024533.5279-1-ot_chhao.chang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_194544_401757_85F57F74 
X-CRM114-Status: GOOD (  13.02  )
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

The variable count_reg_names is defined as an int type and cannot be
directly compared to an unsigned int. To resolve this issue,
first verify the correctness of count_reg_names.

https://lore.kernel.org/all/5ae93d42e4c4e70fb33bf35dcc37caebf324c8d3.camel@mediatek.com/T/

Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c              | 4 ++--
 drivers/pinctrl/mediatek/mtk-eint.h              | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 7 +++++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index ced4ee509b5b..557dec75fa03 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -507,7 +507,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 
 int mtk_eint_do_init(struct mtk_eint *eint)
 {
-	unsigned int size, i, port, inst = 0;
+	unsigned int size, i, port, virq, inst = 0;
 	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
 
 	/* If clients don't assign a specific regs, let's use generic one */
@@ -584,7 +584,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 		if (inst >= eint->nbase)
 			continue;
 		eint->pin_list[inst][eint->pins[i].index] = i;
-		int virq = irq_create_mapping(eint->domain, i);
+		virq = irq_create_mapping(eint->domain, i);
 		irq_set_chip_and_handler(virq, &mtk_eint_irq_chip,
 					 handle_level_irq);
 		irq_set_chip_data(virq, eint);
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index f7f58cca0d5e..0c6bf7cbdc3a 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -66,7 +66,7 @@ struct mtk_eint_xt {
 struct mtk_eint {
 	struct device *dev;
 	void __iomem **base;
-	u8 nbase;
+	int nbase;
 	u16 *base_pin_num;
 	struct irq_domain *domain;
 	int irq;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index d1556b75d9ef..0884c0700b3e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -381,10 +381,13 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 		return -ENOMEM;
 
 	count_reg_names = of_property_count_strings(np, "reg-names");
-	if (count_reg_names < hw->soc->nbase_names)
+	if (count_reg_names < 0)
+		return -EINVAL;
+
+	hw->eint->nbase = count_reg_names - (int)hw->soc->nbase_names;
+	if (hw->eint->nbase <= 0)
 		return -EINVAL;
 
-	hw->eint->nbase = count_reg_names - hw->soc->nbase_names;
 	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
 					    sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
 	if (!hw->eint->base) {
-- 
2.46.0


