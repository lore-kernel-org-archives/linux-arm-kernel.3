Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07962C5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kn221FDOcVW/vtJXVqj4m4sWcXwUTAwENBaWLbgbIbw=; b=CSeWowS3S1aJVwO4F3rHQNAro3
	rBYupu8lkZvKl7pRMDPhuQl3xGqbNu/dTTUO6TuWZZy1/LkNHvjYFiX+PmMSFpmi20RUNjW4Vy6j+
	1Hr6ps1KAktUG5E58my3D+mNPeseka3jxiETafx/3MTvv1iGfKLLfya2pUAUqeczcLcEWEAYxwTfr
	FB2HfltCHOuYOipO7LyvBPo0FQtGY7w4FlFw+Fxrv/vmgl4szcMXTqmdD5Yq2RR7V66v8lhRqEIuV
	NSVe/jRsmnIp+goFin7C1BTXkZpe5EcYjYd82Mf/OFRQCjYeJDgaXi4qPnQ9fzdzrU4m2ZYo85HCF
	0NK4sVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOw6-0000000BkMj-3KOy;
	Mon, 10 Aug 2026 12:16:58 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOvp-0000000Bjl7-0x1r;
	Mon, 10 Aug 2026 12:16:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 820D4C0514;
	Mon, 10 Aug 2026 15:16:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364198; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kn221FDOcVW/vtJXVqj4m4sWcXwUTAwENBaWLbgbIbw=;
	b=a7PyVENFaH2HN71sVwO4XD1+ej1znLtCwGJIJojakVvCll3nvzOQzFGw5XPyzUocE1G7xS
	Vsa3FywK6Nfc4Ojh++/FUkWzRnwRKY4ttmOsSaG3DL+ngJkBJLLDXrRXh5kl8pBo1H8uhn
	5NsTevWZACBzA5RuT+8KxWA39nqTiClOdJDeTpd7qG+3nhZlBHHBMewjWq+l+5xNXO52IH
	EqT+AedNJO+ouxeVF01tIBSwyW+f6yCmx6auSqkjz2ZFTc2op7zoFIXjrkq+nlrlyJ+ccs
	NW4xVQ9sV3kP8BO3bQ0+A82cz8aU6HGCkG9cFc8ondVy/seoAQ+qbSi+EZhCqQ==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 25/25] ARM: dts: rockchip: Add PWM nodes for RV1106
Date: Mon, 10 Aug 2026 15:11:16 +0300
Message-ID: <20260810121121.210040-26-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_051643_291010_82FF7B09 
X-CRM114-Status: UNSURE (   9.12  )
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

Add the 12 PWM controller nodes (pwm0-pwm11) for RV1106, along with
their aliases.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>

---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 159 +++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 12e87d25c72b..d7959158f8a0 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -30,6 +30,18 @@ aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
+		pwm0 = &pwm0;
+		pwm1 = &pwm1;
+		pwm2 = &pwm2;
+		pwm3 = &pwm3;
+		pwm4 = &pwm4;
+		pwm5 = &pwm5;
+		pwm6 = &pwm6;
+		pwm7 = &pwm7;
+		pwm8 = &pwm8;
+		pwm9 = &pwm9;
+		pwm10 = &pwm10;
+		pwm11 = &pwm11;
 		spi0 = &spi0;
 		spi1 = &spi1;
 	};
@@ -189,6 +201,104 @@ i2c1: i2c@ff320000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@ff350000 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff350000 0x10>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm0m0_pins>;
+			clocks = <&cru CLK_PWM0_PERI>, <&cru PCLK_PWM0_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm1: pwm@ff350010 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff350010 0x10>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1m0_pins>;
+			clocks = <&cru CLK_PWM0_PERI>, <&cru PCLK_PWM0_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm2: pwm@ff350020 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff350020 0x10>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_pins>;
+			clocks = <&cru CLK_PWM0_PERI>, <&cru PCLK_PWM0_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm3: pwm@ff350030 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff350030 0x10>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm3m0_pins>;
+			clocks = <&cru CLK_PWM0_PERI>, <&cru PCLK_PWM0_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm4: pwm@ff360000 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff360000 0x10>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm4m0_pins>;
+			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm5: pwm@ff360010 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff360010 0x10>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm5m0_pins>;
+			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm6: pwm@ff360020 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff360020 0x10>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm6m0_pins>;
+			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm7: pwm@ff360030 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff360030 0x10>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm7m0_pins>;
+			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
 		gpio0_ioc: syscon@ff388000 {
 			compatible = "rockchip,rv1106-gpio0-ioc", "syscon";
 			reg = <0xff388000 0x8000>;
@@ -304,6 +414,55 @@ i2c4: i2c@ff470000 {
 			status = "disabled";
 		};
 
+		pwm8: pwm@ff490000 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff490000 0x10>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm8m0_pins>;
+			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm9: pwm@ff490010 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff490010 0x10>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm9m0_pins>;
+			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm10: pwm@ff490020 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff490020 0x10>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm10m0_pins>;
+			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm11: pwm@ff490030 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff490030 0x10>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm11m0_pins>;
+			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
 		uart0: serial@ff4a0000 {
 			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
 			reg = <0xff4a0000 0x100>;
-- 
2.47.3


