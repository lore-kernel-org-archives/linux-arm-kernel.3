Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78908E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIyxzXd5d6ZouA8qCbnBtazDyt0DrETGp9j8R7tiAm4=; b=gJtN3eQkihLfp0hoVQnZSDTjnw
	pHZNXHMNR4AjNFBeeO50N9MD+I0zmigWgcGLqiLuoKWOVdhxrzG+RwTN1IWXWhNdFOC/ZEosqgqv+
	80i+xiFo3nAQMmyt+cu8j18PfLD0So5CcHOW52+RAMaQNBbndKJPptpB+FgABB600Y92Z7VuGjJ9q
	5UwB6X9V49HqmRqSG/J2xZDEuR3Klrcl5Kq0N6+V7MQBnQbHa+f8HmlLqW3fqbSHmvxEF8C0BzLXu
	HdmitNPTSy481eafsqnby1bJOqgzL32a6tpLLXI1ZWGCXsCyJwgS2OClFLW9kw6M8agr0p9h9PpzS
	DWp8JN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQNKC-0000000DX4J-2sSZ;
	Wed, 25 Dec 2024 09:05:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQNGg-0000000DWST-0Jrt;
	Wed, 25 Dec 2024 09:01:27 +0000
X-UUID: cda6f9bcc29e11ef82ff63e91e7eb18c-20241225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NIyxzXd5d6ZouA8qCbnBtazDyt0DrETGp9j8R7tiAm4=;
	b=Fymu8Zdvua5KDL+eehPyxiWt5VBTz0YiND4nRyBrEFt2nZWxFqR27lGj+lpAeWOny4Wn1SPe32o1pSDTEkiZYRfqnkikEIuuFkHUHAWJWYwLUcaNSw7Q/loNVnZcsolmtdoB9p7sbNB29dQ0rB08McLuHme+oxBKw97iy705U2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:6696c226-7bb8-4e15-9822-e16fba53618c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a217df36-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cda6f9bcc29e11ef82ff63e91e7eb18c-20241225
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 628387227; Wed, 25 Dec 2024 02:01:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Dec 2024 17:01:15 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Dec 2024 17:01:15 +0800
From: bo.kong <bo.kong@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>
CC: <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 1/4] arm64: dts: mt8188: add aie node
Date: Wed, 25 Dec 2024 17:00:20 +0800
Message-ID: <20241225090113.17027-2-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241225090113.17027-1-bo.kong@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_010126_155451_1FC18E8D 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Bo Kong <Bo.Kong@mediatek.com>

Add aie node and related node.

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---

Changes in v3:
1. Remove dts non-MMIO nodes

Changes in v2:
1. Add AIE node and related node
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index faccc7f16259..d41f5bea3e65 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2270,12 +2270,45 @@ imgsys_wpe1: clock-controller@15220000 {
 			#clock-cells = <1>;
 		};
 
+		aie: aie@15310000 {
+			compatible = "mediatek,mt8188-aie";
+			reg = <0 0x15310000 0 0x1000>;
+			interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,larb = <&larb12>;
+			iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+				 <&ipesys CLK_IPE_FDVT>,
+				 <&ipesys CLK_IPE_SMI_LARB12>,
+				 <&ipesys CLK_IPESYS_TOP>;
+			clock-names = "img_ipe",
+				      "ipe_fdvt",
+				      "ipe_smi_larb12",
+				      "ipe_top";
+		};
+
 		ipesys: clock-controller@15330000 {
 			compatible = "mediatek,mt8188-ipesys";
 			reg = <0 0x15330000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb12: larb@15340000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x15340000 0 0x1000>;
+			mediatek,larb-id = <SMI_L12_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+			mediatek,smi-sub-comm = <&smi_img1>;
+			mediatek,smi-sub-comm-inport = <0>;
+			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+				 <&ipesys CLK_IPE_SMI_LARB12>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+		};
+
 		imgsys_wpe2: clock-controller@15520000 {
 			compatible = "mediatek,mt8188-imgsys-wpe2";
 			reg = <0 0x15520000 0 0x1000>;
-- 
2.45.2


