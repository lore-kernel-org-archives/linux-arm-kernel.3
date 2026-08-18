Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13637C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 03:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=; b=cZr6O2QzWDg9yp5OO80+zL24TZ
	VlXvnNg2PxSKBJ0bahaT3pFJ891/wkJthNnkjtquzX57ogekJXLLxdSCYvwqnhuNt0LPPoDuO+sgs
	i9sRN7kxXiGWDxPm88Ufx7FIxv2a+ikEMabwxNVlFDsCuZtyZsOWsfxlY9vkiQwwsNSArpIom4LmH
	mHsuyWpCTke6ZGCcKoG0nI1PlRq+TAHnu2luXwLDxvt1JfPmvLbhI5BhXxt+ljpZ5IcychwxrK6uL
	KaobycLASsFH/F4tLwZi4lt1wRlrZs6K3huIouK1H6n4SV6DREmYd1+01Z4ZLvb6QO8Kx7ekbNtf7
	RGqO+uOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA6d-000000078Sn-2R8f;
	Tue, 18 Aug 2026 03:03:15 +0000
Received: from mail-northeuropeazon11011015.outbound.protection.outlook.com ([52.101.65.15] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA6Z-000000078O3-3fKq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 03:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRQbiut+wMbMuXhkFQFvxb4VCTGny7BgbJPkjRj+T7CWZw/ITPcWfEbnezqi3HyAmYbE9WeRbGKBpdRf7KU3m0r3Hel7/ldCyNEbVU7dKKpLSSwfsLlmuGeFU7pQgO2CdC5GVtA04EMEcqmkOQsK18zvGbgIUCmz6ToDcOs18BzoXP4wszn0l7OquXC+LQ+K1LYVTcbTnLhfiOZp3dqazTWaOb5XBheDvFKbxD+vj55VGR/5l0lXCWP+3ybbNMmOhIK0qR5Awm/0W4DCotkvowqZWOx8ZxFuV+LeULUpkg+Wye4l4GkziMK2en+kaDddQS4EKrptBzliJGaLapUoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=;
 b=TdEOA70pJLz10Z7/tpa5xoY++qmff/Ekdwmfb5gsBEOM3wcJ7u9acPtVoeyinrDBEzhKTejllpERE16IAY2wgS1tiQXfwr41/mzOPalziJzOAr+BvpGpBQ0qZvu2w0J4+PAXlFLyzbCPvA6v8H2A0N+qVdZSHv53N+Ixo3GvLWM7xgPb3opIN3yeXeZtctsjNvz6GQC+4xLGf96BElkboBr3YZivOrUCnsRPMnYx1qyBdbUoOsfz7hsDrkc7CwZg9P8dMeds88Kf+aL8+uIZNUUeeI0dAyYe+yb+Jhp/d+LXza760QIKkA46HQ6Kj8c9sYNGzax4cJxu2x+rHeFSqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=;
 b=ON/7Ohk7xiGe1rBEgONBymY3zB+FAsm1fWBKVni7MwYk7ijq7JL626ND7lsSpOy+356xv+/bN3ZRmPWOct17phwjwYd3uRt4/y557zUXsJLqEEAy/fGNOEDNMy3M6pwsOqoPwiOJww5nBpzyULg2Ajp9Z+CiXBXkPQnA9utctf9UnZa0+dwqf6FkHf77EKsQ9bPPLVQcXbXG6anQdIn94KFSHkejExkNMLA8z1uXHPg+56bVfBP4u6+1Cd42b6GWfYNDOHrJ/x4f7EDwiN9Zrty8CyvsuqzQ99Yv1J3Pd1cbthkwGrWCZo/0t4bPe5UPFgc2rzmx1PV7h3YAOvzntQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:03:08 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:08 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/17] arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
