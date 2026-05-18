Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841EFCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 03:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jXpVG+8ZsYwGlksykpzEGGE3bxY9VynddkEfoK9K2I=; b=BXMiIrq6zxyt2ni+bU+4DqyI4b
	UZyKnRPQOBadbclIo43dshS3AsnV4QLPSKhohwCYY0yKOZGYvqm820jjK0oVVp5P8FD4p1aZAT3B7
	NntF0NjERLffHkgnDtidwrvdJo5NlpogiQMYLFvLdVqU4f7KgiszGiOWpZg7xz0m3oNSFsF9Ds/ml
	CABUdvRqV2+wTK3Eh2aDcD4TA/L+S78g773avT1Y6R/as5iIvAdUlFD86YIN5XQhCB59WgKAAQxmo
	U+DjLv/QXScVg5xx7RkRJWj7exMpxK35x3pNAmrreez0Dr3e+RcGqIvDDjZovhbcSeZ1R1SitWTiA
	nH/kR+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOoky-0000000E4Uh-1IQg;
	Mon, 18 May 2026 03:35:04 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOokv-0000000E4TF-3mQn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 03:35:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c80170db7d6so661656a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 20:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779075301; x=1779680101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jXpVG+8ZsYwGlksykpzEGGE3bxY9VynddkEfoK9K2I=;
        b=e79cRbDBYKmFI5lJ2PDuet65EM0k8nzwksLBwZe40it70ZmPQbuQ4zQhuObZ3Z3ERE
         SLtDJoWEBVlZ1dKsgIca8hlbFTLstL2eBff3MoozUfg7zSi3ehxyz6cDdkHldnCM8lvk
         yKKLpFOauWlQNdVNyPL3d25CN1X16rp52W2n7Tu4/kRh7ySHtC3fQ9BQ0JdNqOK2NyCh
         nVr+XvAtplSXIhyrrmBFYS88IHwJKKGRU/voRWkEMlrPaZxKXOyl5fZsEc5KOnMuRcel
         zMxVhC6zPiEjne0HuWW47EKEUbnkA2XgxUg19bfRNpABz8s9WOYpM0d5yh8mKw4snW95
         H2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075301; x=1779680101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jXpVG+8ZsYwGlksykpzEGGE3bxY9VynddkEfoK9K2I=;
        b=mSDMToSf0jnMPzoqD6/9WIDdZblRGhtMI9t9OANmB/iuKwasgiXCWgU5s7JbnwRgw7
         efNM6Ncjs22YthkCx3qwCbwm3X28dgvLetFx8zMb1y9UjFurZzfvGyr0gtd4za53XE/N
         7IyG1TzcHhWJFb8aJJDfohoyKppacz6d6AIcLL6DKxCNK1F3nuwF0NkQuk12kkVyoq+M
         /rzrVIRKXBCLC+dVnpzYY2uzy6lsXRLTpZRy66mlP7cGjy6WYoBn099EIiFB0Bl2Dpd4
         KteqNuRQEyxZxD5tLcCL7FvWMSJqABo3DHeFTx2PDGKR1PxEbGnehb4bRSJFPWT42Ome
         AWPg==
X-Forwarded-Encrypted: i=1; AFNElJ+tHYS3X9LoKf+g0t5s0UW/Sw4xxhoMHwkmYh0YC2uwyF23q7U7/OSrVy4/CThqb2J/m2cYnCXWRE+T04jPupzT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj15nDcqLyDOnV5OxlEiB9FXDHcKUs6cjieLpkeT/j7tebP6MU
	bMvfjxMkh0y9YYSbCnbxq6Ybwp38RZm8d6QWzaG0NSvgP2AQGPCVuSIz
X-Gm-Gg: Acq92OHlWFEvzFme54EQsqP+rFMDHsw2WR1UJyKJgHgSYVP65B65qFUESdVldw0znyE
	aC2b87F7a9syNaPapsCe4kuTB19NMC02QiwubIY5AwvUllksQGxebLfJh65kLzTMbucQU97MDm8
	J/ZBOw1YFEgWMpi7ylcKwBnRbDH7TmPA3J+PzjB93mMIylQX98UUtkSYKppBLBU9q54gPpmT2JA
	d1cJiSJX5fdY0VcS/6fnkju0ydsJEwZ3vakCkK6VxRy7wBPlmz1kY6seawmCIVlQCuq39WcV7e2
	TobvwYGNPkpPxIUCqZWXyS66fRpRQhjiPcNuOJs+v/aJ9A3FdfVHi2u+cPHCvyOs9br+cC47D+5
	BJwj+NVD80YkUjS8XqwZ7nxwH68tGkBth5FSz/eZ4mElrIiAf5KjMcMzVKpbv/dSwLYHBVHrC4d
	rZlF6ZnjEOdVmi2FSrRBMCqRGfBN9tE9EZJ/KTMZVa
X-Received: by 2002:a05:6a20:7d9d:b0:3a2:ebfc:6bf5 with SMTP id adf61e73a8af0-3b22ecf95f5mr13854841637.52.1779075301001;
        Sun, 17 May 2026 20:35:01 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm11183717a12.16.2026.05.17.20.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:35:00 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Mon, 18 May 2026 09:04:40 +0530
Message-ID: <20260518033440.17569-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_203501_944078_BFD6134A 
X-CRM114-Status: GOOD (  13.89  )
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

Add initial device tree support for the ASRock Rack B650D4U BMC.
The B650D4U is a server motherboard utilizing the ASPEED AST2600
SoC for management.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index c4f064e4b..124d4f8f8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-asrock-romed8hm3.dtb \
 	aspeed-bmc-asrock-spc621d8hm3.dtb \
 	aspeed-bmc-asrock-x570d4u.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asus-x4tf.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000..daa8b25e3
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "ASRock Rack B650D4U BMC";
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
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
+};
+
+/* SPI Flash Management */
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+	};
+};
+
+/* I2C Bus for FRU/EEPROM Storage */
+&i2c7 {
+	status = "okay";
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+/* Dedicated management LAN via on-board discrete PHY */
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+/* BMC Console UART */
+&uart5 {
+	status = "okay";
+};
+
+/* System Watchdog */
+&wdt1 {
+	status = "okay";
+	aspeed,reset-type = "soc";
+};
-- 
2.47.3


