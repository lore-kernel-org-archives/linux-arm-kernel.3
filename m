Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ED3FD45EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuMlvDhJcfVbXLAuUyEvxwJePaJUIlz+oQD/CCzXYvw=; b=I+TVtHTCx4F9oMMIQdkPRiGAsx
	ZqE8M/N1m9U7ZLeb7hekdk4Hm2WdJu+e9JGpBSVYu0GvEPeppwcKA+jko6Lmv0WWoOvBkgNKnEh5q
	WTlcR0PGrTNJnmr+DD8eIjJA/qh+aAgNm4Rkg24ypMkbRmYppLP60D++pf300E0JMr5jPvNJTiXuJ
	yNAGUROJZ/7Yt4cGw0GPt1qjy5zm2/JFunFqirYIezhcoPPRTnls2mJbNe+6LiUzFtziqkdw4J5/E
	KB61QTyDBt4SujNv/epMUABzAAjNslj6KE52CfVQMQT+ueg1DQ6STQ5tTsc5IqTn4ixGPMJ6vi4cT
	s3iW3qSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLQc-00000004r1T-2ZHk;
	Wed, 25 Feb 2026 20:24:14 +0000
Received: from mail-norwayeastazon11013045.outbound.protection.outlook.com ([40.107.159.45] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLQa-00000004r0t-1kNL;
	Wed, 25 Feb 2026 20:24:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9S5SAlhl3++wy7IyHAsv3x87Ztvy4yzxZjqONA9vD/v4ASKmeVWtP+OGX03U2ZJFvtKGQ3pm9kGJ1RhzIlx2zJZbZWaRHLdPC7P6cBB7Kt0VGbz9n+/znsXAFmwi55r7Fx0XpH2MEchR+be3ZykKcAI32T3wEPzjSwHX7HBb2iP8mczkvYCxkh7f89sFHvgNJ1/cYN+XvRCa3CjTmJmmDtciiaWtjyUSdSttHn6d2he3VcJH5+Z0ihxgfomH/QqTSSO0ZlBwZR559Vx8WB5D8lXRjctPW4nESmC+YypKWJMhxMT7xBaFAQfZb0uc9KWnNq4uFV3xF1r6osXAvxyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuMlvDhJcfVbXLAuUyEvxwJePaJUIlz+oQD/CCzXYvw=;
 b=jFiHWKf1qtiHk3jdkltCS0tEtKvEdVLd0MbkxHUcWp1P3U0v4fO3/I5idZZv/Tvb89+afDhsnLCwN2KVk8cwF0e/SzPXcOuFkklqdmF/uDAGh6uVemPeCRhs0L3lw9ccdrWHSCaxYTkKnTvCyFhcpv32dUhOMJWVP6p013WaCJkrxPskN1HolGLmLH4IOc7n0Xr9ZwlGP0wjOPb6T7GanaZ8qWUgps/scOhmvB55kOEQMYU4tvMl6hR2g/S1fPW1JM19hLlN6AFw90J9j4iyGUjED+b/LhLCorp+M/wSAckZqg5jx+SN8NnaHZdOfYmclGcgCpB0d/ltYpOcYLxfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuMlvDhJcfVbXLAuUyEvxwJePaJUIlz+oQD/CCzXYvw=;
 b=O0CvgWZd/8fbEhUlVqgOF4NZHQ2uXCgUhMZH1TdQ63xTf4zk9Si9NaaIhtfMs8o3jmVk4EHa2L5y23V1Dz2ge96dfbBawFjFElmOX9U9lqb6Webkvx7myErNVvDkFJaE26oPGTpbq2IRIs0r32siZPTbL4jLVIVvmXmjztXSYfW4/MUlMugoeh1kzR5xFFfRR9Mk9vZit3kciAej6s7SLvMPpj/O+uGr2trbqhsvAUlZPUNFJq/8zXBZ9UZdMROT8jwlPxkbQoOojmpKykjfv8QnEnYkuuhG8eeFDyIOed/mWEgjL0PAZ6e6I24XExp2KqoNo8cpbgM+72W+GbzSlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 20:24:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 20:24:06 +0000
Date: Wed, 25 Feb 2026 15:23:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/9] PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl
 window
Message-ID: <aZ9aX2ZzEWb3YuUt@lizhi-Precision-Tower-5810>
References: <20260225170324.4033466-11-cassel@kernel.org>
 <20260225170324.4033466-14-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225170324.4033466-14-cassel@kernel.org>
