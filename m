Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70907C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 23:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR4gKZOLjpAQfTc0erEKxmhxoOOwrBQIGrGX6eDg280=; b=WkxzrZfFVfxckSeOVWNeMBtnNn
	GsLoub3AdDkoL7Q/TGffEuOkuoLUDDK0EsFw7bntIiEB6uhqHDDCnqK19ibN7/Univz4rnCDDoDFM
	G+fdolGH0L7lGWRit7gTp9L4xLLOTCGB1urV5ac4bIxUnzvoDzgMGnxcsdFB7Vz3T2dFG/9fS9zTq
	jeZshMoz4cXxepXZgHq8qsBHU8IRNnggEbuMFTcSqNOBISTC+A6sLtOqUrI3Ii92GwVoTgb0i/T7Q
	yDq0GeDJHBfrz1weHOxOBbPjvl9O4hSRv7EAYEbnkxE+XcY5ZrKuX0NYUBxsBy9CmS2zXjZGAeYDZ
	a8P+RuzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to9UD-0000000CwGI-3QEg;
	Fri, 28 Feb 2025 23:09:41 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to9QC-0000000CvfY-0aMF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 23:05:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4Y6ybFj3BLHLLmvRv0mZVOTgxyf2QXqqn53/wKq6PgMIY3SEPTxv+uHFv0jqY2Ao8My8g2nLMWej1FFmxBpmxwL5YC6GSar/b+jOZBvEvZUw3AvoKk/Blp3QZdbLX6bCfdKeECJfqNZbcKDuJf5kyqAkVSNHohl4ub7nqA2Gtyv2tjAIUm3atJ92+WLkhed8pVeZ6MmROckB5nWtiMPiH4y6eAATZ/Fj43VW9ogdtB3YbyeFk+FcU465lD7fB26qlanCj9eCJPrzn0tWV2s2GwVunnSWN669XAVzYYFLt+qTMtVw1cqH8vK4gxgSrFRCrppSmLz8W/FY9jvknd5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jR4gKZOLjpAQfTc0erEKxmhxoOOwrBQIGrGX6eDg280=;
 b=tblU9cFRcfxoNHbCj90wRVT33EWHH28hXRy4dzslr39YC/4M8pCmSZbwuPrmuk0iWTODQLXnXp2nKSmaYSBL9a03wzHNNWzDCQ8rlGxjcRS2Ik98MorAgFtNDLlUChHDs49mAnbobxn1QSHNRBXxeyEAte6PEGXUJ2hrvRKi9GBvfKUS6UmxHnb8oyvZqtT4ASIR1ctFphcZLFmg/bNUrL03O1vUrsZFBt+QbayHcejKBC3gu24EZplVOhVBArLMz21uWljxcH0HBuqzkY0x2AsSHvzWr/N8RqJO6iCtPOp9A0vkz1xaeQoG0rsQzatx+g3qfJuxB2sqBC8K/FfKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR4gKZOLjpAQfTc0erEKxmhxoOOwrBQIGrGX6eDg280=;
 b=RpGDoVslvCkOWOleNq9lu2AvhMgQ4WMgywyd/unB0i0g0eilpbxsokb+GT8OL6Lj4JLNQ1VSN8n13z/pK/6UZNmvNkPw3hjx5fK8dI/fqaN024gXVhGlcN5tVflbUYW9ACFYbsldV+c17x+qNjzz5FgOJu5nP3qq8WV9PzKqW0mI5h6gQw6Gcks1Qi3McQc53Shzmyn8H2eOiA7Ycn/m1bo5VwpAlshbArc8uyPw664FVqAkWLLtTxTw7xU02p2RZtM3vErT+SVXD/uH1ZrHNvphssFs8hb5jifxvR+tHtmnLMO5QJq1zqcyFYFaQEpeL8pcVigUIhQbmEw1myNsnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 23:05:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Fri, 28 Feb 2025
 23:05:28 +0000
Date: Fri, 28 Feb 2025 18:05:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
	s.hauer@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mq: Add linux,pci-domain into
 pcie-ep node
