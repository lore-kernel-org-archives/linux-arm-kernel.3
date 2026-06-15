Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CD4CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0UWtt4coThKyPKnZ5mqdOHry2K2IKnmgBl0O8XMrW0=; b=pgRazVAqnO49+bwsSjiHPw1y+a
	h40KvZcY731vE8jB8965+3Iongtr+d6LSiBPhsRJ0LVOSuuLCOZxpr1fBNtz7ycX3aQrtS66rEFaB
	b78XbA6inUmWi0pvQXXdfQ9MCpjJTr7pynMpES+IbDnCLhlj+krh+PJmdmx6EiVhqTqMOxAwSEyLp
	99xzSqUmMuCvhkypw9iNcQR7LM8MfLUHgxHjkGGDQOdzp/+dbuUiLhZ/3mCOIB8i3shqmMH+FjFWU
	SwXjkMntQXX3hbm69HknAKCs5cULOFM/EDStScaNZqJQgqURmth9ZhQ/hQulSCmcKMhtyHanhUw8R
	iE5fZBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0CR-0000000De35-3RZN;
	Mon, 15 Jun 2026 05:49:31 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0CM-0000000DdzO-2dQh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 05:49:27 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-137335bc3caso3283205c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 22:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781502566; x=1782107366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0UWtt4coThKyPKnZ5mqdOHry2K2IKnmgBl0O8XMrW0=;
        b=rOfC4uOUvyhht9HdAhjk6R55fgPpetTBgYPBp71ZCpmIVkY+jbVHQGEKl6KSvErFYc
         8WB0duuvkVwkV3M9pmXu3IBEzuUqwmWaGs+a8IoNGK/Ax87jxRNkmykSi336b1BLcK3U
         wRIJXPCiT2fzoxBnY0EIWyr+KOsKmWgvPqeh74jXpUZWwl31gW4/Rrk3dFR1FjfjEY8h
         eaji/OTI1hIPVK08VJyAnSjCBK52DY+SJclN/RzCM3v/EQmRs7DPrS4bdPrx00S/9mJi
         UhH/rFas5ozcVPnNa2ZWltBSIQ0IEHBdLnicSCLZX1DMhqes9EI7sCtLRmEfGibJ9SVT
         NwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781502566; x=1782107366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0UWtt4coThKyPKnZ5mqdOHry2K2IKnmgBl0O8XMrW0=;
        b=Ns6FKqBCZ+u4luPTQ2Zx4Wpu/UUX0/LdwSIWFrnwG74lgLIscRooMDbcZRppaZbjYY
         SIDe7JaRSAh1e+XPsN79h0MW+wJXgoZv1ODt5AGbJkZa3EHDe9tIN8oHW8rIse2mVvFL
         YSjzWF4t8Ei+kFyzhlZnS0Un5aAI6NPwV3Yxd0m8jnz8qPWQqsYeZcpWcVGpnqPy+Vn+
         TBQUxqfsCNaerPC8nKu54A8nfJBulQqszEYh63O0vIJ7o6FhaQXyszJ22AdH/DqDsmxB
         GIhOS/OOuXP5PugyIEJ73mWxV5S0EtcFvfn6mJ5O0y7idIMeHxwsMYNT45D8omgG3rX9
         u6pg==
X-Forwarded-Encrypted: i=1; AFNElJ+9phrnnCm+O1/aFsnLBeK6MoXzz9vd3enh2Q3Z7g3B+9wlpNcAhygI0ZJZKRe5dlc4TfmCQPXCZtQh+o/unc4c@lists.infradead.org
X-Gm-Message-State: AOJu0Yyptp8ggZW0FFolu/UNDFsSL7zjuxHwatjh29+LIHYSlQjR+hdo
	4lHLKR3tS8FJmLIIScmJTWqIywe3J4p6j8ttfugQbK4h7M8dogWoNk2A
