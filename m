Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A55CE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqF8zkGZ+2VzBoyfd3d5WoB474c43oRczfanBsCjA+g=; b=syONXTTw00OyEKI5FvvbI/OZ9c
	a38k2Vf/KiTimpUlN8V0R1ekXyXvUHsFaco23RfW9pnAEdNYwEOwo+bDI8IUsSI0pV5kAW4g9Cz4A
	BrNHzIBTVUQlo3iDwhj3GOWze+k4Gj1TmrFhfSzi0VLfKvtdk4g5SnP5EETqwnTeAMoWiVRuozEPU
	HlkD3ytTHaRD6Cu0Wd4fZAVdFjqUpCmDuTilJHrj2E0N6iE3qbM9IPGpFQ8lpAph5pNnQpHKuHpYl
	1yAgYOPbJRYQuDVzu8+pGtGm/tu6+VEtzpdxvgdGA2mgDXMJ77p413wWV8aTumk+uHfW72N3Y08/r
	fss0mFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTd1-00000006WGR-3g9l;
	Sat, 14 Dec 2024 15:00:23 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTZl-00000006Vrq-0P6z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 14:57:02 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so6901147a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 06:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734188219; x=1734793019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqF8zkGZ+2VzBoyfd3d5WoB474c43oRczfanBsCjA+g=;
        b=j3iV+qVAbKd47WAnsFP6t4D0XgklQL//kEEzliU80ymKw1XQwAgtcB4pgLEhYOWP5Z
         k5pmXaIvgJ5rAglZBQR1SjVYxH/6FWy7sCrjC1YlanSF19gPIa+0+U9Npy6zc55uyAXe
         JyGBF6F7CR+ds0MjxPIJt7evWLRr3gLh+tcFCcUGUEBOeMWjjJNMNmCt4u7ojwiH0q/N
         Lnohq9qb8DOKjZIXwILDPjZCFZP5S/ff2Hts7nH+lkmqEdcVj5/C47yYu8Z2p60Ve7D4
         f0q2ItZraTNtnVDZpwc157O/tSiiMb010zHKymWT02WzRzi6Ws4Hmpq0a4qIPv0TO5qh
         iw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734188219; x=1734793019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqF8zkGZ+2VzBoyfd3d5WoB474c43oRczfanBsCjA+g=;
        b=hXxqvhKIudovBZxA9FnbfhV+s1VHUHdI/qz7Q9WiN/pICk8RFGST49O03RD3PMOFKo
         H37bqZRzKP/ik+gnFT8c7IhfHcxS3HtVk4ZM2/RPztAYT/d+0Qg5q8Ey1bYSQkyGiJ9h
         nJS9g7CCu2+o0dRWQPUHZAmFg6YWE3gt7Ke6HZDQqmGkj84plijd/fN88glcgNyWymCM
         O05rGghDZYXMWmxzW8ps9ZShv1DtbOKJx6qZRkrdVhNUSLxD3J7PBU1FFCRwwI2JRH57
         iG8ZltkpnMpqv88Bw/ghZK4Hq4YoUQGNzpaWJMtJz8YCbhCZ7GmAhj9G19InZVoeZDRz
         QEdA==
X-Forwarded-Encrypted: i=1; AJvYcCXXGmwBBsXjjEu6oySrqX8uSsrYawVIoVbH3tL3Ahr2KCX6CHr7JrH1EAaJXG2g0OzsrTJxf/j0uyw96V4rSu31@lists.infradead.org
X-Gm-Message-State: AOJu0YzWD8VH0JYCLiq5ohngy2WvG2tcm3R+k4rFdsnbgTDk9Y0N2Pbi
	B6LYZXdoljtvmmH3JmS5/rRVdtd1t2FROa1yAAZbjqcX5f3NXI6z
X-Gm-Gg: ASbGncu38Koz0CchMTueirPKxAWJuzmO4iPDkZKpX0nHuoTdEm61hB7FbCFyF+ezfFe
	P6aeYU2b9paf3mDq+EFaCd1xNwS9D6dks2vWt2c7fSFvzJxktnt8RXCBZVzvDDowbBKynGFAqPN
	Q4+pT2qlE1vLRpUzl5IzxasekUHVyrPyWCJouhURhDWM9FUAFuAtkH//Yx7tagoTFvnry+mN2+c
	3mT56OeoLGiFpF20LWYHSFpsAX3NAwf0vELc4NloEGhO/wm7lNDVrq0EZYSEQb0FA1f
X-Google-Smtp-Source: AGHT+IFxNg58c28hScps000IQjmxAmucWih6Giz9E/maqKo2D7cuPoqcCZlJKfOujrTr7vMGJ+DIiw==
X-Received: by 2002:a05:6402:5189:b0:5d0:d328:3a43 with SMTP id 4fb4d7f45d1cf-5d63c2238f0mr5933372a12.6.1734188219290;
        Sat, 14 Dec 2024 06:56:59 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f35b5bsm1057698a12.89.2024.12.14.06.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 06:56:58 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 14 Dec 2024 16:56:47 +0200
Subject: [PATCH RESEND v4 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-exynos9810-v4-2-4e91fbbc2133@gmail.com>
References: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
In-Reply-To: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734188212; l=4455;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=uMCyvBcblST8fT6tpNS3iuyS4bo3Z+mJv8estU8DrRg=;
 b=AJDcFzYMPwpHeA6CF5N0iaoMpemqx+KpuAauJgSprpU8ee8Y0ttV7ftg2WNTkL6PkWlqwF/+p
 jjrnRhbkW5XCpBmA5WwUsRx7dZJgkWZB+v3pXc5XRJuZagYJ1NmI0Jn
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_065701_154012_5CD8F1A7 
X-CRM114-Status: GOOD (  15.44  )
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

Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
SoC and 1440x2960 Super AMOLED display.

This initial device tree enables the framebuffer pre-initialised
by bootloader and physical buttons of the device, with more support
to come in the future.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile               |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts | 119 ++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index ee73e1a2db7ea64a0b8e9067a1a264e366f59bc3..f6f4bc650a94db0bc6bc017432e2e3dbba90e8c3 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynos990-r8s.dtb               \
 	exynos990-x1s.dtb		\
diff --git a/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
new file mode 100644
index 0000000000000000000000000000000000000000..fc0ddfee4cd63d2fc53cae3d7447f66d39c134e9
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S9 (starlte/SM-G960F) device tree source
+ *
+ * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
+ * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
+ */
+
+/dts-v1/;
+#include "exynos9810.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Samsung Galaxy S9 (SM-G960F)";
+	compatible = "samsung,starlte", "samsung,exynos9810";
+	chassis-type = "handset";
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@cc000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
+			width = <1440>;
+			height = <2960>;
+			stride = <(1440 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup &key_wink>;
+		pinctrl-names = "default";
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+		};
+
+		/* In stock firmware used for assistant. Map it as a camera button for now */
+		wink-key {
+			label = "Camera";
+			linux,code = <KEY_CAMERA>;
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c800000>,
+		      <0x0 0xc0000000 0x20000000>,
+		      <0x0 0xe1900000 0x1e700000>,
+		      <0x8 0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@cc000000 {
+			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_wink: key-wink-pins {
+		samsung,pins = "gpa0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};

-- 
2.47.0


