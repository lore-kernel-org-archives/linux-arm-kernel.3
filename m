Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84E7D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tbr8xWXEAsGn8XE+3EXL1/BYRbTxBxe8MoPo1mYh14=; b=pWeDL5VEgh66KsnbVg2I6T3q0T
	TRub5pSKqmWbMGr7/1+GDDCvLkJv6BmZI/K+0dhgsQjKHiPmJ52V+FyfxMrpR+7ykigzrJh3ki+5b
	jGNmpJ3TBnY5o9AEJVwt3aE5cH8EqM3YWWoe7bb/mWFKqpn+nDCVNAHX7e45gNBn9qlW/SLmMC4od
	gBbVKqHegyEpgFz7sYaHPw2B3bV30LDl8Q/rlxl+LZCGmkWdA2LZ0ODV9A9xphgg+FH2l1L7S4Y/U
	k36x+4j4HH6PQVbkTJkiaCOh+jKlf+KU5GkebMrNDIM2PFgZPXSoDxSJXoEEZs8spe3/bIxQPeDJ0
	TKAjtLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qut-0000000B9i9-16BQ;
	Mon, 28 Oct 2024 14:40:23 +0000
Received: from mail-dm3nam02on20629.outbound.protection.outlook.com ([2a01:111:f403:2405::629] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QYs-0000000B5Jt-16wr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:17:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhL81Oy6pcarp/XOE/7/XeZ9sGZoyRZo4v6EL//fsEvJc4jeICKDRlo5idEh5skZXOWHvgkzBoGeUDZuOnpcOgHxYhgamLvJ2AV0xtyS+y4CAjik+b3WQNqr4vK3SD4lTV++emxRJeuYI3j8Md4Ju4/DgegQKJZXc4a536XM7pPhtmc8uMGbVgGRuHV6X5UUYAZ7NtcQWgnNd3c+PA1pCu6cdrNCsisKpVjeSVBQb2fAA33iW4RwpcMq6JlEjA5PuGRVAMXeap8/k0qmQ5RSg9b3CBa1UIlZ3O4NP5ByE0qTBvYE8XVZvCNM9JZ3GpYy4Lh91fOrzhDZnDXCbIlzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tbr8xWXEAsGn8XE+3EXL1/BYRbTxBxe8MoPo1mYh14=;
 b=rpK/WI32BXkV0E2Blv8DZX0YqBPlSVijwde5kYZpK6Q8FrQCALzY9/14pfQBPvv3OKxLk0AugiFP7aux6tztGQNg9JX7pYLSLZ74U8PpzCA1lVfKlCxLDOr+Ml80vtr3rE/ng5JepBmsG132Mfx+Gwephdhn5rofkhDlB94n8SlRedhLT1VJzt7Urqu4x3BIYh9BgWKyTd/BcfV5aslrK0loH/IFJV0sPmg3eOL28bUj4ZiWc1sCchnFlLNHf+j3QbyrMTGpUpdTCcYWHWGIOuDlncYWkvSSdfRFk4Szj2KQYeSJUB5Mx0Du/+zMf5NMI2gyrpbpiIUhjBzB6vyHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tbr8xWXEAsGn8XE+3EXL1/BYRbTxBxe8MoPo1mYh14=;
 b=i0LuVf1yM2B9EexrLMpaLJrstoeTH1ZgwYT4dfjGiMdMlDssmTH4cevQx3+UXingc3NQIwBcmklqi5dDvl4iuUwyS2ASp70An7pMnDKRJIMh9NDlmPFdulzrgfwNJhARvpVT6/C/y6HaY2bng4P+ufEbD8657XBtdoFzfH1Fgy5sUKg6fUbnZ+cA8h/n4DDFEJcw9J08LMSCk49ZIrO9gro36kpg4hM+9fpR79p0Pn3Nu55eAOy/mNHKCQM6LU/BCqqGu7zuUiwMG9eke3dcFpCR52Qw3H7aojOiJoc5/l3hy3dCnmJsV7ebUhsFCtH7GXj6M6pJ7sV3jNc9jc5G+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB8019.namprd12.prod.outlook.com (2603:10b6:8:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 14:17:28 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 14:17:28 +0000
Date: Mon, 28 Oct 2024 11:17:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>, "aik@amd.com" <aik@amd.com>,
	"zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v5 00/13] iommufd: Add vIOMMU infrastructure (Part-2:
 vDEVICE)
Message-ID: <20241028141726.GQ6956@nvidia.com>
References: <cover.1729897278.git.nicolinc@nvidia.com>
 <BN9PR11MB5276FFE90D75B2146674E0BC8C4A2@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276FFE90D75B2146674E0BC8C4A2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN9PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:408:f4::12) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: fa452227-3f9d-4935-5a87-08dcf75b4090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iaqF2ijpLCWQ956trmglik1iKt67jJ0eYojSOHnVZ/gJY4BUY8/g2NaiMA6m?=
 =?us-ascii?Q?nvYYI0EhAcoDav2tCeh+IFgk6SHplaZXycn2JHDk6CasfX452Oa9Ap+XRYLS?=
 =?us-ascii?Q?f50MPZA0/a8xIkf9VhRvSYYv/2GSPg0BVUl7aFb2i1cS7pJrUnbeLMHihyUp?=
 =?us-ascii?Q?27kFYoaNiyYz5C/Bmt+dig4K6AqPd+Bk8PUQjktjQ+STs6uu5HGV3ESmGhla?=
 =?us-ascii?Q?VtlK82vAkja3FSny+1IDim4mjkcGL92KrpJ9qRH5t5uDX5egHVJQ6WA2YsG4?=
 =?us-ascii?Q?JDldkUFsRzv9wGyPy2dflceLA1QalNLr8UQoITKl9M58xfY+g15xBtEn1yYd?=
 =?us-ascii?Q?Gf+S6hdTJmdkG+zHZNqo2l7J5kPJzrcNuX+WLmcUyeV3GWyDdQ0l7sQHKmR5?=
 =?us-ascii?Q?8ihpBw/BkydW15/u2j5MdTlM7k0wTcqBWxT/864B43WM3Fvk0LXe6yqqTqOb?=
 =?us-ascii?Q?LercCtcr4DAPK8PNQt5p0AfmzODNoMuKfAmxoqPKTVi4YFtBjRdkAZcRayQ9?=
 =?us-ascii?Q?hEQuh1FR8OxoZ/kFdZ17vQAiDkBfED6W41oWPJswQF8NcFVLSe3AOQBql5SB?=
 =?us-ascii?Q?Zuu6bMrIllMqvF07u8Uun79sIQjzYjsO1t6jg/HUd8sBZGr/0/r2O8YePFtj?=
 =?us-ascii?Q?/cnM+gj/y8mzdv+JI6BAoYdKQyLRGiJ9DupuMno87Ky+fChvzww52PZLE0HY?=
 =?us-ascii?Q?Qn/qr41yx46YlxpmECca2xj7q6UB9kLqdh6xFARmbp3hgoHN/qpXqyF4fiMf?=
 =?us-ascii?Q?0U9rvRzSTOZQN4I6CRTSRuZF5WDnoPjjARkZvCFwjP6MZfUmJkiUGYv3DZQ4?=
 =?us-ascii?Q?C2wPU9gQ7COlUnqVkZsBZ3ssCEwoAiNh2ogKRadVib4eD+LtLFiisNm6dqCP?=
 =?us-ascii?Q?kJF7fxulwLdAqkRYNvo1qfIQXoi5OdDWZkaN5EJ+rYT17Uuuy/UtWlZ+EVMq?=
 =?us-ascii?Q?iIiM5RseGWOBlaKphmdBWG4c0SBr0a7Y09zHS16crnbm4+unegcZdonXS9e3?=
 =?us-ascii?Q?TssBhkgRoRLeqwQl39FOg2K7XaEVi0/sisksWIou55l6bgMUhS7CFRMkyaKf?=
 =?us-ascii?Q?VWZB+iT6zSombR5E2ZXGAQDPuXWq4f/sIEcm4EPtC/0FY0bt4mn1K1ZnTn8A?=
 =?us-ascii?Q?0aLDXhGgHkijYS0bJIwxbpgjdb63+ds3JhH9+RgzfkiFHkp3Waxc9lq9+xgn?=
 =?us-ascii?Q?yUOTSZvsbpOsQd0H9dxSRUAJRDMZbf9CZawz8W4LOPtxJ6szaPCqyU+sSaIK?=
 =?us-ascii?Q?S1oFP0HQa180gO0sy3HBktMGXsz/yk7CPo9r+OOjItyvuf3JlDC4Tuz7t3XC?=
 =?us-ascii?Q?WfNE6Z1/KJybNLf2fmP/M4xA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0iXCjL6MezErf5YmVF9YWGe8PvzgIsZz0Ebb/ltg17dM52U/Jh0jkJAecWl/?=
 =?us-ascii?Q?r/VFyzBoYBYwQBvUAHIKpawGXhejWLPDLIHRrfcYvHmTTjezP/0Bp4Ob01/5?=
 =?us-ascii?Q?Ku8fX7tM2wyR+R3xtZks5kcUmEOOAPWR05i8NgRWd5RNqsbDMjZGunfqAphX?=
 =?us-ascii?Q?Qwg5CiNbW3WtiZHI4s32H83ALhg/KkyAR7+5kjrK9rtbupu4os0vCQCv+0Qe?=
 =?us-ascii?Q?UwhIuKlPTGpl1oN5KqtLPNa3bTse+mAwExUghi0CYDZWK/9rVwsX2HKPQL6F?=
 =?us-ascii?Q?QpigdpaTr4BCQYaRD3mCl7TOT1gHEWavstknq3awsO3EH4J8SxnjG7ITfv2w?=
 =?us-ascii?Q?HoPNQ1hMyDVN8rfU3IXm6cg2Sjx9CTe/nsIMXshWJqlj2muTvpaFCJ+KB5al?=
 =?us-ascii?Q?KGYjM2p3Yey/l0kgq/AUHNA2hJRmwj1onKBu5wL8W9KgwkiUZ9sQP7snFglM?=
 =?us-ascii?Q?zCIuW+ctULmngcNXnwvCD/5D+z1CMLBxZUWfMeS+Dvryuqu+AIG99dj/yeVG?=
 =?us-ascii?Q?XKk+Lebt07nTpiiK4QY/OH5ChFsjQyPELHRy9k+6A76P2ejggQO4q0WZvpGJ?=
 =?us-ascii?Q?Tyfj14+7GLloB0QcXf0mf7O4y7zCSbFI3OqFVovK0JWRAwCcz4TH8vnLAFde?=
 =?us-ascii?Q?jd85I/ei8NK8jHP0EImSbVtHPHkC2yxe05tsfwfBpqBg+kHcodIrCYIIScK/?=
 =?us-ascii?Q?v/o/6JpwIFpnrcmjj36prHcJjQXsw9WVjndCHFTOZvuUR6S479PlMQtegZyA?=
 =?us-ascii?Q?3lSx8pohdiDz9HkCIXlyTWD187p+uTyCcRjUUr+nsYWQeivnRzo7OYDfdlpP?=
 =?us-ascii?Q?ApBmb3ZxioPAnVmw3+aLzp7KmFm20/XbHHeseIltz/jGnWlzvzqW25guZdWt?=
 =?us-ascii?Q?e5xoRgZ1U08M1ldv7WJK34CfRbRbZJMZL1gIJmFot2XBzdo/wfJNxAUA6BNG?=
 =?us-ascii?Q?WXTnW4khoNNOhzJk+npt61vY4MUMBwJizNAlnnPnxhUEhpXlqkBI84nrRh/2?=
 =?us-ascii?Q?Kubqb2aKiOrvSwXrazfHVwzADEQsNF8Tk0En2z76zg39ZuYcmTvXyx2gwlL+?=
 =?us-ascii?Q?YtjyeFBTqv57CSOeJeiCbkIQsq5dPoT0RgjHjBRN/O9gCwQhMf7KwoEWx74K?=
 =?us-ascii?Q?4hMi1t/G4d7PbHeN6c3/PmxiWZeLAJRrd4cDJXeIlRvD+GRYHZiQ7z8RhfGI?=
 =?us-ascii?Q?uWUT2pYR0hg9l63UuaH4XN5p3AQYz7E5JQ5xSVs3owRXA83/XWYt8AECa/s2?=
 =?us-ascii?Q?HMvuHZA5FN5CZLSHzwK0QkSVRcBj7HAOK/oUMkLQnm88i62AVT7QJbbzOzvp?=
 =?us-ascii?Q?c/AVQzhmrTYKGCT7TIGJ3gXhA7UVGSPN/PQmws4+IhUa68RO2T4lnY2mMw0b?=
 =?us-ascii?Q?IISEUzzmPolisYqpiK6OxSCMO5qh93R7hUvaZfBP5haFuZF954XcVw8kqNtP?=
 =?us-ascii?Q?p31BQpRjp8k2EKfbuqWGqnlERzXUOv9xtHWotlpwcha7E+0E1nyFq9bkm1Uw?=
 =?us-ascii?Q?WrphDzPWZcZ99UACkuhTqodkPBVlI9SgEQRc44ExaAzWYnKbU8VlCm41AevY?=
 =?us-ascii?Q?AsygE2orJfcfuP7Aa3FCPKE1W1rsMb3IdeukTh3R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa452227-3f9d-4935-5a87-08dcf75b4090
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:17:27.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kjg55FUNx51BLBXd7AJN/r70TEGktWWrm30uPWqBVt/Ox1PO97xsXQ2nnSGtRn1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_071738_345138_29CE5B20 
X-CRM114-Status: GOOD (  11.25  )
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

> > to
> > a Context Table. This virt_id helps IOMMU drivers to link the vID to a pID
> > of the device against the physical IOMMU instance. This is essential for a
> > vIOMMU-based invalidation, where the request contains a device's vID for a
> > device cache flush, e.g. ATC invalidation.
> 
> probably connect this to vCMDQ passthrough? otherwise for sw-based
> invalidation the userspace can always replace vID with pID before
> submitting the request.

You can't just do that, the ID in the invalidation command has to be
validated by the kernel.

At that point you may as well just use the vID instead of inventing a
new means to validate raw pIDs.

VT-D avoided this so far because it is pushing the invalidation
through the device object and the device object provides the ID
directly. No IDs in commands, no switching devices during a command
batch.

Jason

