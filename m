Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA03C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/W1fqK7GrdRxdJRx517NJ0wj5HQ/50koQW2iNa5L7Y=; b=wEYvVXBGgI4Wh+dJP8N/vnxSZB
	6jM7b8Tk1j0xuH4nPvot7PoZo/I8tzuasHVYtSCeWbOWmyQAPhfjaMUWVDLFsv2NDVJ/7dRFf/IhC
	hJB2AnbRxJP1PHdEHBD91r8SkurO0iagj2DQiFPu4bItcdN38NRTjdknAFVA7ZyY+4HR9Jr9gbTPk
	5rcIJ4aFm0bKP8VKlrBl1L0IatkINKnXXVwWDW0UZSaFSKDgfbkauK1dUVKRhjfO95656ITPuXz/w
	+P3vcXT4XwrV13eeANOihpDbpWWWiwMuQlsEiqYormyOlzCXasOtOc+1LqKvqjJHWJlhU0XptVSUq
	V0ETXC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2h9-00000007lTr-40Hi;
	Wed, 29 Jul 2026 11:43:31 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2gu-00000007lLI-1vG0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:43:17 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so866941b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325395; x=1785930195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/W1fqK7GrdRxdJRx517NJ0wj5HQ/50koQW2iNa5L7Y=;
        b=EGuOu1wa++3oyEY+NuNZ57SayHCJJ+xk1DIKWV/n7lcat+zkKllU+gopoVQcL+CPxi
         uuP2H1YHa7tadXglu36iZtrEmZVXHbBBZvOJ+MeGynU+Jt1e5Muw2frTB+ol04AL59PP
         YUQQ5NrwreEHXEyjH6dSezH84zBz4wWrjye80u+W75NI9o9ixHehZjGgfJbxtqJg5+nW
         PGlWZ5GNozOura97WDP47jHHRX+yvLu0v7WcQND8AeZKE6xtTwN4MdlO1dwg9JlEgQC8
         PKbLXVWk22OF6k2/v0B+AD4MaE7bSHclNya0wjz8xdDLvyOZRjF3WhOGNEnnQt7jVqwt
         TQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325395; x=1785930195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/W1fqK7GrdRxdJRx517NJ0wj5HQ/50koQW2iNa5L7Y=;
        b=NQTqV3fTRoI4IpNqjW4WOduFfNeuuXgHP6Seggka2Juu1EmWAOVNmldWFqcS/WJj77
         6X+575CHOmwqONYNi/IzoVR4Ql/cRYuLCO0SYyasqM6XWJMF0IRgiunpeEvyipfi5/gc
         Iv4d3BOUK4nZzqBk7XRmESvBQOBjAg+omw0A9zTQGPpdmnhJoTKPOzsdqgTOXEsPEHoX
         C8iFa1w30CL+Di01fvdwZ8qYYbvASvCMImtoI/U/4PKyVs5oZ48R463+MoaMgaB5jYqa
         gxyJ0uLtfkHGCZau8wM9UDpaPtCbSlv1k8/k9HyYxYNwBTTWSYaU1I9G5GJmC4bfqKl5
         WYkA==
X-Forwarded-Encrypted: i=1; AHgh+RrojQGcl/Higcbqo2jGw1eVm3wbWD3DnRa68e+C9UD3IAcQ+1/QAN6jiELviy6jVPduZGRdhWcpsCrSKqQlVPbc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzd2DYwjrEsNPoKLMlSMcC58FPx46azh+wsiX+kcBS5zayZaed
	pdZ/K9XAl1G0MSLT5AkhH+/Cev8HsmltsGurY8kqmrUFh0flXH+ZaSe1
X-Gm-Gg: AR+sD10zBUlGoxLp2c+MW+UFajppifd+9LrlPLxdPJ5JDEhMBkbFBCtxiUQc5YjMWah
	A2gZDuJ/ICbZIcIskWHiBSm7fFYcE9PGIvQLOR5uH0Wjp4RgqSYr+4jf8+BaItbpb9TloNzoQCE
	zsJQPquJaKES8yPkWGIX+5C3m660WUHuDyeTSJCAAcqLcD2qVYVMYIX7SMqRm77khv7nKIw6sMh
	5HVZZgHVY7Vz8UFe3hnmidAQEu7VF7ANUZ44LvWnfTf+DbG0R4AGOrZTanxBWTf4Qu9SFRz50YH
	UCDKAIAv8O+yJ89Ac5Tzf1jBWMY+Jrri1SRXCYUIY3GXaTsbf6Ex4FwdO9wqUJnqtTG3ooZ/15x
	Jby0/wgJuNDdXw0FqukC8+6351k4LkXFtLuZAjeDGSESaZ33cdzN5wqHUBkHVjd8Qp/Sj4qll+n
	svi/KfK6Fh+hogwx1/D6IDSDhKBqSwhUuq3kDxQJnhFZ1N4CX8tKti5qOvHvlSRgm06aFx6hXQg
	B8wzdk5hYnD5WXy8NAwJgL9EH5k8XNN8nU=
