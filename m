Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98E8C282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9atSSRmENsknLKlNDsBOc2L2Bg1hnrtuYMZiaOGff4o=; b=r4hKv4eyhs1BqXKdwUn8rfjNiT
	8tAtIh9wlwbUMgG/sIH8mYJc8Yu/04sAJvvN2Pj/kb+xCLQQaH9qY8BDXqhlOYGQLCu2n5N92yZUW
	eaOUSNFBFjgNJ2MIBJVkoG1yWv/VynKAtqZ867qU2Nlas6yz0sNgxhpcxpWsC9PYB0M8hVmixF8Ic
	YMcXlc4bhRihwN6mgaZnQQtUUYa5HhFcAN0bRi0qrzgXKTucLKbWxF3gEXfecjv28ZGRLRRR/8R1w
	KUZfQJIWTh4gNnw95YjJeiCJtDtpTiIK3OyUl7x2pwrSnNl/BkdfgYUeD8STgxgzQUoTMCwj1xhnu
	eG2tHC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqtF-00000008XqP-3CTN;
	Wed, 05 Mar 2025 15:42:33 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqre-00000008Xc8-0t3U;
	Wed, 05 Mar 2025 15:40:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRAifUkzmuM3Xs7xpsCKgAcyPpb8iljOxaO2RuxHBWtRowFsrbYW4iGZztuMv9ioeYmbc5XiWqJ/rKarOztM5h9g+kh2nYGLVYJM9ZbnDmkz7L9dUARg5YVo4NUTQ5HiC5fQdf7gN0Q2m0RxQ2SirrK8Fcr9yPOx8T7XiGsS2Xgvy6FBMy6xF1GiWlNQMpmyz/J25O1+x1CYS+l69Mr8DjExr6uFMfYfz84aDLOMh8IfWuTJZTDhxZYwEi9xFzxy9NKZ9nOpaJBdlpFd/TvvAqEkdrdOG+VQxgmG9AcNzz0kchi3VfeuzJ4kcoJqB/juGbHBW8jHRY0lyI7GLOSAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9atSSRmENsknLKlNDsBOc2L2Bg1hnrtuYMZiaOGff4o=;
 b=l5yWvSUyD+f61lc8VdSfIl8wHODPjD6LR1Gy6dwJMMUDUHiNtW9H7/9MqrSCwAxf+kApmUE4tGvZl/FU3TcTkzekektIurjnSDGruiIo4LkffYJbEof+kW+HLwgl712B64tvDCXyh8fnN/ONzChRoK1LU7VLYtu37fctF/um24Z9iP4Il6jqDwSrUMym5Xt2Db/QIJLjmgh7WD7goohV8U26h5S+l2emPOxPaMn2O3GZwbBby9jjA9jka9bG8CN6OlIy0Cnxc7F3sf7q4EyRJoO+LWmOFtY+LawRKAUZ465VYfBWe+1qW0ltRLmz4TYF1UFg1PEl3Kl4e9mFGuofLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9atSSRmENsknLKlNDsBOc2L2Bg1hnrtuYMZiaOGff4o=;
 b=EwDZAsr+DRTztcQU2yR40RpReRStIiZKKB6dQDIS7eGCpQOIjcrLlg/WVruvGDGhqCydlcJvm038gAGTtyUpiNXAV6sPcAOjCnjHHQwLA1Kf/9T7KXj8pT8oNXz2GSLm+CYTVYly7M/xINgaZC8tlHKWAnkF2+cH+y7q7iO6QxZtUkXgY+EPrQbn5Xu4ZYYH9I6s5SINM+PDYBcsDDsdlHKs8iYDVTBoKZaXLWu092YdH7RMDQnXWovelbY7G1h1SNm0ZfGW54boYcSOEbkvmpL8T5Nai2yWPmrFmvLDiBumtb4tGWPaYHAzzM0shzo76fO/YT3FIHMVoYZ/McSwLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8162.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 15:40:49 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 15:40:49 +0000
