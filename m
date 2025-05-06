Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FCCC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxxykNdg59t181owqQ4RUWtBGJ5yK1IONveQdMPC5Yk=; b=dgvpL74sfD/VVY45w5UKb8oc/j
	sDOkhTLXVueyj0ST6zvucqxhK0GDlv6f/o/3VZZNx8OcWWAON8W1hy7LISbwt6bFgtw6l0aYQEUtE
	rm4V0o2czd5O2S1iPj5ZKH2uVo/ANBGNzYws10hIraACiR5785/D50n0KHxCxoVRk6i1cdU34fXgq
	/7VT+Z2LzAueh9lx6s9ZT1yxaUnYf+Taunxc9kFoP6y6U8Vm/NsMxe7lCK0Y/YUNqhsRNJDtY3oQq
	Lwag1O0+vrA3k0jplPlpZhtfjKKwkMX41Xz3k7nS7pnkWCNSTE+7HIHGHQezFDUOIqVtQjPVVZgxp
	hwYl2LmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGyg-0000000BpdH-1Lcb;
	Tue, 06 May 2025 12:00:50 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCETm-0000000BLAj-3okL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:20:48 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5460Gxf4009174;
	Tue, 6 May 2025 04:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vxxykNdg59t181owqQ
	4RUWtBGJ5yK1IONveQdMPC5Yk=; b=MG0QX6wlVLpGTkvKQA3h1ObTmYSeX8ak2k
	E8Tt2UX8M+88qHrEjfcv9pIxqlneWGG3p3VtZcdBmVTREgChQ/sqaLKT99BoN7Us
	PUg3jtiCuy1+SQUed9RHoU2P059ASTK9R+EfgDH4V6bHV/rSvIpzfYvjllleaNBP
	fnDK71IPGUfgxuJ11K1TYSbiqAS5iMfhue1ueeOOSF8jPy3gkqe6SEk/pCXj2iBU
	nGPjSLuteHUdGi0kRp6fVJVjoFqIXfpceOSB47z6YxoKNMKeHK89lGe+nc8BpI62
	CSXGMg4vfzpi8ZYlBSPRzYwAgwQsOSK17uteFpfEweA8qDG5itcQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46ew4n9cdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 04:20:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDb9nh8iFwmkzxaZVEIKPBmcipeHwE53mpd8N/Kw9wicVvP9Wk0VaZkpiSfMuNWIiwNwocWgfjSLXd1tPxpuyJ/kL0T94FQk3Mq9nVtOq7a36kdWzw9y1TkKLVjCDOczg+PGW0yfVTDjKrEDQZB2qA6Ms3aLJQwx2fXcTSj7Dhb2HnPuNXAr6zvrYCNwL7BedYFhpFF1QGWc+4ILa4n91171hbbKFPlwL+ioJ+p6rypqjxyWpMc1D6ygEmp+W5rwFwmXt9bdjCU1WSfFsyPdBl8bIo+TqpipV2wWOsAHbulq0Z9LIBxBkbBSNHGaa7uu6ulPpW/3zlv7PvTDV+/Gfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxxykNdg59t181owqQ4RUWtBGJ5yK1IONveQdMPC5Yk=;
 b=BH1bxx8LkvuTU7dtvavj2Ia78+RyZduQ4l9/iLWDplBZKMw5zY9Xi3gOIfjxLi26+CzyDH6HNun3TLvJiRT99/+vq/dKIsEc5e9XPM8msu8M/8yO3saBeRM/6+qNdgqu59frFJJnXlWg8lijIZ3jkTmfkn9IZJNYHkPXBsU7CVvlUSbiK/O3krt7SJ0S2zGyV7WQLYwPnaBmV5LELgWmJROg2gb34Q0ex5CTTPjznQRpEWLO+Vt0d9088ldH0T7vJC5/VSNjxFn6o3L14PIQpybVGPziRicDDvQtlVvG2cdAIA9qq7ybIrKIb1AmaUrSmZAnRmRRrvjHnO+RVxEvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxxykNdg59t181owqQ4RUWtBGJ5yK1IONveQdMPC5Yk=;
 b=af6PxPVWZFNx0ZdPCVzvkJn7t9GvpP/88iQaO4WTeHE70IAqCOQRiICsOC0HROP0gsEmsmlJzNWaHnpEVuC6pOhsuHIk44NcCghPChsM6thDE3yRC0Pm6DNexDO2rYKZ1tlwitovEiQnY6d3ZKJ2AwsGOtaf5CFVzc6iNgOVjzM=
