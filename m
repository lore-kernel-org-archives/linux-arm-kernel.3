Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF0ECA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 02:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eiu/HyfS6gfk4IAm6JgNDtsAZdG+SE6Eq+y4phDFY2k=; b=QACLPOiXuiNcRwIkBHrTPWU/kM
	5jNz0zQ2o7G4Mueqpqv0jwwlGHCeWWfJhya5xxxY33zza0SVGEBGIkmJRd17I3esyX7rsaQRtmpGN
	p7pAXKEdmaT1SFEOhiLqPMSvsS6esDpUUAZaztY0gNM+pV6WKJp6B9TtDPmlWZH+QAMX2U5BsWWY6
	vGs12Ih6OjLKAXhMTE2oCGmKsvczBOFtwd/NzW3Y4pvrekWMDHo7MigiBVo5RUEnJsSN6HTwR4AhA
	0pJrbRWZWqV7se+0rhRJl8Sj1aPQOYCQbhfCO4MZAYZFDu+kSLrC/aRiEE5D1Sn4d4UYzL+1cFzNY
	dMhy+WaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNHW-000000026IA-0Ufq;
	Tue, 29 Sep 2026 02:09:22 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNHI-000000026D7-2u8n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 02:09:09 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469f204f6so1749337b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 19:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647748; x=1791252548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eiu/HyfS6gfk4IAm6JgNDtsAZdG+SE6Eq+y4phDFY2k=;
        b=RrAbnkoN3nvLaPwqaCbc7rCEJpWk1TiIMDLk9AP55fuF3SrO/G3WqVECuK5ZIEz6er
         JZgJdT7p7WZuuE1B3P6caE4NZLJQOztyeeDGEEn5Tt5DYvam167X8rKDpf4VVe8ezTGD
         qTFUOUjSxLy5Ns+c/W4tpjWmTTI+HNQf9efDuT/tk401vtaTs4opw29bm9eA0/tspdeb
         48zDg8HZQE1Lqb4H4H6lV4vzWHehERvTjoEEVhg8AoP+dcIL6cIbZaHcVsWzahegNO9n
         Lh/smnkgJ63ZL22BGGp7dtHmHG+sBVfrbsnN3rnOSxi//Uo0p0nTGoZHGoJe5cFD9KHk
         2UvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647748; x=1791252548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eiu/HyfS6gfk4IAm6JgNDtsAZdG+SE6Eq+y4phDFY2k=;
        b=GPhFGnPXirBEPQ7yGYnTo4+wvRSOoWFqWB+s1pabgL2W5Xgpw7JT38th/v/SM6uEbd
         q+xZvrmmI0IxJqzY6eY2OHgEcMpxKb9tHdntYKzcEVofgsT7/PLJwmwpdsfdQAELVkU0
         rvu/kKcuslt5i8HEMjA0iXe2F7M5d09mTPs6fLtrNuaGIvmrWdcSngostK2WM1kRystH
         YDpnEv8X5J66xUmfFOKzRXO1GyE0kGJ7/rfi5l1FIFDIK9Qz6GbNPM+LzKvcZ2NAy6R5
         997xGpP+xMdkcgC3BtO4pgUbBTrp76zBxzd8u8HktbnciqF7aIzQqKkf8U3D6L5feNiN
         F1rw==
X-Forwarded-Encrypted: i=1; AKwUvByDKi8pOECmRuLeagsNGo1a0i5Vg2e19Jp+ge+BDKmeW0SzURP4dLYyB9UCNiTMiu5u3Qi9oHMfrvd/zu6hRIX6@lists.infradead.org
X-Gm-Message-State: AFuF++lcjWI2AqjicfWPRYFpIuv1ZOBVCzCYOTH4HW3wKjTJl15W4TTE
	SDUpjBHCyGvEAauu4wA+Kzus86fgdZTYTX5Kye+ubUSbRG+4yhOVexrJ
