Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EE8C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1mYmfhdowP4AzxI3WR83rk2fef6ZgjK2CQikh0pda4=; b=TK32J4QDGm1bJGmhw/nqhL8wr3
	UuXINAE0pBdZEpPlZCrNifoWCQQaBH4uWlxcl+Vjzx4NHdR2hWNX5DBu0BiBea7yFh/AxBQj9oCab
	iZEmn1EheG6Nxs/AH6/LgW3dECwzss90QeXqnV54X+trhDlisK3B7sB4AOzCfLsaDf/ojOksAhm9z
	evVOL+6nRPWdVpuQbi1d7C5B6e84uI/Agu0I8EJOREJ2Jq06CAedfxocL+Lzkvyy8Gg4Gudp7IRo7
	/udnPRlEEBXmz96+ANmUeG2QMkDcyXOtc/EDxnl4GfiF1H97jtHsyJTHYJL/fuYTzik/5W/cgCEqa
	nXiLuV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOev1-00000004b7U-2ZXj;
	Mon, 09 Jun 2025 16:00:15 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeMb-00000004Vy0-3yHs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:24:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhJfwFQtVnX5475/Us2deFh0i7rCsE8l67NzSyEYzDImsNI2YKJdqoh8QDuL8J3UZUeDgUe4ocMjri8No6+nKrxZkJYGm87T8Ns9DN7iNDyRwmQE7XcVLsnEWUywhzXD9NgyNJ7PzjX7RXYzPz5nb6nK0bkhuLoRlLduIeQZ4pDwKTZQNmgo32CLihZP9vjozXBZmElFjom3hrw/j5/oQhAUZt9dCG/Y9MHxI/zJJijw+0ENHPsxQhgRBPTZ006umdUvaKIdLmLJIPIJwSWtvqizF69Q9ip930EM2+Jem6MZtRGpJwBBVkd58r7e5h491ipg+ddjmIB85y+Y72gjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1mYmfhdowP4AzxI3WR83rk2fef6ZgjK2CQikh0pda4=;
 b=VyU2GlKgZRjPXivUyXbSM8tZhdcc2ihYruX5DadWpGvGkFdhg9KWUOl7yP6UJdUNmTqyKyaN5d5MtvpwyGyekXj4PeI6nh0oWI4HJikah1ekwzo5t10wTqQmhPJWVxAjm5CinY3Qo/wHReYegxYcb04nwb9myEeWUYvQf1MPFYQ78bQm6OvzpXbly37Dv76uywaz/CunysrUtBihOOX1SA/Jy4tXA2co9pCzH+UAwUBB+ICRX7bhoe1HyvQlH3JBqvyXhgzf5nLZ+cmdohDumRE6bXZ5ubLxAUnamO+CxUgBGwosKLpUqFNcM9nTmPPEs8v1Zoy1u/ZXMcrXRaycqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1mYmfhdowP4AzxI3WR83rk2fef6ZgjK2CQikh0pda4=;
 b=VdiKpDwSlieC/CIjoAbct3WURBbNiF9I4JhR9s04s5r9Rq2rilHx6YRJCrMzVzV1i46wCsWEvCTwyjApxxO2yPjr5AL0qKaRtZT29JVYHqduw9rvHNW8TiZ+gWhSlaX/6jSHXRhbeDMUaPiVwHb5Bgzsp61VebR37HlZ74zjjRjHY2fSNa118gymr3H4LwHbWT8TGj5POoFjzcThdbkQdPIxImR6kKXB3F8fNb5pIxWu2wotHYN9Ubcb7a6QQ0PiNwlYQE0l7Iv6c0VIqfrSkayAaCU1Lh6uzn1fIreXt1c5yfmuzmWFuCogbMGt4aAJygith2v+VlI/rOk5ZhZnnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9777.eurprd04.prod.outlook.com (2603:10a6:150:115::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 15:24:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 15:24:37 +0000
Date: Mon, 9 Jun 2025 11:24:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx95: Correct the DMA interrupter number
 of pcie0_ep
Message-ID: <aEb8rThg5lmqFVqR@lizhi-Precision-Tower-5810>
References: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2fa725-68e2-46d3-3e11-08dda769beec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NLMb0HjN/DQUWDyy9UzEf/mDACTza64c4UZDnfyj5JcPJonWQB/I2LWD/g6G?=
 =?us-ascii?Q?3/mYB/bHCGfSvCSVPqbmRkB256y/yHSLs3s4Y4Z+bJFcpmVadg6OPB+Dnk36?=
 =?us-ascii?Q?WfOgAyBxwIawgSOLU21+Z5Enz1nIutG1rCBwpI7Ebr3P6vHv9Y+rC/+0uLAg?=
 =?us-ascii?Q?jtLw3UyXEIVgCAzdXa5tSe4pBxuPMdWzGWgeY8yio3/6O0xMitxvQCsxUjEz?=
 =?us-ascii?Q?+kwv7013pofkCh+6uSYfoQPE/1Pm8ow+O8d3l2z7oeQ6efVLB6rQTHCJnaPy?=
 =?us-ascii?Q?heJeTIjKqj32bXnhNgQgZcUv1/ZvVsVkQc5xuB4a+XHVFYjsIKjJny0ATRrW?=
 =?us-ascii?Q?BZC+9azfVBGJjJlxvI8DAcPUTaWSI9fMeq9C2USV4Tx5wCOVBhiZKYkqhamV?=
 =?us-ascii?Q?zJNtDCLVspToraspLmEgechIKxQ5QiwapxqsdWwT+Vil8fHeCmSd2guHEnS+?=
 =?us-ascii?Q?nMZCZJ18wAprtTIlkPjsCHS52vQIK4zHCC+VeCPv8I2M63B0lcwqwi8u2+I+?=
 =?us-ascii?Q?lQLeGAK96+XFGcZbYJ8YjdaJcc1kNs4DkI1k2IqTborNmOGxhG+tiaRU0Pao?=
 =?us-ascii?Q?6XziNZnSVBj/Y+VJBZmh8lXWgnlA7m9/uLPxvj+jXRDyeZmBVfyY3NQDijtI?=
 =?us-ascii?Q?bFzyvvcog8XC60nTAWaN9hNDO0TVyPTzt9v+0+6i9HLA8ia4srUvlafNmvH5?=
 =?us-ascii?Q?nuBg277BnEHUn79OLKoVPigzpR+4aFDZcUO8V5ycYFmS5NMrAdR78SxnOiE9?=
 =?us-ascii?Q?hCHUC8FgxM+G6foB2iOQDc50ShNP4t/FqpS86LoQhFdnn7CW8p3C1E3umh7x?=
 =?us-ascii?Q?0PSJX+NuWkV3pAIMRStXNUGicYTudN/wvpOrQpRQRbJ13SwlPDzVVB9CEKXZ?=
 =?us-ascii?Q?HOgAnAwEdWlbo0uBWudL4slFrEDl6d+kVr9he/SZa69zSK1pzL61Z7H1C48R?=
 =?us-ascii?Q?MZuMRTE+4VPg+KT9QMADvP9xPvvQw6EamNmB7x5lavXZiP9mvTFJVS0vID5F?=
 =?us-ascii?Q?XBrKaNTHnbtCAudWSl8qvBXUMKP+dJiZXMCg9FUSmmBZR0pyibyin1/W8Dsz?=
 =?us-ascii?Q?SItPz5hJTqPgpUs6ZnLyUNdRjLn5jxSj3oF8HQw7JJc+SlZH54gZzkP4vAiA?=
 =?us-ascii?Q?+tAbMIie9wUSP1GbuxeYzknmi8PJ2sx+UiV11wZQ3ydYE7rU7+u+6XKwgaIz?=
 =?us-ascii?Q?g6wNYSsLh7HrGXsRpIej9V7a01uTLuIyA3b3Ww7uGo+ELWoQEYIG/Tv2BDHF?=
 =?us-ascii?Q?fZO/0cH7inTls/lN3/DN3VLS7I+1G9sh0Umh8q2GTz95wWt3JQGgerdxaO81?=
 =?us-ascii?Q?bAFSfM27S9p/dB4peDQpg2sZ1fEScnNp5qLZJCh7Z09Rn/T//g8oXMJ1rbGi?=
 =?us-ascii?Q?CQnxtLx6nTQ5IrYEBfNBMi2xUNcdLMd3j3LMayhkPQMbNoIL650BrYUPkJsp?=
 =?us-ascii?Q?7jKP+SRTrcJ6Sj8Jkmt3xxFxSVJBufjE+LFX6fcJ/tIWrUUtnnh5kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QHahkQAfvDvLEu32CMBvzao2BCw5I4mzxIbDZNbkk65wXITAwRph7VCPDdNo?=
 =?us-ascii?Q?aCO7hkz/wVlFe0Tsn/gVTYLY2TER3G8QoxniWbiN5Zm067nqFNcmeMhCum4v?=
 =?us-ascii?Q?ARfEJyFEI6SyvWibagcdEzpHCmpHoEAYw6PmGsuJUiIYbM81pNVHptl+31xd?=
 =?us-ascii?Q?pAi2YHSkEg2u/cjnVLLBuuyxVpx5xDejdwEmXRR5iaM8Zz5jAaN/tkrIvXqZ?=
 =?us-ascii?Q?9QkmkS7rGGf4noCfJ7zhe3rnKHTSiiklzghptt5+4FpiQQukstkGvWtrQUTp?=
 =?us-ascii?Q?GgjOjbhf/yQign13OpTzus9IoM+sUC6feOIo4oJMg35rxuy3ZzNQAwoYDEQr?=
 =?us-ascii?Q?PMF0UqxylPXcvxvmhN79ppFEeOgQDTOb4w0XvS4FYMMIu8NsRb6gbMxRXftH?=
 =?us-ascii?Q?Wz2/PENB/BskHcTqE9K/k2BIgcZawrufpB2TWcQ8IaZD0HVKRy8e3FrVsbsF?=
 =?us-ascii?Q?u1Lre7sEwvNYyv4sKdhEHzByoj26bdHJKu3LvDIljut+In9nMO+qKkxUemtY?=
 =?us-ascii?Q?8CvZfM9x9gaIJvxd90K0XcKpF/vCODnJW/z5Q4VsFf/bVDQG77PQYAFKcAQs?=
 =?us-ascii?Q?80k/DPJFizw2TmKNacOlgwey4cjaE9AHOV21DYke6CtALEMmKfRJQYsJ2HG0?=
 =?us-ascii?Q?ed0/ebeXjq8LJr1PE6WE8Uq+ZYYeCUnZf9/Vik8WIzD9XuJ22v1tOzuXCefv?=
 =?us-ascii?Q?2LJwjkQ6jfYElDfPlBn7HTyBGxVMye/c5JSZFusKtCFRXht9b30Sv4OLPUzb?=
 =?us-ascii?Q?WT6d74OXEkXwyjaUHdLZdq9KhsKffwj01L549fOV8eA+jX+9W+Z0DdRLZFbb?=
 =?us-ascii?Q?B17OkVRUx6I8QtaujLvCt4c4IMWMKiDCRRVwy0BDVwDwlfHN713ibr/80eoO?=
 =?us-ascii?Q?/e/3MTCLGewGPUFc6pPLb3V+Mic+1OFofiY08VSHhd0A90AkPIj44rU7A+nM?=
 =?us-ascii?Q?KDhYhUCbamVMLx14dlZz5z/2yGVNy9tQ95MjLEW71P3HUtJP54V/2VS5BQmJ?=
 =?us-ascii?Q?R7u6AEwxNbyHFtSCvOXr3AcWGzWWUbMiKwzWSB3Kee1YslgE5fOZkcdxJ7IY?=
 =?us-ascii?Q?y3Bw7n+1LJgwQwKtO8eyyAdhygD+5C01yMja8ug4lC0P3HAkKtwxe7IpXWnY?=
 =?us-ascii?Q?s1/I9mPVUa3Huv368dK5VIPDjIGB0EAwjyKFR5S5Qt8rQ4ge4x4YslEN4JNv?=
 =?us-ascii?Q?mngEaK90kO7UnokI2iRVbtLZETRl8OLGzit2so81yTLQRg/bVJvnSk4Ptu2W?=
 =?us-ascii?Q?Jz9U/sZ6gJtLBuhVZYoAB9zXDvhzP8wPkfoDk2Fcvr47xZrV/UFPlmcfwlRT?=
 =?us-ascii?Q?M5/pXg5ayJ5lZzBFHjEYZx70Fjc8m3pSWtcdWVKuWu4IHSQQVwmOfXwTaFk4?=
 =?us-ascii?Q?VcaoC96sEJJfIpFkq5/ZCYn9VsVsxoE5+K9IWakG7kIN5lFcXrv0SzEhDoeb?=
 =?us-ascii?Q?v3gWbXcn16gEMYDNqQ7SREO1JdPkOuF0A+FBG4sf/cgPRb5oUprLqSO+kBY/?=
 =?us-ascii?Q?A+7/MPKYyViubxh5ySPwXvfesdeSfrQNKSME4DdaYfKkbkYMr+nGHPZ7lejY?=
 =?us-ascii?Q?VSvsqlGx6LGjeB+ATYlRZGMoHVpXRhB1Mk0fDCrZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2fa725-68e2-46d3-3e11-08dda769beec
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 15:24:37.4628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRlH5/NIH8QwKkIK+4DTkzZSvsIrnyUapZ8z6n8ThFAN8sN1/gF21BowNpDCdwUoPjCtGHKc3dgnZIBavfInIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_082441_986690_C5140610 
X-CRM114-Status: GOOD (  15.70  )
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

On Mon, Jun 09, 2025 at 05:11:27PM +0800, Richard Zhu wrote:
> Correct the DMA interrupter number of pcie0_ep from 317 to 311.
>
> Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 59f057ba6fa7..7ad9adfb2653 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1678,7 +1678,7 @@ pcie0_ep: pcie-ep@4c300000 {
>  			      <0x9 0 1 0>;
>  			reg-names = "dbi","atu", "dbi2", "app", "dma", "addr_space";
>  			num-lanes = <1>;
> -			interrupts = <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "dma";
>  			clocks = <&scmi_clk IMX95_CLK_HSIO>,
>  				 <&scmi_clk IMX95_CLK_HSIOPLL>,
> --
> 2.37.1
>

