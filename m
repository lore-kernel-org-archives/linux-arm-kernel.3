Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02429D10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl022SYwzKklrKmeogdLb7HU3I/WyyxLD02uWRb+/bU=; b=DsGxEMz0ELnkmjkV+3Ex6vxDNt
	OrfPs+/JL9vP/vXDvlA0MVLv9eNKq44jMxiWoBGR97f5ZtrL+2ggeWC/KNIOA/sKkDkAhJHMGGsY8
	rCHS5aNrVlNOBG0nwzgNAViWb36ESWCzEOrYxNoljT+yynKA2m6rxlg9VvZbLj4E9kX2YV9KPQHSX
	kN4b0E1gtdTXx8i3mDClX8fLTaJEMfh7sLJEt4+BeXTYYqz8iI+QJepMz3FKG/rDBIyGYFAk0hvNr
	aos3sRTIJpsfzIPWOCVNdQxezgLDjGNhi5keUsyORAs/AV+ehgc0bFuEcqYt0GhH37eKamp/dK2cz
	IH6XZL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIHp-0000000FIKW-0LK8;
	Wed, 26 Nov 2025 16:22:33 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIHm-0000000FIJb-3Qp5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:22:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3325X+0u79KGGYPBHRBPGF35kvWV5guluntgsNC9Cpd7+IHzRTgC5hSKJMlbO3GnaalxjFhutbJs1LmFmsiM4JNJXqeIPz0XsXvPWfaIgt2mh9QTsGtLnnc0N8ZMcssADs042zz+3M6BCqQw+KvQ1Xy16hxC4kTaAiSkfXmydo2OFiK2pQZxCesUe4/f8ixqj0jI2atUn98WWIT3oVxXy+9TQcPvKSZO8xK2B5Qa6WH5rY5lNbowloCR5MShN4y+WHLi0cbhQkLLEhnAdooZzUHDGtLJ4wTI0RxHxyEMhVldpbcrAVVSTFmsxJjBpphIQNRDO3k7CakjxuvTm094A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl022SYwzKklrKmeogdLb7HU3I/WyyxLD02uWRb+/bU=;
 b=o73SMzGPlcehS7ZESe1Fx6H5HByRl4gPt8uRRKn8c7wQhQDK85O56lUMvWL+OMZa0WQnhpw0/idnYNlBJPVs4Zb8zzBbMpFCiR9326wzxqBEqMJlkSr+7BiqFV12khNcWWHJELChOVEBuSYuYf8MXmDEhkBrc4iZ/Tr2D7uyobxCnakYa9a8U2z/TQbyMuG2RBQ1H8b0X/kuSwhYYEmP1N+7zvyWoE4d902Bq6tzthl/Ja0GMOHkKaOfrbNIGNk0ckwLWsORwhTQcYIXfMqT1ay3wDsDYLl9vovfpJ0AMLlIqeoCC7hv8S4HOvZiH4w7pFbjNqqTn7311/OOwGScwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl022SYwzKklrKmeogdLb7HU3I/WyyxLD02uWRb+/bU=;
 b=arfkx32DkUDLupz4dmpK1IXYICrRFueNJKaqsv7qIl8LOUPhnLPdNv3uAKAQCnwFk3CaS127LYOsh6YIFikdxe7ifYpZq1rOwLiAYSFIMDbOfpocrCvMZo9HiL7xqAOHkX53KOLXMZFHRvO/h3oxSizhgf1N0u4MaHwfCgVZhEHw1xD4ofKZGonvDJ763wHRvKTOtYKRU3fRLFNKaNnU7TINiSu5hAPJvTacXYKa2edXt466LSJBq3pnoUV20X4u0HJJVPSLggQ0+3p56pdHy039usnW/6J3pVzJStU+bIGoQrRC236St6bSxZFUM0k9+z835+l0tKSciD3uKm8jbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10939.eurprd04.prod.outlook.com (2603:10a6:102:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 16:22:25 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 16:22:22 +0000
Date: Wed, 26 Nov 2025 11:22:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: add CAN support
Message-ID: <aScpNjZNU5MtfVRc@lizhi-Precision-Tower-5810>
References: <20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com>
X-ClientProxiedBy: BY3PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:217::11) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10939:EE_
X-MS-Office365-Filtering-Correlation-Id: 4950424e-0b78-472e-1fb8-08de2d07fa94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r3dIABBVffIwdBR7d6E0q5iWPEIkTYQ7FDyRbcPiuQgaNjzGIMojriv2iZKR?=
 =?us-ascii?Q?J8lS4UEJ4VS4/X4IteElCB7SR/MwB4kEUFdN+v6TqlIDtp1wQ8qCD1r9jgak?=
 =?us-ascii?Q?6hBeKAGxO4gtoC8UEUAMN3ePrtmCn35U5ye3WoxfBwpcOgn6yVaDO7qBsbOI?=
 =?us-ascii?Q?JZ/3BJDK3uQX6BE0kvo7gy2Zsd0+OUmM346hSCfeXg6TnlpKKd+ejCogAikd?=
 =?us-ascii?Q?wNBQzQtxOaJMv5l0PNZKaqD50YJsWueygBrxYjl2LJYYoxOHt6i5avaWb5tZ?=
 =?us-ascii?Q?ydP2rNyvcF04u8JVaf2pe3WR2+AjyFeVzUD1VKcDemgs9Utvhk9zX2lhkI+v?=
 =?us-ascii?Q?u2rwZJANvTEdfuc7c207PuiXS80gr4/zHVDOasLBAQBwflQ1oNXo3J1UGJ4n?=
 =?us-ascii?Q?LCiPJECh06mGs8mSAoJbaCHB8fhQNR8USZ7uQkE0nFbrLxyit/ABJPYyO3tS?=
 =?us-ascii?Q?HNnRq8JAfSLOP9wD3B4tLMVbgaDFOf+kgm6xSw+9r28IMYa+02v1NIcLKntr?=
 =?us-ascii?Q?d51Zp6xGucQX8JNI+g3n3fB1l5EmQbZdNL1csTIlL1OGpsDRR2u2q0oFCsA4?=
 =?us-ascii?Q?kd5LXtskhcIeHU+en2gmdADyA1WDU0KKdqwK9DY9Ef6/TJWlwyoRTqd4+vb5?=
 =?us-ascii?Q?wj+sUOgp9g5E9hOwxFAQj0m+SlVJ4cIuHIvaAcSWZq5WppWXPGd1vjXshwdm?=
 =?us-ascii?Q?kNQ5XilXm+OXQm9nfOUTIYQ57G1UEJ5EMHw1UXevYdacXwmP2zqZVPYf45/j?=
 =?us-ascii?Q?GrR7YJvak0QkLfGE0up6SsTnl6e0luhKHEtPRbJaf4JVhAURovJo1va9+lsM?=
 =?us-ascii?Q?gimoO4sa7ZCogs+Zt7tiHPwaAH5rD+33iSMWHMUWaywsl13wcH/QXi2uK0e+?=
 =?us-ascii?Q?rr67ti41BGcaM7O9Ab4k1/+TDOb3c6z7ANHitXYKUq1VE7NDQaMLYhMz16vI?=
 =?us-ascii?Q?G0KLp9H6lnAvMbtLZ6aK+XYbkjeuIgXDUlSBrWNUlfTQkSgm3bYkZx+ZYbTd?=
 =?us-ascii?Q?LmcQby/njJiq5FT1qV9fMBkG5K29NWdlMqrCFfurhTwaP/AkH7MaqwkGa3t9?=
 =?us-ascii?Q?tes7yeFLhD8aLALzqmEu2mCXAxTTLxM8VC4EaXForGP/q45/0CqDO9pxLF+e?=
 =?us-ascii?Q?TI/CFZZLN6Ot6+64ywGjHoN1j1XOVTRLKLGGVGVg0ogX1Z0TH/djS81TfdGS?=
 =?us-ascii?Q?bZJPIgecI8WLnFh3EXdmQFVFD4Lzo+/GKigvPThwcZ/jjpkWMZp2/djwPonj?=
 =?us-ascii?Q?Mzime4BX+fFbdh9Mug4HL5FakSSVXjeCypRpVvbK2qV+47vwDDk/cihSeam/?=
 =?us-ascii?Q?/eyvJDWKe3CHH/T8LORZbNZPrOlEC0LzbHaLEWW/0st1atJXhAkB2Gx2oFHb?=
 =?us-ascii?Q?ebjkO4IrEELHLDv1i01obYFQU7D62w1HmZNz0v+EJ9UHgNiOlP0nnLb2HhXI?=
 =?us-ascii?Q?ajKB/4Pqe3JPVgGm6MpjEx6/w0/aa0uUzMwWSl4Fa517fceGXoVnb4A4sxNn?=
 =?us-ascii?Q?k1UqOFqh+nnmxFOGCwy+TUSxATzWR/m3qD7e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8vcCsByBYgoYMkRAeLJ266SHuLO5lg6+fEBr4Nrp5l8yyJJUfxd71Gj8iD26?=
 =?us-ascii?Q?RdItIgCGU94Li5sk50lDm0v2C8pd+Kf7r+pvSc0uBBrwDyoj03Ce6JyK+lNe?=
 =?us-ascii?Q?cpv8FKcSSCS8529IAZmNWwst+SCMWfDz+t07qMHXXdnO2D9GRzKr48GH6c9a?=
 =?us-ascii?Q?bMFhQjLJV/YtRr1Cp5zwHk9eh8jCk+GWkZom3Q3/n6ZeUdO1hYsM+JEfOsFx?=
 =?us-ascii?Q?igXwuU4Iy0T2/+XKW7asmuRz3AHGdHajlwK68t0MZWeO1tFaYZQ2V5GUOM0d?=
 =?us-ascii?Q?VEGq8owvwj9M6/UbvJ0apl9sVwcNDcVyPWg7NWHuwB0fMy8ivwhHQbOeHWWI?=
 =?us-ascii?Q?Tu3v4iilIjr9dGQHC3ddGys5M9aTVa+YXgBI+MxdylnKdzI53XS4Ot35+LZw?=
 =?us-ascii?Q?tA+ogG3P11q+KXuMKQ49ldsEJaxwFh63c7D/ay86ZN2XfxNnmsPGaY/A6XvM?=
 =?us-ascii?Q?xx54iqljSOLt1w9CM+4NgFj7w8RInRq3pCsdTZ1Y6kXld8/ZBX7Sa4ZedXty?=
 =?us-ascii?Q?HsdrzloyPsCWljRUPkxuOAKRDIeH6MhcDxH2K+1oN7WYRehrOhPlnkNKAQZB?=
 =?us-ascii?Q?/HfrJWqU1GcL3DIUFmiahAXQWtR3pkLCIZkPjKRaM0BTpHmMPX/FY3DhfrS+?=
 =?us-ascii?Q?sl73YkBi3pN22MdxRItT8uw7viuvSZumldZXMmn6tbfUrvnEl4MUnRXlIdsG?=
 =?us-ascii?Q?w8RWb/mooi4OTV8SpR/brg2ps3zkgEVbvoSg2gpJMsPnuwtYMD7IXTkp3wfL?=
 =?us-ascii?Q?zv7CDHhUeFAhU3m+9hfuaB5Z3eb3CDKHq14YFp5gKtcK/lBGXFlBJCAJ2vnk?=
 =?us-ascii?Q?TOktBQUJAp+QQ3zoc2SH4O8RqUnK54vkZ38pAkzzWxU7gx7u0DLGE/TXqaqJ?=
 =?us-ascii?Q?fCXlVGCXGO/u/OUGphEsPdKChPnduF8kzU3WiB4bwVOEa5srcLiA867LQSWs?=
 =?us-ascii?Q?YU9rO2md7aeHkBB71HXZ0MawHdTDbhkC8RiBolnBGTMpByJAlJPclyRjvhEX?=
 =?us-ascii?Q?ZWv9V9MW8KDSxamVX87nmgj8rIn+5m0TuP/h0uaM5bXAl9atBbuIiHm/fmyd?=
 =?us-ascii?Q?9/YQ93Ha4isP32RRJ+ztmQ0h2IFrF6EsyAm3MI5+wdWnKqFo/2H2y9zN0ljV?=
 =?us-ascii?Q?v7h/UIBDkkOKMoLik0sCgemoyZgrUq/V29hDDPBImGdD3t2MgZYDroVUBijf?=
 =?us-ascii?Q?A7nUq0gSt6K6lit8IPavyUWLackTW0WEkUswYyybL1fQk3BkQPQ9hbY35hsP?=
 =?us-ascii?Q?W4rvuzq39RsXhyNthkH+S73Xf7HmcHO4N4gxI8chmXfcabYXvv4jMn+S/vvc?=
 =?us-ascii?Q?SqwZqebtIausyVjQWN9EDBTrmpOeBAN2EB45sbk3e+xvHBHsIvfNx0knI2Yu?=
 =?us-ascii?Q?C+N/7cgRP/jrEaJIGKID0tcBNeG86QEU0tYIMRn90Itfig6c7TqYr1fXGIve?=
 =?us-ascii?Q?lMbrGJXNyNr0VMkLgMp3FDejQJS+QDbjTB3+YohteFvHlJAQokArVdMLyhlh?=
 =?us-ascii?Q?gxMWOJ/GJXWairrpRpfdrgqTy07A5P3psn6NWm7O4/mFmUYIFB+xAsNdKAi+?=
 =?us-ascii?Q?edKYX7yEhLVo/ZD8yzKRluAWAJp7IvcX7gQqGT2b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4950424e-0b78-472e-1fb8-08de2d07fa94
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:22:22.6478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgCMLUmLY6K2GqC2Q+/ZUrPvRR/sqB1izT5PDLhv0vwx5vdGJZZdEV8K6YQfWWXKq/MsbRMBPtvOG4ffEALBaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_082230_873258_FCA96E25 
X-CRM114-Status: GOOD (  23.34  )
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

