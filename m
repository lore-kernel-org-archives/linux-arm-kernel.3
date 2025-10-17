Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF01CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tnJO6Ch4nIcwXHTA+v885dVJA3A7u9r+lsY9o/kxU8=; b=zUCU3ktXXfxKitSnHZw/1S8WTg
	GD3l9pD+5ZlSL6M+6alSMzePTqMUcJMeLOt21ikvUQegnhtKtY+/ivK4fYK61NYTrY3nayP/+tWJH
	5Zn3CmvvyltXQFAV4astRiV1/oywY2HASRC69mhDpmfgwv75a6fpM62iwpLwk2OD7nZygn1M8tFXY
	7sTMqFlZopy4A60TzYGX9Co04XzK5DRJnjpZfUpdRa7N3dbPqt8x+Ayox3v9gqYC7Vib4TBOmOxBq
	p3I1nQACjywJaso+9bvge7/8eUdcpqZJyzI5BvEhuNGmX4aSx4iqZDQ2b4ftA2bMMyu324TyWGXxF
	SjSkTDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pXz-00000008iGe-1DMM;
	Fri, 17 Oct 2025 18:51:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pXq-00000008iCN-1NZM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:51:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 562E91515;
	Fri, 17 Oct 2025 11:51:06 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D2E33F6A8;
	Fri, 17 Oct 2025 11:51:08 -0700 (PDT)
Message-ID: <c91fb7cd-13d5-4280-b2b6-c6ed37512ebd@arm.com>
Date: Fri, 17 Oct 2025 19:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/29] ACPI / MPAM: Parse the MPAM table
To: Gavin Shan <gshan@redhat.com>, linux-kernel@vger.kernel.org,
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
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-7-james.morse@arm.com>
 <64105db5-01e3-44ba-bfb0-6524de471ccb@redhat.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <64105db5-01e3-44ba-bfb0-6524de471ccb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115118_445957_78696010 
X-CRM114-Status: GOOD (  28.77  )
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

On 03/10/2025 01:58, Gavin Shan wrote:
> On 9/11/25 6:42 AM, James Morse wrote:
>> Add code to parse the arm64 specific MPAM table, looking up the cache
>> level from the PPTT and feeding the end result into the MPAM driver.
>>
>> For now the MPAM hook mpam_ris_create() is stubbed out, but will update
>> the MPAM driver with optional discovered data.

>> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
>> new file mode 100644
>> index 000000000000..fd9cfa143676
>> --- /dev/null
>> +++ b/drivers/acpi/arm64/mpam.c

