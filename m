Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3A8CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qstyjn0vRl7PBByeFNtn0A1JtwV4U7XBXFCVOForpy0=; b=YoCAorwLHd28DFm6rY++mmlYBC
	xlUmSx6DZxRFL0o8LCuGhal2hamP52RQNA1ZSe5Omas4T7JbiHrbqncJIZ0BRiECC0Xz1pQE6vaQM
	9vXKzApVWU06uM2PUZ3hwO5gNBv4Yu16ZhQvNyB+NZ4xVRXvYGt2eRoxoI+LsJdkFO9GLUHmX9Smw
	Q6py3fzd/DoaemdL6WCPugXvP9g1goSpJBU7h1a76d6uyYbpLseM90b95+b2vRtAmymEiqb3EdVMb
	jOJ2rZHMwXbNcHszPJcmSNA3pYfyg1/crZ/e35sXhBA/fdMcLzyPtdXvyBvJMgw5QZw+oWCNa7VMo
	0HR6Jf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnpv-0000000FSgx-2Jgn;
	Wed, 03 Jun 2026 15:48:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnpt-0000000FSff-1M3u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:48:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD2B43565;
	Wed,  3 Jun 2026 08:48:47 -0700 (PDT)
Received: from [10.57.26.22] (unknown [10.57.26.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABAB23F86F;
	Wed,  3 Jun 2026 08:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780501732; bh=PpYTAUv2Q8yQ4mjH5wA/7BzqV8xwkMc1OIxAcnNR5Us=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cbQfhaNYFnv2Gfp7ZY7HewJV9FJI9CFZ4ZDLc8VCxJWF2iXCo2pXt8aFJWTBVmjR6
	 sKVUN5Imv8qQybzHgLT39q0n3qYGEkrn1S1EGXhLg3QRLlivKQzt51fHivkodWRWUx
	 lgLy/soFIGAyHjSXZe8ewJke5/KpKmBF8ocVqInQ=
Message-ID: <043ff7ce-7543-407e-b879-6ed524df60e0@arm.com>
Date: Wed, 3 Jun 2026 16:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 08/44] arm64: RMI: Ensure that the RMM has GPT entries
 for memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-9-steven.price@arm.com> <868q9cx4ac.wl-maz@kernel.org>
 <e175cb7b-b4fa-4139-b46d-1986e2372d16@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <e175cb7b-b4fa-4139-b46d-1986e2372d16@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_084853_455076_4F5F74A3 
X-CRM114-Status: GOOD (  42.22  )
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

On 21/05/2026 16:39, Suzuki K Poulose wrote:
> On 21/05/2026 14:47, Marc Zyngier wrote:
>> On Wed, 13 May 2026 14:17:16 +0100,
>> Steven Price <steven.price@arm.com> wrote:
>>>
>>> The RMM maintains the state of all the granules in the system to make
>>> sure that the host is abiding by the rules. This state can be maintained
>>> at different granularity, per page (TRACKING_FINE) or per region
>>> (TRACKING_COARSE). The region size depends on the underlying
>>> "RMI_GRANULE_SIZE". For a "coarse" region all pages in the region must
>>> be of the same state, this implies we need to have "fine" tracking for
>>> DRAM, so that we can delegated individual pages.
>>>
>>> For now we only support a statically carved out memory for tracking
>>> granules for the "fine" regions. This can be extended in the future to
>>> allow modifying the tracking granularity and remove the need for a
>>> static allocation.
>>>
>>> Similarly, the firmware may create L0 GPT entries describing the total
>>> address space. But if we change the "PAS" (Physical Address Space) of a
>>> granule then the firmware may need to create L1 tables to track the PAS
>>> at a finer granularity.
>>>
>>> Note: support is currently missing for SROs which means that if the RMM
>>> needs memory donating this will fail (and render CCA unusable in Linux).
>>> This effectively means that the L1 GPT tables must be created before
>>> Linux starts.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v13:
>>>   * Moved out of KVM
>>> ---
>>>   arch/arm64/include/asm/rmi_cmds.h |   2 +
>>>   arch/arm64/kernel/rmi.c           | 103 ++++++++++++++++++++++++++++++
>>>   2 files changed, 105 insertions(+)
>>>
>>> diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/
>>> asm/rmi_cmds.h
>>> index 9179934925c5..9078a2920a7c 100644
>>> --- a/arch/arm64/include/asm/rmi_cmds.h
>>> +++ b/arch/arm64/include/asm/rmi_cmds.h
>>> @@ -33,6 +33,8 @@ struct rmi_sro_state {
>>>   } while (RMI_RETURN_STATUS(res.a0) == RMI_BUSY ||            \
>>>        RMI_RETURN_STATUS(res.a0) == RMI_BLOCKED)
>>>   +bool rmi_is_available(void);
>>> +
>>>   unsigned long rmi_sro_execute(struct rmi_sro_state *sro, gfp_t gfp);
>>>   void rmi_sro_free(struct rmi_sro_state *sro);
>>>   diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
>>> index a14ead5dedda..52a415e99500 100644
>>> --- a/arch/arm64/kernel/rmi.c
>>> +++ b/arch/arm64/kernel/rmi.c
>>> @@ -7,6 +7,8 @@
>>>     #include <asm/rmi_cmds.h>
>>>   +static bool arm64_rmi_is_available;
>>> +
>>>   unsigned long rmm_feat_reg0;
>>>   unsigned long rmm_feat_reg1;
>>>   @@ -88,6 +90,102 @@ static int rmi_configure(void)
>>>       return 0;
>>>   }
>>>   +/*
>>> + * For now we set the tracking_region_size to 0 for
>>> RMI_RMM_CONFIG_SET().
>>> + * TODO: Support other tracking sizes (via Kconfig option).
>>> + */
>>> +#ifdef CONFIG_PAGE_SIZE_4KB
>>> +#define RMM_GRANULE_TRACKING_SIZE    SZ_1G
>>> +#elif defined(CONFIG_PAGE_SIZE_16KB)
>>> +#define RMM_GRANULE_TRACKING_SIZE    SZ_32M
>>> +#elif defined(CONFIG_PAGE_SIZE_64KB)
>>> +#define RMM_GRANULE_TRACKING_SIZE    SZ_512M
>>> +#endif
>>
>> Basically, a level 2 mapping. Which means this whole block really is:
>>
>> #define RMM_GRANULE_TRAKING_SIZE    (2 * PAGE_SHIFT - 3)
>>
>> (adjust for D128 as needed).
> 
> True,

