Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA6AC531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWiE+gZupwsq77eqDfEJHNHYTUyi3IZVl5QUpf6vBbU=; b=o7Wv+7YUu6J+OEhkqPfsRblswQ
	RpHQYIXKCxvMsLVSfivhTU/Z1MX+OLErU33nGouuPUzak25A9tydZmtNvlnzLqOqVUeaujb78fFlU
	Es+SkRwa4n5459DopJdVMJCOWUYy/6H+E0wFQ99zTCIaonMZQnniQMmUSl+c4xHTvAtKi8Do241zG
	qKyeYoo3uVnMzBEYBhJDEnbKFeo0xgsy5hxQ8FcvDlKYdk5e42kRb+zB05mSuP7C1KRdU4MWad52x
	Z3A2Qlc9SqL5Vzf9Ifq3Q2c01tvGX3rdHIf1w4y2HPSouvDLfFnk3c+PLEJE/PWYD8nCovYXE0m6i
	iwvI+H5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmupV-0000000EXcO-2IiL;
	Thu, 23 Jul 2026 14:55:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmupS-0000000EXc1-0pjb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:55:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso72005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784818515; x=1785423315; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWiE+gZupwsq77eqDfEJHNHYTUyi3IZVl5QUpf6vBbU=;
        b=U7A7UxJOTey/RuRiTmLgvSKJwBgJyYeadnmS86vPc9d7f90FYK9tDde5/Ipj+Pmh3x
         fFx7zqwEpWaSjQJ7lHLpFAQEJSMrSkW0jWNZuR26J3ihp8czMBJUbepkAEphG2h884zl
         Gun0LGYinVXcOu437F1FZDqB2f8nAtHiGQt226QZ8F33Pzz5JjGSUG4K6wjCoRSlve6e
         eSiJEi3wFblHzdDhkoZjEiaPcCdP37oJ+dIrHfwg1Rmf6YJOozhpPEUAeexPlU7wbf8F
         rCUcT+B7vA9k/onRehr/NvftrdZP9+WATngNAog6VVTvzbOqUEm1aqp4MDRYMivPPO56
         hPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784818515; x=1785423315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QWiE+gZupwsq77eqDfEJHNHYTUyi3IZVl5QUpf6vBbU=;
        b=IP48UQ7ZhjXZQ2Pm+G2sNSsOeSX4JKBH4trjOVnpuqLIXLCxrHwJvLe1xYuz/vjMcQ
         XymR1KKHk2CqZomGXECnYQywpwijZEeRZ+a0i5Zx9aO+NlW2fqcw1aBJb7XG2b5tON3A
         0SyatXCgXWMN5aCKdS5vLSJs2EdM7PLRhxRgY6cKU5s5HKiBsz6u+s2dap0S83OGMR7B
         z69e6xYdRcGibhf5EWM8du0axoHbqPq6lBkzt5vMnSAJIrT9L5nisI9czjQL0IBkevOW
         uomjf2OS7qUJQ8ani+pbNpYXfpwidWZ35nPq5M4HCsCh0JlJpklBsXsZsmrlZ4m6/so7
         RTqw==
X-Gm-Message-State: AOJu0Yx109T00EW3RqzYDtLRdOw0/dhNyRNUXFmxD1mr/+RmsS6gnw1V
	Hw2nwBl1NQxVSaOMh1jJyjwVuUAzQkjNE7PsIt3i0sE4UFZ3QxqjYnbU/ukbFW2Lbw==
X-Gm-Gg: AR+sD12EODUHiOBLcgB/iydz5dwpb/iahD9ckuI0khY3Hn5ZUIde+kEt4l51BUG6TNe
	lQg6nY6KI1EP1ho4LsDChDvwbLkE/0n9MYXAvtgNe5KObmyAMMZXgCzYENLRaaK8mXkGN1GsFYJ
	fQAIdklX6jKyFG1L3GQXvpXeNQs8nKcG2qPjJ7Qa1QWZM1vZpJyCBjhxEs0Hpu3dUWg/2Tpcotk
	6JZekddqxXMBIJyG9g7XpcbFzPtCCiuh0Uy36L5287PgMtFKrVwDW5fMNTTXwtrq0+eZDC8Mjzz
	010z0w3Ll8ETP2es7sUsLRmvzS1qYjf8ha7bNE3DdQcu5SDHMX4pX7rs1Ru7/kLCBV/Y73OaTSi
	DEEjCj7CC05gRoC6Xu6rNmJmfB8EU7T32R0InQncUrn68OCcGVMs3aer9Q1BPNgtxk5Fxls3AIa
	FYwHA5YYtitojx1FntpvhfHWzJLtM44FehvqwHF3WzJFG3HBER9zCzmg==
