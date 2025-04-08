Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57130C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxEpef98zo0DtY/wTrEUsl2SxJMsDBYfYTg3ahvvpY0=; b=Jocjbo2Y/jN3OYLLxRMZQDeOAV
	hVkI2vA9cuq4Eok5RXcW1DqIhEkx+Waqf1EE5oOtNGxWrgWqFEKrafANXYT57bHKpc8WRYxwygKdm
	WBAAOuXlg4VWi0t0BTYrJQF/19r8kuhR5Pm33wnX9eiqgLgzUv3ryWTceHZNaxjQlHUFExWeBmqZq
	uaTf9/7kwOMM0TzS9Q4Bk8fUdXDx/O+t/wNb09OnoiGMfU8VbfsOJ8BjX8c968VnQ9eSuacu7QSdE
	aN/nQFT+BunfYzOXHUpixHhV05w9NcdXPNTQopiKt9A9doq2ONU61JY3B/Mhyg8VDQ5hKWi7Pc0w6
	clBcvS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28y9-00000004CF0-33un;
	Tue, 08 Apr 2025 13:26:25 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u289u-00000003zyG-0tAs;
	Tue, 08 Apr 2025 12:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744115657; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eEGl9kdGmsR5jvPM5TYa7m0v/t/EEffI3wBDHgocS8sZD+Dd6em+Ijjv4tyF3uI5dABQbfWlpKQIbudOlAvjzVwfVfapSBYueDrlospdd4EHlkU2Vp8HJGWnqk2JmHV9+MuT88obZE5LaglHOESLlP/xIH9UCSU282WjRTOlwQg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744115657; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WxEpef98zo0DtY/wTrEUsl2SxJMsDBYfYTg3ahvvpY0=; 
	b=ew6Wx+o5cKBSiXpaWLmShm3ID3YRgaI5D48tYLMQErytD9OZ/6bSmkecg3vyrNqCxJYVL7ytuljzINucoDumTkSrLFBnmcGtranQqPFwHgcbuHFhY8hFLYyN9xesOyLJD6LDulEi4/lZ03J6q4S9UcHgRMXLEgvFRGypUcSMcCw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744115657;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=WxEpef98zo0DtY/wTrEUsl2SxJMsDBYfYTg3ahvvpY0=;
	b=SrKL/dz3wgsb8OfABGEctt277s8xyiw3yHaIp/nbAi6SbYj3P6Eu2WKolPU09C+s
	NKCrvWWFBEJd4EHIz73guW5f6RBJ0/7ClAS+JNxXdMqJt+9ahld//yC3MrSlfP1Qyo6
	aDXI0fIoY1RtVkgomM9ziwJU8WqCXSOhHAOof3fk=
Received: by mx.zohomail.com with SMTPS id 1744115655329265.3607261461008;
	Tue, 8 Apr 2025 05:34:15 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 08 Apr 2025 14:32:19 +0200
Subject: [PATCH 7/7] arm64: dts: rockchip: add PWM nodes to RK3576 SoC dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-rk3576-pwm-v1-7-a49286c2ca8e@collabora.com>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
In-Reply-To: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 William Breathitt Gray <wbg@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-iio@vger.kernel.org, kernel@collabora.com, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_053430_297336_1AA1FF8F 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

The RK3576 SoC features three distinct PWM controllers, with variable
numbers of channels. Add each channel as a separate node to the SoC's
device tree, as they don't really overlap in register ranges.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 192 +++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index ebb5fc8bb8b1363127b9d3782801c4a79b678a92..b6ba1d5569b3d961707b182eb5f960939de67c84 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -700,6 +700,30 @@ uart1: serial@27310000 {
 			status = "disabled";
 		};
 
+		pwm0_2ch_0: pwm@27330000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x27330000 0x0 0x1000>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm0m0_ch0>;
+			clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm0_2ch_1: pwm@27331000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x27331000 0x0 0x1000>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm0m0_ch1>;
+			clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
 		pmu: power-management@27380000 {
 			compatible = "rockchip,rk3576-pmu", "syscon", "simple-mfd";
 			reg = <0x0 0x27380000 0x0 0x800>;
@@ -1841,6 +1865,174 @@ uart9: serial@2adc0000 {
 			status = "disabled";
 		};
 
+		pwm1_6ch_0: pwm@2add0000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2add0000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>, <&cru CLK_OSC_PWM1>;
+			clock-names = "pwm", "pclk", "osc";
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1m0_ch0>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1_6ch_1: pwm@2add1000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2add1000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>, <&cru CLK_OSC_PWM1>;
+			clock-names = "pwm", "pclk", "osc";
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1m0_ch1>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1_6ch_2: pwm@2add2000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2add2000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>, <&cru CLK_OSC_PWM1>;
+			clock-names = "pwm", "pclk", "osc";
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1m0_ch2>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1_6ch_3: pwm@2add3000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2add3000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>, <&cru CLK_OSC_PWM1>;
+			clock-names = "pwm", "pclk", "osc";
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1m0_ch3>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1_6ch_4: pwm@2add4000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2add4000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>, <&cru CLK_OSC_PWM1>;
+			clock-names = "pwm", "pclk", "osc";
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1m0_ch4>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1_6ch_5: pwm@2add5000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2add5000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>, <&cru CLK_OSC_PWM1>;
+			clock-names = "pwm", "pclk", "osc";
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1m0_ch5>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2_8ch_0: pwm@2ade0000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2ade0000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+			clock-names = "pwm", "pclk";
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_ch0>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2_8ch_1: pwm@2ade1000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2ade1000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+			clock-names = "pwm", "pclk";
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_ch1>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2_8ch_2: pwm@2ade2000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2ade2000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+			clock-names = "pwm", "pclk";
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_ch2>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2_8ch_3: pwm@2ade3000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2ade3000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+			clock-names = "pwm", "pclk";
+			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_ch3>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2_8ch_4: pwm@2ade4000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2ade4000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+			clock-names = "pwm", "pclk";
+			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_ch4>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2_8ch_5: pwm@2ade5000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2ade5000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+			clock-names = "pwm", "pclk";
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_ch5>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2_8ch_6: pwm@2ade6000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2ade6000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+			clock-names = "pwm", "pclk";
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_ch6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2_8ch_7: pwm@2ade7000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2ade7000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>;
+			clock-names = "pwm", "pclk";
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_ch7>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		saradc: adc@2ae00000 {
 			compatible = "rockchip,rk3576-saradc", "rockchip,rk3588-saradc";
 			reg = <0x0 0x2ae00000 0x0 0x10000>;

-- 
2.49.0


