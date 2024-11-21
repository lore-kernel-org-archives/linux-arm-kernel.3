Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C01D6ED28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8WhkingJLiEoYoBPYn5Gecq56XxNwLO23y2N9AV0x4=; b=tyjrgM5vJyQD0ldNg2YDMBfH7h
	7tYH64bCqopUTosRqkCsZVOUOIb10KYJpNZS4I8kHYT1XA8cYYoSD0+0tBCfqAHs44F/7BdvNCdLq
	/g3kf3R8WY01++/VoFSsAYFUT+N3NHjABRLhY+q1YgkCEjefBv+WBsN/7OxadVpegBx47yQ9QwlAT
	LnIfR5NaRf+tfFu+kuu0XlCx4XK+Rnp5EeJ7NIo5JzcThgRQWR1EVK0YIMmTTvBvBc2wqwqjZQqJr
	S+5gAhvB1dJ3JGZEe9ss0v9uisroW/sCc8dwpj8XJsfOuZ4WGXOBylSe4fwf3V8u9A69BgYVhgTwC
	CL7wLnBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6xT-000000004qr-0cX1;
	Thu, 21 Nov 2024 13:10:55 +0000
Received: from mail-vi1eur03on2062e.outbound.protection.outlook.com ([2a01:111:f403:260c::62e] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6wQ-000000004dr-1Mqe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 13:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSRDs4QbnnHDQMni5l0pt1inPUUQQkBH+wIIAgYy8ZPQhxK2+pKErWMo35fsP+OMVRNUGlqChrwnLfg4jKgwb3wOYqVzhR8S0PPJaidRey9x9BnfLnJQUi6KJK5z4P2fo5f4c7B6rF2vFdHUsTNhLrdQivlrWv9/xMQO0cTKcGnUgwSv7tyHLKx21zi/ybNsrNRb5fqmrFvf4GCJVCDSZ2Gp5iXkbnGTgJik5ZSory44mMTG1eYvWLGGBT9iQQeVaOuAyx3oYVGaNGIkyJO5kZl/Eg69piUG4739FoH3/fagPXYayznmzF4ZspWspTjpTD9mL1ulbnJNv0pee5cyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8WhkingJLiEoYoBPYn5Gecq56XxNwLO23y2N9AV0x4=;
 b=neaxwt+kE2I2s/7qWEF/C2+giGRZlAZx7bNOjHUdweIXBfvpBLBXlpKeoKuaoXxbvj0sSUxx/Yg0bgtqkQrMQQE5y4LBVyZPTA2giR6PUjTiUZly+qy6zwGrfw0pqjdUHwFI1/paQUy7x7Xs1hsV34qr7b+OovNcppYL7Gd8Z/aBLC9bSFBxK9D4VWYSQk8qeaR1eRnAZIauA8hKq/93Sc9CzQJNIBAOPMDybiZd9uLBLm8jYxJ6XYFoQC8klKQ8Uzsb3Gn3TA/SbijsfJYPMaSkxvSSScqc9oDzKiV1LqCmtcBspn0QKT/b5q3elgeHRELKnvr0LI9s6KMG4vLhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8WhkingJLiEoYoBPYn5Gecq56XxNwLO23y2N9AV0x4=;
 b=WckxcPko4B+J4+ZHN7Dbvu+3b260NO460NhDnZntcAPj/QVNF4hPmoojck68zNUIhhVIRL30PxuMZnyjSHFT1WEhdpIJ++xi2liCam3wa/U63zKDkf4ZPrgd/MUOTSe+/d2b42Xg1GaCdrPNc1KquQa0lNZ2eLO7eGe0Y4JZIPAc6+Wgc/evivi4HT7g2l88bCbsnLkPopacJdTd0IDdv1hIqmgTrUjhTwE4WmOQGubE2AF6CGA46611A1By/6DHteAMoKHSohE1T8lqxTuDiFNjLjmzDA9iT5pih6KU9AfML7+ehgGpwRuZyv0YfVawv1oR6jIhYFUYIvxUMU3nXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM8PR04MB7268.eurprd04.prod.outlook.com (2603:10a6:20b:1de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 13:09:40 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%4]) with mapi id 15.20.8182.013; Thu, 21 Nov 2024
 13:09:40 +0000
