Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE40C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 01:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQVyViu54NB5xRZNuwGjPRH433mqlPk//gSi3xAbMRk=; b=p2RpGBSNxGqpCGxtpsrqYVFrjF
	D1jTHoojATuK2+CawnZ7GfNZU7xB1Azv3o4QpqC56pnneH0w1Pgej67itPf1cJUJXqeFcekVtYF1w
	MZP736YGaIKmH1aiBHXsJLkScNtPqGzVh0isZ82RcNdhUiXNWIpUCXRgWdM5e0pXczH7niz3QoqOt
	BeO0P5Z2wsP71+FVaND1qmV1Sa4mK6pOt1rcU3Ofwuab8PlW9ilBM9UhScVaoU1ZMjMUZW06joEQq
	n3Pb82kGk53/pTROdZGaBzigGu4ur6XkM7HX3c9YnHeHf40fgtN2XYHwj6yypL//jPbdM8pxRw5dw
	pDn+9WUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAzsF-0000000H5yd-3yvP;
	Mon, 28 Sep 2026 01:09:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAzsC-0000000H5yF-3DDk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 01:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790557779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQVyViu54NB5xRZNuwGjPRH433mqlPk//gSi3xAbMRk=;
	b=CTqu6Gry8KnSSmfz2Dn5PHGZqo/BLP5/po9XOHGUl2+ZvLhavQYNMfg5fofAjR2OlSh/re
	BIhsHAh8fgPq3wiUrkEzfwr0z2ym6Xd2th4/rrAE+1KHBbl9F98whbtXcUou+mrdDVTAYe
	WbfPlrQbcMgWStT6TljN+JvDD4q/Fsg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-QbpsBdwDNeOmWLxMbqD2IA-1; Sun, 27 Sep 2026 21:09:36 -0400
X-MC-Unique: QbpsBdwDNeOmWLxMbqD2IA-1
X-Mimecast-MFC-AGG-ID: QbpsBdwDNeOmWLxMbqD2IA_1790557775
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso3785480a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 18:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557775; x=1791162575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQVyViu54NB5xRZNuwGjPRH433mqlPk//gSi3xAbMRk=;
        b=GMQxw7yNjfnLVkPwRNZBgfT/flErN72BVCi7ZeaIs0NjEw14KgS4Ysrazl8fMkVWRV
         PF2FpKubINcH7UD67QVSD+oGbcMkvp48BJXddn1HiCjoP6JOiX4X26Zd1vft3EEES3DN
         mKhyB/ZScbY4mipvYGpMTl8AHvZZV6MRulGsfBdc7STqoHP6wvN6Emdq8VgQEZ0UJcQv
         MkEEpMCouiCRegRP+NHBQntEBY+wpmEb+thIZAtuBYbL2l+0ri2Ft5PMNo7B4TPMLEwY
         1s1Uq28eGI9/Mi6njTCD8fnH1MCUaGVzrUIE2JE8Tdn/TC0Epa1kxMTRdcr/Z62o59ro
         Zd6g==
X-Forwarded-Encrypted: i=1; AKwUvBxkMNSM50n6lqmNjQsxVzNxLxsT+asjqtu0kaCOwDM5C/M+VV2k9J1dE3MmnuygjfVT7mh8F6cE7gErpF//JNf9@lists.infradead.org
X-Gm-Message-State: AFq9FYIBhGBBFoP09Wg76mWM1Bn1VLAjxH/CcAUuga5A/gW+KhaMTX1L
	TYDx2zjZM5Bkroa46q2CbGbImDq4PU9TnFM9nD9bZp4VTm+AKQ6WRVL/kZ+o8b73kWMiFRlT7TZ
	lJ6IyfKM4l+PcNC8I/xZbRGsLIWDhBKkUx7+aIU6Vfk7X+kilE3C+mfaLPx9G/IlWysnGAa9sci
	6F
X-Gm-Gg: AYBFou0pcHiyJKlzyFCN7IKf/FXDKmdUFBgds8isJc+IswBHiWqDclKkJBVH14nkRMJ
	sGh1Lyf5ikd+zgp6VXd/8V6SR5Rwj4Ks5Ris0TIaMZDr/7fvGb4tzZ9X/d6Q/Z8juLZXqI8smST
	xXIDikK546iiT8KjCg6aIlKGeGTpad2OB1lXSR2Om1qTQRpHqJebpm5rS6A8uCXhIZktzFIOqW5
	fH72gDKMx5mxvqTYXs8BXQ05X/fj89uW8K4pdqWm3Z/BmBMbUkDXTaFmVPAHlsS1p29qPVGpKUM
	XvdaeQIHnPkWy8YBWdflLXOqKSFe/hB/a3bG+RPkENfy80RFcCynzhD5w0D2oma0Nq4I28bJlcc
	Rqv4C9nqWGgcJb7hE5JpILzfCXJYf6rWQkruSXfmF7g==
X-Received: by 2002:a17:90a:e183:b0:3a0:a912:e768 with SMTP id 98e67ed59e1d1-3a0a912ebe3mr7728687a91.15.1790557775121;
        Sun, 27 Sep 2026 18:09:35 -0700 (PDT)
