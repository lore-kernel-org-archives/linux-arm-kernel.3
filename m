Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92975CF3188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQS2sp0fRfTQw4poTmyaR57P0BUIOJZcl4gCJY+80aY=; b=WUtCxEJPP+gF15HlaHlgiz0duA
	hhDFr/F7wSylZtlmFLGk3/hMXSYFSiwHEjY1tEuNX6405V9XldyC+QWhSKcpO8Y2xgmd36aWUKiyg
	Z5j1MkuqtHoDZihBWi9Uoko9ZLE3NUt6TOM7oW+IRgChbvYF3AGCUSGw2rjQOjSKdCLZbJ6YvSvly
	7GDB1w/KYyRA0TheRQpfiU7u8xkxSzLFAEwgFpPbxQ35nzv+0h35AjJv9lpEDIpOuIRh89exIxIoD
	B12gZjpp86/LxxIR4eLuMk8Ygwb9yKze4tq348szZnYp7rqqJ9bQ3F8uUFSaZ856G5DOeFU3H3XYr
	c1Gdkydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLezY-00000002uiI-1q5l;
	Wed, 19 Nov 2025 10:00:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLezU-00000002uht-3fFq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:00:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76950FEC;
	Wed, 19 Nov 2025 02:00:33 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 336103F740;
	Wed, 19 Nov 2025 02:00:36 -0800 (PST)
Message-ID: <6eaf7e9c-a833-44c8-a213-7247a47d417d@arm.com>
Date: Wed, 19 Nov 2025 10:00:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/34] ACPI / PPTT: Add a helper to fill a cpumask from
 a processor container
To: Gavin Shan <gshan@redhat.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng Heng <zengheng4@huawei.com>
References: <20251117170014.4113754-1-ben.horgan@arm.com>
 <20251117170014.4113754-2-ben.horgan@arm.com>
 <455c577a-2c6b-4d57-9547-8f55bfe1c126@redhat.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <455c577a-2c6b-4d57-9547-8f55bfe1c126@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_020045_009456_26CD82E2 
X-CRM114-Status: GOOD (  25.11  )
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

Hi Gavin,

On 11/19/25 03:35, Gavin Shan wrote:
> Hi Ben,
> 
> On 11/18/25 2:59 AM, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> The ACPI MPAM table uses the UID of a processor container specified in
>> the PPTT to indicate the subset of CPUs and cache topology that can
>> access each MPAM System Component (MSC).
>>
>> This information is not directly useful to the kernel. The equivalent
>> cpumask is needed instead.
>>
>> Add a helper to find the processor container by its id, then walk
>> the possible CPUs to fill a cpumask with the CPUs that have this
>> processor container as a parent.
>>
>> CC: Dave Martin <dave.martin@arm.com>
>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Tested-by: Carl Worth <carl@os.amperecomputing.com>
>> Tested-by: Gavin Shan <gshan@redhat.com>
>> Tested-by: Zeng Heng <zengheng4@huawei.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since v4:
>> Remove blank line
>>
>> Changes since v3:
>> Refer to processor hierarchy in comments (Jonathan)
>> Fix indent (Jonathan)
>> ---
>>   drivers/acpi/pptt.c  | 84 ++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/acpi.h |  3 ++
>>   2 files changed, 87 insertions(+)
>>
> 
> Since this series may need another respin, a nitpick below...
> 
>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 54676e3d82dd..b8248c0092fe 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -817,3 +817,87 @@ int find_acpi_cpu_topology_hetero_id(unsigned int
>> cpu)
>>       return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
>>                         ACPI_PPTT_ACPI_IDENTICAL);
>>   }
>> +
>> +/**
>> + * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT
>> + * processor hierarchy node
>> + *
>> + * @table_hdr:        A reference to the PPTT table
>> + * @parent_node:    A pointer to the processor hierarchy node in the
>> + *            table_hdr
>> + * @cpus:        A cpumask to fill with the CPUs below @parent_node
>> + *
>> + * Walks up the PPTT from every possible CPU to find if the provided
>> + * @parent_node is a parent of this CPU.
>> + */
>> +static void acpi_pptt_get_child_cpus(struct acpi_table_header
>> *table_hdr,
>> +                     struct acpi_pptt_processor *parent_node,
>> +                     cpumask_t *cpus)
>> +{
>> +    struct acpi_pptt_processor *cpu_node;
>> +    u32 acpi_id;
>> +    int cpu;
>> +
>> +    cpumask_clear(cpus);
>> +
> 
> The CPU mask has been cleared in its only caller
> acpi_pptt_get_cpus_from_container(),
> no need to clear it again.

I'd rather not change this as it adds extra constraints on the caller
which aren't necessarily expected.

> 
>> +    for_each_possible_cpu(cpu) {
>> +        acpi_id = get_acpi_id_for_cpu(cpu);
>> +        cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
>> +
>> +        while (cpu_node) {
>> +            if (cpu_node == parent_node) {
>> +                cpumask_set_cpu(cpu, cpus);
>> +                break;
>> +            }
>> +            cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
>> +        }
>> +    }
>> +}
>> +
>> +/**
>> + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all
>> CPUs in a
>> + *                                       processor container
>> + * @acpi_cpu_id:    The UID of the processor container
>> + * @cpus:        The resulting CPU mask
>> + *
>> + * Find the specified Processor Container, and fill @cpus with all
>> the cpus
>> + * below it.
>> + *
>> + * Not all 'Processor Hierarchy' entries in the PPTT are either a CPU
>> + * or a Processor Container, they may exist purely to describe a
>> + * Private resource. CPUs have to be leaves, so a Processor Container
>> + * is a non-leaf that has the 'ACPI Processor ID valid' flag set.
>> + */
>> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
>> +{
>> +    struct acpi_table_header *table_hdr;
>> +    struct acpi_subtable_header *entry;
>> +    unsigned long table_end;
>> +    u32 proc_sz;
>> +
>> +    cpumask_clear(cpus);
>> +
>> +    table_hdr = acpi_get_pptt();
>> +    if (!table_hdr)
>> +        return;
>> +
>> +    table_end = (unsigned long)table_hdr + table_hdr->length;
>> +    entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
>> +                 sizeof(struct acpi_table_pptt));
>> +    proc_sz = sizeof(struct acpi_pptt_processor);
>> +    while ((unsigned long)entry + proc_sz <= table_end) {
>> +        if (entry->type == ACPI_PPTT_TYPE_PROCESSOR) {
>> +            struct acpi_pptt_processor *cpu_node;
>> +
>> +            cpu_node = (struct acpi_pptt_processor *)entry;
>> +            if (cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID &&
>> +                !acpi_pptt_leaf_node(table_hdr, cpu_node) &&
>> +                cpu_node->acpi_processor_id == acpi_cpu_id) {
>> +                acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
>> +                break;
>> +            }
>> +        }
>> +        entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
>> +                     entry->length);
>> +    }
>> +}
>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index 5ff5d99f6ead..4752ebd48132 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
>> @@ -1541,6 +1541,7 @@ int find_acpi_cpu_topology(unsigned int cpu, int
>> level);
>>   int find_acpi_cpu_topology_cluster(unsigned int cpu);
>>   int find_acpi_cpu_topology_package(unsigned int cpu);
>>   int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
>> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t
>> *cpus);
>>   #else
>>   static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
>>   {
>> @@ -1562,6 +1563,8 @@ static inline int
>> find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>>   {
>>       return -EINVAL;
>>   }
>> +static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
>> +                             cpumask_t *cpus) { }
>>   #endif
>>     void acpi_arch_init(void);
> 
> Thanks,
> Gavin
> 

Thanks,

Ben