Date: Thu, 21 Nov 2024 21:07:21 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: will@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] perf: imx9_perf: introduce axi filter version
Message-ID: <20241121130627.zflbvac222jnjoqu@hippo>
References: <20241120032109.1163146-1-xu.yang_2@nxp.com>
 <Zz4PvoCj0ziNzU3w@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zz4PvoCj0ziNzU3w@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AM0PR10CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::28) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM8PR04MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 144df3ad-da31-422e-5625-08dd0a2dc1fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dc8pThX2OPrgSM6lxQg7Uh1p87s5h1HkbEepZGVnXBfljMiOE2eCjiQQPDx3?=
 =?us-ascii?Q?hCnjhauJa6WhJtzYOCPbQx36nUmYV+JWFR6HJdvlyEEzpj6wGqD9g+7dzCNa?=
 =?us-ascii?Q?frM5PKCdjGgngY8JSweMIdh3yqLwvguqKU+1mEp7pV2Ef4dVQVn8sIlJLXPT?=
 =?us-ascii?Q?nW8/T0odVEss9yxKS0r9w2ZfpkaqHqdU6DwXzDGew6mIi93PbNQAlo6LoiZE?=
 =?us-ascii?Q?ovlK68O+nJoR8L0nf++aWRbDJmRvvtq/maFC6Enl15XIJYxtB3wrK1KL3Q6O?=
 =?us-ascii?Q?i/jPHydT+P1jOLm3gPnIMeV++qH9wEquDpPCjitq9YVMu4gjcyuSMoHfww4E?=
 =?us-ascii?Q?8Heb3d5lHi5cYeJERgXOOi4l86aqyzNZFQ+0WMZk9zlo3EJQ+gM5zPoVm621?=
 =?us-ascii?Q?BuOxPCsa4jLA3waKRYzugj2GG01hMCZ1BV0S7SKbRpZNqDCfNNvECBW11U4m?=
 =?us-ascii?Q?EZ5VBvTSAifh++gTsW9xmbQvkK3cQ0j6eu0eqeshjBHu1LPE1EmX3OSec7ev?=
 =?us-ascii?Q?IxSewk/kRu+De/G3vFPM3Jd1EM9EvBj25Xhrg/2FytFgC9CIIkAjM6r9xZ93?=
 =?us-ascii?Q?JkFZNGTmTLXaB5BWmBetqTTahkVpUoqU0NP+mu7Ped9XVCTFuBzZ9SCnaRqt?=
 =?us-ascii?Q?/X5Zi/cMROvpUvDiiL8ZHMtG8U8ycMWgR00OV6aH247r5Wiv22U/OmBoE2QW?=
 =?us-ascii?Q?DBHBAb3PBg6IvOXDwNKR0X+b8HQo47Oj1+rgakHLX5z4u/ET15+9JPkfc5qK?=
 =?us-ascii?Q?M9UfNxGVfZniMisk70aM1wKIapvW+GyD1x8A3t5t9+GOqfGQLYDrs1StBQLv?=
 =?us-ascii?Q?Do6t0SX4zgjl/6SpWGKoHL+duCVf/5eUIooUSn865h2frDlKNBTJfv2VmQ4n?=
 =?us-ascii?Q?6BA2NGzxRVykpTONoax8DgC/1nHH+2UCPG8INxIanex7wHooQNYh9nLogXI/?=
 =?us-ascii?Q?NCH+NADjqVuIb6ta+KSRo7iZUC2Fnd24uaeClHOgQI1d5Q5ZLtptbkxVBzts?=
 =?us-ascii?Q?4pXxB8rm2qGqa1VqVDLhSf1nK60hobkjBG2tGnD2eXPm7cUFbOkRxcQmfqlj?=
 =?us-ascii?Q?yKhuJXIJxoCO/mcmCwrIJxQ2rG4G/NKGEOdFjNdp0yLKS3idtDxaqlzgAfa5?=
 =?us-ascii?Q?PIkNgFx0qZxhqQsqdcJQhdDebG9rhHzcTJQR0UAh2Fcm/XPJg3qMu13sEhbY?=
 =?us-ascii?Q?bhxXMZTZ0n/hBhKqxM4lM5kHjtp290UmbqNKDJzZ8Ayt7StesI1dYsARybsi?=
 =?us-ascii?Q?jIuWXj5lEyOnoNvHGdX22mOIKyI/WA/vXTQ8BoliW9ERMSDjbDu+DpOQwms3?=
 =?us-ascii?Q?4IMmAqGGfMwPJcw/MfG7YWt3lSQZNIoeOlmUaYf9dv620mOm0EkEtNhTII7R?=
 =?us-ascii?Q?gign5qU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qvH85fRCX0G8Clw/nDJrmxz5FztHGA8B/Z1WDFNKZKIUH//i0pWxxfog0CiG?=
 =?us-ascii?Q?wTCMJE57JqmkyTBilHB9Lj6Kj7VOcXNNC3HpTJ5hXg5P3YC526sHAXN2Wj0a?=
 =?us-ascii?Q?UcM7fO96mYzK44JQ4q2wUXqqvSNcbImBd2jFVLhctATsAbBdX449PE8+9KRF?=
 =?us-ascii?Q?ZSTWhc/eSUfXveDZA03BuHFWPh5HbMjOtFbQKq2pNa5ZTqtFgpMHxBpGd/e1?=
 =?us-ascii?Q?QQ9V3+4rMwGmr6CkM0L1tgoxnS+hkZpkhIq2BHF0edSshZ11BTFYwQ0JM2Dc?=
 =?us-ascii?Q?WLW/qlFPr0N3i30E0hHGQEU+fFvUsmOsExMBDSa29ObHECH4LJIRQyO2gMh5?=
 =?us-ascii?Q?dPzO1ipU54ZGHlIsMr0OT/pbdp0y5S903YKL/i8L6LkwPSSBRdFSjl2j2LLG?=
 =?us-ascii?Q?XNgCwqgOCtQGBTP29RncDTRa+RyevNqoWFAf2vd7JQAgaGEv1iVagxYdsIZJ?=
 =?us-ascii?Q?p15kao76BWqJLgt9sU/tk3gO5Gi/lZ7UlgFdvKtsjmY0iZVLotQCfh6s06YC?=
 =?us-ascii?Q?lLSgXg3a/j78SiCcybHONQGRqJOYuwMLz45SGJ+GDEXxywSSrx36dTPStdaw?=
 =?us-ascii?Q?skCuXvumxgFgyQ7v+gkKwqLZn0gIi5fYRcNp7VPjkuqnKqS2fEpwKpG713UM?=
 =?us-ascii?Q?/7H+xitWlbIhCocbNauNUQvzrBSLoIs9VWdnclxPoNJ+P5yDfZ1y9GEaPe0X?=
 =?us-ascii?Q?UNhaf8KbJA60Sih80OV4wFk1EuF1wDiflyg1HbGv4NDQCRh+EwLE/+jglDT7?=
 =?us-ascii?Q?Rqp0K2PZ2MJxb7dxMfV4xDP36HP70pW2T0j93GWDfkgXo6wy5ST1XAnRI1/H?=
 =?us-ascii?Q?WWIKYtsLLxaFy+ZF4JPceMzDNXVLuUdVSgf9sOx2uw69P+s1AaBbMy2mJLd9?=
 =?us-ascii?Q?oHed3m1sSuQ3Sdk6zGDr761Gg7VqUXHSx8Lv0/Z9ho4XRne+iEo53zzjEUs/?=
 =?us-ascii?Q?9spaPLaegOM7wpDHlEyTORp15qtCx7mIuUE4tgV2/ZAZkDgX9ia9uAGLK31k?=
 =?us-ascii?Q?05rvgOx2cD6Jv9Ih+2ca/Ak08u01reIiVE1Qg/eYv+vkWO0jqoaJmTzFao3/?=
 =?us-ascii?Q?mT9obvd90cXJm8SzA31QfAFzqKLKASI1aJL04Pj4+3mvCSkrffglSvhzgWLT?=
 =?us-ascii?Q?8GBwWDqtPjLVjFk6NEN9tyYRGEDREoY6ZQ0uJneOFDTgPTDsBAOzNB2MACZo?=
 =?us-ascii?Q?CnSdTOOZfmOzf9WlpR/7AHZ+rOHjvFis/QrgvEFJXLFcyOVCXKmIPeVuHVkB?=
 =?us-ascii?Q?vXzBa2l2iUd6AaVjidBWyZzbsAtBD1/NOYbVvm9mMrjbCSQHqNTdjt/SP7dk?=
 =?us-ascii?Q?vzWq+oHOEneqhxI6FWxrszYo2x49UKT/GhGP4plfP7/Hgi3K0FV1MIPQkjer?=
 =?us-ascii?Q?5nZbIvMaILLyH6DlWM4ZkuuBUerJxMM6gCB+syP1s7P996MVTQDcJjt9d6fd?=
 =?us-ascii?Q?aA44yBZqK+Z3uVgSNy9PfvtuY+MQMuT/DBVP7WnigwZTXtA/pOzmaaZAnKK7?=
 =?us-ascii?Q?g2LCpWUyRfGXhDRX3EtSHhLAtQeigy5kQ/lY/QSJm3YtIvEE5G4vfouI4y5f?=
 =?us-ascii?Q?UXoSEaPHE0HGQlvfuCb4h/nHe8uFrKI0nPdP9yxD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144df3ad-da31-422e-5625-08dd0a2dc1fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 13:09:40.5186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZdK9Ir7+17w1pF5yrcxDvjChnASPe7uZJ8FrdfNX/qOoUZ9jGNHytlApHkksprcF4U+w96g9mx4hNQTGAiDHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_050950_366612_1E2E8B5F 
