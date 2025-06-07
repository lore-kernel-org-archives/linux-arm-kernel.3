Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C2BC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U35d7F4ySvr4ve2pA4Gs/YLbV7hHI8pCrNn0trnfB+Q=; b=uFpOjx7IPHa1bsc9GTEzSYjqQt
	ZmB82ORtEKe/ZCOXRDD3h9fueElpPBTK1XZ2rdTjl88JaOQyUPTmOVfKfwUPqEdMzCfC+qLHYjZRR
	JXNcM8cGZXzfpRW2SCCjhGwNd6t4jre5IaFdxck0/d9c6yPBLgbk9tIXQ83aZLYLOErCbNKKWZDDk
	/aqiCwuYsHVibGxdB4nWwSo6Q2nd4+mdu03I5IxyDrS+Bb6fGmm9sZPTx8MCU/Xpl4hwKjG9gk3Lk
	F39LhJCdd0yvaeF2Lkdr+lK4Is96wz2U1YTRvQncPDdTkoBNGgf9AnO+5+qzSn4C4as2kQVGmkjLB
	u5bGuwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzbL-0000000210C-0AuQ;
	Sat, 07 Jun 2025 19:53:11 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzUk-000000020Rt-3bLQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 19:46:25 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bF7wX0BgRz9shj;
	Sat,  7 Jun 2025 21:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749325580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U35d7F4ySvr4ve2pA4Gs/YLbV7hHI8pCrNn0trnfB+Q=;
	b=Hr2YSiechTXxkKfWWpAd7e7N4lYfLay/NPCyTttgwmYi+gila84k62Tqfx3HE3wUa8Ra/5
	SqTTj/Lu39EYeJvxBBxuqTAnGFuMoCc3J+V+v90ofjIttaY6jI8N7QfwKuoX58HIVaCgD5
	4XFrzhPRQZfWKiajQXmD4kNPN6AuIJfqtSPVe/OQM4dewEcQmgolkvS6CG+0p7zHOAeZ+t
	Ouh5KhooQh5ml6BW/fANJmxk/HNnh7vMkf4vi/3v3EjPgFTnim6WttXokPAS2nONaQD9Vl
	QNKbR6NpCjToOktHOvxIc0uqePuboAEWbV27BmE6/ODwcWmJs8HLqGo9McrnGw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749325578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U35d7F4ySvr4ve2pA4Gs/YLbV7hHI8pCrNn0trnfB+Q=;
	b=D7f5hNVZ+HsJi6YOXPb6FtH/DiLkhiK4JVRXjPCGY40GI68En4LEVmvlgSYpkHn06i8fUf
	RfydVIGgYCPZMjy8P4lEcnv2lNMbHiH3QsbmPrMqHDqauc97MQPKej1TD3HN/x01V1rzL6
	xYONb32yPtsjCWr2mvZXqHfOnlR0XrKrOrwFMulF8YU+wbgXUAM4N79/X+pgj4ae71y4If
	/UUit3h/6fZ+zQGDAwmNzCt1C6Q8ZQtV5a1yXa0ePZDhiI7WPMMqxa4pGqfVVGNNL1InKw
	BrUUqFmVANympLwyKwOjnfwvwuIY5Sxl3XeA6DtY/i/Oifz+9Mr8MiXCj05OGw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: renesas: r8a779g3: Describe split PCIe clock on V4H Sparrow Hawk
Date: Sat,  7 Jun 2025 21:44:39 +0200
Message-ID: <20250607194541.79176-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250607194541.79176-1-marek.vasut+renesas@mailbox.org>
References: <20250607194541.79176-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 691f0f7b87e2ca7a30c
X-MBO-RS-META: 47nn9dfo4gekfi4mzejnermrkkqnm6mq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_124623_177837_04E364EA 
X-CRM114-Status: GOOD (  11.54  )
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

The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
Describe this split bus configuration in the board DT. The topology looks
as follows:

 ____________                    _____________
| R-Car PCIe |                  | PCIe device |
|            |                  |             |
|    PCIe RX<|==================|>PCIe TX     |
|    PCIe TX<|==================|>PCIe RX     |
|            |                  |             |
|   PCIe CLK<|======..  ..======|>PCIe CLK    |
'------------'      ||  ||      '-------------'
                    ||  ||
 ____________       ||  ||
|  9FGV0441  |      ||  ||
|            |      ||  ||
|   CLK DIF0<|======''  ||
|   CLK DIF1<|==========''
|   CLK DIF2<|
|   CLK DIF3<|
'------------'

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Use pciec0_rp/pciec1_rp phandles to refer to root port moved to core r8a779g0.dtsi
V3: - Add AB from Manivannan
    - Add RB from Geert
---
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index b8698e07add56..9ba23129e65ec 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -130,6 +130,13 @@ mini_dp_con_in: endpoint {
 		};
 	};
 
+	/* Page 26 / PCIe.0/1 CLK */
+	pcie_refclk: clk-x8 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
 	reg_1p2v: regulator-1p2v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.2V";
@@ -404,6 +411,14 @@ i2c0_mux2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			/* Page 26 / PCIe.0/1 CLK */
+			pcie_clk: clk@68 {
+				compatible = "renesas,9fgv0441";
+				reg = <0x68>;
+				clocks = <&pcie_refclk>;
+				#clock-cells = <1>;
+			};
 		};
 
 		i2c0_mux3: i2c@3 {
@@ -487,26 +502,38 @@ msiof1_snd_endpoint: endpoint {
 
 /* Page 26 / 2230 Key M M.2 */
 &pcie0_clkref {
-	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec0 {
+	clocks = <&cpg CPG_MOD 624>, <&pcie_clk 0>;
 	reset-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pciec0_rp {
+	clocks = <&pcie_clk 1>;
+	vpcie3v3-supply = <&reg_3p3v>;
+};
+
 /* Page 25 / PCIe to USB */
 &pcie1_clkref {
-	clock-frequency = <100000000>;
+	status = "disabled";
 };
 
 &pciec1 {
+	clocks = <&cpg CPG_MOD 625>, <&pcie_clk 2>;
 	/* uPD720201 is PCIe Gen2 x1 device */
 	num-lanes = <1>;
 	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pciec1_rp {
+	clocks = <&pcie_clk 3>;
+	vpcie3v3-supply = <&reg_3p3v>;
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
-- 
2.47.2


