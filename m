Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA25C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lpwXLkbuiMp+a8i3U7vB0DwpQBlY3yNigXzhiJlNds=; b=k18yqLeBk3PYAinTLMrOt0uZ//
	ew+44CwLMW4xHAEfjcIynBW1QwzpTKJZoh+rkKG73v2oMb8e9PAF9QXvbz6Y1ufr+Axv1ktUtbS5I
	lxwEEEm57Bq+LrcIujlKU1vRKG5EAngAwMBYNvnDtXqSYpnSBMRbQwUb603/PWBaOxfCdkz+/lqdq
	RqpY4a7VmKFE4h5O2DxvlSZsxo2TSRY/NHyeTNoGy8auq2P2Edk545QPJW3kVTjcN0CxWZMEQpZyi
	aZjovtyWqdrhnAES8UZ7HvVnsc7kyM+nI7529nQVO8I8Jj33HXNGOqvWs0YtdOycF2Gu5dJwDxI7N
	q/rAqiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEAH-00000005I31-01SC;
	Fri, 10 Jul 2026 16:33:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEAE-00000005I2e-2fKn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 16:33:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1162558f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783701201; x=1784306001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lpwXLkbuiMp+a8i3U7vB0DwpQBlY3yNigXzhiJlNds=;
        b=IDR/Taj343eY2iAKo0arhJ5nH/htkIHjrayt+HfvdEvbQgxPJWFtNv1omyK4/LDfmP
         Z2mjpBzEoh4zNVLaIYnDCfz0Em/eOolgITNlC75oSMDmLcsYc6ZykufdPhnvUKkg6hfW
         178SmuD7/rQ4xWWRdLLPlhMbpsEkOv6DY47O9nxtU2t23/xi6Xad0IdqTUGWA4UwVZI3
         vl+hxaRx2H3gTnSN+nBrJqNJCZGUkVec83dsQ4btfQmZInm4IkKmMIJuiOVKPAHQjvLT
         oFmGfPt9VzZJxVL4/lqm+qSNUfXPG5EUBc+2ngZ4gOn1TmpGfxLrpD+zIG/lLI625FUY
         RxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701201; x=1784306001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lpwXLkbuiMp+a8i3U7vB0DwpQBlY3yNigXzhiJlNds=;
        b=rOxZRdYqXUBwP6XOpL2NkF9PW4U4FEe1nOEBzq50j5o1dhGE/ni1QPCUZ3Yx3aqSKy
         s6aadjPu1McwElyIP7bMQm6d1I9mCJKR9ARF92UP74zWwRjqSq8I9CnpIATyE/f+Odpf
         I3Jwg8j0qvqcmSOS9uDFbPdHNKfNgf2ex5yg6daeyvjTWaAELvJaT1p3uEuTohq3rSLf
         90/vbpzLBCRIxMTOUk1x4qniEHF/i2Vhiwvf7si+QZtqL/4BdPgfIBD/2gF3yYB6wLji
         E4etj7QPGuIuSJ3cko/C3f4CKjIPMVTApmEc1qGym8235j/fXIPWDy1iAXhRLsEmienA
         QT8w==
X-Gm-Message-State: AOJu0YxCcD/IbVo2MIC2PfATBTjRFQu2n9hW+0u2y6opsLP1BFVpDQUW
	o+N51kgwovDF4fllgbmFNqHmhMTi0ytnjs+Qz4enxlc0ejxn0y5jsc1he7z5PGXNmg==
X-Gm-Gg: AfdE7clgaSW8YI8xUQvCd5m1herOiqwhhq4VHq6Mak49FgJs5AqU9xH3v8SfCLFd2MG
	z3K1EoBNWtxJC2WOUtuF8l7BtGmM9oKkbDcXe1EvYwK5A13dBnYs2W1R3PVWILKPZIjBcUdgx+m
	akCcGHv2SScMGz/itFPmub3rvgQqJUjeo70if000tXw5xkOmsNE6qmObWejvJX8zI3rxYzDfJpX
	IXS4jcK2NedhNVW+jeQd5U8sIXB52adHBUaaZnh2Wz8LMmUIPx5Zjgn2tIf/Pg4gutzc3UV+OjZ
	ugH8CNhP1U0Dzqg/bSInOc1yn7xscxacDsAgX5JB09WxPT5HD16cWHGgALqfi50uNH9pw/+3GkX
	izBGOxO2vhnmtTWALUgbPG9nF/d2xfSP8/r85HpSY7bqHLhmqMXG1WFpTqHjEWoU2mZsOB9hGE/
	Dl+AS7PEPH8hKvHo9067uST2AUmRrvEDABw7BdsXiR4jwXCJaDkpU=
X-Received: by 2002:a5d:59a6:0:b0:477:f5c:9bf2 with SMTP id ffacd0b85a97d-47df07a4bccmr13686294f8f.51.1783701200181;
        Fri, 10 Jul 2026 09:33:20 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm15735579f8f.16.2026.07.10.09.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:33:19 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:33:14 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 09/25] KVM: arm64: iommu: Add memory pool
