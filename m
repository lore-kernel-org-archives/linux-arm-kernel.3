Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B14FCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDntjNasVGG8hcuxF4CdQbpDwBoTb2ZE5Gcryz3TjxU=; b=SX6UPLlFYy/doWCav2CfMwt12d
	lrI9mgcZ5ZNeGjWr5YYk0L0b20EZwNJcebt5wQiSMbUQ6qLqfYGo+fT32fsvO3gjN7TjjaN4T/GFK
	JmWjKdgCKJRd5CJD5i5O2QtpY9MNgiJwTKZreuYrq2cU3N7zjMkebQdlxANCsg/AlGtW3i89HFAiI
	ri2sekzQwq+TP4i8KpYjJajXjYpqWu3jbFx2jkPv19JbSNE8lazFrcq62pDE/Ykkf0lznWAiIUuSQ
	Z8cCwP71S/tBJIvUsiYKFAwaUes8SzZAxo28vB3Fc5GbdPwHzjUuTjT8SCIsZQgpJTmf+CHwfpHcx
	69jr3Urg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCt-0000000F6Vf-07DA;
	Wed, 03 Jun 2026 13:00:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlCp-0000000F6Sh-1EzT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:00:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso115558985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491621; x=1781096421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDntjNasVGG8hcuxF4CdQbpDwBoTb2ZE5Gcryz3TjxU=;
        b=USR20TgqrsogsiZdwbYRLI8uSVO1K2MaxfPA/uINMHnwqoYc6KtjTygMgkadke4gMw
         4qAQF/Mu26f05XepfA0PLxOHAAuAc5Vnd5SM+uM3SWWwVGHuEGTsr7DGprlcj0q0OhFD
         i/p+OtbzLqPZ1aTQ+6IJMBnRv099J9YWCBhsxHsLcascmf4MBuJlhQx8sJB1Qy8xzh1e
         dTwJy2FlYfN82lzUk5F5qrkf8kcAsD8BcRZWeZ3pH1sDXAR0yzB1ybjZYlB1FD8BrzRf
         ws2aaay+mpKtveyukLa99hnKHXHAKGNiOglS7hkzwjEZUXw+xoJ+0HOkvvBXznk4dyZg
         kuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491621; x=1781096421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDntjNasVGG8hcuxF4CdQbpDwBoTb2ZE5Gcryz3TjxU=;
        b=saRM7j65k6aZb2In87D1vCUwglkb3h8oHtc+lonzOT1KMJP5ncfyWw3QQC+wVxXFcM
         WMYn6ki0P6xMSVTMzKSxs+pEawvbcHUf2n4R8AcmzO/bp9jb+xTwCB7zHBd7GsYc3JyP
         xmbL6KIwVO6/t1zhoMeS+U/iyqwSZjLgQ+Fgs+74/egQg/1oNqnNChCZvH4hpmTH3zFB
         9kTqrOL2Ymy6uBbPiG5NlAG/C2CDoG9ajJRsa9VBBCbtC4iGwLdrzaF8wLei3soppnU1
         k/QSrJfXXF+sBfN92uD+1LtnJCRKwBQQ/PDNnDz7kubHlsgC1klhJfc2QiUdgtAQebF9
         18+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/XpMcBpcsQo0KB8ucPVFpM2af2EGjqKKcLsf35ggKXNYIXR6p+J2k5v9Hcu0lzhK1fFc8YxqDB8d88QgxcPw3K@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/NmGtL36qaPRizAP+ipJUbGHmTSKGOfLUJa3KTOW9AhvkJQPR
	6Zdh3SUzn19jN41s2W9uIBTB3Abh4ddLCFk6en8GyfsWI0WX4XvARKgQsDEglddMhD0=
X-Gm-Gg: Acq92OF60OOCKRmrraxv8rymVOF8XD/jWQk8DFa4YuHC/gUEFS91iHbFvAyc5/g4Q4d
	2ncTwkxcuT/YLuZFhkWWfh9wqZLrl216sNqub4rpBChQx+adCOayIYA3V8+69BNYNKGYy2engYo
	e35aQxESc/kWXcZMkMOnM7sY0wwEjPUQpwCmi+h2Qhso3J+BoItCwHvpYyWQs9ohZ8CtHmHPp7s
	oWc8rz8b+v2T6b3WnPg7a7TRR4mduYKYPZnfszNisbX89Pb6ogh/tMgWEMgetEIfOEnMwxZAA5q
	AAMAWL4qxsaE661aHyCAOUFGGn0XmfHz0/BL+f9fo0z6odhnV1nbZLN/zAbDG1die1Vni94qQyO
	thDUUQpf7npuvCHg2zhsP1w6DTi699MDsM+F12QiFis87rsJzg4xtv/wiGA7XOHQqafaBg2WFWs
	u7ZekZz0ukcNWs0Cwz9nPcMfsmneNdZbw4GjEg8lJNUfDrxQFy1s454W6VRJO8UF86C3RlCZbyH
	vnsHaJaaa8Sn7I=
X-Received: by 2002:a05:600c:8b2e:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-490b5e73ed4mr49003975e9.2.1780491621044;
        Wed, 03 Jun 2026 06:00:21 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm149179045e9.14.2026.06.03.06.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:00:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Jun 2026 13:00:19 +0000
Subject: [PATCH v8 4/5] arm64: dts: exynos: gs101: Add thermal management
 unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-acpm-tmu-v8-4-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780491617; l=7066;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=cWhAhaDFLAoUDdG0hR8RPClQQZ34eSbbH9qVOO1JS/c=;
 b=ogaFOarH37mKKfZkKdM3JA6Ux75FZWCi5G1lm2w1RD+KSFoJrZ6p4E85O5NzxQnlgCIPF3ltT
 fTsN47poVh8Due6kgJIn4pdlJIj7wlqzaOQW/XRMu6bvTRqLvcc6k9b
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060023_383261_8BDB1A7B 
X-CRM114-Status: GOOD (  13.92  )
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

Add the Thermal Management Unit (TMU) support for the Google GS101 SoC.

Describe the TMU using a consolidated SoC node that includes memory
resources for interrupt identification and a phandle to the ACPM IPC
interface for functional control.

Define thermal zones for the little, mid, and big CPU clusters, including
associated trip points and cooling-device maps to enable thermal
mitigation.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi | 136 +++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi     |  18 +++
 2 files changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
new file mode 100644
index 000000000000..b27d1a539ec2
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi
@@ -0,0 +1,136 @@
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
+				big_switch_on: big-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				big_mitigate: big-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				big_hot: big-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				big_critical: big-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&big_mitigate>;
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
+				mid_switch_on: mid-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				mid_mitigate: mid-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				mid_hot: mid-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mid_critical: mid-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+				     trip = <&mid_mitigate>;
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
+				little_switch_on: little-switch-on {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				little_mitigate: little-mitigate {
+					temperature = <90000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				little_hot: little-hot {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				little_critical: little-critical {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&little_mitigate>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 86933f22647b..b6866ef99fb3 100644
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
@@ -639,6 +647,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		tmu_top: thermal-sensor@100a0000 {
+			compatible = "google,gs101-tmu-top";
+			reg = <0x100a0000 0x800>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+			interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+			samsung,acpm-ipc = <&acpm_ipc>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		trng: rng@10141400 {
 			compatible = "google,gs101-trng",
 				     "samsung,exynos850-trng";
@@ -1862,3 +1879,4 @@ timer {
 };
 
 #include "gs101-pinctrl.dtsi"
+#include "gs101-tmu.dtsi"

-- 
2.54.0.1013.g208068f2d8-goog


