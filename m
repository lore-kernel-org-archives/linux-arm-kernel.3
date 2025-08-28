Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE57C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y62FhME0crS/4slxhEV34v2Kl01vZ22Rs0LKCuTHHbs=; b=mmsVeGvU3cS6l613u2skSzpLmQ
	n37y4n2Tq8e0RV9GdL+ESMsMDdKqsU8LDQLGtNs+ofkPtX8YPj08AgrAph4PyMYxJyq1b6taKUThx
	CcR3RG9gpkY0cqFCL63kwwPs/iDbmyLh+5KR4UdHPrwZOZBBdklmrw5Ws1E7EpYTibnqiDwol2ZGr
	Ion6mEV1W1g0Vew1eGziPoXf/kIv2QPXxLtlqTd1vMTmPYMpjaTFxbkRNwTx+lFwS5Rmo+8Q1KIZf
	4yeLV9BpYE+DhTRDJfYsLdDcia3s/hoh6XuVnlSfaLxK/Re0I3W/cvwZ4p8ytSnkGWjLk5CfGGqiK
	VtoorWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhYJ-00000002q2M-2Q8x;
	Thu, 28 Aug 2025 18:40:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf0v-00000002AIW-24Zq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:58:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DCBC2944;
	Thu, 28 Aug 2025 08:58:04 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B706B3F694;
	Thu, 28 Aug 2025 08:58:05 -0700 (PDT)
Message-ID: <cc4881e8-5d90-4992-8cbf-650ea2efa5ca@arm.com>
Date: Thu, 28 Aug 2025 16:58:05 +0100
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
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aK7jEMqM/FoB4ABW@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085813_629048_B5D4443B 
X-CRM114-Status: GOOD (  46.76  )
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

On 27/08/2025 11:50, Dave Martin wrote:
> Hi,
> 
> On Fri, Aug 22, 2025 at 03:29:46PM +0000, James Morse wrote:
>> The MPAM table identifies caches by id. The MPAM driver also wants to know
>> the cache level to determine if the platform is of the shape that can be
>> managed via resctrl. Cacheinfo has this information, but only for CPUs that
>> are online.
>>
>> Waiting for all CPUs to come online is a problem for platforms where
>> CPUs are brought online late by user-space.
>>
>> Add a helper that walks every possible cache, until it finds the one
>> identified by cache-id, then return the level.
>> Add a cleanup based free-ing mechanism for acpi_get_table().

> Does this mean that the early secondaries must be spread out across the
> whole topology so that everything can be probed?
>
> (i.e., a random subset is no good?)

For the mpam driver - it needs to see each cache with mpam hardware, which means a CPU
associated with each cache needs to be online. Random is fine - provided you get lucky.


> If so, is this documented somewhere, such as in booting.rst?

booting.rst is for the bootloader.
Late secondaries is a bit of a niche sport, I've only seen it commonly done in VMs.
Most platforms so far have their MPAM controls on a global L3, so this requirement doesn't
make much of a difference.

The concern is that if resctrl gets probed after user-space has started, whatever
user-space service is supposed to set it up will have concluded its not supported. Working
with cache-ids for offline CPUs means you don't have to bring all the CPUs online - only
enough so that every piece of hardware is reachable.


> Maybe this is not a new requirement -- it's not an area that I'm very
> familiar with.

Hard to say - its a potentially surprising side effect of glomming OS accessible registers
onto the side of hardware that can be automatically powered off. (PSCI CPU_SUSPEND).

I did try getting cacheinfo to populate all the CPUs at boot, regardless of whether they
were online. Apparently that doesn't work for PowerPC where the properties of CPUs can
change while they are offline. (presumably due to RAS or a firmware update)


