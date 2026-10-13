Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831B9CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIr4Wi9Ili/gqAXnbKh5m6zvwzkgsDSSZYOqryGqOTk=; b=g4kgUfExfYPSBWbBBsdR7AEAEB
	+rGVbyVYrIbMbXv1kWJWjBTjXpo1dQnPfzOn/FMGvLtBxvi5ytLOfBq9eRJQDKoHXvHFAcNC20KaS
	kD9UN+AGLTPV3Cky1Ua8wZ1jppnxHftcdwtSQX8VM+zZ72hoHG1FltnEfrticLzmyv2LsoNVntBm7
	6ixa907arCzfnj7rXSXIrlDgZxrOKPhwA9Ze4V0gTotMjGsjT2fJbc5eAdw2t4q+MOoI23DgLMMZ6
	ml3asdDMXoW9A2M440yDJq5IkzhpYNPLvOclCGUGuB2Ap3qsdyKY0G9muyRqX71Cvdg4YJI6M5Vp8
	ESwCveag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVfT-0000000C61k-0Y7U;
	Tue, 13 Oct 2026 06:07:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVfO-0000000C5wJ-19xr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:07:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 656F643EDD;
	Tue, 13 Oct 2026 06:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45F7CC2BD01;
	Tue, 13 Oct 2026 06:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791871633;
	bh=LVXybKoszYAKk7+ZqXsYnEtv/pEeuvwZpKkZi4AyivI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eleD/Mk1KHxkk3Nxo+BU4WITw6csVTNT5GAZg3crHNZa0raeXeC3cxSoXBuXW3lPU
	 u/WTrSUYmlh5TKQDBNFbZFlsK86v97lM3k7/T7HDNcI8mayFymkEhmlZBgVANFVjS9
	 jxfSSBNwA6B79c9cbUtqCPHCURQdarSa9qbzxkcqBUQckW/f8lENSOcviJGUqSPFko
	 3xkW7yvvSFj2gJqDwh/mtLTtW5fMAnLDV0hDdAlryzL2tRhqDPHNwC4U5phqRqheR2
	 4TLGKWYtpbtfGUSt31LYlZTtG2jeK2SVACT4bowxUglTjjFtSKuC7drZsFN5jCcgzg
	 TMyNoAaKXscuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346B0CC6B0F;
	Tue, 13 Oct 2026 06:07:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 13 Oct 2026 09:07:18 +0300
Subject: [PATCH v3 08/11] ARM: dts: cortina: cs7542: Add interrupt
 controller, GPIO and I2C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-cs75xx-s2-v3-8-181bb0d23f4c@gmail.com>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
In-Reply-To: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791871630; l=2798;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=3Upc60FD1EM1O4fIft/ek4FPT0icYaZ8EOrDpkRXA2U=;
 b=1lfpKAPeHzSXG/MvuC+AiqhJX9yrGGPwUUcYkbJUkQFzFQ9xi47lyazZYLjMWjRTKGUxRPtsp
 NvLHYt3RgakCj+hAomp2xcdw/5r1ZiZ1y+I0hQLHwXg1IukbhWqht75
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

Describe the peripheral interrupt controller, the five GPIO banks and
the I2C controller of the CS7542.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm/boot/dts/cortina/cs7542.dtsi | 75 +++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/cortina/cs7542.dtsi b/arch/arm/boot/dts/cortina/cs7542.dtsi
index 29b0b7da8..c88449c54 100644
--- a/arch/arm/boot/dts/cortina/cs7542.dtsi
+++ b/arch/arm/boot/dts/cortina/cs7542.dtsi
@@ -44,6 +44,26 @@ soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		intc: interrupt-controller@f0070004 {
+			compatible = "cortina,cs7542-intc";
+			reg = <0xf0070004 0x8>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		i2c: i2c@f00700e8 {
+			compatible = "cortina,cs7542-i2c";
+			reg = <0xf00700e8 0x28>;
+			interrupt-parent = <&intc>;
+			interrupts = <11>;
+			clocks = <&apb_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		uart0: serial@f0070110 {
 			compatible = "cortina,cs7542-uart";
 			reg = <0xf0070110 0x30>;
@@ -80,6 +100,61 @@ uart3: serial@f00701a0 {
 			status = "disabled";
 		};
 
+		gpio0: gpio@f00701d0 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf00701d0 0x20>, <0xf000001c 0x4>;
+			interrupt-parent = <&intc>;
+			interrupts = <6>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@f00701f0 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf00701f0 0x20>, <0xf0000020 0x4>;
+			interrupt-parent = <&intc>;
+			interrupts = <7>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@f0070210 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf0070210 0x20>, <0xf0000024 0x4>;
+			interrupt-parent = <&intc>;
+			interrupts = <8>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@f0070230 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf0070230 0x20>, <0xf0000028 0x4>;
+			interrupt-parent = <&intc>;
+			interrupts = <9>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@f0070250 {
+			compatible = "cortina,cs7542-gpio";
+			reg = <0xf0070250 0x20>, <0xf000002c 0x4>;
+			interrupt-parent = <&intc>;
+			interrupts = <10>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		l2: cache-controller@f5010000 {
 			compatible = "arm,pl310-cache";
 			reg = <0xf5010000 0x1000>;

-- 
2.53.0



