Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A08C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hts95YB/ZjUXh8JubeUkj5tnYbtjKOGgkAFrza9S0yg=; b=nZG98EqYg6hIZzjvR1rwJkVVFZ
	UldE/DzZReCgP2ps8Melm7cuykBfcc5PL0b3JGZq8mvapG0wUGG8eY3x1LlGMu5+i0MStASS7gpX2
	B5u64okE6w8PctUyUFND3SOoiNj2XDiP3h+tL5XWRTuqc21X9sHwe2D3OE0OTdSKy1ZFl2B56Dz3O
	t5yjX1iSc2xQ68d4Cte7a6aXhDUnz8Vv7/vYQ1270jW7B3Q0MOIvcc29MAI9YACiq5Y0B90PykInI
	zBeF47CHGihnczOOqdYJUhvnBt/5Ln9Sci6WlXAVLuIW5qSqOK6b+hV4hvEBFYgRtCu2NMbOzs5Es
	BbhjFVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHET-0000000DkoY-3oFp;
	Mon, 28 Jul 2025 06:21:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqi-0000000DhOO-2tjC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23c8f179e1bso45891385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682196; x=1754286996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hts95YB/ZjUXh8JubeUkj5tnYbtjKOGgkAFrza9S0yg=;
        b=jxc0ZL3WLP/a3yXwOp12We1eCEK4EpOvtX/eFcy0TVugeALb/UDyrTS111phUrbSh/
         2WlyMoTV+0sJdsozLkGZTtHP/6dBcGQCQ2f/Js4W0gv3lqerUrYnHjWY8BMthL8a2T8S
         wskDfLO68RRMcp+b96T3Pvmrardsm7OaxaQStwkdzqg+WrB8n6i6/Zk4iUB2kRl27MA6
         rOvTO5dFRVR82FwfaGkWI7dJQyQ0L8OOcxFiHybAslELxHWuHKJlQ+qAHcEicemv2Ati
         WNdxEcApz8LvvQv0ZF6kuL10u734PieutRTcqNALWxmiMrElZVrNQIMsAk4TSbb7VJQx
         +Bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682196; x=1754286996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hts95YB/ZjUXh8JubeUkj5tnYbtjKOGgkAFrza9S0yg=;
        b=n2p4Q8Y3VMdp/4wNAiJbAvEyeJ/Obqk9K/L+IP8HGjhzA/CJP9BHiW7MDkOJgMg9Po
         iBkvXBV2VFLIk85RNAU2OYqIAx9koBIeTKFWw8HqF4b7SKW6fP540/v3c3KI8zsQREL3
         ijURd6vT3hLSiNviTb5g0TXx/lnNW6WWD6JnDFY0+9BI54AO+14QfQC322HJM6FwHwe3
         g7RwhFQA36pHYyWqGOaKc15vR7N2BVUYERc0UBgyGdzdXhiqlA4QXDl6oBRcmn/ZgB+a
         2OyCUbHi9lP70TSS3RGUWlqvUVPq5iZhV0EJyVLoxdtl8JGCpU89jx+OJsi04DtXTS+l
         3thQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6AsYTmHsIwx05xV1pmyZgr4pRIVK72ZQe4HsLVqhz2621vopJ1Bmp82bIRoNIp3kgz0hXA3KuSea+TLrX6fxK@lists.infradead.org
X-Gm-Message-State: AOJu0YwQAD5NBAOHGMlki1IQ0NmmDgnZKJ4PmOA/agisGNr0EGLLj5LE
	5c70p1wYYRg6eM8/aGkPaxBGhCTlqa9YhdvGJACOuyDUocBr9aRXmO9WS4TMZ0VZ
