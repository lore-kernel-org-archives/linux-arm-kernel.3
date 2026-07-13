Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0663C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DXPy0h679aPXo6JYjKQdkbMOuE0zeRtrYWKC8kOOJg=; b=DNv/8LolIJY2YGgUsKdfV+DEg2
	e8liQvXoLSIHrVDphvykekUQtAVYiHcTaXf695mRJD8g566vOxt/LFnE/4sEmUY5nXEfLw4UiK6KQ
	njY/bTGzmrB4S7BoOb9FQM7WVXc2mnkDALKSIm/pU9mvnB0+4P0ifL046fZixCS7iGqU9CGc9U26g
	4qW1tfmoj14JAq31WLzj2zYzPjnwu6xrhQvdJ8cFKR4k9KSLDIlQ/6WXf+yq0vT6DNnu+rCHs3X0m
	5nkLrwusNqQz1+GkY+Cx6Msctk0dOTs3L5XIEiBLnwVLkXGFWMCnb7LCPy684YgC5Jbl3UmJOsig2
	fwdKe+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjE0w-00000008uHo-2wiB;
	Mon, 13 Jul 2026 10:35:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjE0u-00000008uGz-0ZYq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:35:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b8d92a4eso84475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 03:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783938950; x=1784543750; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4DXPy0h679aPXo6JYjKQdkbMOuE0zeRtrYWKC8kOOJg=;
        b=bOeI3yG37Xq7TuEnYsb+Ga/EUqPyvwTqMFuTM/8aCYdDh2Om1JmnQvSW1MpBxFG4Bm
         hm87CYMyT3aGWQ3YBnksdhykrIZAKCPaFTeUh6ZxYJdHrRGxT6mVinuhs0niD8Vh2iVl
         WCwWBQtAZD8CjsN7vw61hn3FRgGxDtBzFlbzhUklx47zcS1g7ZtmGyR5yiKC5FQuBqnc
         RwOelHAy5EOGZWwj5+qrV66kMIfeVGGwqqXbPXe0M98ATUcZ7XFsp7ZBjc5A0SJqNlM/
         T+bOxzEdZvGKVtVJYgjKnc5dawDGwOEsvlSKRaUoOUbVDt5d08/jV85piH0eQdJpPyG8
         g9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938950; x=1784543750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4DXPy0h679aPXo6JYjKQdkbMOuE0zeRtrYWKC8kOOJg=;
        b=PytY2EFMoDp3Evr5s8hzsn23zuINpO7kwjgNWULv5ZY+8YOYnmInLCvgFEfbgM2Png
         jHg41/PrSzW4e2aNRmAzdhdN5iSQw1em6vYCdQhKIsPBTf2KI0Hwg51rbx49qheXrxmB
         noEUr14qN7kduv6lcrPBOJtzyP/q+bWu7cnSUdIrvnmR9wpHBivuHDpaAAcVcLNmvjvP
         rV0Brzt8Hn+OyEnsH3MlGPmDvV397tnsAUYwwChSe9tbWIhqWPjTkZ+yb+n5Vbeq0Gik
         EwSnAPJYSGygar2DENPq4j0czNJx1nMUTO1SO4w5SKbk5ckDIQ2peota523+ILWCgYvj
         zbqw==
X-Gm-Message-State: AOJu0Yw0Ozmv+KSvC1v2p7i6A8jdUAVk+PR+6bzYOl66lxhciTCG7374
	Qj/jIGKJSt3oSptqyfIqMFfM3lhX5IqsfTMYVAY9qHmoWZHv4T7uCxldRnKlFp0B8g==
X-Gm-Gg: AfdE7cnRL5TKxo/lD0idncjS8BWOVkx8nU6wU6Ax/ya9UtMgp9DqyrhWn1SOyDP43Es
	0+0BPST/0V2YDviBEf+06ukVoSwl9WVK8C7OcKxKkKtII8Bf4232oyCnigx19vMNW0kTtGqNV0r
	9q2SjzrL+xMeISrT+yCTTCtSAJr8A33o6MoBleW+Q8HUrcwGqNPj9qCjH7tV4ayIJrVAzPeFh3C
	qZHQ/zyy+UXTX1jWl0eiFW2BOvRXj66efHvXYsXX0aC50OLvYL1KMi623PnevD2Va9QtMjqXUeo
	6jOo3I5Pn9CvVEoZC+cEkQ4+2tIAUiOcFoBQ+S7gDVcNsvW/37RBGq1qrSbb7UNXjj2BCKeqruG
	9a5do2wps5FJiJeuyDDlO7mSNCA/RBnj+7/xrGGH/mWclhv3E7fZFezy+YHgti3hSPlDITALbzD
	Bvegh/QaakYkjTplxauyeeZPLmqYtkW8xdNeUyodtqiN7amquhOVJnwmAbvwA=