Received: from DS7P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::6) by
 PH7PR19MB6531.namprd19.prod.outlook.com (2603:10b6:510:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.22; Tue, 6 May 2025 09:20:28 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:8:1ca:cafe::11) by DS7P220CA0001.outlook.office365.com
 (2603:10b6:8:1ca::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Tue,
 6 May 2025 09:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 09:20:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 59C5E406547;
	Tue,  6 May 2025 09:20:25 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 31129820270;
	Tue,  6 May 2025 09:20:25 +0000 (UTC)
Date: Tue, 6 May 2025 10:20:24 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 05/12] gpio: madera: use new GPIO line value setter
 callbacks
Message-ID: <aBnUWP0beLwAU19Q@opensource.cirrus.com>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
 <20250506-gpiochip-set-rv-gpio-part3-v1-5-0fbdea5a9667@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-gpiochip-set-rv-gpio-part3-v1-5-0fbdea5a9667@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|PH7PR19MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ffb657-9e58-417e-d413-08dd8c7f3cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Off82oPtOrfASdGKEstqtPCWCR6At7HqsTuCOSnHIURFSBSi+ALngrR8hzIV?=
 =?us-ascii?Q?ohQGyhnbGoQf7i0JqaWxdtZvfsqyLJw/FzYeBLgcptH5epgeNhxThAhQzDaY?=
 =?us-ascii?Q?VhAWGulvOpq66TqGUfNhxjAyQhsZkGrkL1rWZt5Q3vrrEiaMI9+6ACDUQpTF?=
 =?us-ascii?Q?40WhrKEJUDxAnglhm+HTGOk1qCOmxgmHEi0H+MPCjyByYMbgy24+tFWjHmQY?=
 =?us-ascii?Q?UULkqPFixVR1MJTvJzTOcE9SszCQnOvS5pSGNquiqnWmxOKYpUQJQrxTsdbG?=
 =?us-ascii?Q?WmDeQ/zV8cTDlkrnsL+MvSpT9zmh+gqPxj8fUTUjppUdR+bHW4HjbFnkGe1k?=
 =?us-ascii?Q?1pCv5RaxeNYPFaJ/Y7Q1RwCPFAOjYTgnAKL/91PQvYzuQ+2GFafPIBMNksec?=
 =?us-ascii?Q?5keK7mnDVdkuCdsaFy7gFee8mW8s37CNr05oLE8XZy95mBpIDLkv0a1nSRYy?=
 =?us-ascii?Q?PiQWPLsi2Y+qSO3CSrFhsF8W4z1FnX1aXp41uN2my4w/z1Kx1WcGwhmhzpCD?=
 =?us-ascii?Q?xJGeuPC661pv+IJCloDitHjZYSt1+yOB7aXSO2MIqEh42OTQ9uIPBlxAzZ7C?=
 =?us-ascii?Q?JJX1WkczqSpoG+ZQe2Q3ssreNfA1UAghyscfmDG/EXsguVnU6RoI4W8Q2HEt?=
 =?us-ascii?Q?ALUEK5Tp3qBvLwxuHEijmm184xmKnNRl5lMsivstpj2o7BQpM9F9ZdlFDuwx?=
 =?us-ascii?Q?i4WNX4M/pKzFv9YgxUSCZbFG7pX+3E307TFggRjXOzXAZskybazmEzJ1kML2?=
 =?us-ascii?Q?o3EbLiwriYwMKnYrHWQ8BO2Ehr9uEU0hzhyeH/xDiI6WnEQOlmhziZrhU3wN?=
 =?us-ascii?Q?v7hw05H4fahpSl8KLb13x/yYNQNMRElvAi+5QP/4ihm8PGnVTPW8q9fYMc3r?=
 =?us-ascii?Q?L2lnaubmlzEEOmJ01MmYWHvyp0gwD4aikN+fWtrIir0ndj3JVhGU2LX8zMBI?=
 =?us-ascii?Q?ImJ7lgv+xFj4ln1Tv1sYhH1+23hDNtKoiN7GV2lt9DXuA5Ksclgmj/nXI5eS?=
 =?us-ascii?Q?cXTFdMqMzp9qgxQ5OkdtTj0gngfkHaOwXa41yJCmfD9gC6iStHJbRCVQKO1v?=
 =?us-ascii?Q?oiOMCUdmzW+H/jAFqlzhtrUfSczvtirdRJn1YI5F/eRMRWcBE80EoGsmd/GF?=
 =?us-ascii?Q?ApLDYHm7cvuOy/MYuKvTC1HBVBuXJax8bYSRHgeO+4DZvqXXsk00Lhduq7p7?=
 =?us-ascii?Q?buZPfKpscyfUsmExLo0Jb+GaUI5GKzj+002WALD9yBsBiRXiltcRQvQrhJfV?=
 =?us-ascii?Q?szgLdih3TET8y6U5XFV+HC2WRMOZG3iOIYDvrSRUllSc0tZN0fIV/bGopqPL?=
 =?us-ascii?Q?7k08AEIZ6FqjcBj8kwpRp/mu2EH2ux4r5FgUmjeOXn5PZiNcz6AXk9HOS4b4?=
 =?us-ascii?Q?ehOzaqIJEtm/OeHd5n3ftB7zkjte/hk4/UCUV31aH/m31a8w5D4+36YyWNqb?=
 =?us-ascii?Q?mGZGf5F/Qs3ovNhGDlmBZP/U3urhHSGI/Qt+1faKOmERz1se6yprejfKMYWR?=
 =?us-ascii?Q?6rglebfko+aw6+UavzMD6wyHqhwTH0Eg3YTA?=
