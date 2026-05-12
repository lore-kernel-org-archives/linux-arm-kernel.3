Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3B1CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4n/F1eKXbXqdeANeiK1vkq+es+HjdGAH5wuLHdXDwY=; b=ucmcMO+FYi+6/rfxVtcS5G5sZ7
	FQ0KnnhzwNiBeV2VfOZOkmA4SU7R9AMdAMVlHNCwJM0fu1mZkLbQ7Aafpt4aSueAgreLJ7798CZr/
	IymmdOGOev1xBWtbCgdfnrjHOkeiN8ae3WxFH45PiycqkR3GRcZuxErIt5W8H2LdFrECDikLUMDYl
	nWj9pDB/gFd2Oe27eoJJ046iIjAcvOnjkm2XmDo6ELtCSlcWtP1RxFkfc/6LXlEXNi3wU4VD46IZU
	zhT9e8JF7IqDEpNxArhlJq3CcbDoGvUvRJ8Hkkl/QiLwv8UeL8nuJ9f5LxxpDLCs1ryNrxwZOrjLI
	DdwWZ+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhiz-0000000FxHK-24c2;
	Tue, 12 May 2026 07:40:17 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhiw-0000000FxFz-3sRA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:40:15 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-367c26471f5so2229102a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778571614; x=1779176414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4n/F1eKXbXqdeANeiK1vkq+es+HjdGAH5wuLHdXDwY=;
        b=bzX1CHBlrdWOJQdPGIqDXPB4xTCuP3D+fNPLprfkz82PQ3FF+NFBNUIaUDc4Mz1F7J
         LDIiV5StGrh6DdeLqa08ONvXTbqvenAIErpAoIhySkwKVwvAi4VDovQNaMWdmSF/HbyP
         2fgZbSMi+xSxdCrpf+Xh0yyNsBIKGrptFHfTJ9nmc3hA9pCsDcZsId0KZB9Z32K5ovjq
         uqzVP+1x64emo3uJfO+Fo8INJNfMDiEHEHUPwXmGWCnOC3/78GUlLRJ08ZWi/OPy/ntC
         89WnjuqQOJnoUD4/c0BQDOjXCGjstA61SBFc6tccaqTTXUenBCzsTfuJlEJON4VGghyW
         0nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778571614; x=1779176414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m4n/F1eKXbXqdeANeiK1vkq+es+HjdGAH5wuLHdXDwY=;
        b=meXXbXXOG/moJz2Oif7kYYFmGQojQduPh1u6mQ9WMSjjoYnRkJy7+5zvDd7Ho4ikb1
         JTu0nU4VfaI5QCZ3tVDDfp5AMOzIsq/OcaPV++MzifjgRH48ekPV2Hkq1k2a2rzsBVz3
         jBwYn9JlD54Iw3eDK5bBqf9BKd4uUHOiKCPto82zZ/AGwtVSZpj+/PpnSTLaDekzuDEA
         yCwFBjGymghaVIW3mkDnyRQwmPItKPElCYwSoXqzpsC7Ui0ivxMa8Sl+MGM4eFOiI5It
         98dJjBsSzcV/GAUG13z/5x/HOuzNLk60yYzlLm6qHTo3aZuAB82ffWTfqt/ow5QePGV7
         XuJw==
X-Forwarded-Encrypted: i=1; AFNElJ/gWEbBiDCT018RBW27DfsMD4omZtsgObyc3l/Ds1veqyc9U+CgarTKPVIJuo/f7jYqS49iiwaE2HBbfsbSKLbD@lists.infradead.org
X-Gm-Message-State: AOJu0YwJLTEYiZ23kAPfo/8C0mnDCvSA7klmcZ6BABSU6LJaedgXlpzE
	s93l4wBsqp6LnCVo0t1s6HQPP9SrW6sXqccb1di/FeeBYwvSBDmxgCzD
X-Gm-Gg: Acq92OG9nmna28vmF6I0Ofx0SUE5//vLnn8Hbf/bNAn5NE4cEstQP4ahzsxb8RzFVDC
	QiA5k+ETluQlGUutdVd9cf6JtPCBwItWBCO6bz24f9biCJ4UQDyMt0jISrt2gIAnwemRcplFXT7
	XQnNFlJaq5fhTddQC93bPjGV4kMrYAgEgBybTuKaMrT7oXJeIaJm/VMdP+z/abl7J+/8UTfr6fe
	8DmaZ+cO0LGzMlVJ/ycvOhzNiKKaruIaEkBId6rV5q+X6EzySfNe3lpX2tEMvLZa0qpQjJ60fFP
	S1ZOBc8YCEk1VUsfEeAvAYs9tPbFZD/sML0alto9WDu2uD9Im14XlsSsTlEW3XErskPpC39pgea
	QS6o8X9vTE0Rv0szAJI2BCUXlybtK5jTj5g9vH630ZyCzljvadE1LQd1h/NRONQjrRxD96wrp50
	FDwSnBO/t3a78Lg9SAkNxgsGSHX4DLlrE5Srte9erUnyjd5UzA6Abtsyj6qDavhqhwYymqLCa7v
	Q4zW6dWaQ==
X-Received: by 2002:a17:90b:590f:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-3685368061emr7314796a91.9.1778571614197;
        Tue, 12 May 2026 00:40:14 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d65ed459sm13264489a91.14.2026.05.12.00.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:40:13 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Tue, 12 May 2026 15:39:53 +0800
Message-Id: <20260512073953.564323-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512073953.564323-1-zychennvt@gmail.com>
References: <20260512073953.564323-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_004014_967107_B4C510F1 
X-CRM114-Status: GOOD (  11.41  )
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

Add I2C controller nodes to the MA35D1 SoC dtsi.
Also enable the I2C interfaces on the MA35D1 SOM board
to allow communication with onboard peripherals.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 15 +++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 60 +++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..a0f1d76d288e 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -13,6 +13,7 @@ / {
 	compatible = "nuvoton,ma35d1-som", "nuvoton,ma35d1";
 
 	aliases {
+		i2c0 = &i2c2;
 		serial0 = &uart0;
 		serial11 = &uart11;
 		serial12 = &uart12;
@@ -55,6 +56,12 @@ &clk {
 			   "integer";
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+};
+
 &pinctrl {
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
@@ -98,6 +105,14 @@ pinctrl_uart16: uart16-pins {
 			power-source = <1>;
 		};
 	};
+
+	i2c-grp {
+		pinctrl_i2c1: i2c1-pins {
+			nuvoton,pins = <1 10 12>,
+				       <1 11 12>;
+			bias-disable;
+		};
+	};
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..a88d1c2938e7 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -372,6 +372,66 @@ uart15: serial@407f0000 {
 			status = "disabled";
 		};
 
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
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@40850000 {
+			compatible = "nuvoton,ma35d1-i2c";
+			reg = <0x0 0x40850000 0x0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk I2C5_GATE>;
+			clock-frequency = <100000>;
+			resets = <&sys MA35D1_RESET_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart16: serial@40880000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40880000 0x0 0x100>;
-- 
2.34.1


