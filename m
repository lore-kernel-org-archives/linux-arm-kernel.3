Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954F8C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORyDsDwlIJT9ec0ftSCvdkp8POP6HUCnq/zrVrnKi+M=; b=PIF2h1vf6zwW0aTnLFmVJvt87f
	Qy9HSEY8msZwVdfMlD1niPdj7jFc8f/R1ZMUZD0DMzQi+wdfOCTC1bmW+8mexe2LPa6pZzabGWmvM
	oJcI6cbaPyigCVj1Wl5SbqduwkSD+S/ZyEU99NBqe/yyHHUQLh03wjvFuTFmQds3+UnV2KuBz84Da
	T74Eva4ebSrEB4QOKNKH6/c/ifSFJP3j6WLtkaQ2d4uGHFCZaBjnY8VETRaW36i99Ew/Dn/nhtWFn
	t9TQwNCDzS25X0RItlEFm0kz1RCZtFdRvSnGZHVKq18+Z98ZxffwJF52a5simELAeIFWwRKSnkZhu
	kTqlmTsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwUg-00000005wqL-1bgj;
	Wed, 02 Apr 2025 11:42:54 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwKR-00000005uIX-2bz4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:32:20 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BWATl3385659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593530;
	bh=ORyDsDwlIJT9ec0ftSCvdkp8POP6HUCnq/zrVrnKi+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZOyjyalIcovjDTTsuKPvke2JRMPEIp8StUN45CaND4EakqcmCLViREXrAH5swaWYC
	 52D/3dOXouI41Z496AADBmP3xiZouKiqXPZdklM7QSw+QcWckfjf0L2DgfzEgLprL/
	 rVwriwE9Dq1K6Ra/2OjrtuRF4YuTeJynrtdAS4U8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BWATk123280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:10 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:10 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BW9P3017462;
	Wed, 2 Apr 2025 06:32:09 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 4/5] arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to scm_conf region
Date: Wed, 2 Apr 2025 17:02:00 +0530
Message-ID: <20250402113201.151195-5-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_043219_753710_0D0EE913 
X-CRM114-Status: GOOD (  13.44  )
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
the PCIe node.

Signed-off-by: Andrew Davis <afd@ti.com>
[j-choudhary@ti.com: Add changes to k3-am68-sk-base-board-pcie1-ep.dtso]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso | 2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso         | 2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi                 | 7 ++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
index 455736e378cc..ba521d661144 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
@@ -48,6 +48,6 @@ pcie1_ep: pcie-ep@2910000 {
 		dma-coherent;
 		phys = <&serdes0_pcie_link>;
 		phy-names = "pcie-phy";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso
index 5ff390915b75..8c2cd99cf2b4 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso
@@ -38,7 +38,7 @@ pcie1_ep: pcie-ep@2910000 {
 		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
-		ti,syscon-pcie-ctrl = <&scm_conf 0x074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <1>;
 		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 92bf48fdbeba..c0c2b95d4652 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -57,6 +57,11 @@ phy_gmii_sel_cpsw: phy@34 {
 			#phy-cells = <1>;
 		};
 
+		pcie1_ctrl: pcie-ctrl@74 {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x74 0x4>;
+		};
+
 		serdes_ln_ctrl: mux-controller@80 {
 			compatible = "reg-mux";
 			reg = <0x80 0x10>;
@@ -1399,7 +1404,7 @@ pcie1_rc: pcie@2910000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&scm_conf 0x074>;
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
 		max-link-speed = <3>;
 		num-lanes = <4>;
 		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
-- 
2.34.1