Message-ID: <alEeyoXnMC0J4zFQ@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-10-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-10-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_093322_724121_F08A2A34 
X-CRM114-Status: GOOD (  43.16  )
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

On Fri, May 01, 2026 at 11:19:11AM +0000, Mostafa Saleh wrote:
> IOMMU drivers would require to allocate memory for the shadow page
> table. Similar to the host stage-2 CPU page table, the IOMMU pool
> is allocated early from the carveout and it's memory is added in
> a pool which the IOMMU driver can allocate from and reclaim at
> run time.
> 
> As this is too early for drivers to use init calls, set the number of
> page allocated from the kernel command line "kvm-arm.hyp_iommu_pages".
> 
> Later when the driver registers, it will pass how many pages it
> needs, and if it was less than what was allocated, it will fail
> to register.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  4 +++
>  arch/arm64/include/asm/kvm_host.h             |  3 +-
>  arch/arm64/kvm/hyp/include/nvhe/iommu.h       |  7 +++-
>  arch/arm64/kvm/hyp/nvhe/iommu/iommu.c         | 21 +++++++++++-
>  arch/arm64/kvm/hyp/nvhe/setup.c               | 12 ++++++-
>  arch/arm64/kvm/iommu.c                        | 33 ++++++++++++++++++-
>  arch/arm64/kvm/pkvm.c                         |  1 +
>  7 files changed, 76 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cf3807641d89..5e49946ff7ed 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3283,6 +3283,10 @@ Kernel parameters
>  			trap: set WFI instruction trap
>  
>  			notrap: clear WFI instruction trap
> +	kvm-arm.hyp_iommu_pages=
> +			[KVM, ARM, EARLY]
> +			Number of pages allocated for the IOMMU pool from the
> +			KVM carveout when running in protected mode.
>  
>  	kvm_cma_resv_ratio=n [PPC,EARLY]
>  			Reserves given percentage from system memory area for
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 52898d2a3ec6..17f4cce86ec3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1735,7 +1735,8 @@ long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext);
>  
>  #ifndef __KVM_NVHE_HYPERVISOR__
>  struct kvm_iommu_ops;
> -int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops);
> +int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops, unsigned int pool_pages);
> +unsigned int kvm_iommu_pages(void);
>  #endif
>  
>  #endif /* __ARM64_KVM_HOST_H__ */
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/iommu.h b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> index 6277d845cdcf..eba94b4f6050 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/iommu.h
> @@ -10,8 +10,13 @@ struct kvm_iommu_ops {
>  	int (*host_stage2_idmap)(phys_addr_t start, phys_addr_t end, int prot);
>  };
>  
> -int kvm_iommu_init(void);
> +int kvm_iommu_init(void *pool_base, unsigned int nr_pages);
>  
>  int kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
>  				enum kvm_pgtable_prot prot);
> +
> +/* Returns zeroed memory. */

