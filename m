Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C82C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqqUtqSeeEUdObhDYeko8fTkYHokAWrft4xXwVarOeY=; b=bXdz/C7y0yNDDTXKV7emsQuw4Q
	apyufISA3rg/Ecb/ry6IRewj7sjHL5tVk6WUwAlyQmVdUFpzRIwUqiowvpRgjgteQPZNcsdWj5zn9
	4lwuKC3Fn/yq4ytBLKcbJ09vjQH03agA2mGguD9pFtCd82+njqvkgEAFWRCeo7ygt0mhFrwQ8a9Rk
	RouzoUkqTr/Z6STyoRTBa93YpXN8FVYf8CuXvYLUfmgBNdGMKE9nkT65Ks8cz5KfqybNaYIEerkqX
	IulGJhDhxSjTJPVCYz6J0gFD0WaFMnCTXZuSTjMN5Nv0GjScHjxWAGP9C//wUuzR+kqnaZCN23GeI
	KrDQz5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fWC-00000008mKJ-3OvF;
	Tue, 29 Apr 2025 07:36:40 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fMq-00000008kVR-2H2j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 07:27:03 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7Qmx23027162
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 02:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745911608;
	bh=HqqUtqSeeEUdObhDYeko8fTkYHokAWrft4xXwVarOeY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BM4Nt1N9PrTdV25/hYFQaLrjmQo9SO4cUuP4uEoeNcKXYio9qIiAJKMis71hgDDeC
	 SrCmjiesPfcyLn4fMFoixHXFU3/nAFKA3a2MIZzGcIB5sRpa6qUvLk3tnh2o1bGeAW
	 gEdqV5J46YJBEL0xng9YANMvJqepPS1rjpN7QsMk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53T7QmbT050371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 02:26:48 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 02:26:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 02:26:48 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53T7Qlo8109112;
	Tue, 29 Apr 2025 02:26:47 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <srk@ti.com>, <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <c-vankar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 1/2] arm64: dts: ti: k3-am68-sk-base-board: Add bootph-all property to enable Ethernet boot
Date: Tue, 29 Apr 2025 12:56:43 +0530
Message-ID: <20250429072644.2400295-2-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429072644.2400295-1-c-vankar@ti.com>
References: <20250429072644.2400295-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_002700_691094_274C971B 
X-CRM114-Status: GOOD (  11.02  )
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
on AM68-SK.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

Link to v3:
https://lore.kernel.org/r/20250425051055.2393301-2-c-vankar@ti.com/

Changes from v3 to v4:
- As per Nishanth's suggestion, moved nodes which require "bootph-all"
  property into board specific file for AM68-SK.

 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 5fa70a874d7b..e84c504c87d2 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -344,6 +344,7 @@ J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (E22) MCU_RGMII1_TD3 */
 			J721S2_WKUP_IOPAD(0x018, PIN_OUTPUT, 0) /* (F21) MCU_RGMII1_TXC */
 			J721S2_WKUP_IOPAD(0x000, PIN_OUTPUT, 0) /* (F22) MCU_RGMII1_TX_CTL */
 		>;
+		bootph-all;
 	};
 
 	mcu_mdio_pins_default: mcu-mdio-default-pins {
@@ -351,6 +352,7 @@ mcu_mdio_pins_default: mcu-mdio-default-pins {
 			J721S2_WKUP_IOPAD(0x034, PIN_OUTPUT, 0) /* (A21) MCU_MDIO0_MDC */
 			J721S2_WKUP_IOPAD(0x030, PIN_INPUT, 0) /* (A22) MCU_MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
@@ -412,6 +414,14 @@ J721S2_WKUP_IOPAD(0x000, PIN_INPUT, 7) /* (K26) WKUP_GPIO0_49 */
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
 &main_gpio0 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -626,6 +636,7 @@ &mcu_cpsw {
 &davinci_mdio {
 	phy0: ethernet-phy@0 {
 		reg = <0>;
+		bootph-all;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
 		ti,min-output-impedance;
@@ -635,6 +646,7 @@ phy0: ethernet-phy@0 {
 &cpsw_port1 {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&phy0>;
+	bootph-all;
 };
 
 &mcu_mcan0 {
-- 
2.34.1


