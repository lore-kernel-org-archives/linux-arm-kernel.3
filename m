Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01688C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfn1RaDZ/VoXGBlX+/NPIiA54a4d4cEOfZQVkuaZdk4=; b=3w9JZMSAd+gecsxhKno7s3iTrG
	zKYuFUYpYuqsIDV4rn8E7PKK/EIeyWZyzXVURZvf2G/EkdkkJgu270fFjNdYUhTFk4nKoVTxLPkWV
	yVhmQjNLgmyzq7MtSgtTBlRTWe7xBGng0hFMGITYZLAPe1LHhZ8MTa3KyLr3GkCgQ58XHeYu5yhWm
	X4JymRkf+HqGH07jMOf3RUoq7gvbF8UMfp7QIhAHgN6Ny03Jl64+JBWbT+An8DKA1bJhgqZhTqXmY
	OIEi2uOUJriQ+tkQbqob3NFTUQPkHsTQxjZIeVykRUqnrTNdZHGyVsOVGIn8OwiN7mdzLIQW8bULp
	fxf9zGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYHIK-0000000HO9E-2PCg;
	Sun, 06 Jul 2025 04:48:04 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvQ-0000000HLlB-2Lb6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-74b56b1d301so1206332b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775864; x=1752380664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfn1RaDZ/VoXGBlX+/NPIiA54a4d4cEOfZQVkuaZdk4=;
        b=esQAyuG0v7uy+5T2e1DbRw/iivMvpZDuJqTYs+pWKz76klPUncL/Sot7qsGACSU2AV
         zp4Is3mfpDvLJTrc/Vdc3yaMusS067ArdOmvDLvVpa/kuv1FLKjy6jCIEBBTpKvRF49M
         rOIyRdLFSgk4AX5G419vcadeDVT/MbiO9ppZ9+vxVMSo9PdUaRJ+PcOYg5gQdquW/b3q
         tooD4r0gpvsffx9Um18cNPSO5pPQWg0p63CMFPO54U6/rVI1gS2OfZQ0rIKQWe5qOjW6
         /UCi3fW7hIUXs+nTA+6Dxq65cc1Jl2yZZOrAddFe3IXIBpVUeZrBqpg27nKlTgGTEs19
         e/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775864; x=1752380664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfn1RaDZ/VoXGBlX+/NPIiA54a4d4cEOfZQVkuaZdk4=;
        b=vP83yCRD8nUvuzeiFmOa8CYiHSZa0oOYKYtBjGb4pmcjRiQjLNfjTrtNjJJXF3oMuB
         ah0VsmhpWZKxjqi7buNowxvovnWmzetV/NPPhLx13QikfPQzk5utRebSOJIGDJ8qNaJs
         hPRFVtjoC9WYIA0qXzH+M1FG7k4HzTxnpZknXY1p0Bu57jskDybEVMUSsVgOPBu++jDZ
         GKbSAd4wjNB1MY2spCBLLIJ1FxaRtX86FgqvE/olKJPia81u4YTzZ6gnXXVayZKT+if1
         6J/rjjyN4DUr/ARQEouakYL913c8LTmSvCqA8PMZSCdsCGI5CLHE4mCFGvcvu5Xd+VzA
         AbKw==
X-Forwarded-Encrypted: i=1; AJvYcCUY5k0oblGY8Q8oiPnch5UlG9etrP7+NhE4JMR/xeISFRmBbngdQ/v3wLy2Ljsuoz/5oyockcQByRPAEAi2fX8k@lists.infradead.org
X-Gm-Message-State: AOJu0YxOLZd+WGKdmFFyDzvC+GxTJP9aE8pRbPrKFyfLFgBVh0gFKZLJ
	9fM8883Y09mRDOlKGA7HeMmhhBeLBSohdF7ZVNZ2sO3jCrzwGk0EH9k/
X-Gm-Gg: ASbGncsN9zUxQvilkM1XrUFLJ1hm/45Q0+yykjRMxJBkaFaO9p9Pxyl6In6F4/VkGK+
	6M6q3ulXY8BHjQDmb7m3m04G1dEeQ4Jv42sQn/FwSKaQbANY0xSptVmRdQ1xhGBaTN7O9ah3ZiN
	RajNvXFLS2DtbIVrLFNMewEiSzO3vfIM7lTBrrsCUYLCzYYJYBf+LcVusAFhsA5swrdaGEXl8IR
	3lTCjk6cnJ5NkuUMMIUYH9XRJ3txVEfUkig21ilPa9ZND11rngw/iElI4qXdLrZvRxqJQy+wrKH
	SrZc2h6X9vCcydVthgJ/iJqwhH3m7VXWg2pSO27KPKjQZv3nP6XYT2aXRuLkwDsslAmd2AiFG3m
	wjt6CZ7j7RF05j6z4yYxD4PHKhp/tZlANseP8XQI=
X-Google-Smtp-Source: AGHT+IFLx/ecv0fzT4aq24Vp/6Qjs2Ymni61ExjnL6k5yrrhyuTQDQe/9YeSrYCfZz3y6aBbWrlwew==
X-Received: by 2002:a05:6a00:1493:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74ce8acd787mr10488800b3a.20.1751775863981;
        Sat, 05 Jul 2025 21:24:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:23 -0700 (PDT)
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
Subject: [PATCH v2 9/9] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Date: Sat,  5 Jul 2025 21:23:59 -0700
Message-ID: <20250706042404.138128-10-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212424_636920_896B6F4E 
X-CRM114-Status: GOOD (  14.53  )
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

Add initial device tree for the Meta (Facebook) Darwin AST2600 BMC.

Darwin is Meta's rack switch platform with an AST2600 BMC integrated for
health monitoring purpose.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - Removed mac3 controller.
  - Fixed DTB warnings.

 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 2e5f4833a073..debbfc0151f8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-catalina.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
+	aspeed-bmc-facebook-darwin.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
new file mode 100644
index 000000000000..e2e71b1d02c4
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 Facebook Inc.
+
+/dts-v1/;
+
+#include "ast2600-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Darwin BMC";
+	compatible = "facebook,darwin-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	spi_gpio: spi {
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+	};
+};
+
+&fmc {
+	flash@0 {
+#include "facebook-bmc-flash-layout-128.dtsi"
+	};
+};
+
+&i2c0 {
+	eeprom@50 {
+		compatible = "atmel,24c512";
+		reg = <0x50>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		     &pinctrl_adc2_default &pinctrl_adc3_default
+		     &pinctrl_adc4_default &pinctrl_adc5_default
+		     &pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		     &pinctrl_adc10_default &pinctrl_adc11_default
+		     &pinctrl_adc12_default &pinctrl_adc13_default
+		     &pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
-- 
2.47.1


