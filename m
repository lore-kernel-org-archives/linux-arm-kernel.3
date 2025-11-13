Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C7DCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3Dqt47bT9tRJg8DFRDd8CZytQ/KWmH/+6ypW+kSsd8=; b=SKA7lsj51Q1UmAoEaEi5wZkHps
	O1OAFIEEO9BnNsed7Y+VVrijoo+FUB2wboOxeWNZ9JWedZuQ4vlMJIZIcwiNykmwv6yQJv1qC56C8
	nLgx4Dz7Uo+cxwadqVlSQSduJfK9cmJ1Qy8JaO2K6O5n1zfOFuVGgUIujUblw1ohCHURw4iIFUov9
	0hy2M0r3RjOVSfYf4duLsTHsOugIlEFTYHCWgQJTZxGfAGxYHMRCGGcYbGYsgyd83N/lJ8Wwk+maB
	ymHCah+pJTKEj8cibKHO1DFXFVuVP//wGGpXFZnSjTyvZmSJRx7UI00VxtybbwkHeorNe4x3v8icT
	GfRCVtJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXPz-0000000AXel-3iY2;
	Thu, 13 Nov 2025 13:31:19 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXPw-0000000AXdw-12Ni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 13:31:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b733707e0b5so116215066b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 05:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763040674; x=1763645474; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3Dqt47bT9tRJg8DFRDd8CZytQ/KWmH/+6ypW+kSsd8=;
        b=v+Qyuos5O2bL9xxQ+KEiFhYnUyoFg09kfgS3i1baCMCiFrztWYmuueiHjLokJFoO9M
         AuLwsO5eMgkJYV49+vMA7EgMRnOGdi+EeuLmQ2Vkk3vJlSOYsBBPUJrMYdDIASG29ipT
         TgWasrjPU0JpoZAsV5dKCG0VbGzW+w4cRg0zjBwTGHsAtBHMcxPWE/FthYpzIbuxVh3z
         YGHVO+O7bd+9Hv6w3wE6XeIfk3qTLtvRmYgMMHilWZUngYLZM49Lxvpxpz1o9kLxVsGV
         EfpUNXXAFm7CKg6IMlVkf/0lXcNDUCGIzsegppFqH37cU0l8mcDmukfQkObHJe55C7Uh
         1iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040674; x=1763645474;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3Dqt47bT9tRJg8DFRDd8CZytQ/KWmH/+6ypW+kSsd8=;
        b=sRdJKZYXPcce2wVQA1STZlKFRUloVEnKycCgPpkhzEg0KrEcswowR3/ruBU2BRyS5k
         cSDaHWI382Aqb5g8/OuZcuJJKp249FHdINveBTptD8QNGCTJm/uOcRhOLt345U5KSFu+
         Iq1Ur2m+l/ClL5aji/QXrGimX3OX0j0FzmkFrUJfFFrgFkmlSRW9Y0mQzmbZhB01nAy+
         CIkFld3r92Fc/Gm9tY79QNMVe1DH53MVxacz6DtHMJkNyb8ZzAv5bWTmVIGdysxQoj4D
         N4d+Og2rAkDVwLzgBbvJGuk0RMj4E5lUKQR1FnfiyI5EJt0hFChfYxdN+HWhKx4kyMHL
         jqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl1QgIsNQwV0hoHdfhWx5MlQ32Lr3mOAm20Apb6wJiHJUvHRo0OaTjGHlUtK+v90x18DsJ53FDQwGszd2LNanG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx96Pd7ly9Niv/7cjnNeel2K/KzVKeb13EtSN1ozgoBw2eaEYwT
	9GR6rQyZxw8i46i2ZEpHMY29cLIpneR0FSkcuqH0pKEwSCsZfF0HZzYHw7igUXhaXk/t7Qfvvoc
	b+LdfSyMolA==
