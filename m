Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6FBC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF+z+9UJtGb+XbPNA4vnSpzZQyRgL5kz75DPKXiDmdo=; b=xL/DnsFfaFe9/b4XegXaOUuK2v
	lU2dZzMbxmsGKHJ8qaq77p9E+mWv2+5zYEs5zDwbaQLhFhUEv291yYc+xhJ31q/tAxz8aFbg6LZv4
	d6dQgRpxhVqj7PcUxwjg2iwZ+8YwGifJDE4tnmpM2uLi6AmZ16XPic5CcqwkQckOJVVkdbk/CYh3J
	Y7aa62IJWQGpkbOaotSLYTckEmXpm+nXgKoruhWETB5JB5v300w3T9Lgw/J+KOu8kdcsqMUNjMJJr
	oQlRWrpoJpDOEVh7KnxZqA3m+zbqovKreHgqd8LSwEJa/eWWqG2Zqm6ifd7ab874sBXZAIC2IWg84
	DCa561Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWprp-00000007Grk-0apu;
	Wed, 02 Jul 2025 05:18:45 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpe6-00000007ESs-1gOF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:04:35 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b34c068faf8so6839627a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 22:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432674; x=1752037474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF+z+9UJtGb+XbPNA4vnSpzZQyRgL5kz75DPKXiDmdo=;
        b=bYrwt2a/kDMJpRJ+a2MOl/SLIoExgs5+aKD6Q27L4ELeCdgjSfxrP1smVK1mfsr7RL
         rLBiSXXvHaMo2s5edSNUi6HzhalPfoYusa9jUjF9YWfKoSRzS61SOsOjc+idXVxjLYv+
         AQ6xBL3g8QDBd86VzG+1ytoPqkG8pOCJdxtXbTn5OCFmpqLfkUucCuFKOTAZmdwhsOJx
         uZOqEqHnJRwJXxpPkYtkJxPfHwLqqy26ozyoSMK38j/w8IM59quPy5D+nW8pICooXcWq
         M5feUK/nVoI9Pub998sT8ywWic3cHDT6j+UzyMbc/wcNImkxSQi4I+j0ho6/0dYgWAST
         2Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432674; x=1752037474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YF+z+9UJtGb+XbPNA4vnSpzZQyRgL5kz75DPKXiDmdo=;
        b=ub4h78L1SbskBy26/ydToEZatRKLfbu/KgMKq8Kd8zx/NUOxnV3i09hwQOZkR46D1a
         ATC6PVnG94tZYuzyoWxF5UZQ0iaGbapPMcuw77PgyKGtY5Y3DDACrteipDvkgc/hzPWg
         XQOsLnO4BDq0Xjs6703zVOz/Aoo8cDQylIJKeNARI4RnvIq9ukIGPt4X3CJJQQ3HWeL8
         EX5kCqutJLPF1rzl5thES+keU+RqcsL7Mh3b2hsPZus+hJl1wtidZS4CfOX+rs24AEhG
         qsH7bJmm7mDo662OF7wIVuOUHaiYRwY//yV843BPXTeW4ERZ16w49AoB1NSl6MTq5EdS
         XxGw==
X-Forwarded-Encrypted: i=1; AJvYcCXqMoPjanJd7b8fUcsqRML6bW4RZ7stmAAOIywq+cnbBlrZwgut3jIcw7eBjqxIK8IE7gMfKjP6sa946t0dbwKV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0cIo1yHUZgiq3y09le+Mbpev9UOhkbF0YZiHLdAYiunu4uM5v
	1JZXF8nngShekuqWye0ZwyzIQlPY0YvmKo5Vpt12nfz69k/PIKvmODTK
X-Gm-Gg: ASbGncsOVMzbnfYZPnHftlfMBSQGk9BhZ1C+s09DQAv+mdGxduG9MDnZezEEpXFYZLp
	fgpxlmctf3H9uZiVgGoPMeqiCY+346LrVAYcX8ATggc2q+27TEkDLMmYHx4saS+XOBfTp9aIrDm
	KoZIPuup2BBaZKZqC/3mjeSlF14HJ8Av353ATSaBu/2g3mHZChLK2emhkVLiDdL+cpPos3H4zST
	tzmjKPoUzPN8Y/A+dc3j6wnNzy/fGp7aL+/d90uec+TMqSx7Lh0YiaD4obDqVgvNcp2sVbCCm5d
	y279IqAnOmdSwohguWlRWTRI8TE8QvawQfOqkVlb9tqxgW/xoR0cEf5+6B/FHXFWpTT2Gcab6QO
	8lJXItkSuRP3VNJ5kUI+LeorRWCkW82v3IDrf9Q/k2uRH88SMXg==
X-Google-Smtp-Source: AGHT+IFHbwDhMvbqCmis9Avzz0dITiewmawmhCdCrU+rThLZ332gFQVSpCI8zquGUjTRwmwtjMg8pA==
X-Received: by 2002:a17:90b:5183:b0:311:c1ec:7d05 with SMTP id 98e67ed59e1d1-31a90c1faf7mr2410967a91.35.1751432673558;
        Tue, 01 Jul 2025 22:04:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:33 -0700 (PDT)
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
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Date: Tue,  1 Jul 2025 22:04:16 -0700
Message-ID: <20250702050421.13729-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_220434_439667_96538083 
X-CRM114-Status: GOOD (  17.16  )
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
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
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
index 000000000000..f902230dada3
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
@@ -0,0 +1,92 @@
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
+/*
+ * BMC's "mac3" controller is connected to BCM53134P's IMP_RGMII port
+ * directly (fixed link, no PHY in between).
+ * Note: BMC's "mdio0" controller is connected to BCM53134P's MDIO
+ * interface, and the MDIO channel will be enabled in dts later (when
+ * "bcm53xx" driver's probe failure is solved on the platform).
+ */
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
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
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		     &pinctrl_adc2_default &pinctrl_adc3_default
+		     &pinctrl_adc4_default &pinctrl_adc5_default
+		     &pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	ref_voltage = <2500>;
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


