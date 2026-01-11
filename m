Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEDCD2502D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 20:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MI+UfjdZ4KBl70/kcazNDAuL61XOS5jgfeZZ52BwtA0=; b=b+WtFfILSt38gCV6elbFIl6dCk
	Uegdx1dt1W6KG7UnxKokO29wRnZs0igi6rrQB8Svo8bLq4aaLCWsHBU7m3wdX6po0nEkBXCpNKu8q
	IBjV3VfzZovMRAd8B3ckoIt0Vxj4tS8AmVJqKjom+5SLLNrYegtUaNl2NBBQNAyry/d86L2Ck8mRo
	Opou52L84zalPoxBXqhonw/dKl4/EFwqPiLRiwZUJ6Oc9JHCN6ThN9GOJMPlOY1qTERa8/79jD05W
	s5T3G81lPcBdySWP3B6wMyHAGGU2sEWZ606Iu51SpnK+tm7q3iIINVPffpzNDngJeF6njO2jqDe5n
	mdF+BOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1mU-00000004TQh-1vMO;
	Sun, 11 Jan 2026 20:11:22 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1mS-00000004TQ3-088x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 20:11:21 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-78fc4425b6bso57467857b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 12:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768162279; x=1768767079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI+UfjdZ4KBl70/kcazNDAuL61XOS5jgfeZZ52BwtA0=;
        b=SVJcm5XBgsuR6vgp4mcuQdWlYngA0oqHvSK/sMjnvS9olHPn/Un9oXRWJZS9D9AGHH
         979DTg70BN7UBQi/ZNkpJgYePJY9eIXbTgHoBTS+mmfRHqogPiXY0aLOXoK7UpV0qXQD
         vOne1E77kQ1rxFSbE0+ZHQhlxkfeaC2frMj0jgszvMxmJwtIl9qDvarIIU5gt7qsdawT
         8fBrabZ2bgozDkWTlX9cr98YCP9X6eOAU0nYXhhHljBle+pEfhhA+6oIVydmclufz8UE
         EuzVNfhND0kEGvmCpRhbvGWAFkZOT68BGHPTpG56YU3xUCOLbIRbWRlUSGiJaDMGej5d
         0Djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768162279; x=1768767079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI+UfjdZ4KBl70/kcazNDAuL61XOS5jgfeZZ52BwtA0=;
        b=TJavOszLhI2w9NZp8hJXAz1HzNKBqja3v4EiGTnI2F2qJ05dCLziCLfBcxTMv1mIea
         XiluR7/pAbX9MESU2obaG9AcQB6C8bLz3OOS+0isiYxmo0PQl7gVpz/gypU5vpxRSHLN
         q0P6g+YdFww98bv70gYEEVv8WGF9eQCW6N0Nd2EWHoCvkAcCUkm2ND1/t8crJxossS4C
         krRg7FVx+wzakEga14kuczQjDoyiI/fNXBtsGK+zZYYcYrD1M90tdL6hYpJ4XqY1vPbk
         63479DwNbTCEyNy1IekN2OrrtboEylJKYcahFgnqcl6y/N6jTh2S8kAL2GxRfEPzVjpX
         hdKw==
X-Forwarded-Encrypted: i=1; AJvYcCUtAlf8ugYexkKhlhd+br0YmFVk5S0cW1eMI59U1EThgNZXTmePxZEu92GQ8sOxxEy1bbkddoszw6eEX+kPYsVd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+ueLgPd+WUoZHtprCb8YZ0jUp1VoHtUeS5Kyne6dYEE0bQqY
	CPdcGMZtk0VP7mbdcYd0c1pFV+Vi/OhTdZzuepvZn66G+ILleaORQ1CX
X-Gm-Gg: AY/fxX6JB+7ELH4DSRakZ2kAtIG1KmsBan7a+9XY5+LXk930vI0WRBwGWae9W/8y0x4
	iERC8Nj4cgRZ/KbQoYBz/m/+Y4m8ejlk5Syjq6/85s6F1iU7TV1JiqiaSz+z49wzk4+usY4NeGF
	V4suMjjqfeBHoLijzq37Jf3IJc4RmSNCWM1BBXyxynBYuI19uD08D1rPsT1rbUC7Y9uLlt+1w60
	iFW5ltrmbQrPH5ZMyRRDVUiqdM1oiMSx3yoFzwBoirKmcxItiQ3Eg4sZU3psQSHntGAalVdjyp0
	LAzrZ9tQYULM60lComEQk87Yo6yCmXm3wAZbWRyv0nyPk8fbtwkn+Yv1mXjTNiWBBAFbAqyyxJA
	AYv+ltR4Qg9RQGYzxwj33+o9OTZtiJTruNY8vT9300WS0mLJFDoBHYXaC+PxBMAJGlNA2
