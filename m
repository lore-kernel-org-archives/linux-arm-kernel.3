Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC33C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 01:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVPVE9HygUoPNngYy3+GJxic66B5L1QffNiGeXc3OFw=; b=u4D89COJRx2hMzdHm5DaiBnxvf
	0Su+D0S4HEWBf1t5aLnd6UrZPHaQYbIXzs6EGWhY8mhKogAproph+o+0Dq3t1DHhNfdHGmHV7Re+f
	UjbTorSzdCQzPNDXoLQTDtbhyW8vRTLmxpYjyrA9l4pvjAsKSH3GXwDmFOTnYypFx2wguO5Rrl6MI
	JnOvJ0GsalsylZM8dYlbCD7NUxNK7My3GYBLX7xU2iYGPdco0M+/KeDVfYSbIpwpTJhVU21cx0h+e
	0QnRcuW3jlDbypL56Om081jkcln0SdIbs8OmEpXijNblFRz1qdJRMBghUB2uj6Mnu+N2AZIaAGRUn
	pcx9n8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6tj-0000000Bbmm-00SE;
	Tue, 05 Aug 2025 01:55:27 +0000
Received: from mo-csw1122.securemx.jp ([210.130.202.158] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6m2-0000000BbKa-1NVg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 01:47:33 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding;i=nobuhiro1.iwamatsu@toshiba.co.jp;s=key1.smx;t=
	1754358429;x=1755568029;bh=neqNdmldpuryoEt/oE6B8kqds2SPXVzEpnErBn3Sfl8=;b=hkc
	qAktrHSKIeHwLotuGz+96E0/DN4RHBPlo15vuTkxvTWLd3nsYBfRtuKsIrUnyzPl3N51TUKNiS9O8
	HugPBk5MSKNJK/yRCR1/+sz94qdmthneJiN3W7x8B7PJwggTXjHLNK9xDbxz5XihLR/tJxecaQ5pw
	Vi2HEZJ9uqk1TiGGjKifRBnK6mlSYoVVqZUJt04X9PQi+0o5IR9+V3ocBeNmxgaHVuIG5TnXloCPh
	uSc1J4WFJosSa73NCQa7j7u5BmVyrOBAYQL/2s0+FwQ4vIUXKGuYTWOqJEdSC7exAjsRaZeMoEVvF
	15rSc9EZGBYwUnfILyTggWHXvaXo4vQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 5751l9in3375490; Tue, 5 Aug 2025 10:47:09 +0900
X-Iguazu-Qid: 2rWhiV7hVXNSACf7DB
X-Iguazu-QSIG: v=2; s=0; t=1754358428; q=2rWhiV7hVXNSACf7DB; m=ZCdzXZWspI31Vh8pxQP/gZUZi5imt8ps7npCWydkgF8=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1121) id 5751l7Jc3436609
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 5 Aug 2025 10:47:07 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v2 1/2] arm64: dts: toshiba: Update SoC and PCIe ranges to reflect hardware behavior
Date: Tue,  5 Aug 2025 10:47:00 +0900
X-TSB-HOP2: ON
Message-Id: <1754358421-12578-2-git-send-email-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1754358421-12578-1-git-send-email-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <1754358421-12578-1-git-send-email-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_184730_704050_09E48FD0 
X-CRM114-Status: GOOD (  14.86  )
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
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
v2:
  Update commit message.
  Fix range.
  Set true to use_parent_dt_ranges in pcie-visconti.c.
  move pcie under the dedicated sub-bus.

 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi  | 75 +++++++++++++---------
 drivers/pci/controller/dwc/pcie-visconti.c |  2 +
 2 files changed, 47 insertions(+), 30 deletions(-)

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
diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
index cdeac6177143c..2a724ab587f78 100644
--- a/drivers/pci/controller/dwc/pcie-visconti.c
+++ b/drivers/pci/controller/dwc/pcie-visconti.c
@@ -310,6 +310,8 @@ static int visconti_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
+	pci->use_parent_dt_ranges = true;
+
 	return visconti_add_pcie_port(pcie, pdev);
 }
 
-- 
2.49.0



