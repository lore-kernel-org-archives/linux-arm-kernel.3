Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAD4FEFB5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMf7laHOqNWDPt4rr3SrdDEULQ82MKX1c2G0yAWVCmw=; b=Wbu0VN2pl68gDuOxYJ/5U8lotV
	j6tRmGH0j3CcJSD8Fa8zV6MJwFQjqSyGWGG1X8I6nhF7l5zclifPCkBGf/j0N58k9S+ZjBm3CUgdv
	90ldwfZOWBcr3xUHbZ4tgBfl4B3RJRr/nZCp69Jnb46IjElhSQslpGKfvVlbWhngw+5eUOpgKbE/A
	PPSQ2Y7c4mTihQH2mBpIc1/9p8pKRt8pZljWYDBJS+wbyL23ljxTzGKPKI/ZO3hh8JQSUCFoiTRa6
	kC0cGWIuKuPTmv++I3uBwgx3lvYYIv6fkJluFq0SqvqlRKYmBjc4eJRNkjEC/0JXEnx2u98cBYsge
	3/fkTkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzSx-00000008YRg-2Spb;
	Fri, 27 Feb 2026 15:09:19 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzSu-00000008YRK-1ZFM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtWKHqVEd1x2h7vtVdTh3I+h/1QPz7AlbYGBQkx4p+gPx8rtYpVnDoqsCb3cdO7VuTtlE3B5piXnKZLpZuOSYIK9u7WNUFhZXSa9wkp/9DcUQYkYXmZ1FxaOjhHF21PJFBTd0H9tzoV0SPORPaVzzttupP94ULTBE6NSryIJQfpFOiT1aaFbu8jW2Cf0m6e9E/ZddEPiZ8vZG+GarQ7cJHrZGCljSCrypmx0rBOcxb3IFUoK+TE8CSzGlXiGjtuoCZhA1y0uAyRl7SjHVyLthTg+Itj7DCU76n3tmm5A/t07S0+ipzfF02M48fljI9M7QnMk3F/gwaU16eWfEwt0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMf7laHOqNWDPt4rr3SrdDEULQ82MKX1c2G0yAWVCmw=;
 b=lHmNlcv5SwOWkO6Z4ED9Vp4AVOeujwuplsLWWQZesF66xxLl/FD0L+suX7i0WLFF/I/QgKPiU3s+xgBz9loHshTd0GwkL8xIDSFwpaBUA6/GEpZL1pVl5VrKWym2QYncVUKXkkl1SyDL9+0HGbyOD75teT8FYUCQNEGnL77vk3LrHyFOqYcE/B1yVZhUIxb4O6DbIGq8+bHX+qMAY8HJ9R/aK18QHG/jTfn3ahnng1A4NnQ2BMJhBOffpifn5QfvL/7VxBxlvTEbzihqlr8pewK92zsw39ACt2fI6KMFTJla4gvufMsXMWY5UZchrc9EvH/dmMaJdiCL9lYWMxSTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMf7laHOqNWDPt4rr3SrdDEULQ82MKX1c2G0yAWVCmw=;
 b=YU2gaWEvfVeh62JheeKHBzOGRPItuhNIGyMePRXhGjEbexK3BrGUOMvJK5bwJSdi0+ymDwUPPOdsa1Xo3KiOUsH6VbwZZCr5o8AW3Dubwzhxo9vRsEitPp59gnEFdCRD7MWH/n4X2QzRXz5Owja7FsxlW+FSVhcmay4txq7o5pPnKTxcBE3ZCYyH3fmE3zI1LfRex2Q+pINn1RgCK9SJ/iQBU7x89XZO8e2aBTpzcTV8rGt9jK3KI78D3ZtpLCFALFnsfeJQafOkrEAtrF8PDQDb3qtG7FOa9TdfBRXtJSsiGnXVzElztb7B3VNJX+NpTb0ec7ef2YWdOi8jsDvU8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS4PR04MB9715.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 15:09:12 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:09:12 +0000
Date: Fri, 27 Feb 2026 10:09:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maudspierings@gocontroll.com
Subject: Re: [RFC PATCH 2/2] arm64: dts: imx8mp-frdm: Use symbolic macros for
 IOMUXC_SW_PAD_CTL_PAD
