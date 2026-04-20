Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94DFF588C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSolDDpiDBp7rWjrXiBrHsvEmvUxxGJrGij6jJWU4VQ=; b=FwdCXSh34WviW+TGTQEyXEcSOX
	ka1wvsxd5TnysYtVh8fKW+wQBoKRhK7e7wzKoUEWB3i4eHb30TW8wmBiL3W+/R7fwcwLgSXmRLyYI
	BUBdUX43yU1MoB3vmbipzLlFbWnZxf+lj8r8wJPN/F3bUR1m+Of3xJsRb/5sC82cKlc1/he77h3ng
	E/Z3G76WiNhRsvw4CxQeHRyqAxeLZsIFa5UmBLsWu3JJHC9bhdR9Ksacu2bKz46ztM50hYCGWp2fR
	ug9xJrBWRSCVadukoeqPE8QwdDZyHxTUjp2BHJB6ofAVG6eCxMWWFzsZ6B1et/fXoULR/u6vJqGNE
	IjWcdaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp4e-000000076MU-1ZkZ;
	Mon, 20 Apr 2026 13:54:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp4Y-000000076FN-2tPP;
	Mon, 20 Apr 2026 13:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776693228; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j+aOhXs4DVBwpxsZJ16wnb8P+Ej+na5XG0cov4RxMfY9vpGwPemjRyoT77CuYHMjKPTlEtaeBplP+G6Uw0J0qPTi48/5dfZ8PStwY9FFjodK6f9FyOjy/1qZIE4YShsfTJEKuHaeTnEWce3VsYfpRSgoZAf7Wd0vhV8o/rTHGdo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776693228; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TSolDDpiDBp7rWjrXiBrHsvEmvUxxGJrGij6jJWU4VQ=; 
	b=BpNkWjeou5e0zBbgKhgmRj8/GxMbx1pH/9uOxnoWcWa5MEHMrlevCxurSPHT/9AIPR5fxUxkCOKD0TYy/h56deoAfOfnMFf5oHKVQOQNnE9ti04qeMGmexSFH7m7NFQzD4UAs0byKegGQZSQ1dSDI0a0fg/mSObWY8nHtkB+2HY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776693228;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=TSolDDpiDBp7rWjrXiBrHsvEmvUxxGJrGij6jJWU4VQ=;
	b=eAB4XvI29uF/Nc/BCc2+dtMZ2ztvb6s5frR5Jov1nHT7P1ruF8spmhitsxyEETCP
	A9qgzN9T03GRUTJNEy02EmtfT33qKjWFfsxLC8mHh6Rwi3kd4feGD3xLbsHNazceCs7
	zY4N4jFn/h6xbSpSByBvMFFckRBjDC06TfBnLdEg=
Received: by mx.zohomail.com with SMTPS id 1776693225862706.463009848236;
	Mon, 20 Apr 2026 06:53:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 20 Apr 2026 15:52:42 +0200
Subject: [PATCH v5 5/6] arm64: dts: rockchip: add PWM nodes to RK3576 SoC
 dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-rk3576-pwm-v5-5-ae7cfbbe5427@collabora.com>
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
In-Reply-To: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>, 
 Damon Ding <damon.ding@rock-chips.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>, 
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_065358_789768_FC1524D9 
X-CRM114-Status: UNSURE (   8.50  )
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
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 208 +++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index e12a2a0cfb89..55d6b103c329 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1032,6 +1032,32 @@ uart1: serial@27310000 {
 			status = "disabled";
 		};
 
+		pwm0_2ch_0: pwm@27330000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x27330000 0x0 0x1000>;
+			clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>,
+				 <&cru CLK_PMU1PWM_OSC>, <&cru CLK_PMU1PWM_RC>;
+			clock-names = "pwm", "pclk", "osc", "rc";
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm0m0_ch0>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm0_2ch_1: pwm@27331000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x27331000 0x0 0x1000>;
+			clocks = <&cru CLK_PMU1PWM>, <&cru PCLK_PMU1PWM>,
+				 <&cru CLK_PMU1PWM_OSC>, <&cru CLK_PMU1PWM_RC>;
+			clock-names = "pwm", "pclk", "osc", "rc";
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm0m0_ch1>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		pmu: power-management@27380000 {
 			compatible = "rockchip,rk3576-pmu", "syscon", "simple-mfd";
 			reg = <0x0 0x27380000 0x0 0x800>;
@@ -2630,6 +2656,188 @@ uart9: serial@2adc0000 {
 			status = "disabled";
 		};
 
+		pwm1_6ch_0: pwm@2add0000 {
+			compatible = "rockchip,rk3576-pwm";
+			reg = <0x0 0x2add0000 0x0 0x1000>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
+				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
+				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
+				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
+				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
+				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>,
+				 <&cru CLK_OSC_PWM1>, <&cru CLK_RC_PWM1>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
+				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
+				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
+				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
+				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
+				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
+				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
+				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
+			clocks = <&cru CLK_PWM2>, <&cru PCLK_PWM2>,
+				 <&cru CLK_OSC_PWM2>, <&cru CLK_RC_PWM2>;
+			clock-names = "pwm", "pclk", "osc", "rc";
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
2.53.0


