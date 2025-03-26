Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E2CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5rclYPCoX+9XsQVXAGD6Zpg/jR52MIrAxSZcU/YUac=; b=T14hsTpmge074G0YJG8mfGWNY4
	58OC64fN5sgHc9r1lv5WcMZ0epGqeC8wV69ZlJ8tIy5cdNv1ujy9saTdCTarShl0kKLYYIWBmTMbC
	crE1qcgvT+4QowttMePCfwDPPgCpaZnr0XibuRM+fAKKzJJg8XXNoFkEQqbOo7HOWQ2Rl6lcNx7NH
	KcNDUFU48QudeUSJnH3SMk5Dd2fJAQMbYc4eCz0QF3mDL0hWXlhtomW5xx+Elm3U8YN4zUo2z4UvK
	35OshUoEyMuNSVyN3c/JNP3MPGchlAdExdY7ojfYBB4ufwABs05TjgEIPogdNE5zch16di7cHjGLl
	9mu/Zsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSOB-00000008nzg-1yvf;
	Wed, 26 Mar 2025 15:09:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvU-00000008iYB-2hoT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so55174065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000015; x=1743604815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5rclYPCoX+9XsQVXAGD6Zpg/jR52MIrAxSZcU/YUac=;
        b=UBpnacoi7sH4Kp14zyxcJE8ixCnb687dAqpZ/7ex8FHmMxSq3OUXgN5nj6x4zKDOWq
         m45sDf4gXhA9aBvqzm9ALONyY1BiOD+ZEfcnOKucsf138bYJskihvs08/5B6aFYeexnr
         1yMT80EEM7gFB2AU0YzcXo+qXvXUux6HMEKsTHjxszIPaB9Tl31aoM2SqDonftNtzsZQ
         VkQ7KThxqVBgRG20Z1eszBOu6KU9VR0lyjT9TI0ule5fb5dFDBw5PDVitp8a7m8/l1SG
         SbgJJ979iOFgoL0wIH3Edzmts6UlvVxCHhhMvWRUxembkRpFKYybOjcaGUrkPCpjc+OX
         ENFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000015; x=1743604815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5rclYPCoX+9XsQVXAGD6Zpg/jR52MIrAxSZcU/YUac=;
        b=JrztX3KSiC8IE0oPgrEGHLyWm7wkRyV2ko/r9UKLMJy7vvlNGLFF9FBh36On5HQuiW
         K3zjxWJkMxWH7P4ihcQC5ocNs7ofr/D9l5nrghtscDANA+ht6XfyKJtqwJtmHo8XwIP/
         WXJrx/GeEgn8BcorwR4QBw2sbFZvzKwMqH9B+BdiYnIWeoFNc1zc48nDlZaC5RpyefnD
         ZT5Nbw+q36UVzXfzJwKRkX4kcYFB1wuODbmuoJNpf7LfP9Kbbe5fJsDPIl95H7Oyilgt
         JG74BZFVx+NBl+SNKFtoTT6ks/HnygqqNxqIqMqPHjs4W9G0joS7ngItYpRwuyeZv9Op
         je6g==
X-Forwarded-Encrypted: i=1; AJvYcCX/0WiZkKnAGxR0b6BIlMey6Zr2wBoXak+bVIarRyItLKnD61TXtaT8J5Bm7uZXaMyfRg2yWG7IRxCVsPbAfG0E@lists.infradead.org
X-Gm-Message-State: AOJu0Ywngb93XC4fZ34QaBSFLaa0cLakuEPolYqDM6TELHAVi2NwsA/Q
	KlW+A6DeWiHsOU/YWLIfWDmVu4LdM41b4z2cAP52m5yQ/ie/0p6B
X-Gm-Gg: ASbGncuNfEW3VuNBfe/3gRV/GI/SOwIPBTEDqL9frykgk7i/XcvsDgGWFh1AEmShwOC
	BeEOzcAFJOR/+dBaHK7PZP2QsxnsRwhwvp/s7UKBaN1bRh1uzgcnHkEPUmmNr1BiifcuEFWI9ED
	D4Uf718+HMDlapLBUFtGQ8Sswxj5rK9CHy0eMJVEq1YCDThHkzQysLecr4GzJQ2bWP8nHqiBvts
	wHMRrInw0a7CQngtgmxuooFmnBV1oWjVPA+h6rI95Gll1qTgNXWdJZwuSuunDZqhNQxx+good2n
	EzONM7pL9pKJbbm+Jet7Hwc6TpRdD5OBt/QzPbLcKMalcXUAk7r5YFxBnkrfJlNNzbHD
X-Google-Smtp-Source: AGHT+IGRAy9yfwG6d2+eXVQeNxaGO7gg1l8K/+riQ2OdyGmO/wZrf70Io0vAaYCnsynf3rjsoKhCJg==
X-Received: by 2002:a05:600c:5742:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43d510fff60mr149245365e9.19.1743000015128;
        Wed, 26 Mar 2025 07:40:15 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 14/15] arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
Date: Wed, 26 Mar 2025 14:39:44 +0000
Message-ID: <20250326143945.82142-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074016_684221_F6D6FEF7 
X-CRM114-Status: GOOD (  17.74  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the initial device tree for the Renesas RZ/V2N EVK board, based on
the R9A09G056N48 SoC. Enable basic board functionality, including:

- Memory mapping (reserve the first 128MB for the secure area)
- Clock inputs (QEXTAL, RTXIN, AUDIO_EXTAL)
- PINCTRL configurations for peripherals
- Serial console (SCIF)
- SDHI1 with power control and UHS modes

Update the Makefile to include the new DTB.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 115 ++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d25e665ee4bf..d8a8d7ca4c58 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -152,6 +152,8 @@ dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
+
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
new file mode 100644
index 000000000000..aee4748a7618
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2N EVK board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "r9a09g056.dtsi"
+
+/ {
+	model = "Renesas RZ/V2N EVK Board based on r9a09g056n48";
+	compatible = "renesas,rzv2n-evk", "renesas,r9a09g056n48", "renesas,r9a09g056";
+
+	aliases {
+		mmc1 = &sdhi1;
+		serial0 = &scif;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x1 0xf8000000>;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vqmmc_sdhi1: regulator-vqmmc-sdhi1 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI1 VqmmC";
+		gpios = <&pinctrl RZV2N_GPIO(A, 2) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
+};
+
+&audio_extal_clk {
+	clock-frequency = <22579200>;
+};
+
+&pinctrl {
+	scif_pins: scif {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		renesas,output-impedance = <1>;
+	};
+
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZV2N_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+
+	sdhi1_pins: sd1 {
+		sd1_dat_cmd {
+			pins = "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1DAT3", "SD1CMD";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd1_clk {
+			pins = "SD1CLK";
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd1_cd {
+			pinmux = <RZV2N_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
+		};
+	};
+};
+
+&qextal_clk {
+	clock-frequency = <24000000>;
+};
+
+&rtxin_clk {
+	clock-frequency = <32768>;
+};
+
+&scif {
+	pinctrl-0 = <&scif_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi1>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
-- 
2.49.0


