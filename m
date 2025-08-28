Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B93CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvAun0NRsbK4oDGBXXFwHudiyjRKaGXRi66xDS/SX4U=; b=UmkWREInXBzcZ276uWJGfV1qRG
	jYAQ2gs+zqFTkJ0+Glw6auxNYcCpJDkVfXsT1OsbUJIUZsaoVFc86KkJGq6OOfRhMYvYyfjR7XtUH
	0Sup013BCxu0zjK3FEXFAIKzcbkoyZjpJOPS0/POWyBZburQEZpZBioscPNxaNf2p5QIAA4RMEIrA
	kerCp761ortW+JUhchaOvq+CzbmbFzlTBB7sXYVWp0lAQ4nRl9+7k9ZCDcuyC6TWTeDNqp0HywzlV
	/j0L3RwREKlCKMviA0NdViHo14EYFxVKgdQ11790EUQ7Wkw10Ma3Hr0x4LejpgVsC5ITCEz2JKjjG
	nghi4/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhKY-00000002m0y-2bYT;
	Thu, 28 Aug 2025 18:26:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urezE-00000002A0c-49xI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:56:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7218E1688;
	Thu, 28 Aug 2025 08:56:19 -0700 (PDT)
Received: from [10.1.196.42] (eglon.cambridge.arm.com [10.1.196.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27D823F694;
	Thu, 28 Aug 2025 08:56:22 -0700 (PDT)
Message-ID: <0de34aa4-359c-4837-916c-88db0b740e39@arm.com>
Date: Thu, 28 Aug 2025 16:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] ACPI / PPTT: Add a helper to fill a cpumask from a
 processor container
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
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
 <b032775e-1729-441a-8ec4-dd85f70055e8@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <b032775e-1729-441a-8ec4-dd85f70055e8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_085629_111331_607D2775 
X-CRM114-Status: GOOD (  20.55  )
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

Hi Ben,

On 26/08/2025 15:45, Ben Horgan wrote:
> The patch logic update makes sense to me. Just a nit.
> 
> On 8/22/25 16:29, James Morse wrote:
>> The PPTT describes CPUs and caches, as well as processor containers.
>> The ACPI table for MPAM describes the set of CPUs that can access an MSC
>> with the UID of a processor container.
>>
>> Add a helper to find the processor container by its id, then walk
>> the possible CPUs to fill a cpumask with the CPUs that have this
>> processor container as a parent.

>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index 54676e3d82dd..4791ca2bdfac 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -298,6 +298,92 @@ static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_he

>> +/**
>> + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
>> + *                                       processor containers
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
>> +
>> +	table_end = (unsigned long)table_hdr + table_hdr->length;
>> +	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
>> +			     sizeof(struct acpi_table_pptt));
>> +	proc_sz = sizeof(struct acpi_pptt_processor);
>> +	while ((unsigned long)entry + proc_sz <= table_end) {
>> +		cpu_node = (struct acpi_pptt_processor *)entry;
>> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
>> +		    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
>> +			leaf_flag = acpi_pptt_leaf_node(table_hdr, cpu_node);

> nit: Consider dropping the boolean leaf_flag and just using
> acpi_pptt_leaf_node() in the condition. The name leaf_flag is slightly
> overloaded to include the case when the acpi leaf flag is not supported
> and dropping it would make the code more succinct.

Sure, this is a hangover from the earlier cleanup you suggested. It's readable enough
without giving the result a name.


Thanks,

James

