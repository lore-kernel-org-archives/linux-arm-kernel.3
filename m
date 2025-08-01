Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B6EC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cn2RoAisMKaAgdwYwaUWd9l5blW+koqxiGIwZNbsspk=; b=YeHse/Gh13P5rtLrEjKUXRUYLO
	wSXIblRWpPO3iE1DVB6H6NTI8sGijJX6Aqd3Hn5mChTN1xI2lNkA/1qtFJ5QwgPKs6ucIrf9zomSE
	S1Uua6tpjnTR8B6caDHF7H34f0i52k+TYWqVkkbPoWJEOuTPMJ5IZ8bncv5huvC0CInXW7jsOReGK
	TmAK71P1YArTDMYuWY3a/D9KAUPshLu2yPr/sGyb2n1/heq8abIOjS7wxd3Zyu4hC8wZ5A83nfkwM
	8cmCHO0A6fU0E1mUE3Un8nieTi2JM6xjfDdGBALUsCLRYY6WSv4rpoR3CGWIcSAX+MiJ9eIADzk0y
	uoYE+A3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhk3g-000000057nX-01cE;
	Fri, 01 Aug 2025 07:20:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjtS-000000056H7-1chl;
	Fri, 01 Aug 2025 07:09:31 +0000
X-UUID: 740e64e46ea611f09eb0dd999d3936bf-20250801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cn2RoAisMKaAgdwYwaUWd9l5blW+koqxiGIwZNbsspk=;
	b=Yx03isguInoReYLzSgAx5TSR+1qmFNfoc9yY42tkd9X1L63CTAHZ0hEI3TUTNVd/k294V3LKOtlLkRtqvdsRjQDxvGtkmyGsUpdPMaPVx6f6l2adVDuEtS87j2UObsvSV1GxGyIrXRrbCdhIYqbGItSqx9F/NeTR4tpL1gJR1IA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3e0662b1-226d-40b2-ad59-0703c26e0870,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:04b0660f-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 740e64e46ea611f09eb0dd999d3936bf-20250801
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 461825912; Fri, 01 Aug 2025 00:09:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 1 Aug 2025 15:09:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 1 Aug 2025 15:09:20 +0800
From: niklaus.liu <niklaus.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Flora Fu
	<flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, niklaus.liu
	<niklaus.liu@mediatek.com>
Subject: [PATCH 3/3] regulator: Modify mt6315 regulator mode mask
Date: Fri, 1 Aug 2025 14:39:37 +0800
Message-ID: <20250801070913.3109-4-niklaus.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250801070913.3109-1-niklaus.liu@mediatek.com>
References: <20250801070913.3109-1-niklaus.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_000930_436782_900D320B 
X-CRM114-Status: GOOD (  11.48  )
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

Modify mt6315 regulator mode mask, compatible with all 6315 models

Signed-off-by: niklaus.liu <niklaus.liu@mediatek.com>
---
 drivers/regulator/mt6315-regulator.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index 2608a6652d77..092ff748fe21 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -218,8 +218,10 @@ static int mt6315_regulator_probe(struct spmi_device *pdev)
 	struct regmap *regmap;
 	struct mt6315_chip *chip;
 	struct mt_regulator_init_data *init_data;
+	struct device_node *node = pdev->dev.of_node;
 	struct regulator_config config = {};
 	struct regulator_dev *rdev;
+	unsigned int val = 0;
 	int i;
 
 	regmap = devm_regmap_init_spmi_ext(pdev, &mt6315_regmap_config);
@@ -247,6 +249,10 @@ static int mt6315_regulator_probe(struct spmi_device *pdev)
 		init_data->modeset_mask[MT6315_VBUCK1] = BIT(MT6315_VBUCK1);
 		break;
 	}
+
+	if (!of_property_read_u32(node, "buck1-modeset-mask", &val))
+		init_data->modeset_mask[MT6315_VBUCK1] = val;
+
 	for (i = MT6315_VBUCK2; i < MT6315_VBUCK_MAX; i++)
 		init_data->modeset_mask[i] = BIT(i);
 
-- 
2.46.0


