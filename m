Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD26CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3pORT8MRyPPJkeRnXsygr7iJGGqhaxubZR9jjt6cbk=; b=F3akR/mOhP/c3TAUyHXFYndFEB
	uBhuar/Yn28dbLVstq/CiSyxY4HI144LPJzkcLiJwHFPm6dVhaej7WCwPMpx0KcnhR50+YpcV3LPW
	9PWGF11skpL0dlPMeWZlYhSe6hc3/522ABRk5GyPiS/wpf7fQv+AynKbiplqQxOxH9ZdzDpt7+KCw
	mMW4Q55UfkjY8aWr8RKpWH2LRmgGTRJJyzg9Yb/vO0O+SzHx6xJJEPzNI4B9Y6LEybH4kM2WuykQc
	AVhHQZgW2qGvk19jpKdGfyPYKZWi35dXFdM0vOG0UkfuS6zY6cI5ufGcX6+eTaFWDuHLxAvsUNjMS
	CoT63grw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDllk-0000000Gr8z-1AMb;
	Mon, 05 Oct 2026 16:42:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDllg-0000000Gr7a-0oeA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 16:42:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B02D152B;
	Mon,  5 Oct 2026 09:42:18 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BD493F66F;
	Mon,  5 Oct 2026 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791218541; bh=2BnlRaekwJa1zpDI6gqSZacNqin8Ey/6G0b7goZB50g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qyhDh8CBsi951EOcBfBUDIHumzCLo47ccOMIUJDsSuohreAS7MXXrJo4dOkI8aj4O
	 MrB+rBKHKC8Y6BoNArUQec2mz+M0U8RjTpFR6eod3zbw0+MlftqBbASthksqHol57V
	 sbEGMZlCj5sszfJ4YWbwnh4qxo7TJGzUXBK2ZdHU=
Message-ID: <92758f79-d5b7-4c15-a55d-6bea5f84a028@arm.com>
Date: Mon, 5 Oct 2026 17:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
To: Daniel Mentz <danielmentz@google.com>, iommu@lists.linux.dev
Cc: will@kernel.org, joro@8bytes.org, nicolinc@nvidia.com,
 smostafa@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dawei.li@linux.dev, jgg@ziepe.ca,
 praan@google.com
References: <20261004195027.227748-1-danielmentz@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261004195027.227748-1-danielmentz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_094224_400316_AF417ADD 
X-CRM114-Status: GOOD (  26.97  )
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

On 04/10/2026 8:50 pm, Daniel Mentz wrote:
> The SMMU specification defines several types of SMMU-originated memory
> accesses, including Stage 1 and Stage 2 translation table walks, stream
> table accesses (L1STD and STE fetches), CD table accesses (L1CD and CD
> fetches), and queue accesses (CMDQ fetch, EVENTQ write, PRIQ write).
> 
> While the memory attributes used for Stage 1 and Stage 2 translation
> table walks are configured in io-pgtable-arm based on whether the SMMU
> is coherent (ARM_SMMU_FEAT_COHERENCY), the attributes for stream tables,
> CD tables, and queues are currently hardcoded to Inner Shareable,
> Write-Back.
> 
> On non-coherent systems, however, memory for stream tables, CD tables,
> and queues is allocated via dma_alloc_coherent() /
> dmam_alloc_coherent(), which provides CPU mappings with Normal
> Non-Cacheable attributes. Having a non-coherent SMMU access these
> buffers with Inner Shareable, Write-Back attributes results in
> mismatched memory attributes between the CPU and the SMMU.
> 
> Configure the memory attributes for tables and queues in
> arm_smmu_device_reset() and arm_smmu_make_cdtable_ste() based on
> ARM_SMMU_FEAT_COHERENCY, matching the attributes used for translation
> table walks:

This still isn't answering the question of "why?" though. Yes the 
architecture says some things, but if we were strict about avoiding 
mismatched attributes then Linux couldn't ever support non-coherent DMA 
at all! Similarly while the architecture does permit SMMU 
implementations to be picky about their output attributes, does any such 
implementation actually exist at all, let alone in a system capable of 
running mainline Linux?

And yes, io-pgtable-arm does happen to be a little more fastidious with 
attributes, but that is more to do with Qualcomm SMMUv2 platforms that 
gave a magic meaning to the outer-cacheable attribute on a 
still-otherwise-non-coherent downstream interconnect - which we support 
via IO_PGTABLE_QUIRK_ARM_OUTER_WBWA - but is not directly relevant to 
arm-smmu-v3 itself.

