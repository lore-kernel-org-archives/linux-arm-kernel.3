Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CECEDA68F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KB7SJJedz0ghcFBRh7YECjx/G/N+4yd9t91ilfrEq4=; b=MzSoGfR9qw/Z+cuDhF5i/MkNvG
	0+gKD4z4hYx3D0zTr6E1hsymeZU478HBg1fuUdMlYLNL4fbI056apKGFjl0gsLqzxrb6issfYHtgX
	Yzu9KHiR8wL/86xGF/qemcReiN0CrAXHvpwo43llRb7xTTNVNNuiiUHVuQTocRbAGMsSCFJZYwrxU
	7zjx3G7UgTq6Nf4SoQimnND/hMhoyRUnPSwOtZI7/ENrbE52B1W1U9CnY405OdPEx6uJ41K6R4R1n
	IKaMnfg5F3RQeoN7IMpFfTAbK9PAa4hiG8Fhd1NFP9xK3tTHNRzxc17xU/oSxG37mrqTX3t9DSIFS
	SewRyfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxS51-0000000FTso-3P3P;
	Tue, 03 Mar 2026 15:54:39 +0000
Received: from mail-westeuropeazon11011012.outbound.protection.outlook.com ([52.101.70.12] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxS4z-0000000FTW6-2XdZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:54:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wziwGCVFxIUJbIsxMc3JceWbcmHrfyXgxhwBekSPaWG+YhBvi8oihbPOmPXHUaHPA1JAp1+totAX5bYACoViUGHkUKlVrZhiHRuRKtvZ159rY+v6xHchAhYth6CPEQj/dF6CiQ78a9vEF3IH7qjYh6ioCRR9Le/0Oj8ZUHAQY654Pqxy/GoyNwJsVQvKQ5QzGu8ybeiT2Ro+VlEmYGhhmajQlawWlb502+atw9IkDoeWR61zRySIJn1CYpxbhPXOI7/MUNnz2zYdkSdZBRQZMCYTnTEJ1yvRaIQ9eybuTBRMkmZALauCqpq+uFHF021X7km/Kz+K4CTsQX06QoInaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KB7SJJedz0ghcFBRh7YECjx/G/N+4yd9t91ilfrEq4=;
 b=BE+f2VNtW/80TYr4aei/ygkrrmln7PB/5D6sAni+lzbKFC5TSJ5ti5HuKIvtUKRYUF4NKLRzoN/usXAsZkEFS52a73pgGkmLPFeq9WaHhTrFdzczGFhCEBnrRzWWDisOaaXAfaEYKlieIIA5ld31Dbzr7KvPker3Yk5QOb4JX2nVilLNfhGxcJ+GP2YIBpx6vyqZOAkWrOinhZZgTulgW2PE382W3u3VpOk/FefiDzSUX5nqL/brm6N/UXea2JnAhoAjSKpx5ASXi9sYiWjQB1sa1Lg2PLDcBZ81Ws06Zo3xO1N6FQqnxryNU3/YXNze1GZ2UlZkxiphyHr7RQbffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KB7SJJedz0ghcFBRh7YECjx/G/N+4yd9t91ilfrEq4=;
 b=dy2ABM78jTu8qw7gcu80IF3GPfQyFy1NO9xoPaneRagZa74AlZASfoThevO/snmI8a2qvxSWGKZUtSrcamhDOVWPV9vubbgLwPoeUOFWv9jvlXukkAB076ST1c81McphLG/c5EM+k2DG39PHPSBZ3HEhmShNhEvTFcxyTo74HWkWnWiQWW5i6EaqC46wVYW0fs+6PlpyC/JwxbWLTsVJmv5jt4iPOmvU1iy/PhzCuQzpD/c53ufiZ2+aoa8Rhngozduag9nw26/J++cvhQwh1sampwDAzUVhZTcNnrQsjc84D6Ow1x0Qz8g/pR+6PXn3sJBB9fTDfD8PBOekLWkRgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8019.eurprd04.prod.outlook.com (2603:10a6:20b:24b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:53:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:53:54 +0000
Date: Tue, 3 Mar 2026 10:53:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefan Eichenberger <eichest@gmail.com>,
	Carlos Song <carlos.song@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: imx: ensure no clock is generated after last
 read
Message-ID: <aacECsJ6O8QjHsUa@lizhi-Precision-Tower-5810>
References: <20260218150940.131354-1-eichest@gmail.com>
 <20260218150940.131354-3-eichest@gmail.com>
 <aZXoTGK_v3L4pc-E@lizhi-Precision-Tower-5810>
 <aZXq4gn4xhInQQlq@eichest-laptop>
 <aaamYByn9dZEIBWb@eichest-laptop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaamYByn9dZEIBWb@eichest-laptop>
X-ClientProxiedBy: PH8P220CA0060.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: b35e202a-ea50-4180-a0cc-08de793d122d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: TCqvdkXZ82wIocqAMD2WapyfcyDobK1f2Gd+1hEdKG/5nkSeKdxcadaw87UTEBmmaixgBfmVtf3W0CWIiYHzKRiwAJWmypcibtLF10hNK2oKq1Zu4PSM/Vx1ZF9gncB7Z24INGq3evzy9EgWvfUKBF76fwVFp6h3ViIXpIRq5hY6pAOIY7y+3T08qtpKb3jJREqt+EyUAALWNhZLAsZmf8iUYMWPqOybqzbYoALPlSqnHwcWuBeytpv+uNhqHRw9gZ06J9B9xNMrdeVkrr5jTwJyp+PmyQEXl8turd6eGzSo9SrNfScx6N6HJ1Mo7eOmXc0GUWD88WI3ivXQtEOTyzHTzzdJbBK0N52en/OiK9aiVH7usuEyiBr/OqVsLQYNpb6r0Z0wfjX6GEoEkoNAGP0IN782BCupxsETn+fCcGIZAmw9und9jLXJqF0t6OkJUbLGq2YVvifHIzOoZusWXXCo+Z4//jBFLth8NUmLHtVtZgNU/rD8XtP3yeiZ4rhtqsUyETd8WlXj5YqcnuJr1E9rcT08KLnAQjNrUu1PkPqvl/KM9sMafmKB8KOcB61YomNttQFlcfSj51rjij1xqJ7Ask76gTu5tsWULIbviT4ql0qzTHwsHZY+k+C/fEj+GSJQjgClWfIr2oWjSChMPry8c7HvNts9UFTizTk+V/C2oq3LKmlqYHZvSR8jOYm/6ubk1BHNjVcE4MQcCL6S4d7oGpCXjozEXh+G3151cxykcIMuxsIPMHfMd+T5MhEP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N5s0zifpi0l5aqucLgK3JX6f1d1KNh8JtwSrZbn1Aam9ZZfkq0gXFY6Atvec?=
 =?us-ascii?Q?6o8BrbiLYn0a9GYunutAWNyLRQL9U82GDM/Oko7TWK3DagRPlmMMJ8YW8qmT?=
 =?us-ascii?Q?x4QC99N/CHtpoSMimN36BmElt1fLl/asRVc2enipPozlgXfx+X2Ka4SDcSgp?=
 =?us-ascii?Q?klWAe4i3jTedLcrp6irAL1mYnMIcvF28OZcSugYiIo58lKK6gOcoXTBf0jWz?=
 =?us-ascii?Q?HA39BPpYdqWg0EGgWCURy0e+smT5m8dGSW3Y43R8eZ9Sb/19vZjhyt3NX/vV?=
 =?us-ascii?Q?athOHpA0XLDYIJZRwwlolRm+A7DROvCGMFAnIGXPA4H609WDGGFaKhsElXXA?=
 =?us-ascii?Q?9pi13a9xtds0NGnCu1z5ziun4iUO7sE+mykOBV91jE8vRPMnL4T6yRwlJkqk?=
 =?us-ascii?Q?3WnS1/hiMpfNfME/jLO3rPycWHKR6IYa+GrEbdtOpuPpksEFDl+Ts3u82HmY?=
 =?us-ascii?Q?IiDgWf+Z1cf24AW5Vcfr4tJrk5RNko0BHOmLgyrG6kkNc5rvy7uJBdLes0hi?=
 =?us-ascii?Q?w88w0OMnKynoGr8knCFLo3nj5sl73WVqoh+tGlmHoqeNKJ9yYwpUXX6bqi/e?=
 =?us-ascii?Q?c2vQOvlLBkw3/xy4wDvuHFNHUV5D0davPtnhxHPwvENYvw420bh+CSTizwXr?=
 =?us-ascii?Q?ptWkiVhwdAN29Spx3xKREdT/yybV5IZKSeyaP0KxNYlie2XgYHdt+gZNWyKN?=
 =?us-ascii?Q?4TBxme1uIGecPMEhLofF1UBxjnLHBthkZQeFwquhevFJ9YH/F/Y8T3xk05+1?=
 =?us-ascii?Q?d4s8t6Wmoy6CHQsCGYp1aIChE3VRX9Q8kTz1oLxWLQZNRm2T0kqFUh27EiZW?=
 =?us-ascii?Q?sZyPy6OnGGnOfTF1RjhCLwvFSaDuMXdaaKVHrapwJJDmQ4KqIY7KzqNsH5+k?=
 =?us-ascii?Q?cTkD/8u603DS+IA/Oo3/mtSWf3pjfyWZAlK+0HylsHAH6CExbaWVY8j3p4j7?=
 =?us-ascii?Q?9M5dkJvnNss6trJTKEe18EmkBBUgRDls76Jvf3mRcTk1ZQtOgGUawB/8MFuR?=
 =?us-ascii?Q?MBc2o4whAjcXf+jmY7A6tm7RMUSkaPUoZB8iKeWGezUq/Jvcg7RIiYzoMi2N?=
 =?us-ascii?Q?nh3vpq7TBq5W/Wf7k7xVXAITWfc85He2ZN0qDfvaWrHlRwRynCfSH2eDyEpv?=
 =?us-ascii?Q?stHTjz83vAiXCBUt+16T6xlgBdzVkQGzQiEA5/j3LMP06NACLecx3k+iXhXm?=
 =?us-ascii?Q?EzG0Nc96N0/spm0A3cblRMl/wMVYZgnSSDBOIyYpa1NMceH5AsheOgpvFk/X?=
 =?us-ascii?Q?RvxriSaM1C4/TDo3iYpuwOxgO+kTiSH8ya6PjP51ZfwhbLt96Pyzi1loTutl?=
 =?us-ascii?Q?I16T+BV2AfbFm5EUSknn7iNu5A6U+DWBg4Dm/SbrAyRbCs/9JN+WgNmKHKo7?=
 =?us-ascii?Q?SjdV2uYAV3NA00tMa0DqMjNl7Z92UgJeuyeEspCVcUVcJENlpyABKhRPaLOo?=
 =?us-ascii?Q?uPVQHC839c0CAAOyVuB62FHdyQN2FEI4WvXe5FWjwJUlFn+HWHEoPr376f+F?=
 =?us-ascii?Q?p4JqAl8wP3hSWj1dOWBCQK7ksReXaKy6/18QN9iBhVLB50pSuiuZ/APxU74g?=
 =?us-ascii?Q?hvwKp32yh2bsvOxjp9YIuBcsaFEO/o9WSCvNX/oXAqcFfo9tVfsgBG1mC62J?=
 =?us-ascii?Q?UFf4IH+om2bplzbnauf3frsbr9O48ANnkr6H2JDQekHeaFvaQ8unogzgsNhe?=
 =?us-ascii?Q?9dfySMp1Mxezugg1xvhe7O6Qk1YM3h4zoJi0sgygWaPKOuPq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35e202a-ea50-4180-a0cc-08de793d122d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:53:53.9431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urbmlsMV/srGZ/a/zk6Ebidz80BJERXS0jwbvMi1t95kd7r95VMk3Y5befM9QUk1KtueUp5YjhJDGPowTluHtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_075437_652502_DE615699 
X-CRM114-Status: GOOD (  20.92  )
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

On Tue, Mar 03, 2026 at 10:14:08AM +0100, Stefan Eichenberger wrote:
> Hi Frank,
>
> On Wed, Feb 18, 2026 at 05:37:54PM +0100, Stefan Eichenberger wrote:
> > Hi Frank,
> >
> > On Wed, Feb 18, 2026 at 11:26:52AM -0500, Frank Li wrote:
> > > On Wed, Feb 18, 2026 at 04:08:50PM +0100, Stefan Eichenberger wrote:
> > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > >
> > > > When reading from the I2DR register, right after releasing the bus by
> > > > clearing MSTA and MTX, the I2C controller might still generate an
> > > > additional clock cycle which can cause devices to misbehave. Ensure to
> > >
> > > Do you means SCL have additional toggle? You capture waveform?
> > >
> >
> > Yes exactly. We were able to capture the waveform when the issue
> > happens. It doesn't always happen though, it depends on how much time
> > passes between clearing MSTA and MTX and reading from I2DR.
> >
> > If you want to see the waveform, I uploaded it to our server:
> > https://share.toradex.com/dwnhcrl6b9toib6
> > You can see the additional clock at the right end, after "0x17 + NAK".
>
> Have you had a chance to look at the waveform? Do you have any concerns
> about the proposed solution?

I am fine. Add carlos, who did many work about I2C.

Frank
>
> Best regards,
> Stefan

