Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848C2EDB7F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AIat2mzwx+LfeZBwOS7XTYabRfThSe+oGSHSCqNG5Y=; b=Ul9KoPpz8H3oyC9FJrprXFtTXX
	mfkqW/7LjjjgtqE8d9Vv2BDDNU7gpUbbCwcQlMi/eTzGpDhCo96kDpGcQxK2Rx+f84gX8iyQvXiUv
	oCV2/930iBpNOgSObYdwaHlaU7/+4Fi3eCQcBBCgvf3viDN5QwwmMEtA/gcFQsEdY7xq2LBrPcPyB
	NvfYNy4pKxsXRsiZpSUL0qr57T/xx9Z+iPYsYboRkpM7QfZp5FBlfBg8chipLmRtuwEUHZwTSTOgJ
	zXLcloThdN6EgavJfktudZNOP9wJ70v45Ii6yut3WJLn4GBJnM4t0qSfnxVpb0mRZ/Q4Hx1JMp04N
	y2hx3cNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3t0-00000006JNr-07ov;
	Tue, 07 Apr 2026 10:42:22 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3sy-00000006JLn-190f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:42:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Awhr9NozTN9yp8SnURxlAANSdbrwy1PkmJK0Hr8BfoVcaaB15GdpVy/GDqF/Hf+oU1Oh4BdTx75Ai4Zbo7RZKKzuXAKuqipmQm6NKts8Ip1ftjskA0fp++zGURjuRPrv+5viApEV+oIsbcfCLDxot2en72VwcHnMPgVfZUelj+DO23QHdIxqHKcQycpQ1pol4ycSBzoA7M/QIulydmezParmJrcEaRswO2YBubBHfdQmsEBZC4GkuSWy9VoWBtCrXNRET2SoweSo7Ou+9m7J6QX86PE1xTaKrsXmvIKLTTveEHYSC6JPFdW/P4xfb6jEwOGD4R/DBo0yEUeyqZtEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AIat2mzwx+LfeZBwOS7XTYabRfThSe+oGSHSCqNG5Y=;
 b=F+NAjwsdnKFDqPe0xAjV9PcrypqYPu8FM03GXs9wAbVBbs4TUSv8Cl7V9ryutTo14jpNYNFhEegp1Fc9IgBZkmV1WD00wpxB0ae5Do2u4NxatahGVphg0EcNYuoW2cLrNNNrdTQQ8yc0vmQhgJUt3yyai+uTiK6As+hs3/uzDup+oCUF3WjrCe1xCeMHQZO9UIcVDk1ZcgJm+U8SFpOR/D8i/R2CgyGu/ef+K+6DmoebLZNHoJQuKx3XwJqPN89h8UC60wjtL70V4+/fZr9FMu8bH0V0X0LsDwRFqPgHncqVuiOshM+fXZxionAkez+xWK6Zs2nyFo+Hra8Pj65wxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AIat2mzwx+LfeZBwOS7XTYabRfThSe+oGSHSCqNG5Y=;
 b=AXMSN3KN/ChLKc4oVfRit2IGE+CjoRoQjetNZAdiKYVXWB0bQ791z7Sjkvkju+yWJD3/WrWhbFkvDU2WiNz35cUN7K4pQEZyTqzVwz8ezrvIVmmz4ZJhUmscPLF4XQ22lIQ6y9MOKD8FH/t0NMTkAbZ2rfEj8P0NT/ODedYvnNwVFH+Tl27np76d0Ud8BgMpkpxWtWW2/kXu31SRWD9mhS3SO6x92pArD2byvsGIXOs91pdEfDz5sgNl2CF7DvzePSPujWiU//vc7CDXynWn8dGYdk7l9hfRsIFUO2WbSX2pPvRae3e0s3fg1w/8ADtus8Tc6yPH01vhWeUxdhSa8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB8831.eurprd04.prod.outlook.com
 (2603:10a6:102:20e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 10:42:15 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:42:15 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V11 05/12] arm: dts: imx6qdl: Add Root Port node and PERST property
