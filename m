Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D18C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Y9p6ibc/bj3AV8FXwHT1h+AI01HJG79MMwLbgeY3aY=; b=fJxZGXbtmMK2KSShXbm0BHXv9x
	M1Iy8ZAU2n8/9kCDo9ENZGHeTXPqRuwtkxByjbtVx5Ob91Qedbhr1k60/a3cZRVELLEPDKvm9ZQ6d
	DZ2nGSrXP4M6Op4BfUEABTkfUs9cND0AvsOS4RkAzVOfkR/mOJQ+GfmjlH7n1kolkc3tUWdnZyq0N
	4xWqXJ9GBSriebR4iugshS+Ch4UskNhtoIPmfEJvGoG5yPArpCkjKG/AQjrb0OOVWy2+ct0YmXjbL
	bEYuzmdh+h2qkXfCOTNb0xpG4V7ERYopNrZCpjR0Wi03YBnEuFgOGJUc8wDKyzsJQDPakEiMWsfyg
	PO4SFD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZIa-0000000GSSq-00UO;
	Thu, 16 Jan 2025 23:29:16 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZBK-0000000GP4H-09DI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:21:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737069703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Y9p6ibc/bj3AV8FXwHT1h+AI01HJG79MMwLbgeY3aY=;
	b=I5ESkJp7jccj+p7MTg/3SaqOFMdzqlC543kNhuKXyIO5ET2tSkUSKe4SclpJmgArTud0qH
	rVfVlL921C/RGjRtFB+PYcyrGq5sPHZbegg5CffrVDVyF1PVBsKx2d5Zk19i9Sa6UGtjgy
	8xPc/CE0qvORpLcVkAYDDRHzUhMCkZQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 7/7] ARM64: xilinx: zynqmp: Convert to split QSPI bus
Date: Thu, 16 Jan 2025 18:21:17 -0500
Message-Id: <20250116232118.2694169-8-sean.anderson@linux.dev>
In-Reply-To: <20250116232118.2694169-1-sean.anderson@linux.dev>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152146_213845_A2A92DC3 
X-CRM114-Status: UNSURE (   9.61  )
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

Convert the ZynqMP devicetrees to use the split QSPI bus binding. This
is pretty simple, since all boards use only CS0.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts |  5 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts |  5 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts |  5 ++++-
 .../boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts   |  5 ++++-
 .../boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts   |  5 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts |  5 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts |  5 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts |  5 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts |  5 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts |  5 ++++-
 .../arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts |  5 ++++-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi            | 15 +++++++++++----
 12 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
index bfa7ea6b9224..64b90de5b4ce 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts
@@ -35,7 +35,7 @@ aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 		spi1 = &spi0;
 		spi2 = &spi1;
 		usb0 = &usb0;
@@ -129,6 +129,9 @@ mux {
 
 &qspi { /* MIO 0-5 - U143 */
 	status = "okay";
+};
+
+&qspi_lower {
 	spi_flash: flash@0 { /* MT25QU512A */
 		compatible = "jedec,spi-nor"; /* 64MB */
 		reg = <0>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts
index 04079d1704f1..8927e0463cf4 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts
@@ -19,7 +19,7 @@ / {
 	aliases {
 		serial0 = &uart0;
 		serial1 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 	};
 
 	chosen {
@@ -39,6 +39,9 @@ &dcc {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* 32MB */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
index 3dec57cf18be..da07b58706f0 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts
@@ -20,7 +20,7 @@ / {
 	aliases {
 		serial0 = &uart0;
 		serial1 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 	};
 
 	chosen {
@@ -40,6 +40,9 @@ &dcc {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* 32MB */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
index 6aff22d43361..ec570d68a4ae 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
@@ -27,7 +27,7 @@ aliases {
 		mmc1 = &sdhci1;
 		rtc0 = &rtc;
 		serial0 = &uart0;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 		usb0 = &usb0;
 	};
 
@@ -354,6 +354,9 @@ &psgtr {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* Micron MT25QU512ABB8ESF */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
index 6ec1d9813973..e1cfdc0db51e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts
@@ -26,7 +26,7 @@ aliases {
 		rtc0 = &rtc;
 		serial0 = &uart0;
 		serial1 = &uart1;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 	};
 
 	chosen {
@@ -172,6 +172,9 @@ &i2c1 {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* 32MB */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index 7e26489a1539..18e323e2aad7 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -31,7 +31,7 @@ aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 		usb0 = &usb0;
 	};
 
@@ -953,6 +953,9 @@ &psgtr {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* 16MB + 16MB */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index eb2090673ec1..026053c4116a 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -29,7 +29,7 @@ aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 		usb0 = &usb0;
 	};
 
@@ -439,6 +439,9 @@ &psgtr {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* n25q512a 128MiB */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
index 4694d0a841f1..da56e532dc2b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
@@ -29,7 +29,7 @@ aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 		usb0 = &usb0;
 	};
 
@@ -451,6 +451,9 @@ &psgtr {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* n25q512a 128MiB */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 7beedd730f94..8dd73b035969 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -31,7 +31,7 @@ aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 		usb0 = &usb0;
 	};
 
@@ -959,6 +959,9 @@ &psgtr {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* 16MB + 16MB */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index b67ff7ecf3c3..9ed7972c3b4e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -30,7 +30,7 @@ aliases {
 		rtc0 = &rtc;
 		serial0 = &uart0;
 		serial1 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 		usb0 = &usb0;
 	};
 
@@ -789,6 +789,9 @@ &psgtr {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor"; /* 16MB + 16MB */
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts
index a38c2baeba6c..99d007b3bfae 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts
@@ -20,7 +20,7 @@ / {
 	aliases {
 		serial0 = &uart0;
 		serial1 = &dcc;
-		spi0 = &qspi;
+		spi0 = &qspi_lower;
 	};
 
 	chosen {
@@ -44,6 +44,9 @@ &gpio {
 
 &qspi {
 	status = "okay";
+};
+
+&qspi_lower {
 	flash@0 {
 		compatible = "m25p80", "jedec,spi-nor";
 		reg = <0x0>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 5dac0542a48d..470e0b90382f 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -972,21 +972,28 @@ pcie_intc: legacy-interrupt-controller {
 			};
 		};
 
-		qspi: spi@ff0f0000 {
+		qspi: spi-controller@ff0f0000 {
 			bootph-all;
 			compatible = "xlnx,zynqmp-qspi-1.0";
 			status = "disabled";
 			clock-names = "ref_clk", "pclk";
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-parent = <&gic>;
-			num-cs = <1>;
 			reg = <0x0 0xff0f0000 0x0 0x1000>,
 			      <0x0 0xc0000000 0x0 0x8000000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
 			/* iommus = <&smmu 0x873>; */
 			power-domains = <&zynqmp_firmware PD_QSPI>;
 			resets = <&zynqmp_reset ZYNQMP_RESET_QSPI>;
+
+			qspi_lower: spi-lower {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			qspi_upper: spi-upper {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		psgtr: phy@fd400000 {
-- 
2.35.1.1320.gc452695387.dirty