X-Gm-Gg: AYBFou3gUQgehiL450kPiLxH4Yd55QZpUbm/1CCOKbQqFGsgxdw405T7bR1ND13H3zi
	Q142kX97ktWdlP2fcoHOxCuTbxGYqOIqeZO5QmU1GaVpopsPf0UevwrYFHBnKjatuahCe0onrFy
	ZkWnjuuO9lw72Xbl3YmAN/k3pQKFGuxBtGeRPt4Ns9M15QVOuIEUpbCFz0qcDMN80sdISuGDYN7
	5jgZvtOTiwIdgz9cCGsGVLVVz/Yp+pfUEOc5EDP2kEi7LYjjjiQWeKDO25cHRqUaVaZD4RfnWOl
	q0G3LWJ4EdmIwfSsMTW6vjLZluRDlSBdwozDIJo6iaGxpXqGRJ4kLffB6oX5SpGae0scYQbUhGk
	5y2dnvUK8m7OktcmASOZFhB4KDEdE9qtAwW6l06goZ8wEsujbuMY+j6FQPu3emU+4/FVwrLMtBi
	jWoH2+Wn4/kGKwlduDDj2QEAG08WThEZS5xIk/bZsYY6vVTqGJeQ+PP5T88LATa1qsDf+Iq5lbe
	xwsgakFnen3obfSps458mz7m3IDrMEbT9nqmixpxrqsSIs64rctsH0g4p0UmyA=
X-Received: by 2002:a05:6300:6698:b0:3dd:d91d:e2c2 with SMTP id adf61e73a8af0-3de0e7f4a2fmr13272194637.48.1790647747603;
        Mon, 28 Sep 2026 19:09:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm5448596a12.32.2026.09.28.19.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:09:07 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Tue, 29 Sep 2026 10:08:53 +0800
Message-ID: <20260929020854.1282339-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929020854.1282339-1-a0987203069@gmail.com>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_190908_730429_1EF2FC19 
X-CRM114-Status: GOOD (  12.19  )
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

Add the USB subsystem nodes for the MA35D1 SoC and boards:

  - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
    the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
    Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.

  - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
  - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
  - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.

Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
VBUSVLD, PWREN and OVC signals and enable all USB nodes.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..b2f25de2ae44 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb-grp {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -151,3 +161,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..58349470bc64 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -100,6 +100,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb-grp {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>, /* PWREN */
+				       <11 13 9>; /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -153,3 +163,29 @@ eth_phy1: ethernet-phy@1 {
 		reg = <1>;
 	};
 };
+
+&usb_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hsusb>;
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..72a1659207fa 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -76,6 +76,14 @@ IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
 		interrupt-parent = <&gic>;
 	};
 
+	usb_phy: usb-phy {
+		compatible = "nuvoton,ma35d1-usb2-phy";
+		clocks = <&clk HUSBH0_GATE>;
+		nuvoton,sys = <&sys>;
+		#phy-cells = <1>;
+		status = "disabled";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -431,5 +439,62 @@ mdio1: mdio {
 				#size-cells = <0>;
 			};
 		};
+
+		usb: usb@40200000 {
+			compatible = "snps,dwc2";
+			reg = <0x0 0x40200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk USBD_GATE>;
+			clock-names = "otg";
+			phys = <&usb_phy 0>;
+			phy-names = "usb2-phy";
+			dr_mode = "peripheral";
+			g-np-tx-fifo-size = <16>;
+			g-rx-fifo-size = <0x100>;
+			g-tx-fifo-size = <256 256 64 64 64 32 32 32>;
+			status = "disabled";
+		};
+
+		ehci0: usb@40140000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x40140000 0x0 0x1000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			status = "disabled";
+		};
+
+		ehci1: usb@401c0000 {
+			compatible = "generic-ehci";
+			reg = <0x0 0x401c0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			status = "disabled";
+		};
+
+		ohci0: usb@40150000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x40150000 0x0 0x1000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH0_GATE>;
+			phys = <&usb_phy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@401d0000 {
+			compatible = "generic-ohci";
+			reg = <0x0 0x401d0000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk HUSBH1_GATE>;
+			phys = <&usb_phy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


