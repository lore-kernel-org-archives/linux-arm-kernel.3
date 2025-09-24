Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE35CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eZQABsAhaZWnP99sKJ2d/XVXhqpQHgXWFC6THB6jVzE=; b=f0hgqbjkPkGA+xDkPGG+u9xiB7
	+G0olRh5KYZzTZP8YX86T7i6vhJoJpoZ/DxEyrDja8Jtqbmh14taT802sy4FUvgjDudTLenqx9wsF
	6hbjaIQSt9xTTtmWW5kkiLuJuy0vsbNONMiE9bb3vAlLP0DMDLgbCAHxSWClwqffaToDqZPB2G5o/
	K+ERUFz46X/nG7A8HAWlbZGJAtu3Y6s1T0jwR1Crp5XCkUDq9gRrmBrNrVg/E6S+Q7T0ys27kFUAw
	GBm8qPuqELb7LvX7Ljf2Rbdt+V7TVQYjQYlHr6NBtGU3xKWstBa466jC0E95Z7hxPyIJe3zT7Rc8d
	ZW9ro89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LJQ-0000000FxNG-0h2l;
	Wed, 24 Sep 2025 08:57:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LJO-0000000FxM4-23ao
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 08:57:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so4899627f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 01:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758704236; x=1759309036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZQABsAhaZWnP99sKJ2d/XVXhqpQHgXWFC6THB6jVzE=;
        b=NEN5NHOib2b/LUPI9497DSXeEZ+2ifpkYPzeBvw1Rm2jNmChC15Xk2cSYNCUGnNCpp
         b9euvpIeshh15/4Py6UoRaWhXy1LhxxZG+o/N69SJRXmMKYsxBfI4iTa3FOlCDfneEF1
         riP8bYipgAPLM7E7sdtWXPbPxddYP3p+SNtCzWHCjqN+2M5HviposTPSXRJCAHIBsv0t
         kPUhcU7csBVEYORNdab7JDyERg6C0c8C87zxOc4l1K97gIDuWEzaiIuCaLg/i45M/S8g
         yAoec+Yj56t1lQ+cqoS/3MXbflBx3qZvaJlfo0X9ziz4JRcvUsk2YTptlfKf+wTkno0B
         XJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758704236; x=1759309036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZQABsAhaZWnP99sKJ2d/XVXhqpQHgXWFC6THB6jVzE=;
        b=cr0ifApeUw3q8Kjd0jdJ/Bf5s+wEe9mNn0I+ODUe4hmKec8Hb6Zz5Jri6TisO6TMBL
         cyfK6tISobFpin/j4eFSzeNImKSxOrZkTzhcpdtlJtIEVGEbOD1ervGSatChtmLGIDQd
         Taa79/j0cMViP1cRz6c7ic2XiURli8oT3zEETn3+k07t77VuxP9RcVqRKrKSZY6lw8hi
         dKHA6Gh2ZjqrL9CXL5cg6OD7E37cbgrOsHaoLG+rEW7aAMSmNLGaSWiskApwf8gWDXYe
         cz6E/+YdjX5v8FOAmUbR2SVW+KGW3CG7hWLnba301eJ+Otc7xPFY6Jg97toQdV8iVzb3
         GFIw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Lm4fqdn6I8gDZreP9QWzSkgbbsbYhJPVVxPkGeoRq+ZZeqEARe3wcNdrihPAiMkvwqoLEbIkTq1DUAMZoVHc@lists.infradead.org
X-Gm-Message-State: AOJu0YwzOtP1qO+2+UhvyxWTqVyYwVYe9w32K9uMxoljihA5bN8eSsB9
	zPZovY4Ac8dTyxNdHcnKsdLGJy9M7wt5dbms0Y5YrbSINOHhXhec2jB7
X-Gm-Gg: ASbGncuMSqvtJtYvhxHNjNYZdl4iM09Hz0YQU7OjHMy0EuxzWz3zHWAE/IvS9M7/QhL
	rOKdgXSMZlEZpN9j57tqKjur5BpYWcR9GE24qKCi+G8v5UBwpLASVHb1B3GFvqOReHpl1PFxtLC
	r8YVugT9fiLXb6bEE7OQlhT+mFSxgmczhCCj9YNIMaaRwo6xjbkMakEtoqovtvUCuo17zZ1P3qx
	2paJVTiossF5SoUOuxoNlvEvs3o7cF3OFwmnuSqX4kqccwG8HZEGj2xox82h0cqdYQIHJ+B/S7e
	P3UfcjbXSQuVWmHIQJ/7XYTNRCf126dXkpKg6OJMw3P4QnQpat1hWmDO/ijnhXOSlD2kBICK8o6
	dOXBbJbhFa95lBk35jpvPIKXy20QrYzQMnukDYfAz9RmVFW2SqHdGZ0PZsXK5AQI7Ja9icSThzw
	g=
