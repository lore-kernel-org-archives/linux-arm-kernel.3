Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F11CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wqh5gjiyi8bmXS20bame6KivUjRYvZRgsto7xGqSJPg=; b=hwCVDhDgrDpqKtcIWotZcRs4kl
	TWKqpSRLl9c0IHWt4/Wo6uppr2mzmuxTGBnH/K2GPC7OZ1i4MxmwgP9IbrIkptiCncyTK0K72+aFO
	IZ39LgVaT5KAosQFS34qxZrxWJPULPoVoqCIgs/DoWR38FJMrrtBHevXfL4p77dAgRS6Fb9/XhZRZ
	NREH8e4ojDekGlTyu4U4oiREzidF0P3mvt7OPKncyrGyS3gtVe7c4Cspxdvnk8COTohilPPkY7VYb
	3eXkvwlAp13j2heDX6ygZZ8nJHt2wq0OisfKXiAl9q4w2L5WKDnFtvC8OxItIZWhfPKY4W+ej3ZCb
	ICRQNwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQVZ-0000000GHRw-0Zhy;
	Wed, 10 Sep 2025 19:29:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQVW-0000000GHQa-34Hy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:29:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFAAF16F8;
	Wed, 10 Sep 2025 12:29:21 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A3F43F694;
	Wed, 10 Sep 2025 12:29:24 -0700 (PDT)
Message-ID: <db59580d-1013-45d4-bf62-b2ed955b22e4@arm.com>
Date: Wed, 10 Sep 2025 20:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] ACPI / PPTT: Find cache level by cache-id
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-6-james.morse@arm.com>
 <aK7jEMqM/FoB4ABW@e133380.arm.com>
 <cc4881e8-5d90-4992-8cbf-650ea2efa5ca@arm.com>
 <aLsPXFI4VuueQVXM@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aLsPXFI4VuueQVXM@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_122930_860864_CD75818E 
X-CRM114-Status: GOOD (  45.91  )
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

Hi Dave,

On 05/09/2025 17:27, Dave Martin wrote:
> On Thu, Aug 28, 2025 at 04:58:05PM +0100, James Morse wrote:
>> On 27/08/2025 11:50, Dave Martin wrote:
>>> On Fri, Aug 22, 2025 at 03:29:46PM +0000, James Morse wrote:
>>>> The MPAM table identifies caches by id. The MPAM driver also wants to know
>>>> the cache level to determine if the platform is of the shape that can be
>>>> managed via resctrl. Cacheinfo has this information, but only for CPUs that
>>>> are online.
>>>>
>>>> Waiting for all CPUs to come online is a problem for platforms where
>>>> CPUs are brought online late by user-space.
>>>>
>>>> Add a helper that walks every possible cache, until it finds the one
>>>> identified by cache-id, then return the level.
>>>> Add a cleanup based free-ing mechanism for acpi_get_table().
>>
>>> Does this mean that the early secondaries must be spread out across the
>>> whole topology so that everything can be probed?
>>>
>>> (i.e., a random subset is no good?)
>>
>> For the mpam driver - it needs to see each cache with mpam hardware, which means a CPU
>> associated with each cache needs to be online. Random is fine - provided you get lucky.
> 
> "Fine" = "not dependent on luck".  So, random is not fine.

As in it doesn't matter which CPUs - as long as you manage to represent each cache.

I really don't care if people configure their platform such that the mpam driver can't
complete its probing. Everything continues to work, you just don't get to use the unusable
features.

I've only really seen it done in VMs, which are most likely to have a single global MSC
because the thing has to be emulated.


