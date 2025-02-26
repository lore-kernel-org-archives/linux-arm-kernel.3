Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27DCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xas6iO23/lUhq3wdmU85vP9pe8qViP/58nGydjOwJEE=; b=L/wqNGdMKFh5h30DrMt8cS2paN
	P0S8US6eCfjtRYUjiy52IRhhXSumCzTlGdbQKRK5KmtkknL7weFmnrEIhbtnql7vbMW/L8uKQ1shV
	OQetnUC7TBlFUr690VjddUM4WaNot9wEL6uPFsCtpGm+YCfuQePr7F6wfzBWT/L5xDQNuBf46R1I4
	SdG7+TI5RlWpuq7I3he07CrhhG9cEJsuYmV9br58dVnWd9QxD7BOWoKPyJPDiaa4+64FDOMR2obyu
	KATGxDoAHlQkZ6oiec8cVSlftLBVrk6KTCM4587v/nDiXW34oZ2g+QaJ5bHYMrrcoyR0QHSyMt5d4
	g19iySKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHqH-00000003yOt-05qy;
	Wed, 26 Feb 2025 13:52:53 +0000
Received: from mail-sn1nam02on20621.outbound.protection.outlook.com ([2a01:111:f403:2406::621] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHok-00000003yFa-1WRo;
	Wed, 26 Feb 2025 13:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIaTE0ZfvP6s0uN9Uq9x6MRZFRIWI04QaznQZN6gX3WwdTQt4o1qoCHrVz7zeTjYW214VorNcIhiV/1Dq6LIGJenyw0zk5rvFY2Ang/mQXIWzKZr71a4EWrVH0rnYcr+B81sOvEmq1TduwXIKTaXerJEoodYZbHZEy8p7B6gzhIYw26I+H12yRgtOB5xe5jeELosKfHNbz2hbBdyFFifdPsKW6e3AIM6xLmQBfeprZLYAhQEcKPpq5xwCIg1aatBYC47EmW4t/9w3lrR/k9a6B8TFsvKl4h3pg05dN3ZrNqXznfUkuBfyRTZ9GchZdS+JaPCjsCs/ShgBVZCuE9sGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xas6iO23/lUhq3wdmU85vP9pe8qViP/58nGydjOwJEE=;
 b=galxrB2Nh1F+6IllYLYBWuLPVGQBrwKzEsC3V+XvJjsSWmc5FLpjkKGuVF+zt3m23UGaHAhDjTogBEjlGtWokpfvuOjazK/rFB4tisO7wf7XNUS+w59eltbrokoOJm51lrsZU1lyU+02UJCAlT/Yu/6bwfzTBqlBmS88+oHCeWE9vQqfIKhEpiXWt32A5gOaHCmxg4Tl/q/yk99HbjJpKTfosHvnDxWbKqgJ986kkYVwFL+1SLayjOYiWz6F+mPXPw0RcGeuxe/ZKB1YJa6PDQLwKsaoi4cYgHPOvKdaL2+MnrHDeySTd2lvp36j3Q3y/NqpdGghlwb1Gx4tnCMyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xas6iO23/lUhq3wdmU85vP9pe8qViP/58nGydjOwJEE=;
 b=eaLKI5ZK5k1w7CgAGdGbaFWO7uh+sb4q8KNRo7Fh4pBsdqU+71TCIgeS/XtJ9nBmcTypJ82eim+EOOQ9uM/Ze9RwKbpr7/MyfhfkHXOjjmxaqqWTFGIeAo2xSkLZZ3RSZFoXFCs2irX+/71B5vO/3gP6gQyf2aSk6iSfx7Cp4cKUJoL9sxxBBy7GUIQ61aetDOfaI0cL+ZnnyWLDl99/aklb//oXdqFZhcxPMWud56cQBEyqMeouLXCmLe01ex32iZ/bPOk+Zuaz9Ilwp7J6AJ4/64S2yOSt2R1q59P2JosesWLuLR3bIt8XDxf2mFPMEPeOu8Y8n2+m0/H0z3zkaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 13:51:14 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 13:51:14 +0000
Date: Wed, 26 Feb 2025 09:51:12 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 14/23] iommu/pages: Move from struct page to struct
 ioptdesc and folio
