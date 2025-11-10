Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D81CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCTJ/MUyf9thTiwiQnFR7hOShTiroCgAJgepchy/B6o=; b=0JzJGUo1ZWF0Um+rA3NiYAWDa4
	5gx5kUKG/YBQ/iLRLIMxPkj867o6Oa2xRiUDSavDv4Xr2icyGuXbe0nVxmR2iBoZYUtwrcBxfBOwM
	BeHFkBjLGlmtXYr2deDpwriNO515sTk6LIy0MsUSGaDsUlq1TQJ2n7Ns2SpNq8DgALCN6W/pkoJzM
	2/RLlXvgC9013/Suujbr4eqidLxzoEDsnstjYdgAHztT4/ra0X6jY8KGdkplxyxn+pMb+uzyR9cA8
	hSQN0Pf8v1VWmb4cii3M8WYScakf1B0RyKPOGNgbezX/cYOt9xGXgYt0HL65EhaUG69xYAB5ZYZ9f
	hhLyEe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUNw-00000005lFo-1ppA;
	Mon, 10 Nov 2025 16:04:52 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUNr-00000005lFH-0I1x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:04:51 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d4vcG0Y1hzJ46C2;
	Tue, 11 Nov 2025 00:04:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 8353D140446;
	Tue, 11 Nov 2025 00:04:43 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 10 Nov
 2025 16:04:41 +0000
Date: Mon, 10 Nov 2025 16:04:40 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <james.morse@arm.com>, <amitsinght@marvell.com>,
	<baisheng.gao@unisoc.com>, <baolin.wang@linux.alibaba.com>,
	<bobo.shaobowang@huawei.com>, <carl@os.amperecomputing.com>,
	<catalin.marinas@arm.com>, <dakr@kernel.org>, <dave.martin@arm.com>,
	<david@redhat.com>, <dfustini@baylibre.com>, <fenghuay@nvidia.com>,
	<gregkh@linuxfoundation.org>, <gshan@redhat.com>, <guohanjun@huawei.com>,
	<jeremy.linton@arm.com>, <kobak@nvidia.com>, <lcherian@marvell.com>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lpieralisi@kernel.org>, <peternewman@google.com>, <quic_jiles@quicinc.com>,
	<rafael@kernel.org>, <robh@kernel.org>, <rohit.mathew@arm.com>,
	<scott@os.amperecomputing.com>, <sdonthineni@nvidia.com>,
	<sudeep.holla@arm.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<xhao@linux.alibaba.com>
Subject: Re: [PATCH 05/33] ACPI / PPTT: Add a helper to fill a cpumask from
 a cache_id
Message-ID: <20251110160440.000054c6@huawei.com>
In-Reply-To: <20251107123450.664001-6-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
	<20251107123450.664001-6-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_080447_395867_D809B75F 
X-CRM114-Status: GOOD (  26.80  )
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

On Fri, 7 Nov 2025 12:34:22 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> MPAM identifies CPUs by the cache_id in the PPTT cache structure.
> 
> The driver needs to know which CPUs are associated with the cache.
> The CPUs may not all be online, so cacheinfo does not have the
> information.
> 
> Add a helper to pull this information out of the PPTT.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Very similar comments to on previous.

> ---
> Changes since v3:
> Equivalent changes to the previous patch:
>  Tags dropped due to rework
>  Fallout/simplification from adding acpi_pptt_cache_v1_full
>  Look for each cache type before incrementing level
> ---
>  drivers/acpi/pptt.c  | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h |  6 +++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 71841c106020..7b4cb17c12c0 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -981,3 +981,65 @@ int find_acpi_cache_level_from_id(u32 cache_id)
>  
>  	return -ENOENT;
>  }
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
> +		bool not_empty = true;

Basically same comments.  This dance of setting it not_empty to
get into the loop is a bit nasty as it means that variable is
briefly has an alternative meaning the name doesn't convey.

A do/while() doesn't have that problem as we always do one iteration.


> +		u32 acpi_cpu_id;
> +		struct acpi_pptt_cache_v1_full *cache;
> +		struct acpi_pptt_processor *cpu_node;
> +
> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> +		if (!cpu_node)
> +			continue;
> +
> +		for (int level = 1; not_empty; level++) {
> +			int cache_type[] = {CACHE_TYPE_INST, CACHE_TYPE_DATA, CACHE_TYPE_UNIFIED};
> +
> +			not_empty = false;
> +			for (int i = 0; i < ARRAY_SIZE(cache_type); i++) {
> +				cache = acpi_find_cache_node(table, acpi_cpu_id, cache_type[i],
> +							     level, &cpu_node);
> +
> +				if (!cache)
> +					continue;
> +
> +				not_empty = true;
> +
> +				if (acpi_pptt_cache_id_is_valid(cache) &&
> +				    cache->extra.cache_id == cache_id)
> +					cpumask_set_cpu(cpu, cpus);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}



