Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20460C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqgMkV3i1ErG7WnTEAEfRh5gG3Z/R8NrwN56IfrKniY=; b=NAucuyIax2Up0BPT5sfWiGYyln
	XkIdI9L5wzpEKmrMYhX6WR7ZOO/vJWEJVSzqF70gnRRGUYacraN1U+V6U+H8vwpJ8GcjfeZbpRiCo
	G75hiPZfPBRDVKYhJcEbiw74dQB45QAbaGoNb8Xp7tk2VaLjLo9WOgcScI787XVgFe1N/N/N1pWRe
	VQDaKfiP18i8QhJ14R2ADB/VY69Zlnt6hrY4DZeV6Uw/mma7Y4/PzjcVAf2St/NH9vOahz1YKM8lO
	FfzXu2ovGVYcIUtxMa5TLi6DlmWINRNQIygYxT/zyRb5kECS3OCdT8fEmIcUZfv7Fmx3GCs+f4Jn/
	683xWu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Cl-00000002lls-0IeF;
	Mon, 14 Sep 2026 08:38:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Ci-00000002llW-3Nlf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:38:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFD041570;
	Mon, 14 Sep 2026 01:38:15 -0700 (PDT)
Received: from [10.0.128.139] (unknown [10.0.128.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD7EC3F7B4;
	Mon, 14 Sep 2026 01:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789375099; bh=44Zxr0bAzy/FVaHYHhpGrc8BaI6/0sVp1yPuJiyTLok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=trDYbUBd8UJwtxnr5vASuBR49N08Qhrp+erecALsuVHO5qeuyeEwlNO1jTQ9dzICy
	 5RBCJaUgzOIw888gkG3fO+hInEVEOdJFYEAqqhFfwfoUUcwZoBACn0bOu1n6gl1/G9
	 M/9oFTHq4omPIvlpXxn5YpbUoMmFgSEg5bpJPIF0=
Message-ID: <dc733a28-cbca-46cb-a4bd-14840b1a0cc1@arm.com>
Date: Mon, 14 Sep 2026 09:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-7-suzuki.poulose@arm.com>
 <b2fd288e-e0e7-49cc-b0cb-933fba501d79@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <b2fd288e-e0e7-49cc-b0cb-933fba501d79@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_013821_028690_D8A46516 
X-CRM114-Status: GOOD (  32.52  )
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

On 14/09/2026 06:41, Gavin Shan wrote:
> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
>> From: Steven Price <steven.price@arm.com>
>>
>> The RMM maintains the state of all the granules in the system to make
>> sure that the host is abiding by the rules. This state can be maintained
>> at different granularity, per page (TRACKING_FINE) or per region
>> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on 
>> the
>> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region, 
>> all pages
>> in the region must be of the same state, this implies we need to have 
>> "fine"
>> tracking for DRAM, so that we can delegate individual pages.
>>
>> For now we only support a statically carved out memory for tracking
>> granules for the "fine" regions. This can be extended in the future to
>> allow modifying the tracking granularity and remove the need for a
>> static allocation by the firmware.
>>
>> Similarly, the firmware may create L0 GPT entries describing the total
>> address space. But if we change the "PAS" (Physical Address Space) of a
>> granule, then the firmware may need to create L1 tables to track the PAS
>> at a finer granularity. Linux therefore checks if the platform 
>> firmware manages
>> the PAR region. i.e., the firmware is in charge of managing the L1 GPTs
>> (creation and the required memory for the GPT tables - via static 
>> carveouts)
>> without host intervention. Support for dynamic GPT creation by the 
>> host will be
>> added later.
>>
>> If the firmware requires us to manage the tracking or GPT memory, 
>> Deactivate
>> the RMM and reclaim any memory donated at RMM activation.
>>
>> Apply the same checks when hotplugged memory is brought online.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> [ Switch to RMI_GPT_L1_INFO for checking GPTs and deactivate RMM ]
>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   Changes since v17:
>>       * Move wrappers that may not be used elsewhere, out of arm-rmi- 
>> cmds.h
>>   Changes since v16:
>>       * Check fine tracking and create L1 GPTs for hotplug-added memory.
>>       * Clarify the L1 GPT setup and move the explanatory comment.
>>       * Switch to using RMI_GPT_INFO command for checking the GPTs.
>>       * Deactivate the RMM and reclaim the memory if we can't proceed.
>>   Changes since v15:
>>       * Skip firmware-reserved NOMAP memory in rmi_init_metadata()
>>       * Handle negative error codes from wrappers.
>>   Changes since v14:
>>       * Move the implementation into drivers/firmware/arm_rmm.
>>   Changes since v13:
>>       * Moved out of KVM
>> ---
>>   drivers/firmware/arm_rmm/rmi.c | 200 +++++++++++++++++++++++++++++++++
>>   include/linux/arm-rmi-cmds.h   |   2 +
>>   2 files changed, 202 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ 
>> arm_rmm/rmi.c
>> index ecc89e91d264d..583e1aca9b15a 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -5,12 +5,15 @@
>>   #include <linux/cpufeature.h>
>>   #include <linux/memblock.h>
>> +#include <linux/memory.h>
>>   #include <linux/arm-rmi-cmds.h>
>>   #include <linux/slab.h>
>>   #include <asm/memory.h>
>>   #include <asm/pgtable-hwdef.h>
>> +static bool arm64_rmi_is_available;
>> +
>>   /* Currently only the first 2 registers are used by Linux */
>>   #define RMI_FEAT_REG_COUNT    2
>>   static unsigned long rmi_feat_reg_cache[RMI_FEAT_REG_COUNT] 
>> __ro_after_init;
>> @@ -68,6 +71,69 @@ static inline long 
>> rmi_granule_range_undelegate(unsigned long base,
>>       return ret;
>>   }
>> +/**
>> + * rmi_granule_tracking_get() - Get configuration of a Granule 
>> tracking region
>> + * @start: Base PA of the tracking region
>> + * @end: End of the PA region
>> + * @out_category: Memory category
>> + * @out_state: Tracking region state
>> + * @out_top: Top of the memory region
>> + *
>> + * Return: RMI return code
>> + */
>> +static inline int rmi_granule_tracking_get(unsigned long start,
>> +                       unsigned long end,
>> +                       unsigned long *out_category,
>> +                       unsigned long *out_state,
>> +                       unsigned long *out_top)
>> +{
>> +    struct arm_smccc_1_2_regs regs = {
>> +        SMC_RMI_GRANULE_TRACKING_GET, start, end,
>> +    };
>> +
>> +    rmi_smccc_invoke(&regs);
>> +
>> +    if (regs.a0 != RMI_SUCCESS)
>> +        return regs.a0;
>> +
>> +    if (out_category)
>> +        *out_category = regs.a1;
>> +    if (out_state)
>> +        *out_state = regs.a2;
>> +    if (out_top)
>> +        *out_top = regs.a3;
>> +
>> +    return RMI_SUCCESS;
>> +}
>> +
>> +/*
>> + * rmi_gpt_info - Query the GPT info for the given PAR.
>> + * @start: Base of the physical address region
>> + * @top: Top of the physical address region
>> + * @out_top: Top of the phyiscal address region for which
>> + *        the GPT @out_gpt_par_state is valid
>> + * @out_gpt_par_state: State of the GPT covered by [start, out_top)
>> + */
>> +static inline long rmi_gpt_info(unsigned long start, unsigned long end,
>> +                unsigned long *out_top,
>> +                unsigned long *out_gpt_par_state)
>> +{
>> +    struct arm_smccc_1_2_regs regs = {
>> +        SMC_RMI_GPT_INFO, start, end,
>> +    };
>> +
>> +    rmi_smccc_invoke(&regs);
>> +    if (regs.a0 != RMI_SUCCESS)
>> +        return regs.a0;
>> +
>> +    if (out_top)
>> +        *out_top = regs.a1;
>> +    if (out_gpt_par_state)
>> +        *out_gpt_par_state = regs.a2;
>> +
>> +    return RMI_SUCCESS;
>> +}
>> +
>>   /**
>>    * rmi_features() - Read feature register
>>    * @index: Feature register index
>> @@ -759,6 +825,124 @@ static int rmi_configure(void)
>>       return ret;
>>   }
>> +/*
>> + * Make sure the area is tracked by RMM at FINE granularity.
>> + * We do not support changing the tracking yet.
>> + */
>> +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t 
>> end)
>> +{
>> +    while (start < end) {
>> +        unsigned long ret, category, state, next;
>> +
>> +        ret = rmi_granule_tracking_get(start, end, &category, &state, 
>> &next);
>> +        if (ret != RMI_SUCCESS)
>> +            return -ENOMEM;
>> +
>> +        if (state != RMI_TRACKING_FINE ||
>> +            category != RMI_MEM_CATEGORY_CONVENTIONAL) {
>> +            /* TODO: Set granule tracking in this case */
>> +            pr_err("Granule tracking for region isn't fine/ 
>> conventional: %llx-%lx\n",
>> +                   start, next);
>> +            return -ENODEV;
>> +        }
>> +        start = next;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
> 
> I would suggest to drop rmi_granule_tracking_get() by combining its 
> logics into
> rmi_verify_memory_tracking().
> 
> /*
>   * Make sure the area is tracked by RMM at FINE granularity.
>   * We do not support changing the tracking yet.
>   */
> static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
> {
>          struct arm_smccc_1_2_regs args;
> 
>          while (start < end) {
>                  args.a0 = SMC_RMI_GRANULE_TRACKING_GET;
>                  args.a1 = start;
>                  args.a2 = end;
>                  rmi_smccc_invoke(&args);
> 
>                  if (args.a0 != RMI_SUCCESS)
>                          return -ENOMEM;
> 
>                  if (args.a1 != RMI_MEM_CATEGORY_CONVENTIONAL ||
>                      args.a2 != RMI_TRACKING_FINE) {
>                          /* TODO: Set granule tracking in this case */
>                          pr_err("Granule tracking for region isn't fine/ 
> conventional: %llx-%lx\n",
>                                  start, args.a3);
>                          return -ENODEV;

I have moved the wrappers closer to the caller, but retained them to
  make it easier to read the code.
  e.g., error conditions around next >= start etc.

>                  }
> 
>                  start = args.a3;
>          }
> 
>          return 0;
> }

...

> 
> I would suggest to drop rmi_gpt_info() by combining its logics into 
> rmi_verify_gpt_firmware_managed().
> 

Same as above.

>> +
>> +static int rmi_init_metadata(void)
>> +{
>> +    phys_addr_t start, end;
>> +    struct memblock_region *r;
>> +
>> +    for_each_mem_region(r) {
>> +        int ret;
>> +
>> +        /* Firmware-reserved NOMAP regions are not usable system RAM */
>> +        if (memblock_is_nomap(r))
>> +            continue;
>> +
>> +        start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
>> +        end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
>> +
> 
> nit: unnecessary to covert the physical address (struct 
> memblock_region::base and (base + size))
> to PFN and then convert PFN to physical address:
> 
>          start = PAGE_ALIGN(r->base);
>          end = PAGE_ALIGN_DOWN(r->base + r->size);
>          if (start >= end)
>              continue;

Yes, I have handled this already per Sashiko review comment.

Thank you for the review!

Cheers
Suzuki

