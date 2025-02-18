Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B0FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mzZWC6x4HtKvt8lE1i3uuPpKisVzmzGwWeB1THsahc=; b=n6FbFIqMB4W/JMT6gyZnkexnMd
	d2V4vqYnLu0Hk5Mz0QKw40Sty8w2+xCMArQxihophC4DNBTD9FhU1oflOkKFxGGpi6JHkKABmLifX
	ZW50Ak1/vW5t7wW7udYBjoFap7svXYXkkjrMkosK1mhZ41sv6AkZNf0wfl4sox99cTELuvTrsVNfW
	CjgZrFnvkFHY9INaULQQW1GTRv1GCd+NOXxdy+TjqOVDO+6t4aU7N/8sHZZHnd0pQ2mOZSR4Kb02x
	svIwSXdTZLvB48gB67CValAiDlxN4ZZwwQEn3yQDLzVnX4AA4Nqhf2/PD7W9avz89Cg4w9nk673ZW
	whWx3KPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTDC-00000009YmY-3dtL;
	Tue, 18 Feb 2025 19:24:54 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSkR-00000009S4w-2NUl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:55:13 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIt4b2060601
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 12:55:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739904904;
	bh=+mzZWC6x4HtKvt8lE1i3uuPpKisVzmzGwWeB1THsahc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FvhT1M73oH/+1EmkvOkolL6mdvR/7BPV+5JmGpRcdIV+mQEwXmIOx5stvHxjyv3At
	 OAhSnGAH2Jx7+mYJBAIfxgjH7EU7Nr6ZKDYLdS5nTkKTYetNG3TAVT0Tz/8tMZQhrr
	 MKOKl/q3P3YzUGFAvw4PL//SMa5exESltZbzZWvA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIt4fN061082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 12:55:04 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 12:55:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 12:55:04 -0600
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IIsrxa123821;
	Tue, 18 Feb 2025 12:55:01 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <jai.luthra@linux.dev>,
        <y-abhilashchandra@ti.com>, <vaishnav.a@ti.com>
Subject: [PATCH 2/5] arm64: dts: ti: k3-j722s-main: Add CSI2RX nodes
Date: Wed, 19 Feb 2025 00:24:49 +0530
Message-ID: <20250218185452.600797-3-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218185452.600797-1-vaishnav.a@ti.com>
References: <20250218185452.600797-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105511_706390_C40AEE65 
X-CRM114-Status: GOOD (  10.56  )
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

J722S has 4 CSI2RX receiver instances with external DPHY. The first CSI2RX
instance node is derived from the AM62P common dtsi, Add the nodes for the
subsequent three instances and keep them disabled.

TRM (12.6 Camera Peripherals): https://www.ti.com/lit/zip/sprujb3

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 183 ++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index f8e4424f3bb7..e69e9b34c0a4 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -154,6 +154,189 @@ usb1: usb@31200000 {
 		};
 	};
 
+	ti_csi2rx1: ticsi2rx@30122000 {
+		compatible = "ti,j721e-csi2rx-shim";
+		reg = <0x00 0x30122000 0x00 0x1000>;
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dmas = <&main_bcdma_csi 0 0x5100 0>;
+		dma-names = "rx0";
+		power-domains = <&k3_pds 247 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		cdns_csi2rx1: csi-bridge@30121000 {
+			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
+			reg = <0x00 0x30121000 0x00 0x1000>;
+			clocks = <&k3_clks 247 0>, <&k3_clks 247 3>, <&k3_clks 247 0>,
+				 <&k3_clks 247 0>, <&k3_clks 247 4>, <&k3_clks 247 4>;
+			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+			phys = <&dphy1>;
+			phy-names = "dphy";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi1_port0: port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				csi1_port1: port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				csi1_port2: port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				csi1_port3: port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				csi1_port4: port@4 {
+					reg = <4>;
+					status = "disabled";
+				};
+			};
+		};
+	};
+
+	ti_csi2rx2: ticsi2rx@30142000 {
+		compatible = "ti,j721e-csi2rx-shim";
+		reg = <0x00 0x30142000 0x00 0x1000>;
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		power-domains = <&k3_pds 248 TI_SCI_PD_EXCLUSIVE>;
+		dmas = <&main_bcdma_csi 0 0x5200 0>;
+		dma-names = "rx0";
+		status = "disabled";
+
+		cdns_csi2rx2: csi-bridge@30141000 {
+			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
+			reg = <0x00 0x30141000 0x00 0x1000>;
+			clocks = <&k3_clks 248 0>, <&k3_clks 248 3>, <&k3_clks 248 0>,
+				 <&k3_clks 248 0>, <&k3_clks 248 4>, <&k3_clks 248 4>;
+			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+			phys = <&dphy2>;
+			phy-names = "dphy";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi2_port0: port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				csi2_port1: port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				csi2_port2: port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				csi2_port3: port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				csi2_port4: port@4 {
+					reg = <4>;
+					status = "disabled";
+				};
+			};
+		};
+	};
+
+	ti_csi2rx3: ticsi2rx@30162000 {
+		compatible = "ti,j721e-csi2rx-shim";
+		reg = <0x00 0x30162000 0x00 0x1000>;
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dmas = <&main_bcdma_csi 0 0x5300 0>;
+		dma-names = "rx0";
+		power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		cdns_csi2rx3: csi-bridge@30161000 {
+			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
+			reg = <0x00 0x30161000 0x00 0x1000>;
+			clocks = <&k3_clks 249 0>, <&k3_clks 249 3>, <&k3_clks 249 0>,
+				 <&k3_clks 249 0>, <&k3_clks 249 4>, <&k3_clks 249 4>;
+			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
+				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
+			phys = <&dphy3>;
+			phy-names = "dphy";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi3_port0: port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				csi3_port1: port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				csi3_port2: port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				csi3_port3: port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				csi3_port4: port@4 {
+					reg = <4>;
+					status = "disabled";
+				};
+			};
+		};
+	};
+
+	dphy1: phy@30130000 {
+		compatible = "cdns,dphy-rx";
+		reg = <0x00 0x30130000 0x00 0x1100>;
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 251 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	dphy2: phy@30150000 {
+		compatible = "cdns,dphy-rx";
+		reg = <0x00 0x30150000 0x00 0x1100>;
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
+	dphy3: phy@30170000 {
+		compatible = "cdns,dphy-rx";
+		reg = <0x00 0x30170000 0x00 0x1100>;
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 253 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+	};
+
 	main_r5fss0: r5fss@78400000 {
 		compatible = "ti,am62-r5fss";
 		#address-cells = <1>;
-- 
2.34.1


