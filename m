Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0CECAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MROG4BfHs4Nm1QjjiLl0LENkTIHgUxDWEElQncJjFVA=; b=HuXRAOvMG+x9uZhKZd6AlrnHLg
	QEaZyJntnTHop1QRmu6Tu1WB+q4WJbbB0NVnLptFH5GwOKq9t6GsFdnsF2/8gC799j9d0+CtgSBjp
	6L52jJ8P56MLin2At6rCoI8ZIFIQdXZyQUfJQlOWqXQDWKaqyAOjVl2fyjnupn3URoW8tIFGJAtuQ
	gO007DiWotpIcwR7ao5Z7uqWkAfML5xweBISchQjhUNrzM8kf5jjCkazXxzw46i/gGGYxbPyC2zjd
	GAGSPtiV9Kj++VbAZP67WphofMRbb8wDf8wrnx4XnfeITRLqUGLIsTvfKjOIfsyLnkAm/Wi4/QMzc
	1qKO6smQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qg0-00000000mAH-0ERi;
	Wed, 24 Sep 2025 14:41:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qfx-00000000m6r-2gZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:40:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVFsQEXQYYAAvRMT7ceajtGh620cYFIryyScz2EmnXaa7ksH2PmVUe/47I1yLmVkoePpZ0L0TrLgrq/wjmbe3V3y/322CgcFLtkQ6aVTrJqDech9enSZ3Y5NRinrnCCDQSDXqH4xGUMnlABR+CqnaJGCG2JMDKprNWtv4dExTnd/f/eaMqitgnW/uVbQ39O8TMdOjtNpwh6wTa8lZcOQU951iYY0c4v+uDtlhM8WfiGCZXxu8MhOBW62kk2/NdK+Fyc6qysP7TPPe/Pw6srTfvFJX8heXO6TH3UleK/oO19sJrtRGKDJfYeXsOTe1BTzcz2EQRdKbyaVV0Lw4jIclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MROG4BfHs4Nm1QjjiLl0LENkTIHgUxDWEElQncJjFVA=;
 b=beXUlghJGnXJY6vPqiUHyK9FsptFDjWahiHaQNxHLQvR16U4G5hHX0IFdaEIEKV/pe5/ab05aNqGvX+c0c3tGwmiMQ9drCKh85gC//XD9qRUeGwM5QnWGgQ3f1RwPL/F+PW3+SUkVAxjhVAalpiWERypAdTHn9HEYVCMAXXI/GZ1NMmQ0w3TSWETeRigwY0+rnnIBq45GqkOBM2bCq3AztVYgWWAFwGujPnjMhLDSGb1Cxz962qgVr+EumZl6G4FSAcYJpLaMjaqJIVFgdLJ0YELM/n+/lLeJjNsRu2RED4n62URus9ReE/h4k1CZIMqT18DBUeIww/rHlATX9TzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MROG4BfHs4Nm1QjjiLl0LENkTIHgUxDWEElQncJjFVA=;
 b=GEgwr/9ByenFfABksQy+W5VsOr80qY2pPz+geokbWpYM1xKpOAkaOiTUQ/jOmudNfRys3DX6mlAerXBwoxVsff8nYEc24Fc6v4GXIEI3QGS9ieSg6q/y4ut9Xpxla6EqRnewoIIPxPsVn6DeBeit7nB1o0QoCA7GXLl8gQ1kCjZDndjuKt6/MOnzawJ1nJn4+w++vV1qx3cCuhGp+7A2znOcPFNd2pO83Uav9LQSO9YIKVymBADe7tPtfN2ZrxxGp0ESkZUm4eH9OWVFO+jqZGD0HVf7MbMOIUrCHhxJbxzwUXUsDuppku08q3YMhmpTw4tmfeKYBy7lgHU30BLFWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 14:40:53 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 14:40:53 +0000
Date: Wed, 24 Sep 2025 10:40:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Yannic Moog <y.moog@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp pollux: add displays for
 expansion board
Message-ID: <aNQC7nVj4m1TyF/9@lizhi-Precision-Tower-5810>
References: <20250924-imx8mp-pollux-display-overlays-v2-0-600f06b518b9@phytec.de>
 <20250924-imx8mp-pollux-display-overlays-v2-3-600f06b518b9@phytec.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-imx8mp-pollux-display-overlays-v2-3-600f06b518b9@phytec.de>
