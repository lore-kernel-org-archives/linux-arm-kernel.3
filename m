Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0763C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvbtElKPtAXGMdtUojYo3ULVL4JUbnrC7TOzkEhN1fI=; b=DsBqS8/NXtWH4W6BjE+j8Sosuj
	pWbAHsqGGkujw7PZe9tgNs2Fc1B6CD+++DXjLtTxA0/iAwuhUYow2Yk/oHtvNIFUhfEverFQmqHZi
	Dw4mGhVMvPgfGT8lgQqlgMR9YT34i9q2yEXkQ16Loyp9TkDI+6xU6R76od05y6gzMse1YCkrsufdb
	X3QeyWw2rdpvr3SCIcYDGnKJJA8Ymiiy6chsonwC0RkAcb19qd/DjKqsUTOrqO4L126m5181DVc/C
	8DQE2ibtdqjaJ1sxTCbSuuaClWzXttIZGpZc6FVkzB5h9fV0nlgJ/kofi+GSM5y0rPDfoej9GmnYZ
	rfE0QQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3e-00000000Pge-4BQK;
	Tue, 25 Feb 2025 16:45:23 +0000
Received: from mail-vi1eur03on2062e.outbound.protection.outlook.com ([2a01:111:f403:260c::62e] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxYh-00000000AmO-14Ku
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:13:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p39OnQmgjeFPodbNmBQ0HNMVPxm7xqCyNV8+wSdKjffbHB5EhhPD4lACffNA/kFds+UVnPgZCoieMnb/yzy3c7jc35Spl0hrj9EzIL+tWLtzlsKeQW9W5ZypTLfjO/GuEsyH+asiqfYQRQyuq98qlgo37ME39p6SiWgZDyRb1NigTNyqMNv55oM5QgyI6PrkNMHQXQeFAbF8Z75A4ZG+Ro7cpy7oEmvpDv1LRUqseQJxcgW1fJxRCBr1jnoHgp1E8ARg7esKpLWs7px+QiXEQZg9cvFnAMhBXH+zutGtO/w/zWAa7FrbZMRuJFzH0HBRzEcNdu5rd9I/13rw+Ph9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvbtElKPtAXGMdtUojYo3ULVL4JUbnrC7TOzkEhN1fI=;
 b=M10xgmY4yIz5PGq8DBWKBSEfmVgNu/bcRsC3PUJboTs1MV9GShzUxQptClqXZkjI5EwMR2pCCn0f8l7IBHmrKVYTzB5SAe+kW2ZYUp5kqDW+lMvQwP5M9LZqJhGCHYQTzIt3aP7gvLAEsv5UgF9SEsIeUyxuKu510lJRWcVC93VXkpxigvZjzuu6qtTL41C7RyT0d/7U5CNhdt+pP+B5VZ8REF+/ia2euVkmtpuXMVidgac5qAzHzU/x/wtQH7q8W5wcEvwOgA/MYOBB6Q5brACz6ajoIbdyV6/OqsQPgYzqMQekH7xN3ekGN0j2bdOSaWfcJc+W4Z5No0lB1eFxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvbtElKPtAXGMdtUojYo3ULVL4JUbnrC7TOzkEhN1fI=;
 b=jv31bucT10ssw3XP/gMx51nLMV5HcWup/qIXX7d5LkmUgJPNOXKikTLLNxIk2ADgCzY8nrNFmKqWMBcsEnT4PHf+DTfB7HGwut4RaRc9Uga7aqJvVPGzdAPAob2JV57InDNAeo8IuEs0g1FhbCiEMFdNQ8a/9xSJDR2b/ReDzUiUVfcZUCqbS1xcQ2Mz5QpTfGunFBZS7wMLRR9K8p6Q9/6IBCKZxtNtXrSsAYTvpx+EyCGvYdwbwk7LxN/9jlUsiBSNZl5Arepd1OJgl11wl2kFt8kNe6t1ZDaZZ0FUz5APktRwL8TCxGbkp3dHObHjX36oygzZSJLDw44YqnRAow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 25 Feb
 2025 16:13:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 16:13:13 +0000
Date: Tue, 25 Feb 2025 11:13:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
Message-ID: <Z73sD3mhCI6f+hHA@lizhi-Precision-Tower-5810>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
 <20250225102726.654070-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225102726.654070-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 6690469c-423d-4991-6dcc-08dd55b74e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xHS7Jsgkngs5s9D3GuglPMWLD6x96is7TAMwIo0gNpLr6eiiJrDEuMVo6hqd?=
 =?us-ascii?Q?SdCXOh8KTA7pcRScvM9uldxttKqmCJNce8kdNnmzrLDq0dqE/rfv4ybNcT6w?=
 =?us-ascii?Q?ERH6L52C83vLK6imnhMVhQkm/c0P0Ehw8wUBLX4GakG09E/S6HjiCxr2GfHA?=
 =?us-ascii?Q?lovHbN4f5iGQ5BqwVQmRy4iCEglNs33i2L4Dc1/M0qUeMs0BWUmxXOK0ooih?=
 =?us-ascii?Q?dV65IO3Ncr+/rSmvvjB4p9NCclm03B+1XQveT4LQvT7/vTe0Krel6nIgNVIf?=
 =?us-ascii?Q?LZhxBiSYpLY6q85lf5qAYZYvuPCJlBWdb3m2z4SRBxld5ijXFltTtpdjGlgH?=
 =?us-ascii?Q?9wCBt1WVRrSq3UB4HMPISp69RlgxwpXPwBbFYwj30U78YB7q6m+0nkauOUJP?=
 =?us-ascii?Q?0aFfkcndB/BQ53EaMX1j/VmHPdFtcNceFQfPTV6TgQD6ijjhA6ri6XEFiYa8?=
 =?us-ascii?Q?kp8HiIbM9LjsxqISbeBed9uN5MhIlMzFatoP6uF6tWAc2EzUVsHWGijhWBgr?=
 =?us-ascii?Q?pVHztof3MJiuY4C5HhCMk9SB94DPt92NDzfLCFZ43qyqSQvr2EGJO+ZXL/0C?=
 =?us-ascii?Q?1fI2zMeFZzXe5wBjDFDkWLyAH1yaBNfZrsf1g7Huz8S6bQG/h8KO3CO7/4c8?=
 =?us-ascii?Q?bdqKydCl0iL76YxXdWNSm/uLmlP0rR3O4U8iuIKUtTc2R9jMaCI1sywuCTaX?=
 =?us-ascii?Q?7F7wwV5QDTQmQBanjeDSdzPtjeKcs6cAU3XfQemBvMKrfBqSO1rKmlXA4Qu1?=
 =?us-ascii?Q?ojKy0xTazcR+X3ZyBQRuwEJQ3rTNwGtWHLnQwcaNMlBGTjEvBE1SCse1dXRK?=
 =?us-ascii?Q?U2T3UBr0nBqpj44mnMa0rhU3F8zIz8ef/f9wFCRLIUWvjjcrhkityae4jAX5?=
 =?us-ascii?Q?cuD6IaTMSM7B1GIj1iMc0vtv/l9oPYChcxtPJOrMA2dM4tYIgs56BDFBL+5T?=
 =?us-ascii?Q?LD/kpPF3ppCC8qznQfOo3zZIPnIkIDfQauI2rDNqMBisH/hyL8TiFonvD0e9?=
 =?us-ascii?Q?tMQwZYARWxvKWnZj2VfnLvirXKc6pIL3qnCb9J1ailg4pPhyNfpKxOuat3M9?=
 =?us-ascii?Q?YS39VCjnHQkKKbi4O0Y9WILvw4tpRNhUFPsxXrmR35sLCLLqTsgPuBiD92MV?=
 =?us-ascii?Q?TgmNa42HqpmC7q2LauU/wYJLLDdEy6PmHQ3TWO1TObDa5Uf9dReWYFNPDq/u?=
 =?us-ascii?Q?u1VZg26hGLlqdUU2dFKB9gMdQjmWgfJJJyQhihBKJBsd2/AzvF/TGH+vxJvo?=
 =?us-ascii?Q?Yr1mvrwnCfemxU/+Uh3J7vjh1ctHhoa89YwKspGFv399kpNknH+n8lKv6UHn?=
 =?us-ascii?Q?I0jLbhz4aI648sM2rs0+p5tDjZ9Jcdxi5Zs4e5Zj6MxNJL5qyr+h//j3VItQ?=
 =?us-ascii?Q?mNZ4julVfcmp1ONH28kboMgx/kSLt51EuVlzAV4m1QNeygRpZ7sNJG7JTiwW?=
 =?us-ascii?Q?WTKX+IdPm3J3YFxRoxXszKXfF8gL3PM9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xX+83yWBEOYtOlk7rsWe6BN9qbp8v47TJdGS6jkEumjpXaQX0X74b4b5lAu/?=
 =?us-ascii?Q?GW4p2hnj8YTh56U9/96ka19ABG3I5nxKgo58N7+R9a2P4RYTmbQ5YdA2HvDy?=
 =?us-ascii?Q?xZ4biiMttEsn10/klTaUVTYDLgvuBtAvruSKZDVhaXaB06JEBkENqJBUG193?=
 =?us-ascii?Q?xiTLVNjS8CTioa+mjzstxfK+dmRQhfWfS9r1wCQf0HsIVsJ5kx5lJbndxa16?=
 =?us-ascii?Q?BLTi8RZcHT0BZ/pjxcIoj0HCh5gA1qzxMjVUg/Zgc6CpFZWiRuWc4jPCQN/K?=
 =?us-ascii?Q?rmA+XO7nDgc6yRdWFmTV19B4rkMfsWoQd3X6gz5zb+yjXi/y/DsJsj9w4iKy?=
 =?us-ascii?Q?uaigbUvluXBchqp7kVHqUwwreSo6vBp432mDemwTmMg9mElitPB/xa8jVEJ2?=
 =?us-ascii?Q?/97SmmeHhikw2FGoUj8vIo1zUQwaXPb1+5Kw9DZoKwAgyuQLxIvumDPJJ62Q?=
 =?us-ascii?Q?2MLZnTeI0r8nwFd/gYqcD25dyL9TN36P589R6Sapw2I2ZDJfOdNoVXkBEcq8?=
 =?us-ascii?Q?zcHXzHWiToATa7/3i+KWcbo/O/5gD00BIGiC3prcRC1XaGD2LIr3nNgO3VfZ?=
 =?us-ascii?Q?mUwf2jj3zdfxxF+rsZCqBEbTTjR5SxebFYKBRRW/p27sTvuB2FqARDfLY0lC?=
 =?us-ascii?Q?o4pbrWSOjoFAkXX/B91UjHxJ5B5yu6L0PlbPjxhZ8OFjrQwbi4fF28Gna4Qv?=
 =?us-ascii?Q?HJ8zJX6pTbUFU34iLA62pK9dZrrTi12Y6bB1YImpN9HKikvN37ObeNexI8u+?=
 =?us-ascii?Q?USrBPDF8N8SDczaSAkZSsLc3/lghmujJQg2NCuvnSvgexNyyEqu4WBvn76QV?=
 =?us-ascii?Q?oGNNRiiOusvr1A+GIw2gRyEBcNRPrlfuboKlP6zOOMnChKMQibCEX8k/Cske?=
 =?us-ascii?Q?8vCnjr8RKXttOdndcW0q+pGZu7jQ/k93TbWPy3MaPnmxwz03sWSy1Je4THHh?=
 =?us-ascii?Q?dbo3LL4BtLOPl9RiMAnqFNPOJoheabPqPdL+qyjSa7GSU6ljD0D9a2SvI26c?=
 =?us-ascii?Q?W3kRHuMN16UKTUFjMzB30A0exKNNylZ64ktzF1JHJIL2c6iLEfG6sXsXG/y6?=
 =?us-ascii?Q?pQkoT1B1yiJf0o21V/BEgRiCc5pFRJMrgB7C9o06tkEdjlE81g8XZBcf68SA?=
 =?us-ascii?Q?X39DQ+1r2P0g4jkRI10nZeqxPDOrXTLrV8pwfdKxMTIOvzH5UDoDqgGedlTY?=
 =?us-ascii?Q?PrjqLZIievOsjp9j2myrwRHZdaE0yzy2ACunPhXF4Z1cQzMXyD2m14to/QF1?=
 =?us-ascii?Q?fvqDdLRj745IB3rdxXawJGfgxOS6mX5yjkvbrS96HuXQq/c3/qj+MeVEes55?=
 =?us-ascii?Q?h+YngmdW1mjHFw8xII5dYpFQG/4leMD2lLFGY67f/zegtqx0CtEkpZ1HNwFX?=
 =?us-ascii?Q?OzDdtI+zLXzyUxln0VVw3VSrN9QtL3r+SEtN3Q6TVrnSeD+HZ+upvXCFcQD0?=
 =?us-ascii?Q?O5HFf8HrsUR7acI+HI4wInT9hOeS36SbM4852DUtzv/DlfJtM1SyYqTzBnv7?=
 =?us-ascii?Q?rxzzzgqAIFhq8HUgwIBeKLpz79nrR7E3GaBaQp8Yiajecc373cz3rHM9wjud?=
 =?us-ascii?Q?m+zGHYYv0q48SCPQK4tYUL2KEhdfrPkM6hsJPMqo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6690469c-423d-4991-6dcc-08dd55b74e2f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 16:13:13.8376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uR52ZG9t3fThFdApEIRJF3PSy7Hyvpk9IMXnFKVi2fg9JZ1ayLBODkD4YEros/SJ3DgYuibYxJ1DJo1wggnqdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_081323_296775_6395639A 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, Feb 25, 2025 at 11:27:22AM +0100, Alexander Stein wrote:
> IRQ mapping is already present. Add the missing DMA interrupt. This is
> similar to commit 9d9c56025e429 ("arm64: dts: imx8-ss-hsio: Wire up DMA
> IRQ for PCIe")

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> index d52609e4fc455..e80f722dbe65f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
> @@ -69,8 +69,9 @@ pcieb: pcie@5f010000 {
>  		ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
>  			 <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
>  		#interrupt-cells = <1>;
> -		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names = "msi";
> +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "msi", "dma";
>  		#address-cells = <3>;
>  		#size-cells = <2>;
>  		clocks = <&pcieb_lpcg IMX_LPCG_CLK_6>,
> --
> 2.43.0
>

