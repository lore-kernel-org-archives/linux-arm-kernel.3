Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ADDCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCJM5hd7cuuTGXXLC9GDsuZ+RcImyun4DsTTOfWwEBI=; b=T5ambPanXnaaxfFqq6xRQ4+xUl
	Tj7nzz1NeRWLrN57ZyBtAql8YLmBNx8I58t8uSQgiDcwr/X3Jrq+tmUBNQqqGvmsRr0xk6lfVFCXa
	WVTogdXe1Fcs/EKMy0BaoYGAnU3la3MkDG1Y92NC7/KNebT/3YZ6H2gqtKG8qWtbURTqVAk1Uk3P5
	uYagB/s3nL7/xo8EdgNtzjvrr1sFwOOxu4VCNsd8HFxHr5POadnLwTtx9j+h+VQWMkOTbTYbZMHR2
	rJpNVMm1XLWzU7eLDzV6t8nigQarR8nize71Dm+pUQHeXXi3u6isWWlv+wPmHcu+nLPuvtEUBixnS
	YycTnA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnOX-0000000CuzK-3djr;
	Mon, 20 Oct 2025 10:45:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnOW-0000000Cuyk-0QxC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:45:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A8081063;
	Mon, 20 Oct 2025 03:45:31 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B92943F63F;
	Mon, 20 Oct 2025 03:45:34 -0700 (PDT)
Message-ID: <12556653-a26f-4c28-820a-4b5ba1537bc4@arm.com>
Date: Mon, 20 Oct 2025 11:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/29] ACPI / PPTT: Add a helper to fill a cpumask from
 a cache_id
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-5-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251017185645.26604-5-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_034540_233684_42C6CBBB 
X-CRM114-Status: GOOD (  27.79  )
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

On 10/17/25 19:56, James Morse wrote:
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
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
> Changes since v2:
>  * Removed stray cleanup useage in preference for acpi_get_pptt().
>  * Removed WARN_ON_ONCE() for symmetry with other helpers.
>  * Dropped restriction on unified caches.
> 
> Changes since v1:
>  * Added punctuation to the commit message.
>  * Removed a comment about an alternative implementaion.
>  * Made the loop continue with a warning if a CPU is missing from the PPTT.
> 
> Changes since RFC:
>  * acpi_count_levels() now returns a value.
>  * Converted the table-get stuff to use Jonathan's cleanup helper.
>  * Dropped Sudeep's Review tag due to the cleanup change.
> ---
>  drivers/acpi/pptt.c  | 64 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h |  6 +++++
>  2 files changed, 70 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 50c8f2a3c927..2f86f58699a6 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -985,3 +985,67 @@ int find_acpi_cache_level_from_id(u32 cache_id)
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
> +	int level, cpu;
> +	u32 acpi_cpu_id;
> +	struct acpi_pptt_cache *cache;
> +	struct acpi_table_header *table;
> +	struct acpi_pptt_cache_v1 *cache_v1;
> +	struct acpi_pptt_processor *cpu_node;
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
> +		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
> +		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
> +		if (!cpu_node)
> +			continue;
> +
> +		/* Start at 1 for L1 */
> +		level = 1;
> +		cache = acpi_find_any_type_cache_node(table, acpi_cpu_id, level,
> +						      &cpu_node);
> +		while (cache) {
> +			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> +						cache, sizeof(*cache));
> +			if (!cache)
> +				continue;
> +
> +			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
> +						cache, sizeof(*cache));
> +
> +			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
> +			    cache_v1->cache_id == cache_id)
> +				cpumask_set_cpu(cpu, cpus);
> +
> +			level++;

Same comment as for the previous patch. You are bumping the level
without considering if there is another cache at that level.

> +			cache = acpi_find_any_type_cache_node(table, acpi_cpu_id,
> +							      level, &cpu_node);
> +		}
> +	}
> +
> +	return 0;
> +}
Thanks,

Ben


