Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC5AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhku16+L6UOMneh74gmOAB+C80CxnUV/UXbORcNGufQ=; b=b2OBJblFPiqJ9UdZ8fX0C3pndq
	Y0miIExF0uuMt/pEpawoW+bi53alKt+cLz4afBs2Z4k1TBByPYHg9cCbcMcwkWyWh/16bT2JI9Kzp
	oZaFwr5ezbffTEHGb5q4eX8eTp9MYeF/Nt6xSwimyq2qtlZORvOZgjC7RjADPouFyaHyIQeLLmtsY
	JVwzpC8yM4JWVbak43JkxyQdyQOTIinU5lBxqBoX1uIfxdbzQqY3rJJrt80dSz/zmLB1hljfmsKm4
	Ze96CNCXnbP0g3C5MEFCsi/69B4klXNdsosLjTEwFQhIVaNAmfDj5wB7Dh5vcF485Aicjb8zw7hhh
	hpInlLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeFu-0000000E9j5-21mN;
	Fri, 04 Jul 2025 11:06:58 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdN2-0000000E0SM-1jHO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 10:10:17 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 564AACBi267821;
	Fri, 4 Jul 2025 05:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751623812;
	bh=mhku16+L6UOMneh74gmOAB+C80CxnUV/UXbORcNGufQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mAH/ULnmNEKbaca8uVdM4uQuMnaezfAgA0nfn+1J/P2iXnz+iZE+vX9u5s6Kl0yyM
	 y6c5j/Z8DCSUj2ONjbS1+el1KKMtSH/gtgp9OsFODb+lhrdmcyaVKsrWNiLLdEtRqk
	 WpxdLHFPNrK0mP3sj232GKKWfhOS0kc4Licn53Es=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 564AACAW3289939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 05:10:12 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 05:10:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 05:10:12 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 564AABbQ2531794;
	Fri, 4 Jul 2025 05:10:12 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>, <andrew@lunn.ch>
Subject: [PATCH v6 1/4] arm64: dts: ti: Add bootph property to nodes at source for am62a
Date: Fri, 4 Jul 2025 15:39:51 +0530
Message-ID: <20250704100954.2231853-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704100954.2231853-1-p-bhagat@ti.com>
References: <20250704100954.2231853-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_031016_537328_706C0D36 
X-CRM114-Status: GOOD (  10.58  )
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

Add bootph property directly into the original definitions of relevant
nodes (e.g., power domains, USB controllers, and other peripherals)
within their respective DTSI files (ex. main, mcu, and wakeup) for
am62a.

By defining bootph in the nodes source definitions instead of appending
it later in final DTS files, this change ensures that the property is
inherently present wherever the nodes are reused across derived device
trees.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi   | 13 +++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 63e097ddf988..44e7e459f176 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -51,6 +51,7 @@ phy_gmii_sel: phy@4044 {
 			compatible = "ti,am654-phy-gmii-sel";
 			reg = <0x4044 0x8>;
 			#phy-cells = <1>;
+			bootph-all;
 		};
 
 		epwm_tbclk: clock-controller@4130 {
@@ -96,6 +97,7 @@ secure_proxy_main: mailbox@4d000000 {
 			#mbox-cells = <1>;
 			interrupt-names = "rx_012";
 			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			bootph-all;
 		};
 
 		inta_main_dmss: interrupt-controller@48000000 {
@@ -131,6 +133,7 @@ main_bcdma: dma-controller@485c0100 {
 			ti,sci-rm-range-bchan = <0x20>; /* BLOCK_COPY_CHAN */
 			ti,sci-rm-range-rchan = <0x21>; /* SPLIT_TR_RX_CHAN */
 			ti,sci-rm-range-tchan = <0x22>; /* SPLIT_TR_TX_CHAN */
+			bootph-all;
 		};
 
 		main_pktdma: dma-controller@485c0000 {
@@ -147,6 +150,8 @@ main_pktdma: dma-controller@485c0000 {
 				    "ring", "tchan", "rchan", "rflow";
 			msi-parent = <&inta_main_dmss>;
 			#dma-cells = <2>;
+			bootph-all;
+
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <30>;
 			ti,sci-rm-range-tchan = <0x23>, /* UNMAPPED_TX_CHAN */
@@ -220,16 +225,19 @@ dmsc: system-controller@44043000 {
 		k3_pds: power-controller {
 			compatible = "ti,sci-pm-domain";
 			#power-domain-cells = <2>;
+			bootph-all;
 		};
 
 		k3_clks: clock-controller {
 			compatible = "ti,k2g-sci-clk";
 			#clock-cells = <2>;
+			bootph-all;
 		};
 
 		k3_reset: reset-controller {
 			compatible = "ti,sci-reset";
 			#reset-cells = <2>;
+			bootph-all;
 		};
 	};
 
@@ -254,6 +262,7 @@ secure_proxy_sa3: mailbox@43600000 {
 		 * firmware on non-MPU processors
 		 */
 		status = "disabled";
+		bootph-all;
 	};
 
 	main_pmx0: pinctrl@f4000 {
@@ -282,6 +291,7 @@ main_timer0: timer@2400000 {
 		assigned-clock-parents = <&k3_clks 36 3>;
 		power-domains = <&k3_pds 36 TI_SCI_PD_EXCLUSIVE>;
 		ti,timer-pwm;
+		bootph-all;
 	};
 
 	main_timer1: timer@2410000 {
@@ -651,6 +661,7 @@ usb0: usb@31000000 {
 			interrupt-names = "host", "peripheral";
 			maximum-speed = "high-speed";
 			dr_mode = "otg";
+			bootph-all;
 			snps,usb2-gadget-lpm-disable;
 			snps,usb2-lpm-disable;
 		};
@@ -745,6 +756,7 @@ cpsw_port1: port@1 {
 				phys = <&phy_gmii_sel 1>;
 				mac-address = [00 00 00 00 00 00];
 				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
+				bootph-all;
 			};
 
 			cpsw_port2: port@2 {
@@ -764,6 +776,7 @@ cpsw3g_mdio: mdio@f00 {
 			clocks = <&k3_clks 13 0>;
 			clock-names = "fck";
 			bus_freq = <1000000>;
+			bootph-all;
 		};
 
 		cpts@3d000 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index 259ae6ebbfb5..9ef1c829a9df 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -17,6 +17,7 @@ wkup_conf: bus@43000000 {
 		chipid: chipid@14 {
 			compatible = "ti,am654-chipid";
 			reg = <0x14 0x4>;
+			bootph-all;
 		};
 
 		opp_efuse_table: syscon@18 {
@@ -67,6 +68,7 @@ wkup_uart0: serial@0 {
 			reg = <0 0x100>;
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
+			bootph-pre-ram;
 	       };
 	};
 
-- 
2.34.1


