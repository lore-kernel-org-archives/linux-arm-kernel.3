Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2D2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 20:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZSqk+PjmGKYdYZaZDgoZvFrMjPswPJFpczt0kc/sJk=; b=F4MeZ4UgyljLCAhErRm+2Xp/VY
	gRbwKvos+2+WTvIKsk7Gdkv/juv7wXH49lzKoYmPKb/Rq5/n4jRq2nSvEeCxCnguBs7m0EIb4YmvM
	EHbN3MjyWAeEIPEe25Mjq6o1TlWeYbJM67ozsz+jhzIdT4ULXM6mjwrLlNGJ5jjzLa4/Wpym8BPuL
	Up8SBXzS/nn4UXJFcgNzol9xGSrAV7MobCMwPJPjtP3D04qrEKKunMTDsD02yc/UqH/q6chTV/S4T
	xitg0kucBLXuiddQ4LkUVfv8oLP/HA2hno4ZBCb+eJrmM6NM08ai7hBKI74h4dcZ/Ph9rxiB0zkMb
	BbIQXX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taKaI-00000008i4n-23KP;
	Tue, 21 Jan 2025 20:10:50 +0000
Received: from mail-mw2nam04on2061a.outbound.protection.outlook.com ([2a01:111:f403:240a::61a] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taKZ1-00000008htt-1Hml
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 20:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnNUWAp76PY7/6kaWV3DryAskeSHcvddlFuCg3t9kEaqfh6udzb8sSX0tG4wdSBPvaB235RIakRzcwmlt2Qrx3NwluZNSfl8FJpgMBm7LDav8Z3qfto75TZMHUVbOO8YRb6pmRdAKxt3qg4bd4uHH/r/uvqpx7QFLm5dDihXqXJdEMoIEcEGOgJkT3ctv1Nxz59evZkfaPVH15OGHxx/W28HsMkX0GevSKR1ovdP3yqpolt4jF1yU66neeKM0px0v6XZQue9bsYn1CVzrMTICnAX0ZyvtQLDgxZfH3avtfpnI+OxAWXRLcUfHYpRC/DBvJhqgyNEfGLsyo2P7FP0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZSqk+PjmGKYdYZaZDgoZvFrMjPswPJFpczt0kc/sJk=;
 b=O8dezW01+lWswfJx0C8y2Jvzyr/UBR9HbzyzXMUhlCPyhbkWVJ1wdGNNjiNlbHp3fNLe93iJQQXAb8pHIiMPtBEZfQByE5+MYL76bxXyTpI7QdMRL+3XLPpPQinJAuzQ/EonGaamOUTlfwdFqnnoJ0TZGMmwFVPWA3iLxxhO3HW+NmsmPOZJv7Nj/wgGiCVp7lp+Sn5u0yY3rpGcEuO14p3OPgaHwI9EpN807Zl3ytLUXFGBUrzma05ARqNOYRVLobdzFAISSnQWHbkoYwz5fMsqjhwTXYnHAa1wF1rnAZnHqj49nxpNJNJ+Ze8cEKbFltDg+L/yhMl73D7NPeIHWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZSqk+PjmGKYdYZaZDgoZvFrMjPswPJFpczt0kc/sJk=;
 b=sdYFM9Q2Z/OTqIdb08ApoyaB5eQiTRGVOp3IHehBZPWrz3PhKSxwj096f/JTEtzDmjnZZXQNfD043jqe+mF7HxG8DeTibWFoCZIy/qQKZX41OrEb4u5DYgJbHIL9TAXYy/4RTEyvtOZ/8Q+TaYjw7Pk6s+sN2lVF0rGzIxpgM81kDTYOqHzElm/hGfqrpFU2K5isyUr25IytWuqC8Xz0KAvxntxvxlIX8YAvf3NmuCBti5w9VGXQ2El6PA4YQc8aL89awUPw+1vYYzS6hks/tWiKplFXBgqYV8cOGm2MeD8APWlqEXGeqmSKyxjF2nlnx1qchpWvyHOhSEYp+4+uMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 20:09:26 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Tue, 21 Jan 2025
 20:09:25 +0000
Date: Tue, 21 Jan 2025 16:09:24 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 08/14] iommufd/viommu: Add iommufd_viommu_report_event
 helper
