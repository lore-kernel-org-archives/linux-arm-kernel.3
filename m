Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA95DCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4kvXPXjJrJfC4xPYDD6GGUwfPJQ0tfGxICatFpEaO4=; b=4Jk0Eb1YDyqCWLRLgDiE9amHN1
	EKUm30d8V6E5QAEWHsAOEZ8Oz4TzgZsiKLXgKx4cOiJrHWUhDTH4fWPBrkzI/UafcbOWj73zpgTd2
	sjjlnnN8EOBSiRcCUY2J+QzaTySGXkQmfUCG7uWx/K14V8cUZHGgW4uCgBy6uqrgUueFPMevjxMQd
	cb5IyN8yfg64fGRot4AqmLNl+s4khD4AFVsnEvTbGjvC9W+dbpc258sJ3qX49h8cCb8gIA/GuYLXo
	YjTaGr8invPaPWsWVf6sb69V+5EKT7ObpGTLdac6mSCVlwPxKWz3vXKDuKmVJ4lptC22SIPFHVBIL
	0OqekTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfD5-00000002crF-2CSX;
	Fri, 16 Oct 2026 10:30:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfD3-00000002cot-1sel
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=D4kvXPXjJrJfC4xPYDD6GGUwfPJQ0tfGxICatFpEaO4=; b=SR+xbbvY5sjfMUGJOB2bfZ1AhY
	yC7nD+oL3RvvzTMg0t3havPTJNHacFmZNhjh9vg3CUTA4onEs2SkRR+OG2Z6OT7hw7e3bne0yWh3f
	1yFzHI/vy/QWpUSGCXOCTKkswFFFitTnaZc8j7cwt79cdBt/BYZp95O2Djg+mjfLI9tlu4oUZnW3m
	EyKc1ZwIMGzYRBgU/mMku5Q+K8/IIxICxsb0DTnRS+ECX8XOkYUtYwtzoKa0Zz4312Dm1jtd/jH4q
	pNXl9AwPxRo3RNEv8DkdMYihMp76pspAuit+1/B/2Qtw0IPMoWXQu/eiJZMdies2o+IMr/i0YkX/o
	2qlTiXHA==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfD0-00000002s9O-2y7k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:30:44 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c4086e892a4so76973966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146641; x=1792751441; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4kvXPXjJrJfC4xPYDD6GGUwfPJQ0tfGxICatFpEaO4=;
        b=SqVzl6iysCVc/nPmEQBrzMsKqKGDbTkJkYZ48SI9EYfjuDWqLBU4vQPY6C1T3Rzebb
         RKsmKRa8cyEZ1t2k6zRyq9JfygLvG4YYzDTPkJnixwYarRykduoLgR2LM+lq5Lnd9zer
         dXQb/ksOfxw3joQHLoZb0tveTOgFiX/5+yn9j1/YI40h7qoT/hmMT8L+b98hl+fK6VR2
         /8yN6yXmFLBQZIUobs12snA4hWIDT/8HLG6/j8ubjW3QvJqEMI/KB1G+fJSV0B45ctRn
         OQuJtxf85UtE4Smq3LOlP6P2zCpchcBvvK7E80C8pmpZZoQv/zb4TpwincgIlqkqFcEy
         QJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146641; x=1792751441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4kvXPXjJrJfC4xPYDD6GGUwfPJQ0tfGxICatFpEaO4=;
        b=XXyN9vcPSv1Huj5IxwzwYYF7Dt5zJqB5wZT7qBLsNFeV1HCj05dnVdziHyKMACqhXd
         mVm48lAtQnL3PUwnw6GtKcqwBy3BnfD6Byq2OXS51FreSDEBOK4zRxkWi7suver5znbP
         Ww9gcIVNGKdCtTIVfLYU4Ub5J6YIAT8tc2fBKpgRepLru56TRZOQ8vpF7jscyCt+0LzK
         tTM6nptD6YVOVxFQ0BoI2aYRqLd/1XMNuyZGH0EO+YV5Vx3lGF62G70CLygmETuPtMK/
         vFG26ccUh+qMDCycowR70Ptz3KRRuzB2Xe1RzGEWl6cOidCZfu8CB+x3sMXuIGDLEpwG
         S8mg==
X-Forwarded-Encrypted: i=1; AKwUvBzexZUykZ/6CyKr0elfJBOo8XN5xMgdN2HS7ZwGuC9YS4LGnnlh06MzPGH9h+dD/7n6aj8kTAyNwuZNIlsltY5m@lists.infradead.org
X-Gm-Message-State: AFq9FYKz9RQ+JCbCvSWmEexPFXhZ8tCPHMdHXDXObZUOmEx06kcESqdY
	4OQ4R55RQm7eMZFNHZdCDzYnCrLSIq47K3+ScIi2WIux5v8GzX2ATf/o
