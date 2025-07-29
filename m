Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46590C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 02:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gWFTVUtfqcSTh6Oq1Z1VkUVT+x79QYdNgJkeqMe0Us=; b=VmQGhPKYqFJ3d+A9TI2RR+glfB
	FlXTX6CeN+iZPq2oucpxmBNaealCsCvKv5Ur2CxfGR2goLhan2KJvXRRvyxhVSOarSKxq4NYXTjRN
	RTiPGV97hKGL2e19tzZD3CGEkIWajb0Di8bGDQaVTSDngQd9/i5zQxTfyHpShJgeuFszcNWNqQGsk
	nTynPLmtzrZq/izvizBGkY4DUd4H+2uJOK2vXSvp+yX6xCMTSekpDKp0NARRsUNYfQSttCe/7Fva5
	HkB0wpad52Et4/rmbjksxwisd3OJUJeT7uewEXRRBxk+yEcjGTFzqQfD9dQQVPONArevMr6Fm9x+V
	yelaXtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugaCr-0000000FmI9-06Uq;
	Tue, 29 Jul 2025 02:36:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uga7w-0000000Flih-1vaQ;
	Tue, 29 Jul 2025 02:31:42 +0000
X-UUID: 2558bc5c6c2411f09f706fa2197c6ceb-20250728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/gWFTVUtfqcSTh6Oq1Z1VkUVT+x79QYdNgJkeqMe0Us=;
	b=usPxFED4ZUKek8uECAdEtcSe++F2yKbuduj192ZlMPtziu5QIAQwFqRfdhXYfWtF08Y69CKBPo6SqTAhzZK2Oov6wymNKO+08FcKIs/49Nn/SN2N3CJ/Waaj6TRFJQG3/Nyu3tpyVzw02lz8SbioE6rbNC4/wFhC5+cmTTLaGNE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:2d0dde35-72bb-4165-8f7e-d2720a922423,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:3f095950-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2558bc5c6c2411f09f706fa2197c6ceb-20250728
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 631323455; Mon, 28 Jul 2025 19:31:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Jul 2025 10:31:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Jul 2025 10:31:31 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<--cc=Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH 2/3] arm64: dts: mt8189: Add scp node
Date: Tue, 29 Jul 2025 10:31:12 +0800
Message-ID: <20250729023125.9036-3-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250729023125.9036-1-huayu.zong@mediatek.com>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_193140_499000_A0F65DA8 
X-CRM114-Status: UNSURE (   9.59  )
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

Add scp node for mt8189.

Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8189.dtsi    | 11 +++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8189-evb.dts b/arch/arm64/boot/dts/mediatek/mt8189-evb.dts
index e5d9ce1b8e61..39cd56b31ca0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8189-evb.dts
@@ -13,8 +13,25 @@ / {
 	chosen: chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem_reserved: scp@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+	};
 };
 
 &uart0 {
 	status = "okay";
 };
+
+&scp {
+	status = "okay";
+	memory-region = <&scp_mem_reserved>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
index 2444c3e553ec..b70397b9ef6c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8189.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
@@ -371,5 +371,16 @@ uart0: serial@11001000 {
 			clock-names = "baud", "bus";
 			status = "disabled";
 		};
+
+		scp: scp@1c400000 {
+			compatible = "mediatek,mt8189-scp";
+			reg = <0 0x1c400000 0 0x60000>,
+			      <0 0x1cb20000 0 0xe0000>;
+			reg-names = "sram", "cfg";
+			interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH 0>;
+			status = "disabled";
+			clocks = <&vlp_cksys_clk CLK_VLP_CK_SCP_SEL>;
+			clock-names = "scp_sel";
+		};
 	};
 };
-- 
2.45.2