X-Gm-Gg: ASbGnctaKwuGmLHE4yKzjFkAveBJ+UosI4Sd1MuMctGt03mYt2haHMOU5n96VN7o5pB
	e8acqLQtXZWCXEdyRmxBmYebC6AuBmd8p69tFlRR7+xtvxe5wtL+lHpPAop4Wyd4CLFiWGq1JPf
	b1V7z0lQtrdwb+d7v9kTnbAdqPfKb1MCU4iY1I39pZZY0Wb7ExdYlZ+bmS2E9DD9Q8QjkhFJHfp
	lpcI/VMATAw5XYYXUnqVygaMh12Z6ijSIu9wxWqd8XJnCvR62i0yU/qMkVNXU2DdRTPjwr4EBjp
	OgMrruB57E1YDzew8rUY5hWUGGXPPm3+yJDdHbNNlKAhPDVlgOiMWBiAGGcs/KvfYZKiCCNfMLe
	Rfi7Enm1iWT9kfwxF6eNleFSqlb+OfDfBNyg/25/wnX1zziabUwGrfBre6XVlKobes0l4adLJnK
	tp/B9MINHjbw==
X-Google-Smtp-Source: AGHT+IFP3tnIg6vILNX/jRsWfTC+IcuFHWpZZn8f55XY/hi2+oG+I/rcgv+3s7XDjIJi+OO27u1y4A==
X-Received: by 2002:a17:903:1a45:b0:235:f18f:2924 with SMTP id d9443c01a7336-23fb30caa26mr157779795ad.15.1753682195966;
        Sun, 27 Jul 2025 22:56:35 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:35 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 08/13] ARM: dts: aspeed: wedge400: Include wedge400-data64.dts
Date: Sun, 27 Jul 2025 22:56:10 -0700
Message-ID: <20250728055618.61616-9-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225636_733033_A8E442D4 
X-CRM114-Status: GOOD (  12.98  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Include "wedge400-data64.dts" in wedge400 dts to avoid duplicated code.

Wedge400-data64 and Wedge400 are identical except the BMC flash layout.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - None.
Changes in v3:
  - None (the patch is introduced in v3).

 .../aspeed/aspeed-bmc-facebook-wedge400.dts   | 366 +-----------------
 1 file changed, 2 insertions(+), 364 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index 3e4d30f0884d..ef0cfc51cda4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -1,376 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright (c) 2019 Facebook Inc.
-/dts-v1/;
 
-#include <dt-bindings/gpio/aspeed-gpio.h>
-#include "ast2500-facebook-netbmc-common.dtsi"
+#include "aspeed-bmc-facebook-wedge400-data64.dts"
 
 / {
 	model = "Facebook Wedge 400 BMC";
 	compatible = "facebook,wedge400-bmc", "aspeed,ast2500";
-
-	aliases {
-		/*
-		 * PCA9548 (2-0070) provides 8 channels connecting to
-		 * SCM (System Controller Module).
-		 */
-		i2c16 = &imux16;
-		i2c17 = &imux17;
-		i2c18 = &imux18;
-		i2c19 = &imux19;
-		i2c20 = &imux20;
-		i2c21 = &imux21;
-		i2c22 = &imux22;
-		i2c23 = &imux23;
-
-		/*
-		 * PCA9548 (8-0070) provides 8 channels connecting to
-		 * SMB (Switch Main Board).
-		 */
-		i2c24 = &imux24;
-		i2c25 = &imux25;
-		i2c26 = &imux26;
-		i2c27 = &imux27;
-		i2c28 = &imux28;
-		i2c29 = &imux29;
-		i2c30 = &imux30;
-		i2c31 = &imux31;
-
-		/*
-		 * PCA9548 (11-0076) provides 8 channels connecting to
-		 * FCM (Fan Controller Module).
-		 */
-		i2c32 = &imux32;
-		i2c33 = &imux33;
-		i2c34 = &imux34;
-		i2c35 = &imux35;
-		i2c36 = &imux36;
-		i2c37 = &imux37;
-		i2c38 = &imux38;
-		i2c39 = &imux39;
-
-		spi2 = &spi_gpio;
-	};
-
-	chosen {
-		stdout-path = &uart1;
-		bootargs = "console=ttyS0,9600n8 root=/dev/ram rw";
-	};
-
-	ast-adc-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
-			      <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>;
-	};
-
-	/*
-	 * GPIO-based SPI Master is required to access SPI TPM, because
-	 * full-duplex SPI transactions are not supported by ASPEED SPI
-	 * Controllers.
-	 */
-	spi_gpio: spi {
-		status = "okay";
-		compatible = "spi-gpio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cs-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_LOW>;
-		sck-gpios = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
-		mosi-gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
-		miso-gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
-		num-chipselects = <1>;
-
-		tpm@0 {
-			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
-			spi-max-frequency = <33000000>;
-			reg = <0>;
-		};
-	};
 };
 
