Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DE6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CTpyTVn8qekWk9ExM+e+7DDRQsmtyjl/Qv/w2oaLfk=; b=LA8A+jybjpYq1LGTguFe2yYP77
	SMnu9MJOvNIw6JZ139V6QfaDBw5v3h4JArhEbnyOFQcV/1YUzQ4IMsxOk35WEPfhDzzJNIz22vQHy
	cLzomvB6YLqaoCv19hf5OLQBde04WtV1rE6kK2k6zUEh3mco97ziMzXI28cITptAhjkndVzTHpp0z
	FROpr/2iyG9JxkUE3p4j4B9AL66BVS5yAS3W3bUk9//wncyixlpmjy4nan2l6SppKj3uSsYZtpqlw
	9IyfC/bFlzX4HBLPBmS0by7pK9epQ1Rw+zJS1ZB2mxBaqMEKHvDGzeADBJXe2URTiQNNBLwvU2wAK
	y3ehuhnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQVn-0000000GHaM-1uso;
	Wed, 10 Sep 2025 19:29:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQVl-0000000GHYY-1f5V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:29:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2577731DB;
	Wed, 10 Sep 2025 12:29:36 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 028F03F694;
	Wed, 10 Sep 2025 12:29:37 -0700 (PDT)
Message-ID: <ff91d387-7fe6-4461-a95c-a46b73e4ec73@arm.com>
Date: Wed, 10 Sep 2025 20:29:36 +0100
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
 <29d0a34d-71d3-42ac-ba66-b5536f576f3a@arm.com>
 <aLsOt5Tr+ThuHmSS@e133380.arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aLsOt5Tr+ThuHmSS@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_122945_520130_4829338A 
X-CRM114-Status: GOOD (  28.26  )
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

On 05/09/2025 17:24, Dave Martin wrote:
> On Thu, Aug 28, 2025 at 04:57:06PM +0100, James Morse wrote:
>> On 27/08/2025 11:48, Dave Martin wrote:
>>> On Fri, Aug 22, 2025 at 03:29:44PM +0000, James Morse wrote:
>>>> The PPTT describes CPUs and caches, as well as processor containers.
>>>> The ACPI table for MPAM describes the set of CPUs that can access an MSC
>>>> with the UID of a processor container.

>>>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>>>> @@ -298,6 +298,92 @@ static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_he

>>>>  +void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
>>>>  +{

>>>> +		cpu_node = (struct acpi_pptt_processor *)entry;
>>>> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
>>>> +		    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
>>>> +			leaf_flag = acpi_pptt_leaf_node(table_hdr, cpu_node);
>>>> +			if (!leaf_flag) {
>>>> +				if (cpu_node->acpi_processor_id == acpi_cpu_id)
>>
>>
>>> Is there any need to distinguish processor containers from (leaf) CPU
>>> nodes, here?  If not, dropping the distinction might simplify the code
>>> here (even if callers do not care).
>>
>> In the namespace the object types are different, so I assumed they have their own UID
>> space. The PPTT holds both - hence the check for which kind of thing it is. The risk is
>> looking for processor-container-4 and finding CPU-4 instead...
>>
>> The relevant ACPI bit is "8.4.2.1 Processor Container Device", its says:
>> | A processor container declaration must supply a _UID method returning an ID that is
>> | unique in the processor container hierarchy.
>>
>> Which doesn't quite let me combine them here.
> 
> I was going by the PPTT spec, where the types are not distinct --
> you're probably right, though.

This way round is at least robust to this happening.


> According to that, isn't it the "ACPI Processor ID valid" flag, not the
> "Node is a Leaf" flag, that says whether this field is meaningful?

ACPI_PPTT_ACPI_PROCESSOR_ID_VALID was checked a few lines earlier. We're looking for
processors, hence also checking the leaf.


> It's reasonable not to bother to try to enumerate the children of a
> node that claims to be a leaf (even if there actually are children),
> but I wonder what happens if acpi_processor_id is not declared to be
> valid and matches by accident.  That's probably not a valid table (?)
> but does anything bad happen on the kernel side?

The type and flag are both checked earlier, so this can't happen.
You could certainly but junk nodes in the table that would be skipped over, and those
could point to a parent that is a leaf - I can't spot anything in the table parsing code
that would care about that.


>>> Otherwise, maybe eliminate leaf_flag and collapse these into a single
>>> if(), as suggested by Ben [1].
>>>
>>>> +					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
>>>
>>> Can there ever be multiple matches?
>>>
>>> The possibility of duplicate processor IDs in the PPTT sounds weird to
>>> me, but then I'm not an ACPI expert.
>>
>> Multiple processor-containers with the same ID? That would be a corrupt table.
>> acpi_pptt_get_child_cpus() then walks the tree again to find the CPUs below this
>> processor-container - those have a different kind of id.

> Does anything bad happen if we encounter duplicates?
> 
> (Other then the MPAM driver never getting enabled, or not working as
> advertised, that is.)
> 
> I haven't tried to think through all the implications, here.

It would be unpredictable which node linux finds when it goes looking for CPUs. I don't
think anything would notice. Messing up the cache hierarchy is a different story!


Thanks,

James

