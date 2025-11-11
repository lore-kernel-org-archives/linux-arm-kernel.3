Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F98CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1LoAFVktGKKY6NxxpPreh0DPSm6mcJznqp9DZceZFI=; b=FZFTgy89NJn62EWBuhvbwAbUla
	UWTsy+s1u9V+djjYrJTyr8XRjOOUpX4rKxLUl3jaBJnovkpoVjEqqkLMZKR8CgoWVSIgQhKM9omFD
	wqRggO91ZUIxhHo7oGHhuTRUxxMHsZaFFVLE9bFe0pLYO9Ef1BOaDZiOv5UxqXbAu47mOxGQH6c5F
	zKdegA/CIV0/Q3XN7iy4qEONswL7Jym7gv96UhuvGbhiysgmoJ+I98rRBAhGsfvaGGEYS/+OFovcf
	gPXyae8Y8rDN5AZD80z0gwgRrddJXECs1EdsvHaNGJPEf4Wy9ccW1qmVBaCyqc+KpJn+Nq3YptBB5
	8m3H1xSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrlY-00000007VhX-3Snc;
	Tue, 11 Nov 2025 17:02:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrlW-00000007Vgm-17bK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:02:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 698FE497;
	Tue, 11 Nov 2025 09:02:36 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8723E3F5A1;
	Tue, 11 Nov 2025 09:02:39 -0800 (PST)
Message-ID: <313158c4-055e-481e-9ab1-d5d4213a502a@arm.com>
Date: Tue, 11 Nov 2025 17:02:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/33] ACPI / PPTT: Find cache level by cache-id
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-5-ben.horgan@arm.com>
 <20251110160218.00001d65@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251110160218.00001d65@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_090246_402764_33C5F226 
X-CRM114-Status: GOOD (  27.41  )
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

On 11/10/25 16:02, Jonathan Cameron wrote:
> On Fri, 7 Nov 2025 12:34:21 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
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
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> A few things inline.
> 
>> ---
>> Changes since v3:
>> Tags dropped due to rework
>> Fallout/simplification from adding acpi_pptt_cache_v1_full
>> Look for each cache type before incrementing level
>> ---
>>  drivers/acpi/pptt.c  | 63 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/acpi.h |  5 ++++
>>  2 files changed, 68 insertions(+)
>>
>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 1ed2099c0d1a..71841c106020 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -918,3 +918,66 @@ void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
>>  				     entry->length);
>>  	}
>>  }
>> +
>> +/**
>> + * find_acpi_cache_level_from_id() - Get the level of the specified cache
>> + * @cache_id: The id field of the cache
>> + *
>> + * Determine the level relative to any CPU for the cache identified by
>> + * cache_id. This allows the property to be found even if the CPUs are offline.
>> + *
>> + * The returned level can be used to group caches that are peers.
>> + *
>> + * The PPTT table must be rev 3 or later.
>> + *
>> + * If one CPU's L2 is shared with another CPU as L3, this function will return
>> + * an unpredictable value.
>> + *
>> + * Return: -ENOENT if the PPTT doesn't exist, the revision isn't supported or
>> + * the cache cannot be found.
>> + * Otherwise returns a value which represents the level of the specified cache.
>> + */
>> +int find_acpi_cache_level_from_id(u32 cache_id)
>> +{
>> +	int cpu;
>> +	struct acpi_table_header *table;
>> +
>> +	table = acpi_get_pptt();
>> +	if (!table)
>> +		return -ENOENT;
>> +
>> +	if (table->revision < 3)
>> +		return -ENOENT;
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		bool not_empty = true;
>> +		u32 acpi_cpu_id;
>> +		struct acpi_pptt_cache_v1_full *cache;
>> +		struct acpi_pptt_processor *cpu_node;
>> +
>> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> 
> Might as well combine this one with declaration.

Will do.

> 
>> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>> +		if (!cpu_node)
>> +			continue;
>> +
>> +		for (int level = 1; not_empty; level++) {
> 
> This smells very much like a while loop rather than a for loop. Make
> it a do/while and you can avoid the somewhat nasty setting not_empty = true
> just to get in for first iteration.
> 
> 		int level = 1;
> 		do {
> 			int cache_type[] = { CACHE_TYPE_INST, CACHE_TYPE_DATA, CACHE_TYPE_UNIFIED };
> 
> 			not_empty = false;
> 			for (int i = 0; i < ARRAY_SIZE(cache_type); i++) {
> 				cache = acpi_find_cache_node(table, acpi_cpu_id, cache_type[i],
> 							     level, &cpu_node);
> 				if (!cache)
> 					continue;
> 
> 				not_empty = true;
> 
> 				if (acpi_pptt_cache_id_is_valid(cache) &&
> 				    cache->extra.cache_id == cache_id)
> 					return level;
> 			}
> 		} while (not_empty);
> 
> Maybe flip sense of that bool to be empty and !empty for the test.

Yes, this is better. I'll stop abusing the for loop in this patch and
the next. Changing not_empty to !empty make sense too.

> 
> 
>> +			int cache_type[] = {CACHE_TYPE_INST, CACHE_TYPE_DATA, CACHE_TYPE_UNIFIED};
>> +
>> +			not_empty = false;
>> +			for (int i = 0; i < ARRAY_SIZE(cache_type); i++) {
>> +				cache = acpi_find_cache_node(table, acpi_cpu_id, cache_type[i],
>> +							     level, &cpu_node);
>> +				if (!cache)
>> +					continue;
>> +
>> +				not_empty = true;
>> +
>> +				if (acpi_pptt_cache_id_is_valid(cache) &&
>> +				    cache->extra.cache_id == cache_id)
>> +					return level;
>> +			}
>> +		}
>> +	}
>> +
>> +	return -ENOENT;
>> +}
> 
> 

Thanks,

Ben