X-Gm-Gg: Acq92OEXbnxHmqFG/X0Z1a5RC23ZQEakc5M1WG+QIZIRytcd0kL9noakdhbJlwzY5MV
	epbeaFBbUAZQziaa+EvqGQzdUtgzk/5HMK6HPfMWGnpzfIL0zf/7bSfNj/ai5OaQxOD9uDLbUom
	rUatrQOB3uzGixgzOhEGOsLwIrYiKxt9vDuDVW/mBKvzL2mNiZU6tHzLSw/X4b+Igwz9ix7WUSW
	ExCkwpSgvdoELxvq1ZfbVGBdJnZL+2nNcFxwjoePQ8IQ8oYQS5BDo09Ye3ue3l/7ic8oA8bQBbt
	/DRSFPKkRo88c69nrG7UeRc/bpw/MU019WfysRSF+zhZYwvUJ3NGcZmExT1EC1Rom/4Xah1q11J
	sFgSQTkKvQ/N8kszatLCETsgoPYjAd+i7rNthZnfg+/gYnv+V9dVta08odsQ+7nU/WJMd2FnB06
	dU2i/mHrv0d6a/V4jf5aFL4eS+TtT2AabW2X15dY3FtKmlfqEfzJhU8NJ4FqBghMv7L7AZ3ClRw
	S+tOv+uecho
X-Received: by 2002:a05:7300:3202:b0:304:d788:ac5 with SMTP id 5a478bee46e88-308200c9097mr8011634eec.35.1781502565474;
        Sun, 14 Jun 2026 22:49:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ddaf69asm14295300eec.0.2026.06.14.22.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:49:25 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
Date: Mon, 15 Jun 2026 13:49:10 +0800
Message-ID: <20260615054911.48821-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615054911.48821-1-a0987203069@gmail.com>
References: <20260615054911.48821-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_224926_715712_75EEC078 
X-CRM114-Status: GOOD (  13.63  )
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

Add device tree nodes for the MA35D1 USB subsystem:

  - sys node gains simple-mfd + address/size-cells so it can contain
    the usb-phy@60 child.

  - usb-phy@60 is added as a child of sys, using the combined
    nuvoton,ma35d1-usb2-phy driver with #phy-cells = <1>.  No clock
    properties: clock gating is handled by each controller node.

  - DWC2 gadget (usb@40200000), EHCI0/1, and OHCI0/1 nodes are
    added.  Each controller names its clock gate directly and
    references the PHY by index (0 for the OTG port, 1 for the
    dedicated host port).

  - Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) enable the
    PHY, dwc2, ehci0/1, and ohci0/1 nodes and add pinctrl for the
    HSUSB signals (VBUSVLD, PWREN, OVC).

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 68 ++++++++++++++++++-
 3 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..32fea36da7f4 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -95,6 +95,16 @@ pinctrl_uart14: uart14-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>,    /* PWREN */
+				       <11 13 9>;    /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -126,3 +136,29 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
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
index f6f20a17e501..85d1c5db8bd9 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -98,6 +98,16 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	hsusb {
+		pinctrl_hsusb: hsusb-pins {
+			nuvoton,pins = <5 15 1>, /* VBUSVLD */
+				       <11 12 9>,    /* PWREN */
+				       <11 13 9>;    /* OVC */
+			bias-disable;
+			power-source = <1>;
+		};
+	};
 };
 
 &uart0 {
@@ -129,3 +139,29 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
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
index e51b98f5bdce..73ff1d78d284 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -83,9 +83,18 @@ soc {
 		ranges;
 
 		sys: system-management@40460000 {
-			compatible = "nuvoton,ma35d1-reset", "syscon";
+			compatible = "nuvoton,ma35d1-reset", "syscon", "simple-mfd";
 			reg = <0x0 0x40460000 0x0 0x200>;
 			#reset-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usb_phy: usb-phy@60 {
+				compatible = "nuvoton,ma35d1-usb2-phy";
+				reg = <0x60 0x14>;
+				#phy-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		clk: clock-controller@40460200 {
@@ -379,5 +388,62 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
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
+		ehci1: usb@401C0000 {
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
+		ohci1: usb@401D0000 {
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