X-ClientProxiedBy: PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db5b2dd-a172-4b90-5589-08de74abd2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: fceCNGuQLMS9oDZKVzUiZ++DTrXwzfu0xp2IzGFY/eWc5UjiPUoaX1Ibe7+XsCG/seW5EJX5fy26Oozw6XZlF7qszCzRu7Eg0SOXT0iDZ4rqWlz/KjkrmxwlqrS/epBXgU9LulnAj2a6SHaVLZMKmibcufpyMzqWQpTdEDmd0uSwPRZR2tiawBCFZVHQWFRgjL5nNihe/VICG3BODFMJtHHlp1/3P4owXd4OOsbD3SrFFooJIVBhIOM9ZrIhu016nytRo9/l/NQxvpRd8yg8aMSz9vv7l+ZfWMq4LKIoeH3Ud7a64ZyzElU7edN03p+f8PWx5Qrvwkhijhol4XBA4tJIUMaVneY7igyae8b5SrcjQd9LZDUz4/dmA/vqJtDCfL4i4PzrNCl+eWLGQL+RD/wG+uOMIIjwJLebh6TJUOAYLZWF8JH4vJ2S8qcmOGhhL7ZNR4jsITNLtvNDvPJbVdUPgiq4WHutDGeKNGqcyUu3eIPQK/LPwanXMyAOPDefeipT8hjmCS77EPvg5gDqRly0kAAN1vxb+FWGVVJowNvn45ZByFmuczJwmhpnhCSxnyADyf88RArP+A9A5uMWTdUkRF0QeUSwNSrb306D+q4UeLdVyllgylFoqYTm12Nrnr2bIlJrRkv4Z3jEILlQggEDHKwlyNjRBEo6GvCZXteGhYGOmMih6c1nd9y0IKc1DOb2Oruh50wdVy7yNJTKXN9ODZreoAXmCWPsU8xRLHQtajLo09YzIBQ717sYcwPJm2jksopch5qGBviPmH1vZ/1X3LolpSsmSz6NvklvmqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uvz6EiCQD8CGq57N5Mou07Ig9oTssBTnfpfyWQlbolNJhyhFm7U3kKs3s7AR?=
 =?us-ascii?Q?cI9Hb7uU2dUEzMxRysvnMDYdKCOb1Cprn2QvQOOENXw7U/wrfQzKC2m+FmxD?=
 =?us-ascii?Q?gZb5rKdtdugp7WSf53P5JGzGAqo1B+zxogpdLuaa7SV7mE5HJXIAz+UtoYAq?=
 =?us-ascii?Q?oeCNJhJQM2UoScNAuUDw4bWSET1o2SvL5LoATfFmrTIW4Rx+zp+G+xhPzhsi?=
 =?us-ascii?Q?z1WxSWfMwAl+m6iDOvijUao57A2HvW0nytj0o1Rphk3hXKqZcZvhwIeyMC67?=
 =?us-ascii?Q?2X2aLkfJSiOgL7R4gnXhkK0OXdhl672K+eXVbCOJN1bOB/F2niD6MzHImUcj?=
 =?us-ascii?Q?GlsuTTQIFJT1ctsRI8xtv1YoJxsXMxwNtltB6/CB2tRTMUle6PWUDX0s65Im?=
 =?us-ascii?Q?b2hmNP3yTs+mfAXtNv2j+EBLCQpXsieN9EjT8Im5Wx8QbMm39nhAQHCeLn11?=
 =?us-ascii?Q?cL/4/5NAUabWJHJKdzNsMnkBKay1vs9Q3eqS4oA5YhBDcXaldC6m2ZEDeUI7?=
 =?us-ascii?Q?hhbZuBmLoxlRWIOmgIDZH9i2Wh0Os859UQXVx0UB6WncUcb57gzggoEBHFw2?=
 =?us-ascii?Q?Tg5rj/Il/62S66sdRvutJ0A5NvKYZYbJwPh8q681UTkW1Flwk84ksuAD680B?=
 =?us-ascii?Q?hMvT8yN/XUDpOvNeREYjNnSG2SiTgZ2CjFolAlSy0b+LGJx0xAop1xRA9+ok?=
 =?us-ascii?Q?2yzBl7//9OSFPPAf21odB3xiXvj3wqd+mO6m/v5yRXFhvhP7bU7w/IFAoj58?=
 =?us-ascii?Q?bLrb36t5bJtRCB5hELFEF9tmIJTTsPe2z8RP/2oKkw5TBcUGGuhDI1OX6ACQ?=
 =?us-ascii?Q?65PLdK8cnYvQjYwl21+ek2i00SbD1Bwa29C2kVNi9EwGsu91pNGANPHHDufW?=
 =?us-ascii?Q?8gzEoTEB6tH8s3mZrlTSxMWe1eqmEImVRVr7w45dnN1nSt5+Uv2MDDFtikaD?=
 =?us-ascii?Q?eHjToXimj180w9c2E7RWFtOGGS4uxv9qJMLbXOm2gupTA3oXw3yQBOUc3Wmf?=
 =?us-ascii?Q?BL8GrTBquEeZws635fGeV1j8jNReJ0ZiIZA8o6Tp0Rd4Dm3bQVbyJybJMKgR?=
 =?us-ascii?Q?7WWHCXiXTH2TcmL62qyNzDcMvH+nYu2imc1b2FH1YtxIv6gVbHwq9/hB1Opy?=
 =?us-ascii?Q?sJbjy9UwebYKY5nGpHcm/iMBcsuUPoXyOm0GR6qfdT3blCI+PaqVqGqeaRU6?=
 =?us-ascii?Q?+0lP7HZ8U71ThB02gyL3l+c8hpzVdXrEIlHojMFy4zAt3Kz6J5zOlNadsVUO?=
 =?us-ascii?Q?3GXnKm3nsdQCrOk2Z4lyDwD74xMg06b4wqqHRGcUchrfPhcXNM68E0afZPC7?=
 =?us-ascii?Q?fEO7vZtHS57jZbwdbLAbUSaCrinShGDrg7o2YYAEnl/rOQzWoi4xA8zfcNks?=
 =?us-ascii?Q?l73mdCGWE/WQ7O1YZqTBJj647lUAwaW/KSotdmya1ny1nVEmVejoEG12bhBl?=
 =?us-ascii?Q?1oRZyLvq9AfBPjB8DH6bAsj/6rRotgnlsykFXHOTMxK4tS5ErutJugLGmt8X?=
 =?us-ascii?Q?WF4abrUBG1XtZSeteahvOzn4EWCveOrnEmvg8woBd22mE/or0uPl5l1Mkn97?=
 =?us-ascii?Q?bUnx8QejWetctpyvcYORM+kcJzWFLWagp8Hx5M9OaZepF92FYg5I+bAJ3KyR?=
 =?us-ascii?Q?xNFMYkGAVMQoHypPvtj4mXwXmmmSDNio1xYS2KrvxnxtPfDFYuPCT3MzrFIM?=
 =?us-ascii?Q?vaY3ccznYS8oLDlYwQanyWtqVZX8ns6d+C8L5b7R32KM8uNL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db5b2dd-a172-4b90-5589-08de74abd2e9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:24:06.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xf5Ykqm3Zq4wbGuHhCociGYb5ra+lP9uatRXExEMazo7MRZ4vUaebDA2r3YPoxDwvVy/XSdWSI19HZf2rOyk1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_122412_476430_62238EFB 
