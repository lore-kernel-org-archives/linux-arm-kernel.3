Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCCDCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnLyQEUED5UCvzMxk3wlAW7yiedOOB3cXVH8tPOytjY=; b=XkAPAG+OJKrTnlbTxXRXmG4xg4
	3HPPhSktoTGHnMh0xIfmzLmPAMaZo6bRcSqz156RXMssP3AerlAoAD1bUVIYT20e+dpiROitx1MA+
	ORcZLW03Q3ACUfZGr1WSqpJgg7U9GOIsrNFohE7U8dzCWjq3XsWJRD4DMTLXfmqI9xP/1EbJghE93
	a9nIRMFtAlquLYzoZtXzVcacVDaVFBcr6H7qcYz2UNBwckRqIvH2aGkEVjJj6m4KTYDWnL2d8bI1J
	n6P3dhE59ihFLHqjRgJHCDavbpJU9wsooQpNrKCmOHZvjcMOsZxJfdNqMnW9I9hLwq4o7uN25hekP
	nWBa9NJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzr-0000000FA51-2ewb;
	Wed, 27 Aug 2025 11:07:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCPa-0000000EqCt-3pKt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 09:25:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B470015A1;
	Wed, 27 Aug 2025 02:25:37 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC66C3F738;
	Wed, 27 Aug 2025 02:25:40 -0700 (PDT)
Message-ID: <9ce36190-6d99-4a41-a803-a65be677db2d@arm.com>
Date: Wed, 27 Aug 2025 10:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] ACPI / PPTT: Find cache level by cache-id
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
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
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250822153048.2287-6-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_022547_035658_3F1930C9 
X-CRM114-Status: GOOD (  32.21  )
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

Hi James,

On 8/22/25 16:29, James Morse wrote:
> The MPAM table identifies caches by id. The MPAM driver also wants to know
> the cache level to determine if the platform is of the shape that can be
> managed via resctrl. Cacheinfo has this information, but only for CPUs that
> are online.
> 
> Waiting for all CPUs to come online is a problem for platforms where
> CPUs are brought online late by user-space.
> 
> Add a helper that walks every possible cache, until it finds the one
> identified by cache-id, then return the level.
> Add a cleanup based free-ing mechanism for acpi_get_table().
> 
> CC: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since RFC:
>  * acpi_count_levels() now returns a value.
>  * Converted the table-get stuff to use Jonathan's cleanup helper.
>  * Dropped Sudeep's Review tag due to the cleanup change.
> ---
>  drivers/acpi/pptt.c  | 64 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h | 17 ++++++++++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 8f9b9508acba..660457644a5b 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -907,3 +907,67 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>  	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
>  					  ACPI_PPTT_ACPI_IDENTICAL);
>  }
> +
> +/**
> + * find_acpi_cache_level_from_id() - Get the level of the specified cache
> + * @cache_id: The id field of the unified cache
> + *
> + * Determine the level relative to any CPU for the unified cache identified by
> + * cache_id. This allows the property to be found even if the CPUs are offline.
> + *
> + * The returned level can be used to group unified caches that are peers.
> + *
> + * The PPTT table must be rev 3 or later,
> + *
> + * If one CPUs L2 is shared with another as L3, this function will return
> + * an unpredictable value.
> + *
> + * Return: -ENOENT if the PPTT doesn't exist, or the cache cannot be found.
> + * Otherwise returns a value which represents the level of the specified cache.
> + */
> +int find_acpi_cache_level_from_id(u32 cache_id)
> +{
> +	u32 acpi_cpu_id;
> +	int level, cpu, num_levels;
> +	struct acpi_pptt_cache *cache;
> +	struct acpi_pptt_cache_v1 *cache_v1;
> +	struct acpi_pptt_processor *cpu_node;
> +	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_PPTT, 0);
> +
> +	if (IS_ERR(table))
> +		return PTR_ERR(table);
> +
> +	if (table->revision < 3)
> +		return -ENOENT;
> +
> +	/*
> +	 * If we found the cache first, we'd still need to walk from each CPU
> +	 * to find the level...
> +	 */
> +	for_each_possible_cpu(cpu) {
> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> +		if (!cpu_node)
> +			return -ENOENT;
> +		num_levels = acpi_count_levels(table, cpu_node, NULL);
> +
> +		/* Start at 1 for L1 */
> +		for (level = 1; level <= num_levels; level++) {
> +			cache = acpi_find_cache_node(table, acpi_cpu_id,
> +						     ACPI_PPTT_CACHE_TYPE_UNIFIED,
> +						     level, &cpu_node);
> +			if (!cache)
> +				continue;
> +
> +			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> +						cache,
> +						sizeof(struct acpi_pptt_cache));
> +
> +			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
> +			    cache_v1->cache_id == cache_id)
> +				return level;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index f97a9ff678cc..30c10b1dcdb2 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -8,6 +8,7 @@
>  #ifndef _LINUX_ACPI_H
>  #define _LINUX_ACPI_H
>  
> +#include <linux/cleanup.h>
>  #include <linux/errno.h>
>  #include <linux/ioport.h>	/* for struct resource */
>  #include <linux/resource_ext.h>
> @@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
>  void acpi_table_init_complete (void);
>  int acpi_table_init (void);
>  
> +static inline struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
> +{
> +	struct acpi_table_header *table;
> +	int status = acpi_get_table(signature, instance, &table);
> +
> +	if (ACPI_FAILURE(status))
> +		return ERR_PTR(-ENOENT);
> +	return table;
> +}
> +DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) acpi_put_table(_T))
nit: Is it useful to change the condition from !IS_ERR(_T) to
!IS_ERR_OR_NULL(_T)? This seems to be the common pattern. I do note that
acpi_put_table() can take NULL, so there is no real danger.
> +
>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
>  int __init_or_acpilib acpi_table_parse_entries(char *id,
>  		unsigned long table_size, int entry_id,
> @@ -1542,6 +1554,7 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu);
>  int find_acpi_cpu_topology_package(unsigned int cpu);
>  int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
>  void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
> +int find_acpi_cache_level_from_id(u32 cache_id);
>  #else
>  static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>  {
> @@ -1565,6 +1578,10 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>  }
>  static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
>  						     cpumask_t *cpus) { }
> +static inline int find_acpi_cache_level_from_id(u32 cache_id)
> +{
> +	return -EINVAL;
> +}
>  #endif
>  
>  void acpi_arch_init(void);


Thanks,

Ben


