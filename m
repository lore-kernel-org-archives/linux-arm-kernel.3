Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5C3D0BB48
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 05:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2P/n8qOVQ/193CdfajD1J+Oma75AgqNoZyY1Pitb1Y0=; b=TecsAEZ2Hyl3eJvRX40pFIzqXH
	4C8DsqYicEkW0tbRSloJbJPMkcgBY9SgT5a48i8S8ln8t2Ko7UMLUkL7MdzLlv7qoOBFlY5Unoycu
	ZplNMeWQVdlGMi+08rhLYNytotg7/IIQUo2SWkdG6hmZDRLsdJUM3qUteE0oPPFHRvKfw7h8ti/t0
	PTgd87yrUvJrLjQeTE6JbDPlkMoASZKtlVUZpYDJau9pr+pK/x9xSoratadBYLGdoY1olUO0Pk8Qt
	xYEkW2CH5vvI7hcTPyIY2zn1Mt2Asl0nBjCmaDah+PevgXLtrOTylWa4Iay7QrblX/jMWPRw3KDWG
	PNasG+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qPG-0000000GoK8-0LYz;
	Thu, 24 Oct 2024 05:29:10 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3qHr-0000000Gn1n-0PVE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 05:21:32 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49O5LRvP015355;
	Thu, 24 Oct 2024 00:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729747287;
	bh=2P/n8qOVQ/193CdfajD1J+Oma75AgqNoZyY1Pitb1Y0=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=mnMaH7wzNi/hMcqx/3ADxrb5gH9ztgvrpLycrpNf4SrZOn6ZLa8nK4N6PD3tZv/BW
	 x7Mw+STcNi/UmJlLzPsGhNN6DmpK53HGeluOS8Nhb//b8+eG66z7QlTi59/MUXs4Kq
	 sWs0hXEcMG+ILAJQpPyZzJl/q4GaMs9gXoipFsH0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49O5LR5v072014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Oct 2024 00:21:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 00:21:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 00:21:26 -0500
Received: from [127.0.1.1] (uda0497581.dhcp.ti.com [10.24.68.185])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O5L4lC090467;
	Thu, 24 Oct 2024 00:21:22 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
Date: Thu, 24 Oct 2024 10:51:01 +0530
Subject: [PATCH v6 04/12] arm64: dts: ti: k3-j721s2: Add bootph-*
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-b4-upstream-bootph-all-v6-4-2af90e3a4fe7@ti.com>
References: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
In-Reply-To: <20241024-b4-upstream-bootph-all-v6-0-2af90e3a4fe7@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Aniket Limaye <a-limaye@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Beleswar Padhi
	<b-padhi@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Davis
	<afd@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729747264; l=4130;
 i=m-chawdhry@ti.com; s=20231127; h=from:subject:message-id;
 bh=2BDHihROVg8eztkArItUGNLASEwXMBXatnAsVyQgE+A=;
 b=klrXbMugIXlCxlUX4aXv8bwN4zNQpIjdvFiixdAd8g48IYpe9Gu4Tm7TATYpd3GEYdzHeOAN1
 JNhbyhHmnLnBv15QK6JjWpAdBSDh0ETEJXLrng4wSI8Y+vqSxi2zY+n
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519;
 pk=fsr6Tm39TvsTgfyfFQLk+nnqIz2sBA1PthfqqfiiYSs=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_222131_299740_64D65CC8 
X-CRM114-Status: UNSURE (   9.57  )
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

Adds bootph-* properties to the leaf nodes to enable bootloaders to
utilise them.

Following adds bootph-* to
- System controller nodes that allow controlling power domain, clocks, etc.
- secure_proxy_sa3/secure_proxy_main mboxes for communication with
  System Controller
- mcu_ringacc/mcu_udmap for DMA to SMS
- chipid for detection soc information.
- mcu_timer0 for bootloader tick-timer.
- wkup_vtm for enabling Adaptive voltage scaling(AVS) support

Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---