Date: Wed, 5 Mar 2025 10:40:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: vkoul@kernel.org, kishon@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	p.zabel@pengutronix.de, tharvey@gateworks.com, hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/2] phy: freescale: imx8m-pcie: cleanup reset logic
Message-ID: <Z8hweDIy0AuxzBRR@lizhi-Precision-Tower-5810>
References: <20250305144355.20364-1-eichest@gmail.com>
 <20250305144355.20364-2-eichest@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305144355.20364-2-eichest@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c858de7-3496-4ee9-02eb-08dd5bfc1a70
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Z9hkwQBfYbZ35SKjhdOsgX5OvnOnafFVIh4I3H2FkhpCm14SWl3PXmj/5UH?=
 =?us-ascii?Q?UEgUUfu745T9CEp2eLFMzkHZON6HesOXNcx5WbxFrsMvlsWyGp2xVuvdI6DM?=
 =?us-ascii?Q?w6GFV++YvexaX+/fA/PktXn/jEQjKIYihaYiCATQodBl5r/9ygxhX5cblkZu?=
 =?us-ascii?Q?AfYKj5mYwFv693cAQiPhVtBmUJntyht/BMmRAtsZhTqh6MahQLUOlCLS0H3M?=
 =?us-ascii?Q?TdSKQO8vnoK3Voh6eEYWZKbLGqXk2MVmDjuEWFJ80jT6VXv6nF/lWJSjA56E?=
 =?us-ascii?Q?z+GYDwhVTU7Dqh/oGb+7oXMHawhzM+0r6QcqJ4ajEE+0oS3dc7dhZJU9yrL0?=
 =?us-ascii?Q?o14oYYdmtJQKik+mk0dieyUCJJQiiX8/aKrDDyQS8dm0P6Ow8X7SEzJzjklq?=
 =?us-ascii?Q?qvZ46uwVp8kTbG46PsdSkohCmobE/y5SeacSz9vKFJI4RkAc/C6K35+2jSXf?=
 =?us-ascii?Q?lWJlbAiQzzecyql+4K4bCXZTHyViM1+OaMYTDwGuQyQHN9Z2Q1tBsHmu3omq?=
 =?us-ascii?Q?mzO58QtZDHRIzVSSSUxR/pEMXEh1GX8SXO6GS2W7Fl+olA6/fpUwI4rzsjjf?=
 =?us-ascii?Q?wIrKSSVQ6OgmP59SpQggSl8Cp+0ATYVUe2H5QG/bLHBMcoCK0AWkOoU5GIxD?=
 =?us-ascii?Q?eALZ7lHaSH97jYSHe1gLcqDkxj5Ts7bpgIymSJl0UGyyTnjWEDS8mJMnT4qY?=
 =?us-ascii?Q?3OUYMt0r9DbjbsfonQKVFUx7N4GY7YemAlEE711uHngvLXly5VbJsUWKZU1H?=
 =?us-ascii?Q?mbs1Tl5Jwwf2M0xh9O5JHZDPuGe8NmmFi/fIY1wjJ/t9Oh9N9zmDmsgiazSC?=
 =?us-ascii?Q?hCUmrbNgqafOgFyGjS8DF7iByEZK91oH7jTlO0XRLC5dwrlzQTwjG1pAO++U?=
 =?us-ascii?Q?PFdVd6/9vtJraf6VczGhnzF/kTz9ha16MsydMpXNP8PRwOlBBuz0pV/l3orR?=
 =?us-ascii?Q?OOERHLZ6PpAG1rXQLv3BrTlfWA3sjmxzj1ZFHo3zsFDUyrCCS5SrhdjfONCs?=
 =?us-ascii?Q?P7yGhZKTBg5nlFBsJuxeapyp0rcI2dc8JR3d1SPobCZq0RJtrpWtXhKY2O0z?=
 =?us-ascii?Q?ikCRPk1w81shd1fsUIlEppdL8cGVJIzbWSQV7eoWM6dD/S9E5uf1rtJMBe6z?=
 =?us-ascii?Q?WW4+0v+9b2sEGWPkLLiALqcu9nvPeYKBTelZaSPIfQIONk0U+zKmPly1cuZr?=
 =?us-ascii?Q?okY2rxrjJHpSjaHfrNqWgIsqYDp654l2IFgctbBPjeSLgxlV4LOtDbCJAnu9?=
 =?us-ascii?Q?CA9D3uiiNtiK8V4JYzoOH6VQA4Yaldqm6H4zjNvDCvaRuSvCXKFlbElkj8qO?=
 =?us-ascii?Q?+7MLyKyYJZ81TMHs5WoxxshSEe58cQQpTc4w/aRPH13DqzJwbf31JpwnJXE/?=
 =?us-ascii?Q?udCnhZZykLLLuX58TS2+2JY3z81agSQdZ2EXLO1bzz46S/n2A0/QLP+yw6zT?=
 =?us-ascii?Q?JS3XwwkwD9S5P/ex4QY6/ayRBi4W5vgQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H6D+xPdSmV/w/J/Cp1+iA59g+q3OhXU5Pc8kdxT8CFE1fYEgAwwh6oVHsn9g?=
 =?us-ascii?Q?u4jK7Bz9KqjlAY6/xJm/zYK144k2WeAqPp2iDeTd757iC4azF4y2b+oRkwp7?=
 =?us-ascii?Q?fqAGqyEo8XsIqma5ROv59QXQxNoKAT0UUYIBk6D/pyggtDz3/DON8YiGeR+S?=
 =?us-ascii?Q?e2zSDnWSY26vNTA6v5dwDZnbtRsJtsdYfdx6vrZUQ56fB3UH9u7G414jZnX5?=
 =?us-ascii?Q?PqdexAiyzl0PXN3T8pVLX+VBRzKwGQzkV076y+d8x7cGkudFeXRhMRBkrc2/?=
 =?us-ascii?Q?vLs+QTFDPk0m2iwFoYuZFkOASPERUkxA2f23p0zUEoadZ0CxWv0FI+yvOVBb?=
 =?us-ascii?Q?cVADGkQw01ao+aPd/QTgHVwsTYxBV7ut/H4ZJdgqtyMbVps7MFzD1C5nOn7P?=
 =?us-ascii?Q?EL9Ep2Zt1MEzKv06ysaJQ3VCIIhe3MXCpDyZw4EcItg2J3kYMlMzZwL7Lbxj?=
 =?us-ascii?Q?YFw8KILqtcG6Hp7s0wKFlwnuhk2nYlTzu5VUeGmJcraD2+RhaKp8mCV3dC78?=
 =?us-ascii?Q?HbBEvn7D0ok5fauu5EIJkv9xjqctfLo8Hf+vTMat2OnObIXW0dQt6lTJd09p?=
 =?us-ascii?Q?Mzg50m/CzjTAF4fE4UIrR7sP7Z1S2AR1cMTyi6dXoH17nZu4rimU+YPbyU2d?=
 =?us-ascii?Q?9I/hmgetYp86BWP4XukAouWUy2ELwzyCOEyygxaix+WZQsqWIyozy0WWGy28?=
 =?us-ascii?Q?ysSi2lTi8RDfQVEgrev8RfsxbOK7Cte6kZXU754o2Wzr5hrLfwuuT1z/pGpN?=
 =?us-ascii?Q?+4NnIsF1LLo+aFRBb0OzCf33ZEkc4XTGMaE1AzhSyI6kW/bSQr0gTOiS/I+y?=
 =?us-ascii?Q?h32JZ6iwZAkRe3mgaHOSoqIF1riLoNHAqKXAfDiZHz+5iKcVETy7p1BSaZvQ?=
 =?us-ascii?Q?9dIg/1jOKku3fasRJ89jrbctMHTVqIrO5yRWe9xmdOOHeyDI4b0RvL958gP4?=
 =?us-ascii?Q?HvOWQ9OpQcz//7dBKGZF7GUHR2+YGmNZt8FaFqwbiti4FuKnBjkrVC1AzSCf?=
 =?us-ascii?Q?XW9MyNiqBpFxxHHHycxzU55ntQ8piYXYRDKS0XG7cj2i4FPKUX96YcxkJo40?=
 =?us-ascii?Q?2KFEpVaVXGWJnn46Zvn1PtzpPshEk/a2ktz28g30KGTF13PGtBq8Hmap/aMv?=
 =?us-ascii?Q?yu3Isx26EuDLyqf23M6aYFf3RyO/4E7mTK8iYSdNtkXgjg2J8Q60UaNzt/zW?=
 =?us-ascii?Q?mtPjZpfEjIZE4sgQLgm7Oiyny56Ml5eI/7lVtCfi8HLJErQw3KCh7jBKALBt?=
 =?us-ascii?Q?uS1BMvUrBrbMXOAxl2WeB3HlWPJwZ/qDkkbB2D+7q6dt7JahDIErKbevfAyN?=
 =?us-ascii?Q?E/tY65CxYfQjfepyr5aw8jn9DJ05ey0H7LoX5BIb5WByNLRdwIPqEDZ9g9un?=
 =?us-ascii?Q?xsfdKl7z9MWkXfaTbak9pb5cEOlsRLqTLqj/f+33Ap8JsP4wNcOS1gTOvusK?=
 =?us-ascii?Q?QX4NXI7OTkm00eALNqdhvm5zlZXbPwGLLDbhnIVjAVUlBuVxgek6hUhNexCD?=
 =?us-ascii?Q?/5d9DWNTNHpOLn9rKjsGxfvWMr/LiZVYLKxR2xDGOIKfmwSgqqIQ7jsxM7Ls?=
 =?us-ascii?Q?JNI2tUWW3EU3x2AYKb9RvyS5COHtwEuCODHseEKc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c858de7-3496-4ee9-02eb-08dd5bfc1a70
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 15:40:49.2917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sWqJZZC1mJHBVgubHanxboOQ0rN2E23xYLw/CTQ7y3rXtPL3H6MPH8xCZgT2xvvztQL5ReybVg5chz+4iJ1/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_074054_255906_7B38C532 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Mar 05, 2025 at 03:43:15PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> Remove the switch statement and base perst release on whether it is
> found in the device tree. The probe function fails without the reset
> property, making it mandatory. Therefore, always release reset
> independent of the variant.

Thanks for clean up this.

"Remove the switch statement for releasing 'perst' and 'reset' since they
are already correctly set at probe and are no-ops for
reset_control_deassert(NULL). Call these unconditionally."

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> This does not change the behavior of the driver but reduces driver
> complexity and allows for easier future modifications.
>
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> index e98361dcdeadf..5b505e34ca364 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
> @@ -141,15 +141,9 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
>  			   IMX8MM_GPR_PCIE_REF_CLK_PLL);
>  	usleep_range(100, 200);
>
> -	switch (imx8_phy->drvdata->variant) {
> -	case IMX8MP:
> -		reset_control_deassert(imx8_phy->perst);
> -		fallthrough;
> -	case IMX8MM:
> -		reset_control_deassert(imx8_phy->reset);
> -		usleep_range(200, 500);
> -		break;
> -	}
> +	reset_control_deassert(imx8_phy->perst);
> +	reset_control_deassert(imx8_phy->reset);
> +	usleep_range(200, 500);
>
>  	/* Do the PHY common block reset */
>  	regmap_update_bits(imx8_phy->iomuxc_gpr, IOMUXC_GPR14,
> --
> 2.45.2
>

