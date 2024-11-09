Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D525D5E388
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0TAscultBWfpxXBV9mGtO8Oc58VDQvYlCayV4b4ArM=; b=Dw7D8U2XJTBUGiQB4mwq1+AUaa
	iPqmxaUMQfxmRhLHCqriYEV2GhRvuY+KH3dQGgSzWsg+ei71/nbruQGRRDkTEyL2IbCwnX+Yq5tdn
	2CalZaDUg9MJh2dlY89v7g4D0jaHzbROdepnichGKT3UlsU/beOoTZK6bTqe7fpSYub6sMuq3AtmS
	rKl6jRJfwjFgo+9MlIUHUL8Lk8KKJriyVqt+oMtCsWyXgTppIMpagj6+Gceq1TiD99ORe1fO59NwY
	ShLuyKkmK1qCVAgmzS1W6EitthFR3aAf+Fiogn3NrcOC046g+ey2hjXyMLVzVuCqlMp8y35HkK65v
	TLSGeLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uaL-0000000E62u-1gHz;
	Sat, 09 Nov 2024 23:09:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uVF-0000000E5Ua-3IGt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 23:04:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c805a0753so33236935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731193465; x=1731798265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0TAscultBWfpxXBV9mGtO8Oc58VDQvYlCayV4b4ArM=;
        b=P4beboGhiyOaHZPNVQX5hWeX/IGtqJ9xBLtLJEwqaEOWBshj85QxIew1k1q+HfJ7gz
         x4yb3hlnghK29xe/9hXzS56FNZntB5x2irvmLBdN/+V4V0XZ1UsCgDz6/Jgz71HjeLgt
         bEQP+h5VcGKdw3/x2UP0lMEN4qBa8g2BDW9vYbUmIYon0MRJFrKi7vfridaZvkfxHCwp
         7DTzgwU3IJufRdw2DQQO58RxwBwYP6zkbOR8BEmmzAouu5ufBKVK1Uv46Vxi+SNsFT4j
         k15Pnoyk+7rlXDWUz4nn0sA2UJUhE/maONV1sG62GV/FJi5RH2o/20UCgBu0TGL8hi5I
         PSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731193465; x=1731798265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0TAscultBWfpxXBV9mGtO8Oc58VDQvYlCayV4b4ArM=;
        b=osZ8fW04lRiUcx4JJEHD/ojtSa4FWXh/Cpx3LM7diz970U7vEMvOz8IFM4Q4G/vOCO
         IOQefw0CykwXxVkkYIZTAchfkkr89etZsPLUDQOKVsIz21DyCuCJe8ofsqQ+ZdiPx6jZ
         rtxMBo4X9jSZF38TvlLQIKAL5Kgz7VLVWuMdeE6p6UC6+oE0AQSiMU0mZ6hR3UV3NxxO
         l61VOhmjws0vENbVKZrL0bdlA4smKRlpDLd04ICHRmnqVsLOdlE4sQ/pfjYtkFc2ncs0
         YKTfIRAAw+0+WXcQ2RzDYtb14Hi1rwlm7q2F+/ddHUN/qm3mmRVknF01QPoejhIYCVch
         MQTQ==
X-Gm-Message-State: AOJu0YzCpFN0hlXoYSJMFD4rAWSjFYC3Z6PjzgNfxsqJQKU7B+wqiLju
	GstpDJKll8PGVMn8EbwdR7FWpiqsidHm697cR77cxx8JyCV8GYqW
X-Google-Smtp-Source: AGHT+IEEwko2sZK8zp7cWYH3ediZKHQGh64tWJ48vZuXxcd/8ql8CRgM/uW3JOJAL4MckDlVfhYSxg==
X-Received: by 2002:a17:903:1cd:b0:205:8bad:171c with SMTP id d9443c01a7336-21183cd15bfmr90934925ad.12.1731193464741;
        Sat, 09 Nov 2024 15:04:24 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb50bsm5847991a91.53.2024.11.09.15.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 15:04:24 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)
Date: Sat,  9 Nov 2024 23:04:02 +0000
Message-Id: <20241109230402.831-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109230402.831-1-wachiturroxd150@gmail.com>
References: <20241109230402.831-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_150425_846201_A7EA318C 
X-CRM114-Status: GOOD (  15.98  )
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

Add initial support for the Samsung Galaxy S20 FE (r8s/SM-G780F) device.
Its launch was in 2020 and also based on the Exynos 990 SoC.
It is only configured with 6GB of RAM, although storage options may differ.

This device tree adds support for the following:

- SimpleFB
- 6GB RAM
- Buttons

Signed-off-by: Sota4Ever <wachiturroxd150@gmail.com>
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
index 000000000..6d0b5f715
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-r8s.dts
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 FE (r8s/SM-G780F) device tree source
+ *
+ * Copyright (c) 2024, Sota4Ever <wachiturroxd150@gmail.com>
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
+		      <0x08 0x80000000 0x0 0xc0000000>;
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


