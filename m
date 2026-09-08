Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A88C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 06:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXJaoGQ4WQvJw7LpO+fZwYljBOcexd/+8ETyAn7bS9I=; b=NFEf41NzQKvUVBjWjl1Ct3koTI
	JehC97TxP/IQrzMIqStr9AipjDxJkvb5wFTeXYJnHrrKWKI3OsynngAJS+9c9dS6Tx34dEwlBk+ez
	lSm4It4zITWU3J3RynR7JHkqUpHLn/QEpncEn3cNgQ7j9eQT0oK32vg8Fe+77aU7HV8rl25ArTpmX
	TBDm9VRcgvga+8CxYkfqsW9vA782Ygc/yrUAlSYLUnQJFygQOI59puQr0Og0UlEhBRD3PRyvyQSqg
	zPMbz2o5hHr4jLFs8atexFBot69ElurVCfAexV+5J1rTHjlq3p23kbJVwFgLSJZvJQdT74MtwK/EK
	VWfvb8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3p4O-000000087nY-3AKq;
	Tue, 08 Sep 2026 06:12:36 +0000
Received: from mail-westusazon11010054.outbound.protection.outlook.com ([52.101.85.54] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3p4M-000000087mh-18Qr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 06:12:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeyzsqbPds5k6pR5UB7VMChvVB78K2zniDQQv3f2omGpfvjrKkldb8eATsNqcwXulI7+i5gnpMFJR7Sv9Vi5QAMmou07vnXCVLmeClWdTafKuisQCqQEXnBRe49DXYir0383HVWAcsNjd2dNmgA+xZemWOq0U/2IanLB9AyX9dn2BLSc99rqG3xNOe1kHooOnHKaPfhnPLMrL0ZXTlqxrqBbUcw3t+o+2K1WU12yLIJf8YCdob+ub45zqh3fCQocHfzWu6KPPf+oeOtBHaIZVslW2Vz/K3CdCi0lmylrC3ymdjiAYNtsEwO9EueNs86BldUaQ+hE/BMqv4Os7MiX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXJaoGQ4WQvJw7LpO+fZwYljBOcexd/+8ETyAn7bS9I=;
 b=OQ1FveU3tAxZ8SY6UyaMXUOf845JRK6WSPNnihS0UHCBcBauG2Cy4K7mbDiBEnjWijtGeFY/ZqDj7i5rNJ6NdshqknZoVHMasorMn9IqmwdzQyKNRflCpbj9XNKSX35Ds6g/crHA/r/bZQfnC/aHTumB34Q0JBam+MspdKn5cOr9+8r1vnOjwx4wFfXi0zoN3ie+Af0OQT+IUbIRBFj66/EbHIuLzTPQtsT6VTq916xI7MpvhPNS9/f2EiEzcyjYGFpHw5s7DDQSH/eC8ubjZ/s44FjhhKjg5YnJcErpFW0BNhd5hkyJxdKo8twhaSCGMUn68BCV1W7YnR9Bqx2Jbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXJaoGQ4WQvJw7LpO+fZwYljBOcexd/+8ETyAn7bS9I=;
 b=SsibEp8vWXiWy6S62OhA38JNqZgNOHrNBjTazYLWBkh3TQc5moQxXWdqT4RQ2Nr1OOqIEupcwQIDwAmGS+VyBJtPpHIQfFFBrGYZ6N4pzqRVArp5uSdGTVuuaOlZIBxzwyX7ZTb5ydUccnHX06gs3m9fdaQk3vDvy3xW/gVi8ZG7X9lNPEoCRG1+HVefMT3CCAA3cCSE9QTu316L/68DF556e6gHqkGI+CAHaoqNpCwJOVgy0up+knHsQ/5vVSm/tH3RI0S+kmI+7TplhoTmrxVEqkD9616rclyzPyyInk9Mnw4LWPos59onhytGTObbrom/vUiqCQOVRRMjodDU+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by MW4PR12MB7467.namprd12.prod.outlook.com (2603:10b6:303:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 06:12:25 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 06:12:25 +0000
Date: Tue, 8 Sep 2026 08:12:18 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <ap-nQp-8zrOJQY4-@gpd4>
References: <20260904091838.3617894-1-arighi@nvidia.com>
 <20260904091838.3617894-3-arighi@nvidia.com>
 <ap-fELvfw5w51vbG@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap-fELvfw5w51vbG@linux.ibm.com>
X-ClientProxiedBy: MI1PEPF000008D1.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::42f) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|MW4PR12MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b6f87c-c79f-4aca-c307-08df0d7026fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YlB7HR+aIt/p4b1AYKdu9nZIrq5+yJA3LqV/aqdn6jnDe7U73Q1VHBquiQX0Gf3CXICEqXzeMwD6dOQs2UAAbjNs/2SsisHxqP0l6fvcHajy7AumMKha5cxmPe0YgBnsShmDYWo7yQKUhSupOoHyr2v26cUihklaVnJ+dcrCMvisdJyRuacekBr4XsF1ziT4p2cOURIEVl/+uKFuRs5HwDthynIf9QB5doVFy36qinSvmbzp+Yh3q26YM31yIjgu1gZFAOiw5JnkkUErXeCv4O7k5dMZgES2z7TwYlgEQ2LTyNHKONXysz4NCyW1H7ZKhHCAKEnJTfOHQ2lOj3bMO1eLgoVRIYIS6lTAG3ewH9/V4T4An/reUAcw3E52PiscvX/TwBKNNz9dgEhfvHA3qdv+mTgtFg5wDt1uOKRE9U49i3UdUssaX/Ef33XouYT+gZc3P5N+QZL4BUHUTv0fLTbCcD4LQ08tGJZ9OR2iLQM6AxGxpE1nJv1wPWB6bTwu/rO2gUnAgJ0pK0Ku1HJFxEbmZy6A4OJNx4sEL0zKaAqxKHy27bhQL698YYXe6KBShrR8A8YaTrEGLFD74fbZAdYrL9F8/zzKhIiIMvaTndXsfnah5lc+r/oS/77Lz2GNZ8vDelCx5miN6Sm37/6NeGm0Hy+gaC8Gha0vwnQeoL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?445LxAPURM4DyHRIXiiIbtZQ9LuXmfMBrerBksWaAoymlnrhpblljc3pqQ5/?=
 =?us-ascii?Q?ASnS0oVpu2EEamWAC50jSpphQ8oytVvUHEYvT3lwkoJY4D8grBnuxNj64CMu?=
 =?us-ascii?Q?S3sLHWxrTfprCLVz4hi5Y/VqNw8aowW8XeeKVPFWTqZvhkwvffR1sAPjBW1/?=
 =?us-ascii?Q?/UDNRHOsHbIUIWUB3chxCKGN8PRrXoScZGfNetoM8bGbwvgRaQ6D580/pko/?=
 =?us-ascii?Q?f/zuD6LgQjTZnm/6dauQFhoTVHnqqCp2sAPmRNJ9s+CFvGpsMu1dWyh5ie95?=
 =?us-ascii?Q?yCcjWowk2nzSIJYH5l4sn9rytVE1eAaCWA95Z3XF9B80VX4VIeZmHlFpg68C?=
 =?us-ascii?Q?jNQ/0YmgFX6qUls80VYJ0iUuPl/xaQuLn4FmmInCGuh7FyDuIJAxx06nQNnd?=
 =?us-ascii?Q?VPI6PhW8PNHuslRyfF7ZJBaTbTO0gebwpL4DrH9+Mda8N9WTXeZWS01biGfR?=
 =?us-ascii?Q?OGv69QETbQJv8FibWXVgNQ1bsopgytMuHAtsufesx6Be/oZaUgjFOwZ2QEvm?=
 =?us-ascii?Q?RwJ/fEdyiwAJjyWK2cgG6LFrv8I27WVOKbivZhkWzfVcIntYHzu7f0OLsLPV?=
 =?us-ascii?Q?E9Op32zH8Q6M8tB2rRRcVMIInKF5Na9BhDGQxckPLmSteKa4PYnyxzycgC8j?=
 =?us-ascii?Q?SnhpoqzROsJ5Vzd51Vf8H6hUWW/4CUYn0Elh95faj+3K6mRQzGVJSiPnsm8q?=
 =?us-ascii?Q?1oS+Uv48yU3Xq5ETlHyCF113Zu1CwMXH+tDNa7yzMUA/Y1UwJoboGKeFZWeq?=
 =?us-ascii?Q?RRwMh2GQkI0uFexihqorjgFg4/gzQ+jiitKW63QZCxKjxBUQisWOfxHBEMV7?=
 =?us-ascii?Q?vOavF1D9XPdDnp1ZG1Z3HOrPkybn8wj+d9U1X+KQM1MsYfheoVQb+vV/SG38?=
 =?us-ascii?Q?Ot8Od/8DSLJqgCGNO9Ljyv7ySh46amjuZqN66iZy1OWO4PW5OLyeXdt1rqrY?=
 =?us-ascii?Q?6+3b2czoupuUDqHEB8zR3mViC+pXzvbsVrk4gRJRVL4nOElhoyvtsINaMY6X?=
 =?us-ascii?Q?/4SkyIlibLjsHRZNvjWevfEZK1CqZr2OgBX1fEvaFFHUXNz0X4wIjjNvFN4n?=
 =?us-ascii?Q?AbpEsW3Lve81HApEs6eAwnwZPk6BWjHauwUgdE6XO6pJFkJs2/UCKuho2fwO?=
 =?us-ascii?Q?jJfVlzaQ+snk67bd39PvRrbrI/+JRMfKkXZaLPTEBP1wWJtR19oz1rXGAz4A?=
 =?us-ascii?Q?+mz1aYT9xsVj8NrSKisOUIzsO37CiClM57uNo5mhlKOxtaPkTQFiADAr+n0q?=
 =?us-ascii?Q?ENq9usTTQ4mJfFMdKu3yhqh8RTG9vnwfjlU+ntWA8xQ7QMU/w26eAZR7cYX3?=
 =?us-ascii?Q?KJfgufKsB4bbRVl0MbyvFXPhzCNQmf03BMglAgKe+Kzw4fnbFDFNeoYE49vr?=
 =?us-ascii?Q?tmL102+5iO30/g5eqhWcPSGLkV/BEVNnLn2+sEc6sf33ZSNBgoS7jzCUyYA1?=
 =?us-ascii?Q?xoJD71yaAIXeun+Sxkg/eyysSHxejsWciQ49GNGcFLUwzHK9U6Sbg7wcdPws?=
 =?us-ascii?Q?f/64BhsddJN1dxIQ8AQDJtPajyGRLaF977RWBS5MvKW/FkQ2pkV7qfRfsKqD?=
 =?us-ascii?Q?d5COQNnr5p6B7rBFn9QuoBjMLQgjJUfu+rOs+a9rmm27zGBMjymFsAtKYa1O?=
 =?us-ascii?Q?PkVk/IgFOsmKrpXMxEroDx0wm81lBpPPVf7DlVn2KVGlwQsFHON8bNHqOqNQ?=
 =?us-ascii?Q?+WTw0z9JXD9T3HcInmXcDQjjQLAfd+IcjTbz43XhwjrksAk7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b6f87c-c79f-4aca-c307-08df0d7026fc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:12:25.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxBNnFW9fDqYSMOy6gOc2Ejmh7haoxx0oMv/QsjaNTKevbrOiZgutgmjEhq7ckQhrJyLy0mzt0lZDT8rx6/Z+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_231234_323953_D1B94C4A 
X-CRM114-Status: GOOD (  31.88  )
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

Hi Srikar,

On Tue, Sep 08, 2026 at 11:07:20AM +0530, Srikar Dronamraju wrote:
> * Andrea Righi <arighi@nvidia.com> [2026-09-04 11:18:05]:
> 
> Hi Andrea,
> 
> > POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity
> > SMT level to order hardware threads. Idle CPU selection does not consult
> > that order, so a task can wake on an arbitrary sibling and remain there
> > until load balancing corrects the placement. On these systems, that
> > initial choice can prevent the core from entering its preferred
> > lower-thread resource mode and cause a large and persistent performance
> > loss.
> > 
> 
> > When idle selection finds an available CPU in an SMT core, choose the
> > highest-priority available sibling. On SMT2 Olympus this only changes
> > selection on fully idle cores. A partially idle core has only one
> > available CPU. On wider SMT systems such as POWER7, it also fills
> > available siblings in priority order while the core is partially busy.
> > 
> 
> Don't we need changes in the slow path too?
> Something like this?
> https://lore.kernel.org/all/20251204175405.1511340-2-srikar@linux.ibm.com/T/#u

Ah yes, good catch! I'll include the WF_FORK / WF_EXEC slow-path as well.

> 
> > Apply the preference to idle-core and idle-CPU scans,
> > asymmetric-capacity scans, and the target, previous, and recently-used
> > CPU fast paths. Inspect the lowest scheduling domain directly, but
> > require both CPUs to share its span because isolcpus can split hardware
> > siblings across scheduling domains.
> > 
> > Keep physical-core capacity selection independent from SMT sibling
> > ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> > maximum capacities, then SD_ASYM_PACKING selects the preferred available
> > sibling inside the chosen core, whose siblings continue to share equal
> > capacity.
> > 
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >  kernel/sched/fair.c     | 79 ++++++++++++++++++++++++++++++++++++-----
> >  kernel/sched/sched.h    |  6 ++++
> >  kernel/sched/topology.c | 36 +++++++++++++++++++
> >  3 files changed, 112 insertions(+), 9 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index b8bd308c2d5b1..ff9a7b1fcbe7f 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8587,6 +8587,63 @@ static inline bool test_idle_cores(int cpu)
> >  	return false;
> >  }
> >  
> > +/*
> > + * Return true when @cpu has a higher asymmetric-packing priority than
> > + * @other in their shared SMT scheduling domain.
> > + */
> > +static bool sched_smt_asym_prefer(int cpu, int other)
> > +{
> > +	struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> > +
> > +	if (!sd)
> > +		return false;
> > +
> > +	if (!(sd->flags & SD_SHARE_CPUCAPACITY) ||
> > +	    !(sd->flags & SD_ASYM_PACKING))
> > +		return false;
> > +
> > +	if (!cpumask_test_cpu(other, sched_domain_span(sd)))
> > +		return false;
> > +
> > +	return sched_asym_prefer(cpu, other);
> > +}
> > +
> > +/*
> > + * Return the highest-priority available CPU in @cpu's SMT core that is also in @cpus.
> > + */
> > +static int __select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
> > +{
> > +	int best = cpu;
> > +	int sibling;
> > +
> > +	for_each_cpu_and(sibling, cpu_smt_mask(cpu), cpus) {
> > +		if (sibling == best || !choose_idle_cpu(sibling, p))
> > +			continue;
> > +
> > +		if (sched_smt_asym_prefer(sibling, best))
> > +			best = sibling;
> > +	}
> > +
> > +	return best;
> > +}
> > +
> > +static inline int
> > +select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
> > +{
> > +	if (!sched_smt_asym_active())
> > +		return cpu;
> > +
> > +	return __select_idle_smt_cpu(p, cpu, cpus);
> 
> Nit: I see __select_idle_smt_cpu called only here.
> Cant we fold __select_idle_smt_cpu() here itself.

Agreed, will fold in v4.

> 
> > +}
> > +
> > +/*
> > + * Redirect an available SMT CPU to a higher-priority available sibling allowed by task affinity.
> > + */
> > +static inline int select_idle_smt_priority(struct task_struct *p, int cpu)
> > +{
> > +	return select_idle_smt_cpu(p, cpu, p->cpus_ptr);
> > +}
> > +
> 
> nit: Can we also replace select_idle_smt_priority with select_idle_smt_cpu()
> itself.

Ack, we can use select_idle_smt_cpu() directly.

> 
> Otherwise looks good to me
> 
> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>

Thanks for taking a look at this!
-Andrea

> 
> -- 
> Thanks and Regards
> Srikar Dronamraju