On Wed, Nov 26, 2025 at 02:20:07PM +0800, Haibo Chen wrote:

subject suggested,  add CAN support overlay file

> CAN1 and Micfil share pins on imx93-9x9-qsb board, use TMUX1574RSVR
> to control the connection: put sel to high, select CAN1, put sel to
> low, select Micfil. In default, sel keep low.
>
> To support CAN1, need to put the sel to high. Besides, CAN1 use phy
> TJA1057GT/3.
>
> ---
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  2 +
>  .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     | 63 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..1142d3312c8651b4292837bce3cbe46ab95f7e09 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -373,7 +373,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> +imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo

Keep order by alphabet.

>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-can1.dtb

the same here

can1 should before i3c.

>
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..62d4fa6c21d794f91da59f511d6f0162037e9271
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
> @@ -0,0 +1,63 @@
...
> +
> +&pcal6524 {
> +	/*
> +	 * mic-can-sel-hog have property 'output-low', dt overlay don't
> +	 * support /delete-property/. Both 'output-low' and 'output-high'
> +	 * will be exist under hog nodes if overlay file set 'output-high'.
> +	 * Workaround is disable this hog and create new hog with
> +	 * 'output-high'.
> +	 */
> +	mic-can-sel-hog {
> +		status = "disabled";
> +	};

are you sure 'status' work for hogs?

Frank
> +
> +	/*
> +	 * Config the MIC/CAN_SEL to high, chose B
> +	 * port, connect to CAN.
> +	 */
> +	mic-can-high-sel-hog {
> +		gpio-hog;
> +		gpios = <0x11 0x00>;
> +		output-high;
> +	};
> +};
>
> ---
> base-commit: 422f3140bbcb657e1b86c484296972ab76f6d1ff
> change-id: 20251125-b4-9391-can-dts-2f4849978fc2
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>

