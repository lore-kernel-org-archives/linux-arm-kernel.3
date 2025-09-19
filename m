Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2267BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeMGF+DY0L1I5NDwo3Ao43olUpEeS+xT+LMQ8Ve4jPE=; b=e4sOu1laCJjBwchgu8tM62qROu
	Tm1P+2m09DTEHmPTF6yhJWWKyYDBriZ0dJ4yZwmtyN4kgP08rmzVxJzHmtIsfJUkmcefb/2IF1htJ
	ukYHAN9MyqalrqMraz/Jt3A5ILa7ldokNB/LhliBWdMHK1N1UnXm5EogB20glTVL4AHZRSiTWY7So
	IJz1CBG8HWIX2ir8JFt1tOT47EbVGB4ghr3hddz8YPcAVLRdJK7cAkUuBKdgNirYt52MbUgw7WX7U
	JDkcrn9OjOh7sm+ebVIuuJu9q9dfoN5AEH52iqtsn+AmK4duigAPimZBTGP00GVek46m6Xn1qYtKC
	4b2g3+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdhI-00000003TwN-0fRO;
	Fri, 19 Sep 2025 16:10:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdhE-00000003Tv4-3Wx3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:10:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CCCF1C01;
	Fri, 19 Sep 2025 09:10:43 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 674E23F66E;
	Fri, 19 Sep 2025 09:10:46 -0700 (PDT)
Message-ID: <baa93014-e71d-4098-a6bc-1d75d4d819ee@arm.com>
Date: Fri, 19 Sep 2025 17:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/29] ACPI / PPTT: Find cache level by cache-id
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-4-james.morse@arm.com>
 <20250911115946.00001752@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250911115946.00001752@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_091052_968669_4E48C138 
X-CRM114-Status: GOOD (  32.55  )
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

Hi Jonathan,

On 11/09/2025 11:59, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:42:43 +0000
> James Morse <james.morse@arm.com> wrote:
> 
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

>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 7af7d62597df..c5f2a51d280b 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -904,3 +904,65 @@ void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
>>  				     entry->length);
>>  	}
>>  }
>> +
>> +/*
> /**
> 
> It's an exposed interface so nice to have formal kernel-doc and automatic
> checks that brings.
> 
>> + * find_acpi_cache_level_from_id() - Get the level of the specified cache
>> + * @cache_id: The id field of the unified cache
>> + *
>> + * Determine the level relative to any CPU for the unified cache identified by
>> + * cache_id. This allows the property to be found even if the CPUs are offline.
>> + *
>> + * The returned level can be used to group unified caches that are peers.

> Silly question but why do we care if this a unified cache?

/me returns from the time-machine trip....

This is legacy, but results in parity with the DT approach.
Really early versions of this generated an ID based on the associated CPUs - like DT
does/would-do today. This value isn't unique for non-unified caches as they have the same
set of CPUs below them, so every use of cache-id used to have to check it was a unified cache.
This isn't a problem for MPAM as there is never likely to be an L1 MSC, but you're right-
it hinders re-use of this.

Since ACPI then went and added the ID to the PPTT, we don't need to check this here.


> It's a bit odd to have a general sounding function fail for split caches.
> The handling would have to be more complex but if we really don't want
> to do it maybe rename the function to find_acpi_unifiedcache_level_from_id()
> and if the general version gets added later we can switch to that.

I'll add the extra work - this avoids the call to acpi_count_levels() which was annoying
Dave as its another walk of the whole table. (I didn't twig in that conversation that the
unified check may no longer be necessary)


>> + *
>> + * The PPTT table must be rev 3 or later,
>> + *
>> + * If one CPUs L2 is shared with another as L3, this function will return
>> + * an unpredictable value.
>> + *
>> + * Return: -ENOENT if the PPTT doesn't exist, the revision isn't supported or
>> + * the cache cannot be found.
>> + * Otherwise returns a value which represents the level of the specified cache.
>> + */
>> +int find_acpi_cache_level_from_id(u32 cache_id)
>> +{
>> +	u32 acpi_cpu_id;
>> +	int level, cpu, num_levels;
>> +	struct acpi_pptt_cache *cache;
>> +	struct acpi_table_header *table;
>> +	struct acpi_pptt_cache_v1 *cache_v1;
>> +	struct acpi_pptt_processor *cpu_node;
>> +
>> +	table = acpi_get_pptt();
>> +	if (!table)
>> +		return -ENOENT;
>> +
>> +	if (table->revision < 3)
>> +		return -ENOENT;
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>> +		if (!cpu_node)
>> +			return -ENOENT;
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
> 
> sizeof(*cache) to me makes this more obvious.

Would be the only instance of this in the file - but I agree its more readable, and
results in fewer line breaks, which also helps.


>> +
>> +			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
>> +			    cache_v1->cache_id == cache_id)
>> +				return level;
>> +		}
>> +	}
>> +
>> +	return -ENOENT;
>> +}


Thanks,

James