X-Received: by 2002:a7b:c015:0:b0:493:be38:fa5a with SMTP id 5b1f17b1804b1-495738b2043mr1461805e9.10.1784818514584;
        Thu, 23 Jul 2026 07:55:14 -0700 (PDT)
Received: from google.com (145.16.38.34.bc.googleusercontent.com. [34.38.16.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531basm15867179f8f.19.2026.07.23.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:55:13 -0700 (PDT)
Date: Thu, 23 Jul 2026 14:55:08 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, keirf@google.com
Subject: Re: [PATCH v7 14/24] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <amIrTPWg3eEhu2m7@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-15-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715115906.2664882-15-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_075518_321998_0BA4DE58 
X-CRM114-Status: GOOD (  42.25  )
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

On Wed, Jul 15, 2026 at 11:58:55AM +0000, Mostafa Saleh wrote:
> At boot allocate a command queue per SMMU which is used as a shadow
> by the hypervisor.
> 
> The command queue size is 64K which is more than enough, as the
> hypervisor would consume all the entries per a command queue prod
> write, which means it can handle up to 4096 at a time.
> 
> Then, the host command queue needs to be pinned in a shared state, so
> it can't be donated to VMs, and avoid tricking the hypervisor into
> accessing them. This is done each time the command queue is enabled,
> and undone each time the command queue is disabled.
> The hypervisor won’t access the host command queue when it is disabled
> from the host.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   |  25 ++++
>  .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 123 +++++++++++++++++-
>  .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   8 ++
>  3 files changed, 155 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> index 68b78ed933d4..81a4cd539415 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> @@ -15,6 +15,8 @@
>  #include "arm-smmu-v3.h"
>  #include "pkvm/arm_smmu_v3.h"
>  
> +#define SMMU_KVM_CMDQ_ORDER				4
> +
>  extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
>  
>  static size_t				kvm_arm_smmu_count;
> @@ -24,6 +26,15 @@ static size_t				kvm_arm_smmu_cur;
>  static void kvm_arm_smmu_array_free(void)
>  {
>  	int order;
> +	int i;
> +
> +	for (i = 0 ; i < kvm_arm_smmu_cur ; ++i) {
> +		struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[i];
> +
> +		if (smmu->cmdq.base_dma)
> +			free_pages((unsigned long)phys_to_virt(smmu->cmdq.base_dma),
> +				   SMMU_KVM_CMDQ_ORDER);
> +	}
>  
>  	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
>  	free_pages((unsigned long)kvm_arm_smmu_array, order);
> @@ -70,6 +81,7 @@ static int smmuv3_nesting_probe(struct platform_device *pdev)
>  	struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
> +	void *cmdq_base;
>  
>  	/* Only device tree, ACPI not supported. */
>  	if (!dev->of_node)
> @@ -92,6 +104,19 @@ static int smmuv3_nesting_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * Allocate the shadow command queue, it doesn't have to be the same
> +	 * size as the host.
> +	 * Only populate base_dma and llq.max_n_shift, the hypervisor will init
> +	 * the rest.
> +	 */
> +	cmdq_base = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, SMMU_KVM_CMDQ_ORDER);
> +	if (!cmdq_base)
> +		return -ENOMEM;

Hi Mostafa,

Isn't this over-allocating when PAGE_SIZE > 4kB ? 

> +
> +	smmu->cmdq.base_dma = virt_to_phys(cmdq_base);
> +	smmu->cmdq.llq.max_n_shift = SMMU_KVM_CMDQ_ORDER + PAGE_SHIFT - CMDQ_ENT_SZ_SHIFT;
> +
>  	if (of_dma_is_coherent(dev->of_node))
>  		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> index af06c832fc6f..9f76f4e82341 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> @@ -11,7 +11,6 @@
>  #include <nvhe/trap_handler.h>
>  
>  #include "arm_smmu_v3.h"
> -#include "../arm-smmu-v3.h"
>  
>  size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
>  struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
> @@ -21,10 +20,68 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
>  	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
>  	     (smmu)++)
>  
> +#define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
> +
> +static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
> +{
> +	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
> +}
> +
> +/*
> + * CMDQ, STE host copies are accessed by the hypervisor, we share them to
> + * - Prevent the host from passing protected VM memory.
> + * - Having them mapped in the hyp page table.
> + */
> +static int smmu_share_pages(phys_addr_t addr, size_t size)
> +{
> +	size_t nr_pages = PAGE_ALIGN(size + (addr & ~PAGE_MASK)) >> PAGE_SHIFT;
> +	phys_addr_t base = addr & PAGE_MASK;
> +	int i, ret;
> +
> +	for (i = 0 ; i < nr_pages ; ++i) {
> +		if (__pkvm_host_share_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT)) {
> +			while (i--)
> +				__pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
> +			return -EPERM;
> +		}
> +	}
> +
> +	ret = hyp_pin_shared_mem(hyp_phys_to_virt(base),
> +				 hyp_phys_to_virt(base + nr_pages * PAGE_SIZE));
> +	if (ret) {
> +		for (i = 0 ; i < nr_pages ; ++i)
> +			__pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
> +	}
> +
> +	return ret;
> +}
> +
> +static int smmu_unshare_pages(phys_addr_t addr, size_t size)
> +{
> +	size_t nr_pages = PAGE_ALIGN(size + (addr & ~PAGE_MASK)) >> PAGE_SHIFT;
> +	phys_addr_t base = addr & PAGE_MASK;
> +	int i, ret;
> +
> +	hyp_unpin_shared_mem(hyp_phys_to_virt(base),
> +			     hyp_phys_to_virt(base + nr_pages * PAGE_SIZE));
> +
> +	for (i = 0 ; i < nr_pages ; ++i) {
> +		ret = __pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /* Put the device in a state that can be probed by the host driver. */
>  static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
>  {
>  	WARN_ON(__pkvm_hyp_donate_host_mmio(smmu->mmio_addr, smmu->mmio_size));
> +
> +	if (smmu->cmdq.base)
> +		WARN_ON(__pkvm_hyp_donate_host(smmu->cmdq.base_dma >> PAGE_SHIFT,
> +					       cmdq_size(&smmu->cmdq) >> PAGE_SHIFT));
>  	smmu->base = NULL;
>  }
>  
> @@ -75,6 +132,31 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
>  	return 0;
>  }
>  
> +/*
> + * The kernel part of the driver will allocate the shadow cmdq,
> + * and zero it. This function only donates it.
> + */
> +static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
> +{
> +	size_t cmdq_nr_pages = cmdq_size(&smmu->cmdq) >> PAGE_SHIFT;
> +	int ret;
> +
> +	ret = __pkvm_host_donate_hyp(smmu->cmdq.base_dma >> PAGE_SHIFT, cmdq_nr_pages);
> +	if (ret)
> +		return ret;
> +
> +	smmu->cmdq.base = hyp_phys_to_virt(smmu->cmdq.base_dma);
> +	smmu->cmdq.prod_reg = smmu->base + ARM_SMMU_CMDQ_PROD;
> +	smmu->cmdq.cons_reg = smmu->base + ARM_SMMU_CMDQ_CONS;
> +	smmu->cmdq.q_base = smmu->cmdq.base_dma |
> +			    FIELD_PREP(Q_BASE_LOG2SIZE, smmu->cmdq.llq.max_n_shift);
> +	smmu->cmdq.ent_dwords = CMDQ_ENT_DWORDS;
> +	writel_relaxed(0, smmu->cmdq.prod_reg);
> +	writel_relaxed(0, smmu->cmdq.cons_reg);
> +	writeq_relaxed(smmu->cmdq.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);

do we need a dsb here ?


Thanks,
Sebastian

> +	return 0;
> +}
> +
>  static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
>  {
>  	unsigned long haddr;
> @@ -94,7 +176,12 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
>  	if (ret)
>  		goto out_ret;
>  
> +	ret = smmu_init_cmdq(smmu);
> +	if (ret)
> +		goto out_ret;
> +
>  	return 0;
> +
>  out_ret:
>  	smmu_deinit_device(smmu);
>  	return ret;
> @@ -134,6 +221,23 @@ static int smmu_init(void)
>  	return ret;
>  }
>  
> +static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
> +{
> +	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
> +
> +	smmu->cmdq_host.llq.max_n_shift = min(shift, 19);
> +	smmu->cmdq_host.base_dma = smmu->cmdq_host.q_base & Q_BASE_ADDR_MASK;
> +	smmu->cmdq_host.base_dma &= ~(cmdq_size(&smmu->cmdq_host) - 1);
> +	WARN_ON(smmu_share_pages(smmu->cmdq_host.base_dma,
> +				 cmdq_size(&smmu->cmdq_host)));
> +}
> +
> +static void smmu_emulate_cmdq_disable(struct hyp_arm_smmu_v3_device *smmu)
> +{
> +	WARN_ON(smmu_unshare_pages(smmu->cmdq_host.base_dma,
> +				   cmdq_size(&smmu->cmdq_host)));
> +}
> +
>  static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
>  			     struct user_pt_regs *regs,
>  			     u64 esr, u32 off)
> @@ -160,6 +264,14 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
>  		break;
>  	/* Passthrough the register access for bisectiblity, handled later */
>  	case ARM_SMMU_CMDQ_BASE:
> +		if (is_write) {
> +			/* Not allowed by the architecture */
> +			if (is_cmdq_enabled(smmu))
> +				break;
> +			smmu->cmdq_host.q_base = val;
> +		}
> +		mask = read_write;
> +		break;
>  	case ARM_SMMU_CMDQ_PROD:
>  	case ARM_SMMU_CMDQ_CONS:
>  	case ARM_SMMU_STRTAB_BASE:
> @@ -170,6 +282,15 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
>  	case ARM_SMMU_CR0:
>  		if (len != sizeof(u32))
>  			break;
> +		if (is_write) {
> +			bool last_cmdq_en = is_cmdq_enabled(smmu);
> +
> +			smmu->cr0 = val;
> +			if (!last_cmdq_en && is_cmdq_enabled(smmu))
> +				smmu_emulate_cmdq_enable(smmu);
> +			else if (last_cmdq_en && !is_cmdq_enabled(smmu))
> +				smmu_emulate_cmdq_disable(smmu);
> +		}
>  		mask = read_write;
>  		break;
>  	case ARM_SMMU_CR1: {
> diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
> index 2bda6e03c96c..74a7f62d93eb 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
> @@ -8,6 +8,8 @@
>  #include <nvhe/spinlock.h>
>  #endif
>  
> +#include "../arm-smmu-v3.h"
> +
>  /*
>   * Parameters from the trusted host:
>   * @mmio_addr		base address of the SMMU registers
> @@ -22,6 +24,9 @@
>   * @lock		Lock to protect SMMU emulation
>   * @hw_lock		Lock to protect SMMU HW (as CMDQ)
>  			Order smmu.lock => host_mmu.lock => smmu.hw_lock
> + * @cmdq		CMDQ as observed by HW
> + * @cmdq_host		Host view of the CMDQ, only q_base and llq used.
> + * @cr0			Last value of CR0
>   */
>  struct hyp_arm_smmu_v3_device {
>  	phys_addr_t		mmio_addr;
> @@ -38,6 +43,9 @@ struct hyp_arm_smmu_v3_device {
>  	u32			lock;
>  	u32			hw_lock;
>  #endif
> +	struct arm_smmu_queue	cmdq;
> +	struct arm_smmu_queue	cmdq_host;
> +	u32			cr0;
>  };
>  
>  extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
> -- 
> 2.55.0.141.g00534a21ce-goog
> 