X-Gm-Gg: ASbGncv7lFzBF/coHTO5YZrbJ9UnZO6oTrV4Ipotfgbt+4v/UstnA+0AU1HPHtw1ntO
	3Xjwwe7b5w3BHCbOQQ9qJsf6PHtWJhKBw9lcAoQ59t9UFB6bj11szJSFAb9b4Ew5WadcAud5rCL
	ecv8CGGT4yyf1Hn/rFDy/zO9BtpyJVBUSU/5CWzLvA62jOQ0FWXe37VNHN0ynWyUtFQ0WyLioUD
	KNgodV2hsUwQd3onwYRuvB9uELnSIRggowkqnl7dn9HWGbPBYFndpCm2FRbufRA6/Dg4tVczjwf
	MGFQSIRt8gScRU6wGHbOzNTcYHfOlVcMcMTACUMaNjA42xpIHie/GT6W0fkjWrvhNpvAED5BGdx
	GABKoT8nKGVR32yUuj+Z73NzbpaQp914Z2KVc2dVzrfDdeuL0oZNm30djLW4uBmaKtsotORlr1A
	2QPHLbl+e65uj9lVCK3sUfGTiJuCiYpX6J1+4pYLAcu7KY1nSdk2WjPIjmS0xKQQdQwTo=
X-Google-Smtp-Source: AGHT+IGHxIo0Q+JtQIZs17biyUyimW3Lh/jOSGuiHHiwlpi/rTlUut6b9te1pq8EpoKb52ZnGoz/Zg==
X-Received: by 2002:a17:907:934c:b0:b73:4202:f108 with SMTP id a640c23a62f3a-b734202f8f8mr421331766b.11.1763040674147;
        Thu, 13 Nov 2025 05:31:14 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809fasm165197866b.45.2025.11.13.05.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:31:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 13 Nov 2025 13:31:10 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel: add all S2MPG1x
 regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42be1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJ3dFWkC/33MywqDMBCF4VcJs+5AovZiXqW4GM3EBuotiSKI7
 95YF911+R843waBveMAWmzgeXHBDX0KdRHQvKhvGZ1JDZnMrvImcwxZN7ZqRc/t/KY4+IAmBiS
 mojacG2tLSOfRs3XrF35WZ3ue5uTHc/zxWvzD71So5pGXJdVWL8Vh1xQYm6HrXNSi5zXiASilJ
 FT7/gG85g8a0wAAAA==
X-Change-ID: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Douglas Anderson <dianders@chromium.org>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_053116_469638_4FE0062E 
X-CRM114-Status: GOOD (  17.86  )
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

Most rails are the same between Pixel 6 and Pro, with the following
differences:
    * only Pro has UWB
    * Pro uses l2m, not l14m, for TCXO
    * Pro uses bucka, not l31m, for NFC

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Please note that this patch depends on the bindings updates for S2MPG1x
from
https://lore.kernel.org/all/20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org/

I've left out conversion of placeholder regulators for now, because
some more testing is required for such changes.

