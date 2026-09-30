Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A4CA5FC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/zKnHAGq9to/WIL7jxhxruK6tjAHMHjB3oW6qJJ/zM=; b=kUO2K3mdfVuwYV5HLGJXRY4Rhm
	K9aIkgBZDjxlCgZJIGZMyOSSbPn4vvTwi0xjPBVu6iMSWV8JA4RWsYVPxSm+F/bSSsem+XUpSkAhf
	moAYFhZrVFMfYK1XQV4Z0YVppP+A2HFdZWGnP5IEw7j+SXME4WV6+KZDpax4XZAIosYx3QVFpEwpp
	CLuH2LLKygkEnA2V6xNckYCeaY5mWomeKOEp0sjWg6a7gn2PpRnEpWCXGbC9SEpRsR85X9lI3DEod
	sXTYMNTHXezM9xl+b0cYVa/S9dBXl3/YvCcnPVdt2LLJ18KgHMQddI6w7iGA786a9S47SDYMf5uz+
	QuAo2X9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqeG-00000005ZRB-3Wvn;
	Wed, 30 Sep 2026 09:30:48 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqe8-00000005ZND-1xqj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:30:41 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acb88abebdso1983344a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760639; x=1791365439; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/zKnHAGq9to/WIL7jxhxruK6tjAHMHjB3oW6qJJ/zM=;
        b=AGswNR/BzAlnb+vldwH8KIa/qqpS7w1MSVKBwLCoyaAgVybDRAaD9fOWJ25OOmVMBq
         MuA2T6FicIWHmskKnjJWFuBr/VX0nQcDZc1skqk0ns4w7on1ifv49NRx6WNsU38jNuhr
         cnTuKOeSrOZ0+jGghBDXWn6GcDkyZ43UZZrXCwXrDQT7SglyTUOBCsN8Hzwfc14f3y9x
         dxPDbosb+eb5mgwcFfJTt4+Y0bSr3gS29CLwvXui5qGX0Lei2G8D0QSQUlcNRsT8qCvn
         uWoPkrTvr/bGUgbHH8dVEZiOMseK1jzTQSfrCU6wByBSutSwkQLXey//ZF/vo87PRXvl
         pqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760639; x=1791365439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/zKnHAGq9to/WIL7jxhxruK6tjAHMHjB3oW6qJJ/zM=;
        b=x3TLYU34wfpALDAA/yFKJcGi6MCDXuQt5gpIWULI08Ar1xS2GSh/n9AmQPRw3MlJHq
         IV1SWh8qGg7Cy9M0oh7aRGLT3/1K+GT4LYI3M4dhhE4bc2qVCUOEGKc7kxA5A8mQ6FcP
         fZ46jJijhQcjANKJ6kl7sjEP1sZGBfOL7eDxZLCocJMcGd+/Z7qHhjuDwdkRFrTqDrN1
         /3fjMLI4joHGaDdP25/TSHToA3iCyZssP2DUuE9ZAAhKJgde4pveopxZtxka26YEn2Ux
         05QBBybx/eAMkTUCekfLxOm5MqFj4JZc7PixqWbGOhnSI6DvK7pUv/zOzhlVt6qk9ajr
         1Dzg==
X-Forwarded-Encrypted: i=1; AKwUvByJteDUtKMPwamGCXARejdqjL77fy2UFDcfzyp+fHgMs3UwgVSYvV00zSIG29rysG5IavTwQzCoUabGYtQ4mubi@lists.infradead.org
X-Gm-Message-State: AFq9FYI3ynvPZoVsJT5YOFPCV9K+FnCDc4tNz/I6FACc60dA3qm4z4qB
	PcjCsFFOLopxH2XDpBUrucUQfZV+D1PMHnHHRJLuvATTXt+AN7jD9tb3
X-Gm-Gg: AYBFou2l1KFZDNDqzLu75DDy7mCjK4aOia3qEE3cqcqsORX8yURDyaSqVMPe2RdaZdC
	HXXhkhhiSkT1Jf1swucrDdPq5smIyvJAsO7t7yf2WxmHc8paxmPla5/8kESWByVtyLmbIEFbDGK
	oVpizsCqcLPtbkfBqBV2nqfddIoYULCu2xyK4+EAuCPLeyExug5CV/4sCOgsDkEswiHQA3sI3s6
	YuWZauoIyuX40oVH3zZQD7fSxVLfFj9wq8MuMWwb3a1oggHMReFlB2xt6FbMVDuR0mdVB2+xP0J
	oMUiJLN8OUo5oNqQIgAOJlDQl0DOa2zwQ1oKcvARvqYkIZ6BsebxQu8zi+sKfBqeg5rXFcE7JcZ
	KaU2luR1y22fnI6ln7H5ldfrGOAn7vbMDxGgzFLK6CsdBPO4E70B2KndVVFiYJ47Bm5J9WF4ynF
	87QrlwvRUJMH4G7yAde5Vl8BX7m4omAT+U4XBNxQ7xd2DXNNLymPtfztWX4HaipJJACurCFScEx
	8vB6N4j//4=
X-Received: by 2002:a05:6402:4543:b0:6aa:edb3:d687 with SMTP id 4fb4d7f45d1cf-6ae1992b728mr420886a12.15.1790760638648;
        Wed, 30 Sep 2026 02:30:38 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:38 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Wed, 30 Sep 2026 14:29:05 +0500
Subject: [PATCH 2/4] arm64: dts: rockchip: add Forlinx FET3568-C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ok3568-c-v1-2-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
In-Reply-To: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=8144;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=F8OyEDMJn14NpnonHbCfxlALMJEt5YhSqKsUWGkcr2Y=;
 b=1bWzAjEazfw+ZhFx+3PJN04vFd4tgaGy74s+JlHhJmJNE1mJHDhe/pt1jBcXCSbzQ86Y7WxK/
 f3/hVwp2XFvB83UWRHHPLMoWggQECI7N03veL/SpFBWthYFCnsgu/9i
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_023040_564041_8A227E97 
X-CRM114-Status: GOOD (  13.25  )
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
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 331 +++++++++++++++++++++
 1 file changed, 331 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
new file mode 100644
index 000000000000..258e7591063f
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
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
2.55.0


