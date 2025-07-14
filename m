Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BA8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6HkfUoOs5KDSket9SCxWt+iYodCvctdHHAQuFKLH4W0=; b=eh1e1MsETf0n6Y4dCK/un1W7eQ
	vamkSUPqW3+Rqtq2h1xyGP3sVbghFeFyRM6B5rjp/2qlXzI/If90//2RlHKjbIunZVNHmzTnJVmjN
	kHjM6R1aQ5FkL+daYcXaGbYN6mR8iWaMHi3FVQLjxlnuxaxhDCCuBRjDgvWlADc2lDEclp6vCfa5D
	nLEU35Pp7q2jL2hOuXVfWoN2fCqK9Cye/0waTxMW6sbILsuiMJlBoBy2DCan2dLXnfATJPBa1uhPM
	C0zvmLVaWABwnfdxwv+Jdjgya6mrZVFlSNAULPMg7P6t/+HKZlRdkkTPdNzPtcmurFaV3BHdyIkUi
	1JcCGG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFjo-00000001p5m-1Dsj;
	Mon, 14 Jul 2025 09:44:44 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFTd-00000001mcC-2jUx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:28:03 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56E9RxmV2581042;
	Mon, 14 Jul 2025 04:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752485279;
	bh=6HkfUoOs5KDSket9SCxWt+iYodCvctdHHAQuFKLH4W0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oAd0LyLnZh4B2hSoDXoyuAbDd9aH/foZ14R53nhMsNLHSImcjVlmbo/18nTEZQknf
	 M+l1pi9rZ054flSdA4TW5aOSwdyCl9zg3tL+iLilZWgYm6Sgi1RS29h18eh0Sd4x5p
	 k4DgMzMBU6wEHAoVmzzZF22nHBaBbNiogJlKq4pA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56E9Rxw23680174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 14 Jul 2025 04:27:59 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 04:27:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 04:27:58 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56E9RPVl279945;
	Mon, 14 Jul 2025 04:27:55 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 5/7] arm64: dts: ti: k3-j722s-main: Add interrupts property
Date: Mon, 14 Jul 2025 14:57:06 +0530
Message-ID: <20250714092708.3944641-6-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
References: <20250714092708.3944641-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_022801_779088_B722DDDB 
X-CRM114-Status: UNSURE (   8.20  )
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

Add interrupts property for CDNS CSI2RX. Interrupt IDs are taken from the
J722S TRM [0].

Interrupt Line    | Source Interrupt
------------------|-------------------------
GICSS0_SPI_IN_178 | CSI_RX_IF1_CSI_ERR_IRQ_0
GICSS0_SPI_IN_179 | CSI_RX_IF1_CSI_IRQ_0
GICSS0_SPI_IN_219 | CSI_RX_IF2_CSI_ERR_IRQ_0
GICSS0_SPI_IN_232 | CSI_RX_IF2_CSI_IRQ_0
GICSS0_SPI_IN_249 | CSI_RX_IF3_CSI_ERR_IRQ_0
GICSS0_SPI_IN_250 | CSI_RX_IF3_CSI_IRQ_0

[0]: https://www.ti.com/lit/zip/sprujb3

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 5cfa7bf36641..6a8e5ff3b1d5 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -168,6 +168,9 @@ ti_csi2rx1: ticsi2rx@30122000 {
 		cdns_csi2rx1: csi-bridge@30121000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x00 0x30121000 0x00 0x1000>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 247 0>, <&k3_clks 247 3>, <&k3_clks 247 0>,
 				 <&k3_clks 247 0>, <&k3_clks 247 4>, <&k3_clks 247 4>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
@@ -221,6 +224,9 @@ ti_csi2rx2: ticsi2rx@30142000 {
 		cdns_csi2rx2: csi-bridge@30141000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x00 0x30141000 0x00 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 248 0>, <&k3_clks 248 3>, <&k3_clks 248 0>,
 				 <&k3_clks 248 0>, <&k3_clks 248 4>, <&k3_clks 248 4>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
@@ -274,6 +280,9 @@ ti_csi2rx3: ticsi2rx@30162000 {
 		cdns_csi2rx3: csi-bridge@30161000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x00 0x30161000 0x00 0x1000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 249 0>, <&k3_clks 249 3>, <&k3_clks 249 0>,
 				 <&k3_clks 249 0>, <&k3_clks 249 4>, <&k3_clks 249 4>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-- 
2.34.1


