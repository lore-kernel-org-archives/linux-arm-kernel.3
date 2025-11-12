Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD750CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3XzKmLPp3L9abWCAuN4QYo6hrdUgfg0ybrgeLmPa0Q=; b=xPIXWH9YIRrjR01Gqw93HA5FLd
	BauaxpCxfDlLlejBcg9SImIWmd3tXP/dnbNUcOap+RJ8RRi/BpwSnBnf4qMYNfMUM06JkvBykuInt
	DMtAw4awsbpQwhEQ3627g6irwvRypX8e92XJtapJ6saZEytY5FgRoBYV+O+gpLE34wFGWAH1zOa34
	lRuViowx9cH+aAirWg5FC/s4OTnVE24+yFESEdtywWI32BaqcvbXa6HZfA0wP4BA2bx9X0rYi0z5J
	wXzPHMbfi4bi3wp+mXlA98qyUALhCcpnHqeUWP287FjFwyu3kuWEzHXcEQA1Ty3fvBIo0FAFaGW+J
	Y5xKLLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDAK-000000098AX-0wxs;
	Wed, 12 Nov 2025 15:53:48 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDAH-0000000989j-1xPG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsKG5oZARTHHAZUIIpg/JfDE9q8e2VC7ABTrdiX1ci2KAPou1iPPS0mseW6o7kNdppZJJAP3tjezt5mXld3SOA1shgkDzYjL3j7RsYCSZFnd3ZREWivBKfukustPhQc7HnZwN+H4i5XSdhIrJaBDqoG+RHkG2kNvsa77GngbqfeI/ElAk1N7L2Rvur+CWJQOtL+RT8BojFTQzJUyveHkR0wmNMk9DHk0NBiY5zGfQiLwKe2psHGFIBLBzYr9KMFcpC2HFZKJ9sA+SBkrZRxKL/txAh69fkMUUcbyavLjQtwmlD3uzaAgfV9r76uftcjQFgHX1e0odblQ259/bkPa8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3XzKmLPp3L9abWCAuN4QYo6hrdUgfg0ybrgeLmPa0Q=;
 b=xZD5Ss6juEG8DNllC+qP4lN8gRSf500rFPQblGTfSn3hhedZSUMSqmcSFzrupfSW1kVneD7vJM16FkGv8SXWHuFqtpkV3Agoey/NhdNv9nVPgHHfCuqSFl7ZdzSvwLMKxHjNJfJDs8rrRf1BXPyZPbMS3rS9T8dSNuU2WVvERAGlzCaWobd2gQH5hYfK4EwiYz+UKKRFz9tT25g9sTIkvoeKYnzlAow2dyzTBeh/1JQsxmy/VXyNpBzDbttkXXPKbMZ62mR+4yDEPwHwJ3Hw8BVcQzBUNT03PuHYrbistZljMoAUO4suwf/QLc9z8EuBl3iNsc1gelE1k7z2/M/RbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3XzKmLPp3L9abWCAuN4QYo6hrdUgfg0ybrgeLmPa0Q=;
 b=Lo9GHNUY9QwOJQerRqD+8KfTW4zviQsKGKopa1i00e8s6TKMyBMlnenOIJ99rDvtrcxQOiMtFPy96obsbOoKwBjZ4FR8zeedwjdLI1U01GPaq4D/9NFtL2FjAxvtr7X+PKVdD4EWrNBZpQ9PgRFDhDqlaaSZ9k8EldZv2oa+qhCK9SULrjKr96W3dEqqJpgme5V1gM+ckSTIjxZM3fLb2Ny1gvfartrDm7+FoyYuAOzImoG1O8MbWbgPS0bUcK1DA8lKxQdK+fKfrViuGCoCDDPLDIensGK/odLhGcy0ylOPzodFuPiMz842EjMisrU4Qv5EoTrd9Mjirj820mm4og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB9315.namprd12.prod.outlook.com (2603:10b6:610:1cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 15:53:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:53:25 +0000
From: Zi Yan <ziy@nvidia.com>
To: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Yin Fengwei <fengwei_yin@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH -v5 1/2] mm: add spurious fault fixing support for huge
 pmd
