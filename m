Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ADBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPsNNs9KKcxnwX5yrPHiFvRJBeS87FY0TR1JfHBnylY=; b=bxqjIEsBCStJtZ7x47WgeEvEQN
	e9iEr/90NMNDDG9qiV/wjYh+M4dIxLEh4dQrYky2qNz6mL0BqlOadpkaYwCcH4RDC7t93ui5kgkU0
	RdB6whxmIS1WfvpDyq+hWqNlPowfCfDCtcx2IHJixy9IgyMyZR0DaCCqp64SfmdI7bKypPTLPmg4x
	JF/KYeLaGQVbk+gHCfjC5c233OpKCJYt+1Yy13C9voN59WChFnnE+GRkCq8UxlIo7wHBXTPrxrhkC
	E4R6NMAZEqfbsJW70/Ke75WaPVGpWfxW5R020lOryDxj5877DkhInxInb3I3uaLuacAiS0JNrtvHM
	VeCxrfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllY1-00000007hah-0sQ9;
	Sat, 22 Feb 2025 09:11:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tllTs-00000007h5a-0mZ7;
	Sat, 22 Feb 2025 09:07:29 +0000
X-UUID: 6d7fb4c0f0fc11ef83f2a1c9db70dae0-20250222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HPsNNs9KKcxnwX5yrPHiFvRJBeS87FY0TR1JfHBnylY=;
	b=KArh123CRiWU2Mjd2AR0jC0eu0eNLqeTFFiYEdW1SfkR3rKKIx0zA2F3t0l5+1XMqbSN2pgaruO9uV6EDwOb4oRIudwvg5Mkl0pG0kITeV6akQuvNmZfCIUAsFiXV8wS/6vLHPWkdzdGSdpT4a7YmQl0nqLD6fho99jlljpE03g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:0e458cae-0340-47ec-9263-5ab0b55745e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:1ef070b5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6d7fb4c0f0fc11ef83f2a1c9db70dae0-20250222
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1341659067; Sat, 22 Feb 2025 02:07:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 22 Feb 2025 17:07:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 22 Feb 2025 17:07:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] phy: mediatek: xsphy: add support to set disconnect threshold
Date: Sat, 22 Feb 2025 17:07:10 +0800
Message-ID: <20250222090710.10909-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250222090710.10909-1-chunfeng.yun@mediatek.com>
References: <20250222090710.10909-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_010728_263356_420C0CB4 
X-CRM114-Status: GOOD (  10.55  )
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

Add a property to tune usb2 phy's disconnect threshold.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: change property name
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index 7c248f5cfca5..cac0f008bcb3 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -59,6 +59,7 @@
 #define XSP_USBPHYACR6		((SSUSB_SIFSLV_U2PHY_COM) + 0x018)
 #define P2A6_RG_BC11_SW_EN	BIT(23)
 #define P2A6_RG_OTG_VBUSCMP_EN	BIT(20)
+#define PA6_RG_U2_DISCTH	GENMASK(7, 4)
 
 #define XSP_U2PHYDTM1		((SSUSB_SIFSLV_U2PHY_COM) + 0x06C)
 #define P2D_FORCE_IDDIG		BIT(9)
@@ -95,6 +96,7 @@ struct xsphy_instance {
 	int eye_src;
 	int eye_vrt;
 	int eye_term;
+	int discth;
 };
 
 struct mtk_xsphy {
@@ -244,9 +246,12 @@ static void phy_parse_property(struct mtk_xsphy *xsphy,
 					 &inst->eye_vrt);
 		device_property_read_u32(dev, "mediatek,eye-term",
 					 &inst->eye_term);
-		dev_dbg(dev, "intr:%d, src:%d, vrt:%d, term:%d\n",
+		device_property_read_u32(dev, "mediatek,disconnect-threshold",
+					 &inst->discth);
+		dev_dbg(dev, "intr:%d, src:%d, vrt:%d, term:%d, discth:%d\n",
 			inst->efuse_intr, inst->eye_src,
-			inst->eye_vrt, inst->eye_term);
+			inst->eye_vrt, inst->eye_term,
+			inst->discth);
 		break;
 	case PHY_TYPE_USB3:
 		device_property_read_u32(dev, "mediatek,efuse-intr",
@@ -285,6 +290,9 @@ static void u2_phy_props_set(struct mtk_xsphy *xsphy,
 	if (inst->eye_term)
 		mtk_phy_update_field(pbase + XSP_USBPHYACR1, P2A1_RG_TERM_SEL,
 				     inst->eye_term);
+	if (inst->discth)
+		mtk_phy_update_field(pbase + XSP_USBPHYACR6, PA6_RG_U2_DISCTH,
+				     inst->discth);
 }
 
 static void u3_phy_props_set(struct mtk_xsphy *xsphy,
-- 
2.46.0