Date: Tue,  7 Apr 2026 18:41:47 +0800
Message-Id: <20260407104154.2842132-6-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260407104154.2842132-1-sherry.sun@nxp.com>
References: <20260407104154.2842132-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::9) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAXPR04MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: aabd8a60-2d4b-4fea-ba5d-08de94925571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|19092799006|38350700014|22082099003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: ms2Oa4QN9/NCPrtOmB0/LfwOxc2kemRWn5TOQ50/HpS2Y5bfdUEbGkMGcUNW61+HehSqQ7eN0d3DlZPXtP2ZRqSkrEoT/xXOWZWJbmqiZziUhOcdVmHmB5aR1QevCawbZpujgUrtVQGQBLz1849Wr/1MPwtA4AhJHXWS2R05AMsKakh0lopI+ZkaW/gVDU6zIOY0Gsq7S0aRn+NJYHXEm59aOiTHbQtVNgl/LfET+tJDQSHO43kxQ9Wo7Txwy27oRg8eN7OwJyu2WqyK38ydbmzB+CmbffZFZ3CsePI+wcdJtMjlf3AvhPQEAsU2E0cXq0GUgIJIO9TarEHqEM9qpFumXUeP5lN75GA3BfgM/WU+jfb94X/PlQqrDPpvxhiCGa3ECeBdw3xWS1I5M5X8/Bi7daEOLI7Hm5jRSmUH/Edo0cTqyH0r8GB5ke4T+yoBIUmVtCCu8NsKhIS1+c0E4K7jhDDy/sFAyCczT/PXYof3sEtNciQQkAEDNfodfrK702TOqJdr0P0H2kLTMAG3A6r7DNRsniiAhoJp9mDiWFFqbqLyGJHJeR2cEcWC/zk47DHGY7AvikE/S78EC3lEdJ4i9qxVTsOEb80KFR8UxYQWIeRf1aJ9XlZxE2tLq/PW+ZEtPemb7V7hTtOhjCH1RSOaNkMjYQXoGZMQIKm8iCW6YZ+bSdDv2XlJp2MRzuPyBBR20amgTlf3hTLagzP04et2hcawemY75mqWVEHzSRTp0KDCjBaDDtZWKeT+3bZdWMDNEfsrDgZWk6w1aaelE68u+cDfmbtzgsDhBuk5uYNKJ2DEzz7Ilmbf1x/7XyFk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(19092799006)(38350700014)(22082099003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5gBfVJSVE1ueXKAllnuu96x19Wd3mOo71769RIF2IJ4konhxOJzIIRZgKjTI?=
 =?us-ascii?Q?v8HE8u6TLDa7yMKpFVrJ5OxMfJeghK12D9DO4NcDQHsuYJhi7bFYg5ynH9Ma?=
 =?us-ascii?Q?Xq9EjHqp2W2gMPWiSD2nCWrtUsRbsf9PPhjwnZEC6hVEC0szuKAwY9MiYQkP?=
 =?us-ascii?Q?3FFWoaWqWfxo1vc3D19t7tpbkgoHj5SnDRWyN1fVJkiEL+AE7qVevWcu/D1b?=
 =?us-ascii?Q?bNfEAocKbqLT8JRCnm55X2Rk/rabND7G6UV/BBV3tsuEho63BFayWir8+L9o?=
 =?us-ascii?Q?tZjIP+Wy8utXtXZls0UrOk6XHwgc3k/Wqiq50YDEbzhllgjCUw2pHsoHy3iM?=
 =?us-ascii?Q?qOaLuJXFLqAqk7ntCEnwZOYAjl+kZERRLVy9onVyW1sYg83BlE0IH4oucMr7?=
 =?us-ascii?Q?X/VgfMywPcDDl7txuPyWRU0DFmilsMhPkF57FNxcMjhylWaX4G1gGh6GprCC?=
 =?us-ascii?Q?uRHOdPktcyflOWx4D2Khz6+YXbAv6zzWdKWg15MCM0RZXx2z4Kf13fl4bbgh?=
 =?us-ascii?Q?SraeQ/LoixaPkkEhBRF/CUdVosoGFyNsqrlxGsEk3h0xGmTZF9BsL79Nbfmt?=
 =?us-ascii?Q?iis50+Tx36culmVhxyC2AJDdub3e43sjJGme+9vE/ARXLkjXUb/2VbFE1EpV?=
 =?us-ascii?Q?Rj7HeQW4Sn5ewlJ8JhWZcDss4grsDkhIUPPlN/ApSX4XiGQ+wUwGK98chJPn?=
 =?us-ascii?Q?yj3hySGIsR+d+UQBBJs20Ikp0AlTS4/JD/+EZA0lvG9sE67vtQWmPGec2fHZ?=
 =?us-ascii?Q?knhFi2CCj/CW+cqFUj02eUlKf1sHkxGRDDEiE3CIJ+tqTkXDd/Q0tmayWH1h?=
 =?us-ascii?Q?PyFhWsNL3PzHb+YHVORkYmq3KSFbFT9huOWkT0HvtPeoPehCBi9wZO6Ebxrc?=
 =?us-ascii?Q?FGGC3y6ID3RIYR6cNP8aHndZ0T6wC1FblSIqdNr1/wlT0MWEYvYAF80h7hT7?=
 =?us-ascii?Q?4I1rKTh7PdoF70lAiZ8rJK+mG7h85VHs9g2iZUMJC1um+FU+0+EUn4tBLGWg?=
 =?us-ascii?Q?CnccCeOcz4UPkkUZvprEMLg+2BiGDIjtkZm5I40upMDzaVdn7D0nvHhAY3pg?=
 =?us-ascii?Q?5bd5OhgThtGDFAhAaaakDEPoyXZiHNXO77xXMZyLJD4RFNtdTD9aYbrM+hoF?=
 =?us-ascii?Q?4bQze1M/wex0gahkc4wqK4DtNY4rwNNH0cBV3PZ+7EVo/JvcnoCfo/ng6FAI?=
 =?us-ascii?Q?o4HgxyTJjJNrzggf7fiK+j2f/k/NI2SLcMUu8gxoZMzx9AQGOrHBM7k+CSwD?=
 =?us-ascii?Q?v0aaVVFYdlszs7+1n2LiSTbUm+FX2TvPaHKAmiABEwexHGLYogvC2+H77MKt?=
 =?us-ascii?Q?/lQLmrmO5pMVEw+Em5qGsNe6z6ItmNii28ysbOEEOQEYjcdYNAfOeVrdmFcr?=
 =?us-ascii?Q?yTWmwEuLbNc2IQLhXaCkLhjrylz29rS2B6cypYW9Jc9qrwnwr/RMYwNu1fHS?=
 =?us-ascii?Q?/ir8QehJz2pDqRHAgrvAGIoC5a8M6sfaBucPE1AYsJpjC9n9kHzLtr7veTGg?=
 =?us-ascii?Q?1deMWl5m3CdVE+n1OcmNVt6j0pAK4eASUqzVPMJDe6cRcLjfTfIXEBWmIQxQ?=
 =?us-ascii?Q?/jWg8M0hhJX40F9efO/MlBkjpMa8e8vPdWaoP45+JOQj5Hfty3X/OZTu9Gj1?=
 =?us-ascii?Q?gZGUoLA/C+xLxJcq6UoUQxiIjZPz6mIe8Xu7NE/fmm/M2uRoC/bIXWvVcRNC?=
 =?us-ascii?Q?ubYT/6SDKV70vypmVr7ov3R/Fg80NSuHgMDRbl7pYo90XPRBycHAQwiRbQHV?=
 =?us-ascii?Q?aijhXoIuCw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabd8a60-2d4b-4fea-ba5d-08de94925571
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:42:15.3830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gzbPq/FBX9iLkSmGCiZ3DCymhzi0qFHlApdmXeH+/38LEka/X6E0QpvAHHnl6dED+SUJKls/IIx7crDCLROyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_034220_338275_1D850374 
X-CRM114-Status: GOOD (  10.63  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi         | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 +++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index ba29720e3f72..fe9046c03ddd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -754,11 +754,16 @@ lvds0_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 4dc2c410cf61..9438862b9927 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -302,6 +302,17 @@ pcie: pcie@1ffc000 {
 				 <&clks IMX6QDL_CLK_PCIE_REF_125M>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy";
 			status = "disabled";
+
+			pcie_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		aips1: bus@2000000 { /* AIPS1 */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
index c5b220aeaefd..6b12cab7175f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
@@ -45,10 +45,15 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
 };
 
 &pcie {
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&max7310_c 5 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pcie_port0 {
+	reset-gpios = <&max7310_c 5 GPIO_ACTIVE_LOW>;
+};
+
 &sata {
 	status = "okay";
 };
-- 
2.37.1