Date: Wed, 12 Nov 2025 10:53:21 -0500
X-Mailer: MailMate (2.0r6283)
Message-ID: <409ECE2A-166D-4C16-BC41-E327572E6376@nvidia.com>
In-Reply-To: <20251112013822.54334-2-ying.huang@linux.alibaba.com>
References: <20251112013822.54334-1-ying.huang@linux.alibaba.com>
 <20251112013822.54334-2-ying.huang@linux.alibaba.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:208:2be::16) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 1644ca61-47a8-4767-8b61-08de22039d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WoXvNbmZkfBj7Zca9QwD06gq2bEfUJKYlTIJLg/JXFkNBzdC4sveYkijBsmh?=
 =?us-ascii?Q?r13DFb1JlmE5xm7E++A7k5/GDURV0sx5zQPs1DbjJo2zBxl2VL6FINijd8Zh?=
 =?us-ascii?Q?XRM2Ix5AcXoPhxK+PbZzr+qsxy4l1w5o12Dy1C0bngO4RWPfVaMWJQuHpfw7?=
 =?us-ascii?Q?y18HRqkZGPQVl/M2vMCZ2zI6vydWS8xX1dCWnEa+4UFrDL+C83BTSuUeI1EH?=
 =?us-ascii?Q?rJ2cUUPwL9ohtovtbyF2ItRr+b1KlLMia5ODL10Ua9JCkcI1h1sE9SVn+H/H?=
 =?us-ascii?Q?jMfIr7jaO8IGbCYIe1XpvRwlKijlE9Q01bVZgp+474cYRrC5lKDiiOny9PIe?=
 =?us-ascii?Q?xRB3raBor9x90AehPAvKZDmMBfdKS5FOktZ+zmzczKDDB7Hu/C++hq/gnU9V?=
 =?us-ascii?Q?A9WVohD1LU0tXBD1aI1JKFOZomyW1WUFNh//ntm8F4q2dFsN2AF01YbhU+iL?=
 =?us-ascii?Q?kP87SlMeqALf5sxLtqr7upVdvSSfwH+ptUEkflVRtocnB/i0NTNPEFrNJorq?=
 =?us-ascii?Q?ehcHUX8LSs1hVxmnb0laKnoHbjtBCNcIiaGP7hZNKt24hiY5+RvHdipaU+0g?=
 =?us-ascii?Q?xnur5aF6kOEbtSuO97rlrGmuPOoN/ksT6wSspv6zSRVsahFM/wiEYrk027yH?=
 =?us-ascii?Q?r3Fw6lKZq2XAapPrGL+YXLdYUErkTlt+3YWUmhjwLRSU4iWALAFPoW/SRZkn?=
 =?us-ascii?Q?wKmbsDPMcsaoxt6zSjTAMBKKcdaE7XBqcTgqWh6n1myIM5US+UcvF7lOygTS?=
 =?us-ascii?Q?mzYj2GK7TV3xhGcPvSBf11GCkGqGF/Poa4y1DFJ08ssxq8DFXi91W4mvm7Rp?=
 =?us-ascii?Q?jVf4QMcCb+feKLAhRQtJOo57bX4FmVZvhgLEAc7akLEN/pt9bJpgRUR2kEwY?=
 =?us-ascii?Q?Pps9UvL4CiPZn+GGB53Wi4splM/3SzfDQLaokc9V984uO0OKvrnYbH3ISxmI?=
 =?us-ascii?Q?MayxOSgc0lZBD9XUUC2RIY8BgdgZlyQZ1VX43FrhQ9HyRTV3gFkgyDpULBWD?=
 =?us-ascii?Q?BHDryFkGDpC5jNvf2+EfKAVjKy/bYW2wq8G/WsuqjT+W48nP45EGEtCMNTFy?=
 =?us-ascii?Q?MG6o1xWM4OlQY3x5cGDUC/Im1NVpDyhF/3sk1yvETKWXDRp987OTqLePFLyh?=
 =?us-ascii?Q?RggSVoGR/UqAawOd/dfdpBRiwrbqfaq4U604h6RghXjMwKlkDkbIgpGJsCan?=
 =?us-ascii?Q?Ncpstt4bLMK84q+23NiLcp+UGE/IGHxs1ugd1hfAbqDPdVDCjV9sec0JsNS1?=
 =?us-ascii?Q?/5mKXPmi0daeWwC3e9hrWb/oCRtZh+qubjeBOFv/yZ6ECKkKSA4SHKxVJJ21?=
 =?us-ascii?Q?W5oE/WFaYoozXteO5N2WDt0urKWunbkHvQQTH7ztdYZBI+GSln9hYXwNXvZl?=
 =?us-ascii?Q?qmIk2TC7F57AFt/KKD/hq/CxlosEX8RCZnGKGaVh2H6vpyFoepc9Xo8O9I9r?=
 =?us-ascii?Q?ls+TBzVrf7xbEUGtM2XZuv0P5Ykpd0Li?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w+OP02A/y9/uD9bauY63HqyWD5nsL/rCYL7nbS32kUKJ+R4eKPpuj9/OfGQt?=
 =?us-ascii?Q?7cfOmhHGgCI8ebAVDCSqhjM0L2EQybqQAk+DdVR1IaCVQz0DiKjAHv/5286C?=
 =?us-ascii?Q?8ePbu22PxT1mE0rQTJr5T1BGpeM8OA/JwRQv28lCW5KrWoKNrEyL92nQ7Zh1?=
 =?us-ascii?Q?Gt+Jlh7jMfxWN+D2os82wm3gbV5eFaxlJ+Ez4lMkoyDMu5homdKvZ/PY9R+Z?=
 =?us-ascii?Q?6AVLWqcBOsTS78aJoX7u9wIsF+mxvuU3b6fUJBckAgshxuZ7itDBlpJb3rUP?=
 =?us-ascii?Q?WhIsqXcvjG5p7YI6rW3JywUV8mmE63O4Q5YyronaZlPMfL2P4HeHZUoV9twO?=
 =?us-ascii?Q?Uoe6taf1UJ9/AcfaKjaoSpbm2Cnu5gm47xF6LO0Y9TAcIGrGkx1yeUs/R6n0?=
 =?us-ascii?Q?vsEyba9TT0/5PUzeEc4PzVzh6h7W6RrdQ9u1GuKytWbWOrgK77aoWMZj+J7r?=
 =?us-ascii?Q?hLKFw1hze6ODyxtGZ6/lcWXPLTovX3hSv16D0S6XRUdRkxhPeCiLgNS365X1?=
 =?us-ascii?Q?7iDxjhFaDWvXPtE3ywySqr5RLL1tW+yrUklh4vxfM3Ib56trdnN848A+s+Dv?=
 =?us-ascii?Q?BDoobDRlQNsC/xIiZkO86B4N3OY+yOBg10wkSBgbrKozQzpef4MjGHz6hf6j?=
 =?us-ascii?Q?QaODdhHUaOlbx8JGzqIoVbOxX3K++hCx0z32DDJ507kHvoDgdeaakTHfhYgm?=
 =?us-ascii?Q?yqcsuK6xJB/8jTCwUnmUDWZNBtJJPiDuuZ+OAyXfvdH+l4UIYYmuZqIif5D7?=
 =?us-ascii?Q?oBzYQbQmQW9VIuBk9G6To/mnr6/ok3Qn5hrTrn1WJloMMI4eB++v+wrylT+j?=
 =?us-ascii?Q?DeJ7LS+vDPvyZOC6z2DAyPItMdaKQz6SaCMqm32atqXZVQ3M/0wqUEy9/8m4?=
 =?us-ascii?Q?0XD9q2hFJyK2DbhUXiy70qwOpDs5whkSC+H0CRmwQvkbH2E2jj0CBJxy6Udq?=
 =?us-ascii?Q?BpaGilN3WQDpGahB8/dECdLHFRobw3awRdTg7GnSzvjqYvcvcjk3HduCa+Qd?=
 =?us-ascii?Q?EZRFCIoRDbJduohBmu8dgslrh6nZsL4D7fUDEYKuq8OBeSxKDI22AYG8oGVf?=
 =?us-ascii?Q?HDgrjOASOOzco0DgdobuJ2PhNXEhEc4QX+o4i4kKbH6vsVqOTLqe/ipkCavE?=
 =?us-ascii?Q?jdlbhWul4mbKV9p2e+su7s56uXNCiP9yNWwTWhHRzOZTkBF+X+Lbr2mYOWPw?=
 =?us-ascii?Q?vdFdAPDKQyFTMmzMhAKavR5XsQFWQRvBVvOqJ203F8m1LSZBAYh7mIL4jEr+?=
 =?us-ascii?Q?6QkR/aXlxid5rlIQyUs2DGv2HbXXFkvkMyfNJy9tuZfgSrj7BZzzo5fyYqUc?=
 =?us-ascii?Q?+UpSiUusAuOOXM+Ok/1GNsd1Tl7Sge4SNOIWzHJzwLD0mQ84L+VvAzN9aZTd?=
 =?us-ascii?Q?AUqEM7A2tlE9RVWK+H9AlnPEFCJLBmR/VdjgEFRj0J/BPSSs6tuAasFaTyYt?=
 =?us-ascii?Q?8vBHw3GzagozaW0G9y9aT5bY4SZ7s+wL/Fk1qA6Zgx4g6kbStot9dPS9xZlx?=
 =?us-ascii?Q?nwJm+y7e1MqyUO+vglGtn6EjJYoQkKcr+k1doTxdF1EUYBYAnhrvZtpIZbrL?=
 =?us-ascii?Q?XsDm541fx20CmtpFdCQj/dxvvm8ghL4a+RP91EJG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1644ca61-47a8-4767-8b61-08de22039d0a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:53:24.9656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SG6QvUpBNs51sjREPWyMCKZkRrQfOhiLn5yy5K5BjzkA+tWT+EUQplUjugNZHLlE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_075345_508864_5502061D 
