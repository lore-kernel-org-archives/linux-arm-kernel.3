Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3936BCD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivbthn4zI7eIO2BXAMWtrHC8jCghx/eGL35689XMAeU=; b=KZsJHpQC6IplRcTDFHwRSU2NI4
	K++FvuUd9hjeKaIJclrfYZrfVOEAm1XGxXlj6ATLyC3h+GTyCN4QcnQHgP+w0+BHX+qvaS21Z4j8X
	H+NF+rSHbOzMxCEW1q96FkrohRk1zrxttvraLLPdCzPn0ypTBUKLhVC35pElP3spfYCFQ+DUeUCna
	kt6LnX8x8zplVAi6ITcPXg/u63FMviwxU6eaYaw8YTD0tTqDc1gG/PibCJyKKlEfUXHK3tNEM9v0k
	zQY4Yj/wnRfyVxBFYCoRmjHpWs/A9CZbu6kTtftPSWJXbt98VRgKM0FXcmxWFk0s82R6Zpl7DkrZD
	5bIASUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVYwB-000000011DK-3Cpi;
	Fri, 05 Jun 2026 18:06:31 +0000
Received: from mail-swedencentralazon11013060.outbound.protection.outlook.com ([52.101.83.60] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVYw7-000000011CS-3t00
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 18:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qi2CyzuwDER8Z67ndHTHRm+XipZUp10YdgXWDerpbMj/Y7uJJSOJx1owT2H5VcT/DAO7rRHcf4hKmvqwoq0T8yM0XXpUy/cNCoLj5yzM2w3GUkQUq/lJa3rhwRV5EPknEDDoP6SrLf0bGWgsPL1fVX9UJSQXef1HuUmt328J9wPXbEV2TjB/oVyLivEsXm4SGcgR9atk6H/1CI9/NFR65ZoO886+M6welpbZjsLS+u9Df82uuSKCYHnbfE+fjc0JHKW0nJzg7h8xAzI0HgSWi2LEVEXSTFH0F9qWFj43L5CF3s+JwIvE0o+yg4Kgnv3g/4ougfKxivQLA5Lr5sMKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivbthn4zI7eIO2BXAMWtrHC8jCghx/eGL35689XMAeU=;
 b=g/2TytojBImaOoERqEujnXefTFSdSG+f5jzy441KAkX3vmoplNs8IiPMzC6/zPck5l4I7sS4sgv1PuDs6A8rPnalVFU1DfU0kKIDBmQ3M4HK1tuKzIxnnZr/UiXtLtuYybyy4IGQvVXtjtRVVPoOk2uOqCWp6jmbBirlPvqCekixXmDusPqJ4vTJ/Jlvyl4/WcbLm8fTlOqQPwQ5SAFyFM22xG+CMcgUwQTKWmIsoKDiFyfC3yiSTNXAzIwNGvBSWzKJzIiIzNWB+CIbpqhtrsGRh52UmS7JKxSvoebHV3biWGF7sl8ovZ/LTaLYhQOg148S1QIeGj5qjRWtJ3zVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivbthn4zI7eIO2BXAMWtrHC8jCghx/eGL35689XMAeU=;
 b=eADpB3INFs3wundSZhTK4Gt1zI5ZqjRlxumYdsHf80T3IIVEReMrCBHKpPFAom5f4r3WCSI+NgEi4fiRCUS6rWuKONd2us4mlCtBFDAr16knr3ttQ9/ss2nt1pqfTKnn8LMapANmTu5EaEURvgE4ug+j5RnaB7XwYLYWDq6un8QhMmcEbg04II4L4ukCY3uIPgvuXiMR5NecZFuY5NkZKxDtd0/RQ28wyv7VFkb0pVTr+Ug8jUyB8PO0gi0naICknrhOSwR6jborRH6ONYZkuDk6g+tqorx2OA9xQgJYCHaPKdPnitqEhSbWj79qSYXdZHcXzmuEht0weIWwKk24bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 18:06:22 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 18:06:22 +0000
Date: Fri, 5 Jun 2026 14:06:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Christoph Stoidner <c.stoidner@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH V2] arm64: defconfig: Enable DP83822 PHY driver
Message-ID: <aiMQFsodSdKGufoY@lizhi-Precision-Tower-5810>
References: <20260527151414.184823-1-wahrenst@gmx.net>
 <5cf05aec-bc70-4758-9c00-812a33a44946@gmx.net>
 <aiL638OLrfntKmSC@lizhi-Precision-Tower-5810>
 <a9304534-2d7d-4316-bcd1-36ff0931bcf0@gmx.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9304534-2d7d-4316-bcd1-36ff0931bcf0@gmx.net>
