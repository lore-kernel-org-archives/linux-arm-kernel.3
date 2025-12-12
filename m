Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03541D43365
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 01:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn1+uxQ75dbbmV2dRI5/x9CSVqd+ehRMgd9rT1S4f14=; b=fLloPVFeQdnlZKu9M6THHaQgMa
	nfPw6QT0hgB/gwR3lz109jl7or2M8ytDUqjLcRPexDIqUkdOs/OLTm2XrioJNI/l7ZPpTXVpq/QHv
	th0E1FoaiLOLmyNRt/KYCOl+JaSARVwYAlnbxyEHXPnvb2HaZrhMRKDFyevVsRF+J/J8oaA4mMve9
	408gfLNNWbQHFj31MqtrHNvOeu7TW5JSTFlWqxC4et3cqBGCQIy/wysGkHjIktJekgTjMQ/wfmSu3
	5ZUE0x9NkVoLhHj/3Tuok1ZG8IS8mKowffmJRPEpqGDfMT9vXrdTdECmwTyX8RiDc1blRjCXC1S0v
	sRdpYq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsNf-0000000HVJw-3YnS;
	Fri, 12 Dec 2025 01:55:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsNc-0000000HVIW-2S68;
	Fri, 12 Dec 2025 01:55:38 +0000
X-UUID: a4c21c24d6fd11f0a52f393f94899d25-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vn1+uxQ75dbbmV2dRI5/x9CSVqd+ehRMgd9rT1S4f14=;
	b=PjAJxWk5Q97XPV7R9JTVr3GJX+s6td1y63FGA4QiUIdqg4hXDyMbESuibl2jz6IDULXoMfB+f/GsqZxp6ab+Kj+D8wZv0sKchlhPVNb7Homv8/XLRPaXpq9mT7TOgOzJDjLuBqnYavSVvRRfBGj1pzlsHxkZq8xcAy5qCEDQw7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e7a78cda-83ee-4aa1-b571-4b503b9906e8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:fbf319aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a4c21c24d6fd11f0a52f393f94899d25-20251211
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 320692873; Thu, 11 Dec 2025 18:55:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 09:55:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 09:55:29 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH 1/4] arm64: dts: mt8188: update JPEG encoder/decoder compatible
Date: Fri, 12 Dec 2025 09:52:15 +0800
Message-ID: <20251212015218.4689-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251212015218.4689-1-jianhua.lin@mediatek.com>
References: <20251212015218.4689-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_175537_419147_53186037 
X-CRM114-Status: UNSURE (   9.07  )
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

The MT8188 JPEG encoder and decoder shares the same architecture
and features as the MT8189 JPEG encoder and decoder.
This improvement enables the MT8188 JPEG encoder and decoder to
support a 34-bit iova address-space.
Therefore, update "mediatek,mtk-jpgenc" to "mediatek,mt8189-jpgenc",
update "mediatek,mt2701-jpgdec" to "mediatek,mt8189-jpgdec".

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 90c388f1890f..ff9a774f5911 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2846,7 +2846,7 @@ video_encoder: video-encoder@1a020000 {
 		};
 
 		jpeg_encoder: jpeg-encoder@1a030000 {
-			compatible = "mediatek,mt8188-jpgenc", "mediatek,mtk-jpgenc";
+			compatible = "mediatek,mt8188-jpgenc", "mediatek,mt8189-jpgenc";
 			reg = <0 0x1a030000 0 0x10000>;
 			clocks = <&vencsys CLK_VENC1_JPGENC>;
 			clock-names = "jpgenc";
@@ -2859,11 +2859,10 @@ jpeg_encoder: jpeg-encoder@1a030000 {
 		};
 
 		jpeg_decoder: jpeg-decoder@1a040000 {
-			compatible = "mediatek,mt8188-jpgdec", "mediatek,mt2701-jpgdec";
+			compatible = "mediatek,mt8188-jpgdec", "mediatek,mt8189-jpgdec";
 			reg = <0 0x1a040000 0 0x10000>;
-			clocks = <&vencsys CLK_VENC1_LARB>,
-				 <&vencsys CLK_VENC1_JPGDEC>;
-			clock-names = "jpgdec-smi", "jpgdec";
+			clocks = <&vencsys CLK_VENC1_JPGDEC>;
+			clock-names = "jpgdec";
 			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
 			iommus = <&vdo_iommu M4U_PORT_L19_JPGDEC_WDMA_0>,
 				 <&vdo_iommu M4U_PORT_L19_JPGDEC_BSDMA_0>,
-- 
2.45.2


