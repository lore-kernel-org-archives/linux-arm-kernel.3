Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB425C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 18:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Content-Type:Date:Content-Transfer-Encoding:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mv9nlxyAcur6UGMMGd17nyjswra1Fx4+QDbDgpw56GQ=; b=ntGPYbapla46gy6f8uBUhjhvTp
	83Ad1F46s+TS9LHNZXeGn+rI1tC28H7y/0sfTW4rVgT703AlPI7frvsjz0rc18Uc4FdgJcI+EczKZ
	3bp6Df/SdjOeDA2zBB2Lc+10gRPMr1UVBWqTfM67FMTObqjeoN2Wutm528ZOjrG7hN3zrQqOlzc8k
	Edg7JO2S2T8FFeDp6c01AF0/V7h2z3gvnN82Dr03JeXdU7pwI9iFkK6J7ErpMRHf0fwD9nXgwPAiu
	qRBoVA2znWcucnrzcIE0EMtvvEVa5iMmfknEIdwscx0MduLR6yUmbxw55Sz8pugjZ9OnrdlfDMano
	oZAwjvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taf5B-0000000Ax1m-1Rev;
	Wed, 22 Jan 2025 18:04:05 +0000
Received: from mail-centralindiaazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c408::1] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taf3u-0000000AwrD-0K8q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 18:02:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4qXzN3DtJS59iFLJY8RA/32Ba4+Libgdqf7ifZwAG8EuuQ1lS1RQWcAFfBlvaNrRFIYngVueVqiIHZhe/4UnNtdAnqlQB9GqiVYIrF4aExcYUv/xpZIbEgGp4fJsSMe3tjDcxlv1AKO+G8iRDRbVSAKdCImq2Lfp5awchKwhOwuIq7yyDtfmmsUhm1Ljgr0q2Vkb3yNleOr5oRGQWTc0pDByC+MisVYqSc1WJSnTgvOAym/7Ksrwhu/OYnIuMBVI6LJ2GahRvkwfATXam3UeEIAGUX/82weOw6d+HUCG4dBl9T3KuWN9SrBB43SR6pUuxHIKrsjQmumXE79Qq1mDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mv9nlxyAcur6UGMMGd17nyjswra1Fx4+QDbDgpw56GQ=;
 b=rj8qNe3/sqqBPlRS9Mxztt0OSNMlfYCNiBN4/huM3P+xxB8felnXDs8FUr7iRQgqahyJNCje2CpM6RzyPnEQxmgFu5yuR/zDof7TpxsLI4hdk02B42RxMFstSA7rZD0xvKfqW+tuoUzFEXF9BDsvTCRvXTZaLfKVjf1SVm/uRwUJC2yvtCG9Hn7NHs9tUA7ecj9m8NAby5rLaT3eekpFkjzJo76103FVwNaKwuBF4iSodkx0wizQZ52mOqi6vDLLIxKkYksUkhmRi0uv1l/cR62gtnmOpm7rugXpS4l07g0wROCsfcthkpZT+gww2CN3c9L/7ZKDe1btDdD1j0YP9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bizeventsphere.info; dmarc=pass action=none
 header.from=bizeventsphere.info; dkim=pass header.d=bizeventsphere.info;
 arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bizeventsphere.info;
Received: from PN3P287MB1148.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:173::8)
 by PN3PPF449796CF0.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 18:02:22 +0000