As Gavin pointed out we actually don't need this anymore because of the
move to a range based API.

It's also not quite that simple because for 4K PAGE_SIZED the RMM
doesn't support 2MB (which would be the level 2 size), instead jumping
to 1GB. And if we add a Kconfig option in the future then this could
change because of that.

For now I'll just delete this block since it's unused.

>>
>>> +
>>> +/*
>>> + * Make sure the area is tracked by RMM at FINE granularity.
>>> + * We do not support changing the tracking yet.
>>> + */
>>> +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t
>>> end)
>>> +{
>>> +    while (start < end) {
>>> +        unsigned long ret, category, state, next;
>>> +
>>> +        ret = rmi_granule_tracking_get(start, end, &category,
>>> &state, &next);
>>> +        if (ret != RMI_SUCCESS ||
>>> +            state != RMI_TRACKING_FINE ||
>>> +            category != RMI_MEM_CATEGORY_CONVENTIONAL) {
>>> +            /* TODO: Set granule tracking in this case */
>>> +            pr_err("Granule tracking for region isn't fine/
>>> conventional: %llx",
>>> +                   start);
>>> +            return -ENODEV;
>>
>> How is this triggered? Do we really need to spam the console with
>> this? A PA doesn't mean much, and there is no context (stack trace).

I'm not sure 1 message really counts as 'spam' - it provides the
information on why the RMI interface (and therefore realm guests) is
unavailable. The PA might help track down whether this physical region
was intended to be given to Linux.

> This could be triggered if the RMM doesn't have static carveout
> for tracking the DRAM granules. (state != RMI_TRACKING_FINE).
> This not worth WARN_ONCE(), we could simply not enable KVM.
> We plan to add support for donating memory to the RMM in
> the future. (Primarily we don't yet have an RMM implementation
> that does dynamic management via SRO. This can be added later
> as a separate series)

As Suzuki says - this case should be handled in the future - so it's a
limitation in the current implementation. So a WARN_ONCE is a bit strong
- it's not a "can never happen" situation - it's a "Linux doesn't
support this (yet)".

>>
>> If that's not expected, turn this into a WARN_ONCE().
> 
> 
> 
> 
>>
>>> +        }
>>> +        start = next;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static unsigned long rmi_l0gpt_size(void)
>>> +{
>>> +    return 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
>>> +                      rmm_feat_reg1));
>>> +}
>>> +
>>> +static int rmi_create_gpts(phys_addr_t start, phys_addr_t end)
>>> +{
>>> +    unsigned long l0gpt_sz = rmi_l0gpt_size();
>>> +
>>> +    start = ALIGN_DOWN(start, l0gpt_sz);
>>> +    end = ALIGN(end, l0gpt_sz);
>>> +
>>> +    while (start < end) {
>>> +        int ret = rmi_gpt_l1_create(start);
>>> +
>>> +        /*
>>> +         * Make sure the L1 GPT tables are created for the region.
>>> +         * RMI_ERROR_GPT indicates the L1 table already exists.
>>> +         */
>>> +        if (ret && ret != RMI_ERROR_GPT) {
>>> +            /*
>>> +             * FIXME: Handle SRO so that memory can be donated for
>>> +             * the tables.
>>> +             */
>>> +            pr_err("GPT Level1 table missing for %llx\n", start);
>>> +            return -ENOMEM;
>>
>> If any of this fails, where is the cleanup done? Is that part of the
>> missing SRO support that's indicated in the commit message?
>>
> 
> For now, there is no cleanup required. What we essentially do here is
> making sure that the GPT tables have been created upto L1 (i.e.,
> by checking ret == RMI_ERROR_GPT).
> 
> We do not donate any memory now, but only support RMMs with static
> memory carved out for L1 GPT. Support for dynamic RMMs could be added as
> a separate series, at which point, we could defer the table creation to
> the actual use case (e.g, RMI_GRANULE_DELEGATE).
> 
> Clean up would be required when we donate memory to the RMM.

The missing SRO support is why we're not donating memory - with that
missing the clean up is unnecessary as Suzuki says.

>>> +        }
>>> +        start += l0gpt_sz;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int rmi_init_metadata(void)
>>> +{
>>> +    phys_addr_t start, end;
>>> +    const struct memblock_region *r;
>>> +
>>> +    for_each_mem_region(r) {
>>> +        int ret;
>>> +
>>> +        start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
>>> +        end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
>>> +        ret = rmi_verify_memory_tracking(start, end);
>>> +        if (ret)
>>> +            return ret;
>>> +        ret = rmi_create_gpts(start, end);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>
>> How does this work with, say, memory hotplug?
> 
> Good point, we need a hook for hotpug to make sure this is taken care
> of. As mentioned above, when we add support for RMM with support for
> dynamic Tracking/GPT with SRO, this could be deferred to the actual
> use (handling RMI return codes, RMI_ERROR_TRACKING/RMI_ERROR_GPT)

Yep, that was an oversight - we definitely will need to handle hotplug.

Thanks,
Steve

> Suzuki
> 
> 
>>
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +bool rmi_is_available(void)
>>> +{
>>> +    return arm64_rmi_is_available;
>>> +}
>>> +
>>>   static int __init arm64_init_rmi(void)
>>>   {
>>>       /* Continue without realm support if we can't agree on a
>>> version */
>>> @@ -101,6 +199,11 @@ static int __init arm64_init_rmi(void)
>>>         if (rmi_configure())
>>>           return 0;
>>> +    if (rmi_init_metadata())
>>> +        return 0;
>>> +
>>> +    arm64_rmi_is_available = true;
>>> +    pr_info("RMI configured");
>>>         return 0;
>>>   }
>>
>> Thanks,
>>
>>     M.
>>
> 


