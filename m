Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1738AC88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ojm3inVGHkUK0yBRj0L32h8BiK2OtTXiQ8B+T74NBtE=; b=QHvwWXyP2N5HjtLl/MIsb8tER9
	RWOyZIR0eRthXtetfWSfwIsnsJX30gR4ynJT49qkeDvhFXTlRYQGZsfpflZHs/ejYhj4ElijWKCV9
	m7sbSzQ/bpjMMp9dLcmnWcq7o8oL4NaXeOBdF7kZd8fcwEtFTm3i33Phg/uHDxjCgn8Shih5CY9ix
	R7/mBaLVmQq0yIRJOv5Ni2UtKFzxsRwrY12/rEBOP4+xPZXbKnfseUIq7PM0fyTqNFmfFBZO2coso
	to9UJLFfTc2JOp1YaziYZCyZmtmjmHubAQJkmj58XdRzPpHPlM4vARbYEyv0d2FhSJjbm+Z/59KrA
	anXPu+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ldm-00000001k5A-1LuB;
	Sun, 13 Sep 2026 14:57:10 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ldj-00000001k42-07AK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:57:08 +0000
Received: by mail-pz2-x0f.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso797616a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311426; x=1789916226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ojm3inVGHkUK0yBRj0L32h8BiK2OtTXiQ8B+T74NBtE=;
        b=av3+H89ZLkXjR0jb0EtcUf7PSZ5fSoV47+dVfr3PCpeZ4EODQZPd8CmEkjvzNzT3Op
         1pMdDCbzO588cz7H/tH4fE2jSkfHrcJKgzI7B99OtDGe4k2NufGBO0TcZUiSCU9YtRHl
         Z3JQIz3PGmxuXdYX+g1UTxxLGo+noRdJHc+Rf0Hh5aUIipezP1Zm29D22xs3DEZVc9IK
         sdbiZnI/QN0w6EgXHnjERYNjVvncYMTRqi2w5ZbJ8R4FRvEHuMy0XTp8HNuxbrQvskwU
         aJK8oGwEk7KpP0gqwBdMaafXa4q0tmO391A69JGpurCPfeA4EAuqhQ7CM5iS9Aq/RNro
         Psjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311426; x=1789916226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ojm3inVGHkUK0yBRj0L32h8BiK2OtTXiQ8B+T74NBtE=;
        b=a2GoVuBfPbxlDu1RyzRR8gqpBKiAQCRJAh97xlV9QgtoaBUwf6iPfaE2OwnV2VRXaF
         AlJcU4OMDJ96WkJuZRYKyCz+/NxiU+8a6yrK/12bExEdXZZfZrJhBxTieSOTcNK+t/Fe
         dtNKcBSvhQ7Ht5t52UELRxSd7n0AULuY0SU6DaZFM1PF5V3rs49OCLUU8PrJGLVCPaHj
         momRSSjewhW9nLH/oPjzQNwQKczRbnpvQVXbsZOjiqnbrTqqxu4R4JKhOncefZHCo8O8
         nt9SNhvx/OsmgNlS6QhJr2w8Pf0WxHwYH0Yz4CQHwJBgPGAlR00KQB7GSUD30PvDENQv
         yBCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7V7inTdL25d3loCyTt2cmRJoHo6RDS2lvN0gUzZp/JTRHZReAxeCPRpDnz47cYAWZYjlTu4FuoE/WaVk0C8EL@lists.infradead.org
X-Gm-Message-State: AFuF++lON3mHjDFRa9u/fpty7A06TdadqcNd8hPBw0Ktz+L4fPuhbhA1
	8du9zD6qP5FTgm+XyAGyEXvIoMPKD8j5R9kBreldMiIxdv+lS5ktq9LG
X-Gm-Gg: AYBFou2i2zI3nx8gpqhfuKUkulkp70eeb3Iol3lOrlB0IBplwBw707uIHrsKxIZqgP1
	r2LpuErjfRE1hjn8D1V3WbsbJRu9mEX1FP01Ec2hNJdtDJF6gbTAT252vfMnIT9ZgRyTtgad/BV
	DY8IbRxYo/vKS1fSmwY/hrqafizFfz7MFgZj42vIHch1M7ddZ39gv3Gi3UQqdzhiRn22WkVWpi1
	JqFlhrz4yfhEmbFPiIxyDwtSUdwx9l7mnCY0jV+WHjE0kl1sPP7cfnKieoto+YtC+Z+HVCNx/1t
	nEMvYnwl3MiIQaYfRnyhxiBej1lGXkn3MTu2W/0P7um/bWarclB1n0T3DSOBWaQRM+0kb/cSBMX
	pBK12QXn1e6RNKv98SEarOzU5Q06smNi9Bz0wo5mFI/lV34Ifhf8iY5ZpK9w7/rbsR0IP3rMW1p
	5tsg/fk06W1+JTwk71r0B8iwJqGzbblDB82JQAOjYMK421VdE8+ND1puFglYrhsdQX
X-Received: by 2002:a05:6300:83:b0:3da:755f:a031 with SMTP id adf61e73a8af0-3db0e1440cdmr14771539637.12.1789311426035;
        Sun, 13 Sep 2026 07:57:06 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:57:05 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 5/5] arm64: dts: allwinner: sun55i: add thermal sensors
Date: Sun, 13 Sep 2026 22:55:27 +0800
Message-ID: <20260913145527.18148-6-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075707_081285_7645EB35 
X-CRM114-Status: GOOD (  12.71  )
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
THS0 has only one temperature sensor, which is located in the DRAM
controller.

THS1 does have 4 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu
ths1_3 - npu

Add the thermal sensor configuration and the thermal zones.
Trips temperature, polling-delay and sustainable-power parameters are
derived from the manufacturer's BSP.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..ced544154 100644
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
 
@@ -380,6 +389,30 @@ gpadc: adc@2009000 {
 			status = "disabled";
 		};
 
+		ths1: thermal-sensor@2009400 {
+			compatible = "allwinner,sun55i-a523-ths1";
+			reg = <0x02009400 0x400>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+			nvmem-cell-names = "calibration", "calibration-second-part";
+			#thermal-sensor-cells = <1>;
+		};
+
+		ths0: thermal-sensor@200a000 {
+			compatible = "allwinner,sun55i-a523-ths0";
+			reg = <0x0200a000 0x400>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC0>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+			nvmem-cell-names = "calibration", "calibration-second-part";
+			#thermal-sensor-cells = <0>;
+		};
+
 		wdt: watchdog@2050000 {
 			compatible = "allwinner,sun55i-a523-wdt";
 			reg = <0x2050000 0x20>;
@@ -611,6 +644,14 @@ sid: efuse@3006000 {
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
@@ -1145,4 +1186,135 @@ npu: npu@7122000 {
 			power-domains = <&ppu PD_NPU>;
 		};
 	};
+
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 1>;
+			sustainable-power = <1200>;
+
+			trips {
+				cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				cpu0_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				cpu-trip-2 {
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
+		cpu4-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 0>;
+			sustainable-power = <1600>;
+
+			trips {
+				cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				cpu4_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				cpu-trip-2 {
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
+			trips {
+				gpu-trip-0 {
+					temperature = <60000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				gpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				gpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+
+		npu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 3>;
+
+			trips {
+				npu-trip-0 {
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
+				ddr-trip-0 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+	};
 };
-- 
2.55.0