X-ClientProxiedBy: PH0PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:510:5::25) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c2ece5-a65a-44fc-ada5-08ddfb785d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|366016|376014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?33ZqMx5vffK74GOFIEUGhPbbLu/rMO85veVBbhqY4bd2jgc/Zk3ivKZTnsGT?=
 =?us-ascii?Q?5z6W8O+mBZRdPC1dVdn1pbsZ0RKeHTbTGtaAIMGz+O92TRabATHeEdkNX+B4?=
 =?us-ascii?Q?lJCsonmEEV9XXVtjMPfd+xiOSBKhWs0LbWcdcVDtdeGObk5YcYiYFyD1bpXr?=
 =?us-ascii?Q?8GtjsY1lF/q98DKkiDdlGcUjyjl3JwCK7u72NwTTPgHyE95MQJlrfTh303Gw?=
 =?us-ascii?Q?YQl+JcTRbzYFRDl36vvUTL9l0a4aGDeO8DusnpFvHyUSAi194th2ShrSxnzM?=
 =?us-ascii?Q?8L7/avbz4Y000luesfZ5hCGRo5ImNG5kP8yyNgNunDy6ezU8G/2AkZJizOC0?=
 =?us-ascii?Q?ZSpIahvVwd01bMcpeoVWyTa5CWnp6SH8N9o2qmoNdmi/JYQ8cldguX3HJtSq?=
 =?us-ascii?Q?XV92WQAGgStkXSlsXZ3jYoa2xAWsiwCvxntfHPikHuEiFi9S7FlWooe9oxrx?=
 =?us-ascii?Q?iCfTkWeEsP5nK8GzyzBcwgA2Aaz7qsybJIphBE6zfQDHZ2MEb4uWlncXeVTo?=
 =?us-ascii?Q?/aNlxR/fDIJGrAroYsiWTJBkw3ep+jvOCj8Ueuf18QsF+NQ6C8yXaH/JZdX0?=
 =?us-ascii?Q?NgeVAbQNBiCkRKvE+x8KJjr7aQlKw2nkyWCN9nm2I5PZsv5LwnuGdNKx4aEr?=
 =?us-ascii?Q?ARiSuUJ4A/stS6CXrqREL5vTKb8WfCULUt+N0rnfmajyqF/iHhZP2iA3D/gR?=
 =?us-ascii?Q?mA93D7I9bn/NFdFWNCCy5dAOtAAS7DN19CHnyj7dK74xmEsI4UTgObdrDCOB?=
 =?us-ascii?Q?Eugt99jO9dm8GMhfkPel/tgXoEAGfMlHbRGIN2XyFH4b1Tk4mHsRhfa+yUkg?=
 =?us-ascii?Q?rXATr26BYJG9q262xk5xMh3fX1ZMFVkOIpPZhwyWnsN9FUIWwCOLqja5nHFr?=
 =?us-ascii?Q?/5YOUtbDfzFMXmdsIWPuTGymfWWHgXq6HWAGeMhnNZ/DgsJlURpaUdQRxgNQ?=
 =?us-ascii?Q?QYiRV52QE9EOSfzCUmeL2OBr0WQ/hMXxG05KBUvOJSBMb+sMo7Lz/Xk0czOv?=
 =?us-ascii?Q?ilr0F/jQD1xiOgM9f9IINLCf7E8p8wQznB1v66TsbFFsopAwQWR3KdewZC2M?=
 =?us-ascii?Q?VTgKCXT447vjpH8TGVFRk9UfM0fGFK/WvTjx8xxX7G0Kwq91Zt+KH5V5Tf76?=
 =?us-ascii?Q?5jnFNEvc6nhtdSbaL2FVN+ctLCrYgkjdwrk6FY+ODbM+DrGkMyh0Itvvzylr?=
 =?us-ascii?Q?QR3BgKRObs1sv9IShsJuKScv+06StKFee5Azz+42KM3VRZKgxT+lA3be5BwY?=
 =?us-ascii?Q?6tJ+0CigJD6q7QAhDG3z+aLRsrexag8uk0voxrAB0R56OJgoPHjSoyCPZN/+?=
 =?us-ascii?Q?6Vd2Zry4DtTo713X1+ZFzfv5wcKsS1+uzdz1lIMvID7T74DNnciztwAfqGyn?=
 =?us-ascii?Q?LO31vbPAiuNbvR/fnB3GY0Q4XAeMidH1pCrdUagDcB3DsY4yAOfSfW6fmQg+?=
 =?us-ascii?Q?2mjB+gwnRT5asl99dxXBuBsEvSDr7arWeXKRmss12/Fx+2zpnm/21g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RdxskRmMNgHTGvxlWdHP9q4+BYTgghW+r6ukf04Zhqd7uhYGRUokuPPSZuK4?=
 =?us-ascii?Q?aB8v+3oixSeLWR3p6uCc6BRsEtjghZulzUyltfGaH8wryXugOhHwpv2YAGzz?=
 =?us-ascii?Q?BKOgdfbdJiW/5goeeYnezN7iaRgHPyzJOAI/WycmwHODjskkDuSyjJclA/rs?=
 =?us-ascii?Q?BRsWwf9hzKeXnbkZcqhoG5EB2wPRdkZcEQ1aSszxJix+Ki51qsWKf/5cRgL9?=
 =?us-ascii?Q?uut3Gd3uH7/2C8f7/gDpwvmVB2WYAlliJrxSSQM968Z6BoAPrw/8uZDfxPP/?=
 =?us-ascii?Q?P5SBM07i3KZpZwiN3SbD6fErH1Wj7+7tPUMQaZvm7bunVIdsit0F0OFsEe4X?=
 =?us-ascii?Q?/MZXmry076QURoshSabAu6k91qMXcN+fAiHNk+9sQtcXi9cJRmM5PYBouyfJ?=
 =?us-ascii?Q?vt59OQZJ+LLchMWJyr6m0sBeAyQ1a/wPVsmeZH2LJGOFf/HCanqh56B9sl9z?=
 =?us-ascii?Q?GtLawwES6hLdJ+Qp5rr9LSblu/7QQa8u5LR/w4v7hv4nbYefceHzGHlylXu0?=
 =?us-ascii?Q?tlYkDfT60c5stoC1djxBC7tW2ztwq1MnOymoOOND6l9oUgqGToUyj+4YE5DK?=
 =?us-ascii?Q?eGkq/gy9j6w/Rw6o9ElWZSjkpgmiTmlLZ9EP2L8hcJj1Vfujpxgiqtn+KNak?=
 =?us-ascii?Q?/Q6quyQ+4qE5z2d71wxgtmp44oV8KrOnqDbQSNCf4G2xvbCH62AGcu/VeFqW?=
 =?us-ascii?Q?/T0s7rNQfXuSe+a1XIL++dLm5RKIkJfAZDMOPaiJGHgy3rBMkbThLW5Hstqc?=
 =?us-ascii?Q?WjyOF3+ar6prj0O+eC/apxBrJForXHddw/PBOF6wUDxzJtVnEzNJnjQaAjMJ?=
 =?us-ascii?Q?S+9xHv905CeUOH4yAisMMP5GfbC16eb8COkzzvpDQ0Iuh4sfWC7X7wY2t38T?=
 =?us-ascii?Q?0hSiksrHh3YkZatv9C2iAUu2eNSPzJmHy/ePmpHi+ZH2A0zI6k6JHf2jnPWe?=
 =?us-ascii?Q?qx5xEpox2A4/3hpG4f6xr288nzruP4NIPX7/u759ETH89pxv1k5gs3WCQ7lJ?=
 =?us-ascii?Q?g9XUrJVMEYHDCqNYQL93P1oGqyDG1g5Lfa6pmm9RIT301C5XSbLBwzD3a8bh?=
 =?us-ascii?Q?6UCfAWweItmwNuqKF2upvM4VNq3GNJrIvxgs2tJez4D+IxFFJr+rnJF5Xk83?=
 =?us-ascii?Q?vf9NswcdtigpDySsR5b6mx4pZzdvBI0Q0VdnrY3Kw2c2EJHiZoDXPWY5VjPB?=
 =?us-ascii?Q?+NXoHWUrDyvfPzeKAB5vsJxx5xK1Y5y18rUBqvGLAbsNmWyLgxCt4jTkvi/+?=
 =?us-ascii?Q?Tozzg4fyC3QOAUaFwFdGNddYx4HJscjMHuvKVrl8R4074XKsFKbCTJUK4q3r?=
 =?us-ascii?Q?cJ4BCXHNBVpba3JJx99vW1+uesgV9+8HufN2dcHQK9resOXYxZPl4crKCP3V?=
 =?us-ascii?Q?s531Mu2I6lRrk5xD8zSvWGkcD3Rg5eYU5peqE6t/lSxEEACl9iy/fvOtVgwf?=
 =?us-ascii?Q?yvcAETtHePV52NYtRMkyfVrpSHoQq9mKiVc+KrGShCrl/O6AAqAXPC8bJcTW?=
 =?us-ascii?Q?tCsXPPu+YlJ91is1OMaUBtWxudLvtmAHram+A7kSY1kKPyq2l6kdR4wHH5az?=
 =?us-ascii?Q?UwmEAcZWSUgz5dqgDO3gVIrGjTSLX4PEU2jwSeAm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c2ece5-a65a-44fc-ada5-08ddfb785d21
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 14:40:53.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7trKKCymTruAQXg0Wnz/r8G0+q911XwOEUyUDfEIejfi++CIcBwF1yzVsoxOdCdYPef9irbUXMl6yeOFZTIeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_074057_834243_5AAC28DB 
X-CRM114-Status: GOOD (  22.68  )
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