Message-ID: <Z8JBL7/LoCRemdjH@lizhi-Precision-Tower-5810>
References: <20250226024256.1678103-1-hongxing.zhu@nxp.com>
 <20250226024256.1678103-2-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226024256.1678103-2-hongxing.zhu@nxp.com>
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1412da-2234-4e23-35dd-08dd584c6475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kl38jGK0bV4rynuTMF4cNVk6Aw1a3KE1zzNO5nPHdUzEXB+QJVwZAu2bumhz?=
 =?us-ascii?Q?aHbgpKNEWIIJa4Z/hWiXz1kBvx5LQPnJJIrAx/VWuk8JhwPuaH2KWs0GcKZO?=
 =?us-ascii?Q?xSI/KivePIJgy/4NVEHP7/zL0R/c8xwszeLIQ/3dWVUd/zanEW0Ml7lARoVn?=
 =?us-ascii?Q?EaGWF1qgZUYen+mBdglvTsrYym9TKcF64G2adJr3CdQs6WvMfDZMjWqHCTMl?=
 =?us-ascii?Q?Y75MgnlYWaoUa1tpi+uIoC6cIH51inb9LTHoBP8aBqv1w/n1Pz+ODEIDxmD6?=
 =?us-ascii?Q?XQUCjlFIS0I2FADL6btsgErnUeTxjl2VLlUjvhOOslYuINfAVDdrt+PEeQxr?=
 =?us-ascii?Q?DApzlyB6eGKgtXm0J/GfVbVJt+83omBfQFi11qXsnUpYEE0/hnZ5gBdNCDX4?=
 =?us-ascii?Q?AXTeFWrOYO5KHwy1RtXAYJ4MMphPMdk01P9PTd/EO3+cDchgefZhSKDWnlAi?=
 =?us-ascii?Q?AtPi8t9wKtDOBQYb1dh77ZKK1fxH+fKLcGW2zshKP2dZrGIEO78ifSvibS11?=
 =?us-ascii?Q?bdotXPQjy/l5PH/df0o8qEnceGB8kmLGwRBhtGeDnZMZINfDhjkipnnxQjF1?=
 =?us-ascii?Q?nc/p9fiVjoLhjz41pLdiqjNm/kgi4wp273I6gxPvAgsNVorgo3xDo73sgOnf?=
 =?us-ascii?Q?xKSArLv+Ql2i06gE45QBV9JG/srl3F24SqcHJMcsIfyFdLprgB9chuy8E3DO?=
 =?us-ascii?Q?XfgVQnW9Vsmx6cZLlK6IpNxO4/0RzZl2UFXrdYGp2iJ4JzsZqyXcI34SVP63?=
 =?us-ascii?Q?vLx4ka0s1u6lvkdAMIErmvpIXvXdNOv1FMarqLe8CigZ2PWHklYa3TK2sMlJ?=
 =?us-ascii?Q?Hz6NnFDkQ9ucSjNUf+KjcVsvG8xELTiJbYGRPrDqEfv6THAIKA3OYC8Tc18o?=
 =?us-ascii?Q?nvpMnUJ/L0PhBWgYImkXAgUIPFfkNDiNqSKwAAQPK5htrX7pOAt01GO26HuM?=
 =?us-ascii?Q?a+FBkPy8nCyR3+xAXG3LuNiBGpAh/WiuVjpRhHOcT55LkAnfiyKAKbqHzkG9?=
 =?us-ascii?Q?dXYztQSxplpoCC4TOIhEkbrKmiehcuV6rASAx2+kNM1J5iudTO+31Zh5sZGV?=
 =?us-ascii?Q?lMXeTJ6R33bacPSlBfrHAKdDTHMCrmosLRHa+igY0Hr3nR3/BD0oD2VueBko?=
 =?us-ascii?Q?94s7JM7IwE/AmW70wEEsI+Xa+8Q1V2UaVHUSJ3Yy5s6DQjyqWoB/WOjuSfes?=
 =?us-ascii?Q?IL7sfFs5MiQJWwnbATs4LDnN2ZGgGQGcFxOfYddHiP4BlBbsWTWGcScoTNhc?=
 =?us-ascii?Q?V+lWZ4kmXbqFeWmmfeywQ8e1lOMjgnB5VAHE+06WhrLjDv+614nUmp7hc61H?=
 =?us-ascii?Q?/4QdvINSracYL7TVn3MzdXQk+Q1z6xUjhcBEvG97iI7C9ZTM4ylLy4//A6sa?=
 =?us-ascii?Q?NwEwHJwhgdlD74+oGNP3EdUkSD7l1HiSSAzOt1lHnX4gk14GmEA6Navs7eg6?=
 =?us-ascii?Q?HE479BAtCQvVKmmZ/c2UJNkkhEDwcVtN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rwej9tOs8M12l7wZN4xfBol4CH5P3jv2kj26XEn5dlR/lf5lEbgGI/15uhDx?=
 =?us-ascii?Q?8ayhECCHj3DSvEuS07zX2pmAVgYW3VixYcXPgWnZw9henfovmtMm5aN79/QO?=
 =?us-ascii?Q?leZNktR8Iol6TtDl8sVeM7B+1MOkWvz/rExJvAmWGFmt7k3KdFAVK/Tixmjr?=
 =?us-ascii?Q?I5ssfNXmXWb4Lgcs7elf3PJjjvi7fXXxNyfJaZXdQ0UQLlZ7yZQ4e1xF1ODQ?=
 =?us-ascii?Q?r6Ne9fvOQZ/9r1jd8j3LKAMG3gCA/z2Xopfgz0s5G0HEFkidMsiBgpk1rftR?=
 =?us-ascii?Q?ZP6hdDiWyxlvVBo2tm1RaPNvHHWuOkCmkOEVm8OjJcY6j41/V6KmzJJC7biV?=
 =?us-ascii?Q?d+w4HuLDcA3rMl6Wokn7BFd5UQAox5mLjIShKn4LvMECp/PuSKi1NXJZJPdU?=
 =?us-ascii?Q?5LKR6N7fGlt19t4Q8d9paKIAwSOsC0Mpd1AKVMHBWpGpMZTttN66nZzzr/Zg?=
 =?us-ascii?Q?EpTxQ/g5Blt1OG/Ht4h7kyt1L7ibjSof4qHG5JPh5XOFZzqFdVDZyAQ4e2mR?=
 =?us-ascii?Q?NfB0OuMCG9MNmQ2aIkgHCddJbHJjGumr7mHv0BdWoYinmWauGmApIaOEAt1D?=
 =?us-ascii?Q?5wwF798jYkRY819eBN2Cw+vUZVKzOK3rGpEzy9/S0WLdErARAzmc7dXNmi4q?=
 =?us-ascii?Q?Zxz08IEIoGJlB/kwssZApKr3d8nhXFWO+sRf3GRJ6SI4DSA1NhNc8+ggpM5K?=
 =?us-ascii?Q?ssw+T1t7oFIplQvHLW4htij0j2hUHwPpq9KGMDuu6cylEsx/ZG+jfw6kGM9n?=
 =?us-ascii?Q?dM95GcT2zMkgO6IVWyfYB2sN0Rd3M5TuPJBNGgbIXtzYkqi488LVKiA6IXDg?=
 =?us-ascii?Q?bc1LIIwqzfZGBcR7pf0NTnHneCMrHKfuqf1t4KHsSowvjgsEM4Sw0HNOOSAr?=
 =?us-ascii?Q?NR+stPutb3dSH1MJrbl12V9M+0uxNEyFctERxRAx25Up8+m5HL/fqzvp5Wi7?=
 =?us-ascii?Q?eW81cjoZSLioibZ4RnRqdPrA/TIf9AIu16fCum1KBl9rk7Dq9ayXqNbkK4du?=
 =?us-ascii?Q?DOQ5Ib7+QSsoUJMgk8Uxj6VRdod2kN1la1BR1JtLoqf0jPKLhjikD3foVL0x?=
 =?us-ascii?Q?RggHZ8sJ+T6FEjUYCMruoqefr8MryBS8aLtrxMmSwt+sgn33yaKeePepSY1x?=
 =?us-ascii?Q?z4EzVZuk03KK20KU8JR4YZkoSbnDglKSuV2kxrKuW126f8N7uMVQodCVJXvX?=
 =?us-ascii?Q?ga4ni/Rea7DgNcjwsn2V7OO7aaU7MofhJK5v5yAg8V130RFD6lSaRSBlBwhi?=
 =?us-ascii?Q?L0GUetKG9b8+DyUulIsZJHAEMBZQ+beN7ptOuFemuclsUeh97iTKM70ao8XV?=
 =?us-ascii?Q?iluD4KBYrv6GKq1X8eG+6sxC15h417LasVg26uf2xOXAn+QVA7isQnHLPu6w?=
 =?us-ascii?Q?4+MGHK6wCKt54pLIclmOGEWH4bM2GNXm4VTyyCbf/QxKObeV/kInmprfHgpt?=
 =?us-ascii?Q?D4AQvRIe7VV8ZMPl40eHWF0l1j/dTcROXpUeRPpaaCPP1NutuRWaHb4hMk6x?=
 =?us-ascii?Q?8qVgMozEmwwp4NJqqnLkqTHfU1Pj9eu4gR9sg+cBXQkjR4xlLRV0hnPL5UbB?=
 =?us-ascii?Q?z1qqvpgpFBrSI2gYgZ3pYjqwZkFqC3Fxjf6OqUSQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1412da-2234-4e23-35dd-08dd584c6475
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 23:05:28.4060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQaQqLGOnv/SQrfbYpXhlzjxjD81A8kDkjFfemeqXgHXdp9u619g1Y3ReXdPXqt1APyEVunU+IcpCZ2kxVSIxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_150532_177522_FA450CFC 
X-CRM114-Status: GOOD (  13.11  )
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

On Wed, Feb 26, 2025 at 10:42:55AM +0800, Richard Zhu wrote:
> Add linux,pci-domain into pcie-ep node of i.MX8MQ.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index d51de8d899b2..387b3e227cfc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1828,6 +1828,7 @@ pcie1_ep: pcie-ep@33c00000 {
>  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "dma";
>  			fsl,max-link-speed = <2>;
> +			linux,pci-domain = <1>;
>  			clocks = <&clk IMX8MQ_CLK_PCIE2_ROOT>,
>  				 <&clk IMX8MQ_CLK_PCIE2_PHY>,
>  				 <&clk IMX8MQ_CLK_PCIE2_PHY>,
> --
> 2.37.1
>

