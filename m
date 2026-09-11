Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C5FC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 06:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3+e9+SW0xw/ZCkOLjq2qbZOE8/iM/z1glcGK7to7Jo=; b=C//2YYS1Ve2JNRzPzi2IHBdatj
	v2ppewG+pubnHJt8RPQTZhfYZxtHHM6CDtfpKJtVFmZg6PKFd0D4huD0euVfjgXe12h712L4wXsdO
	Jsyg1zPfgXzpsEIOP2oFR7iphUZRJvrAtxh2Lbf4+sKyDzeFUzaJmH503NuNnc7xKirnr/Ylq2B5M
	FXm1Rgd0cVwlYQe7BgKUMTqZn9UK/lPDiz8STAnNFbsWqaAPQGMLqiSQNZ7oFry/alwYpoX7nDYE3
	ouIY7p9I/wcjKLWFHsd35auw7DUX/72fvmepL9kS08gZKDNmtrSz394U1G3UGpOEAQmUOGMPoBoqf
	TkZnUZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4v67-0000000Fxxr-3XZD;
	Fri, 11 Sep 2026 06:50:55 +0000
Received: from mail-westusazon11010063.outbound.protection.outlook.com ([52.101.85.63] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4v64-0000000FxxM-2w8r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:50:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVYVUB6bncnOci3ndOKmjyYR5BhCdwV1c/NxfVtsMKTILBnIPZrV7Y+fwFGg8qmR0hawsPEOl1xc0/poad4jj9jIPfIyVkwukXsBh8F3qjHcosYJY83OCaH8BtUkSo1GtOi5CuQyd59+11rTPPmMmph6nukdeK1DcKto6RujvPHvORFN6KzY9QkpzA7u78e+tQHMFhfgFvHUWQnHR/rj99MQ9jgUqj1le73eAjc+AFwmTKu+YEWukRAY1k0MPbqlJeQh6dQgk/9GwvVWLb2KqZof2lC27jaBnP+vGn0STgjCiGmzQGxJaPrIbgXeAdWxyMP5p8FsArIULH6jPzQN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3+e9+SW0xw/ZCkOLjq2qbZOE8/iM/z1glcGK7to7Jo=;
 b=yfQz3Al+RSJBDU7swbzydjHfmmOkKoN9Z3TOHZKyB3apxwCkTl/zszTziXtiRTEihxAxk45UerQNkIMdEQ2fYWvuklIyxj0bYigsL4mhpORbHbI0v1ftoeOS984QKxhRQY9yrzcfWtx8bYRXjbTF/V52EDak0ArnS3iKYzvzx6sBnCbVyHV7IbIaSvuqONSom7slQruZ/OvDGoDCNE96KnALwI5gDwF06WxizDv2uPn+qBEJKIYDyoyogjZ2p+oUL/rJAmUjipDJReIho8HZvK90zCrhAWFePDMXEh3Apf7C23KRmNifC/ItNAENBXmD94P6mvCIHcQxgr7AACd5dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3+e9+SW0xw/ZCkOLjq2qbZOE8/iM/z1glcGK7to7Jo=;
 b=RUvS9TLFYdLrPBcfKriNopkFlAwUB6xcOgjnBwFaUujnCaY+MSKNDdmZYkKCt6lblCJ0OA2cMY2xpp8r28/fUo1sAg6kWdBdO2xoUg7T1ne+/vNjVOV/e0qWdHJUh4AdrE0tPecufBzRRHFDHtgj9hKlb5k7TRmW6R3HQU1ZMCxg34Kt2H1hJULRlE2I0uwmU7Eh4HR98nRF3ob3a53vyR000+1vny4xs8FA6wIZEWF70tAKc/l+/YjjVkxO5mPuL7+bsMXLdZbfbYuy4zItdbbKeLNQRvTIDnFWCoV7UctoI9ivJ8xwXMeZhf+jBpnS5cfW/V2OMutfpRhub6GvNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Fri, 11 Sep
 2026 06:50:42 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 06:50:42 +0000
Date: Fri, 11 Sep 2026 08:50:27 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <aqOksw5aoBDtuWI0@gpd4>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <aqF8euAA8wLmr4w1@willie-the-truck>
 <aqGEKHfxcOzYiuBy@gpd4>
 <aqJwEpnrmqnEzpui@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqJwEpnrmqnEzpui@willie-the-truck>
X-ClientProxiedBy: ZR0P278CA0166.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::13) To CH2PR12MB4824.namprd12.prod.outlook.com
 (2603:10b6:610:b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 65821c2f-4457-431e-8ef4-08df0fd0fec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|5023799004|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8ZLpS1XbkUDsR/rHc73BxJMwRCVXE6UvQri/dDzdNr+LljppjGmBjdtrk4Gme/sf2CY/WC+qkrVPBhNSeyYZgYTA+q3Bg5FWqcPn7PD2+bSAZd4jRxj6NpfaeWM9/56upyfAScNm21Bjez33h3Xmyj2nNP/CHTj8yd0h+RrmlLxvnwXrx0oL6cUy8+7XnNqTYT3BNUQ3m/w3cSbUXo61Ktihyw3Oo+pbiUa3GgobF79zN0oO+KE8pVOgDSHF9I34Sek96Ego+3FiSxpEruL/1AKgmQIChNEltTg0c5lnYWRmWCYttbn5hDSVNtJF23yN2xdApXgdQILE+LHHatnU52V0j+zlZ44AosqiwNrJKq5bfGy/aTFPz8Lkj4H6QffmntWBSrIW6s9Rk+Vw5OhxFLDvMIvuZlufza/u2j+o19JeobsiIs0HrGE97bynoVOcq6lACr0NDMv41oLx5Sx1PwKNWZjUHpS1l9wD6qi/mTewuMb9CuuhLn+IPQxQ9gnsr70zf6/T3TLk4Vg67PYkdlejQqxEjqLRxrk+WaDpED+QHC7kH1HhBZ3AofYgEV41zf/seeBEwHZTuYHB1Ju2Bd/P9ehL19Qyb3M7eqjGPmLLyFNu/vMbLCbtY/4CXRLxrO6HZLV/HLRt34/SmEawFHColzPkzotK63Sh00EXfsk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(5023799004)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vw2ns1NGtUeDPM+eP5pJ82pZVWzulsAkjrcQ5sw8LGRQXw/qA/Ewgk8078d4?=
 =?us-ascii?Q?oO9EfA08n4kxbga/LEOfgKRMh6tW7qo44D8G2/5xS2QtW+8TnIA2Ml3yXb8H?=
 =?us-ascii?Q?uw0LlY+NTG3RLz0chQ7FQHXjraYbd5ZgORfqRxNGUGf6dZUGIoEVXhflDGCk?=
 =?us-ascii?Q?85DvhE2SVrHYXZ/amU1q2yk9z2vjVfAJ9VCL5FOMWRmpEL1vyEj2UvIQHQar?=
 =?us-ascii?Q?mVkXIbPxruCKxBPZ4VxxzrIR9H1LFt2PZFTug276LvokeqJ0+JUqNK569ePW?=
 =?us-ascii?Q?smtVvsozj6o5wqvsqVzWOHB01WrRiaSatBMeOH/Bwj87C2r/H2SuQGXtn/9v?=
 =?us-ascii?Q?H4tWmqzhkcOB/jwAumznjLk7ByBh0aJJDfBYbt51f8hqxxlpVk4D8Yyo0w9W?=
 =?us-ascii?Q?gOe3wRidL2JY6lvIRop7A+hem2npxdOMs0oAwmyOsjLRluXIMSrXN1bGoWOq?=
 =?us-ascii?Q?CWR7kxkE/RdnizLpR+Y900eeYKH6TqzfwuiHZeR3q9a4ttYTM5hqyl1pv/rH?=
 =?us-ascii?Q?vfi17sNw2dlYBeWmwKQkT5LjaSyJ1NgYrDmliVqYjji8bhC+HEzRXTfBNvxI?=
 =?us-ascii?Q?pidu3P59ju9UdNxTTKVSSqthB6zBL7JIlXW/e3k/CzVg/Owt46Q2mr27vFaL?=
 =?us-ascii?Q?c13TmVUXkPdayW8RFiDCgV9Ue9TqVX0NA7RL05Jmgy1RofLcoLr1ESGBYvXf?=
 =?us-ascii?Q?Dk1N2fC4DtCRdAu4U1zgIGtRBF9yKnC8hLzspSKWz8058sPihrodzzPcBTa1?=
 =?us-ascii?Q?m/Gs1B1z63PFBpJl6H62oB27g1DKGS+td05NIUTLPKfTto/YCCZcLvns4EmI?=
 =?us-ascii?Q?g26Uwr/3IPMdI4P5n419jj7Msq90Z5I6Nlq7NoXc3cL01kDvH3tsxG/m+Spg?=
 =?us-ascii?Q?wrOaikQzlkblJhT1KYZMfjSfMLg2KDeRi94DXnlqbSHtNUoW+CK8s+ADQKAM?=
 =?us-ascii?Q?0ymyFQ0B36QORiI2l7lJM4oJjYQgMn/OfOoZsKCaPWXqT5Epnn5cwIO1DQOP?=
 =?us-ascii?Q?ucdU49K+D5qICyBDzJ7YIS3YxJuR5+IykqGIy9KMiPHEWbvWrBY8eCHOvpzn?=
 =?us-ascii?Q?YyzivAUt3LJnWCzgWG1UiMgL22d74dlvI4+BFox/4yFeZWonQsj4G1nfyqWW?=
 =?us-ascii?Q?DQL8BcOVgcbvHgeEDGy4S1WpBsJeZsCFcjl5HmjVRGcWdIGCR5Ag8ykQsZft?=
 =?us-ascii?Q?wUEWyw7xue3zEWKk0jheWb6qeFWYaishlelyms6wi8byNzkVUlNUyeB3LxXu?=
 =?us-ascii?Q?q8fgi0pK9s23eOLkTU506rNaPO5Y34F12gqv1QmPayNWNDx8mAbEOH/5GvfE?=
 =?us-ascii?Q?AclOCJtYLf4epn2M3hrMdw0P5saqRhTN/5yhEKP56zbOZgg4Xi/KiHzT9GIU?=
 =?us-ascii?Q?K8EqpYvTC0J0eT/vkrjERvqfZN57yAg1doEa6CddtPCfO+yiYRnfgNPJIp8O?=
 =?us-ascii?Q?xJLuRcZLtXjLeMWs0U4761C1oPMsJNR5QZlwvwgzx/98Wd0Yhleura/9JdIs?=
 =?us-ascii?Q?oa/RAYrFaEteNaiJTzYGPXv+Z4A7sbqnPMKs9Nt/hbkbLrBKfvRaNOlPY42W?=
 =?us-ascii?Q?9M5guPVc8fVOTO5WNGAciA9qQ6SHcN5+ROQFqapTgyFtCKxDX33yyZlcCx7f?=
 =?us-ascii?Q?9DxK/FCUGhickLFC0/5beg2MgD8V6CABXe4pQYCibZvOd4LNmfojFAr8TFh7?=
 =?us-ascii?Q?YmzNqun/l/QwCUwVi6QNoVUah0X2kgHKHAVJ6ghl/UfZ0/KI8YcCTSMT3Tac?=
 =?us-ascii?Q?fL1gzNqp/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65821c2f-4457-431e-8ef4-08df0fd0fec5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4824.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 06:50:42.0216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxbaWieRrxP/pBJxMom8yciyRraK6ZN4uIlqZAFFzBVLirrMRsd6HGUNiljhUvShdS0KdvB6xJwpj5qDtLX23A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_235052_776882_FFF5BFBD 
X-CRM114-Status: GOOD (  28.32  )
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

On Thu, Sep 10, 2026 at 09:53:38AM +0100, Will Deacon wrote:
> On Wed, Sep 09, 2026 at 06:07:04PM +0200, Andrea Righi wrote:
> > On Wed, Sep 09, 2026 at 04:34:18PM +0100, Will Deacon wrote:
> > > On Wed, Sep 09, 2026 at 08:26:08AM +0200, Andrea Righi wrote:
> > > > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > > > index d28438f8b83f1..e5a7a4b2e3844 100644
> > > > --- a/arch/arm64/kernel/topology.c
> > > > +++ b/arch/arm64/kernel/topology.c
> > > > @@ -19,6 +19,8 @@
> > > >  #include <linux/init.h>
> > > >  #include <linux/percpu.h>
> > > >  #include <linux/sched/isolation.h>
> > > > +#include <linux/sched/topology.h>
> > > > +#include <linux/smp.h>
> > > >  #include <linux/xarray.h>
> > > >  
> > > >  #include <asm/cpu.h>
> > > > @@ -44,6 +46,55 @@
> > > >  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
> > > >  static cpumask_var_t amu_fie_cpus;
> > > >  
> > > > +/*
> > > > + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> > > > + * two-thread active mode, with resources partitioned between the PEs.
> > > > + *
> > > > + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> > > > + * mode. Firmware does not currently describe this preference, so detect
> > > > + * Olympus by MIDR until a firmware interface is available.
> > > > + */
> > > 
> > > Fix the firmware?
> > > 
> > > If we add this MIDR kludge, I guarantee that it will never be fixed.
> > 
> > Understood. The existing PPTT already describes the SMT relationship, but as far
> > as I can tell ACPI doesn't currently provide a way to describe a preferred SMT
> > sibling. Both PEs also have equal isolated performance, so representing this
> > using different _CPC highest_perf values wouldn't accurately describe their
> > capacity.
> > 
> > I'll drop the MIDR-based enablement and coordinate with the firmware team on a
> > proper ABI.
> 
> Thanks, Andrea, I must confess that I wasn't expecting that!

I try to be a good citizen every now and then. :)

> 
> > In the meantime, for systems with the existing firmware, would an explicit
> > kernel boot option be acceptable as a fallback? It'd enable SD_ASYM_PACKING at
> > the SMT level and prefer the primary PE, but only when requested by the user;
> > the kernel would not infer this policy from the CPU model.
> 
> I'm ok with that.

Awesome! I'll work through Dietmar's point for this and post a new version
without the MIDR-based detection.

Thanks,
-Andrea

