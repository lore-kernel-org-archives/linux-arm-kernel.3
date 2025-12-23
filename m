Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9703BE6F08D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEB2frF7+lYvafsb1RlZvloQQjtlqmA387ZG1D5MUoE=; b=UKtCGSgM2g81/2+3Id7zNQC9FO
	caqnoLqErDm/JljWSQwLi70KS0Ywci9V7+i2yJ7jf9YZpWWXX3bZazhKhTjOp/qaktcIjYCO4b+sA
	UgLiw+z71/gEK+ZSd71WS4RqGqJ7UwYA/EzBBpwld+ELExNph5HYNmMNwuzJFGAMaqssRDAjmIBms
	Bk/TrD3IOWHzd2a6TOyiJnfM/Jd23BvZeaMOJ+Lb/nie49m/Y5DE94pAsl8kOguBCMZ3hUA1iufgz
	c3ByY8bmf3I0+gbNHq7bpAhduXglWy+s9wz7OgBy8x4VQtj/oHxD+w0hy89hLi6sSRQJcZVcVGlN6
	JF4ozPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1eb-0000000FTZx-1wa1;
	Tue, 23 Dec 2025 12:38:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1eV-0000000FTUF-1gTc;
	Tue, 23 Dec 2025 12:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766493488;
	bh=ig1Lr+RvBmIPrsUe9qrlLWnA4rOxINE6iuKtD16zMxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E5CnvY/qgOB5FTxNe4oGMMZiuLLWKG33xHEumbA0TcRPf6mhjALCuyvzP3nfVzAhs
	 JDx1L94IgaJhCha1dCMNOT7UpzpIfxZfbFJEeoyTCeX39F7oS3KOzGxOfoPx3IcvvQ
	 vczhxLumwgDsEUqb1IpUCi+XpoQuj6cRYPcjtv1s1xQZc6WD9POG64CH1Hy1VYBzBT
	 7x1m1xUazzTfF5pn7mSjBC32LZrf6JMSDBajyBjj67oPh0skILstWHj/ZiJ2uT/Ikp
	 F8US3PdthbvVOp24Xt6YpQ2aTOBviO4w95mnKIBCRxLc1jYpOOysvVX4fvWBprCfX1
	 UISi5YDScufxQ==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A191517E1423;
	Tue, 23 Dec 2025 13:38:08 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 527BA117A0673; Tue, 23 Dec 2025 13:38:08 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Tue, 23 Dec 2025 13:37:53 +0100
Subject: [PATCH v5 3/8] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 PCIe and USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-openwrt-one-network-v5-3-7d1864ea3ad5@collabora.com>
References: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
In-Reply-To: <20251223-openwrt-one-network-v5-0-7d1864ea3ad5@collabora.com>
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
X-CRM114-CacheID: sfid-20251223_043811_600045_D8B09DF5 
X-CRM114-Status: GOOD (  10.95  )
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
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
index 2e39e7287730..7382599cfea2 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
@@ -67,9 +67,40 @@ led-2 {
 			linux,default-trigger = "netdev";
 		};
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
 };
 
 &pio {
+	pcie_pins: pcie-pins {
+		mux {
+			function = "pcie";
+			groups = "pcie_pereset";
+		};
+	};
+
 	pwm_pins: pwm-pins {
 		mux {
 			function = "pwm";
@@ -163,3 +194,15 @@ partition@180000 {
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


