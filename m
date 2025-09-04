Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE504CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2LIre3TFhr3h5fh/GInYRrsD3Rw8KDu39s4B2GrA9Lc=; b=NtGHlDYi7eoyyX
	LOi36DJmNC8z/Q10z+NlTzpD+gpbVnZo5UPvd+aFqWFI8tgUebxpSK+AASpN9VY2dbiSel6wphYkx
	rExbfVVOEPxE5tMVIQKNFiCN2yTsJ6+xmriOs9hWoe5WMQkQHRQBBO6tnRsLmaleXHiBcEARQRVDT
	J7S39TJNybldcNV5J4u45LhJ26OWksh8dEcKqFg8hRN3/TwHRmG69YO+OFj/9+Fp8gRbPgxqCH7ir
	JHVQD79bSj2YAlwoBlg+Z8fgqzouKS5FCF+hQ9x5UnBs5VmO67A4z6sKMaflmHWUvw3ozTEPHpDP1
	jTRn9TjaPoONMV5/MSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8vT-0000000BVrh-0wTm;
	Thu, 04 Sep 2025 12:18:51 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7ga-0000000B3og-0sRf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:59:25 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584AxKSU2996009;
	Thu, 4 Sep 2025 05:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756983560;
	bh=2LIre3TFhr3h5fh/GInYRrsD3Rw8KDu39s4B2GrA9Lc=;
	h=From:To:Subject:Date;
	b=fCGOoLzptGzx7i5mnk6oQ39voYQMJMMRZYGyt7cVsJiY6+fDvFRTgz61Rd/G8wau+
	 0E0aUdcJEVxCYYWMyFKjlq6P67lCh/Rgb1TNnfcSYv3J8MsrwtVFOdqDFPGcbrgS5L
	 6FIae1MqDR7/yUWdgeL1ACeoE+AS2bTu+N9qdYLM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584AxKM8122137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 4 Sep 2025 05:59:20 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 05:59:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 05:59:19 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584AxFad3147561;
	Thu, 4 Sep 2025 05:59:16 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <u-kumar1@ti.com>,
        <s-jain1@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-j721e-main: Add DSI and DPHY-TX
Date: Thu, 4 Sep 2025 16:29:15 +0530
Message-ID: <20250904105915.3043773-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_035924_340961_06AF7CC6 
X-CRM114-Status: GOOD (  12.06  )
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

From: Rahul T R <r-ravikumar@ti.com>

TI's J721E SoC supports a DPI to DSI video signal conversion bridge on
it's platform bus. The IP is from Cadence, and it has a custom TI
wrapper around it to facilitate integration.

This IP takes the DPI video signals from DSS and alongwith the DPHY IP,
it transmits DSI video signals out of the SoC.

Add support for DSI bridge and the DPHY-TX.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
Changelog v1 --> v2:
- Updated phy labels

Link to v1:https://lore.kernel.org/all/1adea165-ae87-463f-a03e-2fe27f4b8695@ti.com/


 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 35 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index ab3666ff4297..df489bce86c9 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -671,7 +671,7 @@ cdns_csi2rx1: csi-bridge@4514000 {
 				 <&k3_clks 27 2>, <&k3_clks 27 3>, <&k3_clks 27 3>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
 				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
-			phys = <&dphy1>;
+			phys = <&dphy_rx>;
 			phy-names = "dphy";
 
 			ports {
@@ -714,7 +714,7 @@ dphy0: phy@4580000 {
 		status = "disabled";
 	};
 
-	dphy1: phy@4590000 {
+	dphy_rx: phy@4590000 {
 		compatible = "cdns,dphy-rx";
 		reg = <0x0 0x4590000 0x0 0x1100>;
 		#phy-cells = <0>;
@@ -1887,6 +1887,37 @@ port@4 {
 		};
 	};
 
+	dphy_tx: phy@4480000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x04480000 0x00 0x1000>;
+		clocks = <&k3_clks 296 1>, <&k3_clks 296 3>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 296 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 296 3>;
+		assigned-clock-parents = <&k3_clks 296 4>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@4800000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x04800000 0x00 0x100000>, <0x00 0x04710000 0x00 0x100>;
+		clocks = <&k3_clks 150 1>, <&k3_clks 150 5>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 150 TI_SCI_PD_EXCLUSIVE>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
 	dss: dss@4a00000 {
 		compatible = "ti,j721e-dss";
 		reg =
-- 
2.34.1


