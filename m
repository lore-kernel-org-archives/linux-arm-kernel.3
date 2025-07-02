Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98495C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 03:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRKrOPbVXxoCYq477hEiLdPy3euUUCQnXQjbhABPw8s=; b=UGrfqm9lkcUpxGrVlRjgN4+Xsh
	B9k4SOPUAACccYyACJ2FfxgJrtaSb4PJlV1LNMGQEIQtzCGGCHhi0tdug2EZyzbGMLY7FEBQBMofl
	nWv+s4/NKqwiYvs86LZWcZ9IM3F/qjLoWpGzQEAAXYKyy19qN8eJeSg44XGQqM3XKj+NnQsj3GtZS
	7yOYZszy7/PUcutj4ZspJzT7jS5+NbTIQeyUTJIqvoxsxfk8bASMgNoflr4sPJ8YrHlFAmT4KN/+/
	NAz/xyijBtjAnXtzDKFyhJ+29ekFyFrFi3GXbMoRXxm6CyU0TBFUEf9+Mhy4+Pcxn8U+5Z2Zrr6N1
	rVCQAr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWoR1-00000007974-2lAd;
	Wed, 02 Jul 2025 03:46:59 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWoOg-000000078vh-195H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 03:44:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWYYSN0T2w5UrFVzREMGMIHR4i1ogSQ3oZYcroxRgtQ3dGnsYY/yCAmmUfcP0YCtwLTfHl7PM5JwX6ICaLb96atbln/vzQWGOkbHb3YvMbv2pKz55sqz/NJGvxMk/w3N/6z6vzvyNimMZ2CKzx0b0ozSqWbXGDjMNulLOn9tYEBVcYof9Z+CgpQFQo5+wXv2xWBQvxLqLByaghsl8QlBCc7L1QTuzxk1Nv3XAqVQIZyG5q1CFKko+A+gxt7d8DLsfVmJOFZ3bvnZK86RY7HiIeod54U5TLkrjKMu2485Ag/hVTEUdbLIyka6cQruD3RqUnoQt6oiz8B9WUVXb0OStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRKrOPbVXxoCYq477hEiLdPy3euUUCQnXQjbhABPw8s=;
 b=COiYo6msgjSxJL7yzjshv0ZadvcsXmUyx7MmnpVdwcNKtfSpZ22Wl+f5GZM86B02NX5LYDB4S/83FgmqmgIQ8XeDfAMEOp7g0iwDs+3FELWfnWNIuoSYOjOgYyNs/L9SPsMEkc3qy/p5H1nHYVkAFA4KNYEE9X8h32YJM1Wjb9KH5Fw5dqNxBNTR6r94SexGoDFQdXjxL8g2mGPycnR3e0GBg+8bFfGJU+NiMendQriY+wugIia6AArXxHBVgq0438BaHUZhuggG8iOMA3itHS0MaHB+KuPIcEBo/bFpVR4EoF8EujuCLvv8EPKi30du/cjnBMJl7PO2GGXDsSTXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRKrOPbVXxoCYq477hEiLdPy3euUUCQnXQjbhABPw8s=;
 b=cSznYk1TcMm551C0bVsZbzYEHNiDGZwyAbeqr9g6ABlTJ9I5Wro9hDoofYwlPFjyLTQfaeUh1T2hpWjoQoEraj2M+PAXrEDYtMecC7Y6xw4H8FbmrPUWRFmcEXpFlZBSTiJnsAynkoq9aTyXLSH6+pXKJl5deKO9Vj/g6jp+w341b5vvnTdRap+aHi0yLxyKTxOoL9jWcCWUliSI/STt2zCO1/GaU1hWKQD/kWQlFicPnFXjSgSwcSNhc0zFbKduS44u2R9xcjqWv543Jy9ShvtrnIxLsTYOfvDsALA/W+f1uqnRhCb6lmrYwbMSXIwl0ZpP1O7H6VmiDtmKcjOwHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB11061.eurprd04.prod.outlook.com (2603:10a6:150:20d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 03:44:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 03:44:24 +0000
Date: Tue, 1 Jul 2025 23:44:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	ping.bai@nxp.com, haibo.chen@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] arm64: dts: imx94: add missing clock related properties
 to flexcan1