Message-ID: <20250226135112.GB28425@nvidia.com>
References: <14-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <fafdcc71-b246-4855-a088-24854b124b21@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fafdcc71-b246-4855-a088-24854b124b21@linux.intel.com>
X-ClientProxiedBy: MN2PR15CA0044.namprd15.prod.outlook.com
 (2603:10b6:208:237::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b39f81-e0f5-48d0-b091-08dd566ca25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?it7M4mTIz56cbn2ha7LApI+RYJhQZ8NaTuf71DNeW9mfVoHDz5ir9cV9fZA+?=
 =?us-ascii?Q?YvP+pD1DlJiIGxgfSL5IyiLgSlsaFmRhtw7tmKEhAJNcWKwG1jQwG801Ylqk?=
 =?us-ascii?Q?UoblQ9ihz7skQEPeAXrk5Ndqg/u0FOvM9Lj32lgMlE3JBDCjpzopa4UFv5Cr?=
 =?us-ascii?Q?fKwY0SdOj1ZDYzv17mrFemNTLsqXngDtUOwYCiqyUethsVQY9/59Gmhtydgy?=
 =?us-ascii?Q?+tSTT8q2MSBmBI7iXgTtpDExxEH03FXy5gvA3idwfZVRITEEMDH+s1x8shb5?=
 =?us-ascii?Q?gbZStdd1+YCH5y0/0Elfmax/yw5vcH2w2F7jO0xNgM/GCHSc4Vmkpj8o1YOW?=
 =?us-ascii?Q?w7g3pNtYMUr2zaS3lVDfaoBu9/cy8OAKUCCaZkR9jUZCxYq3TyQb7cbdQEP4?=
 =?us-ascii?Q?SK1OnEwN5KhkH5eTKPnIRzgF3C6bRMIuz8qPX27B/HaAa1y7V6oTcIWzPGbP?=
 =?us-ascii?Q?4w8X0QjdXjymkpALlcGvFcD1Tpwp6GcLe59wk7Zd1OShap5STEV+PbfO1rHe?=
 =?us-ascii?Q?RKGHdcNu5AMI6XiiVKFnNVT64O799b1URzkgMYCAap1lKJNT6RfyRr7IRDPk?=
 =?us-ascii?Q?iAjHpprjRAQIWM0ZNGuoP5QJK7uKs8EftbLarcjk1+Yof9AHcDxmX67tOwRP?=
 =?us-ascii?Q?7gn/rF5Op9rWgBEBYS50Ku8aNQhK3DY36FH3VzFK3Z9X1lFe3Sd8n7RLNhOW?=
 =?us-ascii?Q?r1lMtRfcq6TcZoKD5c8BDSn0XML87uhEJzdEEmbOa+9f7TCPrX8xVesULl3G?=
 =?us-ascii?Q?zDwZWlbpiSs8ndUWA15VEQraQHv8lQ9PLguq28+X5Cue6OOyaUV56hNJ3/UN?=
 =?us-ascii?Q?+iSa/04RAeRqz0saN+cH/1z6C/laVSp8jOZlgLN/G6GQTDfizJnelCWUeTxK?=
 =?us-ascii?Q?nWanpPy7SxQ2KFNbxB1Y52G3lUzadJ7oPFtTj7X/2GOyxT8dGkXyddWUbPQ9?=
 =?us-ascii?Q?yC7wgZSerMWoSACiz7WW1yq12TWB80TjA+c5XTYjc2Olu+hHWyIqOVYBrjb9?=
 =?us-ascii?Q?2dobNkpMKYiZICm7OSOzZ7WgrKBIDmOytkb+qh9PoaGnWj6xdDhH3ExAeTSA?=
 =?us-ascii?Q?zZxCSGdfLRm5GINIF/uC+th0+qi4NR1iiqMLzPiFG2beMCQx8F0QNoKpkTDv?=
 =?us-ascii?Q?SEOOVm1/3hNdGSQty5/ydJaZ3pPzFn/7t7PUh52VnopvYXnJYcmmKlDr0TZ8?=
 =?us-ascii?Q?yaNT11ZnjkQQ/wEMYqQfB6hiXOzDpOhtRcGI5CirK9deoW9lwaAuarBDfmNB?=
 =?us-ascii?Q?OBWLnXB3RUkuU9srsz/aJuMtNwZLE3OKpawc6zGZWnb1Qq02us87ZYqDH+/O?=
 =?us-ascii?Q?BJ1UVQmt9UYEJeZlnyjjSkbhkjwEC4RM8q0LccdI5DCP4rt03ex9yz2OCrFy?=
 =?us-ascii?Q?LlLIKMeddhNr7EDNaWubqg7FO3Tc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Ll87GCTOeiYocLkY0KrQOeIXPjLuh+H8ki1bY8BqxZ47ujWEWX8jGT6XKJ+?=
 =?us-ascii?Q?Qmdf9meRxZnPqTiiy1qVorarxFXF/7v1zxdxauCGAYjewUDmQ+5A2DMRNuvt?=
 =?us-ascii?Q?HnV8kSpnxn1rxBLkb9dF4fKr2mFRIBmvEEu53FtjQbC41pldc27PD38lj9LN?=
 =?us-ascii?Q?33UmgV0ttY5wQuscQzl2iYeONtlqPrPdvD/3VqSP9M3RtHx4bA4Cv2Tonaf/?=
 =?us-ascii?Q?oXgLfW4Ex8T+XoJbEy11Yvb4QRwPOjQrJ7KOm3fgEWxtl3CvDtaVxwW9bB4X?=
 =?us-ascii?Q?GcHGmpQkt1VwEnTRAy/DPKmeNd1dhm6lbpjL5ruZTmeMmA3dAmoi9CwTwQN4?=
 =?us-ascii?Q?Bj9oQDFTJiIY4U0lASQEKp7I0jXIMg79I0bPNHHlQ6g/5YvhRk4hHYepWkia?=
 =?us-ascii?Q?VvClj5qPL3QbtPMEGnUZK7QRtdTWUys/GVvN8KQS35qN+yHYipfk/eNC7M8y?=
 =?us-ascii?Q?Tzggg4mODFU6smdLJQfD5LQ4V/izCo2BPtVul8ti9V8bQrzkoOiAKlALxTfw?=
 =?us-ascii?Q?d3eqwJ0BrjIuPvX1VRYQJCk9WJBitu0j8AWvse4ZJwWjVqOR1UMTix1d4vp7?=
 =?us-ascii?Q?AS6nwfsSk1x8ppeFsNj8NXp6H0vFQadJkVBVw3h9s0o3N1mDoptAthXb4E8b?=
 =?us-ascii?Q?eMpRMnnDmY3DueCkjnup0SWVG0aRbXgDG4RbMUZ6jVzFspStEyWb29GSywtQ?=
 =?us-ascii?Q?qo7GyMh0B5aLOU+47TY0/81gFePQD0e1uSuDp/Ri33x8rQI82zog1q1Tl7sa?=
 =?us-ascii?Q?VVb1aQKva9Xn46v5lbVivJaHUfyVYyPjLtGAryhWeseCdYNcIMjw7H0adeuA?=
 =?us-ascii?Q?0e/SIpgkhrdS2Qz2COoR2UGZjbmLQSNR7ShB/nAKBtv4AzpRoGr/+w39lgX2?=
 =?us-ascii?Q?z6nSmTBTxoDwd9iu7SHXa+lTWXNtJVVyhPl1nA2eDQRlIOLbjNFJgARyEw3z?=
 =?us-ascii?Q?774dp9V1sqcF1CFLrTWD21GveWUd/IqiZWljwEgbFIW+in9OER9UCx0wF1H2?=
 =?us-ascii?Q?GFUPAlOZuFsMVrc5S4jllXr0Z15UG5xB1OHjufyGGGQ2pG5K5NizdberVmpD?=
 =?us-ascii?Q?G4y3dA57FOlAOrfzxXxXlCZa8oCgiSrljAKQkiIGvMdIQ8jFvKvs5dq31MUh?=
 =?us-ascii?Q?4QzuoznDRsa7twelo1U+ESLS62kWDkCJckBbx1Ckn8Bf1I3H6Q57/2o2gPk2?=
 =?us-ascii?Q?QqGeaNzST/C+6vwvKJtGPu0wSoJQVj32OpaXi2qVXXGfyvgET89Ur8XwBIaC?=
 =?us-ascii?Q?6H9CovefnuGrstR5SjfBu0lx9FVt9WAoSBoQIKKHnN0lUkXxscLLRKs3JxTP?=
 =?us-ascii?Q?t8h1QVwlrTqa6OK9Hx9hkwiZfdMxR41Ece5X524S1qIKsIW84AY2dSKjCQwU?=
 =?us-ascii?Q?FYOzdwinsklJg45x+anDBJ9MJaPKxqgUYbQGbaisQItDnquUl27AC8Ht/J4J?=
 =?us-ascii?Q?6TrhyTUaa4w6YQ/4dLB3ddiX7HI41bY2Ys+ykIspgq0lm5j9EpPFS1vfPZji?=
 =?us-ascii?Q?qqMo3AFIUPTB5sT7jA4u8ui9N9xIS7SP04AiqilM6YXigrzSE/t4bjA3JiLJ?=
 =?us-ascii?Q?0Aup9346hZYwWEdJV90=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b39f81-e0f5-48d0-b091-08dd566ca25a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 13:51:13.8939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggLQQgYxfnlJdwIQ/09STl5oY4JZTSXrKAffC48Ay64Jjw6vkYPImZx7uwxXoOjj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_055118_404091_E8BEE860 
X-CRM114-Status: GOOD (  20.07  )
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

On Wed, Feb 26, 2025 at 08:42:23PM +0800, Baolu Lu wrote:
> On 2025/2/26 3:39, Jason Gunthorpe wrote:
> > This brings the iommu page table allocator into the modern world of having
> > its own private page descriptor and not re-using fields from struct page
> > for its own purpose. It follows the basic pattern of struct ptdesc which
> > did this transformation for the CPU page table allocator.
> > 
> > Currently iommu-pages is pretty basic so this isn't a huge benefit,
> > however I see a coming need for features that CPU allocator has, like sub
> > PAGE_SIZE allocations, and RCU freeing. This provides the base
> > infrastructure to implement those cleanly.
> 
> I understand that this is intended as the start point of having private
> descriptors for folios allocated to iommu drivers. But I don't believe
> this is currently the case after this patch, as the underlying memory
> remains a struct folio. This patch merely uses an iommu-pages specific
> structure pointer to reference it.

Right now the mm provides 64 bytes of per-page memory that is a struct
page.

You can call that 64 bytes a struct folio sometimes, and we have now
been also calling those bytes a struct XXdesc like this patch does.

This is all a slow incremental evolution toward giving each user of
the per-page memory its own unique type and understanding of what it
needs while removing use of of the highly overloaded struct page.

Eventually Matthew wants to drop the 64 bytes down to 8 bytes and
allocate the per-page memory directly. This would allow each user to
use more/less memory depending on their need.

https://kernelnewbies.org/MatthewWilcox/Memdescs

When that happens the 

	folio = __folio_alloc_node(gfp | __GFP_ZERO, order, nid);

Will turn into something maybe more like:

   ioptdesc = memdesc_alloc_node(gfp, order, nid, sizeof(struct ioptdesc));

And then the folio word would disappear from this code.

Right now things are going down Matthew's list:

https://kernelnewbies.org/MatthewWilcox/Memdescs/Path

This series is part of "Remove page->lru uses"

Jason

