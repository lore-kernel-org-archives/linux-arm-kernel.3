Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D98C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okOmr0t7RA98sStpJAac9VxUn6tLvqxzMwMqZfIuluc=; b=QAyLC9HVFxHzrUoHSQNDRiwFz2
	WLrrfMMHRwQeicKBI0KsfdNpR/HHOlR134VYy3S2Lvr1rJNoi+wfR4jU25OVszL5x+t9C611nfWV0
	MKZN5PtYIw3IqlsbcWz9VDNdLC0WFy45ixG8D0HDvrYIRm5R2XBqdo5XBf7Xly3SK6hOkrlQ1DmwT
	w4hU8nfPHoBml0vWpkOQsDVMIXmXL4Ft7g6WX6PTeVm531PWj0qLusfX9xFFBbOclW30QGEapHfuu
	5v0dOnzwV9s5q4WPdiqtrkcmjWaWMqmXQDomZN3cZTLxlG+FZCAuCj8BCx0Q4FBdKw05AkieMBMq8
	Ak6X3jyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNAL-0000000FeUB-0drK;
	Tue, 30 Jun 2026 01:21:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNAE-0000000FeR7-3Acq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:21:27 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-845c92bc464so2346265b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782486; x=1783387286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okOmr0t7RA98sStpJAac9VxUn6tLvqxzMwMqZfIuluc=;
        b=WzC0RktukHAWifat0pUmSQnwiTtOxjPLQAPjMuAn3tFw03BPnGUvkIRSu1ZoLcOp01
         yvxSuZj70jlBwSjqdHoWDjs6Y87TtSq6ghK7Vuh4zWb5QfEo63+rsNeg4mefPPRXJNH3
         lB7QfWmed8TosQ4UvHBKECd6RtyrdKwt3jmoHdZrV8lkxh3l7zs3Gqw8crTuunFYrpkB
         lfSoc455t2tQZHw6TzU9e65ai5Y5hVEyByRrIBSZkiQItQshbwl7IC3AEbfpJ6B3KhaW
         lIBOeOJD81kS9aBxWrefiKrcZ8SIttnjyDQhpInrgahrS/mh4N1YHbOGWz5xExxTfzzR
         Y2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782486; x=1783387286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=okOmr0t7RA98sStpJAac9VxUn6tLvqxzMwMqZfIuluc=;
        b=KwAnewQiTxTbKNTyGgCQ1NixVLWIvwwAeCvk3G+hxlPkT6vKbgANPJKY6cT+FBRGp9
         Hh2P3TsmOnwKTsMvX7uOiKAZCWojaFH0kuGNZiU51N57mGiaJHEZm8LRTKWeB9Nss6u1
         +xSYWj0EU8rdF4Cf7YswnyK7XnRRh65YklJc1ApZVYBQve5pNOfXQBSY7g1izAQa89IP
         d+JmNMUGpwcs50WY/oTvgGB81Xdo9g9NY0zMTAjDl7eyj8BnkYmQxDnJ936ZGkBxiWyX
         5TEkQ3MdBmqzFmzOnq/PAzh/nYtOKylM4Ytwxi2PYzFke2BJn6nuws2ttT7UB1mjrl2O
         3ZEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod6552XamupW19K5uSogF6mDwp5uEDfS7xsqjCW3z5C8ckI85Y64SOQMw1zdMey6io8s5ax+5G4vLmp1lx/M4X@lists.infradead.org
X-Gm-Message-State: AOJu0YyaVJ86G6jzkaTmeTRhmkrnbUbz83r9cOD2m1NsLFEkqozT3ZDq
	dpOzvT/tFrCUHG5Qeduc5AEBAXtQBg4f0Ujxq0FnqLGWpXusn8uRwgcl
X-Gm-Gg: AfdE7clKQC7qZpHe4Zf3XyuciWJUIDNZ3GweJRHyoKq4tOWuPdrDUmEeYNfNg5+1/4J
	UH3n1Ty4s3OrajkWBf14cLN7FKzyAvJcn6jYwTqm6CMCl6R33ijLOaW7PGUzvlGLeB4Rz175CiI
	bGBUF9Q3NZwe7xR5GuvkC0w0qOkanH8cz/HpI4CqiJlXi4xoVPLEhFn+saG0Ae7frrPcM3FFNsQ
	CPX3xsvIjx6l87jjDki4undYMammVMZ+D6hq8jEecR0hqhfZ2MtH1NE7pmAPh2Gw9ub4Orx0yR6
	WObNEGZXuQqDptkSOPtl53eayrdpQMGhLdMc13g70xgNOf7+uL+hZoceBL5LJZEEsZIlxOeL9bm
	+6oWdzBN3/SPbbal3c4ZE2mV+dgfhoiZpwzC5QDOAsHgaoA9dmhsOZpV6brd+jP45ZoLZ4bv3RV
	3EB81X9g6MZ//CH65G6mMv4lLCYL9IJ8H1bFBlqxYgO3CFL5lllP5XY6R5dhsfXTm3x9NGU7Y=
X-Received: by 2002:a05:6a00:21cf:b0:847:9351:16d1 with SMTP id d2e1a72fcca58-8479f22aa06mr1116256b3a.30.1782782485795;
        Mon, 29 Jun 2026 18:21:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm654503b3a.49.2026.06.29.18.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:21:25 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Tue, 30 Jun 2026 09:21:06 +0800
Message-Id: <20260630012106.3616821-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630012106.3616821-1-zychennvt@gmail.com>
References: <20260630012106.3616821-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_182126_799584_7FBE849A 
X-CRM114-Status: GOOD (  10.89  )
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

Add I2C controller nodes to the MA35D1 SoC dtsi file.
Also, enable the I2C2 interface on the MA35D1 SOM board and
configure its pinctrl to allow communication with the onboard
NAU8822 audio codec

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 20 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 72 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..1ffe41c03f3d 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -57,6 +57,18 @@ &clk {
 			   "integer";
 };
 
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+
+	nau8822: nau8822@1a {
+		compatible = "nuvoton,nau8822";
+		reg = <0x1a> ;
+		nuvoton,spk-btl;
+	};
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -100,6 +112,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c2: i2c2-pins {
+			nuvoton,pins = <1 8 4>,
+				       <1 9 4>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..28488889f564 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,78 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@40800000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40800000 0x0 0x1000>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C0_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C0>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@40810000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40810000 0x0 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C1_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@40820000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40820000 0x0 0x1000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C2_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c3: i2c@40830000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40830000 0x0 0x1000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C3_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C3>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c4: i2c@40840000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40840000 0x0 0x1000>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C4_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C4>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1