Message-ID: <aGSq7TZlkoqIkQMT@lizhi-Precision-Tower-5810>
References: <20250702025911.2457322-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702025911.2457322-1-sherry.sun@nxp.com>
X-ClientProxiedBy: AS4P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB11061:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7db247-f27c-4db8-667a-08ddb91abc9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fqSPSRj0LrHaBJR8SJsYB9311MY+1MJS7TB7U0qaliA6LZSwxzNeBjo19VrX?=
 =?us-ascii?Q?gpqrdIGd77TSK0gPoC7a5Sdeo0KYLvhcrye5C1HtYneJKafogPdKhm9v7ABZ?=
 =?us-ascii?Q?3lgELYOSmHM6Z1VGOgRCOu73lnFqFPuNsbzOyETBMHx9myG4lGHJ7T3KCOYR?=
 =?us-ascii?Q?wDQMscsOWdwnnIEFalZ+KtSSt1NZg40vATd131FsI6R685M4XMIP2cMi1ZgM?=
 =?us-ascii?Q?WmrycsRACAAaQR7JUYdjuMEj6hbdJzjZ/Fw5eCVJTcffoj5Vfj8dZt+4iUWQ?=
 =?us-ascii?Q?zoCNJq3Z2z5RGf8Lc7v1WkYar8HlxWgnuJHaBQSBu0GnFe51LgS+v0SUAsBF?=
 =?us-ascii?Q?vRGspR0WfXMZUdJOZkTGGxL3eitv50mECNneC/YGjcENzls5kD6i8ThtGpb5?=
 =?us-ascii?Q?C9wsMsMwXKTd+mK8Ov/ceOPhs4HjQGLbTRHQQZU13Pg+GiScUF57kHAA4mo0?=
 =?us-ascii?Q?u28LS1Z9sLxjvXsX8tDFKd+ik+pncMdidgYKtEOPTMM1HQbQJ5JGtH96V5Z7?=
 =?us-ascii?Q?8rem0Rxc5nNxIBbPbDa8BkwNmljPySslQkqUwmLeyovEGPnfLHV4faiFe2vN?=
 =?us-ascii?Q?wvbefES4NHtNhSWFnS0+/X29OpJpKuRi3KNtmAWY8a0Ojl0xS0uffhvQo+m9?=
 =?us-ascii?Q?OFj9kTCpfxU/HfVGpuipCWEJgcmlvoJ46ehsJNR8Ca2Dgsy5WZoDjVtjzhMl?=
 =?us-ascii?Q?hy7VwLRMeFhCYVInllVb1lPtuCu+hjleSE/PQX0opdnC825Yyr9Ai2etFQik?=
 =?us-ascii?Q?q527JHVssRm/GdwIWTw/8JymYzknOp+RUN4yy2N5sTHaiViIDbI4kXkol35g?=
 =?us-ascii?Q?7SJyApNKBY9f8F4TJoK11J8Y5nqO9Uh8Azp27YEU2CqYrFV1IZIHydpyaq67?=
 =?us-ascii?Q?MxeSjiwRjn4SSvzu03hWOiDNM6mPHYHYeCagkZ7ytgUt5+wtP4yvzXKq0l2N?=
 =?us-ascii?Q?oJsX4Y2eBp/i7xGJNCG+mvh4rhjRrS5qvZ7QIqEV5KXYCdd0MDa7cuZfbvNF?=
 =?us-ascii?Q?Tjff79jKl6forb0jTbYi/l6QL0Ztfe2GPR1NRuBI8rY4zayAVm0q4cO8Vho0?=
 =?us-ascii?Q?8cuEiakcIG+vyTCGQ7Dmiv//XFvsAwbCl8V25f6Wfee+wDSeq1gIewtQEJGO?=
 =?us-ascii?Q?jKQlHhyjPfwMMfgTDYtGQpHiFJ0AYC4re59NrvKoxtsS19kyyPmz5+Y2DYRn?=
 =?us-ascii?Q?2Wt0BK65hJsnMfLe67I9R74iAzKUuLdRIa3n5Bc+7jSyn7ARNy2gmGBUpJkp?=
 =?us-ascii?Q?zCXRqpMsYMqcbhoAZZ6WWuIdto9GqRUL+AWRDzKDNgQOBVubwPk9h9Z9eCNR?=
 =?us-ascii?Q?wCd94/redTXa32JPsgaoIR08R7JXAWKdjh6Ie74ZhrQEirv7cmKvfu+thJrQ?=
 =?us-ascii?Q?iTfXR5CN7utvrk5U4nJWaJIRzuc/U9RkKl5sRyKorxbvOvmfevmaKwyIN/5E?=
 =?us-ascii?Q?9/bpFZKD3sWHv+YKckTFCZM9yQ91RYEwc+X8un2WvE1nZE0sgCL3SBtr/u+V?=
 =?us-ascii?Q?fjBkwEARZvGCc4I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CZEnUqsGHQbwCX1RNLByTGc/Y7+O+Rr6ksoKWJoB1L0pF/byVltiMd7YhL/m?=
 =?us-ascii?Q?C9roRSbxIsvxc/+1ZgjpNS/3KpTRXpjWDGRkQC6X135UkOoAT3Agr0prIlEX?=
 =?us-ascii?Q?uUcHSerNUH9CDW5VLQ0QYzrUSGQ7RrW5jy1tnOktJc3zFCsCV/qvyfsPbmk7?=
 =?us-ascii?Q?Har/mkikuRs7cnQCcRDqDbux8bIbVETXWBMCVYlMzVrUsU6R9f2B2OjlCHt0?=
 =?us-ascii?Q?Lvs2iyPIXHwZqq8RWQ2ezVc8P7wUIAd+zww3CZ7/Eb9sVqOoksIfH0ZmCtX8?=
 =?us-ascii?Q?/iCoG3I4nvRK3sAjhA1BTxBwqAJvdZopa+J1WbkmLBTLDQVKDls7yFX0ntY8?=
 =?us-ascii?Q?+rPdBgYqOssDXiIPpSJbiBNdRy7DRjDvSTht3btDztfOJTnMHEr3ZFhiIgZw?=
 =?us-ascii?Q?DnAHkHYbcmBH/jCm4ZxzNKsDCmo3P3yHhkqknxVW3/qXKAIbL1I/9EKYP3FS?=
 =?us-ascii?Q?lXio5koyGm0Gg60yUxMT3Fv3SfqNzTNDNzWFru8VFBAet68tQE7y4HqoOx6h?=
 =?us-ascii?Q?K9ynH4CMX2waeShqrIUbxoYaurgDP782+6RzxSgDiYsGh+qtwgLuqoe6u07r?=
 =?us-ascii?Q?OI90yV9zN+ukV2HkVI1k5o5U3cCgUeTnOtBRq2OFgOvr+CB18iOUjeDW02z3?=
 =?us-ascii?Q?7r0nj+ZQM9boQzxKKwqB+A8Kxt910tK5w4EayhRWNPmO+njdr7XR1dKTnojL?=
 =?us-ascii?Q?q0yQabzc1U1+t5NafeDPNEdoheD9yCI2tue8pTQYhby1lWhnZoVsl7w4/pxg?=
 =?us-ascii?Q?HBscKURZ4cRIC4GHXGL5rGAg6DxWg8nMZJkvCTn99KzNrhSXj28maz4EF2IX?=
 =?us-ascii?Q?/LwWIxY81GqeyMFLyl/YukCOARFZpYHiyFfNUIyBpECzi1o7RQNXMrif9wRd?=
 =?us-ascii?Q?d8W4/iSQkQpfdqU3iAWC2KuZ1XSG+vzs/1qep19/5N7moytoB6VGyEjxg5X6?=
 =?us-ascii?Q?QMW5pO8mQV6c3UWNmviOeVlhgLWNwrlr0bFrQyj1veKFQ9yjFTk2M9hBK/Vu?=
 =?us-ascii?Q?IKiaoFUGsfX80BZHNghoB4YmsRbunVQixPE7UzHFlI5d/By7M6YKsv4ROqvC?=
 =?us-ascii?Q?kVGSS3xpXJoOeHQsHvr56SzqXACQQlZOTWhI5dGSnMyEr/IEv+Ajq1wP+VdK?=
 =?us-ascii?Q?lZfWosu6x2mFAJK0S5PVLibFV6EH2Q5nt4GnLVRwGY+0fEJcsyzkLa3XWde9?=
 =?us-ascii?Q?Ahx5YO4UUXGYznDRK8CibFulxGrX2IenyAFoDinZr8cL7fShSTjbYXjjdIUK?=
 =?us-ascii?Q?GYseXbcrL2DjXefQo/HhR3apwJd4bZvzUieD5GKhnlVY/tGWHPHF4a4tDjuB?=
 =?us-ascii?Q?laC0noBwA1a2mZ6hgT1dqDHBoz095FdvzYUm3DCsDp4WJVH1Z8qtRz8qu85/?=
 =?us-ascii?Q?148+kG/Y83sL3zSo++xOakIfQf1ApyrQZb1ae/MvwUlNSjrdIbqbvvOa7E/S?=
 =?us-ascii?Q?y+tZhYTuf8FF7wvYJywHAAOGdOFfKdLVQL2eBn1tVgpqhwIq0gka8EcAd6+t?=
 =?us-ascii?Q?mQznvEssOq+ugmY+6zhyxsWejISx1IxYeJKO1lvqxtY5uknqL2XMp+eGplbs?=
 =?us-ascii?Q?gbGxR2XZIHCZeXMskthz2kmoZ/tASoCa/6VNkhbd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7db247-f27c-4db8-667a-08ddb91abc9f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 03:44:24.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKiPFL87T4aa1fcJBIpgVyRFWuc54GtWP9pScySqUMAH5NDPVGODYd6DbhHNeZsM4fNhnCfnMUhaUeEO/NXS5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_204434_312871_4FDB0B23 
X-CRM114-Status: GOOD (  16.84  )
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

On Wed, Jul 02, 2025 at 10:59:11AM +0800, Sherry Sun wrote:
> Somehow the flexcan1 clock related properties were missing in
> imx94.dtsi, add them here to keep align with other flexcan instances.

suggested commit message:

Add missing clocks and clock-names properties for flexcan1 in imx94.dtsi
to align with other FlexCAN instances.

Frank

>
> Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index b8ffc428e95b..bd3437146746 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -1035,6 +1035,13 @@ flexcan1: can@443a0000 {
>  				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
>  				reg = <0x443a0000 0x10000>;
>  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX94_CLK_BUSAON>,
> +					 <&scmi_clk IMX94_CLK_CAN1>;
> +				clock-names = "ipg", "per";
> +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN1>;
> +				assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> +				assigned-clock-rates = <80000000>;
> +				fsl,clk-source = /bits/ 8 <0>;
>  				status = "disabled";
>  			};
>
> --
> 2.34.1
>

