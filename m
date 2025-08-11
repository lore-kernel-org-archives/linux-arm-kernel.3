Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92841CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 05:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbttRDwtQL6F01nXCzc3MsPtDdrZZyXIeBWI7o9ayMM=; b=HtMzJ8VRBkvBqbfqstByfloDT8
	fqubpT7TNwQnNUNOtdvGieEoUcT0DZ75D0KhqEdZdsoLMrkxHju+PmonfLpotMWASBCAlCc9MdL6M
	ldqSqNOyiOozLUn4su7CXgkIYJmxI5sLIZCA6rVgZ7hfWOBquHE9/rcPXrpmAvTbt86P++zwuUqxQ
	mVj78Kz6lLLduEmFqy5QgwxTIT7KTJj9rLIIjcWfRuu/HHv1psXSAk4SKqcZmlXXw5xsNVHU2dWNU
	fcA5WePt2V5HEyK59a/BhX0osCeXTjoffPnIf6/If/J1AwRAuFjMqKSztbz0yo68ZQNzUaSej61Xe
	rd71jRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhhE-00000009tT6-0KAT;
	Tue, 12 Aug 2025 05:37:16 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulh9m-00000009pgM-0Jk0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 05:02:44 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250812050240epoutp03a265f05fb4f4c7b59f8b665c1de65037~a7G2dTk880070500705epoutp03T
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:02:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250812050240epoutp03a265f05fb4f4c7b59f8b665c1de65037~a7G2dTk880070500705epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754974960;
	bh=GbttRDwtQL6F01nXCzc3MsPtDdrZZyXIeBWI7o9ayMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RdyvJPvvGWYDdNmZJxikTLkYHJk7q0pMFc7VAr6fhRVzlBpA0QJ0dAlc3twsm0L3o
	 tFGJg8U/4Z5FsdNvhwKCe2ZcUcVaOEW4oPMycdqYd9mI0LCHDNZBx8prDAg33d4ogz
	 Jc0llaqcuvFHMR3hSJwiucvJlTn9sN1s4LuymCi4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250812050239epcas5p2665d847e9747feb3822dd9ef7bf52bc8~a7G155p7l1168411684epcas5p20;
	Tue, 12 Aug 2025 05:02:39 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c1KBQ4T9Cz2SSKy; Tue, 12 Aug
	2025 05:02:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250811154746epcas5p261ba0c811f9dd8748f8f241b76be6525~awQz1S7tk3176231762epcas5p2X;
	Mon, 11 Aug 2025 15:47:46 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250811154743epsmtip137f9e1f9210743d87301c6ac42b9438d~awQxMaCYf2596225962epsmtip1K;
	Mon, 11 Aug 2025 15:47:43 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v3 12/12] arm64: dts: fsd: Add PCIe support for Tesla FSD
 SoC
Date: Mon, 11 Aug 2025 21:16:38 +0530
Message-ID: <20250811154638.95732-13-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811154638.95732-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250811154746epcas5p261ba0c811f9dd8748f8f241b76be6525
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154746epcas5p261ba0c811f9dd8748f8f241b76be6525
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154746epcas5p261ba0c811f9dd8748f8f241b76be6525@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_220242_472484_DF616E7D 
X-CRM114-Status: GOOD (  13.54  )
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

Add the support for PCIe controller driver and phy driver for Tesla FSD.
It includes support for both RC and EP.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts      |  34 +++++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi |  65 +++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi         | 147 +++++++++++++++++++++
 3 files changed, 246 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 9ff22e1c8723..1b63c5d72d19 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -130,3 +130,37 @@ &serial_0 {
 &ufs {
 	status = "okay";
 };
+
+&pcierc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_clkreq>, <&pcie1_wake>, <&pcie1_preset>,
+			<&pcie0_slot1>;
+};
+
+&pcieep2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_clkreq>, <&pcie1_wake>, <&pcie1_preset>,
+			<&pcie0_slot1>;
+};
+
+&pcierc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_clkreq>, <&pcie0_wake0>, <&pcie0_preset0>,
+			 <&pcie0_slot0>;
+};
+
+&pcieep0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_clkreq>, <&pcie0_wake0>, <&pcie0_preset0>,
+			 <&pcie0_slot0>;
+};
+
+&pcierc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_clkreq>, <&pcie0_wake1>, <&pcie0_preset0>;
+};
+
+&pcieep1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_clkreq>, <&pcie0_wake1>, <&pcie0_preset0>;
+};
diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
index 6f4658f57453..fa99aa4b9906 100644
--- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
@@ -120,6 +120,27 @@ eth0_mdio: eth0-mdio-pins {
 		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
 		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
 	};