Message-ID: <aaGzj11fjemaKLrQ@lizhi-Precision-Tower-5810>
References: <20260227130242.1702329-1-daniel.baluta@nxp.com>
 <20260227130242.1702329-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227130242.1702329-3-daniel.baluta@nxp.com>
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS4PR04MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 6262efc8-731c-4be8-e047-08de76122a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: mXSTnagKZPbwn/G/r8tgCzsZfqJSiM7XaZr7iZNMMxzZ4rE+X4UVGKX+WsKJxbs6bL5V8lne67X+UduROi/5xdIz/ILeW9r5yDvhEe85OsgwFr66YjpnxuvSgPTl5Zb9O29jHwDN9rtoYxXJxiJrMatIoSEiKuD5ZZGAukYJx4iEMBgykj4nv8ioBsXaRyVu/VhJiEKtRh6/HZjIR2pI7r1k4irvSaDYp4T8mx9ssbM2rvn5Q9C9JADDhoJbGtJ2FkfbWUl5vcAJjBJ1fBUACuzIRcLD1h2OyWfKeZC3X3e0SoXBlpDGmV+UEA3GgilPdOkFTdxRKl5IBr4idnbDwgxOqC6M3gsZWjnZt66sVpQZUpeT2oCRznQov7C6yXsrI9Z5lP/nC39TG45ewRlt8mdQxERnKRyA2u/PNcPz3HkybmtRBV2ggJpTfK9WSC+BukFjUPio+5pHAYYPZ+VF0eaFfOozjWaRi0htMftyeRps05TH26XwzwPhFznCaB9qW7STgdbdlDP/9I94RHANNfla5ycSL50r/zHcH+yEXyXsvk+MGR6Mx7HnVXhPR49tsDvGqWv4mr9LznS8wMEC76mrHw6D0qpRGwv7/Qg6iYfxPjL1+ONCy8lv/jDfY5HWikGHJg7d76cJfFinb3bOZKL85Z7VcMsBzTBSYiQfDLdaWYZKpX6scs7/FZnluuIVRlcjnOYcfh2VC2UncGN7Ru6pZgJ5DYcDL3iZCJaxx8jh3c0AuiI+m4MFE9pI77vTB98SKwHm21CR5R42w7ujl0Joi0gyyYE3X+v7E6YNT/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZD2oOinpenq3FGQm4U3VDfCWZFnl2Qh0OXcxuJPCTOLOEq9qn3mpy0Q4OhEZ?=
 =?us-ascii?Q?10M8O1ScufrP+GVlAsnmXOhufPXsaF3pgQxlV+9nIHI4D3OqlEbveaxOmI2G?=
 =?us-ascii?Q?3QAorzKb5G8WJH9LjspqnGAHzRAfB+z+WRaOnL+/LViUrfd7oPrJ7+ZQOCfi?=
 =?us-ascii?Q?MejryLrraX2xxTfOzMaJmq7Ge0tiPRH3z8nMdyXThaUEXLHmxSL2dIa5NE4y?=
 =?us-ascii?Q?R+If7UEcmZaaM6aF6c0zi0jNd4cy1Ih71IGx7tp2OFXVUUp0D0BFTql7z7I6?=
 =?us-ascii?Q?QGq9ptMdtwkH/LwmDBx+pXPcYsYrlbPXOx1PMf621AEVv2DEiFYCy5wsDIU2?=
 =?us-ascii?Q?Wv2HgG9ilyA+v9ufcIqtggVYZD56hrf0MUZO1q9EyRL4PJ58lvuo0fI/9TH7?=
 =?us-ascii?Q?2TaaU8MMRagSZKwCmM6CFz5h1n+4vSZV/Jb3Sn3BpX0qaOko20MaGPIxwbJI?=
 =?us-ascii?Q?zz1UDmpuiUDC0rN+tkagIPx6LekKPwg/V48/9gMBpXr97Lc5JbrUnWqvCoC1?=
 =?us-ascii?Q?SXgnVchI4nbIhGIuF9b1nc2kfy1ERTxvhSSAmsFrx3fo3AzTwzYJQ4lhCcbp?=
 =?us-ascii?Q?vo9AgMOXG7Ri0/Zyj+qwdWVBRHriLReYDSlvGCXmOa5+U3R/HXCvKCfgzX/C?=
 =?us-ascii?Q?34GV0MARuioAKKVWLjKauJ4ABpM194U7z9mvqsUAynVBrbCO1akVwCELU8k/?=
 =?us-ascii?Q?WegjeeV9/IP9AqI6NpYfAfZCLVSFaBOWeBErHO5vBJR+ERoHPozo9ees3wCD?=
 =?us-ascii?Q?f/TdLjsCsS2DuEZXSJvE5VJV5IDKy+C1YnpAbwH5dTfINt2674thgHs7IjoM?=
 =?us-ascii?Q?N5fG8imjvLwwGIfxIpXwMaOWSq79uRD/ZpdZc+IbXYL6CgiVfb7fKBmStAGg?=
 =?us-ascii?Q?IzPkbZWma2kIYbOVM1Qo7kFa4WdHXt6ROLbJhfTZ01pcIOEa3DbXQSAQfeNl?=
 =?us-ascii?Q?huQ6iOefQgmy8pGcu/Fqdyo3UZIrvTIh+u0gRxOOqwiufRnfgU4y5NYycf5y?=
 =?us-ascii?Q?Ptfvb7N/ZoBhPo4fqngbckHGZXS1Wx5nCj9KP5vykFYEH+Tq0S0RgWXKRr3D?=
 =?us-ascii?Q?cxDbvS+pt6q2IBtnxV8zTV6FbRHK82kUOKonoWF1KB7IBXFs5+2zwvOs5tyD?=
 =?us-ascii?Q?rG+co30qneMMeMsTV6Kwj8mZCh9gtUWVr6Z+C4b0Nuv0Q/gRyPb4bFVQafzm?=
 =?us-ascii?Q?F5y0WSjVJQiSf6Xs7YpxG+x31mM/E2J4F9NCstT3B5SrrmNqYEBaYCkX36KO?=
 =?us-ascii?Q?iOsH/tdgFtSlVlGmGfOIcUnTR4WQjvNiFj+0nSMArB72u3cEUPZb3nhewX0k?=
 =?us-ascii?Q?VSpn9JIp9GhYZIb+2H7fJVHjcX0cr1ZxSE+lg3gHeEX0vYfX7flormr8Kop+?=
 =?us-ascii?Q?5EggW65tVuO265qB+iwt9K62Rojs4WEPduIW4hdIA5b1IAslgQhBlTlExNfi?=
 =?us-ascii?Q?AnO44QLoIwIftx6dXe3Xzk/bbWA/6k7ALPmT00dukQDgyBtdOH02U4mve9/f?=
 =?us-ascii?Q?LSxcjrEC7ebZ5FMaZxLPlAqa1tT+gBH7I81rEsEzfx9rXw09EweAYBK/j0ra?=
 =?us-ascii?Q?l2HDfASn/+/PtFcmWgBOa/2O+0uLl7jYcSplVIBKYOKtktFP56pEsXthHrGX?=
 =?us-ascii?Q?z500cNz/LXwg7n23F4IOu1Nh9f7rK9KIX1T5tk86Zg0dg+OM6tRKzqX5iyce?=
 =?us-ascii?Q?3PMEfz2EwqdZkwIxbKLBpakjj2MNdwstLUzc/WgeVAxmaqcz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6262efc8-731c-4be8-e047-08de76122a34
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:09:12.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jE5pfo91OriTsmojx+FcRSCqIfLJrxfL7zrL2rsG5DloqPy0bbn3qBX8tFCbNbr/2BgaWgaD3H2iqmS5YVs0/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_070916_416688_9D245FF4 
X-CRM114-Status: GOOD (  18.87  )
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

On Fri, Feb 27, 2026 at 03:02:42PM +0200, Daniel Baluta wrote:
> Currently, in order to configure IOMUXC_SW_PAD_CTL_PAD a magic raw value
> is written in this register. This makes code not obvious to read and
> modify.
>
> So, to help with code readability instead of the magic values use
> symbolic macros.

Use symbolic macros instead of the magic values to improve code readability.

>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 132 +++++++++++-------
>  .../arm64/boot/dts/freescale/imx8mp-pinfunc.h |   2 +
>  2 files changed, 86 insertions(+), 48 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> index 55690f5e53d7e..206c8d939796e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> @@ -252,104 +252,140 @@ &usdhc3 {
...
>  		>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> index 26e7a9428c4c7..c963913e3c626 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -38,6 +38,8 @@
>  				  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
>  #define MX8MP_I2C_DEFAULT (MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
>  			   MX8MP_PULL_ENABLE | MX8MP_SION)
> +#define MX8MP_NAND_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
> +				 MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)

It is not NAND, should be
	MX8MP_USDHC_DATA_DEFAULT

Frank
>
>  /*
>   * The pin function ID is a tuple of
> --
> 2.45.2
>

