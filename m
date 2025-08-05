Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B89C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VJpCq2UBzoo5Gq81tAp+U+WDasQNYVFp/x+zbEjAJU=; b=abyt+/QFvSAP6la+nZM4k66a/H
	NUmrZkDOxx+UdPFJy1Lef7rNjZw0yIhxTrF0tk4YeWm7BpbrsRzDx2Br73hNTkXE5BtmP/EPhJA67
	+3MrbZDifXZuLXmGiPl46A0XYM8mnkW58TMClKLfnTyVK8RdOh1Yj9eV/p1r39YTUB9zg0hxnhiZo
	jXBViCfckJLQEg3gbqd3mVrzoSDQimzyPs9Zp1eSwp1XUzt/o9xG6LRFH+JL7Svr4ukj3wuWKu86A
	AVkK4webDcjS7T7zAfpSw0PB+zVNXT+ra6ySEOxTS48A1w8iHyJQZzk6Oz8XQD8dxILP+S/AnunFW
	r/MV0dfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLR8-0000000DQqa-2krN;
	Tue, 05 Aug 2025 17:26:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL7s-0000000DNYh-48Ow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 17:07:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF5E1150C;
	Tue,  5 Aug 2025 10:06:47 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 408923F673;
	Tue,  5 Aug 2025 10:06:51 -0700 (PDT)
Message-ID: <d6aeda30-152f-4dde-ba76-57f703f24b1c@arm.com>
Date: Tue, 5 Aug 2025 18:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/36] ACPI / PPTT: Find cache level by cache-id
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-8-james.morse@arm.com>
 <20250716172144.00000715@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250716172144.00000715@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_100701_112049_8973650E 
X-CRM114-Status: GOOD (  32.67  )
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

On 16/07/2025 17:21, Jonathan Cameron wrote:
> On Fri, 11 Jul 2025 18:36:19 +0000
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
>>
>> acpi_count_levels() expects its levels parameter to be initialised to
>> zero as it passes it to acpi_find_cache_level() as starting_level.
>> The existing callers do this. Document it.

> A few suggestions inline.  Mostly driven by the number of missing table
> puts I've seen in ACPI code. You don't have any missing here but with a
> bit of restructuring you can make that easy to see.

Sounds good,


>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 13ca2eee3b98..f53748a5df19 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -912,3 +912,76 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
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
>> + * Otherwise returns a value which represents the level of the specified cache.
>> + */
>> +int find_acpi_cache_level_from_id(u32 cache_id)
>> +{
>> +	u32 acpi_cpu_id;
>> +	acpi_status status;
>> +	int level, cpu, num_levels;
>> +	struct acpi_pptt_cache *cache;
>> +	struct acpi_table_header *table;
>> +	struct acpi_pptt_cache_v1 *cache_v1;
>> +	struct acpi_pptt_processor *cpu_node;
>> +
>> +	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
>> +	if (ACPI_FAILURE(status)) {
>> +		acpi_pptt_warn_missing();
>> +		return -ENOENT;
>> +	}
>> +
>> +	if (table->revision < 3) {


> Maybe a unified exit path given all paths need to do
> acpi_put_table() and return either error or level.
> 
> Or maybe it's time for some cleanup.h magic for acpi tables. I've
> been thinking about it for a while and mostly stuck on the name ;)

(Isn't that the hard bit?)


> (simpler suggestion follows)
> 
> static struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
> {
> 	struct acpi_table_header *table;
> 	int status = acpi_get_table(signature, instance, &table);
> 	
> 	if (ACPI_FAILURE(status))
> 		return ERR_PTR(-ENOENT);
> 	return table;
> }
> 
> DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) acpi_put_table(_T))
> 
> Finally in here and loads of other places we avoid chance of missing an acpi_put_table
> and generally simplify the code a little.
> 
> int find_acpi_cache_level_from_id(u32 cache_id)
> {
> 	u32 acpi_cpu_id;
> 	acpi_status status;
> 	int level, cpu, num_levels;
> 	struct acpi_pptt_cache *cache;
> 	struct acpi_pptt_cache_v1 *cache_v1;
> 	struct acpi_pptt_processor *cpu_node;
> 
> 
> 	struct acpi_table_header *table __free(acpi_table) =
> 		acpi_get_table_ret(ACPI_SIG_PPTT, 0);
> 
> 	if (IS_ERR(table)
> 		return PTR_ERR(table);
> 
> 	if (table->revision < 3)
> 		return -ENOENT;
> 
> 	/*
> 	 * If we found the cache first, we'd still need to walk from each CPU
> 	 * to find the level...
> 	 */
> 	for_each_possible_cpu(cpu) {
> 		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> 		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> 		if (!cpu_node)
> 			return -ENOENT;
> 		acpi_count_levels(table, cpu_node, &num_levels, NULL);
> 
> 		/* Start at 1 for L1 */
> 		for (level = 1; level <= num_levels; level++) {
> 			cache = acpi_find_cache_node(table, acpi_cpu_id,
> 						     ACPI_PPTT_CACHE_TYPE_UNIFIED,
> 						     level, &cpu_node);
> 			if (!cache)
> 				continue;
> 
> 			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> 						cache,
> 						sizeof(struct acpi_pptt_cache));
> 
> 			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
> 			    cache_v1->cache_id == cache_id) {
> 				acpi_put_table(table);
> 				return level;
> 			}
> 		}
> 	}
> 	return -ENOENT;
> }
> 
> 
> A less 'fun' alternative is pull some code out as a helper to make put the get and put
> near each other with no conditionals to confuse things.

I still find the cleanup stuff slightly sickening ... so lets use it some more.

Added to linux/acpi.h to make it easier to use elsewhere. I think the earlier patches in
this series are simple enough in this area its not worth changing them...


Thanks,

James

