Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A0EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ted5aTqAOV6kRhmeWjf+BxgBSnNitR+mg3m+kOvVNKc=; b=IHptr6zzZjVksKRPeAh8y9vVrc
	ptO72SWGTP7i8anpAT01/Q2EMrOLRaj40xCTiSTENLhOCcfpSRXnZc6hDAjDjm4LcY1pLaM6SjXPL
	MpwDzRbXtQe4k17KRXxxSk4+T83khAiXEv293LcDN8xSqKxOH1+zqRb0MHpozOXJTekpWX7Nnd+02
	i4PsOvQyJ0mpolWF+vt9NMreVO8CM/lWP+KiUdTF84Pa8YQvsGUk6go4HpPo/vXP3qYHq0jnRWQsj
	LHmwk6YS/YqcDPlo+T7wnoCtWg7jM36IzlBbdUHxvdzisRvBbB8IzovRMznTM6w0IisRu2Lc70Gjh
	9xtYCwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CPn-0000000DVBF-3iYq;
	Fri, 11 Apr 2025 11:19:19 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3BzP-0000000DQw1-1q4q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 10:52:04 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BApxI81549492
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 05:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744368719;
	bh=ted5aTqAOV6kRhmeWjf+BxgBSnNitR+mg3m+kOvVNKc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wp2LR/z3KFUt/5r/Sk4jJ6nrIXn3RHPl1gvmr8x7lAxX7eQU2gcXJuriHa0yEkHTl
	 q46Sj5IseCk+gs2G+WV5pkB0ep5NO1ebRGjyksiyjyDcsgMCvACe5CwOjkEAskz1dz
	 zoaxhRHzP3C3nSFuPdbbXKZCfS64mGLO7Lrjum4w=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BApxx2075037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 05:51:59 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 05:51:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 05:51:58 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BApvo0029876;
	Fri, 11 Apr 2025 05:51:58 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 1/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
Date: Fri, 11 Apr 2025 16:21:49 +0530
Message-ID: <20250411105155.303657-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411105155.303657-1-j-choudhary@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_035203_563035_9D312B7D 
X-CRM114-Status: UNSURE (   9.40  )
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

Add DT nodes for DPI to DSI Bridge and DSI Phy.
The DSI bridge is Cadence DSI and the PHY is a
Cadence DPHY with TI wrapper.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 1944616ab357..2f8df2e0332e 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2512,6 +2512,43 @@ watchdog18: watchdog@2550000 {
 		status = "reserved";
 	};
 
+	dphy_tx0: phy@4480000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x0 0x04480000 0x0 0x1000>;
+		clocks = <&k3_clks 402 20>, <&k3_clks 402 3>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 402 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 402 3>;
+		assigned-clock-parents = <&k3_clks 402 4>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
+	dsi0: dsi@4800000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
+		clocks = <&k3_clks 215 2>, <&k3_clks 215 5>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 215 TI_SCI_PD_EXCLUSIVE>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+			};
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	mhdp: bridge@a000000 {
 		compatible = "ti,j721e-mhdp8546";
 		reg = <0x0 0xa000000 0x0 0x30a00>,
-- 
2.34.1


