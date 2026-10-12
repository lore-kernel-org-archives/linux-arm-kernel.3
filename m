Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B4CC6B01
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESNHhZVsQYn2AOHmULvyvX5RGO+mMmtnmWqOXIw6AB8=; b=VXZyMTzNJXSE0gZU46qZvOJk5/
	oXK/C4BL1FUQcib8st2RGQHR7qrNGA7BirnBC9cuEUPkPrQ4VPLKCgKf1b1i+Km/TQV0PwJ2SlfSc
	lTwarR6obcggYaE+70X2Fr2yAP3PW905EFR/IXfl0VD+8nXlZtm379V0BSoDRXAjFV9i6jS2HWTnH
	8kWiJ7DAtVzwP5rg8byzNZ6RMZkpObsAe4COuZpKBpPRjC5jSnMCRPu1krzvQ42legFYWZ5ckC1ta
	KzzftvucA45HbwJcAwEBKZ5AgAIz3jnHYPzm3SCpxUhpEGSf1EW8ZYtkomrS8AE6w8JLWvab/9dTI
	XLX4NAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJtu-0000000B6nC-0E2I;
	Mon, 12 Oct 2026 17:33:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJtT-0000000B6Wc-0Q3w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:32:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3650444E7;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB237C2BCC7;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791826378;
	bh=2K57Ukhh2ZtD8p9cC8o3YJWWaJ88JHj5YgPFCwXr2bY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I8PjPJRGRTdAZvGIq5e/tseE1Rn3L0aEiLkuZIzEcj0ta7YSTHHqUQdZuT7EuplLf
	 sjq8Ahc2Q5fBuEF2HU5RiUVHsKG2P9pEuyG4FEL9VeJGHEk8sxvPVqtHX4kZpFHCyz
	 oi76LreSbH93y/4ZYypP6p2TOJkzOZlLvzwcvIC/lLnF7EAjLK8r4X5TqLpzvB55oF
	 apQIsaw8upMLYpSryWotvd3jWvD25Exhs9ITRZV7ryu7mcf1lX1yEcxSMQto2j1Cbe
	 W1J9pvEkLoO1n+uc8IshALSiEObv8TAF/NHpFS2YcuLrFrBqsWgAL+aeTB+EqAAWCZ
	 R1T4Jj4FCStvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D07CA9ED0;
	Mon, 12 Oct 2026 17:32:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 12 Oct 2026 20:33:04 +0300
Subject: [PATCH 09/11] ARM: dts: cortina: almondplus: Add reset button and
 enable I2C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-cs75xx-s2-v1-9-8a7641b7b79c@gmail.com>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
In-Reply-To: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791826375; l=1441;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=2Dx/b8/3JsG/5KBFCzsSYSUq7LHO1maolj27mYLmFbc=;
 b=XWXbANLAClu8iyD8TTsgycP74bTBmdKiyDLudB2hH8j1YjH5+rTRpJOhQFTQTtmjisBqTZn1r
 ikhfSV3SYYgAxpwOP/Igf7+GbMZursjO7mDSWY2rjY8Vzx6VmgWbZCm
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

The pinhole button on the back of the Almond+ is connected to GPIO 37
(bank 1, line 5), active low. The stock firmware uses it for restart
and factory reset.

Enable the I2C bus, which has the touchscreen controller on it; the
touchscreen itself will be added together with its driver changes.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../boot/dts/cortina/cs7542-securifi-almondplus.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
index e2988c687..0619bd754 100644
--- a/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
+++ b/arch/arm/boot/dts/cortina/cs7542-securifi-almondplus.dts
@@ -5,6 +5,9 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
 #include "cs7542.dtsi"
 
 / {
@@ -19,6 +22,16 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		button-reset {
+			label = "reset";
+			gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
@@ -50,6 +63,12 @@ &apb_clk {
 	clock-frequency = <150000000>;
 };
 
+&i2c {
+	clock-frequency = <400000>;
+
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.53.0



