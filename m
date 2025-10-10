Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CB0CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw4mhEbFEh0Mf7rws7osz/Y4i90Mzx9rKS+a0C+9DII=; b=uYHYxh7chOASVTPPn/4H0hEN8t
	nna0gR17WlbKET8U+ygb52Mo4PGps1MDPbSagD4Ea0+bWn7FEgCDl914TZnCuecd0gHO2uNJ+4krL
	wAog4mE9BeoFvvSfBSP6U4f+ZksLQxOcbsx27DaPBWZHQxPXRbKSwfoHqTjPWLWEdtz89VgP1ULN5
	8EsDbyckTBqe1GCvy/1BBm8nCfK0YH2O0olWPFhpQz2IMvWX2YgKOgwFvDC7dCJFON4o+kLUrH79Q
	TxhhyUPZ+oBm1V7Zza5+64/GRAbrbgAnBsFtOhco2qmTbIprCfcS3DQTLBFn0hDV7so2JTWmA/GnW
	zKEJiEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPU-0000000918Z-4ASN;
	Fri, 10 Oct 2025 16:56:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPU-0000000917m-05hj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Yw4mhEbFEh0Mf7rws7osz/Y4i90Mzx9rKS+a0C+9DII=; b=pw6T1l7cRAhBiFINTyYiSLp6hl
	NIJ77zwWmKHDPkzW+H2Fh05zJmNcLTspViSuWCiO9y+7e/TwpYKqQhs/aCtUK1ZzA2jL8S/Sd2GW9
	4zJ7L33kxxDd0QnFyNK6Kr2uRwWG1z5o7V8HWZLOMbqspt3JM/2+/NJj/X4Ix4+pLycQ4EFjAlsZn
	hiBCy0ANGmiHcZrWeYJOOYph0yh6Sq7PsY+5SUCp7wms5fPxg1I1bAmRvOm9dKxQjS26OKh9/8+8+
	lsrxWUMvMUuV3tsa3nGGufWERumu9K+wsPDxoT5kDPNWlMGk++1W07whr9E4OiFmmw/N1u6bEcboD
	9uO8ffTA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GPQ-00000002JNm-0soX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:56:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04812153B;
	Fri, 10 Oct 2025 09:55:49 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FEA73F66E;
	Fri, 10 Oct 2025 09:55:51 -0700 (PDT)
Message-ID: <7dbd9fd8-762b-405b-bb4e-f6adb60c8d80@arm.com>
Date: Fri, 10 Oct 2025 17:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/29] ACPI / PPTT: Add a helper to fill a cpumask from
 a cache_id
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-5-james.morse@arm.com>
 <094cc278-d488-4d22-a1f4-73616f4b99d5@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <094cc278-d488-4d22-a1f4-73616f4b99d5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175600_609902_9AA19B95 
X-CRM114-Status: GOOD (  25.87  )
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

Hi Fenghua,

On 02/10/2025 06:03, Fenghua Yu wrote:
> On 9/10/25 13:42, James Morse wrote:
>> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
>>
>> The driver needs to know which CPUs are associated with the cache.
>> The CPUs may not all be online, so cacheinfo does not have the
>> information.
>>
>> Add a helper to pull this information out of the PPTT.

>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index c5f2a51d280b..c379a9952b00 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -966,3 +966,62 @@ int find_acpi_cache_level_from_id(u32 cache_id)
>> +/**
>> + * acpi_pptt_get_cpumask_from_cache_id() - Get the cpus associated with the
>> + *                       specified cache
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
>> +    u32 acpi_cpu_id;
>> +    int level, cpu, num_levels;
>> +    struct acpi_pptt_cache *cache;
>> +    struct acpi_pptt_cache_v1 *cache_v1;
>> +    struct acpi_pptt_processor *cpu_node;
>> +    struct acpi_table_header *table __free(acpi_table) =
>> acpi_get_table_ret(ACPI_SIG_PPTT, 0);
>> +
>> +    cpumask_clear(cpus);
>> +
>> +    if (IS_ERR(table))
>> +        return -ENOENT;
>> +
>> +    if (table->revision < 3)
>> +        return -ENOENT;
>> +
>> +    for_each_possible_cpu(cpu) {
>> +        acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +        cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>> +        if (WARN_ON_ONCE(!cpu_node))
>> +            continue;
>> +        num_levels = acpi_count_levels(table, cpu_node, NULL);
>> +
>> +        /* Start at 1 for L1 */
>> +        for (level = 1; level <= num_levels; level++) {
>> +            cache = acpi_find_cache_node(table, acpi_cpu_id,
>> +                             ACPI_PPTT_CACHE_TYPE_UNIFIED,
>> +                             level, &cpu_node);
>> +            if (!cache)
>> +                continue;
>> +
>> +            cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
>> +                        cache,
>> +                        sizeof(struct acpi_pptt_cache));
>> +
>> +            if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
>> +                cache_v1->cache_id == cache_id)
>> +                cpumask_set_cpu(cpu, cpus);
> 
> This function is almost identical to find_acpi_cache_level_from_id() defined in patch #3.

Yes - there is already a lot of repetition in this file.

I'd previously suggested to Jeremy L to ahve a walker with callbacks, but he felt that
made it harder to read.
Jonathan suggested a for_each_acpi_pptt_entry() helper:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=pptt/for_each_pptt_entry/v0&id=353ceeba3d39c6b6a10eeb1a59c49649cdf719d8

I'm avoiding including that here as its ~30 patches already!


> To reduce code size and complexity, it's better to define a common helper to server both
> of the two functions.
> 
> e.g. define a helper acpi_pptt_get_level_cpumask_from_cache_id(u32 cache_id, int *lvl,
> cpu_mask_t *cpus)
> 
> This helper has the same code body to traverse the cache levels for all CPUs as
> find_acpi_cache_level_from_id() and acpi_pptt_get_cpumask_from_cache_id(). The major
> difference is here:
> 
> +            if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
> +                cache_v1->cache_id == cache_id) {
> +                if (cpus)
> +                    cpumask_set_cpu(cpu, cpus);
> +                if ((level) {
> +                    *lvl = level;
> +                    return 0;
> +                }
> 
> Then simplify the two callers as follows:
> int find_acpi_cache_level_from_id(u32 cache_id)
> {
>     int level;
>     int err = acpi_pptt_get_level_cpumask_from_cache_id(cache_id, &level, NULL);
>     if (err)
>         return err;
> 
>     return level;
> }
> 
> int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
> {
>     return acpi_pptt_get_level_cpumask_from_cache_id(cache_id, NULL, cpus);
> }
> 

You've combined two functions that both walk the table (there are quiet a few more in this
file) - but they look for very different things. Your common helper is going to be much
more complex than either of these standalone.

I think Jonathan's for-each helper is the best path forward, that reduces the boiler plate
leaving the relevant differences.



Thanks,

James

