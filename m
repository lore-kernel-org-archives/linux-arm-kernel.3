Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jeXEcVs1W9fNf4p4JHwGukyDUXKxMmPPhb4qarKAQ8=; b=fOyCW70tfsB+NCI8dCad7f1w9z
	MF14dui84+AJNmRcDVjcnIAfVUS7TGQASU34R/5Bbx+PAQ3lSvpzSvlNJsGO1fYTXbMp87slEy1Bz
	7bykca+/n8+4Tly+uQTY9AzqAkDlgmtrSmi+nNcxNXvCQ1S0I67rAZAZviE3OctrpEQ/4wmzxdwAW
	7PXgWRBbAo8pG01cql8ymmeaP06Phy8TAoWfddtKMnMEPVaWmF1qCBsdWyq4EWL/b7VFBz06Ulj4k
	YQ4aUk6NRi9KvBuPF72tVtKdnqJjEGkpCo2ueJeAMYcfEJiugVdBHKCYgT87/aLAR+gjXK4M3zWIc
	R3vV4U+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FGx-00000008AGx-3vxE;
	Thu, 03 Apr 2025 07:45:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FBQ-0000000895g-1FHH;
	Thu, 03 Apr 2025 07:40:17 +0000
X-UUID: dffa8f08105e11f0a1e849db4cc18d44-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+jeXEcVs1W9fNf4p4JHwGukyDUXKxMmPPhb4qarKAQ8=;
	b=fnI9m/2gQpFb4pwQ5JGg/BgQwPCJFhp4IwIyUUcQo2II32LMpaYCNATQLpw7+kizadY4K9l7wy8ydemSV4/jtcHQaU2d7xarl/avv194EM4ixVf61O81A+VHzm5uuvsfQ3nYzvOuRvjJ1WL7IWcophwpaJbjztn6YRxLPQCLdo0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e0e9ff62-d496-4cd0-8bf1-eb7aba58dd17,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:817d2d8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dffa8f08105e11f0a1e849db4cc18d44-20250403
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 533381892; Thu, 03 Apr 2025 00:40:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 15:40:09 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 15:40:08 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 2/4] arm64: dts: mt8188: add aie node
Date: Thu, 3 Apr 2025 15:38:34 +0800
Message-ID: <20250403074005.21472-3-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403074005.21472-1-bo.kong@mediatek.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_004016_354568_E97161BC 
X-CRM114-Status: UNSURE (   9.25  )
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

Add aie node and related node

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---
Changes in v5:
1.Modify the name of clock, change _ to -.

Changes in v4:
None

Changes in v3:
1. Remove dts non-MMIO nodes

Changes in v2:
1. Add AIE node and related node
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 69a8423d3858..641de110321a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2330,12 +2330,45 @@ imgsys_wpe1: clock-controller@15220000 {
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
+			clock-names = "img-ipe",
+				      "ipe-fdvt",
+				      "ipe-smi-larb12",
+				      "ipe-top";
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