X-Received: by 2002:a05:6a00:298b:b0:848:3f91:da82 with SMTP id d2e1a72fcca58-84e93258a6bmr6621278b3a.32.1785325395379;
        Wed, 29 Jul 2026 04:43:15 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03cbd1csm1263532b3a.53.2026.07.29.04.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:43:15 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 3/4] ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
Date: Wed, 29 Jul 2026 19:43:11 +0800
Message-ID: <20260729114312.3947300-4-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729114312.3947300-1-chou.cosmo@gmail.com>
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_044316_530574_656689B5 
X-CRM114-Status: GOOD (  10.74  )
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

Add alternative PCA9532 LED controllers at address 0x66 to support boards
populated with the PCA9532 instead of the primary PCA9552 at 0x67.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 422 ++++++++++++++++++
 1 file changed, 422 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index e1fa3a18ea5c..3da1cf9bbb99 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/usb/pd.h>
 #include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/leds/leds-pca9532.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/i2c/i2c.h>
 
@@ -86,6 +87,66 @@ led-7 {
 		};
 	};
 
+	fan_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "on";
+			gpios = <&fan_leds_alt 8 GPIO_ACTIVE_HIGH>;
+			label = "fan0_blue";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "on";
+			gpios = <&fan_leds_alt 9 GPIO_ACTIVE_HIGH>;
+			label = "fan1_blue";
+			retain-state-shutdown;
+		};
+
+		led-2 {
+			default-state = "on";
+			gpios = <&fan_leds_alt 10 GPIO_ACTIVE_HIGH>;
+			label = "fan2_blue";
+			retain-state-shutdown;
+		};
+
+		led-3 {
+			default-state = "on";
+			gpios = <&fan_leds_alt 11 GPIO_ACTIVE_HIGH>;
+			label = "fan3_blue";
+			retain-state-shutdown;
+		};
+
+		led-4 {
+			default-state = "off";
+			gpios = <&fan_leds_alt 12 GPIO_ACTIVE_HIGH>;
+			label = "fan0_amber";
+			retain-state-shutdown;
+		};
+
+		led-5 {
+			default-state = "off";
+			gpios = <&fan_leds_alt 13 GPIO_ACTIVE_HIGH>;
+			label = "fan1_amber";
+			retain-state-shutdown;
+		};
+
+		led-6 {
+			default-state = "off";
+			gpios = <&fan_leds_alt 14 GPIO_ACTIVE_HIGH>;
+			label = "fan2_amber";
+			retain-state-shutdown;
+		};
+
+		led-7 {
+			default-state = "off";
+			gpios = <&fan_leds_alt 15 GPIO_ACTIVE_HIGH>;
+			label = "fan3_amber";
+			retain-state-shutdown;
+		};
+	};
+
 	front_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -162,6 +223,24 @@ led-1 {
 		};
 	};
 
+	sled1_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled1_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled1_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled1_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled1_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled2_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -180,6 +259,24 @@ led-1 {
 		};
 	};
 
+	sled2_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled2_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled2_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled2_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled2_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled3_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -198,6 +295,24 @@ led-1 {
 		};
 	};
 
+	sled3_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled3_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled3_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled3_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled3_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled4_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -216,6 +331,24 @@ led-1 {
 		};
 	};
 
+	sled4_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled4_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled4_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled4_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled4_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled5_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -234,6 +367,24 @@ led-1 {
 		};
 	};
 
+	sled5_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled5_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled5_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled5_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled5_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	sled6_gpio_leds {
 		compatible = "gpio-leds";
 
@@ -252,6 +403,24 @@ led-1 {
 		};
 	};
 
+	sled6_gpio_leds_alt {
+		compatible = "gpio-leds";
+
+		led-0 {
+			default-state = "keep";
+			gpios = <&sled6_leds_alt 0 GPIO_ACTIVE_LOW>;
+			label = "sled6_amber";
+			retain-state-shutdown;
+		};
+
+		led-1 {
+			default-state = "keep";
+			gpios = <&sled6_leds_alt 1 GPIO_ACTIVE_LOW>;
+			label = "sled6_blue";
+			retain-state-shutdown;
+		};
+	};
+
 	spi {
 		compatible = "spi-gpio";
 		#address-cells = <1>;
@@ -430,6 +599,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled1_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","SLED1_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled1_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -520,6 +718,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled2_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled2_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -610,6 +837,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled3_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled3_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -700,6 +956,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled4_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled4_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -790,6 +1075,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled5_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled5_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -880,6 +1194,35 @@ eeprom@54 {
 		reg = <0x54>;
 	};
 
+	sled6_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","SLED6_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	sled6_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
@@ -993,6 +1336,85 @@ tmp421@4d {
 		reg = <0x4d>;
 	};
 
+	fan_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		gpio-line-names =
+		"presence-fan0","presence-fan1",
+		"presence-fan2","presence-fan3",
+		"power-fan0-good","power-fan1-good",
+		"power-fan2-good","power-fan3-good",
+		"","","","",
+		"","","","";
+
+		led-0 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-1 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-2 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-3 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-4 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-5 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-6 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-7 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-8 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-9 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-10 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-11 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-12 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-13 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-14 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+
+		led-15 {
+			type = <PCA9532_TYPE_GPIO>;
+		};
+	};
+
 	fan_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
-- 
2.43.0