Date: Tue, 18 Aug 2026 12:02:02 +0900
Message-ID: <20260818030211.3141710-9-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0162.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 290b134d-f69f-4f02-aa4d-08defcd53aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: FW6/pm6MqQ611LSbCex7eAqyXQ8nNi5ds6lY8LzHPKUyjH28u4TCh9lFiBCNl7Lstqi5fN9ivBoSr4xksgCcFKW2HZVP1/EQ3lclJU9WIoBG/hBciWrYSPlGHIIRoylkoqz71jrcOzUcCFszCOIQGPlLppkfaQENTCf1uoUPpR4FXlUxPJ9umDzdak5nAcf+/eJFMrPn9wRDvuBV3CoqGNMEuiIXpoPC9v9xTfqqSo53eLqC3TI66TqoZeQvhWw3LtysdAB5CZrng8Q0Z/ia2Z7QzEcqNlf8ia8sAqaitOYAsP8lBjzTeYOd/mhTDoKLacnKjot+fIkA4pDYlOGQJaoq59jrUBT14r7pB7W7Zfuj3knPiKDmYei/Quny6HR59QeTxr5Hsv+AJeLjojyMR+tF0KJYKLYMArFfc+VVOgtWISfw3q+yfigabT25YrMmEUWzBZOexz67630dBnwn14hS7jNN3R9u9mT7J0k91VkZSHcyr66gFVQvHR3viVkOL0gXfO0MaTfszfcnQgz99WEMKRUG22L5e6IQoYn/6o92Qktc0ZRUJi+Elq5N2lmbaNuvjpb+iTJYz1e4+KcePLQGimOvdtolv6R9miuEa/YDurumRZRsLXn4CgFURs4IKwo48poiYhGOqFf3M7CmSD11Th6EXR1aDrmqyyGkRDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vyLtzuOLzgxfINjIslApiVZoJMoh5mEBsryakv/4fdVfUQDDKy9K1V1+Pp1F?=
 =?us-ascii?Q?XCKWz2Y4SirI5KUKmvabqOIzpK7Ewpkugisq6F2n3NqyCwoA/FsMT5+ZhR+T?=
 =?us-ascii?Q?a/gzIJxU694jQwSvl69FUlv4avnIihbWRXoUczI186gZnEkeJa8UPDzXqCf1?=
 =?us-ascii?Q?hM35wRPYzLeYOJ2jpG2q4/xiEKthL/+TR5vH0B+swDAA30PrV2LgP0p1va1b?=
 =?us-ascii?Q?iutk5FkhSLM0wVH2e0u5wJWncxyxvN1e9zj39ECNexuocU+RXYUkKZqkUzW2?=
 =?us-ascii?Q?X11ZRNz6LbJoPs59CAf4/lNgNKNSgO83TC3DrrEXjHGnAtcZuOlyDl4P/kOk?=
 =?us-ascii?Q?Rm8IxH0e1GWv5QujoEMMw6GbqaUVF0dzmMuGOLQ6ArJNawcp79fhhu7oCerY?=
 =?us-ascii?Q?LRQhN45tBq6g7K0Q3qNirrZWIk0y8tFDJ7n9C4uUVyGipV5kZE0xWoF3OUSV?=
 =?us-ascii?Q?ZgjQOXDF8+6AKXwMM4D2loyL5qOvVFQ1qYuYQa931+ukasQPVBSJSGs37tZB?=
 =?us-ascii?Q?uxlOu/r/gDgjduvBIk/gpzEyn8X505drLuJlR5je5Bsmeutb/nR7gGPmSDUV?=
 =?us-ascii?Q?66d7DSwDxoRpUzwJ89sVGurcRr2m5Pw1tyE9SrK4cUWR7z7PhdMsuGpbHNN7?=
 =?us-ascii?Q?mkmcfdSEXJY3SSOGlb3C71FgTdj4GFeugyy2FRb55yHuoNZ3Z2YXha5k+Xkg?=
 =?us-ascii?Q?bqEde5oCev7dG1DH05e6eQgo5dvt8xwjaiQ2TbD+ciTdasoi20MiGrp2QplX?=
 =?us-ascii?Q?qpvK/Cadj5Jb3ciZGi4uuEZwUYYYHMRuzhhjFYGVw0OWUEn3zRWdFw6UShYS?=
 =?us-ascii?Q?Q0HbsEYIyuCpP+C3GSoxmmpQHna97kSMkOhoX7xsGVNo2/BIQZeVSUKbN4SK?=
 =?us-ascii?Q?Bc0xPs9gDPSdldQ+rW5xlctjLmMBJu5MRGQR512FwBdMQx383XcR4h7b9DYm?=
 =?us-ascii?Q?eIbglns7ucIYZiqV+fM2kEzWoe+0MlK1/d9pbjjSj/kZx38DYB3pcq/1r/Aj?=
 =?us-ascii?Q?eumpHEwsWmrucdjbwcCdtspH9i2A5w5iAERV46VkEu7z6UXrglEIGVpU55vU?=
 =?us-ascii?Q?bJxFTD2XOiF96v3nlWruR3KWQH7NC+opfmh7g3rZKwZDWAm7yQ583OUWQAJg?=
 =?us-ascii?Q?UTVxOJg4V0+to4fYlOcNvnHMtccMTACkzkzUMyIe5T9ot0p1e8c5mRnRgasl?=
 =?us-ascii?Q?tM0NKap8niOfoKuJ8jVNMVczqpRdG7TS8zMJTptPmN1138QritMnvSb+sDmA?=
 =?us-ascii?Q?Er5vY0ih036TVPtyVI/onTOp8kTQf7hatykEQqqEDoo+XZyQw1tNB6F2sAAx?=
 =?us-ascii?Q?YyhVbe6CIVFK2tzwYo29qdlpgrSQU8O/aA3vZzun+t87jZi/c8CnPWzlSsOE?=
 =?us-ascii?Q?jj53sjTVKYGlAwmkzSyvb68MMlws9bPUApBjskAlB8nGRY+UhuGS7zwZs5jf?=
 =?us-ascii?Q?WlRwB8VVPOO0quZUCtwCvmeou98EnNWmFfVBwaW9huWNfjKVbE7Dj2NK3z7j?=
 =?us-ascii?Q?zz8qqokcKok371IZfM8u1kZlVIv22YC/qFz99XH5tzat819J8FO+7MuINgBO?=
 =?us-ascii?Q?xQT263XVlhrLrCdEKQf1CKBkQXW2X+4ZwUe3ZuceEYcYSDfG37DLnPyds9Yx?=
 =?us-ascii?Q?L2LYcIgI7fuY0P9SxDrccDP7FsvhLCFBfDWd6GHbBAfNdhJdOxNKHfPebBCb?=
 =?us-ascii?Q?lr2RdKsUEakhyWaup+0JfcSAwbs0E1T7yytgFrNHtTpc/Eo+evcN8ylLpMia?=
 =?us-ascii?Q?utQn3+sx3eH15xH+l6gDk/mS+2wU7lpBoVVvjYi3IL+ch9FlMx3s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290b134d-f69f-4f02-aa4d-08defcd53aed
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:08.2054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igHLSC0HFCdlQOQRM0oDUTmN0/49D+bXMpYppUjYE94TOk3mlCro5qqU+V5IOzaoIaPyx0finx8ImRq6skIA0NXZo5dtr1kymUgo0TaXuHsfA1N4/5nChDSnIireJX0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_200311_921713_A0B2E472 
X-CRM114-Status: GOOD (  10.10  )
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

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 MCLK input is driven from the respective SAI1 MCLK output, and
sound-dai-cells describes the node as an ASoC DAI provider. Both are
fixed SoC integration properties rather than board specific, so add them
here in the common dtsi instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 34833e62bd79..a0d1922389d6 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -131,6 +131,9 @@ scmi_misc: protocol@84 {
 
 	mqs1: mqs1 {
 		compatible = "fsl,imx943-aonmix-mqs";
+		clocks = <&scmi_clk IMX94_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.50.1


