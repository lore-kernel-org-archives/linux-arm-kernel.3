Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CD9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPKcnI2BsC2HrW88aQ+QAUgaihzhMvelNRF2yVdbpOU=; b=wCB4SganCnD+070Xw2u0t7mBD5
	VUeVeEJFGCcqN4SJTNR03bue1MwvYIylFdflPTJOqoF/+e9XY0t9y9gBwmtRKmPRohCUd40uumW7O
	U964/2BIwWtgak5EeCqfCmcsPmfntnA8/iPj+v7ocpqVLAOce03Xa3zCFsBsjMonp/Nh/b8IZQBgq
	UWjSkdUOWAEWoY52ApT8XXiBODlAOm/P6yMb7nw0WUs3+HEfBUqqTVvIiu3NjhKXQ8RPEXN3JytHF
	AIZCo5CuLCBnpE/aeLwn//fOxblNWccXHwraoM9qlT36VuUWUQ6n45fjBNCnnnK84xSS3mQjKgRi0
	xEkpH7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tolQ5-0000000GEmk-46ck;
	Sun, 02 Mar 2025 15:39:57 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolLY-0000000GEJU-19SO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 15:35:17 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 522FZ6QA3097659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Mar 2025 09:35:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740929706;
	bh=NPKcnI2BsC2HrW88aQ+QAUgaihzhMvelNRF2yVdbpOU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VEWT5QN1SNYxDkbSSMS4MirAcx6Mlsz8RqR8MJp0+iwuvaIKvQNrUYOgXjTLYmHfA
	 H8r3nEPxajewDYhS5AF+rFTpt51y/P4st1548l59zIunyKRfTOSPGqAnQsVHh1DYG4
	 Eg8Ptwk0laYFtKSBxy1TTLNUKiWIj1CBdrCKECBE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 522FZ59e002255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 2 Mar 2025 09:35:06 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 09:35:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 09:35:05 -0600
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 522FZ4t1071822;
	Sun, 2 Mar 2025 09:35:05 -0600
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <s-vadapalli@ti.com>, <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-am68-sk/k3-j721s2-mcu: Add bootph-all property to enable Ethernet boot
Date: Sun, 2 Mar 2025 21:05:01 +0530
Message-ID: <20250302153502.181832-2-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250302153502.181832-1-c-vankar@ti.com>
References: <20250302153502.181832-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_073516_402565_0EB248CF 
X-CRM114-Status: GOOD (  10.70  )
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
on AM68-SK and J721S2-EVM.

Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Link to v1:
https://lore.kernel.org/r/20250106123122.3531845-2-c-vankar@ti.com/

Changes from v1 to v2:
- No changes.

 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 3 +++
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 11522b36e0ce..8e9101dd2152 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -333,6 +333,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
 			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
 			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
 		>;
+		bootph-all;
 	};
 
 	mcu_mdio_pins_default: mcu-mdio-default-pins {
@@ -340,6 +341,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
 			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
 			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
@@ -615,6 +617,7 @@ &mcu_cpsw {
 &davinci_mdio {
 	phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index bc31266126d0..29cd4b1ffbbf 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -154,12 +154,14 @@ mcu_conf: bus@40f00000 {
 		cpsw_mac_syscon: ethernet-mac-syscon@200 {
 			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
 			reg = <0x200 0x8>;
+			bootph-all;
 		};
 
 		phy_gmii_sel: phy@4040 {
 			compatible = "ti,am654-phy-gmii-sel";
 			reg = <0x4040 0x4>;
 			#phy-cells = <1>;
+			bootph-all;
 		};
 
 	};
@@ -538,6 +540,7 @@ mcu_cpsw: ethernet@46000000 {
 		clocks = <&k3_clks 29 28>;
 		clock-names = "fck";
 		power-domains = <&k3_pds 29 TI_SCI_PD_EXCLUSIVE>;
+		bootph-all;
 
 		dmas = <&mcu_udmap 0xf000>,
 		       <&mcu_udmap 0xf001>,
@@ -562,6 +565,7 @@ cpsw_port1: port@1 {
 				label = "port1";
 				ti,syscon-efuse = <&cpsw_mac_syscon 0x0>;
 				phys = <&phy_gmii_sel 1>;
+				bootph-all;
 			};
 		};
 
-- 
2.34.1


