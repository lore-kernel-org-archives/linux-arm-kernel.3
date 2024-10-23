Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27124D0BB47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AX+cZKl5XEc3DMRwSLMsFqqUE19e2NM6vk+Aym6iSqQ=; b=lPV6ncd1rN1IyowKfv5zL7UbqD
	vzKx81drhqFvT9tRCVePCBwO5Gl49Hw9ItiH+M9kmodPEk/VMThLsF1piT8xx+5RPQ0LkHcowt5FC
	54EcBgf8C3cwsUno8wywqrXK9RmUChdSyx/dqGH/mYrh2UZRRFGHcMbUrLqy1TkSnxkEoH/dI51RQ
	dSGrWLGeQ13VMElQfTeY5SdXiAPDwbP6T3xnQFKglJ9uwX9aXuUi6QCN8jdk5N/g3QXLj47hor7LB
	ghL4GoG8xGUWtGGLj1BBjYDcEj8Q2OpjHgcvOh/8ZJQ3x7FP0k2zU83vtL5TvbFeF+IQP7Vx+WaIu
	txE8+P8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kJW-0000000GB4h-480d;
	Wed, 23 Oct 2024 22:58:51 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyu-0000000G71B-15hw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:33 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9a0c40849cso32198566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723050; x=1730327850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AX+cZKl5XEc3DMRwSLMsFqqUE19e2NM6vk+Aym6iSqQ=;
        b=mnyJsbJBRxsU+0uza8t+Akg/+bvtBe4I9ik6aaX9p0ixDsBwI9QP7JxzQ9sA0OsmyQ
         +cS4cW+hA8hbQzcZRjDgWwj5AEV0dCTsaTM9YBtZceDshdeT9HhjWF1yLBkpYhPVvGHJ
         yJHCmuD7QMJiAq/Iw9q7Q9sm/juqIYhS6DXD/pETQeB+h7qsPywHQ0dRly6Y1Qa8dWBT
         Kzv+nPp5ceEATpyX85d+mEeQYlDT6y83kcWcc9X8RoD13cc/UfXJBRhDCLpkZ4quo4ra
         cbxfUpOIJOuuDhvtaDX34dGGzUpMICB3S8PUyUqs8ZQUnoY5dMKsuJ9vkSfXymY19Xdy
         Xwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723050; x=1730327850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX+cZKl5XEc3DMRwSLMsFqqUE19e2NM6vk+Aym6iSqQ=;
        b=CE8ONfTk2KLidSTGriz2D2eaHTeLARG2O9QBf5GuvShW2vyx+w1tKkEpAI2BsSQhYn
         cLtofLdHwavqqaM0TI2l5TyAnj2vaTadia2bRHEFq0bKOGlEj1vaODI7FzeoJ0BDNhWo
         4A5NS5o4Fd8ast0SRQcXzs/XmwAbTGEY36UvsCxe5/s5B1OXD/EjZluR/rGAVhDKwXRe
         a7Aq/4UC2K0o9n8tDTX1QTOzFX15972ES+oT84ySwNuA7+GELXljZevtXrD3HGuSS1E+
         d3nvwaXeu/Z+tnsvP79lzsqumgyjimkA6B0aveQx6uSo3UGy7bSBqkLU3mlq/fUxazfF
         gqtA==
X-Forwarded-Encrypted: i=1; AJvYcCUYAcgibwJd4pM2+ZQbWaNSFlW9EfSaluyEphZwgjcwB/eGagIB1HIKs40KtpOtya13mxFiaA4TKq5onPj6eSoe@lists.infradead.org
X-Gm-Message-State: AOJu0YyRxkvDkDjShYcE/b5DxQLgoSy+/ikzC6HEOJ39Q6dLBAkoAcUV
	eIAtrwdMMc3aKPrtoEJ/b8zKCgNaBowGv38tAcr4lG/y34QalpB3trtdp5ubhts=
X-Google-Smtp-Source: AGHT+IEz7HfZTewz5b+n8ON3omkJnOW3c4z1DCw0FOB98fFAPZeutFcm1+iZOYPfU9psjdpc68Nk/w==
X-Received: by 2002:a17:907:2d8c:b0:a99:f8a2:cd8f with SMTP id a640c23a62f3a-a9abf9682bemr399570466b.64.1729723050129;
        Wed, 23 Oct 2024 15:37:30 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:29 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:43 +0300
Subject: [PATCH 12/12] arm64: dts: exynos: Add initial support for Samsung
 Galaxy S9 (SM-G960F)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-12-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=4396;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=uGxvRrGiZ9uLBWYdiZjpDfcJUgUDjLtTL5MMaS3Y99c=;
 b=qPBGU4g4UzTmbyW8K01GZbAhJ3thwrS3nfygRW+CZyRP6QN6HO9I+K97XuAksgJIsecePUf7I
 rEf03pG5egjBT1CsyGfHrc9Ut5Fp/ZIomu0fA2F+mFTrWbl3/YBjz9p
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153732_348619_8D8B741D 
X-CRM114-Status: GOOD (  15.58  )
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

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile               |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts | 119 ++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7a934499b235892eef38cd926905e02f0ce08278..6760b3d59e819fb52bc8cf4dc6877a0b9db9ce47 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos7885-jackpotlte.dtb	\
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
+	exynos9810-starlte.dtb		\
 	exynos990-c1s.dtb		\
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
new file mode 100644
index 0000000000000000000000000000000000000000..f3a1910402b8d686dd7bd156a691ec541e10ad08
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
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x3c800000>,
+		      <0x8 0x80000000 0x80000000>,
+		      <0x0 0xc0000000 0x20000000>,
+		      <0x0 0xe1900000 0x1e700000>;
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
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_voldown &key_volup &key_bixby &key_power>;
+		pinctrl-names = "default";
+
+		/* In stock firmware used for assistant. Map it as a camera button for now */
+		bixby-key {
+			label = "Bixby";
+			linux,code = <KEY_CAMERA>;
+			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
+		};
+
+		power-key {
+			label = "Power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		volup-key {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+		};
+
+		voldown-key {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&oscclk {
+	clock-frequency = <26000000>;
+};
+
+&pinctrl_alive {
+	key_bixby: key-bixby-pins {
+		samsung,pins = "gpa0-6";
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
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_power: key-power-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};

-- 
2.46.2


