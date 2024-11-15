Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DE7D6DDE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pl7U/tzpXwjOgMfEmhjb4J8CMaJEcojsgMv5810LpGs=; b=RX4wGTTwwR9xZATYURSan21efy
	v+lnBDXbXUCsyF2pkmLA/tXBajI6BJ1P+ct2NcMjlFgRjB1GRL5FK6ZuiC18O+TSQYEibTcsAZtqP
	zGEBo5pZmW90Nac2f9zofS+Y6ngTDwOFS+h5oF6p5ttxn8Gc4aTjlHNyqjzUQ82CPVZRGxlAInfJf
	Ke0tMpsGbwkwzvov7AyDqdhKiKei5QuRFuUtZwp5OThZnxSb3pp8SaKnzzljaBrKBT+4ensZSA/xb
	Vj8tgMVK/FoqOi0/2v35MvD0A3By53tInmpR9syhW8mOFroYW4GjApYJGCCwIQ8qNPXGIf67pV13J
	iLDFFHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwuo-00000002vNy-3Q6Q;
	Fri, 15 Nov 2024 14:03:14 +0000
Received: from mail-dm6nam12on2060d.outbound.protection.outlook.com ([2a01:111:f403:2417::60d] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwtt-00000002vCg-1233
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 14:02:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqFewbVSQ5EVdenaLdQ/un4kVKQZ6lndSU8pLbfYtM5Tvd18Lq4Hss66DUFU8yhJXRKt9SM+rH6AUh27spQJSWT5T3csHMohAx3aH2wXVyEisKIr/imv5RPopl5E1h710xdrK8cKXI87MyQlko/G9I0HfrjVb3x1pBQ7ITuDmsewhqe560n38GAUy6vqMKclHzfB0tAlT2eAetqg5ENnDGSIqLFTlg3RC39+t8t2RuXXCQWxFTYrVlrRYNutEe9sUCrKRz9v6EnvBNbr1mOIp27ZFeUtPbioTszfrEgGzrMlSo9vL/aMV9NmNQho06RZc+vUViJw2tAdm4kX2JAbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pl7U/tzpXwjOgMfEmhjb4J8CMaJEcojsgMv5810LpGs=;
 b=A+HtgZzKCgGqScVbDBpXEt41VQRnQRyV02DbJ/7PQSXGZs6umHiEdQdCJYHbXTwrMSmkk3eicpZf+5Bh4v/wZZSCEdCSIR3wggPq0LGcpnnZnaUJ2EPOFVd5h8IhXMSj5p20ksGXbXwirYnN+QgbMdLLeLgvPSwEYfg1z820d3ZiHYe3NIazugdhMSNuscdd0RDjOraBlBYsRq7e5P72Eo7wiVEGxOJ6W3QU6NusbCJ1fW3O8Yh4/kHYCzsBxMF6qrLZMlx6KsjdIems4pzeZiIWrg0QCAOP5iwQ//tTQoxhHtuIn5UofD1ZADZnYfBZbTMhcet+Vch0il40Uu+ekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl7U/tzpXwjOgMfEmhjb4J8CMaJEcojsgMv5810LpGs=;
 b=gK8DXge4PmE2lnuxJumQ+lJnu/YSGjM5w/iKAo3pjs5R7UUdYLUmRL3GFMstmiy8xg97ACx50wXX2/rolyJEZkFpQ2k8S4r3d/rSI+mgVB9niUKOrQI2qdUK0lmFEWUakL2kwnEKc9hZR1WV3VnmCDOXIE2jMEsrWoQiUwSGk/uDcZEdy0tsJJNfaKCt+LG3IYQ/lz6xR4FxgeieXtWP4IcmWpCJV686k+TNnLxC7PT+a2F1TGpMM1ELoQAWHRNBQHQe/3DK4wdll7zmL57lZGkjd//NcaQ0Aw3UIPj57g4TwxDJD7V/qLH3v5ZfRTIVl9KQBBe1Ow5T9wApyekMig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 14:02:01 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%6]) with mapi id 15.20.8158.019; Fri, 15 Nov 2024
 14:02:01 +0000
Date: Fri, 15 Nov 2024 10:01:59 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>, patches@lists.linux.dev
Subject: Re: [PATCH 2/2] iommu: Rename ops->domain_alloc_user() to
 domain_alloc_paging_flags()
Message-ID: <20241115140159.GW35230@nvidia.com>
References: <2-v1-c252ebdeb57b+329-iommu_paging_flags_jgg@nvidia.com>
 <e9981960-a7f0-4e0f-991a-0b96e1d57cd5@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9981960-a7f0-4e0f-991a-0b96e1d57cd5@linux.intel.com>
X-ClientProxiedBy: BL1PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::9) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: fddf0c0c-4d20-420d-57dc-08dd057e13cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hd8T9YHLT+Z7+fqmvDUCYauIOnKTDsfjdOWMvkKLNmFer9ZcnTsyHAWZiekK?=
 =?us-ascii?Q?4w3c6i/ECDMcmLK1xCRlWzSSb2c6VLhR7WgYb9mw+Fw6P3WrCp+GFtod1NTU?=
 =?us-ascii?Q?UboUDxwTUX1W9HBpOpIC2pPEzk60w+7ab9aRNtBeAWFuk4ccwlTn7kuwoQ47?=
 =?us-ascii?Q?tTiGZKHwqI5IbrZQ0pTwZFykyVVGFHPVGe2194PWPhmDIF9DFsTCdn5dt1wI?=
 =?us-ascii?Q?S1JY/2nNYKdLOxDm0rtP2qJfeq1Ku8wT6CshlbLHx5uFISoYIDPItDc831PY?=
 =?us-ascii?Q?oEbKmOlODvf5qUBFjqRQD3fQ/ELppOjZ/EtcCgwLE8ECQ0TP/GiUZgFxl4KL?=
 =?us-ascii?Q?bckxGvz322yWmembY4OO6Oihjf1R5MwaosR0T9uAaQuRkeYF33ATwWF07fRf?=
 =?us-ascii?Q?SyldA9uYKdw4rmlWsRUYaAxSXA3l9gEbL823eGkAg3Irr5eh4qwid2v2EM6t?=
 =?us-ascii?Q?Pi8wFj1j26JQ+FyAibQkvSsoMhys9YtcHSqCxGLL0V8njmmZ4zmEMYFtF15P?=
 =?us-ascii?Q?9DeLvWaBUWt+RleSeT9p7fGHp8dlaUJvR8VDrpjGtuG6/bf47BSOmUKzkJNv?=
 =?us-ascii?Q?tBhuYyrCrqXe4v/UWAdAsixzF2lxW8D5kSpdDCeGA26tvJps8p/aFPD9epxu?=
 =?us-ascii?Q?L0UxbPrnIoQp2eUCNMM+uryiFbGcaVkv+J1o+d8F44WA5C/sbVltEqjhAh+3?=
 =?us-ascii?Q?9OOmWCN0kTYn3DAlyWy9V0brcjiRoFt1uvlY4EI0bd5mQI4oYhSMFr1+lqlu?=
 =?us-ascii?Q?3GKcA5+DHzk77VR1nL+GBT/vqwZCV2qZdVOaVhSs8zNxdOCMIfB8fQcMPohk?=
 =?us-ascii?Q?nRPTiRrekPPyhDjSA18NsnKx6KrQHHBvJQalFQjRWAzRxeq08pUWLC3aUuxM?=
 =?us-ascii?Q?Pzfe2dYbSOwWx0N6EJS05zp+xVYnyFtLDc8pgG8Z0NEAHpCi16hr0C/6s11b?=
 =?us-ascii?Q?eYC1BTZ/Lgg6945Oh2MAntJcGkwpL6Qmbm1HmDZs33BnBmk/QBlvcPACKIc3?=
 =?us-ascii?Q?3ukMtmG/hv2owO5PdnoH0K05nEVTCdnAGgjzOVsFLT5eOlipXvNYneR4eoeE?=
 =?us-ascii?Q?NywaJhmwJ/cIGBuM/oE3i613EpiLiRSTcFzNzsu8urgdw/UN9YlkggyKMg+v?=
 =?us-ascii?Q?3d+SRTv9TyfTujOEDVVCkFrCFZn9RYP8oxJt8qbQWbT+DYlXT7K3rni5Oo17?=
 =?us-ascii?Q?k2iwPWoHZlmfAZyF7SPVcMFgZNOKLMWVMWGlQ5YU0k/pELGTRo/EaIujnjjb?=
 =?us-ascii?Q?YU33iIX8U6D+60xUr7C4u3I044/Dx3/P+DGILPsKcdQxWXyWJq1zXrj+zLCO?=
 =?us-ascii?Q?Ovwd9SV7OhE5rWpenEOz4mqg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8663.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2aDeC9UllZNi1LPy3Qiuqz7as/6IoU0OqKcvaOa/fBDtaqCjWtCOxt1gyFKM?=
 =?us-ascii?Q?a9Q1ezt4dQvDARzT3ZPpgdRXVyJ7Wfh93JehtB8m3OI8e8EcXqixoZ2f1PLJ?=
 =?us-ascii?Q?DwfPEjGQCkbK0OxrKh/oWg6uTCkx569zxYWItPY+EbB2pzcrN7KE7DJPFUck?=
 =?us-ascii?Q?KfO7kN7nFrQ5VfoKfDIw31XDU00YSk7tDr8lGTV4xz7GvTHwypA4NIeGJZig?=
 =?us-ascii?Q?ZNLAHh4cZQ/opMhT0Htbmdz2KMckNWHzw0XW7uwWXTT6YPusBb9gg5v0jdqk?=
 =?us-ascii?Q?6vXESPZhnATYYIUPTU30jp+YQSa/L2PTehquKaAD/7c3SBghq2MxqlcjAkYS?=
 =?us-ascii?Q?alUgPGC8MKqdSKYFAlhHWXbsprR1o5DU1UVtjWwic2UMFq5lxNeBX5srp0zj?=
 =?us-ascii?Q?E6Fd9xLmdVuVMW3Ohyhfx/COLhVyHbZ1v8JxqHbpBmSByFY6wd3vvxMrys/P?=
 =?us-ascii?Q?MCDf4i0jP7n/x77SmBH8gmMDmEqeuLsEbVa/TcD//lpy8FtL1m0HpBMqLTm0?=
 =?us-ascii?Q?MkbcYhTan/lJlKys1vV5IBgrReIZRWuEMbGi+QOgYZwBLFRsFqI0ZqKwGSMz?=
 =?us-ascii?Q?B9E4XMJGoEt6Je56eq6+Kt/Ps6GDqNTcUaptxiapJokHWnqJzS6HHlIMB7E6?=
 =?us-ascii?Q?HSX+AFIVypmrn0bwBamEqG3HwQkTC5pEFbMrbvb0lpboeDsaopN4J6SkYCLi?=
 =?us-ascii?Q?w8MbLNsdZVCpWEy3J+xMqWW/a04DI8n20tZtoRdiR0zXhLWlDqzpcuyefAjo?=
 =?us-ascii?Q?mJHrxJwGjwpeXmiy2Q6ylTQYCTHZw6JoEMdbSyGywcL/MhavAAYKEenqw1T0?=
 =?us-ascii?Q?ghkclUesNX6Ec2MPqiJlwIcwk5ZuN4wbRxWKBHNpciAayDx81UHvmZNOXHKJ?=
 =?us-ascii?Q?FzbTB+W+qBMeoZhMBNLZhcMYhwSLu5nYXIzr20TLUmX9NF5+gKY3ISnR003t?=
 =?us-ascii?Q?z4jF2AFgSnlh4TgJRrcS2HLtlnHxiLMe0voMNzARrudsyu1/xE15v69EDE12?=
 =?us-ascii?Q?XXYDXYEnRugTSCehisEqWO/9DkcGQo9FUHqgxZhsKrywFxyBnNeJzqB1XClh?=
 =?us-ascii?Q?ueKvNzk8jXvaVWv7FY8CAuE/zUWlK21y88SIQpLRzqrg+8GjMuuDWn2QuSMC?=
 =?us-ascii?Q?w7Lwu65r69S5EDboDJRnjmKxwCzWbE6RDxMQAbQFqF0kyBJz4z9J21D8edtd?=
 =?us-ascii?Q?/Dr+St2/SfXnKwcM5ZxZ82F4pst/XEZHlQ+pULFJ8D0fMT0FjWDHsd52xS/J?=
 =?us-ascii?Q?38ZodD1Mr2Gxv1Rsz9MtF2HCBMoEYJGgTUNe4ht+yDl0JLOKsxsBJmHUlXMG?=
 =?us-ascii?Q?B51Lxd8vK0GGdiEoqLQvgiscPEL5Crxxcb/qGs9Zg4skwMu31y5FqjyspZa1?=
 =?us-ascii?Q?w5eAXyC9wSwcfHMcM5I7us5JoVgtGSFgOTQG7fSGc9W1DTNK6GtMdgPfPHIB?=
 =?us-ascii?Q?mdrV4eqNkHNU2n75l/nAEGoFZIgXp5ICumLFwZHDXFkofShV/N7aWfKP3E3P?=
 =?us-ascii?Q?r6HeMmN97GZVJWqw9W1CNZBlaiJZsmZxyZjZ90j2HeCmGZJDQCoyOlIppFj5?=
 =?us-ascii?Q?wVQ6Jw8tu9PT8P856Qo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fddf0c0c-4d20-420d-57dc-08dd057e13cd
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 14:02:01.3876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vi4LIvuNMWjb/310Tg3hQVjvJf8Wa7Wv+pGHFBY0f9pj+isxtYWDhHayBfPe5uOk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_060217_303516_2530B9A4 
X-CRM114-Status: GOOD (  14.23  )
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

On Fri, Nov 15, 2024 at 11:22:50AM +0800, Baolu Lu wrote:
> On 11/15/24 03:55, Jason Gunthorpe wrote:
> > Now that the main domain allocating path is calling this function it
> > doesn't make sense to leave it named _user. Change the name to
> > alloc_paging_flags() to mirror the new iommu_paging_domain_alloc_flags()
> > function.
> > 
> > A driver should implement only one of ops->domain_alloc_paging() or
> > ops->domain_alloc_paging_user(). The former is a simpler interface with
> 
> s/user/flags/
> 
> I think domain_alloc_paging and domain_alloc_paging_flags will
> eventually be merged into a single domain_alloc_paging with flag
> support.

I have patches to do that to arm, amd and intel. Alot of drivers will
just stay with domain_alloc_paging() because they don't need anything
more complex and there is no reason to spread around boilerplate

Jason

