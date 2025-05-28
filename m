Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0593C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUXQ3tSndGwrXkjqYfGzUlroQjb/x/XoXqZ2955HnUQ=; b=OGmJbYyEHSwP4XGfcmU4nm9h2Z
	yXZN32Ya3RSVhwUy1paUh1uMXJP2Sw4x6NfCwPjHzUivq2QUyaPco/WMPcc7Iy4f0yFz9QEKYCpdq
	nxhPgf3j6ZzcY2XeqJohoJtFdT5CD4hyGVj4/ajOdCitibHCi97NoB/kmtMKy05u8SpNrrg67iifC
	Sv6LsKAF9Jnwxk20auMxp11WsAHJ/aQ3T501XzKP0NjiJyP1Y4JzTAkDnuxjWle88Jrk1B7fZEave
	+enkAoOQo7rFuUXLCcuETr047pYXs/RvdFRMBPqdD6p3ODq+sPLlyk6aosu5W4EmwaUVcv9KwbYa+
	l7lAP7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKRz-0000000DoKr-3wBM;
	Wed, 28 May 2025 17:20:23 +0000
Received: from mail-sn1nam02on2062e.outbound.protection.outlook.com ([2a01:111:f403:2406::62e] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKPl-0000000Do2N-3iNj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 17:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+7Kf2RYdAxZxl2/iuaEt0YIf2hXrnBjJ6P9PrtWHSAsRIQRzrCGKeqbNQQ6BoP8n0/mfWs6gBQouLRcNOom/okXJIFSxi6ZoHuE4QZOWflZWpccfw1ymKho9Pde7eJMYKZeYmYMOnATq5X0qZWKZI6Yeox9sbkXoBsfhaFis6tOWpuGX7hyvTza00biaykGDBwkdhQ3NcDHlesLZTiaJgJJMvO8lJMD6Rg1Nx/MBYB16++q6mUxktG/TOp6n1wr0Tru992XJxRReI9jAZkPJYofuZat53D+YYRpEy3tq3azx+lVsPqRYVphD96H0dRCtvxjGiThCB2n0o7obMkcOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUXQ3tSndGwrXkjqYfGzUlroQjb/x/XoXqZ2955HnUQ=;
 b=L1Hr2jsTZk7oi23RYzOCSAaWOAj2jMui7wf8OUiA5U7Rf7Ov7SRNFUEavemq3QqVzDyHmVfRj6/B0rc6MQoL9/wDBfJWQ/oVk5azG5nmKJdrx9gAPVx2SrIlCprOktwixgvUwsIP+xklzlJIRMKLpPdrQwvTlNXcNgCMjk17v+XRXyEbzbDnKd7Uly5fsl3zp/aIAaLsKZEyxQSziKNGrXSVyG4mWBGuWdN1h9WvaYsm3ARvapLMJP/pE0cHsUJM9WU/+beNmBT3/Mc+oNOPhaqW9+ZegEbX1puQSETkLSwsUuF52V2T1tpNV/za1+Pz+B6ZW81/oK79ODuhH1ok+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUXQ3tSndGwrXkjqYfGzUlroQjb/x/XoXqZ2955HnUQ=;
 b=eJ910oSvvCCSx3eWP8iprKXUY6MMAkkqa3MdWg+1uzV/epioAUFmoK6I+GIl1hqnSCIefPY1sSEkXfBi22yGjATVm3dUPCJqQxad+ZZ21/BW5TOoTVNak/+Z3QDAenvgbfTWjx1D1Y4tFdsvTW705/xODbXoS5TXpi030+T0szbFOjK+zehMvouF4OSnCMhhVvyQjcsypEoJ/z9qQskuOxBL7CHrhB7aF5RQuY7Oeg60DwUSIApmcrMnnYHBGlCdr4yH49r8NMphGE3m+yXb11775kGyJg8unVNWpVFhypiKY9GRguLTwJ1Uep1MlYA2+9APDeaG2aoM64IxmVOtxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 17:17:56 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 17:17:56 +0000
Date: Wed, 28 May 2025 14:17:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v5 10/29] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <20250528171754.GY61950@nvidia.com>
References: <cover.1747537752.git.nicolinc@nvidia.com>
 <49f7143c1b513049fd8158278a11d9f8b6c837d3.1747537752.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49f7143c1b513049fd8158278a11d9f8b6c837d3.1747537752.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BL0PR1501CA0024.namprd15.prod.outlook.com
 (2603:10b6:207:17::37) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a0a218-d960-4b28-8ea7-08dd9e0b9634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mDVE71knRiIxjjmeQxH8vAIQKVUIpVrjErYds1qIQ2DC/3MsH8daTgq+mdom?=
 =?us-ascii?Q?US+DFBaIX63pL15SpcuUkFEDKha3iMJhR34r/IpXyUv1YDNxp8v3IM1ul8D0?=
 =?us-ascii?Q?+7fGxqAbkOfTrGFtrlkT7ESOhP1T5glZh8p3K0hz/kA5bmqPKyJ2qfdqvbFy?=
 =?us-ascii?Q?8ahGrc6S7AwbXmyrVXmFRvb/JqGY/EOGo3w2s6jwlQ7e4YzSYdkFOlxuReI0?=
 =?us-ascii?Q?2jAC92TLW7PYmIDi7utCOLlmY1HqZIsgFzyXk/Wy9/ji0v6dweyCSXg8dw73?=
 =?us-ascii?Q?CSF3UjeaDNPrum3sHcObQVleFC21D5BsjWtubW/2qLegaWLnW9s+69Owczou?=
 =?us-ascii?Q?33Tl+0hfHBNHe4p7lLLSMWmsemEO9M7PfyXkrOZ4+rcOsGdnRsPxJA/wIoCI?=
 =?us-ascii?Q?di/k+xGhvh1pC4dlRz9LZCvIxOpXKmlnE9T0sj9aA3DUWoW/fHzOYfrK5SwT?=
 =?us-ascii?Q?3w9jVeLYwWO1FnuGmx5+5e5xYfWQ/HQCynQZ3YBCJovf615xYjQEmr8ZTvsU?=
 =?us-ascii?Q?gGGcmmaHEp5ie65+aIkOI3upHwCmeaeRH4HqyxTYBXxehV0O36M0dYErPVcf?=
 =?us-ascii?Q?icanxl4t9iNYqGu+8x8EHUh0h/qOpZ/e/+E+CYBwI7mD7SBs4ZB9N2Ge6qky?=
 =?us-ascii?Q?sID4ln9V8Q9gNpAdBAqcBucq8GmeJpPh4Ve35km/7gokwjfBC9FNMlUUYBiZ?=
 =?us-ascii?Q?uVMzGGvGbm7wU6pqD81V6oyxD55XKxq4lWug+ctHohRejdD3aeRcdI2/sCiU?=
 =?us-ascii?Q?HqLAAprFopO4HFVrDL0UPdd7wLukW4qdhr2SbAXwODQcZRIb1BWSZ1+Y+y1Z?=
 =?us-ascii?Q?sNeRU+Ef5i+Qur0Rf1jeq9/phJnUQtpr3S7sHT+L+bqxPZ7zdenAbTQakRK/?=
 =?us-ascii?Q?TYnrhIibGcs+MP1CJWdRhUIRmJjB58gtb4RbFgCmw2SiIaQe1NG9rIDOtQAo?=
 =?us-ascii?Q?cNrtF3r8nLnJQMe93neV17+QxIkOGAf5SLTyIpT0epKNsw1Dp6OhVFf9fWFU?=
 =?us-ascii?Q?AckM3mcZY7U0ewjwVs7ZGUocVEeYVm4kdgoQfQWzrPtnhutku/k1O3Cts1fo?=
 =?us-ascii?Q?eO3htX0kQebC8u4ZxW5aAdtExQys9gQMNjCJnPKTqLR0qgu1Q6xuqZCesoWl?=
 =?us-ascii?Q?j4fCz7OkaYjSFXAqGi1dO2IRCgdbaOFe/oLl4FbezW/fIkhZudHTTbpTC4zo?=
 =?us-ascii?Q?weXeCpi3oNHbi7pbZUjzWw6IAXMmLw8xoPB0U/JOPxQujNmKWrs9cHWTf4uQ?=
 =?us-ascii?Q?JQshOI3hZ1YL1/47LCnGU0/c7wUCHCeddc3kQ4iXvwyKAP+zuuE6+BmTIPEz?=
 =?us-ascii?Q?mMbq6DX0K0JA8NTnhTP7HssB1Srx2/3VoRrcJczH378yoPOtREL5wJUcZXvU?=
 =?us-ascii?Q?QiE+//dMmQgs22ySDur2VtuGikAkkpkWESVDngU7pIYrVGQCFT0569XPsdvk?=
 =?us-ascii?Q?x/MSBu8MIs0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxP8nJReXG+D2qjyC0XydHAEdNyw0V7afKt9gE5lWP9ZjmH1PFeYgr59g0CW?=
 =?us-ascii?Q?0cVHAgxTtbv+Uesz+1mw9Cf6beAyN/XUxus0bz0yuDLxOz09A7JFet990IH1?=
 =?us-ascii?Q?U+n1kiBnpGGlniuQW4nl2QDoRNvp7j+GjMW3Pwfymez56cK96uFLSpUec5LR?=
 =?us-ascii?Q?er6WWjPdzQBPZYnQdpkiJaxMWLRCley12ASu7zdh+QyixaHdu70nQzjSfI1i?=
 =?us-ascii?Q?NCbahTM5moS+rIfKT3t3pYBuOdHYzQiqcG4AH/u3WfQMXcljPuk07L6i0VtJ?=
 =?us-ascii?Q?nxf3lv9Z6plq0fb5hNCyvRA/fgWosbcZwBBbCkWYQGM0zI1Hb9SWvmj5khcv?=
 =?us-ascii?Q?Y6esMRAhxD0bJd84WA0YEV9l7u7fiSIUumaVNKBAJC22QVRYKecFd5FfE7xs?=
 =?us-ascii?Q?L6dMZGhaF6TkX6ysidAlmkYfEGpgRp6qLVDVvYJPXEXZbMfLeX7I6S857X0n?=
 =?us-ascii?Q?LqNnqf7HygsVDE78DXQZgD9Zg3HTycvSYhN0gLVbX0s1Prad+hF5WvVfgEAw?=
 =?us-ascii?Q?baMFvETn31oAXlMin5RF9vT2hs26m+tRCuiHHSx7tQo8fwyioPrpbI4s2k9w?=
 =?us-ascii?Q?BWFcvD/LM3BuG1BM6VNM7MUPwnz6cY5cFIvkhlcsg18hHYYELwVB9qprpXLj?=
 =?us-ascii?Q?UaqrY0n7tJQsNcl/y2ObadJGPWmm80pqRTP37JiwQDJ0SmjoRimJIcoeVqbI?=
 =?us-ascii?Q?uOP1xSZaRW3xIy0FqSml+eNIDtsEhxcpaI+/un13C2JYYr2f4Rcr5en3tzyN?=
 =?us-ascii?Q?xt/9r8gfhX7Bct8LAc76RCGHho2ce/pvAzcM7eNuKcCVM7bgCDJJvpogUAkd?=
 =?us-ascii?Q?Zf0q9jaF05rk1dij8Ty/3EJtjVTeEtBzCQkZvHKDsOcHnhGZyoJ6NxWCZMRl?=
 =?us-ascii?Q?XxjnQd7eaN+k0iX3eMoH+yL7Uc31Raa2UGRI2vNHHGe9yeS3/RGssd8jtNf0?=
 =?us-ascii?Q?sdP+q18FsRQdvpGcpwrZpUKKNlAGAaex/pv9CpW9tFc1nUFAt1gKbwTrlZ7n?=
 =?us-ascii?Q?oVNI4Mqcp8ivLaq1xo52OTKbvByCTiO/tP2cclYytaTg0sADNdO4HvKZnFF3?=
 =?us-ascii?Q?rPojro3jZ6XAF8hEHYxOdooDnejZ7YYU6jCk43+fW6D5J0VZMLYKNYHpEkkg?=
 =?us-ascii?Q?XLogM2SQe/xpwmi1It4QdawJAvkSNtEAYhbNPi32UjE6D9qK/qSbTbYQM8c9?=
 =?us-ascii?Q?RcJgqyPw7vkfgHMMr3k/57Ff+/Skr8XP3QJtjyJSzkclLitBLIZ3lClF31iE?=
 =?us-ascii?Q?156rlcw8gyBssTwXzZ5fUamEgLdFkq4/GlGsJvY2Bh+ds+IwzjtOmepadFhP?=
 =?us-ascii?Q?j6Sh3ve8ZRjPmIJa4IEUZJzDGBJ9ved/gkzg0HF/9UDfJ2N+L5je9xBYR0Be?=
 =?us-ascii?Q?gmPhOhBgMX2txrF+h7AqMY579L+D4pXtHXlK/W2WKH90PFB/Ptcghvh4PmSv?=
 =?us-ascii?Q?PIkZFfP+3LcO0ElBrkyZUL0I7Go38Wp0O0Mkm3+axnwbjEnFmTXl5vV0Z3EJ?=
 =?us-ascii?Q?Q9wpWG+aLGxPSeUYqdRqBYzTFtB3J4Z1YlgzWQu67jK4wPL5tj0U0fDjmFAK?=
 =?us-ascii?Q?hVNTKbNC7ocedk8t859VLMWn7uHZe9OIbYNL/qoi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a0a218-d960-4b28-8ea7-08dd9e0b9634
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 17:17:56.1034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqh17P7WFtFS954SAwNRL5vDcv/1emT+0gfDU62QAW8wR46gLuGWZd0WQpbO4rCx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_101805_933991_DD27F65B 
X-CRM114-Status: GOOD (  19.97  )
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

