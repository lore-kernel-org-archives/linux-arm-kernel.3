Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4832EC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GccqudB1/E9qC51WaJMVSVqpCGL0HQr+vfxWd3PN5pk=; b=4Xdw57smCOpQSRLrbugHnNgIgE
	m1gQRs6o2OlygRPwhfZYa2eH2d89E7IQuRId/IW150inucjXyzAScHb4LLo4zOT6qHZ02eDCC/zvg
	UoCihJvz9EKeQHQM4oaCKCx+DcsHbOtXg8bR+U07dPfVwK+e88pTFAgc7eEU8voD8hpH70DRU8uZk
	Z+Qv/sFBk+pW8LFz4Q8JtKNF9HL5xWAEtBWUba43AzsTaASk1wgu/Fn4E2La7pRpDu/6amv700QXU
	+NCoByqUnf7SL2LgcPRuKRWjb2A7vk/uhWzBvT4kzm+9wnBMMf6CzxlLS3RGkD5jHNnoj6Xxj89Pt
	JU/hKcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4vj-00000008B9X-0oYL;
	Wed, 16 Jul 2025 16:24:27 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4tF-00000008AwG-2h05
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 16:21:55 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bj1W32DCTz6M4P9;
	Thu, 17 Jul 2025 00:20:31 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id EE67814038F;
	Thu, 17 Jul 2025 00:21:46 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 16 Jul
 2025 18:21:45 +0200
Date: Wed, 16 Jul 2025 17:21:44 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Rob Herring" <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>, Rohit
 Mathew <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	"Zeng Heng" <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
	"Carl Worth" <carl@os.amperecomputing.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, Xin Hao
	<xhao@linux.alibaba.com>, <peternewman@google.com>, <dfustini@baylibre.com>,
	<amitsinght@marvell.com>, David Hildenbrand <david@redhat.com>, Rex Nie
	<rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH 07/36] ACPI / PPTT: Find cache level by cache-idUIRE
Message-ID: <20250716172144.00000715@huawei.com>
In-Reply-To: <20250711183648.30766-8-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-8-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_092153_973227_AC073610 
X-CRM114-Status: GOOD (  34.31  )
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

On Fri, 11 Jul 2025 18:36:19 +0000
James Morse <james.morse@arm.com> wrote:

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
> acpi_count_levels() expects its levels parameter to be initialised to
> zero as it passes it to acpi_find_cache_level() as starting_level.
> The existing callers do this. Document it.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

A few suggestions inline.  Mostly driven by the number of missing table
puts I've seen in ACPI code. You don't have any missing here but with a
bit of restructuring you can make that easy to see.

> ---
>  drivers/acpi/pptt.c  | 73 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h |  5 +++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 13ca2eee3b98..f53748a5df19 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -912,3 +912,76 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
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
> +	acpi_status status;
> +	int level, cpu, num_levels;
> +	struct acpi_pptt_cache *cache;
> +	struct acpi_table_header *table;
> +	struct acpi_pptt_cache_v1 *cache_v1;
> +	struct acpi_pptt_processor *cpu_node;
> +
> +	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
> +	if (ACPI_FAILURE(status)) {
> +		acpi_pptt_warn_missing();
> +		return -ENOENT;
> +	}
> +
> +	if (table->revision < 3) {

Maybe a unified exit path given all paths need to do
acpi_put_table() and return either error or level.

Or maybe it's time for some cleanup.h magic for acpi tables. I've
been thinking about it for a while and mostly stuck on the name ;)
(simpler suggestion follows)

static struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
{
	struct acpi_table_header *table;
	int status = acpi_get_table(signature, instance, &table);
	
	if (ACPI_FAILURE(status))
		return ERR_PTR(-ENOENT);
	return table;
}

DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) acpi_put_table(_T))

Finally in here and loads of other places we avoid chance of missing an acpi_put_table
and generally simplify the code a little.

