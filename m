Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A01BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 04:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGpVSnY2YGnC6StYjZi+g05NBMCnFA0794RPi3L6J+s=; b=xg9kcyKOPNHRWarGgLja6knVC2
	3zS8zItcGuJIr6ytOwIuqmKilyHMaYDV/Eo6oMUBPbENKGAukQqDL+ubmAw1cTcU68TKv5C4BFqWE
	Rq4JTQpMAQAmounJ7qKDD7lSVBcYaA80yN4Vtwi15nkx6csE+I4TOXywsQIEQK+yn8Bh5D/73DGBf
	5sJr/aRTxQuZi59TXCttlx3udwC6FUQT+SL61q/pEG47LGdHCtP0X4KUOJ0bIRwUnZNztg6JsqJy+
	9oVankVuHznbhvcxmcbLHvkikl58mdBp1L1MCiA4k87/UwR8cOVygSxoPmdLFZNFdV1xlN+RqSALr
	HwUU6WvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVy5-0000000Awxm-1vMy;
	Sat, 25 Oct 2025 04:33:29 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVy2-0000000Aww5-1XdE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 04:33:27 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-378d54f657fso33856981fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 21:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366804; x=1761971604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGpVSnY2YGnC6StYjZi+g05NBMCnFA0794RPi3L6J+s=;
        b=BAlM6Thd74x4FhMCaiE3NPzCDvv6cyLe+jmiqHakrwW+XbrVWecPAuhimiGLsgPTQ+
         t2fSUW4nO5I3dilAHQtzcSeQi/5hQVkBYv+rWUyegfxWXRYrYTqj2xl5xhi8PnjwEweH
         5DETXK85gvFtSd3PLiuakabGBmMQhhFUs0tALFSHaP/9hl+IhmfRiXcjZmiytj7PIst8
         x3QTvFmBJVaCRsniB7l0tySkV2VxoAA8cICb5gGB9v+e9YYr97w/t1ZNFqUpwoBZy9Z/
         EolWyA0qAG3jVuEVL0MjD1sooUOoVssfKLkArl06PtrwAY5YG8LcdJisH1dSOxz1t6wV
         u1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366804; x=1761971604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGpVSnY2YGnC6StYjZi+g05NBMCnFA0794RPi3L6J+s=;
        b=Njr0sF3Th1mB0Jv5dwIILlqfQ8rsH+sWPzen/OBkShM18n0ChuyFL85w1nGJmRhi3K
         vBnzevGSuTIWGA4S6Qz6SDNgu1Z1bl+6qpPNZJMtsqPHwl0PR+3h8TFZdKxj4ob688nG
         Nx71dd/W/RTkhEuqgyuSL1o0a5GVkyWk+OLj6em179xE2B0NzQIwhPa2bW/plZduwNfo
         bxXZgg7lbVpMx5/NTq9Z1tweNNNsdj+wx3d3aSRvWUfkafxTwthaYSciIjUa+tBZCrss
         wDOtihHBbTIwSXd7TrWyVd73HJVcBGW3Zt5yX/APCiRCULR4xP6lKCbYs6qnmFRV9+Xl
         71bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkSuPNvuRwZvz7ZASZ76093WHDtMLNm/rR0IIjwfFkx2k30kipFhwqwSX7/VN1b0+xQf0bWbn1CJZ/b1DE+tui@lists.infradead.org
X-Gm-Message-State: AOJu0YxFjZxQWRBWKS5twfBKnlmpcIkCyNwf4+SktOQxH8D3OOMJEIQE
	RRadW25l5HxAN24bByDsOdhqYfzLn/Qc6sRK9Dbc7Hvq1jG69nS/9Nuv
