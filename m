Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14FBC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqLx4OXXk3PLZD8Eon9lnQ8Cr2fJ693Bv9Ym6u1tHZ8=; b=DCkFQFYgfTV3+3ovmFtrXy63se
	YroGfLTuEbXw9H6MTISTyyA+FeL7IC5Ueox9A5OogScE57pzNbzzUGpfAoZVKIcmpfOp7tkx7T7FL
	hYtKykd7cpdsYT8ZPm6TpJYYJ6JdR6UBTa6mu8atYfPALfkEJHEoOLCIalJy4ah4iQwiOGvwGnXMy
	4/GEtfteDno1yo/VejzzSMIfLGyhsERgoXVPZrOl+UiSAkCspwfDbTr6ogDRvOEEpv2ZrtlQ6h5rx
	vbZQrU2AyneOnm8YhwQK3HrPc/SIjcUtjuG6dn6ZPrPC6jl/NO5wfvTj92gqcaGgtUIfCLLUh3/Sy
	y/fASMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4RD-00000004s5d-2E6o;
	Tue, 08 Jul 2025 09:16:31 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3v4-00000004mYr-3SqJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:43:20 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5688hAoo832362;
	Tue, 8 Jul 2025 03:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751964190;
	bh=yqLx4OXXk3PLZD8Eon9lnQ8Cr2fJ693Bv9Ym6u1tHZ8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j1HYzsRS9h6DYpATK2gcd7sHH71LXfuFeyzvnIsWy5zLoJRRLNMIGWucsLTVi3jf+
	 /gVLTqMuMpnWyFo/1RcXWEFekLWWClx+eFgi3pXEELmsmbuG7jg5hGHYxuJVHkukOS
	 NyGNeBNj23ARiHe/H5d2Z5QJz/XYI3JpXJLstjBk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5688hAFb1287373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 8 Jul 2025 03:43:10 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 03:43:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 03:43:09 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5688h8M91768266;
	Tue, 8 Jul 2025 03:43:09 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <c-vankar@ti.com>
CC: <s-vadapalli@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Roger
 Quadros <rogerq@kernel.org>
Subject: [PATCH v5 3/4] arm64: dts: ti: k3-j722s-evm: Add bootph-all property to enable Ethernet boot
Date: Tue, 8 Jul 2025 14:12:51 +0530
Message-ID: <20250708084252.1028191-4-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708084252.1028191-1-c-vankar@ti.com>
References: <20250708084252.1028191-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_014318_951867_C623C646 
X-CRM114-Status: GOOD (  10.77  )
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

Ethernet boot requires CPSW nodes to be present starting from R5 SPL
stage. Add bootph-all property to required nodes to enable Ethernet boot
for J722S-EVM.

Reviewed-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Changes from v4 to v5:
- Split [PATCH v4 2/2] to [PATCH v5 2/4] and [PATCH v5 3/4].
- Added properties to board specific files.

Link to v4:
https://lore.kernel.org/r/20250429072644.2400295-3-c-vankar@ti.com/

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index a47852fdca70..08a2f26f1f58 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -282,6 +282,10 @@ csi23_mux: mux-controller-1 {
 	};
 };
 
+&phy_gmii_sel {
+	bootph-all;
+};
+
 &main_pmx0 {
 
 	main_mcan0_pins_default: main-mcan0-default-pins {
@@ -346,6 +350,7 @@ mdio_pins_default: mdio-default-pins {
 			J722S_IOPAD(0x0160, PIN_OUTPUT, 0) /* (AC24) MDIO0_MDC */
 			J722S_IOPAD(0x015c, PIN_INPUT, 0) /* (AD25) MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	ospi0_pins_default: ospi0-default-pins {
@@ -380,6 +385,7 @@ J722S_IOPAD(0x0140, PIN_OUTPUT, 0) /* (AF24) RGMII1_TD3 */
 			J722S_IOPAD(0x0130, PIN_OUTPUT, 0) /* (AG26) RGMII1_TXC */
 			J722S_IOPAD(0x012c, PIN_OUTPUT, 0) /* (AF25) RGMII1_TX_CTL */
 		>;
+		bootph-all;
 	};
 
 	main_usb1_pins_default: main-usb1-default-pins {
@@ -424,6 +430,7 @@ &cpsw3g_mdio {
 
 	cpsw3g_phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
@@ -434,6 +441,7 @@ &cpsw_port1 {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&cpsw3g_phy0>;
 	status = "okay";
+	bootph-all;
 };
 
 &main_gpio1 {
-- 
2.34.1