If we expect drivers to use that perhaps we should document a bit better (same
for kvm_iommu_reclaim_pages()

> +void *kvm_iommu_donate_pages(u8 order);
> +void kvm_iommu_reclaim_pages(void *ptr);
> +
>  #endif /* __ARM64_KVM_NVHE_IOMMU_H__ */
> diff --git a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> index 1db52bd87c38..53cb5e4b0aac 100644
> --- a/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c
> +++ b/arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

Do we really need that subfolder iommu/ ?

> @@ -15,6 +15,7 @@ struct kvm_iommu_ops *kvm_iommu_ops;
>  
>  /* Protected by host_mmu.lock */
>  static bool kvm_idmap_initialized;
> +static struct hyp_pool iommu_pages_pool;
>  
>  static inline int pkvm_to_iommu_prot(enum kvm_pgtable_prot prot)
>  {
> @@ -95,7 +96,7 @@ static int kvm_iommu_snapshot_host_stage2(void)
>  	return ret;
>  }
>  
> -int kvm_iommu_init(void)
> +int kvm_iommu_init(void *pool_base, unsigned int nr_pages)
>  {
>  	int ret;
>  
> @@ -103,6 +104,14 @@ int kvm_iommu_init(void)
>  	    !kvm_iommu_ops->host_stage2_idmap)
>  		return 0;
>  
> +	if (!nr_pages)
> +		return -ENOMEM;
> +
> +	ret = hyp_pool_init(&iommu_pages_pool, hyp_virt_to_pfn(pool_base),
> +			    nr_pages, 0);
> +	if (ret)
> +		return ret;
> +
>  	ret = kvm_iommu_ops->init();
>  	if (ret)
>  		return ret;
> @@ -120,3 +129,13 @@ int kvm_iommu_host_stage2_idmap(phys_addr_t start, phys_addr_t end,
>  
>  	return kvm_iommu_ops->host_stage2_idmap(start, end, pkvm_to_iommu_prot(prot));
>  }
> +
> +void *kvm_iommu_donate_pages(u8 order)
> +{
> +	return hyp_alloc_pages(&iommu_pages_pool, order);
> +}
> +
> +void kvm_iommu_reclaim_pages(void *ptr)
> +{
> +	hyp_put_page(&iommu_pages_pool, ptr);
> +}
> diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> index 1f6b221db9a0..215014e42c27 100644
> --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> @@ -23,6 +23,9 @@
>  
>  unsigned long hyp_nr_cpus;
>  
> +/* See kvm_iommu_pages() */
> +unsigned int hyp_kvm_iommu_pages;

nit: we tend to use everywhere unsigned long or u64 for nr_pages.

> +
>  #define hyp_percpu_size ((unsigned long)__per_cpu_end - \
>  			 (unsigned long)__per_cpu_start)
>  
> @@ -34,6 +37,7 @@ static void *selftest_base;
>  static void *ffa_proxy_pages;
>  static struct kvm_pgtable_mm_ops pkvm_pgtable_mm_ops;
>  static struct hyp_pool hpool;
> +static void *iommu_base;
>  
>  static int divide_memory_pool(void *virt, unsigned long size)
>  {
> @@ -71,6 +75,12 @@ static int divide_memory_pool(void *virt, unsigned long size)
>  	if (!ffa_proxy_pages)
>  		return -ENOMEM;
>  
> +	if (hyp_kvm_iommu_pages) {
> +		iommu_base = hyp_early_alloc_contig(hyp_kvm_iommu_pages);
> +		if (!iommu_base)
> +			return -ENOMEM;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -330,7 +340,7 @@ void __noreturn __pkvm_init_finalise(void)
>  	if (ret)
>  		goto out;
>  
> -	ret = kvm_iommu_init();
> +	ret = kvm_iommu_init(iommu_base, hyp_kvm_iommu_pages);
>  	if (ret)
>  		goto out;
>  
> diff --git a/arch/arm64/kvm/iommu.c b/arch/arm64/kvm/iommu.c
> index f247384fa193..213429ceb549 100644
> --- a/arch/arm64/kvm/iommu.c
> +++ b/arch/arm64/kvm/iommu.c
> @@ -7,10 +7,11 @@
>  #include <linux/kvm_host.h>
>  
>  extern struct kvm_iommu_ops *kvm_nvhe_sym(kvm_iommu_ops);
> +extern unsigned int kvm_nvhe_sym(hyp_kvm_iommu_pages);
>  
>  static DEFINE_MUTEX(kvm_iommu_reg_lock);
>  
> -int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
> +int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops, unsigned int pool_pages)

nit: kvm_iommu_init uses nr_pages. 

>  {
>  	guard(mutex)(&kvm_iommu_reg_lock);
>  
> @@ -21,6 +22,36 @@ int kvm_iommu_register_driver(struct kvm_iommu_ops *hyp_ops)
>  	if (kvm_nvhe_sym(kvm_iommu_ops))
>  		return -EBUSY;
>  
> +	/* See kvm_iommu_pages() */
> +	if (pool_pages > kvm_nvhe_sym(hyp_kvm_iommu_pages)) {
> +		kvm_err("Not enough memory for the IOMMU pool, need 0x%x pages, check kvm-arm.hyp_iommu_pages",
> +			pool_pages);
> +		return -ENOMEM;
> +	}
> +
>  	kvm_nvhe_sym(kvm_iommu_ops) = hyp_ops;
>  	return 0;
>  }
> +
> +unsigned int kvm_iommu_pages(void)
> +{
> +	/*
> +	 * This is used very early during setup_arch() before any initcalls
> +	 * or any drivers are registered.
> +	 * This value is set by a command line option.
> +	 * Later, when the driver is registered, it will pass the number
> +	 * pages needed for it's page tables, if it was less that what
> +	 * the system has already allocated, the registration will fail.
> +	 */
> +	return kvm_nvhe_sym(hyp_kvm_iommu_pages);
> +}

Could we actually estimate the memory needed, based on the allocation for the
host stage-2 and an estimation of MMIO coverage? This would allow the whole
thing to run without setting this value as a best effort and to make it
optional, which is surely more user-friendly?

> +
> +/* Number of pages to reserve for iommu pool*/
> +static int __init early_hyp_iommu_pages(char *arg)
> +{
> +	if (!arg)
> +		return -EINVAL;
> +
> +	return kstrtouint(arg, 0, &kvm_nvhe_sym(hyp_kvm_iommu_pages));

How about using a memory size here with memparse()? This would be more
transparent for the commandline which can work on different page-size systems.

> +}
> +early_param("kvm-arm.hyp_iommu_pages", early_hyp_iommu_pages);
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 053e4f733e4b..79dd14db4919 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -63,6 +63,7 @@ void __init kvm_hyp_reserve(void)
>  	hyp_mem_pages += hyp_vmemmap_pages(STRUCT_HYP_PAGE_SIZE);
>  	hyp_mem_pages += pkvm_selftest_pages();
>  	hyp_mem_pages += hyp_ffa_proxy_pages();
> +	hyp_mem_pages += kvm_iommu_pages();
>  
>  	/*
>  	 * Try to allocate a PMD-aligned region to reduce TLB pressure once
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

