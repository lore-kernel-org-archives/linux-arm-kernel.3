Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD8FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1encuTVAcrrucgWTZkTd+WBasAHgfxaRmuM38brREg=; b=2Lh/M9Yw0LNNl3DygXTrN4Uf5h
	rxRjrES/o+P0yREQksmQ6asRK+28WexrVhJvV8T0j7n+VfG4u8ro0gvmExB2ONZJDsxuikPpVdr1S
	3b2r1aelb+H8rL3wuPjJUuHAthuMfbuDYeXDN54qbmVE5AIQIjblBhJ42m5ptzkDvS7pzFWdCfrp8
	neoPkaCHVGhUmUHQIkml+v6yaD+cd4kIpreiQacaRLzGKD7nYFZyvB4hT+Q3PSv0w4ZivpUDMuN2K
	dRTu59wu+hKfeOc/u3c8YTDMBY/185R0ZhYlsVnUI8sTWPUK4F/y2kJZimfsGDfUr7tphXpZohtYx
	Wxidj1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u504u-00000009CFL-2RNV;
	Wed, 16 Apr 2025 10:33:12 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zTN-0000000936e-0QuQ;
	Wed, 16 Apr 2025 09:54:26 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 29098101211;
	Wed, 16 Apr 2025 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/1encuTVAcrrucgWTZkTd+WBasAHgfxaRmuM38brREg=;
	b=oEMXnpNJiECwDtBUataqIbbBkdC8VpsV5TaLlhjUiBR29Zo0llf+CHRkYR+wzsHChOqYJo
	vTOmJZtONjz6HNTxipujEWWorwBISef7Nro01YDdRnFCg5AMPwnjlIfuOiXBhGVWwg5MBQ
	NdadIfHxPL7DO3x5eWPGojcCp8o0Gyk=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 4905D360084;
	Wed, 16 Apr 2025 09:54:22 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 7/8] arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
Date: Wed, 16 Apr 2025 11:53:59 +0200
Message-ID: <20250416095402.90543-8-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ddb25738-050a-4fc7-8795-db407a6b1ea9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_025425_288318_CA5658CF 
X-CRM114-Status: GOOD (  10.02  )
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

From: Frank Wunderlich <frank-w@public-files.de>

First usb and third pcie controller on mt7988 need a xs-phy to work
properly.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- drop unneeded properties and compatibles from topmisc
- xsphy unit name not changed because binding requires this name (not only phy)
- also not changed port names to be clear abour which phy is used (mt7988 also have tphy)
- change offset to have clean syscon (without power controller)
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 88b56a24efca..72792f4ccde3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -334,6 +334,8 @@ usb@11190000 {
 				 <&infracfg CLK_INFRA_133M_USB_HCK>,
 				 <&infracfg CLK_INFRA_USB_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+			phys = <&xphyu2port0 PHY_TYPE_USB2>,
+			       <&xphyu3port0 PHY_TYPE_USB3>;
 			status = "disabled";
 		};
 
@@ -398,6 +400,9 @@ pcie2: pcie@11280000 {
 			pinctrl-0 = <&pcie2_pins>;
 			status = "disabled";
 
+			phys = <&xphyu3port0 PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
@@ -548,6 +553,37 @@ tphyu3port0: usb-phy@11c50700 {
 			};
 		};
 
+
+		topmisc: system-controller@11d10000 {
+			compatible = "mediatek,mt7988-topmisc",
+				     "syscon";
+			reg = <0 0x11d10084 0 0xff80>;
+		};
+
+		xs-phy@11e10000 {
+			compatible = "mediatek,mt7988-xsphy",
+				     "mediatek,xsphy";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			xphyu2port0: usb-phy@11e10000 {
+				reg = <0 0x11e10000 0 0x400>;
+				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+
+			xphyu3port0: usb-phy@11e13000 {
+				reg = <0 0x11e13400 0 0x500>;
+				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				mediatek,syscon-type = <&topmisc 0x194 0>;
+			};
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.43.0