On Wed, Sep 24, 2025 at 01:59:06PM +0200, Yannic Moog wrote:
> The same displays that can be connected directly to the
> imx8mp-phyboard-pollux can also be connected to the expansion board
> PEB-AV-10. For displays connected to the expansion board, a second LVDS
> channel of the i.MX 8M Plus SoC is used and only a single display
> connected to the SoC LVDS display bridge at a given time is supported.
>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  6 +++
>  ...mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso | 45 ++++++++++++++++++++++
>  ...8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso | 45 ++++++++++++++++++++++

I think you squash this to previous patch, or move previous patch dtso into
this patch to show dtsi's usage.

Frank

>  3 files changed, 96 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 9c121041128972d2239e2cc74df98b0bf7de1ac2..e4b097446440f41785dd1a0e5d354796e800ee76 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -222,11 +222,17 @@ imx8mp-phyboard-pollux-etml1010g3dra-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
>  	imx8mp-phyboard-pollux-etml1010g3dra.dtbo
>  imx8mp-phyboard-pollux-peb-av-10-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
>  	imx8mp-phyboard-pollux-peb-av-10.dtbo
> +imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
> +	imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtbo
> +imx8mp-phyboard-pollux-peb-av-10-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
> +	imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtbo
>  imx8mp-phyboard-pollux-ph128800t006-dtbs += imx8mp-phyboard-pollux-rdk.dtb \
>  	imx8mp-phyboard-pollux-ph128800t006.dtbo
>  imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-etml1010g3dra.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-ph128800t006.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk-no-eth.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..d71945430c801a0136a95d691af0cec64622a066
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +#include "imx8mp-phyboard-pollux-peb-av-10.dtsi"
> +
> +&backlight_lvds0 {
> +	brightness-levels = <0 8 16 32 64 128 255>;
> +	default-brightness-level = <8>;
> +	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
> +	num-interpolated-steps = <2>;
> +	pwms = <&pwm4 0 50000 0>;
> +	status = "okay";
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
> +	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> +	/*
> +	 * The LVDS panel uses 72.4 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
> +	 * 72.4 * 7 = 506.8 MHz so the LDB serializer and LCDIFv3 scanout
> +	 * engine can reach accurate pixel clock of exactly 72.4 MHz.
> +	 */
> +	assigned-clock-rates = <0>, <506800000>;
> +	status = "okay";
> +};
> +
> +&panel_lvds0 {
> +	compatible = "edt,etml1010g3dra";
> +	status = "okay";
> +};
> +
> +&pwm4 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..8ec4bbbbabb5cc7f5ae05d641fb5d14931250daf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +#include "imx8mp-phyboard-pollux-peb-av-10.dtsi"
> +
> +&backlight_lvds0 {
> +	brightness-levels = <0 8 16 32 64 128 255>;
> +	default-brightness-level = <8>;
> +	enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
> +	num-interpolated-steps = <2>;
> +	pwms = <&pwm4 0 66667 0>;
> +	status = "okay";
> +};
> +
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
> +	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> +	/*
> +	 * The LVDS panel uses 66.5 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
> +	 * 66.5 * 7 = 465.5 MHz so the LDB serializer and LCDIFv3 scanout
> +	 * engine can reach accurate pixel clock of exactly 66.5 MHz.
> +	 */
> +	assigned-clock-rates = <0>, <465500000>;
> +	status = "okay";
> +};
> +
> +&panel_lvds0 {
> +	compatible = "powertip,ph128800t006-zhc01";
> +	status = "okay";
> +};
> +
> +&pwm4 {
> +	status = "okay";
> +};
>
> --
> 2.51.0
>

