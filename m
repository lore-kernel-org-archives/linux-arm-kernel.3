Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC4FC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzhcuPLDSwh1mzz/nGqTSzBUSDaRDNpTMz/JFqw2TqY=; b=X2dqlivRAave+4lb9GWZcp7ELL
	SzLJjDM9URVxlcE8F0M2TIDVHezmx1bDR1Lmo/rzqxPsEBmS5AXB/EbGPnBJPSEEYV+4VVmaOdr9L
	GVOBhYobndgGLpPi6Ts+LxxnP+p+NezOexy3ie7AwQ0VUkyK+YCnfw95pjgphFRSnGu92j/BU+x5w
	J/5Urj9YL3ecIa836cdk2ITTbx/kuuJA3ocHvbMJdICIpHGuHsBB3UGBzCZge+0XRcfWfzM3qU4P4
	0Od0cZX1dG8CSXsbGUJJRKPagOV4TN1XbuV2u9LsrHKiwjMBbuujOB1uZ2CCQus06UQBOllCKTX4P
	m3a+qGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzpn-00000004K8z-2Oei;
	Fri, 16 May 2025 18:31:03 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzNl-00000004FNX-1avC;
	Fri, 16 May 2025 18:02:06 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 7F5CD60531;
	Fri, 16 May 2025 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1747418518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzhcuPLDSwh1mzz/nGqTSzBUSDaRDNpTMz/JFqw2TqY=;
	b=TchpcRaovpOmKZ4Q9J8MIbaUuOE8QKTYzba4otiKgUc3i6MQI77I3poCJhukV8JEpx7ZhG
	ht88CT1H71e5aYXCmrtlw35Hu46E79GJep4buUQ3EkU+TZ80smGipBCRsSd4rqlFE27VRz
	Wwzfk7t2XA1o4YjP6Ue2GWkiAJrZZmY=
Received: from frank-u24.. (fttx-pool-157.180.226.139.bambit.de [157.180.226.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 345941226C1;
	Fri, 16 May 2025 18:01:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/14] arm64: dts: mediatek: mt7988: add switch node
Date: Fri, 16 May 2025 20:01:40 +0200
Message-ID: <20250516180147.10416-11-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516180147.10416-1-linux@fw-web.de>
References: <20250516180147.10416-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110205_714160_6FAC7AD8 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add mt7988 builtin mt753x switch nodes.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- drop labels and led-function too (have to be in board)
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 153 ++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index aa0947a555aa..f738a025b623 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -742,6 +742,159 @@ ethsys: clock-controller@15000000 {
 			#reset-cells = <1>;
 		};
 
+		switch: switch@15020000 {
+			compatible = "mediatek,mt7988-switch";
+			reg = <0 0x15020000 0 0x8000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&ethwarp MT7988_ETHWARP_RST_SWITCH>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gsw_port0: port@0 {
+					reg = <0>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy0>;
+				};
+
+				gsw_port1: port@1 {
+					reg = <1>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy1>;
+				};
+
+				gsw_port2: port@2 {
+					reg = <2>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy2>;
+				};
+
+				gsw_port3: port@3 {
+					reg = <3>;
+					phy-mode = "internal";
+					phy-handle = <&gsw_phy3>;
+				};
+
+				port@6 {
+					reg = <6>;
+					ethernet = <&gmac0>;
+					phy-mode = "internal";
+
+					fixed-link {
+						speed = <10000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				mediatek,pio = <&pio>;
+
+				gsw_phy0: ethernet-phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0>;
+					interrupts = <0>;
+					phy-mode = "internal";
+					nvmem-cells = <&phy_calibration_p0>;
+					nvmem-cell-names = "phy-cal-data";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy0_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy0_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy1: ethernet-phy@1 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <1>;
+					interrupts = <1>;
+					phy-mode = "internal";
+					nvmem-cells = <&phy_calibration_p1>;
+					nvmem-cell-names = "phy-cal-data";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy1_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy1_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy2: ethernet-phy@2 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <2>;
+					interrupts = <2>;
+					phy-mode = "internal";
+					nvmem-cells = <&phy_calibration_p2>;
+					nvmem-cell-names = "phy-cal-data";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy2_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy2_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+
+				gsw_phy3: ethernet-phy@3 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <3>;
+					interrupts = <3>;
+					phy-mode = "internal";
+					nvmem-cells = <&phy_calibration_p3>;
+					nvmem-cell-names = "phy-cal-data";
+
+					leds {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						gsw_phy3_led0: led@0 {
+							reg = <0>;
+							status = "disabled";
+						};
+
+						gsw_phy3_led1: led@1 {
+							reg = <1>;
+							status = "disabled";
+						};
+					};
+				};
+			};
+		};
+
 		ethwarp: clock-controller@15031000 {
 			compatible = "mediatek,mt7988-ethwarp";
 			reg = <0 0x15031000 0 0x1000>;
-- 
2.43.0


