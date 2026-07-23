Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1098C531D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHtkaJhyp7hvNXFM/a/du/ejeo788OAfuxw7sqTwA3Q=; b=Fayd7lPomVv095HiEAxParmNde
	ZTgr5H6BU1F4YfwRhoGUGwUw6lB59Q4fZvF/LKJVekuOZtr/bPp+0UbKHk94qyplrqZepnHVLmckZ
	qh2I89yjBVptBF9IYBH211HpePprGg7bIIQhhRvMV/QQMVG1gp7Aq/OtYHuBwnF0DHsIE3nW1b/8I
	ymA2Zo2KhN/k6kErg0KZe/WblGj2+pts9AahsyOXfRr+/8L38MDB9rZDneTIb2iJtlbHHhMdSUIrs
	+SUg4a1Y04ivegy8vG7z/ra3Y3R5vSSwfjZCcnQteoD2WYYnVEyl8YmiUsrqHGDcGA/2bM73Cmp+n
	SeKIDwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmv9Q-0000000EZch-0owW;
	Thu, 23 Jul 2026 15:15:56 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmv9N-0000000EZbn-2uiW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:15:54 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-69a19eb2e6dso10591a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784819752; x=1785424552; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHtkaJhyp7hvNXFM/a/du/ejeo788OAfuxw7sqTwA3Q=;
        b=tTSaBrJJHy38/Znh96Zb7hTDga8LNC17/f9mEMbyHaqv/VoqqJYmBa1RZU8geLt1ue
         B/Epx3sZLM36MlQbOGICBV0cZqhM9VadwFbw8OWUhRXqhBeHaG2VcR0dyAaD0Gx9JvrZ
         vKs9yIRVSXb9vKsTbQ7nRmJ+edSYxJAJCt4h+6dxWX2QVfb/rDzMoInVZIJHAdjbkuTE
         wXdg1HY6KWTVLhYtIgkZUGqBPGVe3nmZMwDed5lLMDDO/6aWMGYyMdewSBcmulqwWgUN
         lm1kHT6qnrP0uzqWyumuKncNsJKAsl7HgmBTeOzQidAt3yApo0Kp1qFpqwIAnMQhcQ90
         8Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819752; x=1785424552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHtkaJhyp7hvNXFM/a/du/ejeo788OAfuxw7sqTwA3Q=;
        b=oq9uTUgXHuG5vPy+6tCER4k3cF7ctFP6tRdtTEB1LVoGDXABzK6k7evRhtLgiLreCO
         CeG/Pueu5AiUOiT+Sn5JG75URUOScSMJnW09uYvC7b7oZ7pGrTeSEWRxfWH/EIsnTU1R
         tLklAUol49wTbq6UKmjqt8PjNzogSJ7kgV6BwYWawjBSKuOOqlfKO7Qd7PYE/l0k5ogD
         KopTw2ReuROdKPZLx+RSEoFatrbponhfrHpfHIbmODjQ5loxJbIbLEvzdGesunP32j0z
         DKFUqHojcYcHgOL5fZ35M3k3Ym6ETQWS/bTxKUYEFtxHT5qZlVjSDOcCCp4iRM9O503z
         C0cQ==
X-Gm-Message-State: AOJu0YyyMwGtES0bdVtcg1FW4KWuetdijotalFmNmLOdRNXpoHgsI7Qn
	BGqgY28Gm9Kyxq36uQCbimBOWMBmKcD6PHyelS2qXXMV2pwFsL1I8Kn38/DkubzDIw==
X-Gm-Gg: AR+sD12izS48Zs+fCqCHu1COBF6UnnJbR0E6wdMv4ZM2w+wGCoqvMhkBlC8jKCwE6md
	EyoMrxReu0/tNDq8poO48Up9TFzPgiLrCmdtqq0Vei/OVej2j5fouxtdBIqBc0I0XicYczEfzDm
	nxzeXHTLgAvplget0kh4EhrW6OWWvUIwCUE0fq0W93+2JrKnj6Y1Z2wIkPRnGax9Rm6WkoV0djk
	cdWJIYMy7ws2WoRO0aWFh/YDS5NGEQsfhggVoppXOUsxHxXRfoJ4fdwPpL5UMNjYnxeJynOcUvP
	9zQ71rZT18RV6GKr4OvINZbRY7Pbi/jc1iycMU7y1H/UplvzkMBZHDvjs+EwS0qVi8hyO2NTQWG
	xcnjdOmYFmqcehBP+fdcPnC6sPxBTnEZp1jx+51hkKbi80jZy4DqwUUute9eSD9SRcRf8oASrFV
	AWXmCxsjBZVi9rK1SHwJjp7srpOkQxarmlEhVVfA==
X-Received: by 2002:a05:6402:a6c9:20b0:697:5678:bc77 with SMTP id 4fb4d7f45d1cf-69f6cd0cdb9mr48696a12.9.1784819751162;
        Thu, 23 Jul 2026 08:15:51 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b9b064sm2548716a12.11.2026.07.23.08.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:15:48 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:15:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, keirf@google.com
Subject: Re: [PATCH v7 14/24] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <amIwHukKBxPrq3WT@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-15-smostafa@google.com>
 <amIrTPWg3eEhu2m7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amIrTPWg3eEhu2m7@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_081553_777525_F32CC139 
X-CRM114-Status: GOOD (  33.57  )
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

Hi Seb,

On Thu, Jul 23, 2026 at 02:55:08PM +0000, Sebastian Ene wrote:
> On Wed, Jul 15, 2026 at 11:58:55AM +0000, Mostafa Saleh wrote:
> > +	 * size as the host.
> > +	 * Only populate base_dma and llq.max_n_shift, the hypervisor will init
> > +	 * the rest.
> > +	 */
> > +	cmdq_base = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, SMMU_KVM_CMDQ_ORDER);
> > +	if (!cmdq_base)
> > +		return -ENOMEM;
> 
> Hi Mostafa,
> 
> Isn't this over-allocating when PAGE_SIZE > 4kB ? 

