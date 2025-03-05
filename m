Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A5DC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFZC66O1Zg4iLZS5URDc4auyLaGETE5si5QeEF4ubh4=; b=xN546xHf64I0vuuqVSiQ3/8vEu
	7PToy9eUCOMYKbp96PUFeaJUNIav5aqUdEhSs5y/nAetRHGCQlDlB3ePOsSiAFeTXCFzazKLVhsct
	6OOIpzZFvK0mUZtrqLqd1T1Yt9t/JKRXsZXSwACsdiJ03X6aWwUUHku9Bq6789I3oqE/8KV84dPVX
	74XmYqDQEWr/F678kSUlvXoYq+4iGOfhY4hQvwefeJsKrAp8edaJgassTozRdKkHtWxjrRJMPE8FH
	UViMTTCUkHgtt8izH1kTkyTR4FAdRm2uGd1xbT2vYLWAqJUpGmrlFBZwxUB0sGcxHKbT2zg1o0m0m
	SpNiCRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpke2-00000007RYy-3tLW;
	Wed, 05 Mar 2025 09:02:26 +0000
Received: from mail-vi1eur03on2072f.outbound.protection.outlook.com ([2a01:111:f403:260c::72f] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkXk-00000007QVH-45r9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nG7hd/yomBwwncLNFUTSKjNUyTnFirQO+XKK7rZADXXiawaxEXKXqvONs65OvupRIn5anmDaPADG0S5JQJ3mTm9Mk0b+VF2fQxxgpoABlaMvOUiN7/gJcOB5JAPWfo401s4J/NUTkRRvrWiGqX9303Ax/l3s6rB0HJHHxvj6WX2rPcAU2hmzHIh/2KxjmxVv7Cc3BOWvjWs8xEvqhyTTsdlBK6jhJRka1hTdddRxpCNEGf+vXds04NldG1pOXFnUzRevHk3H7z6TbMcFP0yYgEhpPzB7mQRZ+6+jlug3yU72XTPObzfsNewk8hJ9BzDqennJPCc9y/au6FbQwoVkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFZC66O1Zg4iLZS5URDc4auyLaGETE5si5QeEF4ubh4=;
 b=OwW9J8MiyXxLIx4gy5DIeUZYOm2HjOtl4PtLUvs2MgU1juwVvl1Wm8yNdsSWDIQCRq8bL3QnnZe3QA3OxuYAPSzClSlmYpserwJQkKPiPUy5bPpnrjGxNXj0gtVEYr2n9ElKVMMjZPXYHCTNWkIlsQ5dnBxiVhFyFzTsw6gAPOucz/z56vOwkiXOZSADkjLUrrt9COGLtrqUKBDSn8WMEl7ozMlyd21WoOZCIDjsNUz6vCReWsTpBeErI5YtLaNFDAEPDy5yHJKAs6l+XT4bjBQzOGXHH/ShIhGAX2Tz13pC9YVSvGwHaJ5Bh99A2krZBqWwwVPkAVU3/WOupoUXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFZC66O1Zg4iLZS5URDc4auyLaGETE5si5QeEF4ubh4=;
 b=aFOoJ2g/RvTZfXDUMboc7d/TAQ35sc/H5toJqk2j60g39KJQYNGsSyBnKfReZfW3vQCSDN+TLVYC6+FrTgrd1d4E9Qnzj11vqOd3HqMvDzr8GpYGR495yIKENMk5vDywUHV8CJPGo/imdtEU2bwYoIZV/EFbzdod5xzNkXl9YMKG0tpVPwhLScwAMgFo4BFAQV5bgIMur/9hvwj4bC7h7eElCFj+eCFUJhnrmAx0ogriT8EsWxe/L5iHJn2xNF/oEjgLDB4DlDaCXuhNPWenxYcYVFu/Ejy+ljdbh5v+C2F+YWLD8wbBBOWXVtNuVO6RQObJEacXebSn0yCto8QuHQ==
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by DU0P195MB2199.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:47b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 08:55:47 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::a2) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Wed,
 5 Mar 2025 08:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 08:55:47 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 5 Mar
 2025 09:55:45 +0100
Received: from phytec.de (172.25.0.51) by Florix.phytec.de (172.25.0.13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 5 Mar
 2025 09:55:45 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v2 2/5] arm64: dts: ti: k3-am62a-phycore-som: Add boot phase tags