Message-ID: <20250121200924.GZ5556@nvidia.com>
References: <20250113192144.GT5556@nvidia.com>
 <Z4Vt6DAMDfEv6tb5@Asurada-Nvidia>
 <20250113195433.GV5556@nvidia.com>
 <Z4V7NbxGyYoQN0yV@Asurada-Nvidia>
 <20250114134158.GC5556@nvidia.com>
 <Z4rVg1Xg5TCiFlSb@nvidia.com>
 <20250120181854.GQ5556@nvidia.com>
 <Z463eXfgNArCOfPn@nvidia.com>
 <20250121183611.GY5556@nvidia.com>
 <Z4/7pGx6F1mpAUuV@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4/7pGx6F1mpAUuV@nvidia.com>
X-ClientProxiedBy: MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33)
 To CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM6PR12MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ecae9f-6a07-43ee-7cb9-08dd3a5780a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hU6MGJPcMN/OqrpulXJVZmqGtjjzwsMpasiIYEX6g9lQ57dPx9WtmyyPt4K8?=
 =?us-ascii?Q?btAX3Cc9XhpniHXQG5aPNOymABl8iSeL/nosqlUOO0ecGdszlkrpUQHoiXzN?=
 =?us-ascii?Q?vsZpWWNtz542p9Oj1U6NlPlLBfOFYJYQcb+AYHwghOSVbvtj92h08XvcaDOX?=
 =?us-ascii?Q?3lbC7LsW3K5iyF5l0SPJ/N7vtnfxd1GBgh2WgRL1qN6wNLzC+5KneGygAhKZ?=
 =?us-ascii?Q?dHMuREHKRdDTF1nmTuG/79souzLHyc+N3g1WhabUlwUoIqQJL2SElh28Y0Hl?=
 =?us-ascii?Q?nmvTGJGiUEOR0JyvP6LWGWqq8Njdfspz2EiVMiW+DNhvzF8/ASvaI7aUe7Sy?=
 =?us-ascii?Q?0cHJ0Z4Wi1hZU7vPkM2UfWttvwkKxRpIuCJk5xSEbPofMZ0YCJjg3hWq+nhy?=
 =?us-ascii?Q?6hsyHrHKXLaPS6wuuZWAp2aDpV4RFHuiUa/552TiLyBI3EV0RcI9F6DS5DTu?=
 =?us-ascii?Q?YsP1WHqcYOYOkH/vOrI7h05u076flCy4FwMY7V4ev6TDU7GNhbdM7vva3F20?=
 =?us-ascii?Q?kKY0mlMMKvnWGpUcQDfw+c+HvEwmOgiXSreSQIETTXX1xpkAmSyuTrnZoiwK?=
 =?us-ascii?Q?zQWlBk0nou4nAnIeZ345ANBYUVzCFEsCqlT09BNHJsBaycdMJdSpFlfvVMuR?=
 =?us-ascii?Q?76RbEUa946P8nq+uFBWzkAro7sXLMIy+MO91imHM3tbnEkgvWIyFskPJhVlD?=
 =?us-ascii?Q?FDvby4/poOqNy0iEp5UQIX2Dt4XV1x0N+DJuHxwRLwTZu+zgcm58xy8k7TCQ?=
 =?us-ascii?Q?d3Aou9eLrRo7GbMOI4Mmh1wZniVnAyBLrzooRUbQStsGe9tCxN5wZKqlKJC7?=
 =?us-ascii?Q?r9T3npuYEqR07aYh+noLDByT29URqbcmO/M6XI7cNjvvBEZmDnRYTY+1IxAi?=
 =?us-ascii?Q?NgasxPsJt4Y0XXLyxvdIA27dUQwEogMM5feCzQyPqN02TG32UXSxEmegyg5/?=
 =?us-ascii?Q?MQb6YRjOEz6gjDcFOp2Aa346ZatlYgL6G4637knWpLfJly4gllSia59vCu8m?=
 =?us-ascii?Q?LI0bHLURAVdeS5TbgARYz+G0woh3xkFpnBFeESas9ptScmlCLHUL4F5bH+zP?=
 =?us-ascii?Q?tSbnHl6GyHPL8EkSjm16ccg29BKTlKixPV0wplWo01ihFDNUpdfRHFyRCULL?=
 =?us-ascii?Q?hqWc7lYupxmuy3e1QzkcUJxyitwyzGgewo7ydDl2SfsNio/noBqHLTdEJPby?=
 =?us-ascii?Q?3hy0gqp1zOXmKx2CSuCq7SVVQCNuiBFuGybUqhyt4HentE1iWayFee5GIAbM?=
 =?us-ascii?Q?NZmVFcDy1P2HDyp5RFySYX45EiTTZOSuKtUrQqvZPUg/3rELhR9hFAF3X2te?=
 =?us-ascii?Q?StjMft4crCbRYc8tP9AX3BO3Qz5+kYoN7eq4hl0J/glYooUHeFy5SjSwyO/t?=
 =?us-ascii?Q?m07GeRdp0Fe7jLO0JV3VNgj/5c/Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?00lJZc2Q5K0m9fjVzprx8mWbOYxbbbaP8lhimhJvXYDqHgcc9KpmDql2/3n/?=
 =?us-ascii?Q?J7OQyefGe30I/8R2QyTkIFqajXzzBGXDPlIm9kwHtE2TMaHFwhSSKUwsU+8h?=
 =?us-ascii?Q?yD4o5JUPdQHIJVOnObx1ODyECFRYIwCZBofWiNSvK5oLLQqPhdT4ivDi4QjB?=
 =?us-ascii?Q?Qzv9YiO0S/cjH5a88sp7VdTW78oJjjoBdjboq0jNhcpuEzeTdPJgsBAOgVOY?=
 =?us-ascii?Q?zawwRt/FC2kbLUt8BRnVNL9DDquEdcnNi7LKdesjPXNnji4c2MJb2Q8fOW9u?=
 =?us-ascii?Q?Excm+FzUKuH0tAvZ6g6MLVGsQfAzWj2AuOzMAd+DtbdHULRuYOF5zhgrs21k?=
 =?us-ascii?Q?zpP5x0qQ6sR7k7PGoaDX8LAXwxgQ+4yogdhmsl+tsdkr1ermqDRdSmcYUjWH?=
 =?us-ascii?Q?MLnESCGfM/HTUnEfJlRPdePODuMkQd0Mdu1sruOV2zgjwEJtlFH6EWnix77U?=
 =?us-ascii?Q?5QMLbmD/pVHP9FR6O3n241ZOvzd71b76GY1+4hr/EA99YOvuU06Vo3dmNaEw?=
 =?us-ascii?Q?7PdkLZQjnwoPO+ZqXTZTyd34zBO0KAyxj3I0SBj31jZOumYN4GkCgP6A3r/i?=
 =?us-ascii?Q?Llu4sIP+PLM7No9Knd9aLnREnbEUbplR+5bZTxPRaihsgf+Kf7yFJH9PjelU?=
 =?us-ascii?Q?lHeiqb3pz4WA+j0iQg37wAx8NuaieQo7dtnvxGBlW2yZ6ouPj58ftoB1adMC?=
 =?us-ascii?Q?vz8pQwDBjw0EDmhsZlWU2ObckMEATrYWZBwfQsqrtYvFkywVFOHwiso9Sdzz?=
 =?us-ascii?Q?swXTiehCnmuh3rZZG4ishC150vEknUhcDU6paSihjMsKbcfqqbjYS/oCjI8n?=
 =?us-ascii?Q?s6sAQzaKA7dRU05qyYbgvUZlPoJ57c4m7nt0LJhU6EwvkOpShaoj9mAsETks?=
 =?us-ascii?Q?nivacrdPUIb1bjOZR4IUTcT7T/NY3ahW/3NrMUBRmGVge3z4Lp0/u2PYPegR?=
 =?us-ascii?Q?uC2AsuvAZSqbWmL90KlG7Gz/XC9sKkPpqyzLVW8BFF+6tpe3jCJ3BGsIn7IX?=
 =?us-ascii?Q?qrim7ZybpLcgIQkSTJdd287Orhp70sfU56NnK8ZJivgvXEm/WxEFRY8N+foG?=
 =?us-ascii?Q?PLqP6yJOnFO1KR2Bf7VrB5fcWQhqFTd+/LikkboSLjuavLhdHHFDGSbLBQeX?=
 =?us-ascii?Q?mZU72IKF7QFoWTH2TB+cesyrejJFSHMcSX95bzaysk5lwSkUxuvuSid06Yjs?=
 =?us-ascii?Q?LKDkCWcjYfDz1iXhug1BiF85UmNfYdPu7wS8C++wLDZ9nEX4dzH0KcM2mw0L?=
 =?us-ascii?Q?6JL7PS1wNBA5IN8iVm+rpDF7gXFuXbegWRbsGtnhE5MvbzV2cDtklMssNlPF?=
 =?us-ascii?Q?GCC64Y4o85fzdEzwGgKqPFHaZUn+sHgPajuk7WUn7NtH8ZAJ8CHYI9HwiRWT?=
 =?us-ascii?Q?hijxcaKqzpF1cutcJo4Jl+sxqJu3KMd0SVqM8g6VwFYN3XpxTbgW3UPch+/2?=
 =?us-ascii?Q?UC34JDl4UmkpzxXUfNq77h3oDLbYIHjjbgBiM59CzwTGT9Lz13qkB63FqPT8?=
 =?us-ascii?Q?KYD8XVzZsWefXY5+Zih1se0aCVNwQ6SNZnIMKNwKesW98Z5CmDxctolqwVDW?=
 =?us-ascii?Q?qnHwqP1vc8jMVadhzcE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ecae9f-6a07-43ee-7cb9-08dd3a5780a5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 20:09:25.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgpylIbWcmM7GHeQj8yesnEjJYMZc4NECWQNbAl+0j0rUG5u0+RR9Z6d7r4u+YKs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_120931_350992_3A6CAF56 
