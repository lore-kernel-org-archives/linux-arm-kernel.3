Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A7CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1serjV4kH1/wTwHKRcE1GEbwr2ev0ug7m/0IdNMSBs=; b=Q1CjMxK0PU2RGbKKnwcuQBazae
	8+QX7lninROCMXwqVsZE412t+OyLYNLeI7CIo44mGu0s13QB8XGceDdqdf7XhwOkn9OcV81oVTXT6
	agv8rR5L37wDTlHEWzJCwO/cvcP3R9ta1UD0bxUhSosiOj8uUMRncoc+g0G4Mk/v4xpguQIK9aJ4S
	iVRuZib9bUdMEgiwzNBeb+KiZg/rd5blJ2BDAQ9qRP8W+vAC46iJ2G1LmrUEYailax4xWEID+pvTt
	ovM6na+aL3HI1zZmJnSyQnuxHu/0WtZ/6/YSGGAHchWT3YL0HzX6o+0wyp7AFVHFRc0LafG2CL42M
	qghhzDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgck-0000000C49d-28lh;
	Fri, 18 Jul 2025 08:39:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgSd-0000000C236-2COz;
	Fri, 18 Jul 2025 08:28:56 +0000
X-UUID: 3a07284e63b111f09eb0dd999d3936bf-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=i1serjV4kH1/wTwHKRcE1GEbwr2ev0ug7m/0IdNMSBs=;
	b=qRIAxUZRgwMG/qwDw7fSuP+FjMoebPX2eyVxaCFURXMBUdtQIzo7ENZdg9QyDFeD4Ocgm3cQGjj5olzjx//m40/6PdB/ttmy377qzconSAy2OL5grCUdXbZ6vEGT2TiZAp81v5CcyfUdOCrgytYrx8m0Rj/e0w2/QV7hvIO6Byc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:ff7b1361-6f71-4540-86d1-b99df2d03775,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:e1842673-f565-4a89-86be-304708e7ad47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3a07284e63b111f09eb0dd999d3936bf-20250718
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2033498888; Fri, 18 Jul 2025 01:28:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 16:28:11 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 16:28:11 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Peter Wang
	<peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, "James E . J
 . Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K . Petersen"
	<martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<openembedded-core@lists.openembedded.org>, <patches@lists.linux.dev>,
	<stable@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Rice Lee
	<ot_riceyj.lee@mediatek.com>, Eric Lin <ht.lin@mediatek.com>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8195: add UFSHCI node
Date: Fri, 18 Jul 2025 16:27:18 +0800
Message-ID: <20250718082719.653228-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250718082719.653228-1-macpaul.lin@mediatek.com>
References: <20250718082719.653228-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_012855_556969_E86EE5FC 
X-CRM114-Status: GOOD (  10.16  )
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

From: Rice Lee <ot_riceyj.lee@mediatek.com>

Add a UFS host controller interface (UFSHCI) node to mt8195.dtsi.
Introduce the 'mediatek,ufs-disable-mcq' property to allow disabling
Multiple Circular Queue (MCQ) support.

Signed-off-by: Rice Lee <ot_riceyj.lee@mediatek.com>
Signed-off-by: Eric Lin <ht.lin@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index dd065b1bf94a..8877953ce292 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1430,6 +1430,31 @@ mmc2: mmc@11250000 {
 			status = "disabled";
 		};
 
+		ufshci: ufshci@11270000 {
+			compatible = "mediatek,mt8195-ufshci";
+			reg = <0 0x11270000 0 0x2300>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&ufsphy>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_AES_UFSFDE>,
+				 <&infracfg_ao CLK_INFRA_AO_AES>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_TICK>,
+				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_SYS>,
+				 <&infracfg_ao CLK_INFRA_AO_UNIPRO_TICK>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_MP_SAP_B>,
+				 <&infracfg_ao CLK_INFRA_AO_UFS_TX_SYMBOL>,
+				 <&infracfg_ao CLK_INFRA_AO_PERI_UFS_MEM_SUB>;
+			clock-names = "ufs", "ufs_aes", "ufs_tick",
+					"unipro_sysclk", "unipro_tick",
+					"unipro_mp_bclk", "ufs_tx_symbol",
+					"ufs_mem_sub";
+			freq-table-hz = <0 0>, <0 0>, <0 0>,
+					<0 0>, <0 0>, <0 0>,
+					<0 0>, <0 0>;
+
+			mediatek,ufs-disable-mcq;
+			status = "disabled";
+		};
+
 		lvts_mcu: thermal-sensor@11278000 {
 			compatible = "mediatek,mt8195-lvts-mcu";
 			reg = <0 0x11278000 0 0x1000>;
-- 
2.45.2


