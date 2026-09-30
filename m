Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB92CA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+egFjTMnPYoDlT9Bcryc5S9/HI1Lw9q9oWEv1D5Tzbs=; b=guWt9MZgjTDPwfSAV4k6d76yid
	nQkBNtIqXTnSwDU/9441foPfBD/wknoYlJMXV2jLsI2IC1wWSmrCmVZoqs1pqGxuIGyqry4QpuPwI
	yBQdslWRCRSqCkHEwY2MN9JqGPAN9VNRL5Ump9Z4VM1g+7sNt/k6zwnt2Iiguno1qqGqPHJFWbCkd
	Uwf5Jt+DAe0L5E0v7sBI0WL9P7DY98C74r0p8EkRrnoc593QTbpCIjBFh8w28mpF4C1MS7SgDxpRM
	FkD5z6WlUpZ3Y3t19GgARWfAxbzStvcssmSLho3hc1GNoVX8PzzLq+TCXdgt4CPcRJvbZEbYtFf1x
	oneYGvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsLD-00000005qT5-0RCW;
	Wed, 30 Sep 2026 11:19:15 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsL7-00000005qR0-1wS8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:19:10 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469e25400so2098673b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767148; x=1791371948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+egFjTMnPYoDlT9Bcryc5S9/HI1Lw9q9oWEv1D5Tzbs=;
        b=JoeqTlNUHxw+KCWROjtNvpyFG8SmfFiyBSDQfVqKvpMJamFap8CogvQgAlV0GBAn01
         z31Ixb29z6yABpKc1cO4sVQt8sCe+wqADNZ4fldCQVIvmG6BgmPVvj+MdJTT0psmODpY
         e0PBXKNe4GnLxzTtZa+79n7HnTdH0od4mlXVEUDSiCOolmSlZd/GK5mLKtVGr6ETsgFX
         mm1Kc/lJBCOPM+rCuZn58/lUQd14eZqDnRbBoG8iq8+D8CjHRmfdeTkYz45aoB8nd5xT
         WZhj0P34jw3sZnldKuM1Bh3rJgck298bbEmBG4r8h+m2eJK+eonBjOfmQv0WWgL1yf0x
         HnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767148; x=1791371948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+egFjTMnPYoDlT9Bcryc5S9/HI1Lw9q9oWEv1D5Tzbs=;
        b=mLxFEfiiW72OhAhGN9ATvhFHlA8U+sR/qBBatbvDJwesqIirDhOUdVl1xm0K6Q+gsW
         7ouml9BeIKfataPdfux6npltRmFUR4rMLsvqC306AI+4CcmljjeNx4aLMp+Z90xoWDdO
         Yqf4Z1paDtzmdjRHQB3mvxXX/msvKlDDEgrfdxyyEY4BaEfMV7ISmqZ4DaA47JT+lPOC
         6AtAnYdD1oqlR4he49pbdo09rC1fwCNTnegO5QHV7uuqxJWBOZ4GCrjb6R8MigR1Rrag
         TXRDuF0PvvG2oojct7Ak/u2SxMHzlNuAwm/dBK7W3EK3wVV1cNA4dXVKow+6oers42IC
         ibVw==
X-Forwarded-Encrypted: i=1; AKwUvBxaVE95ua/psMcSIoWfehhLHyb8gVOn3zaSQytLXRTr648cs3DOttPsdnE2uIFT5VqNSMbT4sQ2dQd7G42GSUmE@lists.infradead.org
X-Gm-Message-State: AFq9FYKXN54pprmDiDRdzr0+hYZlVFBw26/lwhnnRNUhFUrz5sR95LoM
	7yz9VDEKcFtFb3CGV/wK2M8T4unCZDlS0oykoHDtqRcRhj/3cGAV/oq8
X-Gm-Gg: AYBFou0lEYAnCq0zAUOZMPhCPSugR5wWCD7cuW6CoJlfBpFAscvtesHHDwAlBZk+kVW
	MZPCl+DclxHT0S9bPe8IwnEwPSHZnqpfRe0ZPeWwfwRyrzLB5Pfkced0FWE1Wb4SHwSI6B7OYUh
	2228k/NbdlHN2aIAGCz+0P94VE5le9jdVRRuj5PblUM6E+TzccZbrpp+e3lLApP8re/ROOcdNnP
	fKr2bwmnd/Lb8bu+FKEfGCzQxRuUr9Ja0+/51epwJImQ0huPydUh0iKNL0uvlNSJcJ31olaBN0s
	555edUXLd2HtKTMANF1wJaSJpyMzP9TfZngQA2fO5ie8+2vqM25rfiG3PSoycVrjI11D6hkUMPc
	Is+p14fEGe2mctTWW0+CqWrEYHb8J2TLUbAcKfk42n8EvMSpG4t44ZzYW/GgOSMpo3J0Z1aBJBF
	SmJSn2BJm+YKOLhA/e9vDHHnTyrKrP9UNFTKHJLBE1+8OS+2khYxlFnNQaAa+NuQ6nscn1ZLjnm
	aAkwJhzel25OUFU7JOefGQoM1r0lZWGmKvxrte3+VkI
X-Received: by 2002:a05:6a00:b81:b0:874:705d:f649 with SMTP id d2e1a72fcca58-8874bffa3dfmr702163b3a.43.1790767148462;
        Wed, 30 Sep 2026 04:19:08 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:07 -0700 (PDT)
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
Subject: [PATCH v3 3/4] ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
Date: Wed, 30 Sep 2026 19:18:12 +0800
Message-ID: <20260930111813.52396-4-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_041909_533706_C56E732E 
X-CRM114-Status: GOOD (  10.93  )
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
index 4bc436ef3562..1883bfb850fb 100644
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


