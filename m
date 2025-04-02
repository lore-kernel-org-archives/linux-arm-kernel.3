Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153EEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+FwtTM6uNx2mwGR3w0xSfj5ZDKKSdhNsKMhEYgi3lo=; b=pmlUK19MnPMmdoZSVWvme/8Fec
	f8obpwrTA3SmqRcM2L1cOFPqDmDEf3IOeEQvFotiDUvxgHUzQC3buind629z0nbP4a1vv4qjp1Q90
	P9rb6QM4P9wDEOSYTdEzeCg2hAwh9C6w6skAUBf2Hm+uqTxXKCzqB4ue914Tcj2CS/A5uqndgyhcq
	G4Iv96u25giW2II2JDaSIhIr2vBx/SSXQSaDBdAemL2I8/hz6bA+r6KCQ/i1F7Gg9UO2bzoWY3T7v
	4wUJGk/RYxr+rGzMOjKKif/6a4krTHPo68yHHFPDdmc9KAKFJ7Tkckb/XfH8cY0BVM71f2G9/aK3u
	x1VE6zAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwSx-00000005wPm-0oy8;
	Wed, 02 Apr 2025 11:41:07 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwKO-00000005uHn-3BLI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:32:18 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW7jB3385651
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593527;
	bh=n+FwtTM6uNx2mwGR3w0xSfj5ZDKKSdhNsKMhEYgi3lo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=THaRjxo89cW0RISge3BpOsUn5LuY1H3XoLFagS9DxNKH49sCu9a6JeI11s5MgGVmA
	 puvvgQhZvchdBeK4f4dkQVwP1Mz4pzNeQ48KuKjuzNDIbOr/srsx/vyO3Tx/jF08pa
	 WGMt07SXzPWYjUNJjjdZwsvNCyzxuxB8l9vgNpWA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BW7tQ013392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:07 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:06 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BW5wB017398;
	Wed, 2 Apr 2025 06:32:06 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 2/5] arm64: dts: ti: k3-j721e: Add PCIe ctrl node to scm_conf region
Date: Wed, 2 Apr 2025 17:01:58 +0530
Message-ID: <20250402113201.151195-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_043216_908650_4DDD7D79 
X-CRM114-Status: GOOD (  14.03  )
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

From: Andrew Davis <afd@ti.com>

This region is used for controlling the function of the PCIe IP. It is
compatible with "ti,j784s4-pcie-ctrl", add this here and use it with
the PCIe nodes.

Signed-off-by: Andrew Davis <afd@ti.com>
[j-choudhary@ti.com: Add changes to k3-j721e-evm-pcie1-ep.dtso]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../boot/dts/ti/k3-j721e-evm-pcie0-ep.dtso    |  2 +-
 .../boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso    |  2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 28 ++++++++++++++++---
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtso
index 4062709d6579..a8a502a6207f 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtso
@@ -38,7 +38,7 @@ pcie0_ep: pcie-ep@2900000 {
 		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
-		ti,syscon-pcie-ctrl = <&scm_conf 0x4070>;
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <1>;
 		power-domains = <&k3_pds 239 TI_SCI_PD_EXCLUSIVE>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso
index a8cccdcf3e3b..436085157a69 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso
@@ -48,6 +48,6 @@ pcie1_ep: pcie-ep@2910000 {
 		dma-coherent;
 		phys = <&serdes1_pcie_link>;
 		phy-names = "pcie-phy";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index af3d730154ac..d7263ad43163 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -44,6 +44,26 @@ scm_conf: scm-conf@100000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x00100000 0x1c000>;
 
+		pcie0_ctrl: pcie-ctrl@4070 {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x4070 0x4>;
+		};
+
+		pcie1_ctrl: pcie-ctrl@4074 {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x4074 0x4>;
+		};
+
+		pcie2_ctrl: pcie-ctrl@4078 {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x4078 0x4>;
+		};
+
+		pcie3_ctrl: pcie-ctrl@407c {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x407c 0x4>;
+		};
+
 		serdes_ln_ctrl: mux-controller@4080 {
 			compatible = "reg-mux";
 			reg = <0x4080 0x50>;
@@ -946,7 +966,7 @@ pcie0_rc: pcie@2900000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x4070>;
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 239 TI_SCI_PD_EXCLUSIVE>;
@@ -975,7 +995,7 @@ pcie1_rc: pcie@2910000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
@@ -1004,7 +1024,7 @@ pcie2_rc: pcie@2920000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 342 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x4078>;
+		ti,syscon-pcie-ctrl = <&pcie2_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
@@ -1033,7 +1053,7 @@ pcie3_rc: pcie@2930000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 354 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x407c>;
+		ti,syscon-pcie-ctrl = <&pcie3_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
-- 
2.34.1


