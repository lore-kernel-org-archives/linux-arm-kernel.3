Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5002DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cggfh7BPSKUxoEYKxKG+5+8u2h9SfoIAGz6Nh59sNo=; b=lIkTRJmA4SZVsq80VZuSUOGmcg
	/hbbg+lQo4GD7kdAHbkkob5nKG5dxQw5owgIhLyAIjPJAjOUM7rJMWLkgvZ1/4q7xmXGEHq/NBaVA
	PPn3m/UiEbiQQrdXg/vq02e1uJWJycou+VG4XDeHTqCak9M2SlHiBDfKEktm2tbntxGNcDCrl3xp5
	WU8aisJ+jeeaWKv3yxbwxAoZlx7qrhMBWnteGXzCxObd/A5Z3o21c19ic3mtJ6NxgLYBNLkn1nog0
	+MjPUdQy5I3wY54TxjDUsjF234tk4Tp34gQb761RC7y6Q6tJO0Qk4DekamTMo6nfM0AOSTBe/CrAo
	MVztrLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrf7-0000000Br65-25in;
	Thu, 09 Jan 2025 12:29:21 +0000
Received: from mail-db8eur05on20627.outbound.protection.outlook.com ([2a01:111:f403:2614::627] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrdd-0000000Bqqj-05p2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvo0fCc0150wr7J5K4a0fRVlIOYDkjZRezmafQStL435R4pAEL9d0xpQ5Kwz94YvvXZkAwjFkQP6PZ5J5eyF+wc90DYVScMBeL3tIln0QzYQSvwfpLJeg03WhzLdYmjr0C2OJ526u/EjWKmlsMOl6FU8CvzmKSKH8CJRS5NvT0g20hWrwalOX56f7BpcFdx7qYsWJlkbR77p0uCIkh508Ft4bhbcG8HczSROfzW9yQlvR2oZUluXQqhAywobyP7H2NpI83r1bi3Al/ZT6NNDkrNC68zwiqYAw6EE4ulGkDK35E803jMa09GsbOQkhVZ7jGxVbu4s6ndMFmaXoxY1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cggfh7BPSKUxoEYKxKG+5+8u2h9SfoIAGz6Nh59sNo=;
 b=HCIA1HHgOGwO19SlJjf4K6pdJj3Q3/fUKXEY7bYFTL0yh4Ch0cNj3ERHULZYFGnPCBvA8o2pEJn3dGeL8XSzBpv6zisFRiHSCdcbpQUx52DIv4pmQB9YQxKgYDz/2BCCzEyrVpdz6M95kO+TbsvYmeKwnbigmJnbcnDDcqeFojfNi+/JHo+FQLy6o3mDUUoCLKTXUlnSJgL9xJk8IkBGOEc6wJy6a562Z4Phyka/qJ89nuDvUiZfl8ooaszuYzp4f+QjfEzqCypfCT0rixCMM5A/4kcInz0O73HB3uGBa1b1g41asC+m8AgqY+BXnREi29zxeTMIurqhE1OEnpZo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cggfh7BPSKUxoEYKxKG+5+8u2h9SfoIAGz6Nh59sNo=;
 b=fbNteo0BlL+cvkMED34OIza5fPs6mk4uJG9+t2noiIyyGHduhF14F38DnAQ9B544+CgHKOwncPhxUEGqY9gSTSkeKXbarfxLRa5qCYexjs/Tzd+ztyj7V95FtKi0MiQhJBEVyxSdJUjWCWbl6AGDQA6T8BGLZcR20etylNSxn58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB8145.eurprd08.prod.outlook.com
 (2603:10a6:150:78::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Thu, 9 Jan
 2025 12:27:40 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 12:27:40 +0000
Date: Thu, 9 Jan 2025 12:27:38 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Message-ID: <Z3/AulnRioAfiSxE@e129823.arm.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
 <20241221165934.1161856-2-yeoreum.yun@arm.com>
 <6bbc9b64-3ecb-46c3-8c4e-55dba6301ef3@arm.com>
 <Z3+6kL7OGDX/pNul@e129823.arm.com>
 <4f9d2bed-7ce0-429e-83cc-ad6cbcc6085e@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f9d2bed-7ce0-429e-83cc-ad6cbcc6085e@arm.com>
X-ClientProxiedBy: LO4P123CA0436.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::9) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GV2PR08MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 839a9bef-801d-4880-ec54-08dd30a90255
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rA+GCf484K+nnANs2NSYoPQFuBA5nydiX2tms7dqho6e96rmEtSACeyXOMFa?=
 =?us-ascii?Q?8bIjheliXi012LnYK5ukk6vE59pSOr6EV6sqICi58kXZ0rPNT6EYRjsOqxTJ?=
 =?us-ascii?Q?S2Um3YZE587w1BaJd/C9Lb3vOTLaP9Eb3StRY9qISbc9z5vJFFj3AHn8srKY?=
 =?us-ascii?Q?wFHlmDvq7rvI1dh9dNgMtDNQWGUWmCDrcHehI11JfNj6Q+nSeULwqRyHTpgc?=
 =?us-ascii?Q?7BsiO/Y1M1ektWUeOBpRupsDTBFR7uVXjP3/JYqHm4gMpKZH0imm/6otcZ0d?=
 =?us-ascii?Q?akjaQS6EOfP/mtYuB1AlFky+BZtfVsSEKz7ICrZZWzmuMvurFJ+JcpYFcVbe?=
 =?us-ascii?Q?zPtEDeiQD9DsjqUHz1AWrXw8I2A3qlgPV45BDeS0TkfRhBtawkd/KakVn3xR?=
 =?us-ascii?Q?xKoYKsN7z5z19zL2v7uEP282PLBwUDNYGzg0do3vuc1G27Rfv5+l87X/l8pT?=
 =?us-ascii?Q?xHVbJ3zDunBrQ/mEN60bcEtPpkruyJSBBOW2M6Nw3Sd1qm7AqDwDMEfKNuc8?=
 =?us-ascii?Q?+ghSwyf+uR/kNJRhI4SFunyIBCTx5fB3+oIFdE2ONKWre0xQlmKRocyFQypW?=
 =?us-ascii?Q?GODuxS+B57a/xaIxVZXhN2SQw8gtkhILlSUUgdbs/t8aTmsjqW1ZsQH9lhDJ?=
 =?us-ascii?Q?RMMKf5jQL4ogufCtrK6YvJEjh5M5uXEpXq3KwaPtQmxSEbHV1OdwATZ4dWBq?=
 =?us-ascii?Q?uI3qKRj4NaycYv3plrx8snciz3PIObSJFKF1oJyjBCnKGsAVpWiaxyCzRsze?=
 =?us-ascii?Q?0qREIij79WRCGCi8x2vzIXTZZdge5YBFgtY0p7a3NNUvwXnhboBw9MNVYdgI?=
 =?us-ascii?Q?fXey6MJF0bXOUZselE/tlOrTbBicWFRWLjWzk4KDNxI8lBXL+GcJg6M6vu5l?=
 =?us-ascii?Q?2yxOgY2GKOI6NN/wc/th6C86BhuSA1IUQpDZtHqhbzBxQTdH4srjQdCCXoQE?=
 =?us-ascii?Q?VyYSCEjPoXjhYzEtU/X5tOqox2VxzaOjwIN3Cn3rc2+7VHfCyDKTNsjoZ+ch?=
 =?us-ascii?Q?zNzNQioh2OhfxPPwOgp9bza7X5hj7WT+4U3iThOzRSbhsBQ8eUIiI+SX4nRr?=
 =?us-ascii?Q?Zu4aSG17rRSAZH1Ey5qT8hilwoZFySV6CYS2mdKDVoYhpnpaMOxbL7/Njfgf?=
 =?us-ascii?Q?bnc5x6oLCnThHBX3GHFTGcfLyKhpJcT974HTfe2Caa/17dKygIN3imoK9xuf?=
 =?us-ascii?Q?AchtntZ2PYWqrj4XDxaQStBr9t6UCHGeC7gjgzFyuv6ktxzfJpQkk2/8pfBr?=
 =?us-ascii?Q?AkCSHsFIBv9tVqz/X+DxNsuTqtW7t0EB6UgXZrNFyLO/Xk6Ef3vuqH3Jjxoo?=
 =?us-ascii?Q?CdryCq9mMQ4yFlmeoWV2vVI5qXJDOZ3Qtlb4vZ3pKREMAZjOSLyEJ3WU0wC5?=
 =?us-ascii?Q?gBLRmiduBsrwOzWaz8uzBfsd7/vm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KBcixlRDP7xhcFkoyiGbCp26Fdbd6PIbg/Ov96shUgL2ciuHwvBcSgUzlqg2?=
 =?us-ascii?Q?xIotkMTLt0afoPA4HJkp88a/HAPSxvR+14n1oNj72fR2F03e+hUG98Pt8vnt?=
 =?us-ascii?Q?3CPK67mgk//9g8dyK6mu2HYmC3DllfOYB4I/TAK2maIBB1tilgh7OK63TnG4?=
 =?us-ascii?Q?OHqUp8A3SCyJ8FsKynLFtqBMmY31hd8ETVsV01CysKuYxeCD9Cy2KbT1IWf6?=
 =?us-ascii?Q?GV/9YShc1crIpabRlYMFg6IxyLXF/emx90kpG9WGf/KCs03xFuD89G9hEOjX?=
 =?us-ascii?Q?G2Iv6tvGeIDq/Tm5uYbY/GCuu6a+QsC5xKo/IrAJ8M/BtRv2pSwT2wfly8xa?=
 =?us-ascii?Q?LROxwbk1IEq/Y0ZNcfYYTLDH1r3dDXvKGij0wG2rm4XpICeA9iXLPrFnF+BR?=
 =?us-ascii?Q?Z4A/0fM7l+sRThZpbOADyXSy+zJJJKCTm9TMB0uzx8V1oVnq/RUbJ4G7pPqf?=
 =?us-ascii?Q?+UgEW9IhZjrcnCzxRJl/mUjip+iBGVF+p78dXDAUwNQiC9ahCn1ZkBqTEK3u?=
 =?us-ascii?Q?pTj9X4ANrOH3u0s8Tg6GwIHHyzi/dBxUjVa9fWTGs9MVSdGIRpa//oxAKU03?=
 =?us-ascii?Q?2st+y7hvFsRTyRiy1oI0ZHkbkx3vhNeysRoO3jvbvt5xjUtTSSYImErJKlAZ?=
 =?us-ascii?Q?cnYLlIMNVRcfJjTr4U2PbZA+woldbtYA8d2W2ZXbvNzmTLz+9t3j2vxRg2eo?=
 =?us-ascii?Q?BAJbU1EBVC5j5pieo1ur3T6IYGZhTEZx+L9aDFCS2Yqn2mG+mboWScjTPKbo?=
 =?us-ascii?Q?zS75ZdgZaTJlyg8Sne5TdRS+rjm2qMqCjYvhud4GUyTeuSxaye1ruJ0ofiw4?=
 =?us-ascii?Q?tDRyKiUiNiiPWnGEt3OuU1vYbQTYDX+NBKJERKNuJyL2ysz9bX4QVugDT9Kh?=
 =?us-ascii?Q?/qd5fSk8RIjqxwppBBw1U39B/D7qv6WWxoB31bO7+FJ+dOtIv+bwKmMsRq78?=
 =?us-ascii?Q?qWK2sg6O478mLRP3+/qAtjGOXekSRzvOoOZiXrHoJQ0H2XiJW8FgiEI2QVwN?=
 =?us-ascii?Q?/TXfTRRs5RTUopw1S798eW4xqBphja5vWvYRg5WVmTZIfd+w0zlpcail8G54?=
 =?us-ascii?Q?CpuHouioc+YTUaB54k0sIL4mGNpaI6W0PDOYfj8N9zK8i5xyup6CCSSEv4FP?=
 =?us-ascii?Q?wS4wkwX3nd87OKpnTQ+azcYsNcwBfShFkF9fPAE7dEXgvhITQaKnYYI9cyif?=
 =?us-ascii?Q?U2/zS21SP/G2PPPEtzVYbykkOdR2l656jnT4WwQTQQcUvif4K/k+UKpszyo2?=
 =?us-ascii?Q?ed/3DzDEr6eYd+pLX8wzpBHulVhJHaNAP6qI1MQqYnj8/hUEV4ojoAQfNgtv?=
 =?us-ascii?Q?IUlBo9cDXkpzwfoaOnNUQLZ4R1eyK4boKX3XcJ6O6LKXwED9A8jpEVkAxQ13?=
 =?us-ascii?Q?xEkea2UzZGZTFlceqF60ZeW5HDPUv1AKz96gLXUvRG3q/wpoykggcWgdVMPx?=
 =?us-ascii?Q?ScMzhZQc4Vx8/Zrf1EKeKw7CoKXrSagTWejCpwis14Ab58qR5GQtVGBGkoGA?=
 =?us-ascii?Q?d79zWmRmAG7aXdf8HmHTNfRvdjct6cPDxTlxGV6DvkOX/Br2Upjp1MY/nZb5?=
 =?us-ascii?Q?grhOk4yKXAdPckRRY4jCRA6V82ji++3P0aA23BLo?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839a9bef-801d-4880-ec54-08dd30a90255
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 12:27:40.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/WTJi59c11X9IqmhhlQvG2lLO0ofj8doagapZd54wE6LO9RlKSqxQ3R+VXqwdn0/5NAlZoBVXgMb+w95Xzgaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_042749_059443_EDDD6DF9 
X-CRM114-Status: GOOD (  20.56  )
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

Hi Suzuki,

> On 09/01/2025 12:01, Yeoreum Yun wrote:
> > Hi Suzuki,
> >
> > > Is it not better to have separate "configs" for perf and sysfs ?
> > > And etmX driver can populate the "running" config, based on the
> > > mode specific config. That way, the configs can be updated
> > > independently without affecting the running config or the perf one.
> > >
> >
> > That was i've tried but I've accepted Mike's opinion that
> > it's enough to check whether CS_MODE_DISABLED via coresight_get_mode()
> > in *_store().
> >
> > "the .._store functions in sysfs should use coresight_get_mode() to ensure
> > this is set to CS_MODE_DISABLED before altering the config,
> > which ensures that the trace system is inactive.
> > We don't' really care about reading the config if trace is running."
>
> There are two issues with that :
>
> 1. Sprinkling the get_mode call in each sysfs stor function doesn't look
> good to me.
>
> 2. Someone preparing for a sysfs session must not be prevented from doing so
> just because there is a perf session running.
>

I agree. okay. I've posted with separate configuration.
Thanks!