-/*
- * Both firmware flashes are 128MB on Wedge400 BMC.
- */
 &fmc_flash0 {
+	/delete-node/partitions;
 #include "facebook-bmc-flash-layout-128.dtsi"
 };
-
-&fmc_flash1 {
-	partitions {
-		compatible = "fixed-partitions";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		flash1@0 {
-			reg = <0x0 0x8000000>;
-			label = "flash1";
-		};
-	};
-};
-
-&uart2 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd2_default
-		     &pinctrl_rxd2_default>;
-};
-
-&uart4 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd4_default
-		     &pinctrl_rxd4_default>;
-};
-
-/*
- * I2C bus #0 is multi-master environment dedicated for BMC and Bridge IC
- * communication.
- */
-&i2c0 {
-	status = "okay";
-	multi-master;
-	bus-frequency = <1000000>;
-};
-
-&i2c1 {
-	status = "okay";
-};
-
-&i2c2 {
-	status = "okay";
-
-	i2c-mux@70 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x70>;
-		i2c-mux-idle-disconnect;
-
-		imux16: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		imux17: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		imux18: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		imux19: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-
-		imux20: i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-		};
-
-		imux21: i2c@5 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <5>;
-		};
-
-		imux22: i2c@6 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <6>;
-		};
-
-		imux23: i2c@7 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <7>;
-		};
-	};
-};
-
-&i2c3 {
-	status = "okay";
-};
-
-&i2c4 {
-	status = "okay";
-};
-
-&i2c5 {
-	status = "okay";
-};
-
-&i2c6 {
-	status = "okay";
-};
-
-&i2c7 {
-	status = "okay";
-};
-
-&i2c8 {
-	status = "okay";
-
-	i2c-mux@70 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x70>;
-		i2c-mux-idle-disconnect;
-
-		imux24: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		imux25: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		imux26: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		imux27: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-
-		imux28: i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-		};
-
-		imux29: i2c@5 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <5>;
-		};
-
-		imux30: i2c@6 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <6>;
-		};
-
-		imux31: i2c@7 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <7>;
-		};
-
-	};
-};
-
-&i2c9 {
-	status = "okay";
-};
-
-&i2c10 {
-	status = "okay";
-};
-
-&i2c11 {
-	status = "okay";
-
-	i2c-mux@76 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x76>;
-		i2c-mux-idle-disconnect;
-
-		imux32: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		imux33: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		imux34: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		imux35: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-
-		imux36: i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-		};
-
-		imux37: i2c@5 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <5>;
-		};
-
-		imux38: i2c@6 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <6>;
-		};
-
-		imux39: i2c@7 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <7>;
-		};
-
-	};
-};
-
-&i2c12 {
-	status = "okay";
-};
-
-&i2c13 {
-	status = "okay";
-};
-
-&adc {
-	status = "okay";
-};
-
-&ehci1 {
-	status = "okay";
-};
-
-&uhci {
-	status = "okay";
-};
-
-&sdhci1 {
-	max-frequency = <25000000>;
-	/*
-	 * DMA mode needs to be disabled to avoid conflicts with UHCI
-	 * Controller in AST2500 SoC.
-	 */
-	sdhci-caps-mask = <0x0 0x580000>;
-};
-- 
2.47.3


