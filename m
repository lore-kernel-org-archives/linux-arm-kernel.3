Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F33C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9FeknYPclzv16XYXDkTzfHxoN/DCYzLCAYv6oC+ejo=; b=j07rBqXJrgyWFM27V6i7H7hv+O
	LXzZRAYO3azDn4BT9pB1EZzKSBec0p/G8AHej4ToE/PBvGAz9usaXIZi6e0tjngXguoBftde0x3ou
	PQ2T3xsMIG4xB5X33Ch/uGy7Px+12+Dm2zS3PFcC4q3yoep3qencs70kV06O9HS7WVVNuyJLgWShI
	T9NswkjEHca5f4kUNky/EeQOztYI5h2eGHBoVmCMsCwZRIwXHwf45NvnLDgYqNNOL/FyO+gCZryFF
	CX9Y8pNcbycAiPoJlMYuo0vtKRQYYEr+EYj+VnpU8ETbusozcqGmo48olQA6enNJhdLlDaIxBMKMW
	2Tmml26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1t-0000000GLbm-0bvf;
	Mon, 03 Aug 2026 05:16:01 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1k-0000000GLH1-3i9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:57 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-49ff971e903so2431861b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734151; x=1786338951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9FeknYPclzv16XYXDkTzfHxoN/DCYzLCAYv6oC+ejo=;
        b=AczR8RxuzpapfN0sqDrzdwDRC62mbl+CJC4DbFnzn5OUgIvgWJzBxNonwhIqpMiJN2
         bZfv++zJ9PGKZodJ+SMO+saLXpWkSr/kiMZLkr1NAMDmoRKA0oaZaJZ3o1F0SD4Dq9W+
         HtLSQ0HYHtwmF2EycJWCxJc/gcpDsxXNg3Cu2glsZpcGoICa5Ex3MW01zSSPUR0l+ETJ
         u3ZAxgnGtolnDqs3fR5+gyo/Yqe4gjQKbfFMm2GO1sNvjbQOVx5ZK9dujRfSsI3V+W7y
         CqUTK8L0Hz9lnf+3WBZOLQZgV7uexhpg3ZTuulCOeNZCJL8NusM4jfKMFsL+5yFEu8Lk
         jWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734151; x=1786338951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9FeknYPclzv16XYXDkTzfHxoN/DCYzLCAYv6oC+ejo=;
        b=bx5S2xgkeZssgqNimIu+/TxwAJuo0qgBfQAkhVYZwC8/VrGooJ1WTMjipsqSOYstoA
         30Wiq22mI4MbcZvUwf0/l21fwizZDd1HLjdIsb0wBY0NGa8ibtA8j+mPwyCF8nDKbozA
         Wj/Noau+TgojaTijsfGo/f3amlJ/R4B/Psab/BgPr8YrFMIP82GbyLfmzdSp1WC3y+Bo
         C3+jAYDiiiNCDmE0881hW5xp/t4sXiZtA+hi9jHZKr2sVewsvWlESTbFYYlGkFyqXMNO
         4TLYsONrgU/ZFpu0aC6OyoCc4eHvipNJ/xUhutQDiguemq2IxaZsgkHyfzdlOwgrMv0g
         Fpwg==
X-Forwarded-Encrypted: i=1; AHgh+RoK1zKQTScWCKSCKEi5sKqaxEu4tFvAniarmv1KM0tKyi7K2S4Se2LYT4CZoj3W2Bgpfy9FejCdD3hC4SjNZf1n@lists.infradead.org
X-Gm-Message-State: AOJu0YzgE1BGrM3NVU6FYrFOohAp7cPQhoOFPCfyf7rm8wDMTxfGSBus
	s38kDPMpyWK3hLf3a9JH4ggzf2Jb7iY9Z/C9R0FApjO3qTz7RcED6BNrlkWsvDOZ
