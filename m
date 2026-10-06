Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB084CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMmY6n/MH6ca3TbNnMvPhVpWJPvoIQVMRX+7sRuvar4=; b=HtuQS/Oq4q3blC2kRHUdzcoSMf
	GVGtC72h9ymz9Tb09KKH15plLguazQ6JDzFt209Py11J2lBVUcY2SWC/SPns6OEu/zfA4BvtEyWlK
	Otx33TkgexqgQovV4AmjNOxo47NJbVIveKHVLyLmqn7WZzYqPN8GU8+5DK6361Hbof25Qr29+ZaWO
	fJfon13UdoGNony8smdx1Sw/M9YflwK8798KegXzCKAWl9ePfvZBbbsZAR+eUf4Dm/zHauFRkKT1J
	uHaqWVzEBHUFKblTMRQrnl2dBX2q4LWfMPRcFyoDYjXG4sAHoQOflAXYua4Wf4N/tpYqWSaFTjH46
	dN+zxi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvQY-0000000HXLU-2zDH;
	Tue, 06 Oct 2026 03:01:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvQV-0000000HXL4-1U6l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791255670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMmY6n/MH6ca3TbNnMvPhVpWJPvoIQVMRX+7sRuvar4=;
	b=D78nJn6KymAQ50DSCWzFMerhLqLTCDtbvPC2D7n2TacINErKM4q8MXAwEWiG/uQKjTSqvs
	gBoiJzmPPa1+PtdcaKbDD31GaT5ImwC0yDSQJfh8VWrd6mjzB/pu27YXqPDfUO4O/b+KD1
	Lr7mdW6VTZxIacoAKpGSzbCkMEuu37Y=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-30KP8nByPTqs-mjGDElpJw-1; Mon, 05 Oct 2026 23:01:07 -0400
X-MC-Unique: 30KP8nByPTqs-mjGDElpJw-1
X-Mimecast-MFC-AGG-ID: 30KP8nByPTqs-mjGDElpJw_1791255667
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso2005899a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791255667; x=1791860467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMmY6n/MH6ca3TbNnMvPhVpWJPvoIQVMRX+7sRuvar4=;
        b=TYcU4X04GJ++DFeVkDlJCSNcBaCtPNXPOe/qLFznltM6EiTVN1fPbkStAmYW73TZQB
         sjncvBuBl6IawOBai8dthGtiQ9Z8T+/dI/JbSZoQRvC0g0b256OjZksjpZ9RtlHxXy6E
         N3Y9cX4QE5WPqaRc+98Nk8/HY+f1UolPN4PhxqdtiLGJf3XVlERKrBLs8F+yfA4SnSJ6
         gZonqtAVMu/z1/VSiFS/qbG1Vx4+xNicrZOVCSMboyRjrSXqjiIhHoEmvnaBmDDhiXBu
         SCsmqCynlLm1DD78L20rGNj2tEJWtdposq6g2fXXeT9OZmOC5euMJHefkgfMwLAHoeeE
         /4aw==
X-Forwarded-Encrypted: i=1; AKwUvBybxu3JFfG5Fyk7xSoPa5NNRszcOCwqUJdDrASJrWonG5xxzO9FrlxjzujqhKXw2GP89RXv+G/Y6H8SCy7moK8I@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+TDcN9roi7f10KDgEgb6oEqbSuYuYr1Pc+nOyXolihrNoZrB9
	y65S7OIJApBtXHVvWcBepFuHac10O6QBUw2IHourEPHWZYx0SktPkLiBHqE6gsRgpEzIs9s+58M
	TC8/Ds8xGvlMPIIfy2EGZFKZtxLlxlFHT/Te0wp7TO/mjS/aXI03Xac7+aqw7jKV+bxDyU+Hptb
	ii