So, short of a justification why it is unavoidably _necessary_ to change 
an assumption that in practice has held since day one, I'm still going 
to hold the opinion that at worst this smells like a sneaky hack around 
DT/ACPI describing coherency incorrectly, which really should be fixed 
in the firmware; or at best is just churn for no practical benefit that 
will only help hide that bug in future. And if someone does have a 
justifiable use-case for wanting to use a coherent SMMU non-coherently, 
then it's all the more reason to add proper DMA API support for that 
rather than bodging firmware to try to trick Linux, as there's already a 
wishlist of similar use-cases (PCIe No Snoop, Panfrost's tiler heap, etc.)

Thanks,
Robin.

> - In SMMU_CR1, use Outer Shareable, Non-Cacheable for non-coherent
>    SMMUs, while retaining Inner Shareable, Write-Back for coherent SMMUs.
>    This applies to stream table accesses as well as queue accesses (CMDQ
>    fetch, EVENTQ write, PRIQ write).
> - In STE.{S1CIR, S1COR, S1CSH}, use Outer Shareable, Non-Cacheable for
>    non-coherent SMMUs, while retaining Inner Shareable, Write-Back
>    Read-Allocate for coherent SMMUs. This applies to CD table accesses.
> 
> Assisted-by: LLM
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Daniel Mentz <danielmentz@google.com>
> ---
> Changes in v2:
> - Rename local variables 'cache' and 'sh' to 'cr1_cache' and 'cr1_sh' in
>    arm_smmu_device_reset() (Nicolin, Will)
> - Collect Reviewed-by from Nicolin
> - Link to v1: https://lore.kernel.org/linux-iommu/20260929032229.3532247-1-danielmentz@google.com/
> 
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++------
>   1 file changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 34e916ea339f..02cc6fb83461 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1905,6 +1905,15 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
>   {
>   	struct arm_smmu_ctx_desc_cfg *cd_table = &master->cd_table;
>   	struct arm_smmu_device *smmu = master->smmu;
> +	u64 s1c, s1csh;
> +
> +	if (smmu->features & ARM_SMMU_FEAT_COHERENCY) {
> +		s1c = STRTAB_STE_1_S1C_CACHE_WBRA;
> +		s1csh = ARM_SMMU_SH_ISH;
> +	} else {
> +		s1c = STRTAB_STE_1_S1C_CACHE_NC;
> +		s1csh = ARM_SMMU_SH_OSH;
> +	}
>   
>   	memset(target, 0, sizeof(*target));
>   	target->data[0] = cpu_to_le64(
> @@ -1916,9 +1925,9 @@ void arm_smmu_make_cdtable_ste(struct arm_smmu_ste *target,
>   
>   	target->data[1] = cpu_to_le64(
>   		FIELD_PREP(STRTAB_STE_1_S1DSS, s1dss) |
> -		FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> -		FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> -		FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
> +		FIELD_PREP(STRTAB_STE_1_S1CIR, s1c) |
> +		FIELD_PREP(STRTAB_STE_1_S1COR, s1c) |
> +		FIELD_PREP(STRTAB_STE_1_S1CSH, s1csh) |
>   		((smmu->features & ARM_SMMU_FEAT_STALLS &&
>   		  !master->stall_enabled) ?
>   			 STRTAB_STE_1_S1STALLD :
> @@ -5102,7 +5111,7 @@ static void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
>   static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   {
>   	int ret;
> -	u32 reg, enables;
> +	u32 reg, enables, cr1_cache, cr1_sh;
>   
>   	/* Clear CR0 and sync (disables SMMU and queue processing) */
>   	reg = readl_relaxed(smmu->base + ARM_SMMU_CR0);
> @@ -5116,12 +5125,20 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   		return ret;
>   
>   	/* CR1 (table and queue memory attributes) */
> -	reg = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
> -	      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
> -	      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
> -	      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
> -	      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
> -	      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
> +	if (smmu->features & ARM_SMMU_FEAT_COHERENCY) {
> +		cr1_cache = CR1_CACHE_WB;
> +		cr1_sh = ARM_SMMU_SH_ISH;
> +	} else {
> +		cr1_cache = CR1_CACHE_NC;
> +		cr1_sh = ARM_SMMU_SH_OSH;
> +	}
> +
> +	reg = FIELD_PREP(CR1_TABLE_SH, cr1_sh) |
> +	      FIELD_PREP(CR1_TABLE_OC, cr1_cache) |
> +	      FIELD_PREP(CR1_TABLE_IC, cr1_cache) |
> +	      FIELD_PREP(CR1_QUEUE_SH, cr1_sh) |
> +	      FIELD_PREP(CR1_QUEUE_OC, cr1_cache) |
> +	      FIELD_PREP(CR1_QUEUE_IC, cr1_cache);
>   	writel_relaxed(reg, smmu->base + ARM_SMMU_CR1);
>   
>   	/* CR2 (random crap) */


