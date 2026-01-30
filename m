Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66F6E6BF11
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiMsGbi5fj3AsNVJV/FoD1FwRDRSLMd2ZrKeEr/oPJU=; b=wHZHDJLxTVUL1gpNovL8Vm/uyk
	UkDfbsVp0XmV8eI+r1Fde+fykkgJCoUQVLDH0Tw1qO+usZOSEal1hUh+xRqN8auT2tVaz0ONOHxg5
	0k6PS35ruBZ4fJ4chaIEL2NnaliLhzG7upWslb23NARo9ftFmJQoSvcujbNnU21jLTNfLM6q9NOrL
	MydrJi5h1tsPN9nC7M+CGKi3SMfIvYnd3sSjXjdmNw9MG0arK3PNPOC5oDWm3TIfXb5JfF5lfrjjd
	FsKWdd5Y+kANiJnNPDkNqQEabxWI86UsKWnMeBvvsRqdGBi3gyNIErxI2brqk8sN5CyojRTrmlb8i
	nLZk/e7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpdS-00000001arR-3n0k;
	Fri, 30 Jan 2026 14:38:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpdP-00000001ar5-3lzo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 14:38:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B6DA153B;
	Fri, 30 Jan 2026 06:38:00 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF90A3F632;
	Fri, 30 Jan 2026 06:38:01 -0800 (PST)
Message-ID: <b82dcff4-b814-493f-a6cc-80b205577d0b@arm.com>
Date: Fri, 30 Jan 2026 14:38:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/47] arm_mpam: resctrl: Pick classes for use as mbm
 counters
To: Peter Newman <peternewman@google.com>
Cc: James Morse <james.morse@arm.com>, amitsinght@marvell.com,
 baisheng.gao@unisoc.com, baolin.wang@linux.alibaba.com,
 carl@os.amperecomputing.com, dave.martin@arm.com, david@kernel.org,
 dfustini@baylibre.com, fenghuay@nvidia.com, gshan@redhat.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-30-ben.horgan@arm.com>
 <CALPaoCh+mRLJEfhKBve3hRf+vHHoObjvWRt74OfpopgtR9g9FQ@mail.gmail.com>
 <c157d2b6-7282-438f-b9e7-1a24be3fbf53@arm.com>
 <CALPaoCi0fR5sUVsjXi25XHBrhn3whFvKDpEvUGSM5Hjd2LZP6w@mail.gmail.com>
 <2ce2b78e-9a79-489d-813c-3ed6ced34f12@arm.com>
 <CALPaoCgfi8qgJi_yijJ5u933faMvCZCjdBOGCKxOd4uqwEJhyw@mail.gmail.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <CALPaoCgfi8qgJi_yijJ5u933faMvCZCjdBOGCKxOd4uqwEJhyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_063808_025767_F4974206 
X-CRM114-Status: GOOD (  40.68  )
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

Hi Peter,

