Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7692CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnVUiSS683V0TYoIS7/N9EvcUMjg74t7wLDaJj3T1qM=; b=mPAgkxAhe7VBQluHy3MeHcs6BH
	n1xHo/KoykloZqQi03baGL2t8gzBBE42d+UfGP8nB2Y66ekLVjW3asjAM6K9PMqEys+tEurZuBE43
	qpqw4hKn4HfC3er+r0zBowtEIuHnnM8g5/HLy5Iaqf/8coqPCZz0uFgSnWlMud3A4DZIlJoKOI4hv
	A8rLnphKMECX+H6Wfobhi7CoZGqLZ2DCuURqQTxdwnW73Tl36iv38eHP7XCFq30DIgm2yc+QRk2nr
	VVhQgLM4kLoOl7fWOKVPGMzL1hbSuvEDl6Z/Hbl8RdtcZcG3nLlDPiq9QOUpt8d/Jhz3RQqTYHXtd
	Jvb+GFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjCo-00000003sce-2zU8;
	Thu, 11 Sep 2025 15:27:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjCm-00000003saz-41Fk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 617A2601B3;
	Thu, 11 Sep 2025 15:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636D8C4CEF0;
	Thu, 11 Sep 2025 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757604444;
	bh=D3N+Ef/rke9QWrb1MoCvscwdGllgA6s5GKc7E8KKB3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YE3RHdmVcPlTSLUiknlySzD6Op20ejQ4WJXsNd7CO6lEOWWSZq+rQIVhSKo4S9ctX
	 IdHrlgIrjs6zJlPOObObXjCT2hdgZL5PuPFBJwq8IomHnY+1XprlZ/tbeA0BAOmstP
	 4TRXIHwPZjauYgX/VuZNH/RXVy24xZYOIRwYhAW6QQfratDCqH8/PONWHBTQCmh7kE
	 u1OB1VCksyinkaJMOx79rIw6pInh5+aEpOuRupxDxZWRfIUC6KIRVPzQfvSCdiNTCo
	 yBJlKfbWGFPdvWeMCO00pjcri9bBWzXGZWAdR8VNHXhkE7pMt9jfyJp4K1mF5Gig9k
	 f7GSK6pQfvL2Q==
Date: Thu, 11 Sep 2025 17:27:12 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 03/29] ACPI / PPTT: Find cache level by cache-id
Message-ID: <aMLqUCRHebgh8HqQ@lpieralisi>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-4-james.morse@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910204309.20751-4-james.morse@arm.com>
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

On Wed, Sep 10, 2025 at 08:42:43PM +0000, James Morse wrote:
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
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>  * Droppeed the cleanup based table freeing, use acpi_get_pptt() instead.
>  * Removed a confusing comment.
>  * Clarified the kernel doc.
> 
> Changes since RFC:
>  * acpi_count_levels() now returns a value.
>  * Converted the table-get stuff to use Jonathan's cleanup helper.
>  * Dropped Sudeep's Review tag due to the cleanup change.
> ---
>  drivers/acpi/pptt.c  | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h |  5 ++++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 7af7d62597df..c5f2a51d280b 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -904,3 +904,65 @@ void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
>  				     entry->length);
>  	}
>  }
> +
> +/*
> + * find_acpi_cache_level_from_id() - Get the level of the specified cache
> + * @cache_id: The id field of the unified cache
> + *
> + * Determine the level relative to any CPU for the unified cache identified by
> + * cache_id. This allows the property to be found even if the CPUs are offline.
> + *
> + * The returned level can be used to group unified caches that are peers.
> + *
> + * The PPTT table must be rev 3 or later,

* The PPTT table must be rev 3 or later.

> + *
> + * If one CPUs L2 is shared with another as L3, this function will return
> + * an unpredictable value.
> + *
> + * Return: -ENOENT if the PPTT doesn't exist, the revision isn't supported or
> + * the cache cannot be found.
> + * Otherwise returns a value which represents the level of the specified cache.
> + */
> +int find_acpi_cache_level_from_id(u32 cache_id)
> +{
> +	u32 acpi_cpu_id;
> +	int level, cpu, num_levels;
> +	struct acpi_pptt_cache *cache;
> +	struct acpi_table_header *table;
> +	struct acpi_pptt_cache_v1 *cache_v1;
> +	struct acpi_pptt_processor *cpu_node;
> +
> +	table = acpi_get_pptt();
> +	if (!table)
> +		return -ENOENT;
> +
> +	if (table->revision < 3)
> +		return -ENOENT;
> +
> +	for_each_possible_cpu(cpu) {
> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> +		if (!cpu_node)
> +			return -ENOENT;

Same comment as in another patch - don't think you want to stop parsing
here.

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
> index f97a9ff678cc..5bdca5546697 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1542,6 +1542,7 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu);
>  int find_acpi_cpu_topology_package(unsigned int cpu);
>  int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
>  void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
> +int find_acpi_cache_level_from_id(u32 cache_id);
>  #else
>  static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>  {
> @@ -1565,6 +1566,10 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>  }
>  static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
>  						     cpumask_t *cpus) { }
> +static inline int find_acpi_cache_level_from_id(u32 cache_id)
> +{
> +	return -EINVAL;

return -ENOENT;

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> +}
>  #endif
>  
>  void acpi_arch_init(void);
> -- 
> 2.39.5
> 

