Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56158CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uw7qXrRPOLPrxUMvNOLVySg32dynLBzzOt4WxUn8fhU=; b=fA4l1wfhkAns/6K0WixYEL5nEW
	cvH+4IV17FiVIFADykpKUvdp+0yIo94jVJxcIK8rFsu1WEuxQyghLYM83hGgf9WqlRQMiC1qqhL73
	3Yz8F4q2KLgLso0Rr/XuNfylmsVj0TlsPbWDYk7lvKboUsxtCwLexJtLU2kEWBAUcDUZ1bYeyBYjo
	M83s2/V7i50u56Le0Ub2ViUIdkQqukxV33qzA/C/68/JDTugtBpLJSxNa6fZ/yVTpOu/RZUwvglVN
	3fhvLurs/Yfl9ZspB1VI/zQUeVrg7PoTC0FWN7cNgGUhW+xhDvJAM7k92a1CMyyPr2OWLr11GM+KC
	uEdewCsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiBw-0000000Ejnx-1Emk;
	Wed, 03 Jun 2026 09:47:16 +0000
Received: from mail-eastusazon11012050.outbound.protection.outlook.com ([52.101.53.50] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiBt-0000000EjnW-2b3g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:47:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+XZUcdtzMxmu/BpyqsqzwxaLSSJ4eMEG+oO71MYS227Ek+Lw13Z/dInwt6QLUMnYc39hXyUvOici2w70wYZjv05xDD5Z4Heyey3hxpowlrSD6kRle3Pwr+UvuucKCsHhut1RzIOunORRtDkw9QoYScyOYIlgWOyIZQFqKQRonZZUT3XGabEz7xD1teyvhwwwT2jWcZoYnpyWDjszkJ0x3ynRNCwGwzvqdKuNChpnA25g7mBFZ+sfrgY+mwnFPwx9/IhHlLJjV+0iLTRm5yMPhtR1y8QfzptlNKYCNmkHE7ZZuAsszSgLbGDylj/rxasBEafLPAqbR7rFKCpq/b/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uw7qXrRPOLPrxUMvNOLVySg32dynLBzzOt4WxUn8fhU=;
 b=yzUZUeotvMYSluCw769svV5c2zZ5lShe1DCReLh9SBN0IiT9DlQshsiO6AJVte+F3WnXZuXAjet71QbGVLOzoJMnwz6BsVALXMwMChXGN6++nkhcDaSKNmi5J1kW3YGMVoePPjJlRZifgit5AnxHUyCAJmL+0IObAWnItTtjRfURIB8wV5Hs22rxQ26Fi9gXz6vXbO1ze/uYGfPwb7PlEe76Jag5JyVs+DwBzjJPXTShoSix3HnZeZC/P/5m0EcWa2mlEnQRSe09mh1TA8yJe36t6KphjAjV6BPdXS00Uvb7BxxoIF6NKsO6Z8EzD1ryOFltwYdUYdDzEmk7VmEF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw7qXrRPOLPrxUMvNOLVySg32dynLBzzOt4WxUn8fhU=;
 b=cFx92HozRJj/niNrAkNfW8/8FLo0kLisQzrSl4r6S5LzmvaN1npepbNw84MCmHFloX4O5I3usG15ijdVsYNEl5Lf5RzE62hcOIF3aCsQ3IALTCu8/Bw/cu64EGj1C9DuGFnI6OCuQOJ3TS1eC8Xd1aNwmDG3zcvbCr4FbvOv0swuLLBf7c8nS+bhvPGPT8d/NynZ1PFtWQGU7huh1uRAF7kyZvV/hZ3Kdm3eWpESyEzsLKeTuG4Nf/KWcgcrmuM6jwfN7ZRvl7VDqQOiePgdiG5ToOedgRBhtf88Vtc30nDBTMg6ZFKzoVnCUqcTIydrQZvpISUJaZAGPw46DH9mSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:47:08 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 09:47:08 +0000
Date: Wed, 3 Jun 2026 17:47:00 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Theodore Ts'o <tytso@mit.edu>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: configs: Drop duplicated CONFIG_EXT4_FS
Message-ID: <ah_3BtqexORj57-2@MWDK4CY14F>
References: <20260603072726.19404-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ah_sf1lIBD8UcOHs@MWDK4CY14F>
 <ccd048c2-ee82-481a-b948-9f5e5e114c25@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccd048c2-ee82-481a-b948-9f5e5e114c25@kernel.org>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 83a97bee-f394-4dbc-9d1f-08dec1551372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: rxojcFXtUYDvvpT4QmIQpjsoM6+CbeI4DkpqD1BKGHUDH7z3uBiCxJmyMHcUOWQMjm5oHBVXlzEU1R/1/0pjcNc3LKTPbG3yzccGraBZQGvTtfaJhMaB4vND5kcJptQiwxCAETfpKUpiBmnaAatONHueud+zm4px85crUDVoogrZRtGsVQfsMsuM2PGiXhEpn82EPj5i7MRWwp5V8Puqe0Wb0FuTm5ijJoODIQpTsWiSQdAMYcUGixUrBV9uoXTn30pslljJ8bMsvVTVK/l/EggzZSoD/8ZRPPI+Nwl9Yw/s78nNtEfPm/EdevfAMZlhN0p67xKd9dLL5NEeOb5fPl937r835YuYkKgcmCvLOAeofjkziSJsdicpE54Ot/TVyoJjxrXE56cqgwJLXyKlEj3Nddq0WsWhoYCJ2d4+YjMIuVf+eahpdhA36bsnQ57mmlLOBrn2obkhljTsC6x8Re8FxLY/hrcuCBAmSEidQMp/NM259LBahD0+4x7LNg5yUzTI1rYzO7HjPkQxLjli9sLZy0g6vCVNzvoL3RNX/bYi5evD6OL8mYd7QbGNmZupzRFUsN5fLiGLLEed+wRPme8fUeIpTwGh6wqwdpDUMpCe7eq3rq8bhQxN/HJ2Prbkq77r2QLs/9QNe5RMsxOd+ax0uXNhWGSVr5UXK34cX0CREU40RW0KYn7C8gS+sbLY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TmxyQ902QZs4m+PeaVD51Xef2STamVUIvVW6hU2XKwl8ZMUk6ePmYG6mPVzp?=
 =?us-ascii?Q?7emjua43nhDR8VJTNOSfWV2uaiQmt9WaIQEpxMR7vvtXZgNxiGZ+uyMy5oJa?=
 =?us-ascii?Q?8HwOF9MiP8uK8dPcQ9NSheA2bDWHuIsfNr9fU19V8RREKrH5peHSoRb7s9Ke?=
 =?us-ascii?Q?YUJYqYX6zmb/EuN0O/YOl4TcoJk9T0+tfy6AWF2UKMe4zHhvdm9u++FmB7+7?=
 =?us-ascii?Q?64c/TuyFaPsTNu9btCC3WDVfc8wGUv4WMx6Gm6tNSKgO2K1P6MNYuKkgpFUU?=
 =?us-ascii?Q?tVdDOOLJ7EFGXWyjw7uq6mfrLNcKvgWsZG+UVTjdwGTDKqyMQpm5xfZce5bv?=
 =?us-ascii?Q?wLlUX/HsPSiUyBv27Em+YY/zI4myaPrcfMMEqb5SAEHOOKWETfdpmxn1oSgY?=
 =?us-ascii?Q?Y7gRHxym2n5v4wW/0OLAIt3rSRbmwaHwgsUj85dU4T+kGg4rxcn7WjU4TBiS?=
 =?us-ascii?Q?3TbAHDCq/cyH+xkAGMqmh4HtmOM/hdRnuCD/eusiUXbzB9pAlNlzvUbyRYYb?=
 =?us-ascii?Q?kTZgMi558/MyF+doErFusu4w/KP2onOGrre6eAEIQVjUvw7jeflLQRbhfaIl?=
 =?us-ascii?Q?DmFUubrLgqhvGZj8Jb8/MQiumEmIb9NRsC0gH9RFE4FbohhvD8z8+91gk1ZN?=
 =?us-ascii?Q?4dhpJ1R7vjN5JWXJaBd15vYzRTIdVoTkImHNWdiH4ie3G9jkDeHzQA3iaI/Q?=
 =?us-ascii?Q?PZ9q8/IfZWQ9rbheIxHniT4wzppCevwNB1fq9Cq0GENlS8DJyQrvrXkYi41u?=
 =?us-ascii?Q?wVvuoLZ32MQqW7P5eCLitmXILPgTulPolwpiRK4og6nsOHXwGtMhdmhk05Jd?=
 =?us-ascii?Q?BEQpnr723mEyH3WIORgOCB19Y5L/ZP2nWZVDY26lsH2i1jCGWc36CCUWYTIb?=
 =?us-ascii?Q?zpcyCAPrrZdS/mk2GgU7clJYyTGf4kECun5EB78OYpfBRJKwTMSfsbYHlNPV?=
 =?us-ascii?Q?KtgnTFY2kbcJQUtWZOfCso3I9RbuKTRTXASYVOTzGQGDuKMvv13/Fj0ZoF7U?=
 =?us-ascii?Q?AYw2R/DZ54AxpVYIwvkgOeEJyo7SQ1QZ9KtWT88/JS4RvULX2aSkH3+bw8q0?=
 =?us-ascii?Q?WR9IKeHVjKfeRr+wbnquRjxkX2kGQvQvOg5VKbseVHP1SOB2NbgtMJF9cK3K?=
 =?us-ascii?Q?nHC7DiIOK3ZjhhIpftavLO3lAtyFrNnkPqFP7cKyTCfcii3fnSd3OoKd2APs?=
 =?us-ascii?Q?eukSHCcYkUfBX86GJ1Qn1G0uiAZEGZAMdAjsAZXuMzJnV9dymk40flzruWis?=
 =?us-ascii?Q?weFZPePCXNLOtGGPZzvCFkcUscNaty5KwlbCt7WjPM52PqVnO/f4DqPrjPKp?=
 =?us-ascii?Q?OcuriTPsgaSrMEFBzyUAbr5GKPAlSqQLPInPs5UT+IBPo6nhwMJPKHaQq4e+?=
 =?us-ascii?Q?epOrIlF01O+d92OySIFI9ujONLReirqym2avsDE7897+8NrMn8xyRMh9St4D?=
 =?us-ascii?Q?JPUnYo5vOkP/dbKQ3PHpGJWywEkKqM6ZskjP8KEpqh43Z6SjvpwPPlvv+muj?=
 =?us-ascii?Q?7LT3s6t8SpsvIf1m3RZwCHy7WjqRnwp/jY6BXo/WxdMJ+s310+W0nmC/Jnmw?=
 =?us-ascii?Q?uvBt5HfOj1ggYNDLnsEcAzFOv8Ff2iayQbWqvIFNdcaVISK3ne3xXHQWKTmL?=
 =?us-ascii?Q?YyyJY3pvi/Ortx3Y+6Mjjhkc7zeCpWALE2uBuofOSu3dkLsdd3ep4TmO101j?=
 =?us-ascii?Q?i9om1XJWicMj+FgKanzDkxkO0BvIuo3Qsur4lhE9qBlEnDJFri01b1uR3Yus?=
 =?us-ascii?Q?9PapsAKnfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a97bee-f394-4dbc-9d1f-08dec1551372
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:47:08.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVWA/RCkvWvrRjcMBBceqPorWGRkU4HYTWGmycen6f3O3qEDTgs+FTutnL6YOUqKi5xHN+JhgxQLqs/yldIf+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_024713_661039_F98B6892 
X-CRM114-Status: GOOD (  14.83  )
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

On Wed, Jun 03, 2026 at 11:12:45AM +0800, Krzysztof Kozlowski wrote:
> On 03/06/2026 10:59, Richard Cheng wrote:
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.
>
> >> -- 
> >> 2.53.0
> >>
> >>
> > 
> > Hi Krzysztof,
> > 
> > LGTM.
> > Though I wonder which compiler did you use and how did you encounter
> > the warning? on what system if you may share with us?
> 
> I am confused with above questions and it feels like the review might
> not be applicable in such case. You do understand this is a defconfig?
> 

Hi Krzysztof,

You're right, my mistake. I conflated it with a compiler diagnostic.
The warning comes from Kconfig, so it reproduces on any host that run
the corresponding defconfig, regardless of the toolchain.
The questions don't apply.

Best regards,
Richard Cheng.