X-CRM114-Status: GOOD (  35.19  )
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

On Tue, Jan 21, 2025 at 11:55:16AM -0800, Nicolin Chen wrote:
> Ack. Then I think we should name it "index", beside a "counter"
> indicating the number of events in the queue. Or perhaps a pair
> of consumer and producer indexes that wrap at end of a limit.

sequence perhaps would be a good name

> > > > IOMMU_VEVENTQ_STATE_OVERFLOW with a 0 length event is seen if events
> > > > have been lost and no subsequent events are present. It exists to
> > > > ensure timely delivery of the overflow event to userspace. counter
> > > > will be the sequence number of the next successful event.
> > > 
> > > So userspace should first read the header to decide whether or not
> > > to read a vEVENT. If header is overflows, it should skip the vEVENT
> > > struct and read the next header?
> > 
> > Yes, but there won't be a next header. overflow would always be the
> > last thing in a read() response. If there is another event then
> > overflow is indicated by non-monotonic count.
> 
> I am not 100% sure why "overflow would always be the last thing
> in a read() response". I thought that kernel should immediately
> report an overflow to user space when the vEVENTQ is overflowed.

As below, if you observe overflow then it was at the end of the kernel
queue and there is no further events after it. So it should always end
up last.

Perhaps we could enforce this directly in the kernel's read by making
it the only, first and last, response to read.

> Yet, thinking about this once again: user space actually has its
> own queue. There's probably no point in letting it know about an
> overflow immediately when the kernel vEVENTQ overflows until its
> own user queue overflows after it reads the entire vEVENTQ so it
> can trigger a vHW event/irq to the VM?

The kernel has no idea what userspace is doing, the kernel's job
should be to ensure timely delivery of all events, if an event is lost
it should ensure timely delivery of the lost event notification. There
is little else it can do.

I suppose userspace has a choice, it could discard events from the
kernel when its virtual HW queue gets full, or it could backpressure
the kernel and stop reading hoping the kernel queue will buffer it
futher.

> > Without this we could loose an event and userspace may not realize
> > it for a long time.
> 
> I see. Because there is no further new event, there would be no
> new index to indicate a gap. Thus, we need an overflow node.

yes

> If the number of events in the queue is below @veventq_depth as
> userspace consumed the events from the queue, I think a new
> iommufd_viommu_report_event call should delete the overflow node
> from the end of the list, right? 

You can do that, or the read side can ignore a non-end overflow node.

I'm not sure which option will turn out to be easier to implement..

Jason

