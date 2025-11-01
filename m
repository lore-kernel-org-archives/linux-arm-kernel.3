Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8728BCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/NH5GdU5EFEoW2ZYOfmQZ7/xs1/do+wbxx4JY97i88=; b=QgCMy8PsnhOLlTScoYAxe3a+iy
	jBgnDSxzC2ddLGKBZmUKdo8/QAuuqJIMLGBhCp8LjYv1KAtJJabWNIWRINezuugtv4XlafXIVVagF
	9j4NLGF5IA9jcyFc2mX/icpL7Gyt1MxfBj+GB+99l0EdjJr1x5cLvLitg1IMgGB8NuSzohItBBLqz
	E8lFzDaGb5Tp8kwnOHmm8LiS35CwPWFBBClVG+oygNa5s4lmR2PvtEfrxLoUyQTC03i0m5u0Q+QTa
	mwrw3tmdKO4uOJL5b27uj7V+YQ59u44F3s7pf/4FDv0sqy9qnKiCxsXvtTIsYSFaDQLt/NY2eCQN6
	q6FLlZHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBjF-00000007mKK-0XqI;
	Sat, 01 Nov 2025 13:33:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBj9-00000007m7k-3nxH;
	Sat, 01 Nov 2025 13:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762003979;
	bh=Khddq10rDTNCJC+WhHqWSm+UChMJ0XNPjzUvEysQkxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U1A0ycTnOTMFInmhlHARM/cxFDiIstBqvq2sakPc///cWFfjXxPA1tikJgWkiOhlB
	 RNVX6BK5PfhpqFPpqz8lmtyT3gv8vtCBjJmyTKajba1RWMjL6p/bZ3Mt//xYnHh7aY
	 T3PK7r0RcPkQUSS1pBZQXBMubn3iEKD9KNxBb5v4bn2vdtmK0gtTxMEPbCLkUl9JZw
	 r5CQbItPouyXCXhwXPJjKf+aIM7tfr33SupCpWxJI7nMs02Bn5t6Lk75Ka+OUMmUqd
	 2wuCZWNWYGToSFhrIq9EfIUgnKQzXxm5hwrIqzWloCysutJvyse1RrIVV/3m4qRA6X
	 1gwrNXKrLYoGA==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 566AA17E1414;
	Sat,  1 Nov 2025 14:32:59 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id AAB2010E9D036; Sat, 01 Nov 2025 14:32:58 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Sat, 01 Nov 2025 14:32:52 +0100
Subject: [PATCH v2 07/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 PCIe and USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-openwrt-one-network-v2-7-2a162b9eea91@collabora.com>
References: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
In-Reply-To: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
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
X-CRM114-CacheID: sfid-20251101_063308_565224_2E63B83C 
X-CRM114-Status: GOOD (  11.13  )
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

Enable the PCIe controller and USB3 XHCI host on the OpenWrt One
board. The USB controller is configured for USB 2.0 only mode, as the
shared USB3/PCIe PHY is dedicated to PCIe functionality on this board.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 968b91f55bb27..5834273839c17 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -20,8 +20,53 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 		device_type = "memory";
 	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	status = "okay";
+};
+
+&pio {
+	pcie_pins: pcie-pins {
+		mux {
+			function = "pcie";
+			groups = "pcie_pereset";
+		};
+	};
 };
 
 &uart0 {
 	status = "okay";
 };
+
+&usb_phy {
+	status = "okay";
+};
+
+&xhci {
+	phys = <&u2port0 PHY_TYPE_USB2>;
+	vusb33-supply = <&reg_3p3v>;
+	vbus-supply = <&reg_5v>;
+	mediatek,u3p-dis-msk = <0x01>;
+	status = "okay";
+};

-- 
2.51.0


