Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E03D2E027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Se1VIgGsvPlT3D/sfCOm2ULU4V8mtQ1l49iIAp9o/g8=; b=h1/AUF8fh53ES+EOO8Dr1NsI63
	GoNl+H5s+hNV8WbpM85I3X7y7TozMSS76vBZnDcUUhVBoU7kDjNaeH0ptXanJaPBelUgJLOPlVdQz
	M4svnLt8xfJ00qLIMmH9jVoIrkFfaFanzNGgmRD77f8p9YJkv+9RFf+NGU6fwZYaJR7vbQxcG2KG8
	Qqv9F5Wbs5HK0i2+pTmnIF1QkU0AQlAS7KYv7fLRMCQEHD0MJ9e9JWI4wkcLVh3zZOKPI3WouRhi1
	WyIAQR1B9YHanTGCCG2LBbIb2i2une1pX4z5eNH9b3uV6kAcGvGuiCDp5FTmb6uxEBly79dCOmWum
	/1qY/KDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XGw-0000000Dh8r-2oa3;
	Wed, 23 Oct 2024 09:03:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X4k-0000000DddK-44Mm;
	Wed, 23 Oct 2024 08:50:44 +0000
X-UUID: dfeb2166911b11ef9048ed6ed365623b-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Se1VIgGsvPlT3D/sfCOm2ULU4V8mtQ1l49iIAp9o/g8=;
	b=nQulJnPW1WI+id/H5HuzNgmVJ20f70Eqrf6WUlrGbKk8keMZpUg9IEvE6RW13Z/JyMhavTV5Z54Auywzdth63T++kT7an6kVTZilxP1bNDmIWEA7XLhHItB5Z+a7jlZR8+MF9GycxVYhmk+HZFg+cmlzev5hNttrEIhUsIfaRog=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:72218b3c-21bb-43fe-b214-156e5df9bc29,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:64b0b441-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dfeb2166911b11ef9048ed6ed365623b-20241023
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1639976620; Wed, 23 Oct 2024 01:50:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 16:50:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 16:50:14 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-usb@vger.kernel.org>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	Yu-wen Fang <yu-wen.fang@mediatek.com>, Simon Sun <simon.sun@yunjingtech.com>
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: add adc and led for mt6360
Date: Wed, 23 Oct 2024 16:50:10 +0800
Message-ID: <20241023085010.7524-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.494300-8.000000
X-TMASE-MatchedRID: Mn10dBkbTvtKC7lijxWoOAPZZctd3P4Bf2g6KJZtxl0UtdRZTmEaIb2O
	4dp/1Rff4vM1YF6AJbbCCfuIMF6xLVgXepbcl7r7ejqoqUDei9WWVgE8Bu1hS0hiHNv5G75DlwA
	lN0nV/xT6BF14XxOvjI2guP2Quj6armhikiR2ttDg30lwp7cJ8GHE6HLVPu61hJVRlkc0uv5GBX
	oeyrLHXVBo425nomviD2TeXwRpghyi+kNdVAfMg37cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.494300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D0EE629A02F439079A853651305B65B35D8AF92D7D429C00FA773FB68A4AD7182000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_015043_044631_A3A8B926 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Yu-wen Fang <yu-wen.fang@mediatek.com>

Enable ADC and LED of MT6360 for MT8395 Genio-1200-EVK board.

Signed-off-by: Yu-wen Fang <yu-wen.fang@mediatek.com>
Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 4c11c100e7b6..6aa6fa64044e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -264,6 +264,11 @@ mt6360: pmic@34 {
 		#interrupt-cells = <1>;
 		pinctrl-0 = <&mt6360_pins>;
 
+		adc {
+			compatible = "mediatek,mt6360-adc";
+			#io-channel-cells = <1>;
+		};
+
 		charger {
 			compatible = "mediatek,mt6360-chg";
 			richtek,vinovp-microvolt = <14500000>;
@@ -275,6 +280,12 @@ otg_vbus_regulator: usb-otg-vbus-regulator {
 			};
 		};
 
+		led {
+			compatible = "mediatek,mt6360-led";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		regulator {
 			compatible = "mediatek,mt6360-regulator";
 			LDO_VIN3-supply = <&mt6360_buck2>;
-- 
2.45.2


