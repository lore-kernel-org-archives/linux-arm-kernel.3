Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C55BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDA8Rn8P10pKwvXb+LSgDWoKAa6kJcxmviqNi517CuY=; b=IjZKBPBuocMUFMHPBAwMQyqpug
	Dj3RIXtnXLc39pC6WnpGcvhxSe/Br/yqGGE6dNTWfuV1YsLdAUkvzihOhi0xWfEmg8U7dQJXVw9cj
	R6PcqFsuZ0F9Jkd57W0YM7hmQG4xoFiAcOpxZtsqnvaOIlON6bLXqEsBgmoeMWmCYevykokX621N9
	Pp2GO/K3uru3sRAnzgIxw0hPv70ot4LprU9r6QrNYN0oG+DwCGw7/a/y6YhmEVKaDIlgpq5IbnL/j
	IkJLYRa/YtGopKTx96zBmBEECmfCooJeaNwApKewCj9y5TSGVS7zjiXf4CNJbEm2yCCGPe1dEqVmo
	elsq0p9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2YM-0000000FsfQ-3utc;
	Thu, 06 Nov 2025 16:09:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2YK-0000000FseT-1yTA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:09:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A750812FC;
	Thu,  6 Nov 2025 08:09:27 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA2FC3F66E;
	Thu,  6 Nov 2025 08:09:30 -0800 (PST)
Message-ID: <40b19590-d97c-472b-a577-0b637f6507ef@arm.com>
Date: Thu, 6 Nov 2025 16:09:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/29] ACPI / PPTT: Add a helper to fill a cpumask from
 a processor container
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-2-james.morse@arm.com>
 <20251024122650.00001d00@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251024122650.00001d00@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_080936_610283_69062D9E 
X-CRM114-Status: GOOD (  39.73  )
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

Hi Jonathan,

Replying for James as he's busy and I've been tasked with posting the
next version of this series.

