Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B313D15DAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 17:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsNCGJAN64PECY2/ov6MACwfBU1dfYqq5jHmEXVCnEQ=; b=P78REaWif9xifvL/2UwzARIb5B
	OIQdzaOwQCYQ7+XeNWstIfeZoqnwJtKDn8y39eJt94ScPlg6YQMcSSEoQ8XdZEgp6aEb8jGDLdSCl
	7DnXOHYIo6JTaaUQBcCSW8Ima5hPp7uumUC5MO6zs3POMRZQp9sVjcUVO8tMHU8BZxEFt/cXWT/ZL
	R6TfOLG++nuyWpRTG552TfWfyLl2QfczcjI3dHrvz0xUCoOKddktgnQyKjtMBCtkgU+VoQKUyf35n
	XlEKndFq/sRINVAWSAHwV2+6Spl7SalhDDoHXrk6kN/MDpM0C16VSmLn8t8GoLVU/FHufbnJsHQ36
	SDd/VODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqri-00000006sZv-0EKb;
	Wed, 03 Dec 2025 17:42:10 +0000
Received: from mail-northeuropeazon11010009.outbound.protection.outlook.com ([52.101.84.9] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqrf-00000006sZK-2RKs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 17:42:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIM0IJk4eLBoCdFNehmrpA5pwWtz4wDHcGHx+bW7CN9WojyrqwIhuCF/+F0kfFmHScxy3hcnKZqHM2zU6uJ+AZvix/m5hfnn4UDO0HqyOowdyXsu+Rp17fBPx/8CyjHuDMz1JERaeR6R80pgSsc8uF/n4sE8XT/RJjClOTMps28NBx0N7ysQfhIVN8Fc/lp0R0j14KmPWMhW3mVtmOtawsq+Z0OKdo0T1lHygTHMq0DWmgjk2hMaEA9OwDaISJpAdVN+l4whm+I5cPwhqR3QZyNRw6CCCy8wBX0sqmKEWqJLxWMtmoCJgN0uRR2KEdbpufnEwx3Qb9d7XWVL7V+Ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsNCGJAN64PECY2/ov6MACwfBU1dfYqq5jHmEXVCnEQ=;
 b=FZ2RbcdgIp7hk5gb/SjOCvyy0/+6hnP+uO9kw8CQYdbinr9+j+KBOKfc7clcOBIHIN4S3R2gYsvchl8bMny624+LG9rizIUKLI0B2O7w0Fn7gXNLIUwLpDZRr/bPcMfYVr5CmiiyvLH6IrZ2VqOGkY4+rxQoXdG0RsTZuNfN7u+YFrl+daqvz1jo9TmlPFhZFR0B0AEv/D/GIDB/GaF2vzv5gXQEtQz+tdCgLktbOWtbbY9iPcW1gvJfsQDHF9SPXkdZF1n9i4e5335gH9MItk1sYbahhUEHs/dB+dkbqqwDRm/BPzm0WGvalLDE8xoITkYDuzGrkqk/Zb5NrjoJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsNCGJAN64PECY2/ov6MACwfBU1dfYqq5jHmEXVCnEQ=;
 b=PNPXwXeRuG/mI05dDTUJwCY483CX0saBup0CokCYA7XgmUDTL/t92fWPt2YeVCkfPvNahhwYAFjWrGYVEVfT/fFLaEHo6i2erujTHhHgOTLyxyk8pGLTtQjFTw/9XW0osjGefQk2eiuaTb9u7KzNVL2YTQ2TvPEa3j+XGHZSSFjsFlRpx3k8iMQPQCyCyQV79bAjkjQsG/EorfLVIwZOEQ83P1ovbRno5U9orPvSZtGv+XYbhd3JIL//nreNa3VrB4IvQxXfJPOWF1N8PQkJS+rFZrjXuvtIm02dXNCWdP1V9i1HxYCSn4e7IphgqMTLM+QyiwsUD7PBkCx657VsTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10625.eurprd04.prod.outlook.com (2603:10a6:102:48a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 17:42:04 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 17:42:04 +0000
Date: Wed, 3 Dec 2025 12:41:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	alexander.stein@ew.tq-group.com, devicetree@vger.kernel.org,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: dts: imx8qm-ss-dma: correct the dma channels
 of lpuart
Message-ID: <aTB2Y540EtnQUzWH@lizhi-Precision-Tower-5810>
References: <20251203015956.116364-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203015956.116364-1-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10625:EE_
X-MS-Office365-Filtering-Correlation-Id: 8322bf75-c296-40ee-55b2-08de32934576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B6o2OvRcW059RmqfqbMD9rqaj99JalRXVQJKle8r9SrGMERwkQbHF4wpQc7y?=
 =?us-ascii?Q?oS8QdhmztyLRbFXMENR64ywPQ9QPe16uWTDzVzgsuqbOWeEMlDcPLTeog/ZS?=
 =?us-ascii?Q?m2P/17n20VWvc/IQ7TnV76mmR9gocfwfd1w0LidO6vjXGE6yrkhVJgzUzWNu?=
 =?us-ascii?Q?uimEW+gosekBAHBa2bLLV5XxQ5PHdZtDV28xeWMmtUfLN33UVSjjO7H2AczO?=
 =?us-ascii?Q?YAyhuxAwYqN4Cs7kQ8laUFARu0F4/X21MYrmk3diR8zxDI3v86ly6WcSvZN5?=
 =?us-ascii?Q?aR9iWdE1NY0vcZJnITmcwU2cBThloW+Srn9b3aComMpxiT1ao7AugLpsQ5ZG?=
 =?us-ascii?Q?ggZKpxbX/MKJeHJhBf9wQUWZ5LhYHVLh8ArYBCkXwi1tFzi4avaEBIJWg230?=
 =?us-ascii?Q?y9COU+cJiu+QzxUFyWI0bGF9T9dfmKIw5zJFBqaZFstW8YBiMeQcYuqUuz/u?=
 =?us-ascii?Q?VpTXHrfPhnsXQ+Do4iJmPNW9GdrxEOrEvU1pshPejvsN0i7NIkLW99Dp5QZv?=
 =?us-ascii?Q?l6i8t8/wHpEAOj9sue0XLT5PHpp7n3lEXQHWM541loOQHtiPQJnHr9yTRUCn?=
 =?us-ascii?Q?cOxhvTPorGIuACZg3n7ycjERR4yPdr8Ywg7qCP3FlEtP+8xvNq1a4N3ImsDe?=
 =?us-ascii?Q?H6uLofeqZG0HCIp/AUcNrbLkzpbyTKIE5JWnuD3WZeegl5rSPaLsrGxbIaHq?=
 =?us-ascii?Q?8S7aOttycBoRQvfQobwzVIkRjaN+7I6mn3oWGj51LzJPZ6Eb/H24hiP+MYxA?=
 =?us-ascii?Q?wKEzdJBhZYwvLXd+oRV49Abdjl+HkEAevBsaG2lUnZOMLR3pOtqV9jAijIqF?=
 =?us-ascii?Q?872rqn5pKiX9z+GEvRrWCMBohJapfVp1010N2uLIRRUH1yiP7sD9pcnI38VZ?=
 =?us-ascii?Q?L9Mp4G1IjLxU1P1QbWPi89F9/nGWAZH5ftPCeGH9yJVBriP2FBiMuit/yVYF?=
 =?us-ascii?Q?qEumgEx6OOvTTMUPyPmDVLNERbHjBpUtKpWoCbA89UDL7PZRHTR0ZbU2JUGA?=
 =?us-ascii?Q?dMBx9+V/Tu5oKamf+vHkXs9X3qQ3ikNwjtiNofWqhcYIODoFw3CHLFhgQdH7?=
 =?us-ascii?Q?nMs6zGziqdEyhj2wCQBvoVV4nAcCbO/iyVgj1e2exxilMkOgkum+JvFo9n6t?=
 =?us-ascii?Q?lQz4bMJLH+m9aF1twY4IlbsgLrH6coUCmeTY3nw7DsCGR96ayDy/f2hI2MKG?=
 =?us-ascii?Q?ici1w1P6PJeJ4wjxcI9tjMRKamAgaNuCs1BA6J8DGmtZDokvhOCVDAaEwn4v?=
 =?us-ascii?Q?EKrqtCGVBcIrmgu0SgcVML5LaozepuFhBZb4TY9SCuGYt3Cjerm9aTZYVcSN?=
 =?us-ascii?Q?XHPhFDbrD6Z4fUY/K3PxRP5LOh4aGYjvE0DhEES1YPGiR9nkSXXibwFimq6K?=
 =?us-ascii?Q?LQOZhsB0HbXdDhhtjguog8pe3b3gjGQ57T7gsu/XvW4Pl3f6d3hMqzaOknVx?=
 =?us-ascii?Q?RKlCI6X64FoFLOJCY08eYEO8EInitqhf/vajZWHQbkVl2IZt3EGEdHiiCSes?=
 =?us-ascii?Q?AsNfcOKSU8MsI/2joqrfHmyUQS/rOzbGT6BK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yI7HunatWSDLQTpK98keAQahZeKjyOLY6e/E0ASqbUD7X7jz01c0FXza9YtP?=
 =?us-ascii?Q?oOfLfKw4w2s0paRsjSprgbR+Yd1o2nQa3Eokq2/5O7yJJuctrYpHNYJYj8kn?=
 =?us-ascii?Q?b5tv8Hxy2ckQ0KKlZhd0ZcLM7dg4QA28lZW3KJMbcccgag1au7J80gFV9Jj0?=
 =?us-ascii?Q?8o11ow3BdmuxEVttxBT29k/NMd+3lSLIxhp5epOCOjPCuveqI6RfKgyFVxJT?=
 =?us-ascii?Q?DTDwbT0ODfzl/YLWKCE8SuBc6q9CpjJ9foZkD1cJiG67/1xmmxzf3NfKkxJc?=
 =?us-ascii?Q?XdYJ+azEZJkhXc6Jo/fhSCos4zqoTDHk3UP/bfC1KV9xIF07/xp4rR3PpfIe?=
 =?us-ascii?Q?IWwpRG/X7EBwu4ARgtA63xnUZBxSJSNwvbhDqlXXmEx2l4BESms50UjSbeZe?=
 =?us-ascii?Q?1bM8hJfOftNtRXt5D/LA6kIz3S+JJv1j5nuVHI/5HsfWIZfDCzD7QZ6+jSiF?=
 =?us-ascii?Q?Qlh1FIAZGAHxFJFrII1dfHbmru8twAzbOAloxbIs7xYL/2AFOpDrmBshSYIv?=
 =?us-ascii?Q?J3QeSOp3NOWBdcW7qNUgMQgeCZ8NAhNuXrr1DMq/yTI7fwsTwzU1hmEF3CEZ?=
 =?us-ascii?Q?FvRtX93lkBDojwG8bQM+4Tb8QvDbULzrmZPmTQP2zWZvzvSOokhi3B9rmejq?=
 =?us-ascii?Q?+s6L40Api/zgr0iYGGSdtGN0GoCUzaZWpe/3dRDF+jt5anwdIi2mBCo8mnkB?=
 =?us-ascii?Q?oOtb/wntMcxlmIR2CeWWgdljVOR21SMUZAEJLVEa73OIQsiHrPhFMrOwtErQ?=
 =?us-ascii?Q?qgLCMdmirGDdA/BZ7ArqMkqXYYJFDkl01LKfAUpwpt0gJvxjJi0bZBWCLqcr?=
 =?us-ascii?Q?cIxyTmUXImciyijb/jvFYE33P7DYOkPP38ezjqzbj1jduFsqvncC+TbxKTKu?=
 =?us-ascii?Q?tUoz1k2tVCHTD2wpMWLuIAfRGKOGVj+M+SAaesMyQMR08Zrrc3+IqNm5lkLA?=
 =?us-ascii?Q?R6gDtHkzm5erIv3wMYaZfHXTvRqyjqAlweqKXgk6Z4iobX6rOFpRCx1T6uRI?=
 =?us-ascii?Q?PyLdtyDyNpgAmXhA9E38jC3B5qulG74UTGcORdvUUqGOI1daEOBjyqLHwP6H?=
 =?us-ascii?Q?yqJdmGIqakCtmu9B6fCdFqGKL/1AHwoMKKZEsCHU92pmJpPkYvkQvJT8n18/?=
 =?us-ascii?Q?jdQFJHhAfELpGeFmBM8OFw3wQoseQaQBO+hO62jAZLdUzHbzGROKvrT66kGZ?=
 =?us-ascii?Q?ai9xvDTu6yMlr8jKv1tgFgJ9u/RBd8P82/qOXiKipbDW3KWKtj5cfbBKqNvq?=
 =?us-ascii?Q?yl6MMPCd1fOVGxRQLdrhrhFCsVXTc5Il3e6qNDW3T9EElYmkE0Qq+rxSK+J0?=
 =?us-ascii?Q?9/OzPLeW2BJeXS5RchHy0kTKYK9igyZkJofR1lrOiI855DOLH2sMka9UXsbX?=
 =?us-ascii?Q?UnIIveg7ujmxfFZtbuFtQ1WUSwN+jhWPoRw8T+lmCa13OYi1UFG8rSRz0sE/?=
 =?us-ascii?Q?GmJ2+cJgudpg9LrLSOxoWujcsaTjH+ESmHGvva3dUT8fnTIVfmD3SHaJ039Y?=
 =?us-ascii?Q?uqkyfeOXVQR/MHdejLkW68PmYFsp4lUmhxhOIJRVHgDC+PczHs4ZWjYiUaBd?=
 =?us-ascii?Q?o2X8PpgY8V9z/Un55hBJJGNcuQWhNdT56q5AzYSt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8322bf75-c296-40ee-55b2-08de32934576
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 17:42:04.1426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hI9nbD/m4z76XUAfXXgpQ4MRy6dQgnO/LP6qQRBthQxT1tSla5zVnKJY3r6X9PnDJU9tE2AsFyWJ/uunaVmzkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10625
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_094207_622303_968C088F 
X-CRM114-Status: GOOD (  17.09  )
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

On Wed, Dec 03, 2025 at 09:59:56AM +0800, Sherry Sun wrote:
> The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
> order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But miss
> update imx8qm-ss-dma.dtsi.
>
> The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
> dma-names") just simple add dma-names as binding doc requirement.
>
> Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines for
> the FSL_EDMA_RX flag.
>
> Fixes: 5a8e9b022e56 ("arm64: dts: imx8qm-ss-dma: Pass lpuart dma-names")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in V2:
> 1. Correct the fixes commit as Frank and Alexander suggested.
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> index 5f24850bf322..974e193f8dcb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> @@ -172,25 +172,25 @@ &flexcan3 {
>
>  &lpuart0 {
>  	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas = <&edma2 13 0 0>, <&edma2 12 0 1>;
> +	dmas = <&edma2 12 0 FSL_EDMA_RX>, <&edma2 13 0 0>;
>  	dma-names = "rx","tx";
>  };
>
>  &lpuart1 {
>  	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas = <&edma2 15 0 0>, <&edma2 14 0 1>;
> +	dmas = <&edma2 14 0 FSL_EDMA_RX>, <&edma2 15 0 0>;
>  	dma-names = "rx","tx";
>  };
>
>  &lpuart2 {
>  	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas = <&edma2 17 0 0>, <&edma2 16 0 1>;
> +	dmas = <&edma2 16 0 FSL_EDMA_RX>, <&edma2 17 0 0>;
>  	dma-names = "rx","tx";
>  };
>
>  &lpuart3 {
>  	compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas = <&edma2 19 0 0>, <&edma2 18 0 1>;
> +	dmas = <&edma2 18 0 FSL_EDMA_RX>, <&edma2 19 0 0>;
>  	dma-names = "rx","tx";
>  };
>
> --
> 2.34.1
>

