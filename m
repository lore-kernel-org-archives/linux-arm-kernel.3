Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CE7C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 06:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=; b=26byyELb4rmnHrZ9jK4wtDzAA1
	hmo76hzROHxvmmmdmhJhuih/pza833Sn9YcSn5BW3TuHSPPhfJG6hhz22qIxIk4jSNMPn05A15z8O
	tfH6a+lqSR1HaJeqBigQtroBmSt5qeT7gsS3vH9G0DkfUK/MwOnq01GneDOS8mL7X+YVYx3+9unZd
	1fX4P0lqH2smnEbeuhpTcsDL2tiZ4qcoVyCrnojsTa6S6CvI/gHSQKhs6prvVjkpW6zJFgQCOSH6m
	NWnQBrQCFD5mIqtMOvEaIcmpkgmxO6RcBXIGiEVciH0e8s1C+EMI4RX55l2Fxn9YQJOldN1XY8xig
	xCESyahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDgy-000000079Eq-2dNK;
	Fri, 07 Aug 2026 06:04:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDgw-000000079CO-2rJd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 06:04:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2506279a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 23:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786082666; x=1786687466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=LXDOGQ2aRTQ80s82JhocfAfrbjxL6TdYnjw9AbKcQ6mKrNj6JW/7tBv2w5pfyNPllG
         xn8fdyi99uZIHOUZhMjgwF3I2HDI/g88ynJ8iMzHd9dqDrFW03KK2FQbd34fZTJXYLrP
         9GI14GCrxJqsZxKX7Hro06npAOA+EuruFTgtXzwgpJzLxyNbIxtEvKtMYZnJYzFeBE1V
         Y4ZfrdBeoqaKoyHZuPopOb1mnpb0QvawV0bgB3X0CoaHFFWLn18JlJ+7SiEfYKFU8DXS
         WAV7GfUgP/jTX3Jrk0TVq8FzfM8RzfNInrgOHwLJbUGR74x+DSe+nhlyZ2XYBmyBLP5L
         jchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786082666; x=1786687466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=k6G4oFi8mPar5a3TLvZBlu6x4HyGhH8N+put14VuQpD4Mkdx7UiRlAe4cpx7mMhlGj
         0820Kd1TIU2JHKQCZx9LNM/+q2EwLVZfU05Y82QWLFsp+KL4YwxPaqWlvIWwxjaQXlM7
         J+Qvusewp/zgHXFDkIoNdYRbzR4gpPLGe6XAdEsl8BJr8mh0tW0LfIMYpWUcthIUx74Z
         EvJoFpZLMR8MNTcOPTZPOvA1kFiIHt1w8Li2/uBj7pymB28n4VLZ/NyhihTaUb/EQ1o9
         8UMT/KtpMlEB5T/Em8671SRAkokf11Zr8dTUeYiqzOimpz9BuKJ2OmfqDdApLr0zV2cm
         DnvA==
X-Forwarded-Encrypted: i=1; AHgh+RqnjIuvUmWHXwyxzrmwV1NasPhSikvmYyQNkPI1CcGMNVF/XMIQcACBEFgV8k7IWKmxfRdlUYqsesuR3oqpcZeS@lists.infradead.org
X-Gm-Message-State: AOJu0YyqWGv0sXzU/iS/iorOcAwjJnKwKTCO3rxTGM3Lq3uEeof0ziy6
	LlmdEoFq3sdriDQqqpz1MltvDdrwMwDVN47zxOMifVSiQ0XRgRgRxl2m
X-Gm-Gg: AR+sD108T0G8WxynylzzPy3JslYf42IfKda8yVyqdhLBcBCyL5YBpFkx7uPu09ov/wb
	BSbQecSg9IQnogSh5G/U8szLiYDXeS2uDzYTYgPcFQKp8uS52cJz7oeTpdyBboSxAFLrPRUQFe/
	iAg+rb5n4ei0lfZBH3/wivSHz2roSywT0tVEtOHojOp59mOzvXsbdZzbYVfSasiiJxGA5F6OsDN
	Ew9DGUR5mpQVzUCCt30T1P9NMDWnppJW8zOp1UuoXY9s3lJ3DovQ+yFICSsQQkz/1ZdeHE4NdqZ
	nUb6EEA7xvz9n07AnSvtNBtsCQt2dwwpJdmE6PF9Kl+3qkrZnvk1k5l9yuhhPCSLDYcS4Q23OBb
	DRWGfCTscXF7IBcMM5J+of1h4AvpDAIOTZO/Luos9RipYX4IayFrrn4+cz8i+EU1bkenWkHgsHA
	yPJTHu1dw16i0rhCVmbAM2IkcV4HkG+feBOmHb3g5PQRQufOC1O9pjsEmOVUkXT9Qf0cJs2dp/h
	ly1x/iZz5opYhP7dn/asADEeD/zANIU5I5qTBlGmn3ECF8=
X-Received: by 2002:a17:90b:524c:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3903c54b386mr19817734a91.3.1786082665738;
        Thu, 06 Aug 2026 23:04:25 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de9c0fsm3375588a91.5.2026.08.06.23.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:04:25 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v9 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Fri,  7 Aug 2026 14:04:00 +0800
Message-Id: <20260807060400.2047517-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807060400.2047517-1-zychennvt@gmail.com>
References: <20260807060400.2047517-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_230426_733969_8A07E0F6 
X-CRM114-Status: GOOD (  10.37  )
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
index a029b660e8dc..422468dbc3bf 100644
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
+	nau8822: audio-codec@1a {
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