Yes, that means the queue have different size depending on PAGE_SIZE,
In the kernel driver CMDQ_MAX_SZ_SHIFT is defined in terms of page
size also, but I think in the hypervisor it doesn't really matter,
I can change this to a fixed size and use alloc_pages_exact().

> 
> > +
> > +	smmu->cmdq.base_dma = virt_to_phys(cmdq_base);
> > +	smmu->cmdq.llq.max_n_shift = SMMU_KVM_CMDQ_ORDER + PAGE_SHIFT - CMDQ_ENT_SZ_SHIFT;
> > +
> >  	if (of_dma_is_coherent(dev->of_node))
> >  		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
> >  
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > index af06c832fc6f..9f76f4e82341 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > @@ -11,7 +11,6 @@
> >  #include <nvhe/trap_handler.h>
> >  
> >  #include "arm_smmu_v3.h"
> > -#include "../arm-smmu-v3.h"
> >  
> >  size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
> >  struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
> > @@ -21,10 +20,68 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
> >  	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
> >  	     (smmu)++)
> >  
> > +#define cmdq_size(cmdq)	((1 << ((cmdq)->llq.max_n_shift)) * CMDQ_ENT_DWORDS * 8)
> > +
> > +static bool is_cmdq_enabled(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	return FIELD_GET(CR0_CMDQEN, smmu->cr0);
> > +}
> > +
> > +/*
> > + * CMDQ, STE host copies are accessed by the hypervisor, we share them to
> > + * - Prevent the host from passing protected VM memory.
> > + * - Having them mapped in the hyp page table.
> > + */
> > +static int smmu_share_pages(phys_addr_t addr, size_t size)
> > +{
> > +	size_t nr_pages = PAGE_ALIGN(size + (addr & ~PAGE_MASK)) >> PAGE_SHIFT;
> > +	phys_addr_t base = addr & PAGE_MASK;
> > +	int i, ret;
> > +
> > +	for (i = 0 ; i < nr_pages ; ++i) {
> > +		if (__pkvm_host_share_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT)) {
> > +			while (i--)
> > +				__pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
> > +			return -EPERM;
> > +		}
> > +	}
> > +
> > +	ret = hyp_pin_shared_mem(hyp_phys_to_virt(base),
> > +				 hyp_phys_to_virt(base + nr_pages * PAGE_SIZE));
> > +	if (ret) {
> > +		for (i = 0 ; i < nr_pages ; ++i)
> > +			__pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int smmu_unshare_pages(phys_addr_t addr, size_t size)
> > +{
> > +	size_t nr_pages = PAGE_ALIGN(size + (addr & ~PAGE_MASK)) >> PAGE_SHIFT;
> > +	phys_addr_t base = addr & PAGE_MASK;
> > +	int i, ret;
> > +
> > +	hyp_unpin_shared_mem(hyp_phys_to_virt(base),
> > +			     hyp_phys_to_virt(base + nr_pages * PAGE_SIZE));
> > +
> > +	for (i = 0 ; i < nr_pages ; ++i) {
> > +		ret = __pkvm_host_unshare_hyp((base + i * PAGE_SIZE) >> PAGE_SHIFT);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /* Put the device in a state that can be probed by the host driver. */
> >  static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
> >  {
> >  	WARN_ON(__pkvm_hyp_donate_host_mmio(smmu->mmio_addr, smmu->mmio_size));
> > +
> > +	if (smmu->cmdq.base)
> > +		WARN_ON(__pkvm_hyp_donate_host(smmu->cmdq.base_dma >> PAGE_SHIFT,
> > +					       cmdq_size(&smmu->cmdq) >> PAGE_SHIFT));
> >  	smmu->base = NULL;
> >  }
> >  
> > @@ -75,6 +132,31 @@ static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * The kernel part of the driver will allocate the shadow cmdq,
> > + * and zero it. This function only donates it.
> > + */
> > +static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	size_t cmdq_nr_pages = cmdq_size(&smmu->cmdq) >> PAGE_SHIFT;
> > +	int ret;
> > +
> > +	ret = __pkvm_host_donate_hyp(smmu->cmdq.base_dma >> PAGE_SHIFT, cmdq_nr_pages);
> > +	if (ret)
> > +		return ret;
> > +
> > +	smmu->cmdq.base = hyp_phys_to_virt(smmu->cmdq.base_dma);
> > +	smmu->cmdq.prod_reg = smmu->base + ARM_SMMU_CMDQ_PROD;
> > +	smmu->cmdq.cons_reg = smmu->base + ARM_SMMU_CMDQ_CONS;
> > +	smmu->cmdq.q_base = smmu->cmdq.base_dma |
> > +			    FIELD_PREP(Q_BASE_LOG2SIZE, smmu->cmdq.llq.max_n_shift);
> > +	smmu->cmdq.ent_dwords = CMDQ_ENT_DWORDS;
> > +	writel_relaxed(0, smmu->cmdq.prod_reg);
> > +	writel_relaxed(0, smmu->cmdq.cons_reg);
> > +	writeq_relaxed(smmu->cmdq.q_base, smmu->base + ARM_SMMU_CMDQ_BASE);
> 
> do we need a dsb here ?

I do not think so, why would it be needed? No data written at this
point. When commands are written, writel() is used to advance the
queue pointer which includes a barrier to enusre that the commands
are observed.

Thanks,
Mostafa


> 
> 
> Thanks,
> Sebastian

