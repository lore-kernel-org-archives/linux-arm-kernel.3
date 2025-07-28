Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4988FC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/YAuK9Y0oHVDDTSHah83w1CX27+EsYJX9fr2DChXv0=; b=WtFYnlDSBo/3jLpAjbTEuAgnHy
	+sI9reFc0WpNxB6xvbTrfcrEXgMnADxl8/aGHbh9ma/ZsaiIYKGmWqtWmi2UCRY/Tkpcj2pigSFEN
	rzD4L3qIRbn/MU6GX+tBVott1bb/a5H6BrhULzh31hAW4lbm+mR3EitA2JH/01WfVZnNbp1cRin7j
	oVNFf3eowjJBNcXICUFzptSBCPwGUz/PSbNmY5dLMKmEWVv7JFgxDUGKi/eKdOyI1lNRpeVy7ElwJ
	Yiw9tYynl6C2x2JurjW8J1BJBY8oT0zPxVdV122MPDdu3HgflHaTehgmGa3YxKzKNaaf6hM3riv7f
	BfC9KoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHBy-0000000DkaL-0b3z;
	Mon, 28 Jul 2025 06:18:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqh-0000000DhNW-0Mcl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2403ca0313aso3194705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682194; x=1754286994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/YAuK9Y0oHVDDTSHah83w1CX27+EsYJX9fr2DChXv0=;
        b=RB1XGOJShG22tVvrKWRulYVqow0eeeV1eYwuUkYSqAKidXBfeGZ4J43Kgz3VdrNnsc
         tOhBl66QpaYhOnVbQWf+SXA6iqhaDWmeejt3IUc1LSBdg2iMIjX1vB2HhSx4rrkQ9x6a
         2HDwX+qSrrJnYz9VNN/WTdiHQSWWfbPlvlBoQSpsAxxJCvVba7AMiKnKyoeNHNSPRuMz
         K7NFEq3l4JOUJ/hV8yspScFAm4XenNJ3sFNVTYZXTIPHDx2Y+H46CD2UaXryHaMh2Z3L
         mcrKUUTsz3HyWt4Ra2Wb1enkPy6ZcohD+h+wJEzrWNpzTcbaSmfuc/p+bafu3ZQJ4vsN
         HZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682194; x=1754286994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/YAuK9Y0oHVDDTSHah83w1CX27+EsYJX9fr2DChXv0=;
        b=ty4CakKNkIuLvlxr5MHGfu1mYtcRrV+XBXDxV0hai/ZqzEGTt3AwfYJQFzeezq6z6j
         WfblpDyUfGrz3LcyHfFjMe1BW8PV5yJlvKevl790jUwP9til7nRJawjcNFH0ecDNrdBC
         5wIqZyDfLKhDd/OA5TpUX4IKSpoy42nKtmYtvXkacrL2p+Uwd82eT4W9FDzC6YpOsqxZ
         re8g6MofHUBZZgK/u+FyKDA+Bx7/y9bpjdYEDaab3eDcdFfGC4heeG/Mb5nxeWTu82DH
         0wasUXgyON1MS2vrEFh8drfspWgjlr4kWl3D58En9UyFz/3S3/TYKyDwSCy92Qmcy/04
         ebaA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Mn2IWEZQV/L1bhZ8432w6JX6xIo7BBrpvVsiACvMkJcbs2HgIEMq53CE7ow1lPK9kmXrsyY2SVAw0bGn3Ny7@lists.infradead.org
X-Gm-Message-State: AOJu0YzNiRnVMYejz4aeZohOZJveLBNmltmMvFoAx6EoHi4tsWsvWNGd
	i34nCPxtciFEL+WFW3NP9tXYUbzjfyt19ZpByxEKUw2o8CMprLw0Zv3+
X-Gm-Gg: ASbGnctBzcw9k46qQzAUwl5DWE7yKQFCCWOPcSv0XsaKUZk2ZfDU2w6l1C1Lfj2gCgU
	NLV0RvSSX92do7BhLAKhIOHCTUHTa99080KihgvNB9YF9L8e28qbe/7GCF/gwXVc5Cw5GCTKMu4
	MQnfJE0XrzbbM272+FmTaOtI9mRYjTYdMFxmU+QNjaP79dKBbF6P7m935bmzc1i3ttllFP5k2rO
	gxt0XdydHvh6DF2kGXvAyaQe0zTzYivF8BhhNWKSmYIOlzoOKqGY/D+ZTUA6FNkKUfLs1ZhjVKc
	9AD4Y27l+4JoVM3SxKxi6gBR7hqMEJ48aLXaabD5DNL7dwLDUsx62OPrFOgU0z0a7u9IK3TFZiQ
	SLOkkYGV244j4JK3eBvuFzA9ddTeM1AEYEHzhcn5fFOHPtjiQlBmeZ/UT0bzX/K8WCoCUJgMXYO
	RfXUIWndjhmQ==
