Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D93EC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRH5e9h+ggMORiTSIyaC5/5XY7ctell0YPFNWaLo4WY=; b=m/qp2OWbOD6NXloe0f00WqICc9
	EYWCJOJlZvauM0xPZ6CGVU9S/+aao/yrd+WM2EdyAlrYkXOilCpkmog55ne2ePwiC/3IPhih3fMOp
	2BYjsI1AwK/xN21NENCzmM+iWUN3pTbJLRDa2bD+nqzHo43TtoD0lBJ2pmSrv1JR6IM9z85wDBQJN
	+5+CwYD4B6sZZcQ4035fg6LBIUtdSMtzjxSD4RWxfnBtV0+o9NU00+1GQy9I2TsODNiPeu4VDzYJa
	h0bpEH5e7f81eT28Cd/b6VunOeN0P9Dr3Xk884X+u603gl1AZ2/5enICxrNZWaUPTMKGao5AgB/PO
	yjCR7kVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bkS-0000000E0cY-3Wkv;
	Thu, 10 Sep 2026 10:11:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bkQ-0000000E0bj-0lSy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:11:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D345E143D;
	Thu, 10 Sep 2026 03:11:07 -0700 (PDT)
Received: from [10.57.72.177] (unknown [10.57.72.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B53B73F7B4;
	Thu, 10 Sep 2026 03:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789035071; bh=ze2X4Lma6eVK0EPslJ52ApNw2jBlVa9FG4aUhZ3Oysw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QffLbUZIi0x47zAKcQ/fhaBHbAZmRZ2td2tLzmYC9x864r7U8LFVP70Npo+9+3OQu
	 ieLkWcU0zlFJ4C9oHdGO1eB9Cm30gdZU+DW32guMGOTRWLJKtwI2KR2nrjZWv4QYCU
	 QCY02mM9LFsznD0dXYbs1pCHO3Lu2ZGkRrVWkR48=
Message-ID: <1528999e-eb59-416f-b18f-2a7667e61a90@arm.com>
Date: Thu, 10 Sep 2026 12:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
 Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <89694e14-4be8-4c9e-9d7b-2808f87dd95f@arm.com> <aqGGlNce4TRLS1cW@gpd4>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <aqGGlNce4TRLS1cW@gpd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_031114_272656_95D80C6A 
X-CRM114-Status: GOOD (  17.08  )
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

On 09.09.26 18:17, Andrea Righi wrote:
> On Wed, Sep 09, 2026 at 05:19:08PM +0200, Dietmar Eggemann wrote:
>> On 09.09.26 08:26, Andrea Righi wrote:
>>
>> [...]
>>
>>> +void __init arm64_init_sched_topology(void)
>>> +{
>>> +	if (!IS_ENABLED(CONFIG_SCHED_SMT))
>>> +		return;
>>> +
>>> +	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
>>> +		return;
>>> +
>>> +	if (!topology_core_has_smt(smp_processor_id()))
>>> +		return;
>>> +
>>> +	set_sched_topology(arm64_asym_smt_topology);
>>> +	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
>>
>> I'm not really a big fan of using this arm64 setup for NVIDIA Olympus
>> alone here.
>>
>>> +}
>>> +
>>> +int arch_asym_cpu_priority(int cpu)
>>> +{
>>> +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
>>> +}
>>> +
>>
>> This is done since it will only be called for NVIDIA Olympus since it's
>> the only CPU model enabling this. I think it will work but it's still
>> ugly :-)
>>
>> [...]
>>
> 
> Agreed on both points. As mentioned in the other email, I'll coordinate with the
> firmware team on a proper ABI for describing the PE0 preference. For the systems
> with the current firmware, I don't have many ideas on how to enable this... a
> special scheduler facility enabled via kernel boot option? Other ideas?
With the explicit kernel boot time option discussed in the other thread,
how do you want to code arch_asym_cpu_priority()?

AFAIK, Arm architecture does not require the first/primary HW thread of
an SMT core to have MPIDR_EL1.Aff0 == 0.

The closest I came to you setup in Arm64 is a ThunderX2 SMT-4 machine on
which I can run 'OpenBLAS benchmark/sgemm.goto'. This machine has
symmetric CPU capacity though like Power7.
It has MPIDR_EL1.Aff0 == {0,1,2,3} for HW threads but '== 0' wouldn't
work here.

[...]