X-Gm-Gg: AR+sD11KbyBoW0A5j5RYvlebJqq8dIfFgte3Emo3Th8JLD3zZlrACgW0yvJ+X+R5xSI
	zRlBLLAF9K4QCoeBwPAh9cqh1Ba7QB1kOjZFJb7vz7IMkn4yMM3/rAkGU+u8o5nVqRcvp2igsFw
	VUBeDyg0tjeIUzmKfO4BBCaZ7yT8vaygDbCVvFJvvCf/G/X2R/1137RlXQinW9v5cs28JloGxmu
	XE+87mZioBwpAb7av3dUXXuNxC3UWBEBEJEHTucbspHnlrIbFZ95eBtJ2trJC1H5/0QYcgAqBKz
	b6hc/Aew62jUqb3Z405qx/PbG5CiQ0qtvfmOJa+YeibAorFxVOIdS0AKDR8o+97HKYsCR8IZjrP
	aZKcd/1U891EizNZ/jMhe9wRQhuXALpKupqan9QhQ07HJY6g/MB9q6wrXMi0I3njNkgf0Gop5jn
	U6TzAbf0kHOS8PIeNay24wTiv7+iqjMZeIqAZUVJU18vehjh92aVaVZdMhxDX+TPcDljhT2+hz7
	lIJyi7ksD39bMEtaQzWQfJDo/Q9hI3vS2ahgr20KOvloUPSAcn4mRDl3wHuch8JFmykpmMQhA/t
	uaegXyGXfe9uV/+DUtI33gll7z39JEkOoQ39x5NnFd9A23IKxG00BIDhmqJDIOPgzX4zoxfWmNG
	qN6tPWBAbGAZdosSJ
X-Received: by 2002:a05:6808:1797:b0:495:f697:92d9 with SMTP id 5614622812f47-4ae3188b02dmr15246163b6e.7.1785734151556;
        Sun, 02 Aug 2026 22:15:51 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:29 -0600
Subject: [PATCH 19/21] arm64: dts: allwinner: h6: add AC200 EPHY resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-19-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221552_972856_94C17CFA 
X-CRM114-Status: GOOD (  12.75  )
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

Add the H6 I2C3 controller and pinmux, the PWM-derived 24 MHz AC200
clock, SID calibration cells, RMII pinmux, and the AC200 MFD and EPHY
control nodes.

Describe the co-packaged AC200 INTB output on PB20. Keep both reusable
AC200 nodes disabled so boards must explicitly enable the parent and its
EPHY control function when the companion is present.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 72ce1a75647b..55e6e185a4e5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -17,6 +17,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	ac200_pwm_clk: ac200-clock {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		pwms = <&pwm 1 42 0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -314,6 +324,15 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x4>;
 			};
+
+			ephy_calibration: ethernet-phy-calibration@2c,0 {
+				reg = <0x2c 1>;
+				bits = <0 4>;
+			};
+
+			ac200_bandgap: bandgap@30 {
+				reg = <0x30 2>;
+			};
 		};
 
 		timer@3009000 {
@@ -368,6 +387,13 @@ ext_rgmii_pins: rgmii-pins {
 				drive-strength = <40>;
 			};
 
+			ext_rmii_pins: rmii-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+				       "PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			hdmi_pins: hdmi-pins {
 				pins = "PH8", "PH9", "PH10";
 				function = "hdmi";
@@ -388,6 +414,12 @@ i2c2_pins: i2c2-pins {
 				function = "i2c2";
 			};
 
+			i2c3_pins: i2c3-pins {
+				pins = "PB17", "PB18";
+				function = "i2c3";
+				bias-pull-up;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -414,6 +446,11 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			pwm1_pin: pwm1-pin {
+				pins = "PB19";
+				function = "pwm1";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC3";
@@ -626,6 +663,42 @@ i2c2: i2c@5002800 {
 			#size-cells = <0>;
 		};
 
+		i2c3: i2c@5002c00 {
+			compatible = "allwinner,sun50i-h6-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x05002c00 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pins>;
+			clock-frequency = <400000>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ac200: mixed-signal@10 {
+				compatible = "x-powers,ac200";
+				reg = <0x10>;
+				clocks = <&ac200_pwm_clk>;
+				interrupt-parent = <&pio>;
+				interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				nvmem-cells = <&ac200_bandgap>;
+				nvmem-cell-names = "bandgap";
+				status = "disabled";
+
+				ac200_ephy_ctl: ethernet-phy-control {
+					compatible = "x-powers,ac200-ephy-ctl";
+					nvmem-cells = <&ephy_calibration>;
+					nvmem-cell-names = "calibration";
+					phy-mode = "rmii";
+					status = "disabled";
+				};
+			};
+		};
+
 		spi0: spi@5010000 {
 			compatible = "allwinner,sun50i-h6-spi",
 				     "allwinner,sun8i-h3-spi";

-- 
2.53.0


