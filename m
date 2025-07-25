Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166B4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocFnSFhQwsgDi6Meap6dXUqN9L4EgmSZkYc7XwqmKdo=; b=l9Iszlw0wIr/kcNdvL+wIIAcHG
	4qPjuHCRlNh4/akGmYKEXv89UXPADmTHlPZh0LH2Z/x3/IiLez6nFLFiIfPxZJzRMyvDoKbVXp3Xj
	HmOP9YzOeJt4BPYGChcDWZGH3rD7riv/05XMJLpttrI5xkqlvLlISVPY3dXciU8aQRfryHgKLL7jJ
	p5EhqUHwR+AgYLBPi5E96hhao1AFMqYb8T3j3eH4DU49fx19V1LRGYgKbBeB+k392IsLbtHfi6YhI
	e4tG2sRq8OABhSZtNnkhzEl8sIEL4Vrmr7DV4RQFJKuoCTn2A3K0+VzwXY0UujU9MILofKDkuEa0j
	UNrHYNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufM1h-0000000AJOm-3bX7;
	Fri, 25 Jul 2025 17:16:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLs8-0000000AIE6-14Mc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Jul 2025 17:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ocFnSFhQwsgDi6Meap6dXUqN9L4EgmSZkYc7XwqmKdo=; b=WtQU1qCt3qY6aXF0SnhaounB7Z
	7MveDvLLa/4lXv0KA8It6DRGhFb5NvfSII31gyp0rYQ3ofLCR6x6JpmpG6A9vseaBJM/nFOE3rW+j
	Kf/Xfa942Y3BUNRiufbdrRL3ZJ8/NGbt6FoWPx0S3u3Y458DRtgmSuozPgA5NoV2tGLUDFpNNARdE
	DmkO5sZq5DKLVHtxQuNRekGujGuSmzqdZtKa0SDFZMcHsFLrDMiwsIJEPUPqw/wEmj/lhdbX3XY1t
	+jVLKM51XXn9KbTpjqOfgdpqZSXgKU/KfmH1ikfhbvcjWW0s3C1DehVLzp1Ihf16wOUOkmtJ7MVed
	nHIUuljQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLs4-0000000BtA3-3uwO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 17:06:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 899C22C3E;
	Fri, 25 Jul 2025 10:06:02 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29A163F66E;
	Fri, 25 Jul 2025 10:06:05 -0700 (PDT)
Message-ID: <733018f5-3d1c-4238-849c-e253a778c81f@arm.com>
Date: Fri, 25 Jul 2025 18:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/36] ACPI / PPTT: Add a helper to fill a cpumask
 from a processor container
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-6-james.morse@arm.com>
 <OSZPR01MB8798B26E19F73A1468FB85408B51A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB8798B26E19F73A1468FB85408B51A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_180613_398882_C4B6C7C9 
X-CRM114-Status: GOOD (  24.46  )
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

Hi Shaopeng,

On 17/07/2025 08:58, Shaopeng Tan (Fujitsu) wrote:
> Hello James,
> 
>> The PPTT describes CPUs and caches, as well as processor containers.
>> The ACPI table for MPAM describes the set of CPUs that can access an MSC
>> with the UID of a processor container.
>>
>> Add a helper to find the processor container by its id, then walk the possible
>> CPUs to fill a cpumask with the CPUs that have this processor container as a
>> parent.

>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c index
>> 54676e3d82dd..13619b1b821b 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -298,6 +298,99 @@ static struct acpi_pptt_processor

>> +/**
>> + * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs
>> in a
>> + *                                       processor containers
>> + * @acpi_cpu_id:	The UID of the processor container.
>> + * @cpus		The resulting CPU mask.
>> + *
>> + * Find the specified Processor Container, and fill @cpus with all the
>> +cpus
>> + * below it.
>> + *
>> + * Not all 'Processor' entries in the PPTT are either a CPU or a
>> +Processor
>> + * Container, they may exist purely to describe a Private resource.
>> +CPUs
>> + * have to be leaves, so a Processor Container is a non-leaf that has
>> +the
>> + * 'ACPI Processor ID valid' flag set.
>> + *
>> + * Return: 0 for a complete walk, or an error if the mask is incomplete.
>> + */
>> +int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
>> +{
>> +	struct acpi_pptt_processor *cpu_node;
>> +	struct acpi_table_header *table_hdr;
>> +	struct acpi_subtable_header *entry;
>> +	bool leaf_flag, has_leaf_flag = false;
>> +	unsigned long table_end;
>> +	acpi_status status;
>> +	u32 proc_sz;
>> +	int ret = 0;
>> +
>> +	cpumask_clear(cpus);
>> +
>> +	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
>> +	if (ACPI_FAILURE(status))
>> +		return 0;

> If pptt table cannot be got,  should -ENODEV be returned?

In general its not an error for the PPTT to be missing, there are plenty of platforms
where that is the case. I think in this case the caller has to be working with some
information that means there has to be a PPTT, so this isn't an error that needs handling.

In MPAM's case, the ACPI table references things in the PPTT, if that table were missing
the platform description is unusable. I don't think this is something we need to help
debug - just ensure we don't cause a panic() that would make it harder to debug!


>> +	if (table_hdr->revision > 1)
>> +		has_leaf_flag = true;
>> +
>> +	table_end = (unsigned long)table_hdr + table_hdr->length;
>> +	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
>> +			     sizeof(struct acpi_table_pptt));
>> +	proc_sz = sizeof(struct acpi_pptt_processor);
>> +	while ((unsigned long)entry + proc_sz <= table_end) {
>> +		cpu_node = (struct acpi_pptt_processor *)entry;
>> +		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
>> +		    cpu_node->flags &
>> ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
>> +			leaf_flag = cpu_node->flags &
>> ACPI_PPTT_ACPI_LEAF_NODE;
>> +			if ((has_leaf_flag && !leaf_flag) ||
>> +			    (!has_leaf_flag
>> && !acpi_pptt_leaf_node(table_hdr, cpu_node))) {
>> +				if (cpu_node->acpi_processor_id ==
>> acpi_cpu_id)
>> +					acpi_pptt_get_child_cpus(table_hdr,
>> cpu_node, cpus);
>> +			}
>> +		}
>> +		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
>> +				     entry->length);
>> +	}
>> +
>> +	acpi_put_table(table_hdr);
>> +
>> +	return ret;

> Only 0 is returned here.

Good spot! I think this allocated memory in the past, it can probably be made 'void',
which will make your above point easier too.


> There is no action to be taken when the mask is incomplete.

I don't think there needs to be. General callers should be using cacheinfo for this
information. This only exists as the MPAM driver needs to know about the topology of the
system before 'all' the CPUs are online. (which could be never).


Thanks,

James

