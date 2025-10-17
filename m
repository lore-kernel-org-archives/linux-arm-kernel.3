Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87516CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo4oImkEBXJ1ekm2nVICMbpxm4KOT7C6jbNF/Xi65CM=; b=andwxJJ9Fi2TkS+ESMMTRSVkuR
	gACz8YuRi6enZZ/Qc2yJ3hFhtx0GI12ffk/KAHo2RxmhOca65Ab1kHCgkrDsEKjPFrl0nnrxi/QuG
	clYf3EhPZKadADlE4k94kg+LaP9WJFPAdwPZ9kIz6/vsyBxSm0lUYH39G8f5OVPalEnmU9FWa07ZO
	9w5hI+NfjyPBV45O/NWjZjlq/YCxPTsyN9ttSaOOCqoxCv7awn2hgU+Eq2tcLayiWy19jt4viCCKL
	Xp7u2c6Fwe/ozRDdVvgF8Lj8knHB0rdkj6AqYDdEavxz35WBaspDoGGCydtS26u473GiAB91ppQcn
	cUV3dbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pXp-00000008iC9-49pq;
	Fri, 17 Oct 2025 18:51:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pXk-00000008iA4-0SaL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:51:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C8E31595;
	Fri, 17 Oct 2025 11:51:00 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8336E3F6A8;
	Fri, 17 Oct 2025 11:51:02 -0700 (PDT)
Message-ID: <7c2723fb-b5dd-4ae7-802b-8c9b2dadd78a@arm.com>
Date: Fri, 17 Oct 2025 19:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/29] ACPI / MPAM: Parse the MPAM table
To: Fenghua Yu <fenghuay@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-7-james.morse@arm.com>
 <53c52ef8-823e-4627-8fff-e09da33d8e7b@nvidia.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <53c52ef8-823e-4627-8fff-e09da33d8e7b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115112_225099_99BA72AF 
X-CRM114-Status: GOOD (  20.16  )
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

Hi Fenghua,

On 02/10/2025 04:21, Fenghua Yu wrote:
> On 9/10/25 13:42, James Morse wrote:
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
> 
> Since level could be negative value here, printing it as %u converts it to positive value
> and will cause debug difficulty. For example, -ENOENT returned by
> find_acpi_cache_level_from_id() will be printed as 4294967294(instead of -2) which is hard
> to know the error code.
> 
> Suggest to change this to %d:

Sure, its never meant to be seen!


>             pr_err_once("Bad level (%d) for cache with id %u\n", level, cache_id);
> 
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
>> +    default:
>> +        /* These get discovered later and treated as unknown */
>> +        return 0;
>> +    }
>> +}

>> +static bool __init parse_msc_pm_link(struct acpi_mpam_msc_node *tbl_msc,
>> +                     struct platform_device *pdev,
>> +                     u32 *acpi_id)
>> +{
>> +    char hid[sizeof(tbl_msc->hardware_id_linked_device) + 1];
>> +    bool acpi_id_valid = false;
>> +    struct acpi_device *buddy;
>> +    char uid[11];
>> +    int err;
>> +
>> +    memset(&hid, 0, sizeof(hid));
>> +    memcpy(hid, &tbl_msc->hardware_id_linked_device,
>> +           sizeof(tbl_msc->hardware_id_linked_device));
>> +
>> +    if (!strcmp(hid, ACPI_PROCESSOR_CONTAINER_HID)) {
>> +        *acpi_id = tbl_msc->instance_id_linked_device;
>> +        acpi_id_valid = true;
>> +    }
>> +
>> +    err = snprintf(uid, sizeof(uid), "%u",
>> +               tbl_msc->instance_id_linked_device);
>> +    if (err >= sizeof(uid)) {
> 
> err could be negative error code.

Not here it can't, from lib/vsprintf.c's documentation of snprintf()
| * The return value is the number of characters which would be
| * generated for the given input, excluding the trailing null,
| * as per ISO C99.  If the return is greater than or equal to
| * @size, the resulting string is truncated.

> This error validation only checks size but not error code.
> 
> Better to change it to
> 
>         if (err < 0 || err >= sizeof(uid))
> 


Thanks,

James