X-Gm-Gg: ASbGnctnATIaEjZGY1zmw6vtsu2+vSMgFIM1derrvox6V6ZaMjR36+20WJ4kpDl/JbN
	Hh5vQLVr7GKoKFwSThu0by03t7Amb6aDyv8zyiA8085O9Gn+OqoBSVTDiMHG6BMUXs8AiNT+TMX
	Lg3n9JXg9mMnOqBe5pbMKokAfV4NGREZJ48EsTUxcCUJ70cKhIIe8V3tvVycpc80URNO6FMP6l4
	BkGPCuMohjDS4ZpP6BJQ1gMJeBkuk/w5LMsUPL+7Y4Aa9u3kRIJluKOPUyAqIcLUgnblfrnpAUn
	XC6Mm3nOMVLxLwBKYdHy67bJVhphGms39TGsJCljEWp+n75l6yaRawKszs1+kaS4Ih9bbeEVq6K
	GtiNylXzuAJAqWKkqQA+O1cyck+Vf2JdCNB936URo+KQ2nB27Yq5gPxBFB1m77OV8w+DqbK+vml
	Hy
X-Google-Smtp-Source: AGHT+IGj8aCrZj29Rg9HWwRsU0X1CDkriVFw8huU9nZ548l08naKsaur1apTfOMiV+X0MeyojMrrVA==
X-Received: by 2002:a2e:b8cc:0:b0:36a:925e:cf3c with SMTP id 38308e7fff4ca-37797a39146mr98679831fa.31.1761366803946;
        Fri, 24 Oct 2025 21:33:23 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:33:23 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Sat, 25 Oct 2025 12:31:29 +0800
Message-ID: <20251025043129.160454-7-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_213326_449478_EFD1EBFE 
X-CRM114-Status: GOOD (  13.18  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM.

THS1 does have 3 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu

Add the thermal sensor configuration and the thermal zones.
Trips temperature, polling-delay and sustainable-power parameters are
derived from the manufacturer's BSP.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 7b36c47a3..0cbe73601 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -26,6 +27,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0x000>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@100 {
@@ -33,6 +35,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -40,6 +43,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -47,6 +51,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			reg = <0x300>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -54,6 +59,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			reg = <0x400>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -61,6 +67,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			reg = <0x500>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@600 {
@@ -68,6 +75,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			reg = <0x600>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@700 {
@@ -75,6 +83,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			reg = <0x700>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -398,12 +407,46 @@ syscon: syscon@3000000 {
 			ranges;
 		};
 
+		ths1: thermal-sensor@2009400 {
+			compatible = "allwinner,sun55i-a523-ths1";
+			reg = <0x02009400 0x400>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+			clock-names = "bus", "gpadc";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+			nvmem-cell-names = "calibration",
+				     "calibration-second-part";
+			#thermal-sensor-cells = <1>;
+		};
+
+		ths0: thermal-sensor@200a000 {
+			compatible = "allwinner,sun55i-a523-ths0";
+			reg = <0x0200a000 0x400>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC0>;
+			clock-names = "bus", "gpadc";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+			nvmem-cell-names = "calibration",
+				     "calibration-second-part";
+			#thermal-sensor-cells = <0>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
 			reg = <0x03006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration0: ths-calibration0@38 {
+				reg = <0x38 0x8>;
+			};
+
+			ths_calibration1: ths-calibration1@44 {
+				reg = <0x44 0x8>;
+			};
 		};
 
 		gic: interrupt-controller@3400000 {
@@ -732,4 +775,115 @@ npu: npu@7122000 {
 			power-domains = <&ppu PD_NPU>;
 		};
 	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 1>;
+			sustainable-power = <1200>;
+
+			trips {
+				cpu0_threshold: cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu0_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu0_critical: cpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_target>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu4_thermal: cpu4-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 0>;
+			sustainable-power = <1600>;
+
+			trips {
+				cpu4_threshold: cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu4_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				cpu4_critical: cpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_target>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 2>;
+			sustainable-power = <2400>;
+
+			gpu-trips {
+				gpu_temp_threshold: gpu-trip-0 {
+					temperature = <60000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				gpu_temp_target: gpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+				gpu_temp_critical: gpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+
+		ddr-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths0>;
+
+			trips {
+				ddr_temp_critical: ddr-trip-0 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+	};
 };
-- 
2.51.0


