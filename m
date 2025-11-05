Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B138CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbQ8LYX0/2mwbWfiTZ/4KA3hdnCFGb6BlEXU0Ey9ARA=; b=DnkcKgDuWuO3LRhEDAaWa+Kf5/
	BIHPSjHLmFlcMCfAzqFn5OtveqJYqDRUMkstpbpxmbx64hOd1o0j4YIaYMXDRqO0zI/qidLT4ChjS
	TpUonBjA+mhYHIDDrjew4UWk/PXvGj6smgZCDDAsBe+PXUIbve0TsKcogrC+D5weWPeSKv9cbSYNO
	UfTCqaXG4Cgt1A1b6lIAYYG7AZbhgd1G81VQ1GfNURH9UHB8ks/E2UHzhOy/z4CZGt8J80h7BTulq
	1j45jGtcDW3pspEYPW3Yg/pBr7zswaz+WzwQI2zP5St706XpXGGzeI8LWLVK6byVTgF00zoREtCTl
	gksVi86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktu-0000000EU2i-2q6T;
	Wed, 05 Nov 2025 21:18:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktq-0000000ETy8-1Ir7;
	Wed, 05 Nov 2025 21:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762377515;
	bh=vTtFVwZhj2dtk28F9mb0pMLT2K98WweVea9+cuC24ag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pSe49kn1CNJa/3TIsAfyiPmVF6y8Y8PaNI39JUJJAAPA5wWIFh6XiC4HVZx6wEFNL
	 L5Kdzgoirrmikw+CUAcBOG09J/CVlUGuVArOzbmO7Wslf7ZxtcAwnpndJ43sBsrCq1
	 v/WOwnTgqG36ax9SAtLwXvRr9iFPFbDxYpPnBjW0uNx0LGTceQTwIerakX6nh/fve2
	 gDgnn7FFMsjEfMxOyPv6ZSm9V2QYVpS7DfzQzkZ+RBkSvVkeyS66FamW1RxSMduaYI
	 esxgWGjHuf5H2/qYR975Jxrx8kLKRiAIjaJPBj3Zh03WC2gVt5fDKiYp1fSDHIIPAT
	 u+lL/PGRDqsvQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0483317E12AA;
	Wed,  5 Nov 2025 22:18:35 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 916BF10F352DB; Wed, 05 Nov 2025 22:18:34 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 05 Nov 2025 22:17:56 +0100
Subject: [PATCH v3 01/13] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 SPI NOR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-openwrt-one-network-v3-1-008e2cab38d1@collabora.com>
References: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
In-Reply-To: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_131838_527801_38763342 
X-CRM114-Status: GOOD (  13.98  )
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

The openwrt one has a SPI NOR flash which from factory is used for:
* Recovery system
* WiFi eeprom data
* ethernet Mac addresses

Describe this following the same partitions as the openwrt configuration
uses.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V2 -> V3: Move earlier in the patch sequence
V1 -> V2:
  - Use numeric drive-strength values rather then defines
  - Make nvmem cell labers more meaningfull
  - Only define nvmem cells used in later patches by devicetree
---
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 79 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  2 +-
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 968b91f55bb27..6bb98629f4536 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "mt7981b.dtsi"
+#include "dt-bindings/pinctrl/mt65xx.h"
 
 / {
 	compatible = "openwrt,one", "mediatek,mt7981b";
@@ -22,6 +23,84 @@ memory@40000000 {
 	};
 };
 
+&pio {
+	spi2_flash_pins: spi2-pins {
+		mux {
+			function = "spi";
+			groups = "spi2";
+		};
+
+		conf-pu {
+			bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
+			drive-strength = <8>;
+			pins = "SPI2_CS", "SPI2_WP";
+		};
+
+		conf-pd {
+			bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
+			drive-strength = <8>;
+			pins = "SPI2_CLK", "SPI2_MOSI", "SPI2_MISO";
+		};
+	};
+};
+
+&spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi2_flash_pins>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				reg = <0x00000 0x40000>;
+				label = "bl2-nor";
+			};
+
+			partition@40000 {
+				reg = <0x40000 0xc0000>;
+				label = "factory";
+				read-only;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					wifi_factory_calibration: eeprom@0 {
+						reg = <0x0 0x1000>;
+					};
+
+					wan_factory_mac: macaddr@24 {
+						reg = <0x24 0x6>;
+						compatible = "mac-base";
+						#nvmem-cell-cells = <1>;
+					};
+				};
+			};
+
+			partition@100000 {
+				reg = <0x100000 0x80000>;
+				label = "fip-nor";
+			};
+
+			partition@180000 {
+				reg = <0x180000 0xc80000>;
+				label = "recovery";
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 130ce2fda3995..f00e5bf63de35 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -156,7 +156,7 @@ i2c@11007000 {
 			status = "disabled";
 		};
 
-		spi@11009000 {
+		spi2: spi@11009000 {
 			compatible = "mediatek,mt7981-spi-ipm", "mediatek,spi-ipm";
 			reg = <0 0x11009000 0 0x1000>;
 			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.51.0