X-Google-Smtp-Source: AGHT+IHgokj+1DLIRRT5f41nJ6r1E0Go/K7YSYrys1I9AtjEk7wX5wSAvv1S4isYPAgdLHvOV/iVBg==
X-Received: by 2002:a05:690c:5:b0:786:45ce:9bd3 with SMTP id 00721157ae682-790b57942f1mr140423197b3.34.1768162278890;
        Sun, 11 Jan 2026 12:11:18 -0800 (PST)
Received: from toolbx ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-790aa5762f6sm62175717b3.15.2026.01.11.12.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 12:11:18 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: anirudhsriniv@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: aspeed: Add Asus IPMI card
Date: Sun, 11 Jan 2026 14:10:32 -0600
Message-ID: <20260111201040.162880-3-anirudhsriniv@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111201040.162880-1-anirudhsriniv@gmail.com>
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_121120_098061_49D6048D 
X-CRM114-Status: GOOD (  15.03  )
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

Add device tree for Asus IPMI card, an AST2600 BMC PCIe card

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asus-ipmi-card.dts  | 136 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 9adf9278dc94..ff40d9ab88b7 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-asrock-spc621d8hm3.dtb \
 	aspeed-bmc-asrock-x570d4u.dtb \
 	aspeed-bmc-asus-x4tf.dtb \
+	aspeed-bmc-asus-ipmi-card.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
 	aspeed-bmc-facebook-bletchley.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts
new file mode 100644
index 000000000000..fea94360245c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-ipmi-card.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2025 Anirudh Srinivasan
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include "aspeed-g6-pinctrl.dtsi"
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "ASUS IPMI Card BMC";
+	compatible = "asus,ipmi-card-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-fault {
+			gpios = <&gpio1 ASPEED_GPIO(C, 5) GPIO_ACTIVE_HIGH>;
+			panic-indicator;
+			default-state = "off";
+		};
+
+		led-heartbeat {
+			gpios = <&gpio0 ASPEED_GPIO(A, 7) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
+		};
+
+	};
+};
+
+&mdio2 {
+	status = "okay";
+
+	ethphy2: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+
+	/* Bootloader sets up the MAC to insert delay */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&vhub {
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0 0*/	"", "", "", "", "", "", "", "BMC_HBLED",
+	/*B0 8*/	"", "", "", "", "", "", "", "",
+	/*C0 16*/	"", "", "", "", "", "", "", "",
+	/*D0 24*/	"", "", "", "", "", "", "", "",
+	/*E0 32*/	"", "", "", "", "", "", "", "",
+	/*F0 40*/	"", "", "", "", "", "", "", "",
+	/*G0 48*/	"", "", "", "", "", "", "", "",
+	/*H0 56*/	"", "", "", "", "", "", "", "",
+	/*I0 64*/	"", "", "", "BMC_RSTBTN", "", "", "", "",
+	/*J0 72*/	"", "", "", "", "", "", "", "",
+	/*K0 80*/	"", "", "", "", "", "", "", "",
+	/*L0 88*/	"", "", "", "", "", "", "", "",
+	/*M0 96*/	"", "", "", "", "", "", "", "",
+	/*N0 104*/	"", "", "", "", "", "", "", "",
+	/*O0 112*/	"", "", "", "", "", "", "", "",
+	/*P0 120*/	"", "", "", "", "", "", "", "",
+	/*Q0 128*/	"", "", "", "", "", "", "", "",
+	/*R0 136*/	"", "", "", "", "", "", "", "",
+	/*S0 144*/	"", "", "", "", "", "", "", "",
+	/*T0 152*/	"", "", "", "", "", "", "", "",
+	/*U0 160*/	"", "", "", "", "", "", "", "",
+	/*V0 168*/	"", "", "", "", "BMC_PWRBTN", "", "MB_S0_DETECT", "",
+	/*W0 176*/	"", "", "", "", "", "", "", "",
+	/*X0 184*/	"", "", "", "", "", "", "", "",
+	/*Y0 192*/	"", "", "", "", "", "", "", "",
+	/*Z0 200*/	"", "", "", "", "", "", "", "";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0 0*/  "","","","","","","","",
+	/*18B0 8*/  "","","","","","","","",
+	/*18C0 16*/ "","","","","","BMC_MLED","","",
+	/*18D0 24*/ "","","","","","","","",
+	/*18E0 32*/ "","","","","","","","";
+};
-- 
2.52.0


