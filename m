Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9010EEE25C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ry34khQxIU8hAmiXdlhwHv7F2qJFSNh761bs0K2+cus=; b=S3BrJYk+BTdrv6OmSXp5r+34ZQ
	yyoQg3VlEmHYWoFukzQ0gcEjwoJEMAuHOVwZxyHq/WtCgW/EOfrD7x9LPB5C21b7kD0K241YFpPpE
	3e4aLPioKTb9/JE5YoVkelBP3QOZXyOIW8ELbZYHSwNiG+MkH92JypfR+6/uzf8WVlgQ7KaPTryvX
	T6P3vknhRdi4sWyhGqleUqX9h7ufYlBei6VtoSDv37tZ7YfFqJWGJckhZHgn2Fu/jgMqtE8F3RUx4
	CyxnzJBXe/13VzbttALvqCVgwZKPJFgr3+ARwk7SFoTyHUtqD1Gc7pFKY5d1uVflenZ381wJ3WaVa
	6iOwGjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTX-00000007UdX-41Nx;
	Thu, 01 Jan 2026 20:40:52 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTI-00000007UPA-1gtk;
	Thu, 01 Jan 2026 20:40:39 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dhzH648V9z9sR1;
	Thu,  1 Jan 2026 21:40:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ry34khQxIU8hAmiXdlhwHv7F2qJFSNh761bs0K2+cus=;
	b=jD2eIHEfnL+6+zR1pG4wexeI/2hSQlNW7+zdI831vTBrgdtgxJ6+EuyizAS9liY/24mdiE
	/i1Fft9ZWQkZ3IJ+DNDxA6BsLoLg2GGzfh4flvU61bdUOyEDoThMroizDyeF8g/j5hcxXm
	0KVbaojhcynPvgqaIgR47JcO3OnlRmlPiIIFPCX3yVUwcqje8ctV5v0zqfWUN11uTPmuSC
	bAaiTjwj5ohzNbaJr0TSGDSTMbNQvlNdM/tNAM1Yi2hNkM5+yjZvMpATwhkJ1Q6Tvgt6MS
	inaNs/8x3BCLflVOAs1/0IOcW5MdgbXmDJWiIXfeerPk+E2zn6dtegr+7aVApg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=QInb7ctl;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ry34khQxIU8hAmiXdlhwHv7F2qJFSNh761bs0K2+cus=;
	b=QInb7ctl5rQ64uE8KWgN6WFFPdNEj2JJVdK7MluS9+LEEa+fZcdDpmkqb1RarwSRJzc+cC
	8FZCkXyN46zhjROTgmyMoJfk85mnP5FPwzehwDSh773OR/GXDvpldbQOTEVPwNdH2CP6fi
	VUIBwvGKc8klNoLDCyFkk4beopZiaIo1XoSSDInYsgvHpwEoZ+PEwyQWnYd80ySpKQzoaX
	XiFo1p5fz4Wm20PTKKUOBhudqbeOf9uSpBVGCxhJHj+WgqOO/grcqi+G7a+BISMzzg6ZkV
	Z4xLoewIshOAgfP5+fKOK7a/ZNmrSi8tXMRbozwqUMROlqpnRNzVx8KVp9wqGA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator
Date: Thu,  1 Jan 2026 21:35:58 +0100
Message-ID: <20260101203938.159161-12-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: sq6ed7j5ueauinwqfnokrgiusr13u7pn
X-MBO-RS-ID: ac310e9e446cad3ba5d
X-Rspamd-Queue-Id: 4dhzH648V9z9sR1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124036_846900_BEE7CBF9 
X-CRM114-Status: GOOD (  12.63  )
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

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on Ebisu
board. The clock generator supplies 100 MHz differential clock for both
PCIe slot and BT/WLAN expansion port, as well as for the USB 3.0 PHY.

This configuration is valid for SW49 in OFF position, which means the
PCIe signals are routed to the PCIe slot and U11 9FGV0841 PCIe clock
generator output 3 supplies clock to the PCIe slot.

In case the SW49 is set to ON position, which means the PCIe signals
are routed to the EX BT/WLAN expansion port, and U11 9FGV0841 PCIe
clock generator output 4 supplies clock to the port and &pciec0_rp
clocks should be changed to "clocks = <&pcie_usb_clk 4>;". Once the
BT/WLAN port is tested, this can be implemented using a DTO. Until
then, assume SW49 is set to OFF position.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 0b1ada18a4f74..16168cf5e3122 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -53,6 +53,12 @@ backlight: backlight {
 		power-supply = <&reg_12p0v>;
 	};
 
+	pcie_usb_refclk: clk-x7 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
 	cvbs-in {
 		compatible = "composite-video-connector";
 		label = "CVBS IN";
@@ -439,6 +445,13 @@ adv7511_out: endpoint {
 		};
 	};
 
+	pcie_usb_clk: clk@68 {
+		compatible = "renesas,9fgv0841";
+		reg = <0x68>;
+		clocks = <&pcie_usb_refclk>;
+		#clock-cells = <1>;
+	};
+
 	video-receiver@70 {
 		compatible = "adi,adv7482";
 		reg = <0x70>;
@@ -578,12 +591,30 @@ &ohci0 {
 
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec0 {
+	clocks = <&cpg CPG_MOD 319>, <&pcie_usb_clk 1>;
 	status = "okay";
 };
 
+&pciec0_rp {
+	/*
+	 * This configuration is valid for SW49 in OFF position,
+	 * which means the PCIe signals are routed to the PCIe slot
+	 * and U11 9FGV0841 PCIe clock generator output 3 supplies
+	 * clock to the PCIe slot.
+	 *
+	 * In case the SW49 is set to ON position, which means the
+	 * PCIe signals are routed to the EX BT/WLAN expansion port,
+	 * and U11 9FGV0841 PCIe clock generator output 4 supplies
+	 * clock to the port, change clocks below to:
+	 * clocks = <&pcie_usb_clk 4>;
+	 */
+	clocks = <&pcie_usb_clk 3>;
+};
+
 &pfc {
 	avb_pins: avb {
 		groups = "avb_link", "avb_mii";
@@ -872,11 +903,13 @@ &usb2_phy0 {
 };
 
 &usb3_phy0 {
+	clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>;
 	status = "okay";
 };
 
 &usb3s0_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &usb3_peri0 {
-- 
2.51.0


