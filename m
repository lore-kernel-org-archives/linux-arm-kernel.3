Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E868C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+sHQh7xsIPCcx3DDu2sbd8ZKJKkQ8GLklEL0hevIC8=; b=bf025EQHphHKD6sx9kgScnbOPw
	VKSPTbS+pvdWNx4LiXc4io/1xhRFbYm+19RWK11vgjtonhtfkutBBTOQAZRcFviO7k+PijzYu2BEF
	VMzEbspUFM6PcVsBFG7EOoRsSC/fVn76OOiBkVBI4pkCKnbm4SsqI0edbjh4NrR++GWgRkI0theaf
	CwC2imRYjMh9fPuPQUoOrhsQ13vy6YmmM3X2neNMTrrKyERBLdA+vdlNNxMb+I913UMR2V6xQs0Sz
	mmEDrkC7QZSOdtXhFS2KJircsc8IlRIrAhWKsJ2Wul7yvPUzhnX5SXQ/astQOH5GNylqHW3r8UQxy
	YFmmX2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbwB-0000000BrbZ-18U8;
	Tue, 14 Jul 2026 12:08:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbw4-0000000BrYT-1eTP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:08:31 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-381891a9525so4562359a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030908; x=1784635708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+sHQh7xsIPCcx3DDu2sbd8ZKJKkQ8GLklEL0hevIC8=;
        b=SfNv/3uxmgGgVuguU3P0EEEU7z0EQXpjMbXM2eo8IqZjD6ufkNm7zDPKJkmTSzxOkM
         ljf1CZawXh+yvBm2RhaUtuJPe5XS+hKQ3zVLv/hxvFWwlWDVtU4GqQB/wwT6ro1KeBSP
         fM2LN9gE/a23gpNS11P3Fln3m9cZT9IH5Me7pvCMIwdLxpaqR0tmv8B1BmmoV1cvZjmS
         6kNdNlhqp9h27crH699YMkWnfxsieTVkEREH9C+RVAcLI0lqKZ41DEXD0fOABSI1qfgO
         QGWKILDrjuOeIjXSZL6YATf9egg0++KDmZkz/MbcrRP6OsS6fpHUh6zT+4Qy3B1pIKzy
         fWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030908; x=1784635708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+sHQh7xsIPCcx3DDu2sbd8ZKJKkQ8GLklEL0hevIC8=;
        b=EW2xS69Z8kseONVPY4HwJKs9taFglBuRsal8wwAcmIBtbuHKP+2cmkDEDvI4/7gSUQ
         zqNHl4FgBR2eIipfHK9Y3VJJGAi2biRRI3ACK76kctu8DbsygZ9ZFGuFtz7cTaaytzya
         hGIa60sPyTy6Xdv2kNobrAQLvOH9KxoXMige38a7kwwG9w4seCVDYw5dVYv0ohw11msg
         2xwihHOSOqr+QYPpBfXwItDLEVTUPwYQWcrxiFFwFXSyOPeajgO1bIA0y6W8Jbus+buF
         cK1djJtAYQYDJbo0DlWWQxLzYPSIyPQwd4wKvwwzX7CpXufh9hFuhSFPYlswdeTa9TJS
         On2A==
X-Forwarded-Encrypted: i=1; AHgh+RoJhU4ByKvUVfFgO0sxN2AqOG1Y/3VKTrekNb+Fhif9S+X6zpXETyBtoJmVnjoocw3LBmwf9bNWqlfFbaOOVWUU@lists.infradead.org
X-Gm-Message-State: AOJu0YwS2kE5hvbLY+pbdfCczOv/NEGvqoqkPp13VGpESA5EmAapTemZ
	gyPIL2eYHvqK6bBL/zSftyns5xbkzehqg+oDxXcTFy2Z8hXq7Ie833QW
X-Gm-Gg: AfdE7cnFulpM532/4cK5WgDkTpEvR6+BFpfsN6eTH9Y04ZsWhAfV/XTdd6x8z4Uw5nB
	CM802grG1iK1vEiIRy93r1iodLsScVzcXGk4FyQVRW2vzOGB6bQd9y40jya3XFyg6F8knctojXp
	Nr4hb3qglmn6Qgyx2vqEPtmQHHDLqYkDIKdwCsABT41p62Vk2bNQyDU0nV6B9FCfUneKut8q6wB
	DKDrcmmAil6/ZXZhpjUgZnQwQAo+KRX6mkC9kWeKTWJFR2omk9USXDii0dpiVFqfSylTXtIOW+s
	4fy8E7FyrbNG2RxEKTvjc43F3XdMFJlCMBRp9M8f601EqAb/gJ1giMt8ilkwVXJPOOC//4htxXp
	UtfVIHKdsv6VNOz7xzNfpJcqdQsWvYewf6kC5NJMvUoqHBPg0BSm8Q0hhTw2KxsD466axuz2thc
	gSuXuBStWlHYkvTKY3LUsq2n0+RNo/cVPnOkxgFJaXFB0Fmnv548rxlwW6TQY=
