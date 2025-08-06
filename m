Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA4EC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Xb1gcwOb+OUSeItxSM+cReVbxFeztwB6ynzPiFVKds=; b=KUFMkJWzmLKWdtS/eEXtNcTNvq
	OGC3moBn+DUc84MKVv+9+CJTi4BQ5rJVaNjZ9PrfDRwru3TeVyMibscTgv6TpvQ5/W89aHgq+Rp9B
	DdIFK0r8l/hw9KdVymaPI8GQ9dU4yqeSs4DXe8tkNxAYaERlT5EU5C7/7cNltfSIrZuZLTlAEaMDY
	cB6n3vxJK4AwV/nDs/4tJ24RbiEhyGm8GZXWbaxxk0lb+/t9M5inh8dvg4ZxBqun6/fghDmn8I2Jc
	KB0G0+tqv8KdY6724aaTPvAjgrWLobjTcf9rKSMqc5vqxEv6uR+UxUAhzOvmmaQN+MK0nRhCuORI5
	J8Poxb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujflT-0000000FYP8-0nfd;
	Wed, 06 Aug 2025 15:09:15 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfhT-0000000FXP2-2NMp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 15:05:08 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bxtrK482Rz9sJ3;
	Wed,  6 Aug 2025 17:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Xb1gcwOb+OUSeItxSM+cReVbxFeztwB6ynzPiFVKds=;
	b=CIzsY2/2CjVfo4AAXd6QHgF44FBCTgikJgExkKDsstk8PnzMJOq4vki55L6So+wtMCvmZN
	9eouqSNY3YmR68VG/sUkY3B/BKY1fCWSPFKgJFSu6lnzXMA43F77JHku6DSkyP7vXTAz2l
	X4cYuMOfI7s2LPAq5FV9pZ+kYCloDWO/xEdDVkGnM+n9X7mjFdkZF6asacR0/fT6AzP8oy
	Ig4MB0wl8/o+Y5rFR1iI4oatvd43v7N9HdAX3ar5u90LkSOrZRPWIQs91qk6Aoc4Fjt8eH
	BpvjCtFstsEAv4cQ/sy8eXworv6Vknuf89p4B7xxH0ZMT4tvbxQGw3wvocCiwA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754492703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Xb1gcwOb+OUSeItxSM+cReVbxFeztwB6ynzPiFVKds=;
	b=hDiHlE3Bz+3lc6yOmzScT+/c+L9bOngw8Wa6FY6z+fAtNJwqE8ODgiF8agWM7JgX58X99B
	sYNPlidsKTACr1ptiA+tgGnXQeZyhFwuEuKgrP1ZI+AL4l/DlgK1F9ehI9jPSt+/snaS1V
	CuDLZVjVjcVCxQH9NAysCZGu3Xr008YG4jyGyJjRsklWOPcjQ6BUVKBBb+QmevX9G5b53G
	SqrTXhTz5EUcvKT69kCZPL/+rtwlR+9xk8gcaALjfELWPXeKmE+ovwnvKGYrsaxsMaPPX1
	nvleB9dYT6M5RmTcYwO8wuib42T59pJ86m0fSPbjXO6VtrfjBfp+zBVaJo7WFA==
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
Subject: [PATCH v2] ARM: dts: renesas: Add boot phase tags marking to Renesas RZ/A1
Date: Wed,  6 Aug 2025 17:04:27 +0200
Message-ID: <20250806150448.9669-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a9ff50ae2e0858919c0
X-MBO-RS-META: gemjm8p8bjmrjzrawdaz3m1u61rf8pm4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_080507_753334_8EAF97D1 
X-CRM114-Status: GOOD (  15.23  )
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

bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
to describe various node usage during boot phases with DT. Add bootph-all for
all nodes that are used in the bootloader on Renesas RZ/A1 SoC.

All SoC require BSC bus, PFC pin control and OSTM0 timer access during all
stages of the boot process, those are marked using bootph-all property, and
so is the SoC bus node which contains the PFC and OSTM IPs.

Each board console UART is also marked as bootph-all to make it available in
all stages of the boot process.

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
V2: Drop blank newline arount bootph-all , move ostm bootph-all to board DTs
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts   | 4 +++-
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts | 4 +++-
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts  | 3 +++
 arch/arm/boot/dts/renesas/r7s72100.dtsi         | 3 +++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index c81840dfb7da..3c3756509714 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -203,6 +203,7 @@ &mtu2 {
 };
 
 &ostm0 {
+	bootph-all;
 	status = "okay";
 };
 
@@ -258,6 +259,7 @@ mmcif_pins: mmcif {
 	};
 
 	scif2_pins: serial2 {
+		bootph-all;
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
 	};
@@ -286,7 +288,7 @@ &rtc {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
-
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
index 9d29861f23f1..23ddec217685 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
@@ -59,6 +59,7 @@ led1 {
 
 &pinctrl {
 	scif2_pins: serial2 {
+		bootph-all;
 		/* P6_2 as RxD2; P6_3 as TxD2 */
 		pinmux = <RZA1_PINMUX(6, 2, 7)>, <RZA1_PINMUX(6, 3, 7)>;
 	};
@@ -99,6 +100,7 @@ &mtu2 {
 };
 
 &ostm0 {
+	bootph-all;
 	status = "okay";
 };
 
@@ -109,7 +111,7 @@ &ostm1 {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
-
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
index 25c6d0c78828..91178fb9e721 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts
@@ -199,6 +199,7 @@ keyboard_pins: keyboard {
 
 	/* Serial Console */
 	scif2_pins: serial2 {
+		bootph-all;
 		pinmux = <RZA1_PINMUX(3, 0, 6)>,	/* TxD2 */
 			 <RZA1_PINMUX(3, 2, 4)>;	/* RxD2 */
 	};
@@ -264,6 +265,7 @@ &sdhi1 {
 };
 
 &ostm0 {
+	bootph-all;
 	status = "okay";
 };
 
@@ -278,6 +280,7 @@ &rtc {
 &scif2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&scif2_pins>;
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index 1a866dbaf5e9..a1e4e9ac8f62 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -41,6 +41,7 @@ bsc: bus {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0 0x18000000>;
+		bootph-all;
 	};
 
 	cpus {
@@ -107,6 +108,7 @@ soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
+		bootph-all;
 
 		L2: cache-controller@3ffff000 {
 			compatible = "arm,pl310-cache";
@@ -557,6 +559,7 @@ R7S72100_CLK_SDHI10 R7S72100_CLK_SDHI11
 
 		pinctrl: pinctrl@fcfe3000 {
 			compatible = "renesas,r7s72100-ports";
+			bootph-all;
 
 			reg = <0xfcfe3000 0x4230>;
 
-- 
2.47.2