X-Forefront-Antispam-Report: CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:20:26.4780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ffb657-9e58-417e-d413-08dd8c7f3cf0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6531
X-Authority-Analysis: v=2.4 cv=KoJN2XWN c=1 sm=1 tr=0 ts=6819d463 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=th__69AfSmJl4DDT63sA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA4OSBTYWx0ZWRfX1ddquDyqyZDa y14VwFtLKoKHd7QYix43EwNghyaMOfJJZ4NJ7VOkyRgJPi9iO4K/94g3/0VAn8kxKLupLmaIUsL 4w8vTvEVzTUtBKzREvaoX7xyFgsT4KrJdaVO5Xu9bPP9O03lv97qz/BGQRVWcAtmYVCMgV3UuFF
 viD/u2SECidP+VoABk+fY91/MMwE3zb63dCnpIp46yPegeY2Krq7Gis9bPg3nFKE4A9EWTbiwfU tp3Gom3Tso++C4bdPfayArenq36U0I6Tj8Kyh+ACxSwv1MdW7OuXKtkH54sBcwkr1XEHnpIePH7 0zVq14pyHYR4htAQv4IZQKADbEBTYsOyZtwHqKWbWFAVo5/ICs6vaPehe3ZHWe9/3dZY4Karl/d
 Pm+es11dBVMAaaqNhv9dnP4nsC9u7ijN7m+rqb4ucVCbojqf1EHFrl9nNLFpbY2WG665vLad
X-Proofpoint-ORIG-GUID: 5HP-PmTH-C7Np3SyJqTVgFcLdmKIZq5w
X-Proofpoint-GUID: 5HP-PmTH-C7Np3SyJqTVgFcLdmKIZq5w
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022046_973500_EF8B7FC2 
X-CRM114-Status: GOOD (  10.33  )
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

On Tue, May 06, 2025 at 11:01:48AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