On 1/30/26 13:04, Peter Newman wrote:
> Hi Ben,
> 
> On Mon, Jan 26, 2026 at 5:00 PM Ben Horgan <ben.horgan@arm.com> wrote:
>>
>> Hi Peter, James,
>>
>> On 1/19/26 12:47, Peter Newman wrote:
>>> Hi James,
>>>
>>> On Mon, Jan 19, 2026 at 1:04 PM James Morse <james.morse@arm.com> wrote:
>>>>
>>>> Hi Peter,
>>>>
>>>> On 15/01/2026 15:49, Peter Newman wrote:
>>>>> On Mon, Jan 12, 2026 at 6:02 PM Ben Horgan <ben.horgan@arm.com> wrote:
>>>>>> From: James Morse <james.morse@arm.com>
>>>>>>
>>>>>> resctrl has two types of counters, NUMA-local and global. MPAM has only
>>>>>> bandwidth counters, but the position of the MSC may mean it counts
>>>>>> NUMA-local, or global traffic.
>>>>>>
>>>>>> But the topology information is not available.
>>>>>>
>>>>>> Apply a heuristic: the L2 or L3 supports bandwidth monitors, these are
>>>>>> probably NUMA-local. If the memory controller supports bandwidth monitors,
>>>>>> they are probably global.
>>>>
>>>>> Are remote memory accesses not cached? How do we know an MBWU monitor
>>>>> residing on a cache won't count remote traffic?
>>>>
>>>> It will, yes you get double counting. Is forbidding both mbm_total and mbm_local preferable?
>>>>
>>>> I think this comes from 'total' in mbm_total not really having the obvious meaning of the
>>>> word:
>>>> If I have CPUs in NUMA-A and no memory controllers, then NUMA-B has no CPUs, and all the
>>>> memory-controllers.
>>>> With MPAM: we've only got one bandwidth counter, it doesn't know where the traffic goes
>>>> after the MSC. mbm-local on the L3 would reflect all the bandwidth, and mbm-total on the
>>>> memory-controllers would have the  same number.
>>>> I think on x86 mbm_local on the CPUs would read zero as zero traffic went to the 'local'
>>>> memory controller, and mbm_total would reflect all the memory bandwidth. (so 'total'
>>>> really means 'other')
>>>
>>> Our software is going off the definition from the Intel SDM:
>>>
>>> "This event monitors the L3 external bandwidth satisfied by the local
>>> memory. In most platforms that support this event, L3 requests are
>>> likely serviced by a memory system with non-uniform memory
>>> architecture. This allows bandwidth to off-package memory resources to
>>> be tracked by subtracting local from total bandwidth (for instance,
>>> bandwidth over QPI to a memory controller on another physical
>>> processor could be tracked by subtraction).
>>
>> Indeed we should base our discussion on the event definition in the
>> Intel SDM. For our reference, the description for the external bandwidth
>> monitoring event (mbm_total) is:
>>
>> "This event monitors the L3 total external bandwidth to the next level
>> of the cache hierarchy, including all demand and prefetch misses from
>> the L3 to the next hierarchy of the memory system. In most platforms,
>> this represents memory bandwidth."
>>
>>>
>>> On NUMA-capable hardware that can support this event where all memory
>>> is local, mbm_local == mbm_total, but in practice you can't read them
>>> at the same time from userspace, so if you read mbm_total first,
>>> you'll probably get a small negative result for remote bandwidth.
>>>
>>>>
>>>> I think what MPAM is doing here is still useful as a system normally has both CPUs and
>>>> memory controllers in the NUMA nodes, and you can use this to spot a control/monitor group
>>>> on a NUMA-node that is hammering all the memory (outlier mbm_local), or the same where a
>>>> NUMA-node's memory controller is getting hammered by all the NUMA nodes (outlier
>>>> mbm_total)
>>>>
>>>> I've not heard of a platform with both memory bandwidth monitors at L3 and the memory
>>>> controller, so this may be a theoretical issue.
>>>>
>>>> Shall we only expose one of mbm-local/total to prevent this being seen by user-space?
>>>
>>> I believe in the current software design, MPAM is only able to support
>>> mbm_total, as an individual MSC (or class of MSCs with the same
>>> configuration) can't separate traffic by destination, so it must be
>>> the combined value. On a hardware design where MSCs were placed such
>>> that one only counts local traffic and another only counts remote, the
>>> resctrl MPAM driver would have to understand the hardware
>>> configuration well enough to be able to produce counts following
>>> Intel's definition of mbm_local and mbm_total.
>>
>> On a system with MSC measuring memory bandwidth on the L3 caches these
>> MSC will measure all bandwidth to the next level of the memory hierarchy
>> which matches the definition of mbm_total. (We assume any MSC on an L3
>> is at the egress even though acpi/dt doesn't distinguish ingress and
>> egress.)
>>
>> For MSC on memory controllers then they don't distinguish which L3 cache
>> the traffic came from and so unless there is a single L3 then we can't
>> use these memory bandwidth monitors as they count neither mbm_local nor
>> mbm_total. When there is a single L3 (and no higher level caches) then
>> it would match both mbm_total and mbm_local.
> 
> The text you quoted from Intel was in the context of the L3. I assume
> if such an event were implemented at a different level of the memory
> system, it would continue to refer to downstream bandwidth.

Yes, that does seem reasonable. That cache level would have to match
with what is reported in resctrl too. I expect that would involve adding
a new entry in enum resctrl_scope.

> 
>>
>> Hence, I agree we should just use mbm_total and update the heuristics
>> such that if the MSC are at the memory only consider them if there are
>> no higher caches and a single L3.
> 
> That should be ok for now. If I see a system where this makes MBWU
> counters inaccessible, we'll continue the discussion then.

Good to know. I'm looking into tightening the heuristics in general.
Please shout if any of the changes in heuristics mean that any hardware
or features stop being usable.

> 
>>
>> The introduction of ABMC muddies the waters as the "event_filter" file
>> defines the meaning of mbm_local and mbm_total. In order to handle this
>> file properly with MPAM, fs/resctrl changes are needed. We could either
>> make "event_filter" show the bits that correspond to the mbm counter and
>> unchangeable or decouple the "event_filter" part of ABMC from the
>> counter assignment part. As more work is needed to not break abi here
>> I'll drop the ABMC patches from the next respin of this series.
> 
> I would prefer if you can just leave out the event_filter or make it
> unconfigurable on MPAM. The rest of the counter assignment seems to
> work well.

If there is an event_filter file it should show the "correct" values and
so just leaving it out would be the way to go. However, unless I'm
missing something even this requires changes in fs/resctrl. As such, I
think it's expedient to defer adding ABMC to the series until we have
decided what to do in fs/resctrl.

> 
> Longer term, the event_filter interface is supposed to give us the
> ability to define and name our own counter events, but we'll have to
> find a way past the decision to define the event filters in terms
> copy-pasted from an AMD manual.
> 
> Thanks,
> -Peter

Thanks,

Ben


