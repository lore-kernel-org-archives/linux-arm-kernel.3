Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0663CF3953
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jm4ibpBhbTCfqTkhGJ9+3IqNyDh7NcJlFBmjFtXPZ9Q=; b=pynYDM51VHub2TuxywVmfEoBF9
	T4iOLIU+NSH5ta2gUFFvcTzo/8iL3si/POX6gOgpOCN02v3WFxt+C/mfsZrToMls6AgW/y0+XSYsT
	w8Ln3chFhqaR6bhZ9+Ycd5nEu+FSCj68T+tFREERcf5YyXi7sA1G0TmppMj5sP2j4z6PeEt05pIo1
	BzDr3bPLzOkmDLSRPbaAt22kFHR7NZAFvZxMrDx5R1sFJ8ND3ph75I4tyPWMYD0T+JeKeLp2AeE8Q
	L2UH5lR3YQUYF4YWXmXpf8N7slkw9DdFMqypIRFu/qOQE/EKOVFnv4Gtr/qq4p6sNB/jPGC4Ft/MF
	wDaTk7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkxI-00000003goV-3u1S;
	Wed, 19 Nov 2025 16:22:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkxG-00000003gnA-19MT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:22:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7802FEC;
	Wed, 19 Nov 2025 08:22:39 -0800 (PST)
Received: from [172.27.42.169] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A05953F740;
	Wed, 19 Nov 2025 08:22:43 -0800 (PST)
Message-ID: <dce7b961-fa81-4561-a1af-00ac83f62b24@arm.com>
Date: Wed, 19 Nov 2025 10:22:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/34] ACPI / PPTT: Add a helper to fill a cpumask from
 a processor container
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng Heng <zengheng4@huawei.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-2-ben.horgan@arm.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20251117170014.4113754-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_082250_409585_6FDF3E92 
X-CRM114-Status: GOOD (  26.03  )
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
> The ACPI MPAM table uses the UID of a processor container specified in
> the PPTT to indicate the subset of CPUs and cache topology that can
> access each MPAM System Component (MSC).
> 
> This information is not directly useful to the kernel. The equivalent
> cpumask is needed instead.
> 
> Add a helper to find the processor container by its id, then walk
> the possible CPUs to fill a cpumask with the CPUs that have this
> processor container as a parent.

Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>>
> CC: Dave Martin <dave.martin@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v4:
> Remove blank line
> 
> Changes since v3:
> Refer to processor hierarchy in comments (Jonathan)
> Fix indent (Jonathan)
> ---
>   drivers/acpi/pptt.c  | 84 ++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/acpi.h |  3 ++
>   2 files changed, 87 insertions(+)
> 
> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
> index 54676e3d82dd..b8248c0092fe 100644
> --- a/drivers/acpi/pptt.c
> +++ b/drivers/acpi/pptt.c
> @@ -817,3 +817,87 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>   	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
>   					  ACPI_PPTT_ACPI_IDENTICAL);
>   }
> +
> +/**
> + * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT
> + * processor hierarchy node
> + *
> + * @table_hdr:		A reference to the PPTT table
> + * @parent_node:	A pointer to the processor hierarchy node in the
> + *			table_hdr
> + * @cpus:		A cpumask to fill with the CPUs below @parent_node
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
> + *                                       processor container
> + * @acpi_cpu_id:	The UID of the processor container
> + * @cpus:		The resulting CPU mask
> + *
> + * Find the specified Processor Container, and fill @cpus with all the cpus
> + * below it.
> + *
> + * Not all 'Processor Hierarchy' entries in the PPTT are either a CPU
> + * or a Processor Container, they may exist purely to describe a
> + * Private resource. CPUs have to be leaves, so a Processor Container
> + * is a non-leaf that has the 'ACPI Processor ID valid' flag set.
> + */
> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
> +{
> +	struct acpi_table_header *table_hdr;
> +	struct acpi_subtable_header *entry;
> +	unsigned long table_end;
> +	u32 proc_sz;
> +
> +	cpumask_clear(cpus);
> +
> +	table_hdr = acpi_get_pptt();
> +	if (!table_hdr)
> +		return;
> +
> +	table_end = (unsigned long)table_hdr + table_hdr->length;
> +	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
> +			     sizeof(struct acpi_table_pptt));
> +	proc_sz = sizeof(struct acpi_pptt_processor);
> +	while ((unsigned long)entry + proc_sz <= table_end) {
> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR) {
> +			struct acpi_pptt_processor *cpu_node;
> +
> +			cpu_node = (struct acpi_pptt_processor *)entry;
> +			if (cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID &&
> +			    !acpi_pptt_leaf_node(table_hdr, cpu_node) &&
> +			    cpu_node->acpi_processor_id == acpi_cpu_id) {
> +				acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> +				break;
> +			}
> +		}
> +		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
> +				     entry->length);
> +	}
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 5ff5d99f6ead..4752ebd48132 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1541,6 +1541,7 @@ int find_acpi_cpu_topology(unsigned int cpu, int level);
>   int find_acpi_cpu_topology_cluster(unsigned int cpu);
>   int find_acpi_cpu_topology_package(unsigned int cpu);
>   int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
>   #else
>   static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>   {
> @@ -1562,6 +1563,8 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>   {
>   	return -EINVAL;
>   }
> +static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
> +						     cpumask_t *cpus) { }
>   #endif
>   
>   void acpi_arch_init(void);


