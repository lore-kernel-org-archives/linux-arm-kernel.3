Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C25EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjtQVgyC6aebje4X9xjGXGD8jOjCq+st2YHAXeZLavs=; b=ENZZD3VfK88MVWKs6Qp9Aj1yho
	Kg/IyC9TzMRR/WPH/g8dUp1HI0qBFBKOjAA04H1zwxoXtdIK8MGhar/TPfXQnIvu0J6tTaGqolSVd
	Eo7KeW03nwCYZ9L4YCJ7Yg7mPXLSYtwh7IcA7q1AQE90+SnXJ5RY9COQH9bWyKMHpvpGd0RNtLHFa
	pihWSb3JnvSQEfug74KCv6aVDnbep7E7TyjfAeu/3xY1mj+fBexlvp6srRbNoKDQ5dl0RM7Vq/CCp
	duM9MukNLJqp9WeeXe+Q/5OJyV5F26FG2ZYm2rv1YSUO0ASPTRnemsSSwMcKDT7dpgGkr3riN3EMp
	4YhNYF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueb7k-00000005LHV-1cYx;
	Wed, 23 Jul 2025 15:11:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueagP-00000005EmI-3TZ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 14:43:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6394322C7;
	Wed, 23 Jul 2025 07:42:52 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C6003F6A8;
	Wed, 23 Jul 2025 07:42:54 -0700 (PDT)
Message-ID: <46e3ead8-411d-4e51-b38b-da791e568b94@arm.com>
Date: Wed, 23 Jul 2025 15:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/36] ACPI / PPTT: Add a helper to fill a cpumask
 from a processor container
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
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
 <20250711183648.30766-6-james.morse@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250711183648.30766-6-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_074301_964877_89D11F76 
X-CRM114-Status: GOOD (  28.88  )
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

On 7/11/25 19:36, James Morse wrote:
> The PPTT describes CPUs and caches, as well as processor containers.
> The ACPI table for MPAM describes the set of CPUs that can access an MSC
> with the UID of a processor container.
> 
> Add a helper to find the processor container by its id, then walk
> the possible CPUs to fill a cpumask with the CPUs that have this
> processor container as a parent.
> 
> CC: Dave Martin <dave.martin@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/acpi/pptt.c  | 93 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  6 +++
>   2 files changed, 99 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 54676e3d82dd..13619b1b821b 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -298,6 +298,99 @@ static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_he
>   	return NULL;
>   }
>   
> +/**
> + * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT processor node
> + * @table_hdr:		A reference to the PPTT table.
> + * @parent_node:	A pointer to the processor node in the @table_hdr.
> + * @cpus:		A cpumask to fill with the CPUs below @parent_node.
> + *
> + * Walks up the PPTT from every possible CPU to find if the provided
> + * @parent_node is a parent of this CPU.
> + */
> +static void acpi_pptt_get_child_cpus(struct acpi_table_header *table_hdr,
> +				     struct acpi_pptt_processor *parent_node,
> +				     cpumask_t *cpus)
> +{
> +	struct acpi_pptt_processor *cpu_node;
> +	u32 acpi_id;
> +	int cpu;
> +
> +	cpumask_clear(cpus);
> +
> +	for_each_possible_cpu(cpu) {
> +		acpi_id = get_acpi_id_for_cpu(cpu);
> +		cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
> +
> +		while (cpu_node) {
> +			if (cpu_node == parent_node) {
> +				cpumask_set_cpu(cpu, cpus);
> +				break;
> +			}
> +			cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
> +		}
> +	}
> +}
> +
> +/**
> + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
> + *                                       processor containers
> + * @acpi_cpu_id:	The UID of the processor container.
> + * @cpus		The resulting CPU mask.
> + *
> + * Find the specified Processor Container, and fill @cpus with all the cpus
> + * below it.
> + *
> + * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
> + * Container, they may exist purely to describe a Private resource. CPUs
> + * have to be leaves, so a Processor Container is a non-leaf that has the
> + * 'ACPI Processor ID valid' flag set.
> + *
> + * Return: 0 for a complete walk, or an error if the mask is incomplete.
> + */
> +int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
> +{
> +	struct acpi_pptt_processor *cpu_node;
> +	struct acpi_table_header *table_hdr;
> +	struct acpi_subtable_header *entry;
> +	bool leaf_flag, has_leaf_flag = false;
> +	unsigned long table_end;
> +	acpi_status status;
> +	u32 proc_sz;
> +	int ret = 0;
> +
> +	cpumask_clear(cpus);
> +
> +	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
> +	if (ACPI_FAILURE(status))
> +		return 0;
> +
> +	if (table_hdr->revision > 1)
> +		has_leaf_flag = true;
> +
> +	table_end = (unsigned long)table_hdr + table_hdr->length;
> +	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
> +			     sizeof(struct acpi_table_pptt));
> +	proc_sz = sizeof(struct acpi_pptt_processor);
> +	while ((unsigned long)entry + proc_sz <= table_end) {
> +		cpu_node = (struct acpi_pptt_processor *)entry;
> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
> +		    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
> +			leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
> +			if ((has_leaf_flag && !leaf_flag) ||
> +			    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node))) {
> +				if (cpu_node->acpi_processor_id == acpi_cpu_id)
> +					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> +			}
acpi_pptt_leaf_node() returns early based on the leaf flag so you can 
just rely on that here; remove has_leaf_flag and the corresponding extra 
logic.
> +		}
> +		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
> +				     entry->length);
> +	}
> +
> +	acpi_put_table(table_hdr);
> +
> +	return ret;
> +}
> +
>   static u8 acpi_cache_type(enum cache_type type)
>   {
>   	switch (type) {
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index f102c0fe3431..8c3165c2b083 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1541,6 +1541,7 @@ int find_acpi_cpu_topology(unsigned int cpu, int level);
>   int find_acpi_cpu_topology_cluster(unsigned int cpu);
>   int find_acpi_cpu_topology_package(unsigned int cpu);
>   int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
> +int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
>   #else
>   static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>   {
> @@ -1562,6 +1563,11 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>   {
>   	return -EINVAL;
>   }
> +static inline int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
> +						    cpumask_t *cpus)
> +{
> +	return -EINVAL;
> +}
>   #endif
>   
>   void acpi_arch_init(void);


Thanks,

Ben


