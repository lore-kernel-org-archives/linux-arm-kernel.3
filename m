Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D376C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgAdyBLjNLxAzY0jp99YoQlCrZkpPqgkdwOY+/SS7fw=; b=g9HF08p+NYqBTwhPin5Rz0nJ+5
	7rZqJrEtSO6A7rLgH6uFcLNRXKwPLqyCAZBElz2gcwwBbieVEwC5YjcNf473dup/9ijMDSypPOkOW
	Xo5s3v+bvmcsXwdqUymQ7d7WaPq0oPlAn3/36lg+kSkwTI1fee5FZnCxqUrL/eQ/H6iP5Gl00x/Uq
	guu04Z9zT2bp3/hhX1iQMauJxtlpfl3Kr4LcTiAkkT7g3p6/o4GD1yCrjt+pM1Ns+EJwLDpAa2Ge4
	DBidm/WWPX1C0M7tAZT2g3UkaOHCiRAnFYKlWI0jz5Sm7wo7D9zzmaYjax3bkWEYGda/+xnI32nyX
	9bi7u8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JvX-0000000BILi-2it7;
	Tue, 01 Sep 2026 08:33:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JvU-0000000BIK6-1TAu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:33:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AF481756;
	Tue,  1 Sep 2026 01:32:59 -0700 (PDT)
Received: from [10.1.39.91] (e127648.arm.com [10.1.39.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 934233F882;
	Tue,  1 Sep 2026 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788251582; bh=dD3o5E2tk/NgDTsDnmNRW71cVi00yPTIGhnsNk2NjVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EM3V81gNXEwJV4m+GEknzrIFofbKGEiF1Rua0D1glODM2E/slzbHQ3tQgdec1+VPL
	 JVlnzuuoJylPMnQzuelKW2xyccd49xozCO1oBnhV1zUK74vzcUqcQMzQlhKadMXtWB
	 ZR+SdyAgRb7tk/Su59jFsSsoqXR6GoZVi1WdTOCk=
Message-ID: <25dbcc86-bfb2-4018-b388-7d8d1693203b@arm.com>
Date: Tue, 1 Sep 2026 09:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-2-arighi@nvidia.com>
 <f5d625d0-3b94-407c-8f64-793df9590f03@arm.com> <apX1j6srdTcFLZOd@gpd4>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <apX1j6srdTcFLZOd@gpd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013304_484908_344EA1E5 
X-CRM114-Status: GOOD (  32.65  )
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

On 8/31/26 22:43, Andrea Righi wrote:
> Hi Christian,
> 
> On Mon, Aug 31, 2026 at 10:13:42PM +0100, Christian Loehle wrote:
>> On 8/31/26 19:10, Andrea Righi wrote:
>>> NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
>>> capacity but two different resource modes. One-Thread Active mode gives
>>> one PE the full core, while waking the other PE restores Two-Thread
>>> Active mode and partitions decode, issue, cache, TLB, and vector
>>> resources. Returning to full-resource mode requires the sibling to
>>> remain in WFI for 10 Ki cycles.
>>>
>>> Measurements show that pinned workloads perform equally on either PE,
>>> but freely migratable workloads lose substantial throughput when they
>>> alternate between PE identities. Consistently selecting PE0 keeps PE1
>>> idle, avoids repeated SMT repartitioning, and restores one-thread-per-core
>>> performance.
>>>
>>> Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
>>> identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This is
>>> independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal capacity,
>>> while physical cores with different maximum frequencies are handled by
>>> a higher scheduling domain.
>>
>> But why? This asympacking + CAS interaction is a bit hard to comprehend IMV.
> 
> The two mehcanisms describe different preferences at different scheduling domain
> levels: SD_ASYM_CPUCAPACITY selects among physical cores with different max
> capacities, SD_ASYM_PACKING is set only on the SMT domain and selects the
> canonical PE within the core chose by the existing placement and capacity logic.
> 
>> Why can't we encode both preferences in the asym-packing priority, e.g.
>>
>> priority(cpu) = is_primary(cpu) ? 2 * highest_perf(cpu)
>>                                 : highest_perf(cpu)
>>
>> so that all primary PEs are preferred over all sibling PEs, while still
>> preserving the highest_perf ordering within each group, and do away with
>> SD_ASYM_CPUCAPACITY on Vera altogether?
> 
> I can experiment with this combined priority, but I think removing
> SD_ASYM_CPUCAPACITY is a separate policy change rather than an alternative
> implementation of this fix.

Cool thanks, and sorry for curveballing the approach like this, I wish I had
the platform to test these ideas myself :/ 

> 
> A static asym-packing priority does not preserve the capacity-aware semantics
> used for task fitting, uclamp, misfit handling and migration. The current
> approach keeps those semantics when selecting a physical core, then applies the
> PE preference only within that core.

Right, but arguably most of these semantics become questionable as soon as the
core enters two-thread mode, since the capacity available to each PE then
depends on the state of its sibling.

Task fitting:
We consider two tasks with util=400 to fit on two capacity=1000 PEs, even
though once both PEs are active neither may have anything close to capacity
1000 available. In other words, the capacity used for fitting doesn't account
for the capacity "stolen" by activating the sibling.

Uclamp:
Isn't uclamp, and particularly its bucket implementation, fundamentally a poor
fit for these platforms in the first place? Even if we tried to represent these
small capacity differences through uclamp, we'd need something like
UCLAMP_BUCKETS_COUNT=512 or 1024 to get useful resolution. We currently limit
it to 20, and for good reason: the overhead.

Misfit handling:
This seems problematic for essentially the same reason as task fitting. A task
can be classified as fitting while the core is in one-thread mode, then lose a
substantial fraction of its effective CPU capacity when the sibling becomes
active, without the static CPU capacity reflecting that change. Conversely,
migrating it to an otherwise equivalent core and allowing that core to return
to one-thread mode changes the effective capacity (and therefore utilization)
again.

I'm assuming the CPU_CYCLES counter advancement isn't affected by the
one-thread/two-thread mode transition?

> 
> Also, encoding the combined priority alone would not fix the problem addressed
> by patch 2: the idle-selection paths currently do not consult asymmetric SMT
> priority. They can still return an arbitrary idle sibling regardless of how
> arch_asym_cpu_priority() is defined. Patch 2 adds that missing behavior and
> scopes it to the shared-capacity SMT domain.

Sure, patch 2 is a different story altogether.

> 
>> I had suggested this a while ago, did you have a stab at that by any chance,
>> too?
> 
> I tested your CPPC-based asym-packing series, but not this particular
> combined-priority variant. IIUC the earlier proposal was replacing
> capacity-aware scheduling for minor physical-core capacity differences, SMT
> sibling ordering looks like an orthogonal problem.
> 
> And at the time, the combined SMT-aware SD_ASYM_CPUCAPACITY approach also gave
> the best Vera results of the alternatives I tested, which is another reason I
> kept physical-core capacity selection separate here.
> 
>> Am I missing something altogether?
> 
> Combining the priorities is a valid experiment, but I'm not sure if it
> completely solves the problem by itself, I'll give it a try and share the
> results.

Thanks again, i'll have a look and give it some more thoughts myself.

> 
> Thanks,
> -Andrea

