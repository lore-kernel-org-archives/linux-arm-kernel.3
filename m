Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5911E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdqcTZ5dYcu+1db9jRbnT2mWghupTOqEjc4U3dcloEo=; b=U4nX2W2+JuglDB7XYBnTAfJ0JH
	Cgix/3smOz4VAgQbN0gso/YZqt5J33W583aCEp+kXUiX7upd2tbPnC7zXkG9hXaiG2uticwf/aeQp
	kWYLxsCYdH4WEr3B2zJdBCZIr4m5egjaysn+rVZCcqtwKbIlmgySw6xOhentBgPIZmE6Owl2jK+F6
	2IM7uESXJhfgecqN24CXO54pHl+0NGqLL4KogbPCDZZpEkjo/HHxbNPU9JuRhNx9Mw5CTikUVa6Q9
	3Xgoqim0AIScbOLHT/rbcGhRUSacwCkc5HaCOGbKg+xkW4QysbABGh/qdH15J7ObEnZUt1R4ly3G3
	ECZ7IbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Om-00000003LD7-3rOk;
	Fri, 13 Dec 2024 09:55:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2K1-00000003Jy6-3YAU;
	Fri, 13 Dec 2024 09:50:58 +0000
X-UUID: bd5a3ea4b93711ef9048ed6ed365623b-20241213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UdqcTZ5dYcu+1db9jRbnT2mWghupTOqEjc4U3dcloEo=;
	b=AwLN+Wc0Cc0AQMM86Xcv+jFF1X0EgjYVqc9cfg9hgv88XXUVp5d1LoChPLsjM51uCl9GEAnk+DOa1F9PN7iWPuXl/k3xOO5Huh80PknV7vBdIP3uROpQRpFUNpPOUOBMLIY61f0ly/K48Il2wrh+3PrNj1NHbCq1G924Fsyrzmk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:10a9d867-bc12-413e-a13d-b37319c471d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:2495eb3b-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bd5a3ea4b93711ef9048ed6ed365623b-20241213
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 125377447; Fri, 13 Dec 2024 02:50:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Dec 2024 17:50:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Dec 2024 17:50:47 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
	<fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 3/3] dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL
Date: Fri, 13 Dec 2024 17:50:44 +0800
Message-ID: <20241213095044.23757-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241213095044.23757-1-jason-jh.lin@mediatek.com>
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.109800-8.000000
X-TMASE-MatchedRID: 5yyS2hWhq1jeG4FwcWqAS4v2/i8VNqeOQl/FdRYkUZLfUZT83lbkEFUP
	yEuNfDiQ4vM1YF6AJbbGJQ3BiiLAggtuKBGekqUpm+MB6kaZ2g7bq4ItpX/+OkXLunBl25srQ3I
	ZDfmS/Cx6FQax6pBNIiUC2B4XPIxH7nqbEDar1/8dr6Hp73MZ6f1ZJlBFxbQ1PYx8vsB79PVJmt
	82E/eyBQGH0CAFIQWsmb5gmylW+PbGS+seVPx64iUa7Lz57KOX
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.109800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6AB72FE2E5F4D780974943D808A7EACE3A86CD8C4C7E30EC064974F7EB0690EB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_015057_890015_D67317D8 
X-CRM114-Status: GOOD (  10.88  )
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

The OVL hardware capabilities have changed starting from MT8195,
making the MT8183 compatible no longer applicable.
Therefore, it is necessary to remove the MT8183 compatible for OVL.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ade685ed2190..137ee8929e01 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3138,7 +3138,7 @@ larb20: larb@1b010000 {
 		};
 
 		ovl0: ovl@1c000000 {
-			compatible = "mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl";
+			compatible = "mediatek,mt8195-disp-ovl";
 			reg = <0 0x1c000000 0 0x1000>;
 			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
-- 
2.43.0


