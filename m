Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2441CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfX/ah/6VX+Ci3jz4VsR3kNtJeuSem2ygxM8WkE8lRs=; b=thNjQ2Dq/5zzsS028OUlvJ4R1N
	Q5UquCopAhjhQJ9UWO+Kjeh7qCTU/7uMdT9gMyffbEMngt9Wf3Fis76QUJrCcQ6s+9rbjVAK2TVg1
	1RO5pAZm4jHHfQCdNTKWwBDXJZPKoDVklL4FvORvOc2X2IgTGKGhvJWb7vVM5gYOdKBKtrgPLvcVh
	0qAJxzQAVTeu0+zp2gZuJNMIZz5clfuwXQECCLDzEUYySGGaJumb2ZDmlwYaZgaXYPPymxw4IPuc+
	lyQzwXN7sxRH9mrVdq+pdKXLa3NiFSbFI/9FmD4IRNarac+kag5z9pRE3qBkrIFLvdHMGW0eRTrMi
	s5b0ZteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRqT-0000000E4bj-1iIV;
	Mon, 08 Sep 2025 02:43:05 +0000
Received: from mo-csw1801.securemx.jp ([210.130.202.135] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRiF-0000000E2Zc-1Yng
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:34:36 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:Cc:
	Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding;i=nobuhiro.iwamatsu.x90@mail.toshiba;s=key1.smx;t=
	1757298855;x=1758508455;bh=kpMca/5dNix8RowhERmzPIAooipbVYa60Q5uc1/4vjA=;b=O5U
	CuK6cOg7aMbJJ1RTc82mt1mISFZT0UVhkgGTwQYRrjBNR8EAfxvWT05kK4WQMEw5NWdApLO5p6/qw
	pRGnkGiPb8HDXI8kMtWVay4VYhUridv6q/qzL09JgNYRZpL4oCpKrzZRv6eMvtjDtfMEr2gjWUfuc
	2v6Xpev1lPTQGf38jebaTUL1wQNz4iiDSQZ/Uksydf0Q5IjeixVH/N83/jLxxkIwE82OgompvzWdV
	w73wO9FbOCUUHudpxHZAoiatOeSaEBGJEw/J6WjS/ngb9JkTcIW2hReuIolDOC1FNJDvuGDcGjpY4
	WcSzATh0L4JIn9hzqryi2+n8PeWg14w==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 5882YF273421850; Mon, 8 Sep 2025 11:34:15 +0900
X-Iguazu-Qid: 2yAanLGiwHAfmuanNB
X-Iguazu-QSIG: v=2; s=0; t=1757298855; q=2yAanLGiwHAfmuanNB; m=4x74FXYoyvvLCiG4tTIIRDtA5zJVdJzywQYyEanetjs=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cKrch5GKRz1xnZ; Mon,  8 Sep 2025 11:34:12 +0900 (JST)
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Subject: [PATCH v3 1/2] arm64: dts: toshiba: Update SoC and PCIe ranges to reflect hardware behavior
Date: Mon,  8 Sep 2025 11:34:07 +0900
X-TSB-HOP2: ON
Message-Id: <1757298848-15154-2-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1757298848-15154-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
References: <1757298848-15154-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_193435_627432_38EEE333 
X-CRM114-Status: GOOD (  12.94  )
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

From: Frank Li <Frank.Li@nxp.com>

tmpv7708 trim address bit[31:30] in tmpv7708 before passing to the PCIe
controller. Since only PCIe controller needs to convert the address range
0x40000000 - 0x80000000, add a bus definition, describe the ranges in it,
and move the PCIe definition.

Prepare for the removal of the driver’s cpu_addr_fixup().

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Suggested-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>

---
v3:
 Move update in drivers/pci/controller/dwc/pcie-visconti.c to patch 2.
 Update Signed-off-by address, because my company email address has changed.

v2:
  Update commit message.
  Fix range.
  Set true to use_parent_dt_ranges.
  move pcie under the dedicated sub-bus.
---
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi | 75 ++++++++++++++---------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
index 39806f0ae5133..b754965a76ca6 100644
--- a/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
+++ b/arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
@@ -478,37 +478,52 @@ pwm: pwm@241c0000 {
 			status = "disabled";
 		};
 
-		pcie: pcie@28400000 {
-			compatible = "toshiba,visconti-pcie";
-			reg = <0x0 0x28400000 0x0 0x00400000>,
-			      <0x0 0x70000000 0x0 0x10000000>,
-			      <0x0 0x28050000 0x0 0x00010000>,
-			      <0x0 0x24200000 0x0 0x00002000>,
-			      <0x0 0x24162000 0x0 0x00001000>;
-			reg-names = "dbi", "config", "ulreg", "smu", "mpu";
-			device_type = "pci";
-			bus-range = <0x00 0xff>;
-			num-lanes = <2>;
-			num-viewport = <8>;
-
-			#address-cells = <3>;
+		pcie_bus: bus@24000000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
 			#size-cells = <2>;
-			#interrupt-cells = <1>;
-			ranges = <0x81000000 0 0x40000000 0 0x40000000 0 0x00010000
-				  0x82000000 0 0x50000000 0 0x50000000 0 0x20000000>;
-			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi", "intr";
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map =
-				<0 0 0 1 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
-				 0 0 0 2 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
-				 0 0 0 3 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
-				 0 0 0 4 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-			max-link-speed = <2>;
-			clocks = <&extclk100mhz>, <&pismu TMPV770X_CLK_PCIE_MSTR>, <&pismu TMPV770X_CLK_PCIE_AUX>;
-			clock-names = "ref", "core", "aux";
-			status = "disabled";
+			ranges = /* register 1:1 map */
+				 <0x0 0x24000000 0x0 0x24000000 0x0 0x0C000000>,
+				 /*
+				  * bus fabric mask address bit 30 and 31 to 0
+				  * before send to PCIe controller.
+				  *
+				  * PCIe map address 0 to cpu's 0x40000000
+				  */
+				 <0x0 0x00000000 0x0 0x40000000 0x0 0x40000000>;
+
+			pcie: pcie@28400000 {
+				compatible = "toshiba,visconti-pcie";
+				reg = <0x0 0x28400000 0x0 0x00400000>,
+				      <0x0 0x30000000 0x0 0x10000000>,
+				      <0x0 0x28050000 0x0 0x00010000>,
+				      <0x0 0x24200000 0x0 0x00002000>,
+				      <0x0 0x24162000 0x0 0x00001000>;
+				reg-names = "dbi", "config", "ulreg", "smu", "mpu";
+				device_type = "pci";
+				bus-range = <0x00 0xff>;
+				num-lanes = <2>;
+				num-viewport = <8>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				#interrupt-cells = <1>;
+				ranges = <0x81000000 0 0x00000000 0 0x00000000 0 0x00010000
+					  0x82000000 0 0x10000000 0 0x10000000 0 0x20000000>;
+				interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "msi", "intr";
+				interrupt-map-mask = <0 0 0 7>;
+				interrupt-map =
+					<0 0 0 1 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
+					 0 0 0 2 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
+					 0 0 0 3 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH
+					 0 0 0 4 &gic GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
+				max-link-speed = <2>;
+				clocks = <&extclk100mhz>, <&pismu TMPV770X_CLK_PCIE_MSTR>, <&pismu TMPV770X_CLK_PCIE_AUX>;
+				clock-names = "ref", "core", "aux";
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.51.0



