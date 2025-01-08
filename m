Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA470E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YyrkJBq2mH1yISy7/JG6kFRBJKpgaS5P9ogz7UdLxLo=; b=tzdySMda9RJ47Hn6n1BVHC79vk
	FEfDvTvKyw+TK1l9OsCLwg8n11i4UWZI0+oWNYI9BQjFkSOLf5Nsh2mnqh5uOot0eAovDdHO6XITr
	bS9RF82L0ETd+HUaFe+jh5Vs4AvTDLGzP0WfxnTTXn5ZTPwx8tBNSinucSB23AiBVlSGeTo8X7t9t
	clxQkFcTG3H99xeVIVE2pv9ncbPENSIyrQFJSNTdQpcD5uhghA9yQ6lLJZMziwou7Vebgci59hJ36
	7NOjsgzFEO5UuYRpUTbtuad0fWvyWwpuPzDyp9mldTA2lJb2iXEmPrZPjdBdfkFE/MkNSFFtwYDYA
	W1d3H9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeRP-0000000A0dp-0bGp;
	Wed, 08 Jan 2025 22:22:19 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeQA-0000000A0Po-08JR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 22:21:03 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508MKma12790219
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 8 Jan 2025 16:20:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736374848;
	bh=YyrkJBq2mH1yISy7/JG6kFRBJKpgaS5P9ogz7UdLxLo=;
	h=From:To:CC:Subject:Date;
	b=DaLXeEp3AZRS46UfzxpQboM561nzPLkvvnMgE8J2BZJeAKa22tr8VqPydrG0zLy8T
	 Hbt/lEGbbM5DXjw024vtMZJ13TkE7jnsnI16t2nGZRwEAlWx3RKG9qZVVZCgTXAEBJ
	 mtQ6DG11GMYtFGlOY2R22tySHyd7+EWJqv1Pmd4M=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508MKmp1078933;
	Wed, 8 Jan 2025 16:20:48 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 16:20:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 16:20:48 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508MKmXt007918;
	Wed, 8 Jan 2025 16:20:48 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am625: Add PRUSS-M node
Date: Wed, 8 Jan 2025 16:20:48 -0600
Message-ID: <20250108222048.818835-1-jm@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_142102_262257_C70C0CF6 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Kishon Vijay Abraham I <kishon@ti.com>

Add the DT node for the PRUSS-M processor subsystem that is present
on the K3 AM62x SoCs. The K3 AM62x family of SoC has one PRUSS-M
instance and it has two Programmable Real-Time Units (PRU0 and PRU1).

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
[ Judith: Fix pruss_iclk id for pruss_coreclk_mux ]
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 90 ++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 7d355aa73ea21..ee53e663b5bdb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -1079,6 +1079,96 @@ dphy0: phy@30110000 {
 		status = "disabled";
 	};
 
+	pruss: pruss@30040000 {
+		compatible = "ti,am625-pruss";
+		reg = <0x00 0x30040000 0x00 0x80000>;
+		power-domains = <&k3_pds 81 TI_SCI_PD_EXCLUSIVE>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x00 0x30040000 0x80000>;
+
+		pruss_mem: memories@0 {
+			reg = <0x0 0x2000>,
+			      <0x2000 0x2000>,
+			      <0x10000 0x10000>;
+			reg-names = "dram0", "dram1", "shrdram2";
+		};
+
+		pruss_cfg: cfg@26000 {
+			compatible = "ti,pruss-cfg", "syscon";
+			reg = <0x26000 0x200>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x26000 0x2000>;
+
+			clocks {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				pruss_coreclk_mux: coreclk-mux@3c {
+					reg = <0x3c>;
+					#clock-cells = <0>;
+					clocks = <&k3_clks 81 0>,  /* pruss_core_clk */
+						 <&k3_clks 81 14>; /* pruss_iclk */
+					assigned-clocks = <&pruss_coreclk_mux>;
+					assigned-clock-parents = <&k3_clks 81 14>;
+				};
+
+				pruss_iepclk_mux: iepclk-mux@30 {
+					reg = <0x30>;
+					#clock-cells = <0>;
+					clocks = <&k3_clks 81 3>,	/* pruss_iep_clk */
+						 <&pruss_coreclk_mux>;	/* pruss_coreclk_mux */
+					assigned-clocks = <&pruss_iepclk_mux>;
+					assigned-clock-parents = <&pruss_coreclk_mux>;
+				};
+			};
+		};
+
+		pruss_intc: interrupt-controller@20000 {
+			compatible = "ti,pruss-intc";
+			reg = <0x20000 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "host_intr0", "host_intr1",
+					  "host_intr2", "host_intr3",
+					  "host_intr4", "host_intr5",
+					  "host_intr6", "host_intr7";
+		};
+
+		pru0: pru@34000 {
+			compatible = "ti,am625-pru";
+			reg = <0x34000 0x3000>,
+			      <0x22000 0x100>,
+			      <0x22400 0x100>;
+			reg-names = "iram", "control", "debug";
+			firmware-name = "am62x-pru0-fw";
+			interrupt-parent = <&pruss_intc>;
+			interrupts = <16 2 2>;
+			interrupt-names = "vring";
+		};
+
+		pru1: pru@38000 {
+			compatible = "ti,am625-pru";
+			reg = <0x38000 0x3000>,
+			      <0x24000 0x100>,
+			      <0x24400 0x100>;
+			reg-names = "iram", "control", "debug";
+			firmware-name = "am62x-pru1-fw";
+			interrupt-parent = <&pruss_intc>;
+			interrupts = <18 3 3>;
+			interrupt-names = "vring";
+		};
+	};
+
 	gpmc0: memory-controller@3b000000 {
 		compatible = "ti,am64-gpmc";
 		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
-- 
2.47.1