X-Google-Smtp-Source: AGHT+IGckpl416r7tKZtEvLi84N6rVIZtXh8LmHNCYPgTxJOPIcTlDmrV6zCnV/8M+iaGU2K9uCPpA==
X-Received: by 2002:a17:902:d414:b0:23f:df36:5f17 with SMTP id d9443c01a7336-23fdf3662b3mr66552915ad.22.1753682194123;
        Sun, 27 Jul 2025 22:56:34 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:33 -0700 (PDT)
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
Subject: [PATCH v4 07/13] ARM: dts: aspeed: Add Facebook Wedge400-data64 (AST2500) BMC
Date: Sun, 27 Jul 2025 22:56:09 -0700
Message-ID: <20250728055618.61616-8-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225635_142859_D875AA48 
X-CRM114-Status: GOOD (  17.27  )
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

Add wedge400-data64.dts to extend wedge400's data0 partition from 8MB to
64MB smoothly.

wedge400-data64.dts is copied from wedge400.dts with below changes:
  - updating model/compatible strings.
  - updating flash0 partition.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - Removed redundant bootargs from dts.
Changes in v3:
  - None (the patch is introduced in v3).

 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-wedge400-data64.dts   | 375 ++++++++++++++++++
 2 files changed, 376 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400-data64.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 2e5f4833a073..55be25acfc80 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -30,6 +30,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
 	aspeed-bmc-facebook-wedge100.dtb \
+	aspeed-bmc-facebook-wedge400-data64.dtb \
 	aspeed-bmc-facebook-wedge400.dtb \
 	aspeed-bmc-facebook-yamp.dtb \
 	aspeed-bmc-facebook-yosemitev2.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400-data64.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400-data64.dts
new file mode 100644
index 000000000000..1d46eaee8656
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400-data64.dts
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2019 Facebook Inc.
+/dts-v1/;
+
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include "ast2500-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Wedge 400 BMC (64MB Datastore)";
+	compatible = "facebook,wedge400-data64-bmc", "aspeed,ast2500";
+
+	aliases {
+		/*
+		 * PCA9548 (2-0070) provides 8 channels connecting to
+		 * SCM (System Controller Module).
+		 */
+		i2c16 = &imux16;
+		i2c17 = &imux17;
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
+		i2c22 = &imux22;
+		i2c23 = &imux23;
+
+		/*
+		 * PCA9548 (8-0070) provides 8 channels connecting to
+		 * SMB (Switch Main Board).
+		 */
+		i2c24 = &imux24;
+		i2c25 = &imux25;
+		i2c26 = &imux26;
+		i2c27 = &imux27;
+		i2c28 = &imux28;
+		i2c29 = &imux29;
+		i2c30 = &imux30;
+		i2c31 = &imux31;
+
+		/*
+		 * PCA9548 (11-0076) provides 8 channels connecting to
+		 * FCM (Fan Controller Module).
+		 */
+		i2c32 = &imux32;
+		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
+		i2c38 = &imux38;
+		i2c39 = &imux39;
+
+		spi2 = &spi_gpio;
+	};
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	ast-adc-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
+			      <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>;
+	};
+
+	/*
+	 * GPIO-based SPI Master is required to access SPI TPM, because
+	 * full-duplex SPI transactions are not supported by ASPEED SPI
+	 * Controllers.
+	 */
+	spi_gpio: spi {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cs-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_LOW>;
+		sck-gpios = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+};
+
+/*
+ * Both firmware flashes are 128MB on Wedge400 BMC.
+ */
+&fmc_flash0 {
+#include "facebook-bmc-flash-layout-128-data64.dtsi"
+};
+
+&fmc_flash1 {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		flash1@0 {
+			reg = <0x0 0x8000000>;
+			label = "flash1";
+		};
+	};
+};
+
+&uart2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default
+		     &pinctrl_rxd2_default>;
+};
+
+&uart4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd4_default
+		     &pinctrl_rxd4_default>;
+};
+
+/*
+ * I2C bus #0 is multi-master environment dedicated for BMC and Bridge IC
+ * communication.
+ */
+&i2c0 {
+	status = "okay";
+	multi-master;
+	bus-frequency = <1000000>;
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		imux16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux20: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux21: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux22: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux23: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux28: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux29: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux30: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux31: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+
+	};
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+
+	i2c-mux@76 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x76>;
+		i2c-mux-idle-disconnect;
+
+		imux32: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux33: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux34: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux35: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux36: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux37: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux38: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux39: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+
+	};
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
+
+&sdhci1 {
+	max-frequency = <25000000>;
+	/*
+	 * DMA mode needs to be disabled to avoid conflicts with UHCI
+	 * Controller in AST2500 SoC.
+	 */
+	sdhci-caps-mask = <0x0 0x580000>;
+};
-- 
2.47.3