Received: from PN3P287MB1148.INDP287.PROD.OUTLOOK.COM
 ([fe80::3ab2:20c3:9818:dbd5]) by PN3P287MB1148.INDP287.PROD.OUTLOOK.COM
 ([fe80::3ab2:20c3:9818:dbd5%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 18:02:22 +0000
From: riley.vega@bizeventsphere.info
To: linux-arm-kernel@lists.infradead.org
Subject: Lists - Automechanika Shanghai 2024
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jan 2025 18:02:15 +0000
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0441.namprd03.prod.outlook.com
 (2603:10b6:610:10e::34) To PN3P287MB1148.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:173::8)
Message-ID: <PN3P287MB1148CE555C256B1433A13E358EE12@PN3P287MB1148.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1148:EE_|PN3PPF449796CF0:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf8a6a3-9e6c-42f4-b2ed-08dd3b0eeb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f0AA+0j3nxJGAVMjdv0AuLs2vYcRSCH+1bcZBvKN6r3jn1g6vxTlyK9diWLg?=
 =?us-ascii?Q?vPkEHtI3zOIX+i7TOAoykdERlWK33H2ryaRmqreeOanaU259D2qQP0m9epps?=
 =?us-ascii?Q?2j3UaUAdNzlDqneYDfP1aHPyvs9Wss+BJI5oFKX5RUNwFcnZzd99hrrkHJv3?=
 =?us-ascii?Q?slhuZb+AEKUs4kJCOE+y9hkMHBWCCilG0wt79abRnS/gsDJoy42PJ1GZpmNO?=
 =?us-ascii?Q?XtwQ6CtCkT7FZVYYOyuu1euY1SvFuckq90KWdX3S5sYQa43jibygOGjbLVCV?=
 =?us-ascii?Q?Z+G32drDAbg56yesSvNxKYCHQ6Ion8zYIBAI6txoIYBCmWspPh5k5eq02O2D?=
 =?us-ascii?Q?RQPCeCNQ3pwXz+Yc/pG3HN6/R10cZ9gAj+M2RK65Kt4k1RphTjd79gz5UiTi?=
 =?us-ascii?Q?mciYMHaQLJNLH4DRh+wvQj3Z0IbUfbSt8OfiTUMpAr7GWcdVVWalsLWv543D?=
 =?us-ascii?Q?qIWeTBHFzsdrBYnzuCPUa964NCsBc2N7pMojj8/qbYiL9cUoYJCl2BIY+8DL?=
 =?us-ascii?Q?VKrvBLp5/Rx5KnXtWYJ9XixkFl1wFIUoWJe6AKLoe1Bo8pcIWmyL/omk/Ube?=
 =?us-ascii?Q?DAYQIfpvH7tYWwtCP8wwoe+QI4VeUQeOoabVffehEMR4iYVzJ8zreS+EFRx/?=
 =?us-ascii?Q?GXaFo8NB7nru6tps3yLWveBxE/Ce/LmVf9liT8f7wdt42jWJtpmc5BPuismi?=
 =?us-ascii?Q?6fURZOkiUMCFSaej4hCRCEcx8IPLFzG7vY2VKr6Y5nDeWxxRAtcxa1nNJF/d?=
 =?us-ascii?Q?8QCWyzI2Nwsgr0atDtZJxgEa34kN38Cv7e5JgTDjiH35LkW3dy5lOwvwLIv4?=
 =?us-ascii?Q?JP6yinjKnYVUmkEUdOK6jO3pyIbsiF9AJCqCUKZi7VMIuY9lu1k5XC587bii?=
 =?us-ascii?Q?FKZs7j/pZXTUQqq2zhlnWYWF1NgK7nnouGpb6Q/VSEzEtAECiCnGp+tPP1EM?=
 =?us-ascii?Q?lYwEf3SEtsnupLQmo8t2fbOe6QwjNe44XdWAiiU+yyX4gax3X5GiIA4tZjqd?=
 =?us-ascii?Q?iZZMsEcbNEGhSWk9xIiR2bse0Olr9Y1N3EzVhKQNEKiSvQMyQN0YowdlfAc0?=
 =?us-ascii?Q?s3gj2TWcH1Dje/9dvud7xFrTm3VCw6mnj9MgNP6RDVcKXWavfe2k1VwhoMzE?=
 =?us-ascii?Q?w30KdGzO7NWxu1AG5Iyj5QkeBJkEW44W9RzrX5N2H1c0Tx4r071ev/u9CAKU?=
 =?us-ascii?Q?uCLIVphhN02YQl8Tj4fXGzyiQnDPcH6TJk5DE5slMakjMLxDZRh2sC9XzfmK?=
 =?us-ascii?Q?LVxorcXK33KXFNgwiUbkOlkp8uFej3HyAyRSzT4Pkvey6oVNMEbPeU5CbBHH?=
 =?us-ascii?Q?Xyr/rZkKpDHO+SaumSHjVptrAGqqGH3XQ30SI/+7lmhNLQHS+4Ni4+Tnjbxs?=
 =?us-ascii?Q?GU0oe1Gg6OJ9/AtdR4tznzzMyszL2m0ng2SLu//miYi9c51yxJhk+vfKHMst?=
 =?us-ascii?Q?GajejY4S8hXXe7KkWnhOHakrZwVAE/eM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1148.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PHE+ZDknmfhMG0bYlv+zw7KCNgEA6d2KqgEvIRlTiP8T5dKbsZiAWu6gtvPX?=
 =?us-ascii?Q?5zRXgOT5hOrn6H+2zqpTIAbBwGa91/Xt98gi7riEIAMcjiWoSOi1hhi5v2z3?=
 =?us-ascii?Q?NoHNU3A+5Cl5puFzvP1l50d3QiDkaYsyxxL4eD7BtCTL3Fi1/+ZYOtqWYf+H?=
 =?us-ascii?Q?EOpwvmWhvpU8Qf9I04ncPju6CftQjRAF8z3/hA2GG15ucX1XhrRyCxRTxDU5?=
 =?us-ascii?Q?DKliQaesySe/DEucF+lr0ZiWgOTgea9VnoH1PPM92VAdyjusfXXYp6rnJXYo?=
 =?us-ascii?Q?WVqFM2C+b8h9U5Sn4AeDHAEcVJBr3w9EbFTB5qjDxRIoBd7DBdlr+FBL5cvv?=
 =?us-ascii?Q?dkhbBrywo7okNB6pnSdgoWomIJSncguxn7il7NtpZgjhF2d4BSLQY0IU/jKX?=
 =?us-ascii?Q?ydjkgEMu5Hu5X6BA3Pf7M+pekvZhbhD7bS6ir5fSbVIeK1fwAbqCXHuMNhog?=
 =?us-ascii?Q?cznKMdIP2g33oXytx/Xk9oe/NOFrrh5GlwMciEk7JgAErD4XaAY9CxBqzKbq?=
 =?us-ascii?Q?FDkHbCYIp6uTJIbxtnWhfryc3MehcKerCOFfISo5Mt9Y8a3qyEiz7c+lAyrK?=
 =?us-ascii?Q?j792zcvySnfBiW3h2niUKQWrzsiDJZmIUVN3pUb3u/ekvhNgPxtU9H86ijBK?=
 =?us-ascii?Q?B/tvAUwQu31OrdOCEW9mljgOnNYDD9XNVWNFKtdfvVSzRQirS9qOK+VlB1lx?=
 =?us-ascii?Q?rSOrPpc/cfOmC2+3A/6yWB/GLQw+0qnWtR/x6iOJbW7m932YuYiA8m71Wo76?=
 =?us-ascii?Q?2kpfu8ps7x9FKkHxB06+Z3SI++YTdjrdGrzBwt/b4rmKRyD1zvzOKVc8CWmq?=
 =?us-ascii?Q?UXn7kcbaqk63ay0lK/FJtLkS3tetF/u2iQnKpE1/1ROTKgOWkVjpnRIrRaTO?=
 =?us-ascii?Q?NNt3mVIBZdEMDHuloY9yeIsRZtNSCGQ3c+8fZtoORRjQC9by69W+6FLDgXIm?=
 =?us-ascii?Q?mxPJ780ueY+0DlODyMVhFDP+CgERDA50atIoJY2jSYzXcCBl2UHuYfw+nSuC?=
 =?us-ascii?Q?aw+2YYnld9CN81weULreKKCX+WYAPBfx/2vFXRUUIipeQ+wEdaWkHg1MUbGU?=
 =?us-ascii?Q?zZpZpr6aJemK+8pBdrtt08Kpkn79nr/DT4T6Bo04T2TzqaQ+wVJQw9RO0XDk?=
 =?us-ascii?Q?uMnc1Teiy/T3/nVE1uaz8+4WhLb529oRQiYa17oND44rtGxlKMULzTyjx4pg?=
 =?us-ascii?Q?/D6w7QhPG1WFjPm0x7SOkoUUOvR4aeGlOtS28LgQU6J6x9JmhtFt5dyUtWJu?=
 =?us-ascii?Q?KrUknEQmytvsmB1odW7VOuCvRVgMZAg2M8WdkuszMBTHTwz6nM9Cbsp45pbI?=
 =?us-ascii?Q?dqw6PIDIYO0/v9l92Bvo0nRHm9Y0ETULC2rv4Mwl3fTRQt194AjF71fvzo20?=
 =?us-ascii?Q?ES26Ub3B7p7NjTASqar2gUVSq4VqFYmx91/IISurG8vxdGau7EAiDfqNh2ir?=
 =?us-ascii?Q?Tua6U4wdMvEOooY9yYyjOXXLlVAhkD/mnv7ladaxaV4Z/GJ5Ygw7HtlC4IHo?=
 =?us-ascii?Q?yP/Qvq0HoADGFSbcaNxUl6/9Sw2Mob3bioThEeixOKLXU0vba1LNdBYE/vTT?=
 =?us-ascii?Q?YMtf+yLRDnmNftk8ua26HA04gTGERjBwyRosTR0SB16OZX+xHlnx33zlQbCt?=
 =?us-ascii?Q?LComXp1+eYLJyK04SEZy6OY=3D?=
X-OriginatorOrg: bizeventsphere.info
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf8a6a3-9e6c-42f4-b2ed-08dd3b0eeb1b
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1148.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 18:02:22.0753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e3bbecd6-c312-4565-8fed-8287774e1a85
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cf0QqgbDFRZywIEcdOhOTmMkDbiQULkX5oPdggVZ6us4kQ9E9mhBgGBH59oDl0/tsqB+AmPJa641yJZChUOxJFfeWRWDICGAbp7mXE2YhwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF449796CF0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_100246_112736_87E2A970 
X-CRM114-Status: UNSURE (   3.41  )
X-CRM114-Notice: Please train this message.
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

Hi,

Firstly, I wish you a very happy and successful year 2025.

Real quick, I was wondering if you would be interested in purchasing the co=
ntacts of visitors from AUTOMECHANIKA SHANGHAI 2024, below are the details =
of the show.

AUTOMECHANIKA SHANGHAI 2024
02-05 Dec 2024
45871 Visitors/Attendees

If this interests you, I'll provide you with the full details.

Awaiting your response.

Best regards,
Riley Vega
Marketing Executive
Business Events Company
United States
If not interested, instead of marking spam, please reply with remove and we=
 make sure you do not receive an email from our company.


