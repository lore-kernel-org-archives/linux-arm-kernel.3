Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30F8C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqMMUOwQC1FQBaxF5Z+cbkCBiisCIHbCIXU0D1pZnrM=; b=YZ6HhOnDoMw3HAxhkJrY2Omr4w
	OyUCaOj6Q8ZQ/1EeHaVubig3e7+/BjEOf+bqHJpEDI7iJhqdDwcKeXh+SPxum1asH1pbSd6DVKazn
	BT6vTZUdoVTItOEu7g/ZqNRRSZp5/wJuNEsIQsYT7itpjVsW44gcc1a20vG96aAoSncyEPFSZYthx
	g9vplQ2fyRIJTsxPAZGysEXuSuCh9QEMbHCAFyI7lDUoJ29P1Y6zIHJmft8trmznrwj5qHVJrZOtV
	NPYYnsG+AvH24xnvaYjsK1KN2NdXaXhScjiTDLOlvh/5rYl9YvYpJ769yoWS75S0ga7MwCyYOzzpL
	d5ltRHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32cd-0000000CAbR-3t13;
	Fri, 11 Apr 2025 00:51:55 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Ro-0000000C9QB-3kCZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:40:46 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3061513d353so15204521fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332043; x=1744936843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqMMUOwQC1FQBaxF5Z+cbkCBiisCIHbCIXU0D1pZnrM=;
        b=an6uYji4RH4kjTtKWkbo6B3DoyLa4OWDCqaD3qVAC476CtoKLEy6wamvaqk9iOJuFK
         WbbVGCV9Q/2dAszp0iPZBAzMW7FzgU+raXTcGNauOFzxR3p4l3oWdBqDZEpT3kVVGnzl
         M/AHaK0m4fqXRaA9bUekQGML2eRxHpIyUjaHkqnF+GyxfCZbwvafnod1IlrNPQiMYaxb
         fH82s2tdS7K4SwiAfNMM4FJITGdrXEgjvKPBDeQHfiEuMHjHzRkNcdQOP5ImbbLu3Vsl
         +gUVCWmip1+z7hCuGzPTeMSwfly8H0bD6ROUKSGyuIlUWkEGR5ZiyBEFdl/pfBqksY/R
         ZUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332043; x=1744936843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqMMUOwQC1FQBaxF5Z+cbkCBiisCIHbCIXU0D1pZnrM=;
        b=HKUWrAUG6Vc4zYfTCvNneBfEJrT7rvImA0OqIWyaKRlElGb8pT0MCYB+VW88K7FXjd
         RCW6AUk5HPowCxA5VJ2i72j9BJVVhyBEJZE/gy0WhrYd7kX5sgiimiy71vF6obaNf0d3
         PdaxNDb4IprUlyEfm61pIgG7aqGgxKARYt+mNtRfLjWnrURQ8kWIq3M0frWXAD9IcyEG
         s9uI0NYLlYTStzOYxpfaXoQIkU3zGk38CkFtaTvxtKBIYoEL+W+8LMo2Pe9w2uqnHF9x
         N7/IVn/aDJ7suk0w8bpjI5el26iE0NpRP8biL9nbXMkrHSpobSsn9lXtbkankMN8u2Kx
         3KiA==
X-Forwarded-Encrypted: i=1; AJvYcCVn/oluJnew9UUY54bL7sh6RqEi+SqjeVm5D3AbPyt+aaoS4Gs74ZtX1Vn+Pzde9cDClJJQOk3NAulH2RwQwHTt@lists.infradead.org
X-Gm-Message-State: AOJu0YzXCMi+/Cqr2835JZC7M0PWrM67+8bZwXaJj1YzB+g+I9mM/BFQ
	yqD4nuOAeWLTsdU+P3/vOvPlptoXW9LBIVo2GMEkVJYSnppOPdlb
X-Gm-Gg: ASbGncs+nm3Z/32kSH8f92Px+3WY4kYW7p/nNRpSL4vjE8RzwsUoUyPWDj/TANtT9wZ
	9KXc1j3p5izVDeWWj7Ob7ysAg8z1v9kiWT0mB0AZPM9aZ0q9t1ZWe6YaF8G+9e3detowR45XHpc
	532Gaiztq+X8rnpXGq6u4RJSzuPtxaeWAsMVsU3/RrmulZNUOI6NcCCzNy+mKXuoNgqgMgvQBUb
	Zw3Hd6huuEXOu/b4a8Yu/sEar6F7KkbpF6EAbVlxNrGYlcicTAJPX1ixsOwIw/7ubilbZqq5Eqd
	2RtmvIOB0xPfARm7nDcffulA0EqkzdCAIVAg2yrDGVR7AtlG2g==
X-Google-Smtp-Source: AGHT+IF33816+KiMMv+fNeFdW0EInDxjtilG9kyALznQ6Y0n6dpa1CvrQmH8HkK1cx1k6+UUsrWg3g==
X-Received: by 2002:a2e:a9a3:0:b0:302:2598:de91 with SMTP id 38308e7fff4ca-310499fb36bmr1693111fa.16.1744332042866;
        Thu, 10 Apr 2025 17:40:42 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:40:42 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 5/6] arm64: dts: allwinner: A523: Add thermal sensors and zones
Date: Fri, 11 Apr 2025 08:38:25 +0800
Message-ID: <20250411003827.782544-6-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_174044_936284_5C16C4E3 
X-CRM114-Status: GOOD (  13.08  )
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

Add the thermal sensor configuration and the thermal zones

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index d626612bb..4f36032b2 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -22,6 +23,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0x000>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@100 {
@@ -29,6 +31,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -36,6 +39,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -43,6 +47,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			reg = <0x300>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -50,6 +55,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			reg = <0x400>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -57,6 +63,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			reg = <0x500>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@600 {
@@ -64,6 +71,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			reg = <0x600>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@700 {
@@ -71,6 +79,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			reg = <0x700>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -171,11 +180,39 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ths1: thermal-sensor@2009400 {
+			compatible = "allwinner,sun55i-a523-ths1";
+			reg = <0x02009400 0x400>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+			clock-names = "bus", "gpadc";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
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
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			#thermal-sensor-cells = <0>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun50i-a523-sid", "allwinner,sun50i-a64-sid";
 			reg = <0x03006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@38 {
+				reg = <0x38 0x14>;
+			};
 		};
 
 		mmc0: mmc@4020000 {
@@ -602,4 +639,105 @@ rtc: rtc@7090000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <500>;
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
+			polling-delay-passive = <500>;
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
+			polling-delay-passive = <500>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 2>;
+			sustainable-power = <2400>;
+
+			trips {
+				gpu_temp_critical: gpu-trip-0 {
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
2.49.0


