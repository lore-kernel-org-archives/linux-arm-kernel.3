Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A97FD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRMz3tNgfToq92lnj2PahqWle5KJcXYV1IdUg20MVZM=; b=lttPWNpkSJFWKxgn+GHLSzv9AI
	KoQTf33Ge0YY8nr1QNe2t99vD/thR3LNmriLA+Yc1s5ZyQEga1Im0T7t/SufkEgLytkzrTBmp23SJ
	iLaJIzUqxW50L/QPWIqKFJ3463RqHv0XnyzjLEVfgdRgCfmMGesuSc8HYVOZdvs0GPUV9kvlsM+S4
	Jaq/bmp2bwJX9k5g0e7Iqy/lXNDGJ6N9aAfMqHjAPWgWPT5aeJ+8Gkk0SMqjkJ+lXbjvcA2Hc3r9v
	SN57XWjzlbDT2vqWpkJKjR/hSRPo12pD0utghF+0FvTHXg061lsY9kJ9cYOlni07v03UayVTiwjK8
	b1P+oPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MFI-0000000AGXx-12Ux;
	Mon, 28 Oct 2024 09:41:08 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxr-0000000ADiE-2fTn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:23:09 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e59dadebso4738632e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107386; x=1730712186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRMz3tNgfToq92lnj2PahqWle5KJcXYV1IdUg20MVZM=;
        b=RVvkOByUadTWqklm26v3GVLS/GFHbbsH/XNz5+fYzsWzkgJnjAOsdZ95nm7Gj0SuBB
         KHXNSe9m+PcxBZXKjzFMbcWJQLjg02Ti+dz/wuPTTO/w+OaiiCuf6jRXn67/1kaIZGmh
         mgjyFxPw/Hvs04K6yrFqCik0Qt1aS4G6rTB44/e+vQl9NhtB1IkM04hSXBc3Z6minSgQ
         Z2rpUVTPXpOGmVAQFWl8pTHshjdmMaTmP3NxpqUiL1SCmD6MhdwTt6hL4pUKtX2ROyEB
         eH+IApygt/sI9EEtaeNjT70V9/WHLGTIWyGSpffFEo/yjsOUBnjJqs7Fa3EkWcfqbUMJ
         EmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107386; x=1730712186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRMz3tNgfToq92lnj2PahqWle5KJcXYV1IdUg20MVZM=;
        b=Pi56/PE3+oCtk+l6PjFdRHdlZs0RXizMDwzL9rK6EaV0cnz0eeUK64UbJVDFOd1uqs
         pMjnXqgnt9oT1+yEbLQK65kXZzdVpWzzctSah+XY4bufnt4808duONe08LBcXQhNLMLL
         69mf4LyacQVW06fydquvlt0nxXMNIfxIlARk/MNZcHYW45hVRvuRDvFNFVwcJmLDsebx
         98l/zhvJM7ZBtEJmS5thHSDDUXJL5ydyZXTiVtqTXWN4WwALjwmlFHtX8tX40p3inTQp
         CtvjEHW6pHKTwz2zzjT0k1GiPOs6oJHMYV/wcZISpQ+aUa9GVOtQi97aV5kftnmHjN7m
         cE+w==
X-Forwarded-Encrypted: i=1; AJvYcCW3Pt0DpXt99jqfQ4MP6TswRs83tcGLjNS/kh7CYXVOrPBeW/Goe855PUJ7IlBF4LqV67/hgmIwIas2AGTzOfFY@lists.infradead.org
X-Gm-Message-State: AOJu0YxlsNE24SUlhNvSWN1jpmF5ag03F1jJbS8Mencn2i3manj72Bns
	ufppptrIXHBnGVF2VLfL/MsXv6SP6SylI+WPNaXIu1hBpNnGmz+E
X-Google-Smtp-Source: AGHT+IHIDVPj63vyJSF9ok7tlM6BrlOS6N90LreALW4rD7T3vrGO/usqjhkRosCLZthMGEjBsZcriA==
X-Received: by 2002:a05:6512:3ca7:b0:539:e873:6e2 with SMTP id 2adb3069b0e04-53b348ec22cmr2446109e87.8.1730107385487;
        Mon, 28 Oct 2024 02:23:05 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:23:05 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:38 +0200
Subject: [PATCH v4 10/10] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-10-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=4449;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=ShfgFHwS78Olczun65h5zSWaB5ZD0TN0sWlkrX9dkIg=;
 b=I6sGro/ueIxdUmYxPHqqK2ZGH2peavdq9gdyqPTF+KXSF4EQYCI98ZyfmGq8/HtDeiek6sx7H
 HuQEA3bqWOJBb9arbH2aRDLgbeLvTGjbUmWdEuvjaG7F7UwprgDZS5t
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022307_756469_2D1B68B5 
X-CRM114-Status: GOOD (  16.05  )
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
2.46.2