X-CRM114-Status: GOOD (  32.24  )
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

On Wed, Nov 20, 2024 at 11:35:10AM -0500, Frank Li wrote:
> On Wed, Nov 20, 2024 at 11:21:09AM +0800, Xu Yang wrote:
> > The imx93 is the first supported DDR PMU that supports read transaction,
> > write transaction and read beats events which corresponding respecitively
> > to counter 2, 3 and 4.
> 
> Introduce AXI filter version to refactor the driver and better extension.

Okay.

> 
> >
> > However, transaction-based AXI match has low accuracy when get total bits
> > compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> > So axi filter is not used widely on imx93. This could be regards as AXI
> > filter version 1.
> >
> > To improve the AXI filter capability, imx95 supports 1 read beats and 3
> > write beats event which corresponding respecitively to counter 2-5. imx95
> > also detailed AXI_ID allocation so that most of the master could be count
> > individually. This could be regards as AXI filter version 2.
> 
> Such informaiton is not related with your this change. I suggest put it
> to comment for DDR_PERF_AXI_FILTER_V1 and DDR_PERF_AXI_FILTER_V2.

Okay.

> 
> >
> > This will introduce AXI filter version to refactor the driver and support
> > better extension, such as coming imx943.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/perf/fsl_imx9_ddr_perf.c | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
> > index 3c856d9a4e97..965345d78f7a 100644
> > --- a/drivers/perf/fsl_imx9_ddr_perf.c
> > +++ b/drivers/perf/fsl_imx9_ddr_perf.c
> > @@ -63,8 +63,12 @@
> >
> >  static DEFINE_IDA(ddr_ida);
> >
> > +#define DDR_PERF_AXI_FILTER_V1          0x1
> > +#define DDR_PERF_AXI_FILTER_V2          0x2
> 
> V1 V2 is quite difficult to know the difference. Please add comments to
> show the more detail about V1 and V2, you can resue from commit message.

