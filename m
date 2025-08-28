Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F281C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6D/z9egoJVcV+VCx6JUOy50P/+sLKIWXsA4ygWvR84=; b=k21zIbU/novXjDQ5nNG2HW5JpF
	UHOh13P/YUMPyF5FXrsqgScS9H8QTJLzrDCYu3gRKBVVc1ydnZl6XCxjgqewtaw+9Il0ARXIh020m
	AIshxRnNXoYIdqoxdh8X6IsTlSDUg3IaSfxtEwBhd23eLn1FhqGv3QBeT3zzwBIzjAFLeaC0xkaKd
	j/EF330b2835lm9l6/rK0gi0OIEWGTAaVKBKv5B+lw46xnT9Y9K1jJMvnn8g1ReOnvBUNJAj9aDWg
	AtVVXk/xCWGai6Sy5kFPINP3r2zC+DQWwQdkFI6JPgMbc5FOpatmWPWkEynWdpM7bSS0PD5d1LAL0
	n6fzFRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhNG-00000002mdZ-1nsd;
	Thu, 28 Aug 2025 18:29:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf01-00000002A6c-3ZHU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:57:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0978A1688;
	Thu, 28 Aug 2025 08:57:09 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78BAC3F694;
	Thu, 28 Aug 2025 08:57:08 -0700 (PDT)
Message-ID: <29d0a34d-71d3-42ac-ba66-b5536f576f3a@arm.com>
Date: Thu, 28 Aug 2025 16:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] ACPI / PPTT: Add a helper to fill a cpumask from a
 processor container
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-4-james.morse@arm.com>
 <aK7id14+Spr2VIqR@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aK7id14+Spr2VIqR@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085718_008934_743CB964 
X-CRM114-Status: GOOD (  41.17  )
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

Hi Dave,

On 27/08/2025 11:48, Dave Martin wrote:
> On Fri, Aug 22, 2025 at 03:29:44PM +0000, James Morse wrote:
>> The PPTT describes CPUs and caches, as well as processor containers.
>> The ACPI table for MPAM describes the set of CPUs that can access an MSC
>> with the UID of a processor container.
>>
>> Add a helper to find the processor container by its id, then walk
>> the possible CPUs to fill a cpumask with the CPUs that have this
>> processor container as a parent.

> Nit: The motivation for the change is not clear here.
> 
> I guess this boils down to the need to map the MSC topology information
> in the the ACPI MPAM table to a cpumask for each MSC.
> 
> If so, a possible rearrangement and rewording might be, say:
> 
> --8<--
> 
> The ACPI MPAM table uses the UID of a processor container specified in
> the PPTT, to indicate the subset of CPUs and upstream cache topology
> that can access each MPAM Memory System Component (MSC).
> 
> This information is not directly useful to the kernel.  The equivalent
> cpumask is needed instead.
> 
> Add a helper to find the processor container by its id, then [...]
> 
> -->8--

Thanks, that is clearer!


>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 54676e3d82dd..4791ca2bdfac 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -298,6 +298,92 @@ static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_he
>>  	return NULL;
>>  }
>>  
>> +/**
>> + * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT processor node
>> + * @table_hdr:		A reference to the PPTT table.
>> + * @parent_node:	A pointer to the processor node in the @table_hdr.
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
>> +	u32 acpi_id;
>> +	int cpu;
>> +
>> +	cpumask_clear(cpus);
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		acpi_id = get_acpi_id_for_cpu(cpu);

> ^ Presumably this can't fail?

It'll return something! This could only be a problem if this raced with a CPU becoming
impossible, and there is no mechanism to do that.


>> +		cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
>> +
>> +		while (cpu_node) {
>> +			if (cpu_node == parent_node) {
>> +				cpumask_set_cpu(cpu, cpus);
>> +				break;
>> +			}
>> +			cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
>> +		}
>> +	}
>> +}
>> +
>> +/**
>> + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
>> + *                                       processor containers

> Nit: "containers" -> "container" ?

Fixed,


>> + * @acpi_cpu_id:	The UID of the processor container.
>> + * @cpus:		The resulting CPU mask.
>> + *
>> + * Find the specified Processor Container, and fill @cpus with all the cpus
>> + * below it.
>> + *
>> + * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
>> + * Container, they may exist purely to describe a Private resource. CPUs
>> + * have to be leaves, so a Processor Container is a non-leaf that has the
>> + * 'ACPI Processor ID valid' flag set.
> 
> (Revise this if dropping the leaf/non-leaf distinction -- see below.)
> 
>> + *
>> + * Return: 0 for a complete walk, or an error if the mask is incomplete.
>> + */
>> +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
>> +{
>> +	struct acpi_pptt_processor *cpu_node;
>> +	struct acpi_table_header *table_hdr;
>> +	struct acpi_subtable_header *entry;
>> +	unsigned long table_end;
>> +	acpi_status status;
>> +	bool leaf_flag;
>> +	u32 proc_sz;
>> +
>> +	cpumask_clear(cpus);
>> +
>> +	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
>> +	if (ACPI_FAILURE(status))
>> +		return;

> Is acpi_get_pptt() applicable here?

Oh, that is new, and would let me chuck the reference counting.
I guess this replaces Jonthan's magic table free'ing cleanup thing!


> (That function is not thread-safe, but then, perhaps most/all of these
> functions are not thread safe.  If we are still on the boot CPU at this
> point (?) then this wouldn't be a concern.)

I think that relies on the first caller being from somewhere that can't race.
In this case its the architecture's smp_prepare_cpus() call to setup the acpi topology.
That is sufficiently early its not a concern.


>> +
>> +	table_end = (unsigned long)table_hdr + table_hdr->length;
>> +	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
>> +			     sizeof(struct acpi_table_pptt));
>> +	proc_sz = sizeof(struct acpi_pptt_processor);
>> +	while ((unsigned long)entry + proc_sz <= table_end) {
> 
> Ack that this matches the bounds check in functions that are already
> present.
> 
>> +		cpu_node = (struct acpi_pptt_processor *)entry;
>> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
>> +		    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
>> +			leaf_flag = acpi_pptt_leaf_node(table_hdr, cpu_node);
>> +			if (!leaf_flag) {
>> +				if (cpu_node->acpi_processor_id == acpi_cpu_id)


> Is there any need to distinguish processor containers from (leaf) CPU
> nodes, here?  If not, dropping the distinction might simplify the code
> here (even if callers do not care).

In the namespace the object types are different, so I assumed they have their own UID
space. The PPTT holds both - hence the check for which kind of thing it is. The risk is
looking for processor-container-4 and finding CPU-4 instead...

The relevant ACPI bit is "8.4.2.1 Processor Container Device", its says:
| A processor container declaration must supply a _UID method returning an ID that is
| unique in the processor container hierarchy.

Which doesn't quite let me combine them here.


> Otherwise, maybe eliminate leaf_flag and collapse these into a single
> if(), as suggested by Ben [1].
> 
>> +					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
> 
> Can there ever be multiple matches?
> 
> The possibility of duplicate processor IDs in the PPTT sounds weird to
> me, but then I'm not an ACPI expert.

Multiple processor-containers with the same ID? That would be a corrupt table.
acpi_pptt_get_child_cpus() then walks the tree again to find the CPUs below this
processor-container - those have a different kind of id.

> If there can only be a single match, though, then we may as well break
> out of the loop here, unless we want to be paranoid and report
> duplicates as an error -- but that would require extra implementation,
> so I'm not sure that would be worth it.

Hmmm, the PPTT node should map to only one processor or processor-container.
I'll chuck the break in.


Thanks,

James

