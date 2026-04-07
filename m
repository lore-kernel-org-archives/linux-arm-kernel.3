Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2182FEDB7F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnLsoxBtlKwwKIXSSpdqg/p60UkV42ewo5fGCfmOMXE=; b=UUXU16A3zYkdmYxf9fWOg1vSq0
	6zWVrPg+JmgIrSlMhJd0Mea1sVkJ8gDVjzc+pKAXK5hqSt1gr+8vuX7+8auJ73QI28hAQe+xfsigU
	1ZcYGR1V9apoU+9frI9+O+NFilUVlTUFfrccF0q60a1tG+f+qzYVkUiNpO8V4npDndcrKFaDyQaD7
	wOvlO8XLNVGisKt1T3+/izkjFTm5NXrj6lzFy0eDrpMuubFOrMpITrphTmY558Sg5FHaf5ILV1YDD
	uRoomR0JaJ+Tyq4WiSwR+aqH/FBTwNeEOTFPWuqFav3GhnMfo8toKz7j0LaU0+s2g5O15/7kj1iuw
	VpY9muZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3tJ-00000006Jab-0SZZ;
	Tue, 07 Apr 2026 10:42:41 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3tH-00000006JXo-0NeP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:42:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zf3niEPfISjAg51vewozykElxReisq4ASgrlHlyLH1z1loRKovbhltLBcsRLZ4eAU+rJP972Gk4TMBpcUV77vS4mu3WViFfJOwv7YpRLHSp0ix7Sw4/SVBsAxLCMgiD7o8elpISZTp/+rKNfV89t/irsCm1X66oSxdGHKOoTPMtuO4jlb6Y4UpgOyNo9BsRPbc1Fs1b4zGAuJ5NB6RBoyoDmwsZZK7MXkfTaZ0DPLxk3Wyye7j3jFL8aN+vnrBdHyUEcVkaj2cC5ZxJwGjiWpCm2uplt9bEnWZxPYkM4tjjNhsgcMxjVfTUxEX5lzEvQtfoChGf7lj3l4PiuKh6chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnLsoxBtlKwwKIXSSpdqg/p60UkV42ewo5fGCfmOMXE=;
 b=A9Kg/Kzd8TwRkSMM4yDS223OHjt0hPy3hQ7PpVEGpAGbJTH59LmdXkYNVL6kbUfp3MwPtV7ihW78f+pTHFE2DaETceSzR8laRqbpZAz02/q9taughwt6Cl5e2vRu4y75RMAO5fXVq1RhoK8OeZdh3XFDrxOhpziTFCvm68d7MWK6e0/ZdX0Y17lwHkuvu2Ut3nty+TrF5yWDZpAEU9Xs591MyNI/rUdI5et7baeifEZ0w5UshVaO2wxrwPVzK8vm9g3Uu17ztigZ6Xl6m3pz500MMCI8DrAsn3qST+nmu9NlWD1h5eLTbcTjSt0F3U1fvnJ2vo/rMJWt+SYe7XZeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnLsoxBtlKwwKIXSSpdqg/p60UkV42ewo5fGCfmOMXE=;
 b=NxBz4DHD5jXxh6M3O5kZmCdiFpbb/am1AxkwZYTi1WFI7qzGEJ0nqgsoBuXDSvgS+845u5UM8/vQj+n8Ql/giqf5vnJuYFV/TtevOoIyYSpjtLwSfW3B1iqqZQYbWFDhNLf3KKyjmqzss4DTksEUjsg2uQJhZtyl423z5syuQYmHNPH7e/AkU9uqvtOK4GRzCET0FcQ9vR1xuleX0bzUPc7WzTRnFI/cGM10CcTJcOkncfHROkU8H5bHH6nTVp+nGmB5HXV/YrrTkjfZAvlwaJ/Fbr54UklxbEJkV/XrfDyPCm7GkVWL3nROqPVjisnnlXu2obLwQVwKMzDtvAh+JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB8281.eurprd04.prod.outlook.com
 (2603:10a6:10:25f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 10:42:34 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 10:42:34 +0000
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
Subject: [PATCH V11 08/12] arm64: dts: imx8mm: Add Root Port node and PERST property
Date: Tue,  7 Apr 2026 18:41:50 +0800
Message-Id: <20260407104154.2842132-9-sherry.sun@nxp.com>
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
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB9PR04MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 52781626-268a-4286-4baf-08de949260a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MSni/SkhCr+98MTIrZGJ1C9WDZhr/wEogeo2594zRF7hKp0Yv3/HkxBazqC9wc1xQaZAL3prUziaqcy501iNZnGA9TbVprzQThU1Fiqn329o7V85MS1hfQcnlVVSvefpiC45mQicuJsd1yEyL8Juux8damJvaqUl6dGQBG9KvSGhMDY1jZwFIpFSB/I/SyQFTYmyDrZAdna527jAL+oAx0+8+fraZqRjQ6+R5YMj98Pd+xUJHUXqrrwoZgm+NEBUElsA16cLSETr1PgF6edMkix9ILkXpbAyEt1SXOl7uAWIFfnhhkkvClA+uQUVjVb82ir7/oCj4I1Nq11kRmz4fPGKbtNCRZn5NgVawkZZq6nkpzo/oT/CudKOJJR/dsu9V4rOClnHrzl7+eITYG5yyxfxw+0weeSvhd17bwLmJyHLleVM3wVuPX8+2HiGh1vuht0ikQVX7n9lw+fNktOsoub9xNs2PHUx//Mk4gQETwyCU/vkHUdQtzoaXp+s/IYg9KBcFhHGtOJQDWDX0+4d9PwoGGNlREGLFAGKvJdXCwIyOPe56aw8MLEv732NST41lO63FoMDPjH0CNuwCOfWqmr7k/ZqXcaq2nLSVNqWImchFBvERmy9cs+SmEsTqhgmSNC2JBlt8Amz9JGi1TykCDVvmhbl+yzbQDS7VomhUPzhBqXPVhsOGDxYz+kJbn8eH8NfCD61xMRq9naN/H0dtGX+UHwi8spbl0J3f/fK+P2Iia4GNSSQcgSBTaLsVyYu2kyzT0/BAQ8sB0oQs8fOqKTX32lu+TrQP7FFY9cvqPLukLKON//ubRvSpNtlkOAm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YX2TmxUnI8cRnTkgurRLe8pxXZa0/7SBL+BvpXppDQ9anXnGIS57Ac7uhgnP?=
 =?us-ascii?Q?c4oYoFXjhZppACutba0KfpLeodz8qcuCipNFsiylG2JeQYmlZ0BRUKJhTBGF?=
 =?us-ascii?Q?oBVhjAUYsN/7g4JOBRl2L1z6g/eG3qSYeoJuCipPMGTS09tJ+h/vEqutxafV?=
 =?us-ascii?Q?/uBY9nhp9POAEtWcjf5+VlbP9EiFO87crl37j25pRzg+gcvSf0lMeeCu4bmM?=
 =?us-ascii?Q?KYjODUcd8fa4jQ4JU24xgQpJF1UiheDgbKmz1BWIb2BgNOTvNHPni/kX6ER7?=
 =?us-ascii?Q?AY0VGvFDexH8HaXi0PgVy4dN0hZ86vJ9XeV/uSn9fqYTVsEKiZ+ibRc3GxrN?=
 =?us-ascii?Q?A5g+NREY7F5o5H1oZvlIeDBptRfyxDnKHobn7sWy2mZlNuqt773lGqEMEL7j?=
 =?us-ascii?Q?OhSpeOf1ao1Kgu47xZJVW4uXc7lF7o4jK3vY2Odgbd3nrmROAi0Yj8FNiRy6?=
 =?us-ascii?Q?qk3AsqNamYkhPxlXfTe8bCQRxLz/gh/A8sqXRWzo+LD45pyqHueBDLII0guu?=
 =?us-ascii?Q?9IYh2jq6OLkfwCiRxIVR5N895zmmmugBwBxUTe0l9UDFeJGnlzCqyan9S7uO?=
 =?us-ascii?Q?1oWfiG8S9hxpBu2Ea93Un51eO0TY9+hOjgXi1SVOFNIkpbfTVpPUAC6fVa/o?=
 =?us-ascii?Q?JGeC3zVAXWqaB2mGa7b0LWIPSDy6T2GGftC6RZkIvqg5YYhlB0f+fNynZaNS?=
 =?us-ascii?Q?kPJieJdTQ2zItremeB9MJLIZS/vQ2G3TFtqhObnltF2J2srp26hkJJQ5tX8R?=
 =?us-ascii?Q?zHoo/sL6+7Y91DS2NhR2jvQ1UDnBaNNSYW8PUnEyBcAMZhgpLRMNlYG+iWE/?=
 =?us-ascii?Q?zvXpInsEi2Q8m13AyyWRuhZA6nDLEwb91qSxaGtj+oq3gvf+MicRdryquj1Q?=
 =?us-ascii?Q?R2KQ5BIgrBzJxmbTQCf0SQ5G2VNHUNKylQkEb9q/LzLCUdx0kPRwPAeWHXBN?=
 =?us-ascii?Q?iq0N1047t4heE9rNWxMp58VeXInRnSepYeh4nqSgI9CHk3l/Ayp9TNuIMEPo?=
 =?us-ascii?Q?cC9Bd75EqhgWqYmhQN8Y76501021cRWFdQWsDFz82+BV4L6X4I1xlMw/dxA4?=
 =?us-ascii?Q?09g2f8TTgVJ1BBTYglnCS35vPfSpUV1kXoBputJAQXDO5ujyJZKijzPhycAs?=
 =?us-ascii?Q?B6w/DvBKxQkXCjqSC14spoMmY6fRj48Sb6eeO2bpw7N+SIQIl3iWs48qkMe1?=
 =?us-ascii?Q?F5z2JTRBC8LnCzNZ5oCtmO5kmhfge7pUIZ+cUqQlqnFNxmgq/hRaeWc1aQXd?=
 =?us-ascii?Q?VVUmgOQAjKZn8eXKvdkdn8Mrly+EK7pJmLCmtyzlYyDOuuzEqSt4Uk08W3vs?=
 =?us-ascii?Q?4MPg0LIv815MJt6WPx2W525kqwvOWuycZp86boX8OwbyFjoSp4X9UzqjeQKg?=
 =?us-ascii?Q?aCVxzdGRx3heKNARJlFoWJTs+mUW8SIoijWHnsfXgI1Jx7saSw2BkbUSPcpP?=
 =?us-ascii?Q?gSYXjMqaDAElpfItv3rkz2AbDi2xdvGCLDrCeRUly/XiCw4r1MqEvCbB6c+z?=
 =?us-ascii?Q?3xcxTMyQUXm4kJcHzsmpDFPjTVqWrbQvFPZquQgDsUWF4Entqw7RyTk/kPco?=
 =?us-ascii?Q?tJPHGh2cnlJcpgG1plXpTaFgE61SL4vc5BI6LhO9ws4FBBqnoaGOfjb+LmAr?=
 =?us-ascii?Q?m5g7yQIjkBptKhQ5d1nzk78o3f9vOOTQc0b3nhcEDLsYOSPnt5mzceVYkSY4?=
 =?us-ascii?Q?+orKLsu0GtoZF6YDhb3d6zLzvsEI6agsvVXlOT2hEajUzm+Qhk4k2KYdZoFw?=
 =?us-ascii?Q?uONOMfYYXQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52781626-268a-4286-4baf-08de949260a5
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 10:42:34.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTc2eB1lKZ+bLsuH/ywOkwmuVM3rQfm5rO+RXU5LxBxXxLeksO9RtzL18A/zM6Z72CNvWFjGZzsLarOBgM3LEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_034239_316312_71AC108A 
X-CRM114-Status: GOOD (  10.83  )
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
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 8be44eaf4e1e..e03aba825c18 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -533,6 +533,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
 		 <&clk IMX8MM_CLK_PCIE1_AUX>;
@@ -559,6 +560,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+};
+
 &sai2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4cc5ad01d0e2..5cf2998d396d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1370,6 +1370,17 @@ pcie0: pcie@33800000 {
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
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
 
 		pcie0_ep: pcie-ep@33800000 {
-- 
2.37.1


