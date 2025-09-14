Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A6DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 20:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNSjjL64mFdVCOUJRjIHIc/4Pp2YkjFAp7TrkUJbvbY=; b=SYElCKITqXjLRlglArrvmxxfKG
	Hh9QgyFdnKDNkwDA/nbE9VObELrERjfjseHPeZZLId+v2alRkYN5O4w3cRvSJIgsPRx1q/cvR1N7L
	28jIYE5Otu2uP/a7I5CsiK8Xomnnj7vL5ZOnpcrrTot42BRtlk7DehJvZsiaZc/NUvtASzvihsOdx
	Kwpve/GKQIsWWQ+YI+jLquv8i7k/cp5zTLT7E7RCj79KsE+72NcDVL1gnuxHwKNMG6ZdVMSyMw9Ra
	JRiIgj9MUoQ8DppOPiVHjc1T2CL4Bk4ebKDsq/1t9Be1tUgFCACQxXe5ZVxC6CtZYKxW1rxxJ+OYb
	1+XGjjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtX9-00000002AtH-0aMp;
	Sun, 14 Sep 2025 20:41:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtX6-00000002Ast-38Ve
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 20:41:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-265abad93bfso67795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 13:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757882472; x=1758487272; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNSjjL64mFdVCOUJRjIHIc/4Pp2YkjFAp7TrkUJbvbY=;
        b=RbOWsWM9pVWWIKZ1Atquvj0AcouPhFkPTnHaT4SnzhwZ/6vEvPGC5ktdBxb1cTq/zi
         gYXRuYEh1FU72g/DBahRzT83IiQKK64LoNc8KcL0Er71Q+/oSKd3KdiwDUCjk3wexIaf
         D6tfjlZPUA18GhNHXcHcd5FoE62SEA4XmogBi4nZTbDIrI3KVtUcqM1Tn7HRG+bZU/c6
         9yKlmaYnMvN8qMAFV7jvFqJoMKk9Fv/f19/pntB2qGuMDhbMJLDXFHYqEOmTHZH73KYP
         G9k5AUL1bD25zOHgvoSj7F2UIFydUpQruBC4+8REB8oUPAJazQSkIjUQuR983erAWTDP
         swTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757882472; x=1758487272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNSjjL64mFdVCOUJRjIHIc/4Pp2YkjFAp7TrkUJbvbY=;
        b=w4IQmVd60W81elX97MUY1YIomcLxxVvayzZxnZHz4nXo11QsxkxcWZ36u8pLH9l0o3
         kkMACJEkR9+fSstUI8tZQAIoCFNv9wTtROiXkLn5N5b5ggDp80rfgo0naq6WQo5DEN2z
         9FOoofa9SO9aW76PncK/eduYQhlkWkJ4FLFtK1QE1Y0YWfnSWpWbTaBWo9o4oc+cpl/K
         K3eFDWam/2BF1rbYveLQNMjgog9MA4N2Bc8/9378wR/rmuPSHIwq5PQO/yDLyEhTaB5J
         VhF29KS9N/CAzncXzmo/rMughyU9Z4NPWg03xZq3f+g/9l38LWJLMf7xbYo9HHCqD4zx
         7nTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHZUjEiDRsHkrOAmp2gATKqbPryfksALXPx1ksTQukDZOtXNUWFp7XNUxIkSdiaf9Ze2/MzzHU4S5Oez9Mh2wx@lists.infradead.org
X-Gm-Message-State: AOJu0YyEus+d/JV8YQainvRwfBiz/ZHQ78sMCE+RmctsLQlkZRopwCX4
	3U8miX4IlwT/5BxliMoOZ8CX7kn28KG66kew2m5jo3rz2lMLeXIT4gWV3/Hu5Qp/7Q==
X-Gm-Gg: ASbGnct3efm1DkICSWi59Di3qdyqY1zQ2DfYlzwPAD9VdWXmOXOOdKC2E4KmgF3EKeq
	IVi/V/1IvBKp9fL+a9/ixF3ydNbHO81Qqe+QyQoUvvfScQnFedxGftug5buICSJI2S/Ha5eaaV+
	Dg/4eDjzxEVyXHO60nFvopscZBNWOCELMfKd3PIRMX8AXhm1QZXqaOjjOQ1fEdPMcitE8DaLU/x
	6YDkIXf2zw8WnIH7vNsboG/EEmXH1vQimkm/Xd53Cy4qQIdkueVYQc563hCNByjGEN1x6jwALGa
	iG3JQCydPOcDOHaonDm13D4BBWjklaix6s053EhQ5EFDF/qdSob0uVK/Gxf5xhoAzFzUa15Av/m
	rJ17bq84VAIhgjDYf9sJd9k3dAKQ2tPMXZQEEinLA13dDS970Jtry5jihxW3Tfv96T/bi46HF+Q
	==