On Sat, May 17, 2025 at 08:21:27PM -0700, Nicolin Chen wrote:
> The new HW QUEUE object will be added for HW to access the guest queue for
> HW-accelerated virtualization feature. Some of HW QUEUEs are designed in a
> way of accessing the guest queue via a host physical address without doing
> a translation using the nesting parent IO page table, while others can use
> the guest physical address. For the former case, kernel working with a VMM
> needs to pin the physical pages backing the guest memory to lock them when
> HW QUEUE is accessing, and to ensure those physical pages to be contiguous
> in the physical address space.
> 
> This is very like the existing iommufd_access_pin_pages() that outputs the
> pinned page list for the caller to test its contiguity.
> 
> Move those code from iommufd_access_pin/unpin_pages() and related function
> for a pair of iopt helpers that can be shared with the HW QUEUE allocator.
> 
> Rename check_area_prot() to align with the existing iopt_area helpers, and
> inline it to the header since iommufd_access_rw() still uses it.
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/io_pagetable.h    |   8 ++
>  drivers/iommu/iommufd/iommufd_private.h |   6 ++
>  drivers/iommu/iommufd/device.c          | 119 ++----------------------
>  drivers/iommu/iommufd/io_pagetable.c    |  97 +++++++++++++++++++
>  4 files changed, 119 insertions(+), 111 deletions(-)

And if you do what was suggested do we need this patch at all? Just
use the normal access sequence:

 iommufd_access_create(ops=NULL)
 iommufd_access_attach(viommu->hwpt->ioas)
 iommufd_access_pin_pages()

And store a viommu->access pointer to undo it all.

This avoids making it all special with different internal behavior
from a mdev. The only difference is we allowe ops=null for viommu but
not for mdev.

I don't think it is worth doing all these changes just to eliminate
the access memory allocation.. viommu allocation is not fast path.

Jason