X-CRM114-Status: GOOD (  19.91  )
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

On 11 Nov 2025, at 20:38, Huang Ying wrote:

> The page faults may be spurious because of the racy access to the page
> table.  For example, a non-populated virtual page is accessed on 2
> CPUs simultaneously, thus the page faults are triggered on both CPUs.
> However, it's possible that one CPU (say CPU A) cannot find the reason
> for the page fault if the other CPU (say CPU B) has changed the page
> table before the PTE is checked on CPU A.  Most of the time, the
> spurious page faults can be ignored safely.  However, if the page
> fault is for the write access, it's possible that a stale read-only
> TLB entry exists in the local CPU and needs to be flushed on some
> architectures.  This is called the spurious page fault fixing.
>
> In the current kernel, there is spurious fault fixing support for pte,
> but not for huge pmd because no architectures need it. But in the
> next patch in the series, we will change the write protection fault
> handling logic on arm64, so that some stale huge pmd entries may
> remain in the TLB. These entries need to be flushed via the huge pmd
> spurious fault fixing mechanism.
>
> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> ---
>  include/linux/huge_mm.h |  2 +-
>  include/linux/pgtable.h |  4 +++
>  mm/huge_memory.c        | 33 ++++++++++++++--------
>  mm/internal.h           |  2 +-
>  mm/memory.c             | 62 ++++++++++++++++++++++++++++++-----------
>  5 files changed, 73 insertions(+), 30 deletions(-)
>
LGTM. Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

