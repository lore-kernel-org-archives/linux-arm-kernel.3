Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231B2C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xb3iRxXvGk20O23xKEKRuA+Ow7dsmLleFKY4SD/OGQI=; b=f2XFA7YJybpaFavZ5tXdZ6/lak
	Z1AwYBsbaNtSZMW9+HeOoxAsmjhDSiKlbFQkT4Q9cPkUvU8Jv9Kp4fgeH4JjWSBrJlP7Bn9AhJpfI
	hyJaMAx1mhHVIpw1hMI09ePMPo/pC3yyyumrc2RKnH3lPqpxT9d1KDPlj7mIv58Tiit5EzTVtdfl3
	ZC5xO7MPd7ceryoxFc+1hxBi9YsLfSiRRjiy1XOOql2cXOMIcIePKgXceZRKNVZ1g54l6dHWf4ZVW
	JMimJGoXzRfrqS4iGUly1yUr8lJcUE9jJvfq4zSJ10aEdtUNsj9c67CW8yEVykyBMYo+fIb1tL0BZ
	32g970Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvNs-00000006rSU-3Ltp;
	Wed, 16 Jul 2025 06:12:52 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvCn-00000006pk7-0IcN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:01:26 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56G61M25178212;
	Wed, 16 Jul 2025 01:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752645682;
	bh=Xb3iRxXvGk20O23xKEKRuA+Ow7dsmLleFKY4SD/OGQI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CQF9n9Jqt0ntEZwcO0O9PC7MlFTDlkT/j3psYaltP2A7nqmMlA55xYkO5MCzRh1uH
	 WPslolGg9EFQSzL5O9zsSROHivUMKRoi/eOLrfHVKH7b3uZZPL1iTHmQ73eiEd4Apu
	 QvUZ8LqpQPemEbj/xgIUGvDNZHrxkfdh3IpS+ZE0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56G61Li1622895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 16 Jul 2025 01:01:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 16
 Jul 2025 01:01:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 16 Jul 2025 01:01:21 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.166])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56G61K583833010;
	Wed, 16 Jul 2025 01:01:20 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v3 3/7] arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
Date: Wed, 16 Jul 2025 11:31:10 +0530
Message-ID: <20250716060114.52122-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716060114.52122-1-j-choudhary@ti.com>
References: <20250716060114.52122-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_230125_200794_19C59721 
X-CRM114-Status: GOOD (  10.28  )
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

Add DT nodes for DPI to DSI Bridge and DSI Phy. The DSI bridge is
Cadence DSI and the PHY is a Cadence DPHY with TI wrapper.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
[j-choudhary@ti.com: disable dsi and dphy nodes, rename dphy node]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 62f45377a2c9..c31d7f3eab28 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1795,6 +1795,45 @@ main_spi7: spi@2170000 {
 		status = "disabled";
 	};
 
+	dphy_tx0: phy@4480000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x04480000 0x00 0x00001000>;
+		clocks = <&k3_clks 363 8>, <&k3_clks 363 14>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 363 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 363 14>;
+		assigned-clock-parents = <&k3_clks 363 15>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@4800000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x04800000 0x00 0x00100000>,
+		      <0x00 0x04710000 0x00 0x00000100>;
+		clocks = <&k3_clks 154 4>, <&k3_clks 154 1>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 154 TI_SCI_PD_EXCLUSIVE>;
+		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	dss: dss@4a00000 {
 		compatible = "ti,j721e-dss";
 		reg = <0x00 0x04a00000 0x00 0x10000>, /* common_m */
-- 
2.34.1


