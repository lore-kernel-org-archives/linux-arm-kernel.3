Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81400D68B2B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGt3perR6MKvrKIP+pWiAPIqBuHbAKWRSnzDOTu938g=; b=I7eZGB0tS82hD2n000lqNGLzY/
	YWl1CLHacqXv7iZL2lwF15vz24l1WxbzHVcSxCnor/jP2JY/ZzwJ9cpWzaI0mAzUIX9fFSLWdJiKe
	v1UrarXR3zO3MRkwaeTB8BU0+qAOKf603o0UA07EIfB061m/oWnIXg6rxh/7E0pv69HcaRMs4bNO6
	izQWm3JdJA5y4xTnMWT9wEFwUtPK0h/6B8CQtEotcyhE7EIHUxGdOpTTpiq9SfezEIIhM6rWjg2UI
	7xdXftpgW4iEDiAQgSCQ8Xiy/j6LE0qet0fz5XtZQ4LcIAdvQHjK/Z3yggaP6a7s/TXKS499EHAkd
	uYPzlY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBb4i-0000000AFEi-1HyO;
	Thu, 14 Nov 2024 14:44:00 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBay0-0000000AE4r-2BxX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 14:37:06 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-288661760d3so284291fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 06:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731595023; x=1732199823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGt3perR6MKvrKIP+pWiAPIqBuHbAKWRSnzDOTu938g=;
        b=WZphTTWYU5xL29i8aSqN769seh1TH8Gyk2Zhkg3QsCq7meY+/IVpJXFEkI/gRIJqVi
         raLy3MR5Jihr8kGi7r25K62dtdDduiByAkocd37rN6EOiflMDg+AEd5jjHIBB7AqUmYZ
         meMdlk66qHPn96cATunv8UZ/F9JRbJ2nXBwjYKAH0oD15NElvf9EgtM8d6jN77gesr9n
         fZMuM/nUe9FYst5Bgml6U3/76yhIZ59vwaM25MhxbXlbR0l+mTA34JjJDS8Yole0Km4r
         05jps4PNyz1ul2XOAparURpl4EDuYY9EJCPDIkirPqq1WZ+z9mf99/RCwxu0zjYTPx6o
         SJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595023; x=1732199823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGt3perR6MKvrKIP+pWiAPIqBuHbAKWRSnzDOTu938g=;
        b=l2SjXWmXQBrFpWHoeHY1ebMFpFUbMyq7G6EZrGGs7gjkxVB2wvpAB9E6h11liE1nyb
         Y+pHybmbtCuf5O7QkzZhbzAbk9bNU9Jx+lfvtOGcBFc+MsgvNEER2zwyztWwcH2gelLn
         qhoeGrCXS4EX0Kz0wv1FPbt4FNnK0hG/nnm1YsbAtU5ASPjQ0o4QatC8pGVkSA7iyBoE
         4uGR9CMhd2U+UXUKKbAgxPEfgHmrGcqaoQfiWyFivubHo54YWjGK54Ifeju7rN+gG+gs
         YrMlgowxamgkSGuc9O9W8Ve3cf81R0u0HGq3TV7B0HC37LNfo42QsGfno01CumzuemJh
         DODQ==
X-Gm-Message-State: AOJu0Yyns2U8+860ogEWxGDfEAZkK71DYdJEwPArrJ8X9dVGtHJJk489
	MSIKjgipUDrzl55Q8MtN3wYUgTkq8KVuAlvSW9y0g76oO6TVg9+z
X-Google-Smtp-Source: AGHT+IEqNhhPHGyb7oB+cPPBeJw9s37iJW919hbsr058ZKOG5V8yHEvVE7yjxHXwdc4ny2A8okRAGg==
X-Received: by 2002:a05:6870:d03:b0:261:877:7459 with SMTP id 586e51a60fabf-2956036baedmr20256480fac.38.1731595023281;
        Thu, 14 Nov 2024 06:37:03 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a6eaeea60sm393294a34.43.2024.11.14.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:37:02 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)
Date: Thu, 14 Nov 2024 14:36:36 +0000
Message-Id: <20241114143636.374-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114143636.374-1-wachiturroxd150@gmail.com>
References: <20241114143636.374-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_063704_661886_20626026 
X-CRM114-Status: GOOD (  16.39  )
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

From: Denzeel Oliva <wachiturroxd150@gmail.com>

Add initial support for the Samsung Galaxy S20 FE (r8s/SM-G780F) device.
Its launch was in 2020 and also based on the Exynos 990 SoC.
It is only configured with 6GB of RAM, although storage options may differ.

This device tree adds support for the following:

- SimpleFB
- 6GB RAM
- Buttons

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/Makefile          |   1 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts | 115 +++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 7a934499b..948a2c6cb 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -9,5 +9,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos850-e850-96.dtb		\
 	exynos8895-dreamlte.dtb		\
 	exynos990-c1s.dtb		\
+	exynos990-r8s.dtb               \
 	exynosautov9-sadk.dtb		\
 	exynosautov920-sadk.dtb
diff --git a/arch/arm64/boot/dts/exynos/exynos990-r8s.dts b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
new file mode 100644
index 000000000..b21863bbb
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 FE (r8s/SM-G780F) device tree source
+ *
+ * Copyright (c) 2024, Denzeel Oliva <wachiturroxd150@gmail.com>
+ */
+
+/dts-v1/;
+#include "exynos990.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Samsung Galaxy S20 FE";
+	compatible = "samsung,r8s", "samsung,exynos990";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@f1000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xf1000000 0 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x3ab00000>,
+		      /* Memory hole */
+		      <0x0 0xc1200000 0x0 0x1ee00000>,
+		      /* Memory hole */
+		      <0x0 0xe1900000 0x0 0x1e700000>,
+		      /* Memory hole - last block */
+		      <0x8 0x80000000 0x0 0xc0000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: framebuffer@f1000000 {
+			reg = <0 0xf1000000 0 0x13c6800>;
+			no-map;
+		};
+
+		abox_reserved: audio@f7fb0000 {
+			reg = <0 0xf7fb0000 0 0x2a50000>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_power &key_voldown &key_volup>;
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
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_voldown: key-voldown-pins {
+		samsung,pins = "gpa0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
+	key_volup: key-volup-pins {
+		samsung,pins = "gpa0-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+};
-- 
2.34.1