X-Gm-Gg: AYBFou2rzsvNNHQBfmSeoHsLgw5AqytULmZq33jg7CJFH8H16TrTITHIEWq56BsbZoC
	JDcKGTRwDztvVTTAZV6RPYtzWiiDiK5hWODG6EDjd3kp+jzZf3Hzoj7hMcMsHb39/xtmXEAJ/gZ
	5QOsQ/j1QE/uElX2WHMDjAbvGSkfyg92kk4M9vtPA2DMZj30vbsUEi+NeCrglQudX9JJBsvlTe3
	k7IB1TOz+iD/cSTGKpoIz8RTWzu0QKDIFjE9FcgPI1NUd+VY3nDvYf2LBRW7dYPBcEWpjO6ZXCz
	bdl8iKoWAy1oUJpqaUvnZ55cQ1leRTc2bjieKUYP3s4MfCvA3nZ+hZAiz9W0iPbRQfpTrGmqe+s
	mV7XBkgRR0pPMbJzyfkh6eENnKp4xHhDhrO/DLSZnVw==
X-Received: by 2002:a17:90b:4c4d:b0:3a8:240e:b493 with SMTP id 98e67ed59e1d1-3a8734fcaddmr7241a91.45.1791255666413;
        Mon, 05 Oct 2026 20:01:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4d:b0:3a8:240e:b493 with SMTP id 98e67ed59e1d1-3a8734fcaddmr7192a91.45.1791255665438;
        Mon, 05 Oct 2026 20:01:05 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd1c308csm8666500a91.2.2026.10.05.20.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:01:04 -0700 (PDT)
