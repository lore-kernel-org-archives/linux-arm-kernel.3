Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C035C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqxnSpHmOv/5IPZyLtahvzFsexzY2YUprJaVjExijRk=; b=vUqmGs6eedZu+cxT+LHBoyBmgA
	GII2AzS1U+Rhkr/VjYDelQrOTsDrUV0xp7qVoO/Ri/WlK5vP5Y0SmK5abWan9GFvGoNtLJ7Tgww8P
	jY9BFaH8bghJkozyl5ESOf3gnLFPu21Z7nhiL7L9b5a4VVy7zr0GMen8YLgwxtzNYxIEQh0xiZyaC
	PyhX09MwxtcZMVJOlG/dvhoPfnVRiwN0C6T49bv63G3U1EFSFwuyfrsntuZX7pzJYqD8Vr9Vqk9Kd
	Ha4HWEZOdKqyc9vsudZLFDMDwhG7KTpSTzFd56FuooEIGRJHoyPAhD/q8Z+GuMcHKzZocKbcFbEv3
	2AL5Sh2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUjk-00000008lWd-3elD;
	Wed, 09 Jul 2025 13:21:24 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSQj-00000008NuC-29g5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:53:38 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569ArZuK1454788;
	Wed, 9 Jul 2025 05:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752058415;
	bh=WqxnSpHmOv/5IPZyLtahvzFsexzY2YUprJaVjExijRk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bowLRDQ+q51kVx7DKU0vXOzZe4ljDuL9Mp+/0kRo6NvQKvDY3xUccH9Y+RpDXlHZq
	 dxdoOGJmjX/o2mifzCi4Ma3nonUqUawsRHBnoDCkcDesFdXbYlllFV3A86ZeZJGiKW
	 o+YTEOGE9R91XgcpzHtM+F/zZxTwRak6XcWwUitA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569ArYlw1934221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 05:53:34 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 05:53:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 05:53:34 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569ArX7n3516423;
	Wed, 9 Jul 2025 05:53:34 -0500
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
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v6 4/4] arm64: dts: ti: k3-am69-sk: Add bootph-all property to enable Ethernet boot
Date: Wed, 9 Jul 2025 16:23:26 +0530
Message-ID: <20250709105326.232608-5-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709105326.232608-1-c-vankar@ti.com>
References: <20250709105326.232608-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_035337_634798_35E6937F 
X-CRM114-Status: GOOD (  11.09  )
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
for SK-AM69.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Link to v5:
https://lore.kernel.org/r/20250708084252.1028191-5-c-vankar@ti.com/

Changes from v5 to v6:
- Added bootph-all property to cpsw_mac_syscon node.
- Corrected "bootph-all" which was misspelled in previous version.

 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index f28375629739..a09dcb812648 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -568,6 +568,7 @@ J784S4_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E38) MCU_RGMII1_TD3 */
 			J784S4_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (E36) MCU_RGMII1_TXC */
 			J784S4_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (C38) MCU_RGMII1_TX_CTL */
 		>;
+		bootph-all;
 	};
 
 	mcu_mdio_pins_default: mcu-mdio-default-pins {
@@ -575,6 +576,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
 			J784S4_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A36) MCU_MDIO0_MDC */
 			J784S4_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (B35) MCU_MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	mcu_rpi_hdr1_gpio0_pins_default: mcu-rpi-hdr1-gpio0-default-pins {
@@ -630,6 +632,14 @@ J784S4_WKUP_IOPAD(0x0, PIN_INPUT, 7) /* (M33) WKUP_GPIO0_49 */
 	};
 };
 
+&cpsw_mac_syscon {
+	bootph-all;
+};
+
+&phy_gmii_sel {
+	bootph-all;
+};
+
 &mailbox0_cluster0 {
 	status = "okay";
 	interrupts = <436>;
@@ -968,6 +978,7 @@ &mcu_cpsw {
 &davinci_mdio {
 	mcu_phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
@@ -978,6 +989,7 @@ &mcu_cpsw_port1 {
 	status = "okay";
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&mcu_phy0>;
+	bootph-all;
 };
 
 &mcu_r5fss0_core0 {
-- 
2.34.1