>> +static bool acpi_mpam_register_irq(struct platform_device *pdev, int intid,
>> +                   u32 flags, int *irq,
>> +                   u32 processor_container_uid)
>> +{
>> +    int sense;
>> +
>> +    if (!intid)
>> +        return false;
>> +
>> +    if (FIELD_GET(ACPI_MPAM_MSC_IRQ_TYPE_MASK, flags) !=
>> +        ACPI_MPAM_MSC_IRQ_TYPE_WIRED)
>> +        return false;
>> +
>> +    sense = FIELD_GET(ACPI_MPAM_MSC_IRQ_MODE_MASK, flags);
>> +
>> +    if (16 <= intid && intid < 32 && processor_container_uid != GLOBAL_AFFINITY) {
>> +        pr_err_once("Partitioned interrupts not supported\n");
>> +        return false;
>> +    }
>> +
>> +    *irq = acpi_register_gsi(&pdev->dev, intid, sense, ACPI_ACTIVE_HIGH);
>> +    if (*irq <= 0) {
>> +        pr_err_once("Failed to register interrupt 0x%x with ACPI\n",
>> +                intid);
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
> 
> 0 is allowed by acpi_register_gsi().
> 
>     if (*irq < 0) {
>         pr_err_once(...);
>         return false;
>     }

Really? I thought irq-zero was nonsense.
acpi_register_gsi() does this:
|        irq = irq_create_fwspec_mapping(&fwspec);
|        if (!irq)
|                return -EINVAL;
|
|        return irq;


>> +static int acpi_mpam_parse_resource(struct mpam_msc *msc,
>> +                    struct acpi_mpam_resource_node *res)
>> +{
>> +    int level, nid;
>> +    u32 cache_id;
>> +
>> +    switch (res->locator_type) {
>> +    case ACPI_MPAM_LOCATION_TYPE_PROCESSOR_CACHE:
>> +        cache_id = res->locator.cache_locator.cache_reference;
>> +        level = find_acpi_cache_level_from_id(cache_id);
>> +        if (level <= 0) {
>> +            pr_err_once("Bad level (%u) for cache with id %u\n", level, cache_id);
>> +            return -EINVAL;
>> +        }
>> +        return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_CACHE,
>> +                       level, cache_id);
>> +    case ACPI_MPAM_LOCATION_TYPE_MEMORY:
>> +        nid = pxm_to_node(res->locator.memory_locator.proximity_domain);
>> +        if (nid == NUMA_NO_NODE)
>> +            nid = 0;
>> +        return mpam_ris_create(msc, res->ris_index, MPAM_CLASS_MEMORY,
>> +                       255, nid);
> 
> It's perhaps worthy a warning message when @nid is explicitly set to zero due to
> the bad proximity domain, something like below.
> 
>         if (nid == NUMA_NO_NODE) {
>             nid = 0;
>             if (num_possible_nodes() > 1) {
>                 pr_warn("Bad proximity domain %d, mapped to node 0\n",
>                     res->locator.memory_locator.proximity_domain);
>             }
>         }

This was to catch the case where you build the kernel without NUMA support - which
wouldn't be an error. But that returns 0 instead of NUMA_NO_NODE, so NUMA_NO_NODE only
occurs when there is a bug. I'l add this - but it'll be a pr_debug() as the message is
only of use to about 4 people!


>> +    default:
>> +        /* These get discovered later and treated as unknown */
>> +        return 0;
>> +    }
>> +}

>> +int acpi_mpam_count_msc(void)
>> +{
>> +    struct acpi_table_header *table __free(acpi_table) =
>> acpi_get_table_ret(ACPI_SIG_MPAM, 0);
>> +    char *table_end, *table_offset = (char *)(table + 1);
>> +    struct acpi_mpam_msc_node *tbl_msc;
>> +    int count = 0;
>> +
>> +    if (IS_ERR(table))
>> +        return 0;
>> +
>> +    if (table->revision < 1)
>> +        return 0;
>> +
>> +    table_end = (char *)table + table->length;
>> +
>> +    while (table_offset < table_end) {
>> +        tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
>> +        if (!tbl_msc->mmio_size)
>> +            continue;
>> +
>> +        if (tbl_msc->length < sizeof(*tbl_msc))
>> +            return -EINVAL;
>> +        if (tbl_msc->length > table_end - table_offset)
>> +            return -EINVAL;
>> +        table_offset += tbl_msc->length;
>> +
>> +        count++;
>> +    }
>> +
>> +    return count;
>> +}

> acpi_mpam_count_msc() iterates the existing MSC node, which is part of acpi_mpam_parse().
> So the question is why we can't drop acpi_mpam_count_msc() and maintain a variable to
> count the existing MSC nodes in acpi_mpam_parse() ?

Once the platform device has been created, the driver's probe call can be called, and that
needs to know how many MSC there are going to be. Doing it like this means we don't depend
on the driver probe function not being called until we got to the end of the list.
(the comments about the initcall dependencies are already annoying - I prefer not to add
any that are specific to MPAM).

This also lets us catch non-backward compatible ACPI table changes, which has already
happened with PCC. acpi_mpam_parse() skips MSC with reserved fields set,
acpi_mpam_count_msc() does not - this means we are guaranteed the values will mismatch
if any of those reserved fields are set, and the driver will never try to touch the hardware.


Thanks,

James