X-Google-Smtp-Source: AGHT+IFAQVVTJqXg5yQs/+ThozMRcqlcagwTBEK9LUVVXAD4FsHijd48Q5FjgS30xwZwFRzrUjXWUA==
X-Received: by 2002:a05:6000:2c02:b0:401:8707:8a57 with SMTP id ffacd0b85a97d-405cb3e5b79mr4129430f8f.55.1758704236275;
        Wed, 24 Sep 2025 01:57:16 -0700 (PDT)
Received: from cypher.home.roving-it.com (82-132-239-193.dab.02.net. [82.132.239.193])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee07407cffsm26997622f8f.16.2025.09.24.01.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 01:57:15 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
Date: Wed, 24 Sep 2025 09:57:02 +0100
Message-ID: <20250924085712.1040284-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_015718_555959_E2DDF622 
X-CRM114-Status: GOOD (  12.13  )
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

Typically non critical IP in a SoC are disabled by
default in the SoC .dtsi and enabled on board specific
configs. There are usecases, such as some CM5 carrier
boards, where display output may not be desired or
connected. So disable them on the SoC .dtsi and enable
them on the RPi5 board.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
---
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 31 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 +++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 6ea3c102e0d67..359c262b8d956 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -97,19 +97,42 @@ power: power {
 	};
 };
 
+&ddc0 {
+	status = "okay";
+};
+
+&ddc1 {
+	status = "okay";
+};
+
+&disp_intr {
+	status = "okay";
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
+	status = "okay";
 };
 
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
+};
+
+&mop {
+	status = "okay";
+};
+
+&moplet {
+	status = "okay";
 };
 
 &pcie1 {
@@ -119,3 +142,11 @@ &pcie1 {
 &pcie2 {
 	status = "okay";
 };
+
+&pixelvalve0 {
+	status = "okay";
+};
+
+&pixelvalve1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 4cae17c04b50a..4cd51d80d40d0 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -287,12 +287,14 @@ pixelvalve0: pixelvalve@7c410000 {
 			compatible = "brcm,bcm2712-pixelvalve0";
 			reg = <0x7c410000 0x100>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		pixelvalve1: pixelvalve@7c411000 {
 			compatible = "brcm,bcm2712-pixelvalve1";
 			reg = <0x7c411000 0x100>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		mop: mop@7c500000 {
@@ -300,6 +302,7 @@ mop: mop@7c500000 {
 			reg = <0x7c500000 0x28>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <1>;
+			status = "disabled";
 		};
 
 		moplet: moplet@7c501000 {
@@ -307,6 +310,7 @@ moplet: moplet@7c501000 {
 			reg = <0x7c501000 0x20>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <0>;
+			status = "disabled";
 		};
 
 		disp_intr: interrupt-controller@7c502000 {
@@ -315,6 +319,7 @@ disp_intr: interrupt-controller@7c502000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			status = "disabled";
 		};
 
 		dvp: clock@7c700000 {
@@ -333,6 +338,7 @@ ddc0: i2c@7d508200 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		ddc1: i2c@7d508280 {
@@ -343,6 +349,7 @@ ddc1: i2c@7d508280 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		bsc_irq: interrupt-controller@7d508380 {
@@ -388,6 +395,7 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			status = "disabled";
 		};
 
 		hdmi1: hdmi@7c706400 {
@@ -417,6 +425,7 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			status = "disabled";
 		};
 	};
 
@@ -439,6 +448,7 @@ axi: axi {
 
 		vc4: gpu {
 			compatible = "brcm,bcm2712-vc6";
+			status = "disabled";
 		};
 
 		pcie0: pcie@1000100000 {
@@ -611,5 +621,6 @@ hvs: hvs@107c580000 {
 		interrupt-parent = <&disp_intr>;
 		interrupts = <2>, <9>, <16>;
 		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
+		status = "disabled";
 	};
 };
-- 
2.51.0


