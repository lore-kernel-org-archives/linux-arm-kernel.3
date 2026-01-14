Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97036D37E39
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0+/JV08+r5HaiYcZ+Llw+TpfRxTE/NUdH0Ba5F1Ndg=; b=TuFLSQ9NQkf2bACnaehQHH7FiB
	wlAczo7pTwrSST7EZNfM7fgOc5Hg9azqSxf4EbanIJjXRxdG+mKkD7K13/8ZwDIT5Bjpsgvtxjgh/
	/zAvmcyG/HY4A7N4gHX0nPMJhRNQ0faUisYLKwa68MmmQbYwgDlW47RV9bp9CVLOCsV5a3wwrKuk9
	CXiWGEDwN5xJry6zHRDADy2pVlmHgQfB/3wu5xCJ7WXLpsOUL+ihO6EEAzsAfkefpKWibTE0A3sVm
	bYwv+1S07hPJv4P+Wk4wCr95EMq2hOGJVk9X+y2uFcLZ5WAT1xFM5ZRjqEMkjisA6wIaUgxorf3H1
	w/V2IC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gk-00000009UkN-0lyx;
	Wed, 14 Jan 2026 14:17:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gf-00000009UdM-22tj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Jan 2026 14:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v0+/JV08+r5HaiYcZ+Llw+TpfRxTE/NUdH0Ba5F1Ndg=; b=BAjQ7L/ojfSXxvBTorWF8bQPAH
	l8aJh6EzXvUIMV5kdJBb3SrlmTP52JV2RuAKrp762/9UwXm/gbpe8wCPBsCnDLtzV41fmpkZIJi4d
	Lb4+rP8qBNmhs58mwo5XHM5xyK8abfbiNp2S9SiBskEDNdxkoNxxQKuc2aMQoNREDipMm14NnlXK+
	uWsWKtqy9kRurU1zp2wMWvzygPWGaEikTYLB0h1YebsLxcLxpVpWGPrNlkkzYOLakF8etg7/dahq5
	UMx6jFsQ38XEvswHvdhvmWzLHXt2sd/NcpjXmdE9QfL6rEIILJUA3w2nt542UC+sbTZw5cYtO1hV0
	xUjFVW7Q==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gb-000000050Rk-1BHQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so50291085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400238; x=1769005038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0+/JV08+r5HaiYcZ+Llw+TpfRxTE/NUdH0Ba5F1Ndg=;
        b=sXaPDrbmzSqBMe232PW55tbT+kkdp9qTbXCvanJQcb/Z3SFWZUjl+cyXFi7A+ABw5Z
         UqxlG2LqTCjRgL6oIow5m0Qq4SNRV84AaOPHc+KM0Vvb/i5b8WX5x43d3LGvBMSsGHw4
         p2zxRNFYhWQsIYMT/s3/0u0LSa/4HBB8oLP2B1+IUPM9bRcaX66XglmuCm7PBZwH9cTB
         /rYPjkfdKhB40gv3Fpr8b2mo0qKhcysxpvFdq236Qz/TeWpcY9bybDIdbeKMizo76Gan
         eeeCaitUZtuooEkr1HK6U8wTiNf9HYWykK+A9tq6MKmFsXM5YOm8kv1KMyapz1htC3bo
         c/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400238; x=1769005038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0+/JV08+r5HaiYcZ+Llw+TpfRxTE/NUdH0Ba5F1Ndg=;
        b=mxk/hFxSWN2c4mNYNAg7q293baAAa6QLmtF2OPtqNdQDkV09MqB44RK/cgF7AANIsa
         aFKqWF5bw9adgZ57SHnBBhOqqNWiTLFpKk0IgWewgJDCwseVbid7L8KDADhWvSUvDRvO
         +poWl3qbY52v/ak6WP9u/vpgrUaRxef152oxe7SILGHbjRhIGTFQDHrDp2v0MfNhWpNZ
         hFuM9Zt3pwxDKW41HYwc+ExDu04XutJ8Z8Ts0FLRLZdV5jmCEVSRIQ1N53fywDloCz9V
         ew7O1NzEHxBuifvpSYGNoBoy6A/aoJF2+qugy9pgsHUy7u/+GNC2sBtJpkpD/x50ld/T
         /Krg==
X-Forwarded-Encrypted: i=1; AJvYcCXjsoJKc0XwcFoI7MuYypYQe+u7CZjnrlbYSrWV4VZVmLBqbOg+HIS+628f0NS/xhFrQSIWBc4OfuoVSI85YBo1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4X3PdVaaNte9l9/vleu7PhdCrOyCGDEN7MRACpQ7xYR6YaTYC
	CGlQugzYbBy317niLyfqlXUG+8jsAaNnOJvcmHnzcGhyvWd/3vGIDtfZi/K5wRrW5eQ=
