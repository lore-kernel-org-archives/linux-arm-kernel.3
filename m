Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE3EC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4rQ5hN9MNmYtLIVY68PRY00dzEIbol141hJgv+ftuk=; b=nJKEsz1Ow7o53iRLm74VFvZ3Rp
	TwEyOC0hONCYPeiD4wNVG+5k7bLqzwz/RlSqUCDoGmBpVarkSbY+BHoTYc4pGXH15vqWnFgstljCd
	5bUUXiyX2T4vMyCOOd6/fWgvs5GbJGIfNuuGMGxa2rdW6rS1tzInwVvwg70ZEUG3/iOchWza/knuc
	Q/BgZ496+eSg7Z8FIfrg6nX+MarHS6d324U7XJVBHr7d+WfvJma8IJMruNDJEBQyctZHFlMWmrh03
	0jjdXPfYWtyeKt+hNT+GSP26CplKFxVCXD8diYd7CrwdsRZL0G1mex6Rjm2j7gf1HlhjVmgSBH0au
	clIIoejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4yZ-00000008Bb6-0EuH;
	Wed, 16 Jul 2025 16:27:23 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4w4-00000008BDD-1JjM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 16:24:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bj1Wq2sRbz6L4vM;
	Thu, 17 Jul 2025 00:21:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 736DD1402F6;
	Thu, 17 Jul 2025 00:24:44 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 16 Jul
 2025 18:24:43 +0200
Date: Wed, 16 Jul 2025 17:24:42 +0100
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
Subject: Re: [RFC PATCH 08/36] ACPI / PPTT: Add a helper to fill a cpumask
 from a cache_id
Message-ID: <20250716172442.000001d6@huawei.com>
In-Reply-To: <20250711183648.30766-9-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-9-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_092448_641773_BDD24ABC 
X-CRM114-Status: GOOD (  26.54  )
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

On Fri, 11 Jul 2025 18:36:20 +0000
James Morse <james.morse@arm.com> wrote:

> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
> 
> The driver needs to know which CPUs are associated with the cache,
> the CPUs may not all be online, so cacheinfo does not have the
> information.
> 
> Add a helper to pull this information out of the PPTT.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/acpi/pptt.c  | 70 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h |  6 ++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index f53748a5df19..81f7ac18c023 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -985,3 +985,73 @@ int find_acpi_cache_level_from_id(u32 cache_id)
>  	acpi_put_table(table);
>  	return -ENOENT;
>  }
> +
> +/**
> + * acpi_pptt_get_cpumask_from_cache_id() - Get the cpus associated with the
> + *					   specified cache
> + * @cache_id: The id field of the unified cache
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
> +	u32 acpi_cpu_id;
> +	acpi_status status;
> +	int level, cpu, num_levels;
> +	struct acpi_pptt_cache *cache;
> +	struct acpi_table_header *table;
> +	struct acpi_pptt_cache_v1 *cache_v1;
> +	struct acpi_pptt_processor *cpu_node;
> +
> +	cpumask_clear(cpus);
> +
> +	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);

Similar suggestions to previous patch apply here as well.


> +	if (ACPI_FAILURE(status)) {
> +		acpi_pptt_warn_missing();
> +		return -ENOENT;
> +	}
> +
> +	if (table->revision < 3) {
> +		acpi_put_table(table);
> +		return -ENOENT;
> +	}
> +
> +	/*
> +	 * If we found the cache first, we'd still need to walk from each cpu.
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
> +				cpumask_set_cpu(cpu, cpus);
> +			}

Unnecessary {}  Fine to keep them if you add something else here later.


> +		}
> +	}
> +
> +	acpi_put_table(table);
> +	return 0;
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 82947f6d2a43..61ac3d1de1e8 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1543,6 +1543,7 @@ int find_acpi_cpu_topology_package(unsigned int cpu);
>  int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
>  int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
>  int find_acpi_cache_level_from_id(u32 cache_id);
> +int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus);
>  #else
>  static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>  {
> @@ -1573,6 +1574,11 @@ static inline int find_acpi_cache_level_from_id(u32 cache_id)
>  {
>  	return -EINVAL;
>  }
> +static inline int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id,
> +						      cpumask_t *cpus)
> +{
> +	return -EINVAL;
> +}
>  #endif
>  
>  void acpi_arch_init(void);