X-Google-Smtp-Source: AGHT+IHvAZDBJIBrGn/Rxmed7TPoC1eE87FxlDAP8nIpAj01UwnK5cfZtdePiHpGJ6H0pHDgIaQEaQ==
X-Received: by 2002:a17:903:244b:b0:234:bfa1:da3e with SMTP id d9443c01a7336-260a3dd2bbamr3723445ad.5.1757882471428;
        Sun, 14 Sep 2025 13:41:11 -0700 (PDT)
Received: from google.com (23.178.142.34.bc.googleusercontent.com. [34.142.178.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-264ba05335dsm22707595ad.142.2025.09.14.13.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 13:41:10 -0700 (PDT)
Date: Sun, 14 Sep 2025 20:41:04 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com
Subject: Re: [PATCH v4 02/28] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <aMcoYCcJXjN64cOE@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819215156.2494305-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_134112_811627_27E7C30B 
X-CRM114-Status: GOOD (  33.02  )
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

On Tue, Aug 19, 2025 at 09:51:30PM +0000, Mostafa Saleh wrote:
> Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> drivers can use that to protect the MMIO of IOMMU.
> The initial attempt to implement this was to have a new flag to
> "___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
> it was quite intrusive for host/hyp to check/set page state to make it
> aware of MMIO and to encode the state in the page table in that case.
> Which is called in paths that can be sensitive to performance (FFA, VMs..)
> 
> As donating MMIO is very rare, and we don’t need to encode the full state,
> it’s reasonable to have a separate function to do this.
> It will init the host s2 page table with an invalid leaf with the owner ID
> to prevent the host from mapping the page on faults.
> 
> Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> stage-2 PTEs, as this can be triggered from recycle logic under memory
> pressure. There is no code relying on this, as all ownership changes is
> done via kvm_pgtable_stage2_set_owner()
> 
> For error path in IOMMU drivers, add a function to donate MMIO back
> from hyp to host.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 64 +++++++++++++++++++
>  arch/arm64/kvm/hyp/pgtable.c                  |  9 +--
>  3 files changed, 68 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 52d7ee91e18c..98e173da0f9b 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -37,6 +37,8 @@ int __pkvm_host_share_hyp(u64 pfn);
>  int __pkvm_host_unshare_hyp(u64 pfn);
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
>  int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
> +int __pkvm_host_donate_hyp_mmio(u64 pfn);
> +int __pkvm_hyp_donate_host_mmio(u64 pfn);
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 861e448183fd..c9a15ef6b18d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -799,6 +799,70 @@ int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
>  	return ret;
>  }
>  
> +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> +{
> +	u64 phys = hyp_pfn_to_phys(pfn);
> +	void *virt = __hyp_va(phys);
> +	int ret;
> +	kvm_pte_t pte;
> +
> +	host_lock_component();
> +	hyp_lock_component();
> +
> +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> +	if (ret)
> +		goto unlock;
> +
> +	if (pte && !kvm_pte_valid(pte)) {
> +		ret = -EPERM;
> +		goto unlock;
> +	}
> +
> +	ret = kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
> +	if (ret)
> +		goto unlock;
> +	if (pte) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}

I'm thinking of a situation where both of these checks might be
necessary.. The first check seems to confirm if the page being donated
isn't set up to trap in the hyp (i.e. the donor/host doesn't own the
page anymore). 

However, the second check seems to check if the pfn is already mapped
in the hyp's space. Is this check only to catch errorneous donations of
a shared page or is there something else?

> +
> +	ret = pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVICE);
> +	if (ret)
> +		goto unlock;
> +	/*
> +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> +	 */
> +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
> +unlock:
> +	hyp_unlock_component();
> +	host_unlock_component();
> +
> +	return ret;
> +}
> +
> +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> +{
> +	u64 phys = hyp_pfn_to_phys(pfn);
> +	u64 virt = (u64)__hyp_va(phys);
> +	size_t size = PAGE_SIZE;
> +
> +	host_lock_component();
> +	hyp_lock_component();
> +
> +	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
> +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> +	hyp_unlock_component();
> +	host_unlock_component();
> +
> +	return 0;
> +}
> +
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  {
>  	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index c351b4abd5db..ba06b0c21d5a 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1095,13 +1095,8 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	kvm_pte_t *childp = NULL;
>  	bool need_flush = false;
>  
> -	if (!kvm_pte_valid(ctx->old)) {
> -		if (stage2_pte_is_counted(ctx->old)) {
> -			kvm_clear_pte(ctx->ptep);
> -			mm_ops->put_page(ctx->ptep);
> -		}
> -		return 0;
> -	}
> +	if (!kvm_pte_valid(ctx->old))
> +		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
>  
>  	if (kvm_pte_table(ctx->old, ctx->level)) {
>  		childp = kvm_pte_follow(ctx->old, mm_ops);
> -- 

Thanks
Praan