Sure.

> 
> > +
> >  struct imx_ddr_devtype_data {
> >  	const char *identifier;		/* system PMU identifier for userspace */
> > +	unsigned int type;		/* AXI filter version */
> 
> variable name is better match function
> 	"filter_ver"

Okay.

Thanks,
Xu Yang

> 
> >  };
> >
> >  struct ddr_pmu {
> > @@ -83,24 +87,27 @@ struct ddr_pmu {
> >
> >  static const struct imx_ddr_devtype_data imx91_devtype_data = {
> >  	.identifier = "imx91",
> > +	.type = DDR_PERF_AXI_FILTER_V1
> >  };
> >
> >  static const struct imx_ddr_devtype_data imx93_devtype_data = {
> >  	.identifier = "imx93",
> > +	.type = DDR_PERF_AXI_FILTER_V1
> >  };
> >
> >  static const struct imx_ddr_devtype_data imx95_devtype_data = {
> >  	.identifier = "imx95",
> > +	.type = DDR_PERF_AXI_FILTER_V2
> >  };
> >
> > -static inline bool is_imx93(struct ddr_pmu *pmu)
> > +static inline bool axi_filter_v1(struct ddr_pmu *pmu)
> >  {
> > -	return pmu->devtype_data == &imx93_devtype_data;
> > +	return pmu->devtype_data->type == DDR_PERF_AXI_FILTER_V1;
> >  }
> >
> > -static inline bool is_imx95(struct ddr_pmu *pmu)
> > +static inline bool axi_filter_v2(struct ddr_pmu *pmu)
> >  {
> > -	return pmu->devtype_data == &imx95_devtype_data;
> > +	return pmu->devtype_data->type == DDR_PERF_AXI_FILTER_V2;
> >  }
> >
> >  static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
> > @@ -155,7 +162,7 @@ static const struct attribute_group ddr_perf_cpumask_attr_group = {
> >  struct imx9_pmu_events_attr {
> >  	struct device_attribute attr;
> >  	u64 id;
> > -	const void *devtype_data;
> > +	const struct imx_ddr_devtype_data *devtype_data;
> >  };
> >
> >  static ssize_t ddr_pmu_event_show(struct device *dev,
> > @@ -307,7 +314,8 @@ ddr_perf_events_attrs_is_visible(struct kobject *kobj,
> >  	if (!eattr->devtype_data)
> >  		return attr->mode;
> >
> > -	if (eattr->devtype_data != ddr_pmu->devtype_data)
> > +	if ((eattr->devtype_data != ddr_pmu->devtype_data) &&
> > +		(eattr->devtype_data->type != ddr_pmu->devtype_data->type))
> >  		return 0;
> >
> >  	return attr->mode;
> > @@ -624,11 +632,11 @@ static int ddr_perf_event_add(struct perf_event *event, int flags)
> >  	hwc->idx = counter;
> >  	hwc->state |= PERF_HES_STOPPED;
> >
> > -	if (is_imx93(pmu))
> > +	if (axi_filter_v1(pmu))
> >  		/* read trans, write trans, read beat */
> >  		imx93_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> >
> > -	if (is_imx95(pmu))
> > +	if (axi_filter_v2(pmu))
> >  		/* write beat, read beat2, read beat1, read beat */
> >  		imx95_ddr_perf_monitor_config(pmu, event_id, counter, cfg1, cfg2);
> >
> > --
> > 2.34.1
> >