>>> If so, is this documented somewhere, such as in booting.rst?
>>
>> booting.rst is for the bootloader.
>> Late secondaries is a bit of a niche sport, I've only seen it commonly done in VMs.
>> Most platforms so far have their MPAM controls on a global L3, so this requirement doesn't
>> make much of a difference.
>>
>> The concern is that if resctrl gets probed after user-space has started, whatever
>> user-space service is supposed to set it up will have concluded its not supported. Working
>> with cache-ids for offline CPUs means you don't have to bring all the CPUs online - only
>> enough so that every piece of hardware is reachable.
>>
>>
>>> Maybe this is not a new requirement -- it's not an area that I'm very
>>> familiar with.
>>
>> Hard to say - its a potentially surprising side effect of glomming OS accessible registers
>> onto the side of hardware that can be automatically powered off. (PSCI CPU_SUSPEND).
>>
>> I did try getting cacheinfo to populate all the CPUs at boot, regardless of whether they
>> were online. Apparently that doesn't work for PowerPC where the properties of CPUs can
>> change while they are offline. (presumably due to RAS or a firmware update)

> So, it sounds like there is a requirement, but we don't document it,
> and if the requirement is not met then the user is presented with an
> obscure failure in the MPAM driver.  This seems a bit unhelpful?

Not a failure. MPAM isn't yet available. Bring the rest of the system up and it will
spring into life. The same goes for any device you keep turned off.


> I'm not saying booting.rst is the right place for this -- maybe the
> appropriate document doesn't exist yet.
> 
> I wonder whether the required property is reasonable and general enough
> that it should be treated as a kernel boot requirement.

It's not a boot requirement. Linux boots just fine.


> Or, we require caches to be symmetric for non-early CPUs and reject
> those that don't match when they try to come online (similarly to
> the way cpufeatures deals with mismatches).

MPAM isn't an interesting enough feature to reject CPUs!
We can't check the the MSC properties until we can schedule, (thank the 'hide it in
firmware' folk for that one), meaning the CPU has to be online before we realise the
MPAM properties are mismatched.

The best approach here is to wait until everything has been seen before declaring that
we know what is going on. The architecture even calls this out as something that needs
doing, meaning the firmware tables have to describe all possible MSC.

I agree its not nice - but it is what MPAM is.
I think the people clever enough to manage late online-ing secondaries will work this out.


>>>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>>>> index 8f9b9508acba..660457644a5b 100644
>>>> --- a/drivers/acpi/pptt.c
>>>> +++ b/drivers/acpi/pptt.c
>>>> @@ -907,3 +907,67 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)

>>
>>>> +	for_each_possible_cpu(cpu) {
>>>> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>>>> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>>>> +		if (!cpu_node)
>>>> +			return -ENOENT;
>>>> +		num_levels = acpi_count_levels(table, cpu_node, NULL);
>>>
>>> Is the initial call to acpi_count_levels() really needed here?
>>>
>>> It feels a bit like we end up enumerating the whole topology two or
>>> three times here; once to count how many levels there are, and then
>>> again to examine the nodes, and once more inside acpi_find_cache_node().
>>>
>>> Why can't we just walk until we run out of levels?
>>
>> This is looking for a unified cache - and we don't know where those start.
>> We could walk the first 100 caches, and stop once we start getting unified caches, then
>> they stop again ... but this seemed simpler.
> 
> I'm still a bit confused.
> 
> We start at level one, and then trace parents until we hit a unified
> cache or run out of levels.
> 
> Why do we need to know a priori how many levels there are, when the
> way to determine that is part of the same procedure we're already doing
> (i.e., start at level one and trace parents until we run out of levels)?

| level = 1;
| acpi_find_cache_node(table, acpi_cpu_id, ACPI_PPTT_CACHE_TYPE_UNIFIED,
|			level, &cpu_node);

Fails. Do we stop the loop, or try level=2?

level = 1 fails because the L1 (probably) isn't a unified cache. Is L2? We don't know.


It's simpler to know how many levels there are, and walk the lot, than it is to try and
work out where the unified bit of the hierarchy starts - and start walking from there.

Yes the PPTT parsing could be different, but this is the kind of shape it has. Doing it
like this is in-keeping with the rest of it.


>>> I may be missing some details of how these functions interact -- if
>>> this is only run at probe time, compact, well-factored code is
>>> more important than making things as fast as possible.
> 
> (This still stands.)

This is all done at probe time, and never called again.
Nothing else in here caches values - it derives it all from the table every time so that
its stateless.


James

