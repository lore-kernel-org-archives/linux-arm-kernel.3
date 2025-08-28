Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08442C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CojbWx2sXsg3gE8HdZtLCFtqBag6VK03bpPHPaV6wZk=; b=s+bJeTqJVGQ3lwq12j3X6ENV5Y
	YzqOoyt8/A84CalctmpF2Ls8beIQJGLNr8KMGGbntz9FJGL9QSxjcyPJyB7ASx/cGOlzODOzEzmv3
	eP7jG+E6XijPC6iGtqr9rfwapHsDZVfbYWtNfksGpe5jP+hOEZ3/cnLigIWI8YxvgjSTSUCRFYWCo
	jYMmn3blxaiLsM/ooo/qg7KgJGHPMSCyIGHll7nXRb3NpaE9p2h6IwFYL9jPJ23UPlGXQcZsHnmD9
	EI7KqENzBkXWDpCb8eLqxT8GSgfbiQeci13nA2HkBtclsyKEsikrFu4ocT/gxS0dVjnMyuQpWl827
	/Up8i2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhb1-00000002qRG-1Sv8;
	Thu, 28 Aug 2025 18:43:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf1A-00000002ALl-016k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:58:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D88942A31;
	Thu, 28 Aug 2025 08:58:18 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A42E43F694;
	Thu, 28 Aug 2025 08:58:18 -0700 (PDT)
Message-ID: <2e4c3c00-b248-421e-8ff1-d24b7b03be1a@arm.com>
Date: Thu, 28 Aug 2025 16:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/33] ACPI / PPTT: Add a helper to fill a cpumask from a
 cache_id
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
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
 <20250822153048.2287-7-james.morse@arm.com>
 <aK7ju2caTjqf1+VN@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aK7ju2caTjqf1+VN@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085828_142713_6331EA7F 
X-CRM114-Status: GOOD (  32.87  )
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

On 27/08/2025 11:53, Dave Martin wrote:
> On Fri, Aug 22, 2025 at 03:29:47PM +0000, James Morse wrote:
>> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
>>
>> The driver needs to know which CPUs are associated with the cache,
>> the CPUs may not all be online, so cacheinfo does not have the
>> information.
> 
> Nit: cacheinfo lacking the information is not a consequence of the
> driver needing it.
> 
> Maybe split the sentence:
> 
> -> "[...] associated with the cache. The CPUs may not [...]"

Sure,


>> Add a helper to pull this information out of the PPTT.

>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 660457644a5b..cb93a9a7f9b6 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -971,3 +971,65 @@ int find_acpi_cache_level_from_id(u32 cache_id)
>>  
>>  	return -ENOENT;
>>  }
>> +
>> +/**
>> + * acpi_pptt_get_cpumask_from_cache_id() - Get the cpus associated with the
>> + *					   specified cache
>> + * @cache_id: The id field of the unified cache
>> + * @cpus: Where to build the cpumask
>> + *
>> + * Determine which CPUs are below this cache in the PPTT. This allows the property
>> + * to be found even if the CPUs are offline.
>> + *
>> + * The PPTT table must be rev 3 or later,
>> + *
>> + * Return: -ENOENT if the PPTT doesn't exist, or the cache cannot be found.
>> + * Otherwise returns 0 and sets the cpus in the provided cpumask.
>> + */
>> +int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
>> +{
>> +	u32 acpi_cpu_id;
>> +	int level, cpu, num_levels;
>> +	struct acpi_pptt_cache *cache;
>> +	struct acpi_pptt_cache_v1 *cache_v1;
>> +	struct acpi_pptt_processor *cpu_node;
>> +	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_PPTT, 0);
>> +
>> +	cpumask_clear(cpus);
>> +
>> +	if (IS_ERR(table))
>> +		return -ENOENT;
>> +
>> +	if (table->revision < 3)
>> +		return -ENOENT;
>> +
>> +	/*
>> +	 * If we found the cache first, we'd still need to walk from each cpu.
>> +	 */
>> +	for_each_possible_cpu(cpu) {
>> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>> +		if (!cpu_node)
>> +			return 0;
>> +		num_levels = acpi_count_levels(table, cpu_node, NULL);
>> +
>> +		/* Start at 1 for L1 */
>> +		for (level = 1; level <= num_levels; level++) {
>> +			cache = acpi_find_cache_node(table, acpi_cpu_id,
>> +						     ACPI_PPTT_CACHE_TYPE_UNIFIED,
>> +						     level, &cpu_node);
>> +			if (!cache)
>> +				continue;
>> +
>> +			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
>> +						cache,
>> +						sizeof(struct acpi_pptt_cache));
>> +
>> +			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
>> +			    cache_v1->cache_id == cache_id)
>> +				cpumask_set_cpu(cpu, cpus);

> Again, it feels like we are repeating the same walk multiple times to
> determine how deep the table is (on which point the table is self-
> describing anyway), and then again to derive some static property, and
> then we are then doing all of that work multiple times to derive
> different static properties, etc.
> 
> Can we not just walk over the tables once and stash the derived
> properties somewhere?

That is possible - but its a more invasive change to the PPTT parsing code.
Before the introduction of the leaf flag, the search for a processor also included a
search to check if the discovered node was a leaf.

I think this is trading time - walking over the table multiple times, against the memory
you'd need to de-serialise the tree to find the necessary properties quickly. I think the
reason Jeremy L went this way was because there may never be another request into this
code, so being ready with a quick answer was a waste of memory.

MPAM doesn't change this - all these things are done up front during driver probing, and
the values are cached by the driver.


> I'm still getting my head around this parsing code, so I'm not saying
> that the approach is incorrect here -- just wondering whether there is
> a way to make it simpler.

It's walked at boot, and on cpu-hotplug. Neither are particularly performance critical.

I agree that as platforms get bigger, there will be a tipping point ... I don't think
anyone has complained yet!


Thanks,

James