X-Received: by 2002:a17:90b:180d:b0:37f:9ce1:736a with SMTP id 98e67ed59e1d1-38e1af3481amr2454300a91.32.1784030907614;
        Tue, 14 Jul 2026 05:08:27 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172dc530sm1384425a91.8.2026.07.14.05.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:08:27 -0700 (PDT)
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
Subject: [PATCH 2/2] ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
Date: Tue, 14 Jul 2026 20:08:16 +0800
Message-ID: <20260714120816.1504058-3-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120816.1504058-1-chou.cosmo@gmail.com>
References: <20260714120816.1504058-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050828_468194_A88BB1BA 
X-CRM114-Status: GOOD (  11.53  )
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
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 289 ++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index a966be69f..86e2b5aec 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/usb/pd.h>
 #include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/leds/leds-pca9532.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/i2c/i2c.h>
 
@@ -113,6 +114,58 @@ led-7 {
 		};
 	};
 
+	fan_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "fan0_blue";
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_leds_alt 8 GPIO_ACTIVE_HIGH>;
+		};
+		led-1 {
+			label = "fan1_blue";
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_leds_alt 9 GPIO_ACTIVE_HIGH>;
+		};
+		led-2 {
+			label = "fan2_blue";
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_leds_alt 10 GPIO_ACTIVE_HIGH>;
+		};
+		led-3 {
+			label = "fan3_blue";
+			retain-state-shutdown;
+			default-state = "on";
+			gpios = <&fan_leds_alt 11 GPIO_ACTIVE_HIGH>;
+		};
+		led-4 {
+			label = "fan0_amber";
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_leds_alt 12 GPIO_ACTIVE_HIGH>;
+		};
+		led-5 {
+			label = "fan1_amber";
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_leds_alt 13 GPIO_ACTIVE_HIGH>;
+		};
+		led-6 {
+			label = "fan2_amber";
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_leds_alt 14 GPIO_ACTIVE_HIGH>;
+		};
+		led-7 {
+			label = "fan3_amber";
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&fan_leds_alt 15 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	sled1_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -129,6 +182,22 @@ led-1 {
 		};
 	};
 
+	sled1_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled1_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled1_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled1_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled1_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled2_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -145,6 +214,22 @@ led-1 {
 		};
 	};
 
+	sled2_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled2_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled2_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled2_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled2_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled3_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -161,6 +246,22 @@ led-1 {
 		};
 	};
 
+	sled3_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled3_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled3_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled3_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled3_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled4_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -177,6 +278,22 @@ led-1 {
 		};
 	};
 
+	sled4_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled4_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled4_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled4_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled4_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled5_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -193,6 +310,22 @@ led-1 {
 		};
 	};
 
+	sled5_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled5_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled5_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled5_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled5_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	sled6_gpio_leds {
 		compatible = "gpio-leds";
 		led-0 {
@@ -209,6 +342,22 @@ led-1 {
 		};
 	};
 
+	sled6_gpio_leds_alt {
+		compatible = "gpio-leds";
+		led-0 {
+			label = "sled6_amber";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled6_leds_alt 0 GPIO_ACTIVE_LOW>;
+		};
+		led-1 {
+			label = "sled6_blue";
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&sled6_leds_alt 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -401,6 +550,24 @@ sled1_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled1_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","SLED1_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled1_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -487,6 +654,24 @@ sled2_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled2_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled2_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -573,6 +758,24 @@ sled3_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled3_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled3_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -659,6 +862,24 @@ sled4_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled4_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled4_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -745,6 +966,24 @@ sled5_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled5_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled5_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -831,6 +1070,24 @@ sled6_leds: pca9552@67 {
 		"","","","";
 	};
 
+	sled6_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","SLED6_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+	};
+
 	sled6_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -957,6 +1214,38 @@ fan_leds: pca9552@67 {
 		"","","","",
 		"","","","";
 	};
+
+	fan_leds_alt: pca9532@66 {
+		compatible = "nxp,pca9532";
+		reg = <0x66>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"presence-fan0","presence-fan1",
+		"presence-fan2","presence-fan3",
+		"power-fan0-good","power-fan1-good",
+		"power-fan2-good","power-fan3-good",
+		"","","","",
+		"","","","";
+
+		led-0 { type = <PCA9532_TYPE_GPIO>; };
+		led-1 { type = <PCA9532_TYPE_GPIO>; };
+		led-2 { type = <PCA9532_TYPE_GPIO>; };
+		led-3 { type = <PCA9532_TYPE_GPIO>; };
+		led-4 { type = <PCA9532_TYPE_GPIO>; };
+		led-5 { type = <PCA9532_TYPE_GPIO>; };
+		led-6 { type = <PCA9532_TYPE_GPIO>; };
+		led-7 { type = <PCA9532_TYPE_GPIO>; };
+		led-8 { type = <PCA9532_TYPE_GPIO>; };
+		led-9 { type = <PCA9532_TYPE_GPIO>; };
+		led-10 { type = <PCA9532_TYPE_GPIO>; };
+		led-11 { type = <PCA9532_TYPE_GPIO>; };
+		led-12 { type = <PCA9532_TYPE_GPIO>; };
+		led-13 { type = <PCA9532_TYPE_GPIO>; };
+		led-14 { type = <PCA9532_TYPE_GPIO>; };
+		led-15 { type = <PCA9532_TYPE_GPIO>; };
+	};
 };
 
 &i2c13 {
-- 
2.53.0