Notes:
    R-by picked up in v3 ( Andrew )

 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi       |  1 +
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 9ed6949b40e9dfafdaf6861944b0b128b053a44f..9889144d665a832e5346e13daa7887c9c968fbcd 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -816,6 +816,7 @@ secure_proxy_main: mailbox@32c00000 {
 			      <0x00 0x32800000 0x00 0x100000>;
 			interrupt-names = "rx_011";
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			bootph-all;
 		};
 
 		hwspinlock: spinlock@30e00000 {
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index 9d96b19d0e7cf5bb86b50c73f4ec1a6b43b8bf83..c36888c455316774a07d69326262465ac958a6fc 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -21,16 +21,19 @@ sms: system-controller@44083000 {
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
 
@@ -43,6 +46,7 @@ wkup_conf: bus@43000000 {
 		chipid: chipid@14 {
 			compatible = "ti,am654-chipid";
 			reg = <0x14 0x4>;
+			bootph-all;
 		};
 	};
 
@@ -53,6 +57,8 @@ secure_proxy_sa3: mailbox@43600000 {
 		reg = <0x00 0x43600000 0x00 0x10000>,
 		      <0x00 0x44880000 0x00 0x20000>,
 		      <0x00 0x44860000 0x00 0x20000>;
+		bootph-pre-ram;
+
 		/*
 		 * Marked Disabled:
 		 * Node is incomplete as it is meant for bootloaders and
@@ -167,6 +173,7 @@ mcu_timer0: timer@40400000 {
 		assigned-clocks = <&k3_clks 35 1>;
 		assigned-clock-parents = <&k3_clks 35 2>;
 		power-domains = <&k3_pds 35 TI_SCI_PD_EXCLUSIVE>;
+		bootph-pre-ram;
 		ti,timer-pwm;
 		/* Non-MPU Firmware usage */
 		status = "reserved";
@@ -361,6 +368,7 @@ wkup_i2c0: i2c@42120000 {
 		clocks = <&k3_clks 223 1>;
 		clock-names = "fck";
 		power-domains = <&k3_pds 223 TI_SCI_PD_EXCLUSIVE>;
+		bootph-all;
 		status = "disabled";
 	};
 
@@ -469,6 +477,7 @@ mcu_ringacc: ringacc@2b800000 {
 			      <0x0 0x2a500000 0x0 0x40000>,
 			      <0x0 0x28440000 0x0 0x40000>;
 			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
+			bootph-all;
 			ti,num-rings = <286>;
 			ti,sci-rm-range-gp-rings = <0x1>;
 			ti,sci = <&sms>;
@@ -488,6 +497,7 @@ mcu_udmap: dma-controller@285c0000 {
 				    "tchan", "rchan", "rflow";
 			msi-parent = <&main_udmass_inta>;
 			#dma-cells = <1>;
+			bootph-all;
 
 			ti,sci = <&sms>;
 			ti,sci-dev-id = <273>;
@@ -507,6 +517,8 @@ secure_proxy_mcu: mailbox@2a480000 {
 		reg = <0x00 0x2a480000 0x00 0x80000>,
 		      <0x00 0x2a380000 0x00 0x80000>,
 		      <0x00 0x2a400000 0x00 0x80000>;
+		bootph-pre-ram;
+
 		/*
 		 * Marked Disabled:
 		 * Node is incomplete as it is meant for bootloaders and
@@ -667,6 +679,7 @@ wkup_vtm0: temperature-sensor@42040000 {
 		      <0x00 0x42050000 0x0 0x350>;
 		power-domains = <&k3_pds 180 TI_SCI_PD_SHARED>;
 		#thermal-sensor-cells = <1>;
+		bootph-pre-ram;
 	};
 
 	mcu_r5fss0: r5fss@41000000 {

-- 
2.46.0


