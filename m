Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57FEC44512
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 03:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=; b=YoWnRWhPI09HMoHvmLVMCTKmBh
	Z09yXE2bfk2WhKIJ6PYnezKOgVzcdd9ocYggd5639cv6BjZmaMqXeON+3wGa1mCTopg3v0FQL/vhj
	zYvPva+/vrGx2oUp08ZfgEMfj/Tg+jIZnmJsLQ4WdBRGT6v/+v1eoXj+f/XL1FtLUT7R6xMkvtbOJ
	D9qPogXgGyylI+UnoilyBfCo9tgI83ubSWBj+C/EHikzoRvyntsGBkPVCv40Uwb4YgK3F15unsHcn
	KX1v3VmF6DIV1pCR+mWtwfwDBn3e+zVYnTnzZXHtEvFG5b+wFIonePxBuWXgl4XeZBAq09R55Ys5V
	CVMry++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleL9-00000005jN9-3U7m;
	Mon, 20 Jul 2026 03:06:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleL4-00000005jLc-2Pv4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 03:06:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84874b52eabso8346945b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 20:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516802; x=1785121602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=Y0u/BZFlUALhN6Yo+KI7rEQa/V7ASpi7oQ+riqUBvuzrlvqsNhEmbh2IZ8ZqKa9rKE
         otD9QlkzHJKJiaApYdnHmL5po51hKvCAWe8TEgg86NDPd/WHdiH5TQRb/5D1zNM8q0sG
         n1a+fY6Rg3p4Dch74K7KVUEyfMm6L9sU5Hn/MRh4ZFOXvhGkrvSIrjHDGjxO8dL2z29O
         G/YS0Sb3bd+z/lKOUXuakfHXDYW5DPK5dAlaX0/j5SBi05RNQ1R2slMN83VI2tegS3I/
         9WhVPxr5/3F4p1K4l279G0p3hx9eRdombEA+EloFOdkGIHoDCdX9fS03lr69D4AFkBwd
         qtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516802; x=1785121602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y8Hcxg9MXxS8AWcFY2VAmn1cCgVHpq4caMsrXoFzEI=;
        b=Vbge+du0npN875keGE1Xs3Di6HskxaRThLkFRdYaGJGSbr5nHsSGXiBeEUos2OTrtP
         9PzniHDJLilPnNfd0DTUueT/WADw3GZlH09PeYawvYPxytK6EXQPNFkUqSiOctC+iREE
         atMavFR1pXJZDLHIJP7VQIg9yWzPQMhy7r8EEdrFxYPpPUkRZ9vkw46A4iVxHr21Wqyf
         H2NMiIZr08xw4n9eRVN9NLxsgp3OTK1VM5FB5ahuwdSrg5qbyDpw/8l1RaR0zUTDV9jb
         /z1Xf1LlH7vE2OS2EBw6K7HtSNoLuJv+4jKJf40Iok0NhweZ3OiHy09E+T0xH+VD74Q8
         MeNQ==
X-Forwarded-Encrypted: i=1; AHgh+RreZr+M2aalHA+KFyqYe2NhjSsVAp4F/OaZ3QBP+Z1KpxwygRTuuVUjwMMaIhMKhSqte4QBW9tBAL/AvherMl6G@lists.infradead.org
X-Gm-Message-State: AOJu0YwxhyS2aduGe+ECFcLwgB5jkNHEWLMjWYe9ZzvDreLwVxE/Jn9R
	H2/s0ekFN3pT9IOSzf8/7p6QVaDqQolzs7GfX3H0GqP5OjYqrAZqEEaM
X-Gm-Gg: AfdE7cmhDaD9JviYM7AJiBWdp6tps7+9243DLN79yHLCTUonZ1YZzwLBGYEjGIyM7aY
	X/65J5bselJ4Z0uk7erHdS2sGUtHx+vTZSIzzM8/UT9fl9wn57R7DC0tJ9gu/Z9DqPs3SakZBNk
	K+8Mb9r6/Lu5RMi6m1dEuShelhb6vQCl3gSYqGseYEhnmEZ8Y0+CvHWwod9oBv4iAqz72xPPwfQ
	YAuznlCSbTu6iLjNE9uqmLLlswAk8Xh0fcqW42/KBwiEBiHEhP2JAPqLB1nzvCwoQmBEUJSca5y
	GJtbQRvT6l84iwVbbTRcHaO6j1L0+5zwGBZFokWwkbsZuoWpYsqwEom8e1QbrXdEMbgFcpb4KQ6
	1UKJorOSYh1pH1mm7RsRpq7Z3NdO4cF4IJqQ0nD8slPat6FLhJXuc06psxCtZnKjDV17p+3+D1f
	Hg4vg9OOrac820hJOt1puuLnzC8t/kewK8WladblGfMxywkGzgGLCJ1e5Xxi50
X-Received: by 2002:a05:6a00:228e:b0:848:2c2e:c7a3 with SMTP id d2e1a72fcca58-84c292730d0mr12373498b3a.16.1784516801675;
        Sun, 19 Jul 2026 20:06:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfe9sm4805267b3a.27.2026.07.19.20.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:06:41 -0700 (PDT)
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
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v6 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Date: Mon, 20 Jul 2026 11:06:16 +0800
Message-Id: <20260720030616.1067660-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720030616.1067660-1-zychennvt@gmail.com>
References: <20260720030616.1067660-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_200642_619549_7C2ECE1C 
X-CRM114-Status: GOOD (  10.75  )
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


