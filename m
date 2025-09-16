Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84B1CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phDp4VnCXN9xpbEyamDNS1NPHJ+wYuQ3EZcaTqxylTM=; b=ehsndSJHuRx4ykZgLLGRZod+O9
	wJxPow1yQLeSTKOPwQZNQ62DF7zry67cfm4C7rg2R6xyF0NcFJtJG+hWc0XWFthUMvYhl7AahtG6d
	FJUj/jDKZyB/sboMTGELPNu5CLWhoB0/CT095i3DKMttA9aVt1CLE4HNkigLxIBScTAANXYPoZO+z
	VkUnmSii50MHQ+YgLPryT1MH3zTjCdfgtkLo/6zx94qAhVvPMpUP8i6MeEKk0Yg5UIHqOMAEhm1UZ
	/vlccCye4c68CXDJOzNEGsxSiEmWb5mrpyx6eKyBMNd0ilAjo/cBuBCTrKkcHWFOgLoqI5vqT/rC9
	l2uAS+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWc2-000000086Y1-1XaO;
	Tue, 16 Sep 2025 14:24:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWbz-000000086X1-3oja
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:24:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45f28aba94cso55055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758032690; x=1758637490; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phDp4VnCXN9xpbEyamDNS1NPHJ+wYuQ3EZcaTqxylTM=;
        b=E1dHTzhWj88kFnzsSXQXiD7bZ6wYfaiJDAqr7SPdkCApLhJ9EEcrJzWUHvYexQqBEN
         nuk7s4fvNvjZj4fs2XM67H1ak1Jin24vWW48qAE1xgxVgBBHhhcFZVHydDttFSYc9lLT
         d017P0D58k2hvSpuYPDYE22naskwPJ/KIzqgBPThGo4tHOj8XebFPMuNUlCz6HjfdNEx
         OJv07ryjKhYwlPNhN9tV6JDT/hTACl4AFM3MHb5E8R3xsfP1uzVRnRNjqZ/VsPybcubn
         ge75Gs4AeXXD5Y3E0q8MqPR4r02z/J1C6teSu3QeeMWswkcG/Thv8Dh+c1PkVsOQCn00
         YY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032690; x=1758637490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phDp4VnCXN9xpbEyamDNS1NPHJ+wYuQ3EZcaTqxylTM=;
        b=FUV02zoa75JuYjrjltOe6FKn6TX92zr+IMYG4Y3bMdlP1pyexomQ+yEntr4STt2IEG
         HN6odC+d+mekzj95eDIQ8PfHbMHbbydSSRw9utmvLb+rNjcIR1A6WF9gcvdYh9Fja2AR
         /zdlHloUzYqhpeb5ddlX7U02TFQ2Qt9wa4WMqxO2j+yGv3vvWkblNYuVK3bYiggS/cYA
         RqX5J3DPCgFSIJEILCN8VX4XRHN82K84TBuY9CB46aFvps/b9I8ltkbd2gqaYc9e+r1t
         SQnhALgTTkgfnEmz1sAL3Ka3zglrIIX6z6KUaNkX+Q4EZ/+fFcM68L9HPH10mMFU51gN
         faBw==
X-Forwarded-Encrypted: i=1; AJvYcCU6emiITJDw5ZT27OJasf+GCko9RWO/eBMNoLoK832KL30jbN0m4IyNNbUiwD5d5YBz6DD7J+zkMJF9YXp44ayy@lists.infradead.org
X-Gm-Message-State: AOJu0YzS72NAZGQTYKi8+cj0GtZPF7qrdaWvB28KqGdNJSS2ktB8OAtS
	4texuxBk8KkdsE0Br2slOvTBjvuzq+hGj7bJhFndCPIlRE3cfRYtpCQNfUBjfMZcLg==
X-Gm-Gg: ASbGnctiuzzDXDtT/qNSTYFcSm4NjAeSJsL4UuPXEKvnBHoW8yTBs+g25JCfoNzw7gz
	nfEm/SLNC35/01xe8W5gYCy1T5jQLDjUQZR3AHJbBRB5arii7kyT20oAIKUdegdCRa9wv1EJDtm
	XyiL1768Ebeb9Gsx70mvQUY+gHf+c/AkvU5n+HWf3hkYr2doNcxNvzlAYxvySKdG+e2m9C0y6sd
	0DIBHhuo3f0cXhSWfb6uRT9HTWiyP9+TmaqZDhojnbXII3kE/3RFHZU3bzkXKOtoqXob6tdiNpN
	UO4Qjoz6hrMXJc2OgmqIuwh3cCvBnwgMZeOTqyEf+kTPXD58bmuSF170EymJByudsI478LgsAYD
	tJlLNItM0zYeXsJvl+fyGT+h3AWuzgrCyxTHm0DKBqxLUX0ZDC9m3958RHb5h68lRleuyYksbOn
	x8vV1fKiaTD5y//FE=
