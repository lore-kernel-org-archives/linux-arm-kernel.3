Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F0C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 02:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=atX795aL/TJ6cQJtNkIm5vjFqkHXTb1PQaU66zosmfo=; b=lDo2XyvKc+Mt8psd5XIHbuBOUv
	KLZGFzelz9c8D/EXSsyP6petiyydfnYgH0SSGPjjAhnnSA7Jz2WJSY6NVXIc5xzaAHwI80h/gQk4t
	yKX8d6BLMQPP5LiFNvOqinvs4fNxiSToPbvRszmjjhBtf0F180xtN4SZZOpIhKFDS+1k44+0noNez
	c3luzO38MmtHSfSBp7C1JEH7bxjgl1WEtxB3oV5kYmkrAPwV4FuuhF0B9jDRCD8cKlFDfdr4/B4Gm
	pyB/Syvz6clRMnyvHILwR1W3JOUR3FOBWvbTiZLvac++VdDjGBnIOXNuvouOkc0VEugDwE0ea0SmV
	06wvQo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsXFr-000000090RV-3ayR;
	Sat, 08 Aug 2026 02:57:47 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsXFo-000000090R2-2OJR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 02:57:46 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hH5KP6LMLzMlMd;
	Sat, 08 Aug 2026 04:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786157849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=atX795aL/TJ6cQJtNkIm5vjFqkHXTb1PQaU66zosmfo=;
	b=kq7zeBkFudiaduXx0PVIZv5D2XvaCOj8hKQKCOphSXohF3za6rteU/UkRX6uFats53b6PQ
	j5SzKy04XcLourIpzgkXIZzK4MwyQMAUG9gYNKp6JwVxtHlDEFEmNn8xQRsU2tMRF9Wd4A
	ppqCq0S3qohmAA7bUng2ukpFUUiC+c0Ybvuo40ILN3PDdiJ1CsWwsqeMnEgXj5nIUuFaQ8
	UZKkLNgBXUD+mKWao6E+aGOvMzlmQ1Cg+79fCZ/C98n6+a4ctj+navMSZx2sgyfutGEtqg
	V4PdFkEeXwq4uO0RNxpMBaSCQwFCYnzXmpYMySrHPoo0M3U0UJwnTUtFSWfA2g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786157848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=atX795aL/TJ6cQJtNkIm5vjFqkHXTb1PQaU66zosmfo=;
	b=jTusmNicxCCbs6hUNTlYmKLo+8zayvf2ayPJXVLV2OpkZVaKPBjkI6wvcZ7RJtoKHSOQIa
	+QEs98EdrI3QhtfA2M81RIrApKgEFN3S68n8zYPNZMpQH2YPiQ3/X1ROUKaUDPKPbezmnb
	nhLcCIeDsbqUGhh7F9Usd4+Q1AeUb1YVRnG3POS/VlMxe6utP+BGkV755uE9ZWdpIzvzWe
	J4L6S+RMTlwXAY4wp42m2oPatxaWcRRy3/kZrlxp228bKcsLMcL+bjc3y4PRIBXoryrYv6
	zyyyX9wYgwIFC3+mh69IhYMxL0iE9bCYRFA4rU5AKBdbSTXdCMB0X3WoCHjXKw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare 2CH CANFD HAT
Date: Sat,  8 Aug 2026 04:56:26 +0200
Message-ID: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 22b3c6dc9ab511f3b62
X-MBO-RS-META: rx1gzjworxkf96rrsc5frsf1nkiumigj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_195745_166914_C813CFDF 
X-CRM114-Status: GOOD (  16.08  )
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

Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.

Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso   | 130 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd111..69c1405a6fd01 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -124,6 +124,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 r8a779g3-sparrow-hawk-rpi-display-2-7in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-2ch-canfd.dtbo
+r8a779g3-sparrow-hawk-ws-2ch-canfd-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-ws-2ch-canfd.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-2ch-canfd.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtbo
 r8a779g3-sparrow-hawk-ws-display-13in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-ws-display-13in.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso
