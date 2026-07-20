Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77550C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zY7O09j1b/kYLX3ncq/pMHK0bqmzatxHIxsJQ5YPWmk=; b=K9GO/SIpbjsWgNkBZX4WalO3V0
	R5ew4iCWgPZeUCBpztA+jMsk/dyv0EATld1bBNvULEutt9PhFeQyJmegY1ITCB2XcMkpH9ZLwe/6C
	7sV7e25AcrVXbxeYqFonDOnTgv0S3sg9psSaLdxtMj65DTl9Ix8Q0pOHJ4KL0OIgGdt5xX5UAeuWx
	z3lGvRn9nDcBpD18VDf/fOZmSCDRRs8Efy69bE70nDQ+HyBe4AYaws0adjct6FyqjdCbY/DEjANJX
	3sDStXdO+lM0mxlyJf3v0tthKZzswygDRl8rz0ldks6uchB/nX0g8mAY9flTYCc5ETA2sv1ygP5R7
	6BfkjjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wll91-00000006Tcj-3yUi;
	Mon, 20 Jul 2026 10:22:43 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wll8u-00000006TYC-49Ct
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:22:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso6762981a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542956; x=1785147756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zY7O09j1b/kYLX3ncq/pMHK0bqmzatxHIxsJQ5YPWmk=;
        b=XZnAguzHTYDXWFbhC/mmBbDbpx5eHr6npPwTRaalTvzN5XhLgYScr5LRUV4Z04XNfP
         7FJUZICT5u9ybR34pQr3wtrKNx5MJDT8IR1Y7+qEp3QCkOOxQN/Dxw58BEWpWuJ2c3Zn
         LJeEdmqYLUXYW7XuxEviV0bGvuSqLmZ88ZGlhzfFF7GwkzuAyzzh7oGFLsZ3xisLmKjK
         4prezSOMq6B2ovgW05B0YdM3cDJqxKA02yiesbKN6lcmN7nme515yQUUg3PAMmiN4pQA
         q+wZHpLBKLwIhT4eshxwpRiKGLCjPeaU1hjn7TjM01dMfcaMWPUg5LXG0xq4n0Yj/Fby
         jIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542956; x=1785147756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zY7O09j1b/kYLX3ncq/pMHK0bqmzatxHIxsJQ5YPWmk=;
        b=Cee3Hdr0CX4ZMFzHZxhWBHbZ6mTXbrGNUa8Hp7HP/ztGe89kCil1jWcZMo//2sNFlY
         nDSyABrq9M+tvhn+6b3WZpNbRx97M/nqj2DvNA7+lS175Eq8lUnt1pYgJYwcI4/ZWPZM
         yt+CWd3TS5MTUD6vAMdsNRSYzpHXD8VmLoNpSxm3I2A8Z3Nl1Er7XYaypWOsX/zN6x+N
         I0Noa6vc7q0DwLXPI2EcKiM8R8UFBLky5yfGD/jVbuqpxSeD1KStll2/0wYmezM3Nj0d
         8c7bgwirvDTMY88mBs4BexBpClYnxDg+XxB9Fz2xEBuL6fb2sBRU+IztA3RPtOVk1FL1
         +hlA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0Ck64vLrE3XFgsFbMtKAvlZq9M6tr/Urcasj4KdK94ezJm4c5S15cJYN8RI6uqUwIgPCfZbm98OfKzL1ce9lg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2WbYzYoyIUxJrJ9bKLu/oWgcgYVRE/uS1cKgJSivcLdpzQ9pe
	ZN0scl8huQfkvJqOvmlv/AAhnhTa6I7dFquARpGaV/Blm2+7eB5RmJj4
X-Gm-Gg: AfdE7clwHFuu7+GbNkCsLlBCmK/Of/YfRC4nzzIT2dMrkPH/zStYrCuHZHtVHgIvo+G
	s+g8hh39TJvVyxmtsde6cx9aUQE1m7H5F1247dnp/uuE0WD+C0HavsPqCtO/KYvtyPpMNWjiWnO
	km6uRN1S7+SRh0SqAnevV9GmWQqprEVqjfud6h8zxkCb/wFLs57p5hxtFJnY0x1sNkOmlRAH3m0
	gmDXTVqXOc3tukeDuIQD2tylGBFmhaImBWP0M+Ai0CYGJmmImurf35g6f4aQMU430VmS/FFC3DK
	NotVvF8MaxDvJmbLgyaa0Ez7aNQbSjbhLAEJyRECHARUbg82jHcMalwYpBu1hOvHxTElliyKckL
	toSAf4HR+2NxhbV7r9CokDiV40CQj+f7Dvslm8dfLHeKE+P9GD59+DsiaeLyCwlaMfKYHz4724U
	U/V/cZw/3UxLBWPI3U0kqXmTcgMXLCzeDIxGR6SEpTUpCmLg7x7ji6BvO1Sq0typU=
X-Received: by 2002:a17:90b:55c5:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38e4b41713bmr14114572a91.7.1784542956061;
        Mon, 20 Jul 2026 03:22:36 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b20df7esm5616125a91.13.2026.07.20.03.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:22:35 -0700 (PDT)
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
Subject: [PATCH v4 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon, 20 Jul 2026 18:22:21 +0800
Message-ID: <20260720102222.251179-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720102222.251179-1-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_032237_036557_37F72A2B 
X-CRM114-Status: GOOD (  11.20  )
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
index 78534d613486..0a068abda6e0 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
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
index a029b660e8dc..7f1e6d2a1fc2 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -100,6 +100,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
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
index 7228ad4735b5..5a7a39b1b514 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -88,6 +88,14 @@ sys: system-management@40460000 {
 			#reset-cells = <1>;
 		};
 
+		usb_phy: usb-phy {
+			compatible = "nuvoton,ma35d1-usb2-phy";
+			clocks = <&clk HUSBH0_GATE>;
+			nuvoton,sys = <&sys>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		clk: clock-controller@40460200 {
 			compatible = "nuvoton,ma35d1-clk";
 			reg = <0x00000000 0x40460200 0x0 0x100>;
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