X-CRM114-Status: GOOD (  22.17  )
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

On Wed, Feb 25, 2026 at 06:03:26PM +0100, Niklas Cassel wrote:
> From: Koichiro Den <den@valinux.co.jp>
>
> On RK3588 PCIe3_4L in EP mode, the integrated DMA controller registers
> are permanently mapped to BAR4 and must not be repurposed by EPF
> drivers.
>
> When the remote peer needs to access these registers, it must use the
> fixed BAR4 window instead of creating another inbound mapping in a
> different BAR. Mixing the fixed window with an additional mapping can
> lead to incorrect behavior.
>
> Advertise the DMA controller MMIO window as a reserved BAR subregion so
> EPF drivers can reuse it safely.
>
> Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 5b17da63151d..ecc28093c589 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -403,6 +403,15 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
>  	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
>  };
>
> +static const struct pci_epc_bar_rsvd_region rk3588_bar4_rsvd[] = {
> +	{
> +		/* DMA_CAP (BAR4: DMA Port Logic Structure) */
> +		.type = PCI_EPC_BAR_RSVD_DMA_CTRL_MMIO,
> +		.offset = 0x0,
> +		.size = 0x2000,
> +	},
> +};
> +
>  /*
>   * BAR4 on rk3588 exposes the ATU Port Logic Structure to the host regardless of
>   * iATU settings for BAR4. This means that BAR4 cannot be used by an EPF driver,
> @@ -420,7 +429,11 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
>  	.bar[BAR_1] = { .type = BAR_RESIZABLE, },
>  	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
>  	.bar[BAR_3] = { .type = BAR_RESIZABLE, },
> -	.bar[BAR_4] = { .type = BAR_RESERVED, },
> +	.bar[BAR_4] = {
> +		.type = BAR_RESERVED,
> +		.nr_rsvd_regions = ARRAY_SIZE(rk3588_bar4_rsvd),
> +		.rsvd_regions = rk3588_bar4_rsvd,
> +	},
>  	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
>  };
>
> --
> 2.53.0
>

