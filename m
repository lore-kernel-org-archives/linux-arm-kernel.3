Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAABC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4LcevUqTyv8EUE5kKNpZ8nJ8NaB8FI9zImysmJ+Ij4=; b=Xgx9vxiQMfSzlDKXLtE9uR3Bzu
	eYtX7pUjvCYRm/KGCMAkG+m1dp06BDzejz6bkhS2amVjCErUSwgxEaMnu/wUJLgenqqRRaYfYBEk7
	rAUzALjAwCAdfbE/CodJZ3hnJy9L8O9/395/ioMKGCJYCbB2JmgXhqqZ6Z9r7+v7gBjtBwgrl2QbJ
	/B1e21GZ1udVq55SYbig9zJfQ1ON069oJxuPqeNjhRk2WxTurA3bNUaWTPfsoWXkYbbIKUpQRaoCY
	LxHvB5QkjIKg4dFZ5c/fpTUd4LvIJww312d3xVp179+dQGxAoUepnTYMVgvlPop0UPKEviC1Pdnho
	iU+Lm2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyhJ-00000008zeL-0KG9;
	Mon, 19 May 2025 11:30:21 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyYY-00000008yaA-1Fms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=e4LcevUqTyv8EUE5kKNpZ8nJ8NaB8FI9zImysmJ+Ij4=; b=DlYsL0
	XneW3DTEkNzWkXszmcGPdUz1I/lO7g6yhQN1JL6UDnNadmi1PwN2q/C25GaXjvhv
	cETD/xev1tIIKKtMGA95cQa7vbQww+HcuFv6M7f0pxumNtV9O5o0kYJRRkKcI8EW
	bvERhENK97FufqJmbsZDiiNDHhwAvsZiumtTjcfxGU1AdFFUCXxtMM45JmxfbXEi
	WxOtWP95ttTjjgJ8+Ris56pCJvZWx/6IN8wpcOdIZosARSKUu57CG8RdcF37IlNO
	pUMj6An6QysL7m6NO89ZKhDskWx7jzqxv9Dw2RCoSdqnhO17eUcYjilWAPUWwY6a
	eEM9XC0LJautfKpw==
Received: (qmail 2456941 invoked from network); 19 May 2025 13:21:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:21:16 +0200
X-UD-Smtp-Session: l3s3148p1@Tl+FVHs1/N1Zz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: microchip: use recent scl/sda gpio bindings
Date: Mon, 19 May 2025 13:21:05 +0200
Message-ID: <20250519112107.2980-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
References: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_042118_612330_C3261F7A 
X-CRM114-Status: GOOD (  10.29  )
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

We have dedictaded bindings for scl/sda nowadays. Switch away from the
deprecated plain 'gpios' property.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/at91rm9200.dtsi  |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9260.dtsi |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9261.dtsi |  4 ++--
 arch/arm/boot/dts/microchip/at91sam9263.dtsi |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi |  5 ++---
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi  |  8 ++++----
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi  | 15 ++++++---------
 8 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91rm9200.dtsi b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
index 2a4c83d88733..e105ad855ce8 100644
--- a/arch/arm/boot/dts/microchip/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
@@ -714,9 +714,8 @@ usb0: usb@300000 {
 
 	i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&pioA 25 GPIO_ACTIVE_HIGH /* sda */
-			 &pioA 26 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&pioA 25 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioA 26 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
diff --git a/arch/arm/boot/dts/microchip/at91sam9260.dtsi b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
index ec973f07a961..fc0b6a73204f 100644
--- a/arch/arm/boot/dts/microchip/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
@@ -781,9 +781,8 @@ nand_controller: nand-controller {
 
 	i2c_gpio0: i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&pioA 23 GPIO_ACTIVE_HIGH /* sda */
-			 &pioA 24 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&pioA 23 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioA 24 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
diff --git a/arch/arm/boot/dts/microchip/at91sam9261.dtsi b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
index 0b556c234557..d1d678b77e84 100644
--- a/arch/arm/boot/dts/microchip/at91sam9261.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
@@ -655,8 +655,8 @@ i2c-gpio-0 {
 		compatible = "i2c-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_i2c_bitbang>;
-		gpios = <&pioA 7 GPIO_ACTIVE_HIGH>, /* sda */
-			<&pioA 8 GPIO_ACTIVE_HIGH>; /* scl */
+		sda-gpios = <&pioA 7 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioA 8 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
diff --git a/arch/arm/boot/dts/microchip/at91sam9263.dtsi b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
index 3e9e5ce7c6c8..a4b5d1f228f9 100644
--- a/arch/arm/boot/dts/microchip/at91sam9263.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
@@ -826,9 +826,8 @@ nand_controller1: nand-controller {
 
 	i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&pioB 4 GPIO_ACTIVE_HIGH /* sda */
-			 &pioB 5 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&pioB 4 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioB 5 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
diff --git a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
index 535e26e05e99..4e00ed2d3ecd 100644
--- a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
@@ -1010,9 +1010,8 @@ nand_controller: nand-controller {
 
 	i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&pioA 20 GPIO_ACTIVE_HIGH /* sda */
-			 &pioA 21 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&pioA 20 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioA 21 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <5>;	/* ~100 kHz */
diff --git a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
index 2f930c39ce4d..af41c3dbb4bf 100644
--- a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
@@ -786,9 +786,8 @@ nand_controller: nand-controller {
 
 	i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&pioA 30 GPIO_ACTIVE_HIGH /* sda */
-			 &pioA 31 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
diff --git a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
index 1fec9fcc7cd1..de74cf2980a0 100644
--- a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
@@ -833,8 +833,8 @@ rtc@fffffe00 {
 
 	i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&pioA 23 GPIO_ACTIVE_HIGH>, /* sda */
-			<&pioA 24 GPIO_ACTIVE_HIGH>; /* scl */
+		sda-gpios = <&pioA 23 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioA 24 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
@@ -847,8 +847,8 @@ i2c-gpio-0 {
 
 	i2c-gpio-1 {
 		compatible = "i2c-gpio";
-		gpios = <&pioD 10 GPIO_ACTIVE_HIGH>, /* sda */
-			<&pioD 11 GPIO_ACTIVE_HIGH>; /* scl */
+		sda-gpios = <&pioD 10 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioD 11 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
diff --git a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
index 17bdf1e4db01..9070fd06995a 100644
--- a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
@@ -933,9 +933,8 @@ nand_controller: nand-controller {
 
 	i2c-gpio-0 {
 		compatible = "i2c-gpio";
-		gpios = <&pioA 30 GPIO_ACTIVE_HIGH /* sda */
-			 &pioA 31 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&pioA 30 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioA 31 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
@@ -948,9 +947,8 @@ &pioA 31 GPIO_ACTIVE_HIGH /* scl */
 
 	i2c-gpio-1 {
 		compatible = "i2c-gpio";
-		gpios = <&pioC 0 GPIO_ACTIVE_HIGH /* sda */
-			 &pioC 1 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&pioC 0 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioC 1 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
@@ -963,9 +961,8 @@ &pioC 1 GPIO_ACTIVE_HIGH /* scl */
 
 	i2c-gpio-2 {
 		compatible = "i2c-gpio";
-		gpios = <&pioB 4 GPIO_ACTIVE_HIGH /* sda */
-			 &pioB 5 GPIO_ACTIVE_HIGH /* scl */
-			>;
+		sda-gpios = <&pioB 4 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&pioB 5 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,sda-open-drain;
 		i2c-gpio,scl-open-drain;
 		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
-- 
2.47.2


