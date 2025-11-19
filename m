Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A76CF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdgUHjhOhMdBD5MpORhRQGrr1TsTsfUQmgzNOssplK8=; b=qoqBxL4Usn32SGLQJHU7EzeRGT
	16i+QNguwGREwqwRtGfGkaHxZArbVWY/PTeztxvYOf2C58yuQ/xyBaL1dl2dCYoJmcviyZpcPCXHn
	knflIs2vi3MxK+9wKCrWNFsC36RZ8OgmkDxIyQVk+c1aJe0tj7VCb/9iH/144cCLTpgbfPebihW97
	+qGATT83otr0/0GHVWJ6HXiRS/J2K15BXgtu4J7MHjgfJ2XaJWl+4pItfp94xIj8VdHK1h6XtquCo
	ehKiu4TCBQ/maQKfXZPIYLW36pGbm3ltDMg33b/64LElDbgx4G3LknqZSpiT5PEW7o8mwlOWJiTUc
	t7HVfXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlBZ-00000003iZH-1NmG;
	Wed, 19 Nov 2025 16:37:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlBX-00000003iYT-1Bvw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:37:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FDFFEC;
	Wed, 19 Nov 2025 08:37:26 -0800 (PST)
Received: from [172.27.42.169] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F8833F740;
	Wed, 19 Nov 2025 08:37:31 -0800 (PST)
Message-ID: <92f99246-1533-4bf9-bbb5-39d1c148467f@arm.com>
Date: Wed, 19 Nov 2025 10:37:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/34] ACPI / PPTT: Add a helper to fill a cpumask from
 a cache_id
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Zeng Heng <zengheng4@huawei.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-6-ben.horgan@arm.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20251117170014.4113754-6-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_083735_421504_D0A1688B 
X-CRM114-Status: GOOD (  29.27  )
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

On 11/17/25 10:59 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
> 
> The driver needs to know which CPUs are associated with the cache.
> The CPUs may not all be online, so cacheinfo does not have the
> information.
> 
> Add a helper to pull this information out of the PPTT.

All the PPTT stuff look fine to me, patch 4+5 continue to build on some 
of the copy/pasty bits in this module which isn't ideal but seems to be 
the best way forward at the moment.

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>

Thanks again for taking care of this.

> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v4:
> Same changes as previous patch in series
> do/while
> initialisation of acpi_cpu_id
> use new version of acpi_pptt_cache_v1_full
> 
> Changes since v3:
> Equivalent changes to the previous patch:
>   Tags dropped due to rework
>   Fallout/simplification from adding acpi_pptt_cache_v1_full
>   Look for each cache type before incrementing level
> ---
>   drivers/acpi/pptt.c  | 65 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  6 ++++
>   2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 5b1e9e410204..cea80337f01f 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -998,3 +998,68 @@ int find_acpi_cache_level_from_id(u32 cache_id)
>   
>   	return -ENOENT;
>   }
> +
> +/**
> + * acpi_pptt_get_cpumask_from_cache_id() - Get the cpus associated with the
> + *					   specified cache
> + * @cache_id: The id field of the cache
> + * @cpus: Where to build the cpumask
> + *
> + * Determine which CPUs are below this cache in the PPTT. This allows the property
> + * to be found even if the CPUs are offline.
> + *
> + * The PPTT table must be rev 3 or later,
> + *
> + * Return: -ENOENT if the PPTT doesn't exist, or the cache cannot be found.
> + * Otherwise returns 0 and sets the cpus in the provided cpumask.
> + */
> +int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
> +{
> +	int cpu;
> +	struct acpi_table_header *table;
> +
> +	cpumask_clear(cpus);
> +
> +	table = acpi_get_pptt();
> +	if (!table)
> +		return -ENOENT;
> +
> +	if (table->revision < 3)
> +		return -ENOENT;
> +
> +	for_each_possible_cpu(cpu) {
> +		bool empty;
> +		int level = 1;
> +		u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +		struct acpi_pptt_cache *cache;
> +		struct acpi_pptt_processor *cpu_node;
> +
> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> +		if (!cpu_node)
> +			continue;
> +
> +		do {
> +			int cache_type[] = {CACHE_TYPE_INST, CACHE_TYPE_DATA, CACHE_TYPE_UNIFIED};
> +
> +			empty = true;
> +			for (int i = 0; i < ARRAY_SIZE(cache_type); i++) {
> +				struct acpi_pptt_cache_v1_full *cache_v1;
> +
> +				cache = acpi_find_cache_node(table, acpi_cpu_id, cache_type[i],
> +							     level, &cpu_node);
> +
> +				if (!cache)
> +					continue;
> +
> +				empty = false;
> +
> +				cache_v1 = upgrade_pptt_cache(cache);
> +				if (cache_v1 && cache_v1->cache_id == cache_id)
> +					cpumask_set_cpu(cpu, cpus);
> +			}
> +			level++;
> +		} while (!empty);
> +	}
> +
> +	return 0;
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index be074bdfd4d1..a9dbacabdf89 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1543,6 +1543,7 @@ int find_acpi_cpu_topology_package(unsigned int cpu);
>   int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
>   void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
>   int find_acpi_cache_level_from_id(u32 cache_id);
> +int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus);
>   #else
>   static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>   {
> @@ -1570,6 +1571,11 @@ static inline int find_acpi_cache_level_from_id(u32 cache_id)
>   {
>   	return -ENOENT;
>   }
> +static inline int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id,
> +						      cpumask_t *cpus)
> +{
> +	return -ENOENT;
> +}
>   #endif
>   
>   void acpi_arch_init(void);