X-ClientProxiedBy: SA9PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:806:6e::23) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 6719f9b3-0557-4a45-bfb1-08dec32d26c3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: wQCnH2PXISH39c3N80mvPiy3m9ZYioUVmorYx64i3HVPEWqu5B9tfLKThUs9ArbdGBPv6J1PsFzYxzCGS2yYrJcTLTxA5RgmOvf9qyBbTIHcFkHVP1gt0/gNUWhmyBeDo+4dOY0QpQqxD3OcmB4RuGeJGmnwAIDkto75tmztZFjq2CfPdiOOy1p9oZkPxlwoeGMOD4A0I1LCAWPsEbDylMJKNitz8EWQDJzCPDhJJtaD1aXdsESwPSsaztNdR+Y7IGkL4CliZfdUqvYCxt9ActMc3xyTENb88FTb/LacwvQDUtVlPWDZGpka83Olgdpxl77UuUblfm6CNg1K1t8xRKX3OYxFXG7BREVXLpqknsoOP5N5QxSPsSswTmkduBh9Swx8iZCkAPPAGUMZpwPVwB3VSmbI82dj5hnD7Q5bbgiP+8q9iRbElzf7yhtsamDj993bg8yqUYwI1W441yRc//W3vz1FRKon1joRDgxEbZoBmx04vU2WOTgS/RzxEad+HDGX2FDPS8ad8VWfihFi6NoyaNkZoB1WtZZZz3yMVOs10SJQPwXoA+zmBWBh9nnKhQGT4ZJkg+yo4SRDLbBF3qzSSDsdZUqVRqgg9FUlNqWlKcN5NAPAidzkZQLMzxeYmVNyL7+5DHiDYTIiqruYVGRou48Y7RKF3yy9KgrUgszWv+8hNhQSFds15p7m2kJXDwqolwshbJhfEZR0hlxqyLolag4G/xQffnLp3klx1o7ttd45P9jEwq/Ye/KsIPq+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?isdTG/Fhgn1LQhNHA9YdhCXyAYa1q4q4sJU4wSJY1YDmLUW5OoDHfqQQonh8?=
 =?us-ascii?Q?IWc5KGEv6+dlH1lL9Pc2lBFWm0WkcxZumD44+myWEXrVB+6nh8Af02KD8OxB?=
 =?us-ascii?Q?dT2xUI1E3ulzh3nU+xcggJOYhybegG+0J+Rdec4wHW16j4WaRE4HwzE2LYoo?=
 =?us-ascii?Q?0E2BQ/ouGtYhg+Qz0xaiQA7Zrn1dBu14xWAcSvQinW/ahgyOq3+XikJ2ZeRt?=
 =?us-ascii?Q?XWV4Tm/m2LZnQNtlBUL88fePOccnsatukoxWySCp+EMYbDgloPSBZfN9wXOW?=
 =?us-ascii?Q?HIKqF6+6H2vA32Ps8m25SA4kj0sKzQBqFl8V/Ir96g34502gEmClOpsDX7nl?=
 =?us-ascii?Q?kqQKnw14OMHPu/F/7TTVAxNeOiuOKppZlpwVGp2yszSzdHHlseuFaDK8ZAeF?=
 =?us-ascii?Q?o4Ml3sweO+UnM9BL2rF7EuzMPQ1sp8mI3iTK5Ve6eLF3DhlSdvvr+SFkBr1t?=
 =?us-ascii?Q?fdxU/CfgA4vCnSuhMpHRDN/EyrNmmnLHezND4UpsB0vcWtHA308uEWiRqbWh?=
 =?us-ascii?Q?kTEwPdifTUPBlK+MA7Ty0B04Uc4vuNo7guf2epq10djh1tmZk2k1OY3t5fuP?=
 =?us-ascii?Q?Ooxny+u013K47AQeiCb+ZCL7/C7uQgi41kJPVVqx/LokiDe1hBsnqFJHpuzG?=
 =?us-ascii?Q?JCj0pXFPVdfXGqpJp4LZ5K+5Mc0pbXnaG7NGiJVe0fMYjEllW2+CM0ofOtV2?=
 =?us-ascii?Q?1tFehotwvKa1Ea0hIqfwMvI9kx3OhyhtlZ29ircLTFZMadLyX16Tw3eWCXbm?=
 =?us-ascii?Q?/knvQoYglgLzDShqsVY4Z6wYKzEIzfuFLiCO4EjCD/vFoHvHm0HFoe3Dgztf?=
 =?us-ascii?Q?E0hEMN7B/peOSQyKc8ELhcUvWHjngFQdcveqF4mTzs0GYVp5o5rncrFGmS4u?=
 =?us-ascii?Q?YjTCzcJcb3OwoZJxqAHzJerBmwc8Z6kXeclTm6C3XbM8lJ0iHbCwouhufIEe?=
 =?us-ascii?Q?fGD0CyVcBieOgVA01fZybaT5FKORYvbmBHkmbTAYedTbr+XRHxv8kr3G+p0i?=
 =?us-ascii?Q?p6XCQXzUcBDZG7IiCg/kYdaIKT2gfGO3ffMl2LP4M//Af3FoXxbwShdVbaAz?=
 =?us-ascii?Q?mbqIoag5k4RNTT94/tZlo2WsOdvIzwwLANZjpncdFAYVLZARFN61sIDnWyFm?=
 =?us-ascii?Q?XbLxadn4pexdh8hgznWnXHhBfU95sbINjh5X7PVY8hrJ2/5r8Lyzx9uMRsdZ?=
 =?us-ascii?Q?lJxuwOVdIfRlP3kvef5zyL+vVylUKiuracOtrHfZiu/l3CgHAZ7qfHzhQYZh?=
 =?us-ascii?Q?vQS7I6fGyfS6r0bn4oQ0VCXVh7556RO7omtM7wMKoOksH3AQQ3clkdfGlehf?=
 =?us-ascii?Q?MczRZnFbAuGbjABaOgKeSIxUgvS8iqLQagxaWHtZBwedyJWi6LOGm+PRXL09?=
 =?us-ascii?Q?fR9PvZIj18qi6Mnv6/+KRWh4yF7M07O0lKzlayn1OCn0H0qlgIw0dF0RbYTh?=
 =?us-ascii?Q?Iw8kG3j0utvQn+eg6v6NDesgEIXf+4SzFFWCTIQHtmLl1JDl7J1O7ldFHCS/?=
 =?us-ascii?Q?w6GLsDa1qL5icKcqczUHp2iJrTRixJhRUzqMPDZAFcEKv4Tgz3cDx6A85zSC?=
 =?us-ascii?Q?zxToTqjBrCtH3lLPmVsWeC2+Gzij9JCTsR3Ws09ujB5e3/G/POLwjNHJ/TaI?=
 =?us-ascii?Q?u+dn/bNeO+mGVHaaQR6OvSiB8aatU4EZhyyPESmN7N27UahecO2q7mjangXx?=
 =?us-ascii?Q?DYiYBuEy497w/veFDV0qe7kkfv6C3SLLmyzLfPFNk4pHFe+5oozriEdZpADf?=
 =?us-ascii?Q?sA7MZvvo7A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6719f9b3-0557-4a45-bfb1-08dec32d26c3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 18:06:22.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVB7G/55idJl7krZoDJApzCwetLGIC2+bvD0vo1To8sOC7oKCUPs2JTrIQ3vvBZmilhjZJuWf4yT5xQ+4W1u2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_110628_849749_7591202E 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, Jun 05, 2026 at 07:11:30PM +0200, Stefan Wahren wrote:
> Hi Frank,
>
> Am 05.06.26 um 18:35 schrieb Frank Li:
> > On Fri, Jun 05, 2026 at 06:22:14PM +0200, Stefan Wahren wrote:
> > > Hi Frank,
> > >
> > > Am 27.05.26 um 17:14 schrieb Stefan Wahren:
> > > > Enable DP83822 PHY driver as a module to support the Ethernet PHY,
> > > > which is placed on phyCORE-i.MX93 SOM.
> > > >
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > > could you please take care of this patch?
> > which is base commit, I can't apply clearly.
> I rebased against torvalds/v7.1-rc1

pick to imx/defconfig

Frank
> >
> > Frank
> >
> > > > ---
> > > >
> > > > Changes in V2:
> > > > - rebase patch
> > > > - add Krzysztof's Reviewed-by
> > > >
> > > >    arch/arm64/configs/defconfig | 1 +
> > > >    1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > > index d905a0777f93..20bbbd310d2f 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -421,6 +421,7 @@ CONFIG_AT803X_PHY=y
> > > >    CONFIG_QCA808X_PHY=m
> > > >    CONFIG_REALTEK_PHY=y
> > > >    CONFIG_ROCKCHIP_PHY=y
> > > > +CONFIG_DP83822_PHY=m
> > > >    CONFIG_DP83867_PHY=y
> > > >    CONFIG_DP83869_PHY=m
> > > >    CONFIG_DP83TG720_PHY=m
> > >
>
>

