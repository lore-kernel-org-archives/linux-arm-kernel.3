Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B502EEE265
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlKZeo0XgHiA07/N2G8KpiyowaP0TZxF7sE3OuoOMSo=; b=bcYgN1HRE9QNrA8qFPipw0fXvq
	ZUmfboCWVBSuTekS4P5nmNFXC6+ZMZG7eRZ49AKJi6qVh4/N62OSTJGBHTJ3khAOkiv2BN72YtafO
	mlbPpQtLDA+AdQVD5INMlKZU0K2xTpheTDZd6qZ5rhWQu+cqI8MvIOZVpj4d1lWh7ItIFFT0OPxGa
	+1HRpA8bOhTV9AwzjhjOv6H58PylL7r+maBzImcXqdj4kTdUya1TKM/I3TwRf8fXBTBghIgbBMBVV
	tpYBHBgu9GWEMOG35jEaJNj3xhA/6u7XlOY4sKdyTkuMy9gu7AbCr+5krHRLxawl62wF9Xx+A7n2u
	wd2o6c8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTO-00000007UWR-1bvK;
	Thu, 01 Jan 2026 20:40:42 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbPTD-00000007UMG-13Bj;
	Thu, 01 Jan 2026 20:40:37 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhzH13L0Vz9slB;
	Thu,  1 Jan 2026 21:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlKZeo0XgHiA07/N2G8KpiyowaP0TZxF7sE3OuoOMSo=;
	b=ELMMdxLd22a9PfBUDenJf8szJo/rnj+njYVFkMO3MqTBYmJEuwJ6mnBAyYuehampEApy/U
	A5ZGnH/k31BUVsKaO7JHEa+vokaYLlTyT05kBjP5juGAZMCeUrxJOumPS7XBH1wi/Zyys7
	FeFOlZeWeXK7FHWlTKnt1r2X4j3YRSOh5/RuIlLLDwDRFepV7IUVxMSZBOya0G6qSNfu33
	463mewtoN9YOTwFLZpNOPLYxrm2E8WZE2/QAfKDkIiX06ZbTUPJsN6pBJttjCzrJ195Ene
	gpsbqogZ/EHVr4ENffiagTBm6Mz42AQzhIDY1UNLzPaXOqjDGx05qweNgRF1GQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlKZeo0XgHiA07/N2G8KpiyowaP0TZxF7sE3OuoOMSo=;
	b=fmkC7kckUHH1ucvSZ6+HSyZj/9HbCQbYVrkJYYYoGLhgCoaHyQM3ATXuWMWWhMNBWAp3Cb
	yMgcFvG5MbBmvaVcpGoF2/qMSWaRzy32oWXU2Ch0STxenGNzr2VMcjNwZFLodiCBx28pvf
	F1ig0DyfpwtTc0zB9PHcCOM459VHkGEXt+eA3dsxtPHcdvhpjGlKFZW1XH5NQesm+Gvcvk
	sz/1tliZ62hP7kNp31BYdBOBqzIwHFnIhUuy2gaPU5A9ykDrvJdK7V4ZJ0gOiHeMsAOXXC
	l00x++inNQWgeezCWWZlRSeC4OqMgG4XrhptjjR0jcfTjimUSNHDQjxt4eJQYQ==
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
Subject: [PATCH 09/11] arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock generator
Date: Thu,  1 Jan 2026 21:35:56 +0100
Message-ID: <20260101203938.159161-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 95943db91b541fb9950
X-MBO-RS-META: wmuca9chgsqj9g5n1ep581ptrjn8egy9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_124033_453371_AC7862ED 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Describe the 9FGV0841 PCIe and USB3.0 clock generator present on both
Salvator-X and Salvator-XS boards. The clock generator supplies 100 MHz
differential clock for both PCIe ports, as well as for the USB 3.0 PHY.

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
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index fa8bfee07b3c8..4e2322d2a90be 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -75,6 +75,12 @@ backlight: backlight {
 		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
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
@@ -523,6 +529,13 @@ pca9654: gpio@20 {
 		#gpio-cells = <2>;
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
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
@@ -641,16 +654,27 @@ &ohci1 {
 
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec0 {
+	clocks = <&cpg CPG_MOD 319>, <&pcie_usb_clk 1>;
 	status = "okay";
 };
 
+&pciec0_rp {
+	clocks = <&pcie_usb_clk 3>;
+};
+
 &pciec1 {
+	clocks = <&cpg CPG_MOD 318>, <&pcie_usb_clk 2>;
 	status = "okay";
 };
 
+&pciec1_rp {
+	clocks = <&pcie_usb_clk 4>;
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
@@ -1038,11 +1062,13 @@ &usb3_peri0 {
 };
 
 &usb3_phy0 {
+	clocks = <&cpg CPG_MOD 328>, <&pcie_usb_clk 6>, <&usb_extal_clk>;
 	status = "okay";
 };
 
 &usb3s0_clk {
 	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &vin0 {
-- 
2.51.0


