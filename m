Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F211CCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGd5UlriZ0Fmljc0R8krxuZT/x7hHgGTNiWkLANtVt8=; b=Q3kIpBeKFp/yfRhcp9vSRoeB4j
	7dhCMnTF7FP6lxv+dRiNLTnfUR57KRcVyqVttIFpsVF02LSVZYw9zNQ5VpydcHMQlxyAggCsj4WKn
	rcqloljcBXTuW4z203iJ3ylZ5u9yrYpN7eFBkEB9f3FXCZevGx8zYs4R39Fhk0MfhH6Lt2So/QSUx
	NKw0QGIVwgmOoyu2sX3x7By6HoIbUgGD+VFIjg6KWxEXQdSoV62vQJoPdLM5qILcaD+/TqZ9CP0WE
	Sx78+6x5CjMl+A4UTWk2jMbarnEp9TIkpawtHRuK6GfsW8hg7EuHyDikuyMeIyTKq89dcO0M3WHT3
	9VsQcm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlZ-0000000HDx8-3tQe;
	Mon, 25 May 2026 12:50:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUlO-0000000HDt2-0H9f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 12:50:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso82195555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713432; x=1780318232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGd5UlriZ0Fmljc0R8krxuZT/x7hHgGTNiWkLANtVt8=;
        b=Yq1Jecmi7hcE4+nvQFrgibZaR5KGok9Qi/o7ZTl+Qvt4zgcyfvrCMmOWi8QJBAONkC
         SoSgsPmkD0gxCxOWBiPBogXnJP7k7qcpU96VZ0ftpa/TzcVOAp28DU3UNcPMtUrd2u34
         jJ59+39iGsT9n9aYIxM4VLXwlPp6GYK6Yy8q/gcVcad3Mc7+0DifonimQS1CmkKNK3FU
         J8fyk2hnUv9yXIivJMGkpmh2xWjSzKCD9pc49ekAeJbotxXKNLUo00Fd58M+B/RSoGux
         23jPgpPGhpCovPxs917UwDOKoSySCh7lR6PhJx+xgdMMRtxa51YVfIby/WvWqPxiHici
         ZEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713432; x=1780318232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hGd5UlriZ0Fmljc0R8krxuZT/x7hHgGTNiWkLANtVt8=;
        b=JeXqHPpTQ7xDGLXyvm2RO0OuPSaMK7JVaG8XrS2EMddf6vphRtagB7alvWJeVa1Bwg
         wqMV8u5ae/69HnP+N9zKrzhCDcOSX9/WQtG9JXSezrEUVoMuYUEhrCai0hHoYDt9NxqZ
         Lvbh/yIIqQR4RXSkGUnaUm2EEAczc+M0j4PpYnSCHmSAB0Dz9Gjzzc2wjBi+/AE8x97Q
         zL9NM8pMZ1DyLPtaPSyWCHsXLQCZHfe0GO0zW873l6Z+CRsTeEP3s53vzDL7rA1zuyw7
         K0pit2TmrRc5OUkd99RdVQieSogu/7K/BbaK2w30YQ7MwmWDdCnsDYfYGHy9eUDsNzLv
         2ztw==
X-Forwarded-Encrypted: i=1; AFNElJ82jS/EVGoy+dOveHIyOoEYKoLzFCCN/ks7Pv4DdLQMICuEw++0Ii443wtMZLTsOeRfWY9+c1gb04ho2J7ilbNM@lists.infradead.org
X-Gm-Message-State: AOJu0YxeTZFQKyYinRajjYoUiOyEKgtqZKikwhTaW/dHgGxHVbzBoJ9B
	LWGDnXxw4w0VXnu5Q6c2f4AvTB9FmN7ltQA7Q9RSzNI4ZLhLcSm/QtqwRW9+xsCLtiI=
X-Gm-Gg: Acq92OEUWQAyAKCVgVGCfSrNn74yQ7ASSxx0lcTJ4BltxNe8QZUziNWYx3sti1tHnwY
	bmLV1bG1qz0Y1da1/Zd2y0TwVmfMJ6If36ojMOhiQJTY0ImWytSXKpsZXbwPnbk5lkMfO5gUwBe
	Yf8he49YH8cYYYdP1iAcXVKwobWLo2i3LN6QTZL85F3E22GWSbqx+BLCoF/ebwcWXl4e/+MCHKk
	ofZOAV3k62uwkNJ+O4jD/pHFORe/CYwxZBrea0XJNfxPHo3FXqc9LRwcpeBHRWlCkgEc/R88Kst
	ZFUfZ5/ioqr22x+t/C4ZptKZ3/kylKIV1Y8ONpx5vCjkdVLfsvTpb+yshv/83c+TqJ5jdOb3DI7
	5YKzkEtl7WIOC8/lMOsdGQ4U6Bb5zDR5NPJVRxOIdG0CxzzfkEDFOL2y992AmRJIQ42mJXFXrPI
	7vNnJMlnmT6PwYFd9F2GqlTCRfrsya16njI3AgaoyiudgrLEHKpZIlrgN+ZW9w96DTqpkbkG+ua
	IGTegRWPIjpsZOFYQ==
X-Received: by 2002:a05:600c:8599:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-490424acb4cmr187576005e9.8.1779713432460;
        Mon, 25 May 2026 05:50:32 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 25 May 2026 12:50:24 +0000
Subject: [PATCH v5 4/5] arm64: dts: exynos: gs101: Add thermal management
 unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpm-tmu-v5-4-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
In-Reply-To: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=7065;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=z5Fhpx6IUPSYAgFvZrJUnVUKezx0DwqehwsV2CJ50Xs=;
 b=3kUfL+Zlfc10wC65GccpAO0ZPOAehBJ+CwGSYYMwyBlA4abF5mKa9zhEwrLJ/e2DuOv0D9zzK
 x9O1Mlwz+gUBKJp3v8i5DgWGhBfDRSqnCqBTzSTS4H5kch6hq6l7za7
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_055034_887924_41746991 
X-CRM114-Status: GOOD (  13.97  )
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
2.54.0.746.g67dd491aae-goog