X-Received: by 2002:a05:600c:828c:b0:493:b279:6012 with SMTP id 5b1f17b1804b1-4945e2be9femr228985e9.0.1783938949719;
        Mon, 13 Jul 2026 03:35:49 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f2465ae8bsm28188355f8f.36.2026.07.13.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:35:48 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:35:44 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 09/25] KVM: arm64: iommu: Add memory pool
Message-ID: <alS_gB5uSEbFV-jH@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-10-smostafa@google.com>
 <alEeyoXnMC0J4zFQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alEeyoXnMC0J4zFQ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_033552_236261_B75FF95E 
X-CRM114-Status: GOOD (  51.05  )
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

On Fri, Jul 10, 2026 at 05:33:14PM +0100, Vincent Donnefort wrote:
> On Fri, May 01, 2026 at 11:19:11AM +0000, Mostafa Saleh wrote:
> > IOMMU drivers would require to allocate memory for the shadow page
> > table. Similar to the host stage-2 CPU page table, the IOMMU pool
> > is allocated early from the carveout and it's memory is added in
> > a pool which the IOMMU driver can allocate from and reclaim at
> > run time.
> > 
> > As this is too early for drivers to use init calls, set the number of
> > page allocated from the kernel command line "kvm-arm.hyp_iommu_pages".
> > 
> > Later when the driver registers, it will pass how many pages it
> > needs, and if it was less than what was allocated, it will fail
> > to register.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  .../admin-guide/kernel-parameters.txt         |  4 +++
> >  arch/arm64/include/asm/kvm_host.h             |  3 +-
> >  arch/arm64/kvm/hyp/include/nvhe/iommu.h       |  7 +++-
> >  arch/arm64/kvm/hyp/nvhe/iommu/iommu.c         | 21 +++++++++++-
> >  arch/arm64/kvm/hyp/nvhe/setup.c               | 12 ++++++-
> >  arch/arm64/kvm/iommu.c                        | 33 ++++++++++++++++++-
> >  arch/arm64/kvm/pkvm.c                         |  1 +
> >  7 files changed, 76 insertions(+), 5 deletions(-)
> > 
[...]
> If we expect drivers to use that perhaps we should document a bit better (same
> for kvm_iommu_reclaim_pages()

Will do.

> 
> > +void *kvm_iommu_donate_pages(u8 order);
> > +void kvm_iommu_reclaim_pages(void *ptr);
> > +
> >  #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > index 1db52bd87c38..53cb5e4b0aac 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> 
> Do we really need that subfolder iommu/ ?

Propably not, I will remove it.

> 
> > @@ -15,6 +15,7 @@ struct kvm_iommu_ops *kvm_iommu_ops;
> >  
> >  /* Protected by host_mmu.lock */
> >  static bool kvm_idmap_initialized;
> > +static struct hyp_pool iommu_pages_pool;
> >  
> >  static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
> >  {
> > @@ -95,7 +96,7 @@ static int kvm_iommu_snapshot_host_stage2(void)
> >  	return ret;
> >  }
> >  
> > -int kvm_iommu_init(void)
> > +int kvm_iommu_init(void *pool_base, unsigned int nr_pages)
> >  {
> >  	int ret;
> >  
> > @@ -103,6 +104,14 @@ int kvm_iommu_init(void)
> >  	    !kvm_iommu_ops->host_stage2_idmap)
> >  		return 0;
> >  
> > +	if (!nr_pages)
> > +		return -ENOMEM;
> > +
> > +	ret = hyp_pool_init(&iommu_pages_pool, hyp_virt_to_pfn(pool_base),
> > +			    nr_pages, 0);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = kvm_iommu_ops->init();
> >  	if (ret)
> >  		return ret;
> > @@ -120,3 +129,13 @@ int kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
> >  
> >  	return kvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
> >  }
> > +
> > +void *kvm_iommu_donate_pages(u8 order)
> > +{
> > +	return hyp_alloc_pages(&iommu_pages_pool, order);
> > +}
> > +
> > +void kvm_iommu_reclaim_pages(void *ptr)
> > +{
> > +	hyp_put_page(&iommu_pages_pool, ptr);
> > +}
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index 1f6b221db9a0..215014e42c27 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -23,6 +23,9 @@
> >  
> >  unsigned long hyp_nr_cpus;
> >  
> > +/* See kvm_iommu_pages() */
> > +unsigned int hyp_kvm_iommu_pages;
> 
> nit: we tend to use everywhere unsigned long or u64 for nr_pages.