new file mode 100644
index 0000000000000..de72680efa7c6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the Waveshare 2-Channel Isolated CAN FD HAT
+ * on connector CN7 on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2026 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ *
+ * Example usage:
+ * - Connect HAT signals to Sparrow Hawk board CAN BUS connector CONN2:
+ *   HAT CAN_0 H -- CONN2 pin 6
+ *   HAT CAN_0 L -- CONN2 pin 2
+ *   HAT CAN_1 H -- CONN2 pin 5
+ *   HAT CAN_1 L -- CONN2 pin 1
+ *
+ * - Determine which interface is which:
+ *   $ ip -d link show
+ *   2: can0: <NOARP,ECHO> ...
+ *      ...
+ *        clock 40000000 ... e6660000.can <------ Native Renesas CANFD
+ *   3: can1: <NOARP,ECHO> ...
+ *      ...
+ *   4: can2: <NOARP,ECHO> ...
+ *      ...
+ *        clock 40000000 ... spi1.0 <------------ SPI CANFD on this HAT
+ *   5: can3: <NOARP,ECHO> ...
+ *      ...
+ *
+ * - Bring connected interfaces up:
+ *   # CAN_0 link
+ *   $ ip link set can0 up type can bitrate 125000 dbitrate 250000 fd on
+ *   $ ip link set can3 up type can bitrate 125000 dbitrate 250000 fd on
+ *
+ *   # CAN_1 link
+ *   $ ip link set can1 up type can bitrate 125000 dbitrate 250000 fd on
+ *   $ ip link set can2 up type can bitrate 125000 dbitrate 250000 fd on
+ *
+ * - Perform CAN test, run each of the pair commands in separate terminals:
+ *   # CAN_0 link
+ *   $ canfdtest -v can0
+ *   $ canfdtest -g -v can3
+ *
+ *   # CAN_1 link
+ *   $ canfdtest -v can1
+ *   $ canfdtest -g -v can2
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	/* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
+	clk_can0: clk-ws-2ch-canfd0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	clk_can1: clk-ws-2ch-canfd1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	/*
+	 * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
+	 * muxed on the pins allocated for SPI_1 on this CANFD HAT.
+	 */
+	spi-ws-2ch-canfd {	/* SPI_1 */
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "spi-gpio";
+		sck-gpios = <&gpio0 10 0>;		/* CN7 pin 40 */
+		miso-gpios = <&gpio0 9 0>;		/* CN7 pin 35 */
+		mosi-gpios = <&gpio0 12 0>;		/* CN7 pin 38 */
+		cs-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>;	/* CN7 pin 12 */
+		num-chipselects = <1>;
+
+		can@0 {
+			compatible = "microchip,mcp2518fd";
+			clocks = <&clk_can1>;
+			/* CN7 pin 18 */
+			interrupts-extended = <&gpio1 25 IRQ_TYPE_EDGE_FALLING>;
+			reg = <0>;
+			spi-max-frequency = <20000000>;
+		};
+	};
+};
+
+&msiof0 {	/* SPI_0 */
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&msiof0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/*
+	 * Native MSIOF chipselect does not work with MCP2518FD
+	 * because MCP251xFD driver needs to keep the chipselect
+	 * line asserted between transfers. This requirement is
+	 * fulfilled only by using GPIO chipselect.
+	 */
+	cs-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		clocks = <&clk_can0>;
+		interrupts-extended = <&gpio1 26 IRQ_TYPE_EDGE_FALLING>;
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&pfc {
+	msiof0_pins: spi-ws-2ch-canfd0 {	/* SPI_0 */
+		groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
+		function = "msiof0";
+	};
+};
+
+/*
+ * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
+ * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
+ * in case this hat is in use.
+ */
+&pwm1 {
+	status = "disabled";
+};
-- 
2.53.0