X-Gm-Gg: AY/fxX79Y7uStcnUcDu7tsXCx1lvdOSqL+erhX8lwbIyzsWNm5XK5bWtVPALjQyrWrp
	NqOvQKSnpu7AxSbCiIMsjoZLFDnLnRclH3sM/XzQgi57UCLEwg1KbKtDEa7FyDrntIetpP5WnWw
	Qh6kZbWq5TEqPB6Pfzol4k9Ne4C4tOM3CbePxes4/wfMK5DnwksXNBvoMBS4Xk8OqWcdVocLobn
	5wyWEb671fFnPYxhr9W8piVmPPybCyGIJlBzua4E/S50oMDhrChRn2NUah0b/Fz0v02iNcgjyK9
	ptEiNq05D3XNtxn5Y+Ts8oMk+lHOuLK5ExITdR2YkR8v/IghGKT5cSa7HmKF9tg5v8n0X7JDfsY
	zF2gk4vXQKlLv+2tziuVNXXO2m+Ot20q3T+TnctPlKbEcMb46tbYDs5SOrOkXPeoOBq9MKptxJS
	vIpDdQ6PMHF441asuszz2qJNe7R/F9hB4M0OTMBSNr42nLccfo/aMZlDvq7FjN5hC8TvIx5A==
X-Received: by 2002:a05:600c:870b:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-47ee3349d27mr34823075e9.15.1768400238402;
        Wed, 14 Jan 2026 06:17:18 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:17 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:35 +0000
Subject: [PATCH 7/8] arm64: dts: exynos: gs101: Add thermal management unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-7-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=9008;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=5H0lgDSUScoa7O0SKdxLcVIZHcB9BT1ur3Jx/KZwF8M=;
 b=HXnagG3gv/1lLforBYx+5nePgwHPOp9Z1Gwl0BqqQvYoXOb/bhmpCS7TdePLVZg19tC4RNUjf
 WV7Y7zCenC7CfdPS4WtdHlZAotXST1JrJmm7B/XOVq99Prf7aEloUTU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_141726_477880_6ED96057 
X-CRM114-Status: GOOD (  13.96  )
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

Add the Thermal Management Unit (TMU) nodes for the Google GS101 SoC.

This includes:
- The top-level TMU sensor node linked to the ACPM block.
- The TMU syscon node for direct interrupt register access.
- Thermal zones for the CPU clusters (little, mid, big) with associated
  trip points and cooling maps.

This enables thermal monitoring and mitigation on GS101 based devices.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi | 209 +++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi     |  22 +++
 2 files changed, 231 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6262c3b890aa2f7ad572c32b30bf926df804ec1e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Google GS101 TMU configurations device tree source
+ *
+ * Copyright 2020 Samsung Electronics Co., Ltd.
+ * Copyright 2020 Google LLC.
+ * Copyright 2026 Linaro Ltd.
+ */
+
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	thermal-zones {
+		cpucl2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 0>;
+
+			trips {
+				big_cold: big-cold {
+					temperature = <20000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				big_switch_on: big-switch-on {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				big_control_temp: big-control-temp {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				big_pre_switch_on: big-pre-switch-on {
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				big_alert2: big-alert2 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				big_hw_throttling: big-hw-throttling {
+					temperature = <103000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				big_pause: big-pause {
+					temperature = <108000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				big_hot: big-hot {
+					temperature = <115000>;
+					hysteresis = <3000>;
+					type = "hot";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&big_control_temp>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpucl1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 1>;
+
+			trips {
+				mid_cold: mid-cold {
+					temperature = <20000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				mid_switch_on: mid-switch-on {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				mid_control_temp: mid-control-temp {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				mid_pre_switch_on: mid-pre-switch-on {
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				mid_alert2: mid-alert2 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				mid_hw_throttling: mid-hw-throttling {
+					temperature = <98000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				mid_pause: mid-pause {
+					temperature = <108000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				mid_hot: mid-hot {
+					temperature = <115000>;
+					hysteresis = <3000>;
+					type = "hot";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+				     trip = <&mid_control_temp>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			       };
+			};
+		};
+
+		cpucl0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&tmu_top 2>;
+
+			trips {
+				little_cold: little-cold {
+					temperature = <20000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				little_switch_on: little-switch-on {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				little_control_temp: little-control-temp {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				little_pre_switch_on: little-pre-switch-on {
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				little_alert2: little-alert2 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				little_alert5: little-alert5 {
+					temperature = <103000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				little_alert6: little-alert6 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+
+				little_hot: little-hot {
+					temperature = <115000>;
+					hysteresis = <3000>;
+					type = "hot";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&little_control_temp>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48f3819590cf8c05d6bd7241cfed8720149c7db4..a2d5ed832588b83ec47e8c6833073c9ec95f2517 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -74,6 +74,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -86,6 +87,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -98,6 +100,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -110,6 +113,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -122,6 +126,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -134,6 +139,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -146,6 +152,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -158,6 +165,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
 			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
+			#cooling-cells = <2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -489,6 +497,14 @@ acpm_ipc: power-management {
 			#clock-cells = <1>;
 			mboxes = <&ap2apm_mailbox>;
 			shmem = <&apm_sram>;
+
+			tmu_top: thermal-sensor {
+				compatible = "google,gs101-tmu-top";
+				clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+				interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+				syscon = <&tmu_top_syscon>;
+				#thermal-sensor-cells = <1>;
+			};
 		};
 	};
 
@@ -639,6 +655,11 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		tmu_top_syscon: syscon@100a0000 {
+			compatible = "google,gs101-tmu-syscon", "syscon";
+			reg = <0x100a0000 0x800>;
+		};
+
 		trng: rng@10141400 {
 			compatible = "google,gs101-trng",
 				     "samsung,exynos850-trng";
@@ -1844,3 +1865,4 @@ timer {
 };
 
 #include "gs101-pinctrl.dtsi"
+#include "gs101-tmu.dtsi"

-- 
2.52.0.457.g6b5491de43-goog