Message-ID: <b6de5d5c-e7e5-4e24-abd6-bdea9bcf8db6@redhat.com>
Date: Tue, 6 Oct 2026 13:00:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 11/23] KVM: arm64: Add VM specific callback for S2 MMU
 operations
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-12-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-12-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ElZn9wRI_y00TepmBJpxlBoo1XXNoiuMvFD0DvGNhLQ_1791255667
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_200111_583084_F5D86984 
X-CRM114-Status: GOOD (  27.76  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add VM type specific S2 MMU operation backends which can be initialized per
> VM flavor, to keep the handling cleaner.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Change since v21:
>   - Define all vm_s2_ops call back. All calls are mandatory.
>   - Define callback for each flavor, disjointing the non-protetcted pKVM and
>     normal KVM (VHE & nVHE) and remove the KVM_PGT_FN() hacks.
>   - Dropped Reviews due to the changes.
>   - Add "no_age_gfn" and "no_stage2_unmap_range" for pKVM callbacks, no_age_*
>     to be also reused by Realms later.
>   - Move kvm_vm_s2_ops field to keep the structure packed
> ---
>   arch/arm64/include/asm/kvm_host.h |  14 +++
>   arch/arm64/kvm/mmu.c              | 173 +++++++++++++++++++++++++-----
>   2 files changed, 160 insertions(+), 27 deletions(-)
> 

With the following nitpicks addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 839f5e9c7c65e..0778c308ce597 100644
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
> @@ -321,6 +334,7 @@ enum kvm_arm_vm_flavor {
>   
>   struct kvm_arch {
>   	struct kvm_s2_mmu mmu;
> +	const struct kvm_vm_s2_ops *vm_s2_ops;
>   
>   	enum kvm_arm_vm_flavor vm_flavor;
>   	/* Mandated version of PSCI */
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 4ae3bb6baef1a..c046c76833876 100644
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
> @@ -174,26 +188,31 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>    */
>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   {
> -	if (is_protected_kvm_enabled())
> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> -	else
> -		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> -	return 0;
> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
>   }
>   
> -int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> -				      gfn_t gfn, u64 nr_pages)
> +static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
> +					gfn_t gfn, u64 nr_pages)
> +{
> +	return pkvm_flush_remote_tlbs(kvm);

No need to have another function call, which causes unnecessary overhead?

	kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
	return 0;

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

Since we're here, the local variable 'addr' and 'size' can be dropped by:

	kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
                                  gfn << PAGE_SHIFT,
                                  nr_pages << PAGE_SHIFT);

  
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> +				     gfn_t gfn, u64 nr_pages)
> +{
> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs_range(kvm, gfn, nr_pages);
> +}
> +
>   static void *stage2_memcache_zalloc_page(void *arg)
>   {
>   	struct kvm_mmu_memory_cache *mc = arg;
> @@ -289,6 +308,27 @@ static void invalidate_icache_guest_page(void *va, size_t size)
>   	__invalidate_icache_guest_page(va, size);
>   }
>   
> +static void kvm_vm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
> +				      phys_addr_t start,
> +				      u64 size, bool may_block)
> +{
> +	WARN_ON(stage2_apply_range(mmu, start, start + size,
> +				   kvm_pgtable_stage2_unmap, may_block));
> +}
> +
> +static void pkvm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
> +				    phys_addr_t start,
> +				    u64 size, bool may_block)
> +{
> +	WARN_ON(stage2_apply_range(mmu, start, start + size,
> +				   pkvm_pgtable_stage2_unmap, may_block));
> +}
> +
> +static void no_stage2_unmap_range(struct kvm_s2_mmu *mmu,
> +				  phys_addr_t start, u64 size, bool may_block)
> +{
> +}
> +
>   /*
>    * Unmapping vs dcache management:
>    *
> @@ -329,15 +369,10 @@ void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
>   {
>   	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>   
> -	if (kvm_vm_is_protected(kvm))
> -		return;
> -
>   	lockdep_assert_held_write(&kvm->mmu_lock);
>   	WARN_ON(size & ~PAGE_MASK);
>   
> -	WARN_ON(stage2_apply_range(mmu, start, start + size,
> -				   KVM_PGT_FN(kvm_pgtable_stage2_unmap),
> -				   may_block));
> +	kvm->arch.vm_s2_ops->vm_stage2_unmap_range(mmu, start, size, may_block);
>   }
>   
>   void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
> @@ -977,6 +1012,12 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
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
> @@ -2441,34 +2482,68 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
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
> -	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
> +	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
>   						   range->start << PAGE_SHIFT,
>   						   size, true);
> +}
> +
> +static bool pkvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	u64 size = (range->end - range->start) << PAGE_SHIFT;
> +
> +	return pkvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
> +						    range->start << PAGE_SHIFT,
> +						    size, true);
> +}
> +
> +static bool no_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	/* The hypervisor doesn't support aging */
> +	return false;
> +}
> +
> +bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	if (!kvm->arch.mmu.pgt)
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
> -
> -	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
> +	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
>   						   range->start << PAGE_SHIFT,
>   						   size, false);
>   }
>   
> +static bool pkvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	u64 size = (range->end - range->start) << PAGE_SHIFT;
> +
> +	return pkvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
> +						    range->start << PAGE_SHIFT,
> +						    size, false);
> +}
> +
> +bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> +{
> +	if (!kvm->arch.mmu.pgt)
> +		return false;
> +
> +	return kvm->arch.vm_s2_ops->vm_test_age_gfn(kvm, range);
> +}
> +
>   phys_addr_t kvm_mmu_get_httbr(void)
>   {
>   	return __pa(hyp_pgtable->pgd);
> @@ -2790,3 +2865,47 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
>   
>   	trace_kvm_toggle_cache(*vcpu_pc(vcpu), was_enabled, now_enabled);
>   }
> +
> +static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
> +	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
> +	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
> +	.vm_age_gfn			= no_age_gfn,
> +	.vm_test_age_gfn		= no_age_gfn,
> +	.vm_stage2_unmap_range		= no_stage2_unmap_range,
> +};
> +
> +static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
> +	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
> +	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
> +	.vm_age_gfn			= pkvm_age_gfn,
> +	.vm_test_age_gfn		= pkvm_test_age_gfn,
> +	.vm_stage2_unmap_range		= pkvm_stage2_unmap_range,
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
> +		[flavor] = &(ops)

s/[flavor]/[(flavor)]

> +
> +static const struct kvm_vm_s2_ops *arm64_vm_s2_ops[] = {
> +	KVM_VM_S2_OPS(VM_VHE, kvm_default_vm_s2_ops),
> +	KVM_VM_S2_OPS(VM_NVHE, kvm_default_vm_s2_ops),
> +	KVM_VM_S2_OPS(VM_PKVM, pkvm_vm_s2_ops),
> +	KVM_VM_S2_OPS(VM_PROTECTED_PKVM, protected_pkvm_vm_s2_ops),
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