With this in change (and the corresponding driver updates), the most
noteable change is that the display is turned off at some point during
boot (since we don't have a display driver yet). To avoid that, one
could boot with regulator_ignore_unused or vci_disp (ldo22m) could be
marked as regulator-always-on. I've not done that to ensure power
consumption is reduced by default and the phone stays cool and the
battery charges using the default settings configured by the bootloader.
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  22 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 494 ++++++++++++++++++++-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  18 +
 3 files changed, 533 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 8df42bedbc036b5e97f6238d64820370043ffef2..36721adcaa239da20d63173bdeab67f4381f3c91 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 #include "gs101-pixel-common.dtsi"
 
 / {
@@ -15,6 +16,27 @@ / {
 	compatible = "google,gs101-oriole", "google,gs101";
 };
 
+&acpm_ipc {
+	pmic-1 {
+		regulators {
+			ldo14m {
+				/* PLL */
+				regulator-name = "avdd18_tcxo";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_TCXO_ON>;
+			};
+
+			ldo31m {
+				regulator-name = "nfc";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+		};
+	};
+};
+
 &cont_splash_mem {
 	reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679439bd87b0630cf9416b05c9d4536..f957e0abe9a0ea8a015334424a64b69b26d789de 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 #include <dt-bindings/usb/pd.h>
 #include "gs101-pinctrl.h"
 #include "gs101.dtsi"
@@ -101,7 +102,7 @@ cont_splash_mem: splash@fac00000 {
 };
 
 &acpm_ipc {
-	pmic {
+	pmic-1 {
 		compatible = "samsung,s2mpg10-pmic";
 		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
@@ -109,6 +110,22 @@ pmic {
 		system-power-controller;
 		wakeup-source;
 
+		vinl1m-supply = <&s2mpg11_buck3s>;
+		vinl2m-supply = <&s2mpg11_buck3s>;
+		vinl3m-supply = <&s2mpg10_buck8m>;
+		vinl4m-supply = <&s2mpg10_buck9m>;
+		vinl5m-supply = <&s2mpg10_buck9m>;
+		vinl6m-supply = <&s2mpg10_buck9m>;
+		vinl7m-supply = <&s2mpg11_buck6s>;
+		vinl8m-supply = <&s2mpg11_buck6s>;
+		vinl9m-supply = <&s2mpg11_buck7s>;
+		vinl10m-supply = <&s2mpg11_buck7s>;
+		vinl11m-supply = <&s2mpg11_buck7s>;
+		vinl12m-supply = <&s2mpg11_bucka>;
+		vinl13m-supply = <&s2mpg11_bucka>;
+		vinl14m-supply = <&s2mpg11_buckboost>;
+		vinl15m-supply = <&s2mpg11_buckboost>;
+
 		clocks {
 			compatible = "samsung,s2mpg10-clk";
 			#clock-cells = <1>;
@@ -117,6 +134,475 @@ clocks {
 		};
 
 		regulators {
+			buck1m {
+				regulator-name = "vdd_mif";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			buck2m {
+				regulator-name = "vdd_cpucl2";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_CPUCL2_EN2>;
+			};
+
+			buck3m {
+				regulator-name = "vdd_cpucl1";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_CPUCL1_EN2>;
+			};
+
+			buck4m {
+				regulator-name = "vdd_cpucl0";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN>;
+			};
+
+			buck5m {
+				regulator-name = "vdd_int";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			buck6m {
+				regulator-name = "vdd_cpucl2_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_CPUCL2_EN2>;
+			};
+
+			buck7m {
+				/* GPU */
+				regulator-name = "vdd_int_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			s2mpg10_buck8m: buck8m {
+				regulator-name = "lldo2";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			s2mpg10_buck9m: buck9m {
+				regulator-name = "lldo3";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			buck10m {
+				regulator-name = "vdd_tpu";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_TPU_EN>;
+			};
+
+			ldo1m {
+				/* ALIVE, AOC PLL */
+				regulator-name = "vdd_l1m_alive";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+			};
+
+			ldo2m {
+				/* lots, DDR */
+				regulator-name = "vdd_l2m_alive";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+			};
+
+			ldo3m {
+				/* AVDD: MIPI CSI & DSI, PLL: CPUCL SHARED TPU UFS */
+				regulator-name = "ldo3m";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			ldo4m {
+				/* AVDD: MIPI CSI & DSI, UFS, OTP, TS_SUB, TS_TOP, XOTP */
+				regulator-name = "ldo4m";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			ldo5m {
+				/* VDD: ADD, AVDD: TCXO & TCXO_FAR */
+				regulator-name = "avdd075_tcxo";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_TCXO_ON>;
+			};
+
+			ldo6m {
+				/* PLL CPUCL & MIFx, UFS clk, MIPI DSI */
+				regulator-name = "vdd_pll";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN_MIF>;
+			};
+
+			ldo7m {
+				/* IO (HSI (USB)) */
+				regulator-name = "vdd_hsi";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <6250>;
+				/*
+				 * TODO: link to HSI power domain, without this,
+				 * Linux hangs during USB access.
+				 */
+				regulator-always-on;
+			};
+
+			ldo8m {
+				regulator-name = "vdd085_usb";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+			};
+
+			ldo9m {
+				regulator-name = "vdd18_usb";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+			};
+
+			ldo10m {
+				regulator-name = "vdd33_usb";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3350000>;
+				regulator-always-on;
+			};
+
+			ldo11m {
+				regulator-name = "vdd_cpucl1_m";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_CPUCL1_EN2>;
+			};
+
+			ldo12m {
+				regulator-name = "vdd_cpucl0_m";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_PWREN>;
+			};
+
+			ldo13m {
+				regulator-name = "vdd_tpu_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_TPU_EN>;
+			};
+
+			ldo15m {
+				regulator-name = "vdd_slc_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			ldo16m {
+				regulator-name = "vdd085_pcie0";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+			};
+
+			ldo17m {
+				regulator-name = "vdd085_pcie1";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+			};
+
+			ldo18m {
+				regulator-name = "vdd18_pcie0";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo19m {
+				regulator-name = "vdd18_pcie1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo20m {
+				/* DMIC, memory power */
+				regulator-name = "vddq_aoc_pdm";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG10_EXTCTRL_LDO20M_EN2>;
+			};
+
+			ldo21m {
+				/* Dauntless  */
+				regulator-name = "vdd_dtls";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			ldo22m {
+				/* display */
+				regulator-name = "vci_disp";
+				regulator-min-microvolt = <3025000>;
+				regulator-max-microvolt = <3025000>;
+			};
+
+			ldo25m {
+				/* touch */
+				regulator-name = "dvdd_tsp";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo26m {
+				/* touch */
+				regulator-name = "avdd_ts";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo27m {
+				/* under-display fingerprint scanner */
+				regulator-name = "avdd_udfps";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
+
+	pmic-2 {
+		compatible = "samsung,s2mpg11-pmic";
+		interrupts-extended = <&gpa0 7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sub_pmic_int>;
+		wakeup-source;
+
+		vinl1s-supply = <&s2mpg10_buck8m>;
+		vinl2s-supply = <&s2mpg11_buck6s>;
+		vinl3s-supply = <&s2mpg11_buck7s>;
+		vinl4s-supply = <&s2mpg11_buck7s>;
+		vinl5s-supply = <&s2mpg11_buckboost>;
+		vinl6s-supply = <&s2mpg11_buckboost>;
+		vinbd-supply = <&s2mpg11_buckboost>;
+
+		regulators {
+			buck1s {
+				/* multimedia */
+				regulator-name = "vdd_cam";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_PWREN_MIF>;
+			};
+
+			buck2s {
+				regulator-name = "vdd_g3d";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_G3D_EN>;
+			};
+
+			s2mpg11_buck3s: buck3s {
+				regulator-name = "lldo1";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			buck4s {
+				/* DDR */
+				regulator-name = "vdd2h_mem";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+			};
+
+			buck5s {
+				/* DDR */
+				regulator-name = "vddq_mem";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_PWREN_MIF>;
+			};
+
+			s2mpg11_buck6s: buck6s {
+				regulator-name = "lldo4";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			s2mpg11_buck7s: buck7s {
+				regulator-name = "mldo";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-ramp-delay = <6250>;
+			};
+
+			buck8s {
+				regulator-name = "vdd_g3d_l2";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_G3D_EN>;
+			};
+
+			buck9s {
+				regulator-name = "vdd_aoc";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			buck10s {
+				/* DDR */
+				regulator-name = "vdd2l_mem";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+			};
+
+			buckd {
+				regulator-name = "vcc_ufs";
+				regulator-min-microvolt = <2400000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+			};
+
+			s2mpg11_bucka: bucka {
+				/* lots, IO */
+				regulator-name = "bucka";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+			};
+
+			s2mpg11_buckboost: buckboost {
+				regulator-name = "buckboost";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3600000>;
+			};
+
+			ldo1s {
+				regulator-name = "vdd_g3d_m";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_G3D_EN>;
+			};
+
+			ldo2s {
+				regulator-name = "vdd_aoc_ret";
+				regulator-min-microvolt = <450000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-always-on;
+			};
+
+			ldo6s {
+				/* sensors */
+				regulator-name = "vdd_prox";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo7s {
+				/* sensors */
+				regulator-name = "vdd_sensors";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo8s {
+				regulator-name = "vccq_ufs";
+				regulator-min-microvolt = <1130400>;
+				regulator-max-microvolt = <1281200>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+			};
+
+			ldo9s {
+				regulator-name = "vdd_gnss";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <1300000>;
+			};
+
+			ldo10s {
+				regulator-name = "vdd_gnss_rf";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo11s {
+				regulator-name = "vdd_gnss_aux";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+
+			ldo13s {
+				regulator-name = "vddq_mmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3350000>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_LDO13S_EN>;
+			};
 		};
 	};
 };
@@ -317,6 +803,12 @@ pmic_int: pmic-int-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
 	};
 
+	sub_pmic_int: sub-pmic-int-pins {
+		samsung,pins = "gpa0-7";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa10-1";
 		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
index 1e7e6b34b8649bc700a745c579a0268f0f6a9524..a422542715f27c8ea7a624f749b6d92e1bcb3429 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -15,6 +15,24 @@ / {
 	compatible = "google,gs101-raven", "google,gs101";
 };
 
+&acpm_ipc {
+	pmic-2 {
+		regulators {
+			ldo4s {
+				regulator-name = "vdd2_uwb";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo14s {
+				regulator-name = "vdd3_uwb";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <1950000>;
+			};
+		};
+	};
+};
+
 &cont_splash_mem {
 	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
 	status = "okay";

---
base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
change-id: 20250603-s2mpg1x-regulators-dts-aea4bde3dff9
prerequisite-change-id: 20250603-s2mpg1x-regulators-7a41c8399abf:v4
prerequisite-patch-id: 9d4a1e0afe6eb45dcd35a9537b7d5b4e35e801c3
prerequisite-patch-id: 928fd84e5f6207a2fd98dd8372a91df0776ecfde
prerequisite-patch-id: b87abb6b9a8fc104f0f752bca0e9347d17de72e0
prerequisite-patch-id: e053834e5bec411f5c512b63a3528e49aad11ee2
prerequisite-patch-id: 4fdd195c0b3fea537144ac8d82bb40a38cbde117
prerequisite-patch-id: cc716fef97d6c25c0589d7269b8f34e04ea96216
prerequisite-patch-id: 20ff503abaf2fcaef4328e1f8009ed3df242bad3
prerequisite-patch-id: a0d80e8f49401dd79a7e4dda2517e00228aa3087
prerequisite-patch-id: 2368af876ec7c643d9765d3fb1e9bc4991023a18
prerequisite-patch-id: b70d5648790458e72db82e26b180bbd7301469b3
prerequisite-patch-id: 92be1aa6f95b2a5795df84e11a602e97a41b2938
prerequisite-patch-id: 86625bb109da618cbb8aef07fa717257918077b8
prerequisite-patch-id: 2016c6cd5e0d51daddada37232e3b99c8f4ad77b
prerequisite-patch-id: d323362e84d3991bd949745579aec34897620321
prerequisite-patch-id: b1571de42ac7dcf0fe8ddb77650a656244ff751b
prerequisite-patch-id: 44ea2393bc4df716427cbac9b7f080a683ba1c0b
prerequisite-patch-id: c968c5b557897767bfc2629de79b1ede8ab48767
prerequisite-patch-id: 221800199a94e12e928dc9606c82b6eb33cffa3a
prerequisite-patch-id: c76d8055f620e0b5fa81101a31db08fd5a60e773
prerequisite-patch-id: be0027a934451be02b1c4653bac8b6bc2ae2bd85

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


