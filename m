Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE37C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKcMmFY3qGEscc0tTWWar2D2E6KDyROrrST7AGxmHPA=; b=UzsyQxEv9kZiUr5FYyhzIf/3GU
	ioMN3Yi/GT4m+wJiG4qXiNt24qLIhmBHvyLFSk7GxBJmcV/QbvdSVWUemC2ygQHxCx7sXhYMj5k6j
	z9KxGZG24G3uAfyWNUrqDEvXM2qdfwLeTEEG1U8pRYuvw6VSDUhByBLM2OgG4EMy09n0pTPP5saIG
	Fq/laJpHJZIJY62w9zDDeZu7h9N1KravZ5z5AZuWc0SFMY5wdLjn8kh+br4q29Z48zA25g1X93LLs
	K665nwKmqHUdATEW72taGy1FZsKCgClutBuUwBZqHMbfWptwshxzp9Lc1A0G1UkBIO0FhnE51oBEH
	q7Yq9W5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXh3q-0000000Ebzf-44SY;
	Fri, 04 Jul 2025 14:06:42 +0000
Received: from mail-dm6nam12on20605.outbound.protection.outlook.com ([2a01:111:f403:2417::605] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgiF-0000000EYTM-02NU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:44:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbR2h1IzWXzKHLHmKoRpO2e2NQuQwy9VQFmjRk+yt8k52QhHlPVM4Vcdyn+eFp2/Lh9HNZXZgOTUJIpoauunYhNreanDJaFwdf8B8Hjeq9/XvTwMeFLC+UBoSu0X73OvOsqmQG/e/clPoC3TbIkHtAPQC9UUEdwnXKrkZlUHV9RttzkV80tIaLeGzuSxi29Q3GEpvAb0FJ9NFkoGDq2YcEGXMNTW8LaG6ttU381CihS/Qsx1N035zbO6pMY+up2iqM7mEeFpFLN/Xv71NxLDfv7W7VgWfzsHfrqnHjZUDFeJbmpp5q5n4gc5NxKeMC4eyhKlYEJG1BRD+UnPJkkvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKcMmFY3qGEscc0tTWWar2D2E6KDyROrrST7AGxmHPA=;
 b=GnkQcqBmKqIcPR65aXOilfc2AiyAjwxAOutoJFRt8n/2ULsekKNop6ygrBcmm+QjJ8CmToccjquHHoVJ0hUM74cjHQkdqta2qqlva8tqryRF5/mBFc7/hkKrThV9n/qX1BkH6ZpVUnDYLmi3p8lw2/NATpxrROxc8gnCb6KFUImAIeszgVb7fXekpNcRzomytW7M0G47bOjyJ+utmULX/h4ETIx4JW25tCqXY+I6BhiK0pvrrFeraYSTuE1bSSGcvvLadsjty/nGeIJlqiKEsK4+Z9DkfmajYMPtBLclPqGH/Rir8UUgt8DUO4n1x5j7K6uz+njJqYmRGnanUzwtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKcMmFY3qGEscc0tTWWar2D2E6KDyROrrST7AGxmHPA=;
 b=XOUivJ4td0H6yny8cYlDNPdxSDz9zNBjNNQ0t8Iv5vfdOnm/n9JtV9O7KqGjYGPBvZSYsl9S8+1CAUhje62hK1lKLdUC0mjBPAOeIIyFxINXLDYon0x+wzkuiOJmgKmbXfaskujiNpHllruVoLoA8ayCl6ZLhz9AXIjxqum1ULeQPod9ayYxKu8AWYw2osZrUYzFweBHh26cTvwGST1f8XSU5VFDk9qlaKLBQA2vmb9G5CPWTdbr4L76HU9ttOrcEg1JemI97cnuxKluX67jlx2uXFueW5QxWwzT9tI5cJX0bloJuY+50oCj7IaylWc3b7TzB3KUP+D3wJkJPvaVGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ5PPF183341E5B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 4 Jul
 2025 13:44:16 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8880.030; Fri, 4 Jul 2025
 13:44:16 +0000
Date: Fri, 4 Jul 2025 10:44:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: ankita@nvidia.com
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
	shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com,
	ddutile@redhat.com, seanjc@google.com, aniketa@nvidia.com,
	cjia@nvidia.com, kwankhede@nvidia.com, kjaju@nvidia.com,
	targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
	apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com,
	zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
	dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	tabba@google.com, qperret@google.com, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	maobibo@loongson.cn
Subject: Re: [PATCH v9 6/6] KVM: arm64: Expose new KVM cap for cacheable
 PFNMAP
Message-ID: <20250704134413.GE1410929@nvidia.com>
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-7-ankita@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621042111.3992-7-ankita@nvidia.com>
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ5PPF183341E5B:EE_
X-MS-Office365-Filtering-Correlation-Id: 0297ad9a-662b-4032-4fac-08ddbb00de5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/rP4XHJPrkXF+r7bNwLsiPLMjrMJymBgYHnXeM0mTKSfsPT5zVJcnDVsXQ3B?=
 =?us-ascii?Q?ADrhmZd4VgaLHUyXNyFrP+18e8xpOlTLA5hqv+Ez7TY6sjLwGUhaTM3ViWlP?=
 =?us-ascii?Q?2pb4qvVBe7NP1nBFKRD8cDPbGIWzdwPPOe4y5+exIE2j8lFE/9t2yHvMCTkJ?=
 =?us-ascii?Q?aeysQM0sV0rjDraAiEGBFthgfrCFJsZNDrWS54i7gvzEZM0ro7HSHtHESAaG?=
 =?us-ascii?Q?etCvJk70+L0MA0934+KwuHQDTAnyoTusS3crA7RbGBPqAHJbX6HqWt/NydGn?=
 =?us-ascii?Q?4gqbNLowlvKmc+1zuGaDEkkPC1LAxh6iWWM1NuPJob9xvtcWtiHy6j0e90OG?=
 =?us-ascii?Q?zdYxHq7/+hHBUhzNrIjkZSRhPqAbWquvwlGhFBzFjL96xiY/dfoZ1FiKbXB3?=
 =?us-ascii?Q?NzB2fojfuJTaoC06vy+Igj50GneEpqMHh9TZXHXN5ypItxYZpiBwTXwYJW3z?=
 =?us-ascii?Q?Gwgnqx5LYSSO8Ojv5n0zvt9KCEzmFM9xhjxjS1007wts0mJVDt0fGPW18YRY?=
 =?us-ascii?Q?adr5MMIRmxnjjouGXvyC0WwWjyDOt+J3oLLaxEe/FBeaTDVFEo8fULVFZDcl?=
 =?us-ascii?Q?HZbYtTrIu5maZW8JxycxSBcVjehWpTTkq/wAQevQ7bspF7W9n+jz2VsTnSwB?=
 =?us-ascii?Q?JAldOw2r7GRaAIBLpZnBExFZ42Kolzq905hIFSsNjvLvaDfKopflae2L18cD?=
 =?us-ascii?Q?EvcDeXkk2m8bo6Zeu2sdLP0YTuO+kGHWBRcwgCDUgfEYlsNWNxQNuOqnUSXE?=
 =?us-ascii?Q?Y/UZhKGq4OrrtnkO5fhFSDKmB+DVbDKua2qtWYrGjlnMjC0ogig+mvPVPO8b?=
 =?us-ascii?Q?ypHZLRJ5lI9ZWoO1dJMz9eTodgZEjYkBJ4/ZMeKmRuh0vq9Q60bZF0xdqca1?=
 =?us-ascii?Q?9cpkOs1QICtenD3JbdszP09dVrG4Zz42G2DjDs7dqJXlwWI0yasql4coiBhT?=
 =?us-ascii?Q?+LfVu8jUyrrRkWfMpoDRp2i7QmjSFYcNvHsfC6He1O1wwtNgYCGCSwnT4tCp?=
 =?us-ascii?Q?FNwcXXQOr9meLqNZ3OO00BZCoZA6+t4sa3qJQKcPlRERcyrzRnlagZclUKHu?=
 =?us-ascii?Q?6wyu/2GMwqgFwz+R2sY83XRvM7sdCpkOR9nZ49az4uGE3MU2zSaJUGKMmq5O?=
 =?us-ascii?Q?5Hw7GH82xqKnklJhiKg4JYzqn/9wV8XHTag7I6L1XJbu9TCgkEieSRQglqXX?=
 =?us-ascii?Q?q5oLuj1caRILi+EvObff3SjAOfElosX/26xznENcjmClSPFsDIPna0gOQg++?=
 =?us-ascii?Q?lu/MZ0NMfCmzQmLHEG44DhmrzvD7sjewDF1jW2GbJ6qS15tVbo59FS98vuDj?=
 =?us-ascii?Q?I5YHWNUN2HayFZrqXGtv1E74fNj7REH/05tKBnh2O6y4Y0rCdjiDk4aQ0ZLi?=
 =?us-ascii?Q?LW1r+J/ry494m1aNoxNoONa/93C3Toeixx6G+Udb/+f9ZcQMtYmAlmd1v4hD?=
 =?us-ascii?Q?si47moQEC5s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L853Snv91Wc7aiKEU/NNsmmTz63Ni6ifKL9C/pbKGwIjG5P6J51b+BMqapEx?=
 =?us-ascii?Q?byb0GpjB+XH0R4/fURVOaMlvCPf+OYl5qGAyuu9ZpvjnRLgrsIneX8OwYP8v?=
 =?us-ascii?Q?XPTpoiBgpcsVut2sRbEFCofRYu/ZQItsDYBs6sri1/Cd6SFpZ1fzXpWSV2dU?=
 =?us-ascii?Q?S7Hmzqre9nNBuwXOzsQfMh/eGWmNXjCiArz21uS/QiQ6A1rq8bdiFjwaI0l+?=
 =?us-ascii?Q?/smQNg//wABBXBH0txGuVOeUm9OiGuNP0t503/4YKwV5Gim9y05vSvVGNKV1?=
 =?us-ascii?Q?rL4JMfmG8V8rfM0gascOC98mBDscXFNtRZ/fhGwq74TLiyQuKa2H3O/1U2NX?=
 =?us-ascii?Q?EsRy1c2vIXxFpdOkDijFABaJd33E7NZjy789QQJRbchWdlM5aTewMzsOKaTc?=
 =?us-ascii?Q?DOrv+RplS16bTg+zKUC6gtuyOm3Fz6yBImiVeCXeQ3Sda4sgaHJtIuhsBEbY?=
 =?us-ascii?Q?JWSFsoWhxDlW5vbGmdxfMBwoXBx6qBU/v48QKHb+9Frf7jABbrmRQpbd8X5i?=
 =?us-ascii?Q?J+ZmvKhdOLJMYURL24MyRHMGQUjDIZ+InZg4NvjleKhkTtgNrwh4zV8fIsMz?=
 =?us-ascii?Q?m/joQp8waGAUwSnKk0GKBr3KRs1sc3Lgh0KD5ohpV3OxlqlzlrBZ0hz96ZLZ?=
 =?us-ascii?Q?nn88t6doVbiN7vLfz7g1gyNG2zhHGOchgXnI6bRAuVGln4x2rEIFt4nH8R3i?=
 =?us-ascii?Q?+YdbqSofDJiMnyQNDBSerLt9HTlbAG54BpotiqetrUP0uZbGRhMVpc4paM78?=
 =?us-ascii?Q?GDNEPe6a823JMa+rUZCu6CHFlTrxw9fsk876ynwTMjc2B2rRZq9oHVpztzAQ?=
 =?us-ascii?Q?wmbMLD+3cFxrLpkmxFe8FbAfOZywROzBd4F6Kipn4j3g84HenBFdLyP25qlR?=
 =?us-ascii?Q?HLD1lMpiGGAcQxbExs0+fVXczhtE/caf6UH13vY9AONHhko/hd7PHkMmuQmS?=
 =?us-ascii?Q?tbmFtzBriuQV3nQEHpa99/tnQppFJpNa9RhTFjbyNperZjGnN+J8s+rgMVF3?=
 =?us-ascii?Q?fcr8+7SEBVuP8xBDwb5nocT8wXAsRQcttOK7Vpv5F868nPjQtW5U0wztWjIh?=
 =?us-ascii?Q?atln9Ht9E9Mm/7tChnbq4aCC/JVfzZ99O1qWApKgiayiw9ZGHLRfGpWcyAc7?=
 =?us-ascii?Q?w7ZlHO+HXftAKZU/kC0TNHZ7PpXe2zDNNF4TxyK0uyoFRRCayXNnUesIZwv+?=
 =?us-ascii?Q?LMhBRp0j/KArm1lgI5OUORFwmPYlreRbEEPliRaZweWiuU/OHSzDV7GsM/9O?=
 =?us-ascii?Q?cJ4dMwoKcR9E0OMlw7Mb08efGoN5EyMN4leZJnW5P1ffXD1qTjGwb7izRPW/?=
 =?us-ascii?Q?d2C2ciNlFKmFo6J4L6cqGlweazn0oyn6K51WD6WWw2/3K5a4ZXr4ptjn3r8q?=
 =?us-ascii?Q?c9VlhmaORiXS4+ATsIOOCUduJS9zIX25lby2IkzJUBh1BFWN6QG+UXvaWyJx?=
 =?us-ascii?Q?BRjnsrVmIEkBlvkQOC2LvSWEWfcdhMY1iuSfPzuADdL23Qpz+tHkRpzdzN/I?=
 =?us-ascii?Q?2tyOdzlKgHEAf3k08G8xgt0blFt2RInUlNAnTQ9xgghoLSBgB+ADJBFDbk/C?=
 =?us-ascii?Q?noMyprmCYa8vrLWV8ijgPwfEAplh4uflvGtxFhIJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0297ad9a-662b-4032-4fac-08ddbb00de5e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 13:44:16.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gtio6CCj2Lfjq/RL46R4tl/7G+ifeazbwdKDJaCLuMssJtZHnCZxNmmehHEeRlUi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183341E5B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_064423_048761_84D10DDF 
X-CRM114-Status: GOOD (  16.02  )
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

On Sat, Jun 21, 2025 at 04:21:11AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Introduce a new KVM capability to expose to the userspace whether
> cacheable mapping of PFNMAP is supported.
> 
> The ability to safely do the cacheable mapping of PFNMAP is contingent
> on S2FWB and ARM64_HAS_CACHE_DIC. S2FWB allows KVM to avoid flushing
> the D cache, ARM64_HAS_CACHE_DIC allows KVM to avoid flushing the icache
> and turns icache_inval_pou() into a NOP. The cap would be false if
> those requirements are missing and is checked by making use of
> kvm_arch_supports_cacheable_pfnmap.
> 
> This capability would allow userspace to discover the support.
> It could for instance be used by userspace to prevent live-migration
> across FWB and non-FWB hosts.
> 
> CC: Catalin Marinas <catalin.marinas@arm.com>
> CC: Jason Gunthorpe <jgg@nvidia.com>
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: David Hildenbrand <david@redhat.com>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  Documentation/virt/kvm/api.rst | 13 ++++++++++++-
>  arch/arm64/kvm/arm.c           |  7 +++++++
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 20 insertions(+), 1 deletion(-)

I don't know if any VMM will ever use this, but it looks OK

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