+
+	pcie1_clkreq: pcie1-clkreq-pins {
+		samsung,pins = "gpf6-0";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
+
+	pcie1_wake: pcie1-wake-pins {
+		samsung,pins = "gpf6-1";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
+
+	pcie1_preset: pcie1-preset-pins {
+		samsung,pins = "gpf6-2";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
 };
 
 &pinctrl_peric {
@@ -493,6 +514,50 @@ eth1_mdio: eth1-mdio-pins {
 		samsung,pin-pud = <FSD_PIN_PULL_UP>;
 		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
 	};
+
+	pcie0_clkreq: pcie0-clkreq-pins {
+		samsung,pins = "gpc8-0";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
+
+	pcie0_wake0: pcie0-wake0-pins {
+		samsung,pins = "gpc8-1";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
+
+	pcie0_preset0: pcie0-preset0-pins {
+		samsung,pins = "gpc8-2";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
+
+	pcie0_wake1: pcie0-wake1-pins {
+		samsung,pins = "gpc8-3";
+		samsung,pin-function = <FSD_PIN_FUNC_2>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+	};
+
+	pcie0_slot0: pcie0-gpio22-pins {
+		samsung,pins = "gpg2-6";
+		samsung,pin-function = <FSD_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+		samsung,pin-val = <1>;
+	};
+
+	pcie0_slot1: pcie0-gpio23-pins {
+		samsung,pins = "gpg2-7";
+		samsung,pin-function = <FSD_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <FSD_PIN_PULL_UP>;
+		samsung,pin-drv = <FSD_PIN_DRV_LV4>;
+		samsung,pin-val = <1>;
+	};
 };
 
 &pinctrl_pmu {
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index a5ebb3f9b18f..8ed8d2131855 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -1009,6 +1009,16 @@ ethernet1: ethernet@14300000 {
 			status = "disabled";
 		};
 
+		pciephy0: pcie-phy@15080000 {
+			compatible = "tesla,fsd-pcie-phy0";
+			reg = <0x0 0x15080000 0x0 0x2000>,
+			      <0x0 0x150a0000 0x0 0x1000>;
+			#phy-cells = <0>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			samsung,fsys-sysreg = <&sysreg_fsys0>;
+			status = "disabled";
+		};
+
 		ufs: ufs@15120000 {
 			compatible = "tesla,fsd-ufs";
 			reg = <0x0 0x15120000 0x0 0x200>,  /* 0: HCI standard */
@@ -1057,6 +1067,143 @@ ethernet0: ethernet@15300000 {
 			iommus = <&smmu_fsys0 0x0 0x1>;
 			status = "disabled";
 		};
+
+		pcierc2: pcie@15400000 {
+			compatible = "tesla,fsd-pcie";
+			reg = <0x0 0x15400000 0x0 0x2000>,
+			      <0x0 0x15090000 0x0 0x1000>,
+			      <0x0 0x15800000 0x0 0x1000>;
+			reg-names = "dbi", "elbi", "config";
+			ranges =  <0x82000000 0 0x15801000 0 0x15801000 0 0xffefff>;
+			clocks = <&clock_fsys0 PCIE_SUBCTRL_INST0_AUX_CLK_SOC>,
+				 <&clock_fsys0 PCIE_SUBCTRL_INST0_DBI_ACLK_SOC>,
+				 <&clock_fsys0 PCIE_SUBCTRL_INST0_MSTR_ACLK_SOC>,
+				 <&clock_fsys0 PCIE_SUBCTRL_INST0_SLV_ACLK_SOC>;
+			clock-names = "aux", "dbi", "mstr", "slv";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			dma-coherent;
+			device_type = "pci";
+			interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+			num-lanes = <4>;
+			phys = <&pciephy0>;
+			iommu-map = <0x0 &smmu_fsys0 0x4 0x10000>;
+			iommu-map-mask = <0x0>;
+			samsung,syscon-pcie = <&sysreg_fsys0 0x434>;
+			status = "disabled";
+		};
+
+		pcieep2: pcie-ep@15400000 {
+			compatible = "tesla,fsd-pcie-ep";
+			reg = <0x0 0x15090000 0x0 0x1000>,
+			      <0x0 0x15400000 0x0 0x2000>,
+			      <0x0 0x15402000 0x0 0x80>,
+			      <0x0 0x15800000 0x0 0xff0000>;
+			reg-names = "elbi", "dbi", "dbi2", "addr_space";
+			clocks = <&clock_fsys0 PCIE_SUBCTRL_INST0_AUX_CLK_SOC>,
+				 <&clock_fsys0 PCIE_SUBCTRL_INST0_DBI_ACLK_SOC>,
+				 <&clock_fsys0 PCIE_SUBCTRL_INST0_MSTR_ACLK_SOC>,
+				 <&clock_fsys0 PCIE_SUBCTRL_INST0_SLV_ACLK_SOC>;
+			clock-names = "aux", "dbi", "mstr", "slv";
+			num-lanes = <4>;
+			phys = <&pciephy0>;
+			samsung,syscon-pcie = <&sysreg_fsys0 0x434>;
+			status = "disabled";
+		};
+
+		pciephy1: pcie-phy@16880000 {
+			compatible = "tesla,fsd-pcie-phy1";
+			reg = <0x0 0x16880000 0x0 0x2000>,
+			      <0x0 0x16860000 0x0 0x1000>;
+			#phy-cells = <0>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			samsung,fsys-sysreg = <&sysreg_fsys1>;
+			status = "disabled";
+		};
+
+		pcierc0: pcie@16a00000 {
+			compatible = "tesla,fsd-pcie";
+			reg = <0x0 0x16a00000 0x0 0x2000>,
+			      <0x0 0x168b0000 0x0 0x1000>,
+			      <0x0 0x17000000 0x0 0x1000>;
+			reg-names = "dbi", "elbi", "config";
+			ranges =  <0x82000000 0 0x17001000 0 0x17001000 0 0xffefff>;
+			clocks = <&clock_fsys1 PCIE_LINK0_IPCLKPORT_AUX_ACLK>,
+				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_DBI_ACLK>,
+				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_MSTR_ACLK>,
+				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_SLV_ACLK>;
+			clock-names = "aux", "dbi", "mstr", "slv";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			dma-coherent;
+			device_type = "pci";
+			interrupts = <GIC_SPI 115 IRQ_TYPE_EDGE_RISING>;
+			num-lanes = <4>;
+			phys = <&pciephy1>;
+			iommu-map = <0x0 &smmu_imem 0x0 0x10000>;
+			iommu-map-mask = <0x0>;
+			samsung,syscon-pcie = <&sysreg_fsys1 0x50c>;
+			status = "disabled";
+		};
+
+		pcieep0: pcie-ep@16a00000 {
+			compatible = "tesla,fsd-pcie-ep";
+			reg = <0x0 0x168b0000 0x0 0x1000>,
+			      <0x0 0x16a00000 0x0 0x2000>,
+			      <0x0 0x16a02000 0x0 0x80>,
+			      <0x0 0x17000000 0x0 0xff0000>;
+			reg-names = "elbi", "dbi", "dbi2", "addr_space";
+			clocks = <&clock_fsys1 PCIE_LINK0_IPCLKPORT_AUX_ACLK>,
+				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_DBI_ACLK>,
+				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_MSTR_ACLK>,
+				 <&clock_fsys1 PCIE_LINK0_IPCLKPORT_SLV_ACLK>;
+			clock-names = "aux", "dbi", "mstr", "slv";
+			num-lanes = <4>;
+			phys = <&pciephy1>;
+			samsung,syscon-pcie = <&sysreg_fsys1 0x50c>;
+			status = "disabled";
+		};
+
+		pcierc1: pcie@16b00000 {
+			compatible = "tesla,fsd-pcie";
+			reg = <0x0 0x16b00000 0x0 0x2000>,
+			      <0x0 0x168c0000 0x0 0x1000>,
+			      <0x0 0x18000000 0x0 0x1000>;
+			reg-names = "dbi", "elbi", "config";
+			ranges =  <0x82000000 0 0x18001000 0 0x18001000 0 0xffefff>;
+			clocks = <&clock_fsys1 PCIE_LINK1_IPCLKPORT_AUX_ACLK>,
+				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_DBI_ACLK>,
+				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_MSTR_ACLK>,
+				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_SLV_ACLK>;
+			clock-names = "aux", "dbi", "mstr", "slv";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			dma-coherent;
+			device_type = "pci";
+			interrupts = <GIC_SPI 117 IRQ_TYPE_EDGE_RISING>;
+			num-lanes = <4>;
+			phys = <&pciephy1>;
+			samsung,syscon-pcie = <&sysreg_fsys1 0x510>;
+			status = "disabled";
+		};
+
+		pcieep1: pcie-ep@16b00000 {
+			compatible = "tesla,fsd-pcie-ep";
+			reg = <0x0 0x168c0000 0x0 0x1000>,
+			      <0x0 0x16b00000 0x0 0x2000>,
+			      <0x0 0x16b02000 0x0 0x80>,
+			      <0x0 0x18000000 0x0 0xff0000>;
+			reg-names = "elbi", "dbi", "dbi2", "addr_space";
+			clocks = <&clock_fsys1 PCIE_LINK1_IPCLKPORT_AUX_ACLK>,
+				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_DBI_ACLK>,
+				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_MSTR_ACLK>,
+				 <&clock_fsys1 PCIE_LINK1_IPCLKPORT_SLV_ACLK>;
+			clock-names = "aux", "dbi", "mstr", "slv";
+			num-lanes = <4>;
+			phys = <&pciephy1>;
+			samsung,syscon-pcie = <&sysreg_fsys1 0x510>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.49.0


