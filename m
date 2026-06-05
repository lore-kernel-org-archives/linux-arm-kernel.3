Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5854ACD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4AKIh7Mj0OmWPLuKhbFzQYpPhTqwlEf+z/MPTYUcDv0=; b=N6RcDqNWFXxCtSfgugxgfGtbWt
	aTmKGHVd0aAwwD1/FJpiE3+PMgzfvqDdxw4kHEqSNDJCFN1v5HpJXyyUSdh+MyRisiIdoA2gXduep
	SCErGclXa03qsaVLK6G3s44L7sM5hsJ/8adi8gOXXwUdQ2BSdyKPD8dKdoYvuF12LgQj0MIz2PdPh
	AmLzTd5nH5lyMuPzoHZh13NUYBoj6UUWT5nr8VRhukTH152IYT0c8ia4moK7EouB36udgZgz8UCQu
	RZcOMozu0xHedhQJQxWT3GRfdaJTYTYHlt5DZJ5iHmnXKNPdvB9dJTnx9wL/exIWMTUQxQWrWNjnU
	oUJRiQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPvh-00000000JgU-1Q0k;
	Fri, 05 Jun 2026 08:29:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPvf-00000000Jfu-03jb;
	Fri, 05 Jun 2026 08:29:24 +0000
X-UUID: a513ee2e60b811f1afed4741b24580c9-20260605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4AKIh7Mj0OmWPLuKhbFzQYpPhTqwlEf+z/MPTYUcDv0=;
	b=Dew+BYo8P71P46/xZ7flXAOhRLlW21P7NsMZdVPAnYuB99B+kLCARSSB3y1yJmzqDalACIMXZX+ivycatLWeDNBz1pK1Pue64SLhHtfB9sQuP5r8oRV/h4jjbm8dbDcEqb2h6zCC2VxWYOR9QDzChD4RAXQN+x/WLl9ezIBekLI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:ae86fb5e-044f-4e77-b1c9-0249388e3a15,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:a0178503-5b7c-4de7-bc39-cc187eea3c57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a513ee2e60b811f1afed4741b24580c9-20260605
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <sarang.chaudhari@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 152436165; Fri, 05 Jun 2026 01:29:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 16:29:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 16:29:15 +0800
From: Sarang Chaudhari <sarang.chaudhari@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sarang Chaudhari
	<sarang.chaudhari@mediatek.com>
Subject: [PATCH v6 2/4] arm64: dts: mediatek: mt8188: Add AIE face detection node
Date: Fri, 5 Jun 2026 16:29:05 +0800
Message-ID: <20260605082913.2590205-1-sarang.chaudhari@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_012923_227607_40641111 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

Add the AI Engine (AIE) device tree node for the MT8188 SoC. The AIE
hardware provides face detection, facial landmark detection, and face
attribute analysis capabilities.

Signed-off-by: Sarang Chaudhari <sarang.chaudhari@mediatek.com>
---
Changes in v6:
- Remove iommus and mediatek,larb properties (made optional).
- Remove larb12 node (not required when IOMMU is not used).
- Update IRQ number to correct hardware value.

Changes in v5:
- Modify the name of clock, change _ to -.

Changes in v4: None

Changes in v3:
- Remove dts non-MMIO nodes.

Changes in v2:
- Add AIE node and related node.

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index ee833c3..29d11d8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -12,6 +12,19 @@
 			#reset-cells = <1>;
 		};
 
+		aie@15310000 {
+			compatible = "mediatek,mt8188-aie";
+			reg = <0 0x15310000 0 0x1000>;
+			interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+				 <&ipesys CLK_IPE_FDVT>,
+				 <&ipesys CLK_IPE_SMI_LARB12>,
+				 <&ipesys CLK_IPESYS_TOP>;
+			clock-names = "img-ipe", "ipe-fdvt",
+				      "ipe-smi-larb12", "ipe-top";
+			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+		};
+
 		ipesys: clock-controller@15330000 {
 			compatible = "mediatek,mt8188-ipesys";
 			reg = <0 0x15330000 0 0x1000>;
-- 
2.45.2