X-Received: by 2002:a17:90a:e183:b0:3a0:a912:e768 with SMTP id 98e67ed59e1d1-3a0a912ebe3mr7728660a91.15.1790557774598;
        Sun, 27 Sep 2026 18:09:34 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df964d46b0sm30757145ad.15.2026.09.27.18.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:09:34 -0700 (PDT)
Message-ID: <647ae455-4175-4070-a40e-d2d89f18971f@redhat.com>
Date: Mon, 28 Sep 2026 11:09:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 09/20] KVM: arm64: Add VM specific callback for S2 MMU
 operations
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-10-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-10-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tcVxq70LlhVmPNxkKOKsmF8R9zYKd-bJUZBdX9mH1TU_1790557775
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_180941_131030_E023EF5D 
X-CRM114-Status: GOOD (  28.14  )
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

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |  15 ++++
>   arch/arm64/kvm/mmu.c              | 137 +++++++++++++++++++++++++-----
>   2 files changed, 131 insertions(+), 21 deletions(-)
> 

Apart from the comments from Jonathan, some nitpicks and questions below.

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 149f4582c8b6a..7664d8b8cce5a 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -155,6 +155,19 @@ struct kvm_vcpu_ops {
>   	void (*vcpu_put)(struct kvm_vcpu *vcpu);
>   };
>   
> +struct kvm_gfn_range;
> +
> +struct kvm_vm_s2_ops {
> +	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> +	bool (*vm_test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> +	int (*vm_flush_remote_tlbs)(struct kvm *kvm);
> +	int (*vm_flush_remote_tlbs_range)(struct kvm *kvm, gfn_t gfn,
> +					  u64 nr_pages);
> +	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
> +				      phys_addr_t start, u64 size,
> +				      bool may_block);
> +};
> +
>   struct kvm_s2_mmu {
>   	struct kvm_vmid vmid;
>   
> @@ -332,6 +345,8 @@ struct kvm_arch {
>   	 */
>   	u64 fgu[__NR_FGT_GROUP_IDS__];
>   
> +	const struct kvm_vm_s2_ops *vm_s2_ops;
> +
>   	/*
>   	 * Stage 2 paging state for VMs with nested S2 using a virtual
>   	 * VMID.
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 03f2017a7404a..d97a4a1bca23f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -37,6 +37,8 @@ static unsigned long __ro_after_init io_map_base;
>   
>   #define KVM_PGT_FN(fn)		(!is_protected_kvm_enabled() ? fn : p ## fn)
>   
> +static int kvm_vm_init_vm_s2_ops(struct kvm *kvm);
> +
>   static phys_addr_t __stage2_range_addr_end(phys_addr_t addr, phys_addr_t end,
>   					   phys_addr_t size)
>   {
> @@ -166,6 +168,18 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>   	return memslot->dirty_bitmap && !(memslot->flags & KVM_MEM_READONLY);
>   }
>   
> +static int pkvm_flush_remote_tlbs(struct kvm *kvm)
> +{
> +	kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> +	return 0;
> +}
> +
> +static int kvm_vm_flush_remote_tlbs(struct kvm *kvm)
> +{
> +	kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> +	return 0;
> +}
> +
>   /**
>    * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
>    * @kvm:	pointer to kvm structure.
> @@ -174,26 +188,36 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>    */
>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
> -	if (is_protected_kvm_enabled())
> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> -	else
> -		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> -	return 0;
> +	if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> +		return 1;

For the return value, I'm wandering if 0 should be returned. More details
can be found below.

> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
>   }
>   
> -int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> -				      gfn_t gfn, u64 nr_pages)
> +static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
> +					gfn_t gfn, u64 nr_pages)
> +{
> +	return pkvm_flush_remote_tlbs(kvm);
> +}
> +
> +static int kvm_vm_flush_remote_tlbs_range(struct kvm *kvm,
> +					 gfn_t gfn, u64 nr_pages)
>   {
>   	u64 size = nr_pages << PAGE_SHIFT;
>   	u64 addr = gfn << PAGE_SHIFT;
>   
> -	if (is_protected_kvm_enabled())
> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> -	else
> -		kvm_tlb_flush_vmid_range(&kvm->arch.mmu, addr, size);
> +	kvm_tlb_flush_vmid_range(&kvm->arch.mmu, addr, size);
>   	return 0;
>   }
>   
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> +				     gfn_t gfn, u64 nr_pages)
> +{
> +	if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs_range)
> +		return 1;
> +

Realm would the only case where vm_s2_ops->vm_flush_remote_{tlbs, tlbs_range)
are NULL. On request to flush remote TLBs by kvm_flush_remote_tlbs_range(), it
ends up with event KVM_REQ_TLB_FLUSH queued for each vCPU. How this queued event
is linked to a remote TLB flush for realm? The problem is TLBs are owned by EL2
realm and there are no RMI calls for the management. So I'm wandering we should
return 0 here?

> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs_range(kvm, gfn, nr_pages);
> +}
> +
>   static void *stage2_memcache_zalloc_page(void *arg)
>   {
>   	struct kvm_mmu_memory_cache *mc = arg;
> @@ -337,13 +361,20 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
>   				   may_block));
>   }
>   
> +static void kvm_vm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
> +				      phys_addr_t start,
> +				      u64 size, bool may_block)
> +{
> +	__unmap_stage2_range(mmu, start, size, may_block);
> +}
> +
>   void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
>   			    u64 size, bool may_block)
>   {
> -	if (kvm_vm_is_protected(kvm_s2_mmu_to_kvm(mmu)))
> -		return;
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>   
> -	__unmap_stage2_range(mmu, start, size, may_block);
> +	if (kvm->arch.vm_s2_ops->vm_stage2_unmap_range)
> +		kvm->arch.vm_s2_ops->vm_stage2_unmap_range(mmu, start, size, may_block);
>   }
>   
>   void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
> @@ -983,6 +1014,12 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   	int cpu, err;
>   	struct kvm_pgtable *pgt;
>   
> +	/* Initialize the VM ops for the VM instance for the first time */
> +	if (mmu == &kvm->arch.mmu) {
> +		err = kvm_vm_init_vm_s2_ops(kvm);
> +		if (err)
> +			return err;
> +	}
>   	/*
>   	 * If we already have our page tables in place, and that the
>   	 * MMU context is the canonical one, we have a bug somewhere,
> @@ -2447,34 +2484,46 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>   	return false;
>   }
>   
> -bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +static bool kvm_vm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   {
>   	u64 size = (range->end - range->start) << PAGE_SHIFT;
>   
> -	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
> -		return false;
> -
>   	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
>   						   range->start << PAGE_SHIFT,
>   						   size, true);
> +}
> +
> +bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	if (!kvm->arch.mmu.pgt || !kvm->arch.vm_s2_ops->vm_age_gfn)
> +		return false;
> +
> +	return kvm->arch.vm_s2_ops->vm_age_gfn(kvm, range);
>   	/*
>   	 * TODO: Handle nested_mmu structures here using the reverse mapping in
>   	 * a later version of patch series.
>   	 */
>   }
>   
> -bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +static bool kvm_vm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   {
>   	u64 size = (range->end - range->start) << PAGE_SHIFT;
>   
> -	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
> -		return false;
>   
>   	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
>   						   range->start << PAGE_SHIFT,
>   						   size, false);
>   }
>   
> +bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +
> +	if (!kvm->arch.mmu.pgt || !kvm->arch.vm_s2_ops->vm_test_age_gfn)
> +		return false;
> +
> +	return kvm->arch.vm_s2_ops->vm_test_age_gfn(kvm, range);
> +}
> +
>   phys_addr_t kvm_mmu_get_httbr(void)
>   {
>   	return __pa(hyp_pgtable->pgd);
> @@ -2796,3 +2845,49 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
>   
>   	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
>   }
> +
> +static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
> +	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
> +	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
> +	/*
> +	 * Not supported for Protected VMs under pKVM
> +	 * .vm_age_gfn
> +	 * .vm_test_age_gfn
> +	 * .vm_stage2_unmap_range
> +	 */
> +};
> +
> +static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
> +	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
> +	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
> +	.vm_age_gfn			= kvm_vm_age_gfn,
> +	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
> +	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
> +};
> +
> +static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
> +	.vm_flush_remote_tlbs		= kvm_vm_flush_remote_tlbs,
> +	.vm_flush_remote_tlbs_range	= kvm_vm_flush_remote_tlbs_range,
> +	.vm_age_gfn			= kvm_vm_age_gfn,
> +	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
> +	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
> +};
> +
> +#define KVM_VM_S2_OPS(flavor, ops)		\
> +		[flavor] = ops

Parentheses are needed, to be consistent with KVM_VCPU_OPS at least.

#define KVM_VM_S2_OPS(flavor, ops)		\
		[(flavor)] = (ops)

Actually, KVM_{VCPU, VM_S2}_OPS() can be combined to one in kvm_host.h as below.

#define KVM_FLAVOR_OPS() [(flavor)] = (ops)

> +static const struct kvm_vm_s2_ops *arm64_vm_s2_ops[] = {
> +	KVM_VM_S2_OPS(VM_VHE, &kvm_default_vm_s2_ops),
> +	KVM_VM_S2_OPS(VM_NVHE, &kvm_default_vm_s2_ops),
> +	KVM_VM_S2_OPS(VM_PKVM, &pkvm_vm_s2_ops),
> +	KVM_VM_S2_OPS(VM_PROTECTED_PKVM, &protected_pkvm_vm_s2_ops),
> +};
> +
> +static int kvm_vm_init_vm_s2_ops(struct kvm *kvm)
> +{
> +	BUILD_BUG_ON(ARRAY_SIZE(arm64_vm_s2_ops) != VM_FLAVOR_MAX);
> +
> +	kvm->arch.vm_s2_ops = arm64_vm_s2_ops[kvm->arch.vm_flavor];
> +	if (WARN_ON(!kvm->arch.vm_s2_ops))
> +		return -EINVAL;
> +	return 0;
> +}

Thanks,
Gavin