Initially it was size_t. However, the hyp allocator uses unsigned int
so I was matching its type, I was considering to send a patch upstream
for this but that is not really a problem at the moment as it only
overflows if the system has ~2TB of memory.

> 
> > +
> >  #define hyp_percpu_size ((unsigned long)__per_cpu_end - \
> >  			 (unsigned long)__per_cpu_start)
> >  
> > @@ -34,6 +37,7 @@ static void *selftest_base;
> >  static void *ffa_proxy_pages;
> >  static struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
> >  static struct hyp_pool hpool;
> > +static void *iommu_base;
> >  
> >  static int divide_memory_pool(void *virt, unsigned long size)
> >  {
> > @@ -71,6 +75,12 @@ static int divide_memory_pool(void *virt, unsigned long size)
> >  	if (!ffa_proxy_pages)
> >  		return -ENOMEM;
> >  
> > +	if (hyp_kvm_iommu_pages) {
> > +		iommu_base = hyp_early_alloc_contig(hyp_kvm_iommu_pages);
> > +		if (!iommu_base)
> > +			return -ENOMEM;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -330,7 +340,7 @@ void __noreturn __pkvm_init_finalise(void)
> >  	if (ret)
> >  		goto out;
> >  
> > -	ret = kvm_iommu_init();
> > +	ret = kvm_iommu_init(iommu_base, hyp_kvm_iommu_pages);
> >  	if (ret)
> >  		goto out;
> >  
> > diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
> > index f247384fa193..213429ceb549 100644
> > --- a/arch/arm64/kvm/iommu.c
> > +++ b/arch/arm64/kvm/iommu.c
> > @@ -7,10 +7,11 @@
> >  #include <linux/kvm_host.h>
> >  
> >  extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
> > +extern unsigned int kvm_nvhe_sym(hyp_kvm_iommu_pages);
> >  
> >  static DEFINE_MUTEX(kvm_iommu_reg_lock);
> >  
> > -int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
> > +int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops, unsigned int pool_pages)
> 
> nit: kvm_iommu_init uses nr_pages. 
> 
> >  {
> >  	guard(mutex)(&kvm_iommu_reg_lock);
> >  
> > @@ -21,6 +22,36 @@ int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
> >  	if (kvm_nvhe_sym(kvm_iommu_ops))
> >  		return -EBUSY;
> >  
> > +	/* See kvm_iommu_pages() */
> > +	if (pool_pages > kvm_nvhe_sym(hyp_kvm_iommu_pages)) {
> > +		kvm_err("Not enough memory for the IOMMU pool, need 0x%x pages, check kvm-arm.hyp_iommu_pages",
> > +			pool_pages);
> > +		return -ENOMEM;
> > +	}
> > +
> >  	kvm_nvhe_sym(kvm_iommu_ops) = hyp_ops;
> >  	return 0;
> >  }
> > +
> > +unsigned int kvm_iommu_pages(void)
> > +{
> > +	/*
> > +	 * This is used very early during setup_arch() before any initcalls
> > +	 * or any drivers are registered.
> > +	 * This value is set by a command line option.
> > +	 * Later, when the driver is registered, it will pass the number
> > +	 * pages needed for it's page tables, if it was less that what
> > +	 * the system has already allocated, the registration will fail.
> > +	 */
> > +	return kvm_nvhe_sym(hyp_kvm_iommu_pages);
> > +}
> 
> Could we actually estimate the memory needed, based on the allocation for the
> host stage-2 and an estimation of MMIO coverage? This would allow the whole
> thing to run without setting this value as a best effort and to make it
> optional, which is surely more user-friendly?

Not really, this abstracts the IOMMU, so it does not have to match the
host stage-2, in addition that the SMMUv3 driver requires extra pages
for other in-memory data-structure.

At the moment, this is set from the command line which is not really
best effort as the driver later confirms how much memory it needs.

> 
> > +
> > +/* Number of pages to reserve for iommu pool*/
> > +static int __init early_hyp_iommu_pages(char *arg)
> > +{
> > +	if (!arg)
> > +		return -EINVAL;
> > +
> > +	return kstrtouint(arg, 0, &kvm_nvhe_sym(hyp_kvm_iommu_pages));
> 
> How about using a memory size here with memparse()? This would be more
> transparent for the commandline which can work on different page-size systems.

Makes sense, will do.

Thanks,
Mostafa