int find_acpi_cache_level_from_id(u32 cache_id)
{
	u32 acpi_cpu_id;
	acpi_status status;
	int level, cpu, num_levels;
	struct acpi_pptt_cache *cache;
	struct acpi_pptt_cache_v1 *cache_v1;
	struct acpi_pptt_processor *cpu_node;


	struct acpi_table_header *table __free(acpi_table) =
		acpi_get_table_ret(ACPI_SIG_PPTT, 0);

	if (IS_ERR(table)
		return PTR_ERR(table);

	if (table->revision < 3)
		return -ENOENT;

	/*
	 * If we found the cache first, we'd still need to walk from each CPU
	 * to find the level...
	 */
	for_each_possible_cpu(cpu) {
		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
		if (!cpu_node)
			return -ENOENT;
		acpi_count_levels(table, cpu_node, &num_levels, NULL);

		/* Start at 1 for L1 */
		for (level = 1; level <= num_levels; level++) {
			cache = acpi_find_cache_node(table, acpi_cpu_id,
						     ACPI_PPTT_CACHE_TYPE_UNIFIED,
						     level, &cpu_node);
			if (!cache)
				continue;

			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
						cache,
						sizeof(struct acpi_pptt_cache));

			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
			    cache_v1->cache_id == cache_id) {
				acpi_put_table(table);
				return level;
			}
		}
	}
	return -ENOENT;
}


A less 'fun' alternative is pull some code out as a helper to make put the get and put
near each other with no conditionals to confuse things.


static int __find_acpi_cache_level_from_id(u32 cache_id, struct acpi_table_header *head);
{
	u32 acpi_cpu_id;
	int level, cpu, num_levels;
	struct acpi_pptt_cache *cache;
	struct acpi_pptt_cache_v1 *cache_v1;
	struct acpi_pptt_processor *cpu_node;

	if (table->revision < 3)
		return -ENOENT;

	/*
	 * If we found the cache first, we'd still need to walk from each CPU
	 * to find the level...
	 */
	for_each_possible_cpu(cpu) {
		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
		if (!cpu_node)
			return -ENOENT;
		acpi_count_levels(table, cpu_node, &num_levels, NULL);

		/* Start at 1 for L1 */
		for (level = 1; level <= num_levels; level++) {
			cache = acpi_find_cache_node(table, acpi_cpu_id,
						     ACPI_PPTT_CACHE_TYPE_UNIFIED,
						     level, &cpu_node);
			if (!cache)
				continue;

			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
						cache,
						sizeof(struct acpi_pptt_cache));

			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
			    cache_v1->cache_id == cache_id)
				return level;
		}
	}

	return -ENOENT;
}

int find_acpi_cache_level_from_id(u32 cache_id)
{
	int ret;
	acpi_status status;
	struct acpi_table_header *table;

	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
	if (ACPI_FAILURE(status)) {
		acpi_pptt_warn_missing();
		return -ENOENT;
	}

	ret = __find_acpi_cache_level_from_id(cache_id, table)
	acpi_put_table(table);
	return ret;
}


> +		acpi_put_table(table);
> +		return -ENOENT;
> +	}
> +
> +	/*
> +	 * If we found the cache first, we'd still need to walk from each CPU
> +	 * to find the level...
> +	 */
> +	for_each_possible_cpu(cpu) {
> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> +		if (!cpu_node)
> +			break;
> +		acpi_count_levels(table, cpu_node, &num_levels, NULL);
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
> +			    cache_v1->cache_id == cache_id) {
> +				acpi_put_table(table);
> +				return level;
> +			}
> +		}
> +	}
> +
> +	acpi_put_table(table);
> +	return -ENOENT;
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 8c3165c2b083..82947f6d2a43 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1542,6 +1542,7 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu);
>  int find_acpi_cpu_topology_package(unsigned int cpu);
>  int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
>  int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
> +int find_acpi_cache_level_from_id(u32 cache_id);
>  #else
>  static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>  {
> @@ -1568,6 +1569,10 @@ static inline int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
>  {
>  	return -EINVAL;
>  }
> +static inline int find_acpi_cache_level_from_id(u32 cache_id)
> +{
> +	return -EINVAL;
> +}
>  #endif
>  
>  void acpi_arch_init(void);