On 10/24/25 12:26, Jonathan Cameron wrote:
> On Fri, 17 Oct 2025 18:56:17 +0000
> James Morse <james.morse@arm.com> wrote:
> 
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
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
> Hi James,
> 
> V2 has dropped out of my memory more or less so to get this back in
> I'll do a fresh review (even of ones I've already given an RB on).
> Nothing here to change that tag. Just some naming / comment suggestions
> that I think would help a little with readability.
> 
> Some of these comments come from me forgetting how the spec named
> things and so going to take a look.  The spec isn't consistent with the
> naming (e.g. ACPI PROCESSOR ID is not necessarily a processor
> ID) but I think keeping closer to spec names will help readers. 
> 
> Note this may all be in the category of perfect being the enemy of
> good + upstream so I don't mind if you ignore.
> 
>> ---
>> Changes since v2:
>>  * Grouped two nested if clauses differently to reduce scope of cpu_node.
>>  * Removed stale comment refering to the return value.
>>
>> Changes since v1:
>>  * Replaced commit message with wording from Dave.
>>  * Fixed a stray plural.
>>  * Moved further down in the file to make use of get_pptt() helper.
>>  * Added a break to exit the loop early.
>>
>> Changes since RFC:
>>  * Removed leaf_flag local variable from acpi_pptt_get_cpus_from_container()
>>
>> Changes since RFC:
>>  * Dropped has_leaf_flag dodging of acpi_pptt_leaf_node()
>>  * Added missing : in kernel-doc
>>  * Made helper return void as this never actually returns an error.
>> ---
>>  drivers/acpi/pptt.c  | 82 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/acpi.h |  3 ++
>>  2 files changed, 85 insertions(+)
>>
>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 54676e3d82dd..58cfa3916a13 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -817,3 +817,85 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
>>  	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
>>  					  ACPI_PPTT_ACPI_IDENTICAL);
>>  }
>> +
>> +/**
>> + * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT processor node
> 
> The spec calls these Processor Hierarchy Node Structures. I think the
> addition of the Hierarchy word will help people understand this isn't
> finding things below a node specific to a processor but to some higher
> level hierarchy structure.

I've taken your suggestions around adding hierarchy in the comments but
for the variable and function names I've kept them as they are as adding
hierarchy in made them more unwieldy.

> 
>> + * @table_hdr:		A reference to the PPTT table.
>> + * @parent_node:	A pointer to the processor node in the @table_hdr.
> 
> Likewise, calling this a "processor hierarchy node" would make things
> clearer.
> 
>> + * @cpus:		A cpumask to fill with the CPUs below @parent_node.
>> + *
>> + * Walks up the PPTT from every possible CPU to find if the provided
>> + * @parent_node is a parent of this CPU.
>> + */
>> +static void acpi_pptt_get_child_cpus(struct acpi_table_header *table_hdr,
>> +				     struct acpi_pptt_processor *parent_node,
>> +				     cpumask_t *cpus)
>> +{
>> +	struct acpi_pptt_processor *cpu_node;
> 
> This is definitely a processor hierarchy node.  To my mind
> cpu_node doesn't convey this.  See below for more, but perhaps just renaming
> it to include hierarchy in the name would help.
> 
>> +	u32 acpi_id;
>> +	int cpu;
>> +
>> +	cpumask_clear(cpus);
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		acpi_id = get_acpi_id_for_cpu(cpu);
>> +		cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
> 
> Here it is indeed a CPU.
> 
>> +
>> +		while (cpu_node) {
>> +			if (cpu_node == parent_node) {
>> +				cpumask_set_cpu(cpu, cpus);
>> +				break;
>> +			}
>> +			cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
> 
> But here it is a processor container or a private node.  So
> cpu_hieriarchy_node or something along those lines would be more appropriate.
> 
>> +		}
>> +	}
>> +}
>> +
>> +/**
>> + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
>> + *                                       processor container
>> + * @acpi_cpu_id:	The UID of the processor container.
>> + * @cpus:		The resulting CPU mask.
>> + *
>> + * Find the specified Processor Container, and fill @cpus with all the cpus
>> + * below it.
>> + *
>> + * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
> 
> I'd go with 'Processor Hierarchy' here
>  
>> + * Container, they may exist purely to describe a Private resource. CPUs
>> + * have to be leaves, so a Processor Container is a non-leaf that has the
>> + * 'ACPI Processor ID valid' flag set.
>> + */
>> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
>> +{
>> +	struct acpi_table_header *table_hdr;
>> +	struct acpi_subtable_header *entry;
>> +	unsigned long table_end;
>> +	u32 proc_sz;
>> +
>> +	cpumask_clear(cpus);
>> +
>> +	table_hdr = acpi_get_pptt();
>> +	if (!table_hdr)
>> +		return;
>> +
>> +	table_end = (unsigned long)table_hdr + table_hdr->length;
>> +	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
>> +			     sizeof(struct acpi_table_pptt));
>> +	proc_sz = sizeof(struct acpi_pptt_processor);
>> +	while ((unsigned long)entry + proc_sz <= table_end) {
>> +
>> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR) {
>> +			struct acpi_pptt_processor *cpu_node;
> similar naming thing here. 
>> +
>> +			cpu_node = (struct acpi_pptt_processor *)entry;
>> +			if (cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID &&
>> +			    !acpi_pptt_leaf_node(table_hdr, cpu_node) &&
>> +			    cpu_node->acpi_processor_id == acpi_cpu_id) {
>> +					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> The double tab indent here is odd.
> 			if (cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID &&
> 			    !acpi_pptt_leaf_node(table_hdr, cpu_node) &&
> 			    cpu_node->acpi_processor_id == acpi_cpu_id) {
> 				acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> 
> Isn't find I think for readability.  I could understand the bonus tab if it was
> close to aligning with the line above but it isn't.

Indent fixed.

> 
>> +					break;
>> +			}
>> +		}
>> +		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
>> +				     entry->length);
>> +	}
>> +}
> 
> 
> 

Thanks,

Ben