>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 8f9b9508acba..660457644a5b 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -907,3 +907,67 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>>  	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
>>  					  ACPI_PPTT_ACPI_IDENTICAL);
>>  }
>> +
>> +/**
>> + * find_acpi_cache_level_from_id() - Get the level of the specified cache
>> + * @cache_id: The id field of the unified cache
>> + *
>> + * Determine the level relative to any CPU for the unified cache identified by
>> + * cache_id. This allows the property to be found even if the CPUs are offline.
>> + *
>> + * The returned level can be used to group unified caches that are peers.
>> + *
>> + * The PPTT table must be rev 3 or later,
>> + *
>> + * If one CPUs L2 is shared with another as L3, this function will return
>> + * an unpredictable value.
>> + *
>> + * Return: -ENOENT if the PPTT doesn't exist, or the cache cannot be found.
> 
> Nit: doesn't exist or its revision is too old.

... its not old, but there is no published spec for that revision... unsupported?


>> + * Otherwise returns a value which represents the level of the specified cache.
>> + */
>> +int find_acpi_cache_level_from_id(u32 cache_id)
>> +{
>> +	u32 acpi_cpu_id;
>> +	int level, cpu, num_levels;
>> +	struct acpi_pptt_cache *cache;
>> +	struct acpi_pptt_cache_v1 *cache_v1;
>> +	struct acpi_pptt_processor *cpu_node;
>> +	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_PPTT, 0);

> acpi_get_pptt() ? (See comment on patch 3.)

Yup,

> Comments there also suggest that the acpi_put_table() may be
> unnecessary, at least on some paths.
> 
> I haven't tried to understand the ins and outs of this.

It's grabbing one reference and using it for everything, because it needs to 'map' the
table in atomic context due to cpuhp, but can't.
Given how frequently its used, there is no problem just leaving it mapped.


>> +
>> +	if (IS_ERR(table))
>> +		return PTR_ERR(table);
>> +
>> +	if (table->revision < 3)
>> +		return -ENOENT;
>> +
>> +	/*
>> +	 * If we found the cache first, we'd still need to walk from each CPU
>> +	 * to find the level...
>> +	 */

> ^ Possibly confusing comment?  The cache id is the starting point for
> calling this function.  Is there a world in which we are at this point
> without first having found the cache node?
> 
> (If the comment is just a restatement of part of the kerneldoc
> description, maybe just drop it.)

It's describing the alternate world where the table is searched to find the cache first,
but then we'd still need to walk the table another NR_CPUs times, which can't be avoided.
I'll drop it - it was justifying why its done this way round...


>> +	for_each_possible_cpu(cpu) {
>> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>> +		if (!cpu_node)
>> +			return -ENOENT;
>> +		num_levels = acpi_count_levels(table, cpu_node, NULL);
> 
> Is the initial call to acpi_count_levels() really needed here?
> 
> It feels a bit like we end up enumerating the whole topology two or
> three times here; once to count how many levels there are, and then
> again to examine the nodes, and once more inside acpi_find_cache_node().
> 
> Why can't we just walk until we run out of levels?

This is looking for a unified cache - and we don't know where those start.
We could walk the first 100 caches, and stop once we start getting unified caches, then
they stop again ... but this seemed simpler.


> I may be missing some details of how these functions interact -- if
> this is only run at probe time, compact, well-factored code is
> more important than making things as fast as possible.


>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index f97a9ff678cc..30c10b1dcdb2 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
> 
> [...]
> 
>> @@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
>>  void acpi_table_init_complete (void);
>>  int acpi_table_init (void);
>>  
>> +static inline struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
>> +{
>> +	struct acpi_table_header *table;
>> +	int status = acpi_get_table(signature, instance, &table);
>> +
>> +	if (ACPI_FAILURE(status))
>> +		return ERR_PTR(-ENOENT);
>> +	return table;
>> +}

> This feels like something that ought to exist already.  If not, why
> not?  If so, are there open-coded versions of this spread around the
> ACPI tree that should be ported to use it?


It's a cleanup idiom helper that lets the compiler do this automagically - but its moot as
its not going to be needed in the pptt because of the acpi_get_pptt() thing.


Thanks,

James