Date: Wed, 5 Mar 2025 09:55:34 +0100
Message-ID: <20250305085537.3976579-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305085537.3976579-1-w.egorov@phytec.de>
References: <20250305085537.3976579-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|DU0P195MB2199:EE_
X-MS-Office365-Filtering-Correlation-Id: d6af8d79-229e-4168-7bec-08dd5bc38595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PHVHwl3F3/p88rm1uvxxweLCz3uVwjG6+8E6shoXyEYarVyIofMmwoUwq+3R?=
 =?us-ascii?Q?T54BHwkSGFVh55c3thNkFx2r232gfgZAxxC5/cOJChUmSfA3CYhL8/G4UFZA?=
 =?us-ascii?Q?qutH0bnx176rsKJlM4lFVXMSNO/DlHTnyd3tEsPZjoO8UoPzzQSMHfTWgGOK?=
 =?us-ascii?Q?/VSRntiqeXKKnakpAO+g/RB89yr9fG3l/VEaEPnKEb7pc+j2H3FT4IC7AgFU?=
 =?us-ascii?Q?gDhXuL3ms3rRUFlEsKENpNQchDt66LaPjSKejettOzGWHD3xnm0e2WMvqmvG?=
 =?us-ascii?Q?h3H281gNJoCreZpgB/LrtvlrEl8a4HlkT5BHHqLDNKr9rfx6VTAtr4rFlVlT?=
 =?us-ascii?Q?7zjcJI/7GjZJ7fWgT1sf2odo+phNJVojCavM5zTiqxmTJmRlEiA8TC1ZnZQ/?=
 =?us-ascii?Q?NoeZeEy30JO2oT/MLFTbDHDtlNHkM4Pox+bV91NmtWxGLCfOAvYXEembTq2e?=
 =?us-ascii?Q?Lm8fh4RcwE9RgHVKHT/N8gPbju8Y+NhIQcodEpnRmMyrh6SRszyTU+pQyTMh?=
 =?us-ascii?Q?jxSnyKOVc0K7OfJpF1Tp3UEDxZ8C9YyBZwZ9qYn7Kdj8Ty/0RCnw2r8+KV3R?=
 =?us-ascii?Q?QNutuZTMGa3Nc4/Ju5LLoWqW+lUCr01MBN9PtsLvD3A0eZpo3ClY418T/QKL?=
 =?us-ascii?Q?uF7rMrkDKRY/myEoWNZ7HSWc45FIvnLO7zbAm7J2MxgtKTq7pY98frCV13Na?=
 =?us-ascii?Q?Y+eYe0Yz8hCCG7fQ7RDCwcXS+LDvdNFpNgrV0UYlLhcKUL/uhI4WtD5aexyV?=
 =?us-ascii?Q?yOc4SqtPdeM2wDWbwrOyLtH23o07b26xnYMaOIQ3k4yZ9Z1U3cPr3a4B89+v?=
 =?us-ascii?Q?OIvzVL/BoigrDBaAyjkcLxLKYDWs0dDTj3HJkaDyTuzLL1mrHQ0kOkQdDu4q?=
 =?us-ascii?Q?pQ8sytxu9q0c1jIn+Fgn/91l/mbaxVwfyrDmv3OBS6MTtDMlIk13TSxyX6Nm?=
 =?us-ascii?Q?AlAZSJ7DVdMU1w2QIe11vIr9gKqsUtZCXQfsrACSLh02ioVhkBeuvJ+ItWbK?=
 =?us-ascii?Q?dMk0xiji19JdEU0XqTALtVs8vmkXbM+EwtOObVfGvrj9TsR/4ZqEOTXEQQcl?=
 =?us-ascii?Q?dAw+scN1ag6ftqBFxUTfooLdodhF8A5koaCsffgnzYXjfFY0lZUL8ICe5P6L?=
 =?us-ascii?Q?EMo9g1qkP/QggbTcDJ7zvBr3tHGOgrXaofQvHpbF5WTkK1k0qDG+uEvimQbZ?=
 =?us-ascii?Q?hoO/7YMZXfpB9Nm64LtDU4SrCgbbSnDr5losTHbokrv9gkZgk7qm9adBdwZY?=
 =?us-ascii?Q?QFeJDZk7puW+35h7H5+BhDcCStp52zfIQFLSDmIjYO6p37dOsXfK8d8rH+XB?=
 =?us-ascii?Q?LCOzyJ3Ga2kxpJKuGn6alv5+H6ki8DflEC0JwG+IWURk/ULvDXtTzQcIvdII?=
 =?us-ascii?Q?1/QBkxMq0L7zLk1gs6+rz8CfGqbxqDXK1iCiclPL1vgPKHxmS18puQcyv3ao?=
 =?us-ascii?Q?lnL2jwA72QiQ3YZwlG4uaVN1Cjz+VV0ThAywXoZw0UfLkc4q90Jdk0IzIPPn?=
 =?us-ascii?Q?yteR6MbtKn7/8Ug=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 08:55:47.3770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6af8d79-229e-4168-7bec-08dd5bc38595
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_005557_037572_77C3CBF4 
X-CRM114-Status: GOOD (  10.01  )
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