X-Gm-Gg: AYBFou3XLMYwdKsa6Ng3YJOtb4mc2RmZesxlTaNe6e6N2Nno8tfrQ4VxdkVhVJBcjD2
	1Mc7+9Sr59q6b6OvQchcw+HD3jZR5dJKyUHY0VunFpJGBI2Vse3IU2zK1FZspWc8rPDwrTENopu
	ejNLVZzBtwgkWBfmACN/kQoii5g1dBLALFo9CoOsO8Qo7N0d46d2F/5EGBRRktLu3BPZzrJNWME
	u2tLwzn4dKN9+2l9opQsbRhsbEC3KcoQgRYpsDeQ97oqs1xsX4eSXt4TilZ4Tzc1ADQNjLrhADR
	cpRclkCskJvpUt20nbh8RlWHzYCpWvj4ZwY57Z9HwY4HN8lHOMDEwLHKvxVKIfatkQVejMP3xkI
	xyWBS3Y/2fPIL8FkVvPdmdho/qTBYfj0iXBuQOXhpTJLrcJwAJLNLIaUZWlBTupMA1xqexPunRK
	hN3newVHHtnLoy8CPiAWu2k/2f3rpezCrV4a+7P9wP2TDU2VSZeIDyEihz0sLDkbujjD1lr7yRf
	sFdNr1n79i8QoF/KcSWVAQ=
X-Received: by 2002:a17:907:9447:b0:c2e:3307:b922 with SMTP id a640c23a62f3a-c31a9d569c2mr2129552866b.28.1792146640682;
        Fri, 16 Oct 2026 03:30:40 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm60613866b.31.2026.10.16.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:40 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Fri, 16 Oct 2026 15:29:35 +0500
Subject: [PATCH v2 3/5] arm64: dts: rockchip: add Forlinx FET3568-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ok3568-c-v2-3-068d68430e6d@gmail.com>
References: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
In-Reply-To: <20261016-ok3568-c-v2-0-068d68430e6d@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146625; l=8183;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=kwtI6S0QcRAZXZc30UUXQRskuC6D+uY+/6wBkU3Qvlg=;
 b=zkfvidfL5rXEbncJqNbiJeQyb5t7dP+GK+P/CzyBWAqqWW7JrGKk1TcR3URE0p5ywGEgbA92D
 0Y20db2TkOHA4hECk5/TIhJ1Ai9EPcxfui+hTjOYjeFhwVkMSdWT/nX
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113042_818795_82DCD042 
X-CRM114-Status: GOOD (  12.64  )
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

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree for Forlinx FET3568-C SoM.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 332 +++++++++++++++++++++
 1 file changed, 332 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
new file mode 100644
index 000000000000..9a3e810c46b5
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
@@ -0,0 +1,332 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3568.dtsi"
+
+/ {
+	compatible = "forlinx,fet3568-c", "rockchip,rk3568";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio0 RK_PB7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			pinctrl-names = "default";
+			pinctrl-0 = <&led0_pin>;
+		};
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	vdd_cpu: regulator@1c {
+		compatible = "tcs,tcs4525";
+		reg = <0x1c>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1150000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	rk809: pmic@20 {
+		compatible = "rockchip,rk809";
+		reg = <0x20>;
+		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
+		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
+		#clock-cells = <1>;
+		clocks = <&cru I2S1_MCLKOUT_TX>;
+		clock-names = "mclk";
+		clock-output-names = "rk809-clkout1", "rk809-clkout2";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int>, <&i2s1m0_mclk>;
+		#sound-dai-cells = <0>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc3v3>;
+		vcc2-supply = <&vcc3v3>;
+		vcc3-supply = <&vcc3v3>;
+		vcc4-supply = <&vcc3v3>;
+		vcc5-supply = <&vcc3v3>;
+		vcc6-supply = <&vcc3v3>;
+		vcc7-supply = <&vcc3v3>;
+		vcc8-supply = <&vcc3v3>;
+		vcc9-supply = <&vcc3v3>;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-name = "vdd_logic";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_gpu: DCDC_REG2 {
+				regulator-name = "vdd_gpu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vdd_npu: DCDC_REG4 {
+				regulator-name = "vdd_npu";
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8: DCDC_REG5 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_image: LDO_REG1 {
+				regulator-name = "vdda0v9_image";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v9: LDO_REG2 {
+				regulator-name = "vdda_0v9";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda0v9_pmu: LDO_REG3 {
+				regulator-name = "vdda0v9_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vccio_acodec: LDO_REG4 {
+				regulator-name = "vccio_acodec";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-name = "vccio_sd";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_pmu: LDO_REG6 {
+				regulator-name = "vcc3v3_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcca_1v8: LDO_REG7 {
+				regulator-name = "vcca_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca1v8_pmu: LDO_REG8 {
+				regulator-name = "vcca1v8_pmu";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca1v8_image: LDO_REG9 {
+				regulator-name = "vcca1v8_image";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3: SWITCH_REG1 {
+				regulator-name = "vcc_3v3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc3v3_sd: SWITCH_REG2 {
+				regulator-name = "vcc3v3_sd";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	leds {
+		led0_pin: led0-pin {
+			rockchip,pins = <0 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int: pmic-int {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&sdhci {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	mmc-hs200-1_8v;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&tsadc {
+	rockchip,hw-tshut-mode = <0>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};

-- 
2.56.0