X-Google-Smtp-Source: AGHT+IGY+tRtVLT/xfCf+KRVVpAwIAtGnuReJMbcXmJZJALHm+2tVODOb2attNahOqJDhG6WrbUOoA==
X-Received: by 2002:a05:600c:3b85:b0:45c:b4fb:f0b3 with SMTP id 5b1f17b1804b1-45f3278c3admr1416035e9.3.1758032689764;
        Tue, 16 Sep 2025 07:24:49 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea4b52b7fcsm9859169f8f.33.2025.09.16.07.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:24:49 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:24:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 10/28] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <aMlzLsj5slPQhWEr@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-11-smostafa@google.com>
 <aMA8vz0v0Vn-02QP@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMA8vz0v0Vn-02QP@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_072451_993163_4A8008CF 
X-CRM114-Status: GOOD (  40.29  )
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

On Tue, Sep 09, 2025 at 03:42:07PM +0100, Will Deacon wrote:
> On Tue, Aug 19, 2025 at 09:51:38PM +0000, Mostafa Saleh wrote:
> > Create a shadow page table for the IOMMU that shadows the
> > host CPU stage-2 into the IOMMUs to establish DMA isolation.
> > 
> > An initial snapshot is created after the driver init, then
> > on every permission change a callback would be called for
> > the IOMMU driver to update the page table.
> > 
> > For some cases, an SMMUv3 may be able to share the same page
> > table used with the host CPU stage-2 directly.
> > However, this is too strict and requires changes to the core hypervisor
> > page table code, plus it would require the hypervisor to handle IOMMU
> > page faults. This can be added later as an optimization for SMMUV3.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/iommu.h |  4 ++
> >  arch/arm64/kvm/hyp/nvhe/iommu/iommu.c   | 83 ++++++++++++++++++++++++-
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c   |  5 ++
> >  3 files changed, 90 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> > index 1ac70cc28a9e..219363045b1c 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> > @@ -3,11 +3,15 @@
> >  #define __ARM64_KVM_NVHE_IOMMU_H__
> >  
> >  #include <asm/kvm_host.h>
> > +#include <asm/kvm_pgtable.h>
> >  
> >  struct kvm_iommu_ops {
> >  	int (*init)(void);
> > +	void (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
> >  };
> >  
> >  int kvm_iommu_init(void);
> >  
> > +void kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> > +				 enum kvm_pgtable_prot prot);
> >  #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > index a01c036c55be..f7d1c8feb358 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > @@ -4,15 +4,94 @@
> >   *
> >   * Copyright (C) 2022 Linaro Ltd.
> >   */
> > +#include <linux/iommu.h>
> > +
> >  #include <nvhe/iommu.h>
> > +#include <nvhe/mem_protect.h>
> > +#include <nvhe/spinlock.h>
> >  
> >  /* Only one set of ops supported */
> >  struct kvm_iommu_ops *kvm_iommu_ops;
> >  
> > +/* Protected by host_mmu.lock */
> > +static bool kvm_idmap_initialized;
> > +
> > +static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
> > +{
> > +	int iommu_prot = 0;
> > +
> > +	if (prot & KVM_PGTABLE_PROT_R)
> > +		iommu_prot |= IOMMU_READ;
> > +	if (prot & KVM_PGTABLE_PROT_W)
> > +		iommu_prot |= IOMMU_WRITE;
> > +	if (prot == PKVM_HOST_MMIO_PROT)
> > +		iommu_prot |= IOMMU_MMIO;
> 
> This looks a little odd to me.
> 
> On the CPU side, the only different between PKVM_HOST_MEM_PROT and
> PKVM_HOST_MMIO_PROT is that the former has execute permission. Both are
> mapped as cacheable at stage-2 because it's the job of the host to set
> the more restrictive memory type at stage-1.
> 
> Carrying that over to the SMMU would suggest that we don't care about
> IOMMU_MMIO at stage-2 at all, so why do we need to set it here?

Unlike the CPU, the host can set the SMMU to bypass, in that case the
hypervisor will attach its stage-2 with no stage-1 configured. So,
stage-2 must have the correct attrs for MMIO.

> 
> > +	/* We don't understand that, might be dangerous. */
> > +	WARN_ON(prot & ~PKVM_HOST_MEM_PROT);
> > +	return iommu_prot;
> > +}
> > +
> > +static int __snapshot_host_stage2(const struct kvm_pgtable_visit_ctx *ctx,
> > +				  enum kvm_pgtable_walk_flags visit)
> > +{
> > +	u64 start = ctx->addr;
> > +	kvm_pte_t pte = *ctx->ptep;
> > +	u32 level = ctx->level;
> > +	u64 end = start + kvm_granule_size(level);
> > +	int prot =  IOMMU_READ | IOMMU_WRITE;
> > +
> > +	/* Keep unmapped. */
> > +	if (pte && !kvm_pte_valid(pte))
> > +		return 0;
> > +
> > +	if (kvm_pte_valid(pte))
> > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > +	else if (!addr_is_memory(start))
> > +		prot |= IOMMU_MMIO;
> 
> Why do we need to map MMIO regions pro-actively here? I'd have thought
> we could just do:
> 
> 	if (!kvm_pte_valid(pte))
> 		return 0;
> 
> 	prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte);
> 	kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> 	return 0;
> 
> but I think that IOMMU_MMIO is throwing me again...

We have to map everything pro-actively as we don’t handle page faults
in the SMMUv3 driver.
This would be a future work where the CPU stage-2 page table is shared with
the SMMUv3.

Thanks,
Mostafa

> 
> Will