The bootph-all and bootph-pre-ram tags were introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across different
boot phases.

Add boot phase tags to all required nodes to ensure boot support from
all sources, including UART, USB (DFU), Ethernet, uSD card, eMMC, and
OSPI NOR Flash.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
v1: http://lists.infradead.org/pipermail/linux-arm-kernel/2025-February/1006241.html
v2:
  - Add bootph-all to cpsw_port1 & main_pktdma
  - Drop bootph-all from cpsw3g
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index a5aceaa39670..7920559e84a3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -42,6 +42,7 @@ memory@80000000 {
 		device_type = "memory";
 		/* 2G RAM */
 		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		bootph-all;
 	};
 
 	reserved-memory {
@@ -99,6 +100,7 @@ main_i2c0_pins_default: main-i2c0-default-pins {
 			AM62AX_IOPAD(0x1e0, PIN_INPUT_PULLUP, 0) /* (D17) I2C0_SCL */
 			AM62AX_IOPAD(0x1e4, PIN_INPUT_PULLUP, 0) /* (E16) I2C0_SDA */
 		>;
+		bootph-all;
 	};
 
 	main_mdio1_pins_default: main-mdio1-default-pins {
@@ -106,6 +108,7 @@ main_mdio1_pins_default: main-mdio1-default-pins {
 			AM62AX_IOPAD(0x160, PIN_OUTPUT, 0) /* (V12) MDIO0_MDC */
 			AM62AX_IOPAD(0x15c, PIN_INPUT, 0) /* (V13) MDIO0_MDIO */
 		>;
+		bootph-all;
 	};
 
 	main_mmc0_pins_default: main-mmc0-default-pins {
@@ -121,6 +124,7 @@ AM62AX_IOPAD(0x200, PIN_INPUT_PULLUP, 0) /* (W7) MMC0_DAT5 */
 			AM62AX_IOPAD(0x1fc, PIN_INPUT_PULLUP, 0) /* (W9) MMC0_DAT6 */
 			AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AB8) MMC0_DAT7 */
 		>;
+		bootph-all;
 	};
 
 	main_rgmii1_pins_default: main-rgmii1-default-pins {
@@ -138,6 +142,7 @@ AM62AX_IOPAD(0x140, PIN_OUTPUT, 0) /* (AA17) RGMII1_TD3 */
 			AM62AX_IOPAD(0x130, PIN_OUTPUT, 0) /* (AB17) RGMII1_TXC */
 			AM62AX_IOPAD(0x12c, PIN_OUTPUT, 0) /* (W16) RGMII1_TX_CTL */
 		>;
+		bootph-all;
 	};
 
 	ospi0_pins_default: ospi0-default-pins {
@@ -155,6 +160,7 @@ AM62AX_IOPAD(0x024, PIN_INPUT, 0) /* (J20) OSPI0_D6 */
 			AM62AX_IOPAD(0x028, PIN_INPUT, 0) /* (J22) OSPI0_D7 */
 			AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (L21) OSPI0_DQS */
 		>;
+		bootph-all;
 	};
 
 	pmic_irq_pins_default: pmic-irq-default-pins {
@@ -168,11 +174,13 @@ &cpsw3g {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>;
+	status = "okay";
 };
 
 &cpsw_port1 {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&cpsw3g_phy1>;
+	bootph-all;
 };
 
 &cpsw3g_mdio {
@@ -182,6 +190,7 @@ &cpsw3g_mdio {
 	cpsw3g_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id2000.a231", "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
+		bootph-all;
 		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
@@ -196,6 +205,7 @@ &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
 	clock-frequency = <400000>;
+	bootph-all;
 	status = "okay";
 
 	pmic@30 {
@@ -302,6 +312,10 @@ &main_gpio_intr {
 	status = "okay";
 };
 
+&main_pktdma {
+	bootph-all;
+};
+
 &ospi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ospi0_pins_default>;
@@ -318,6 +332,7 @@ serial_flash: flash@0 {
 		cdns,tchsh-ns = <60>;
 		cdns,tslch-ns = <60>;
 		cdns,read-delay = <0>;
+		bootph-all;
 	};
 };
 
@@ -326,5 +341,6 @@ &sdhci0 {
 	pinctrl-0 = <&main_mmc0_pins_default>;
 	disable-wp;
 	non-removable;
+	bootph-all;
 	status = "okay";
 };
-- 
2.34.1


