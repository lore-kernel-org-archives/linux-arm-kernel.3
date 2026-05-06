Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20648CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 02:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZ2uNQaIyWygj63TOUGOyVmTMo1Pm5LqNBlZ9r/otPw=; b=iPrgxMLjWTQb5AJl5VdvKmPl4P
	ZLfVbARrZJZD2GA14A/oWrj5o8iZTet0Zva6BvVW4QJvEmZPxYya6lvmMZLfAKbuG+gbiQukJbgtt
	mLjJux2D1TMkKBcUL+Ook55RYMRVR39NRLJinPvEbrpsHQ5KhhQ3AQHNo0hCI9dI86XlWdYqxCSRs
	YVozXVbs6x9za8p3UyKg4WpLsro6sKFkGo+qNmZ7Go3hlC8YQD1iyNFPPomILfWole0rB7Gx891bh
	KC/YwjwhY+ZNYWy7PtSXs6Gks9nCQdp8pYCv8LKohVdkt1s10dYlYEWv1QFdvwtD52uCQW2W54VzS
	wgP/XGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKS2E-00000000WJ5-3iQS;
	Wed, 06 May 2026 02:30:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKS2D-00000000WIn-3OOS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 May 2026 02:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=kZ2uNQaIyWygj63TOUGOyVmTMo1Pm5LqNBlZ9r/otPw=; b=olxER0+So68F9hiEZgTr/Syoap
	l38sRuinQ+w4m3Re8uc1pkzI4avkxm7icju8/9i5kFSUIoD/5initL/tI3WI4Q8SCGc6H0ayfjbKN
	IMlEWuQ9CDBGejxwEzl5Ncb4v4zAg3r7bDdMxGhZwXc11uf2Epe/DaB9baqYCWTlTK1JEnYYEoreS
	6Lv29P395teCTnaz5m615+enzMwDZl5L4nJF4Io2P7ud/BH18ke8fwC8bI0AKVnmgtvFwT4KR9Zuy
	5C3gM+gZWj/VUS/VhSOrxvUUMVxHtPclNB/+9oZ9qNLm+2c43oXRp5kWMctpc7IjNbYZzkAxFbd+W
	ROm35u3Q==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKS28-00000000Y7O-2SAm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 02:30:48 +0000
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxsOrCp_ppL_oGAA--.22894S3;
	Wed, 06 May 2026 10:30:26 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxB8G1p_ppz2Z7AA--.24349S3;
	Wed, 06 May 2026 10:30:15 +0800 (CST)
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in
 kvm_arch_flush_shadow_all()
To: James Houghton <jthoughton@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Sean Christopherson <seanjc@google.com>,
 Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>,
 Ricardo Koller <ricarkol@google.com>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 James Hogan <jhogan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260504224213.1049426-1-jthoughton@google.com>
 <20260504224213.1049426-2-jthoughton@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <25838e74-01dd-d085-395b-676266dc9a9a@loongson.cn>
Date: Wed, 6 May 2026 10:27:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20260504224213.1049426-2-jthoughton@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJDxB8G1p_ppz2Z7AA--.24349S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWryxWry7uF4rWrWDXFy7Jwc_yoWrKFW7pF
	WDCa4DGr45Gr1Y9343Jw1DZw1F9ws5KF1fGFy5XayrtFyYv3s8K3WvyF1xAFW5JrZ7WFZa
	vF15Krn8A3yvywbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUceOJUUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_033045_506515_F63E18F2 
X-CRM114-Status: GOOD (  21.48  )
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



On 2026/5/5 上午6:42, James Houghton wrote:
> kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> concurrently in the event that the KVM's `mm` is __mmput() at the
> same time that last reference to the KVM is being dropped.
> 
> T1              T2
> KVM_CREATE_VM
>                  Get VM file from T1
> close VM
> exit_mm()       close VM
> 
> T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>      with only the KVM srcu read lock held.
> 
> T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
>      kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>      again, with only the KVM srcu read lock held.
By looking through the code, kvm_arch_destroy_vm() will free PGD page 
only, page table walking is executing in deleting memslot or exit_mm().

With normal code, life cycle of VM is something like this:
   KVM_CREATE_VM
     Create_VCPUs
     Create memslots
     Destroy_VCPUs
     Destroy memslots
   close VM
   exit_mm()

And there is kvm_get_kvm()/kvm_put_kvm() function call with 
creating/destroy vCPUs, however no such operations with memslot 
operation. Is it possible that VM is destroyed without removing 
memslots, such as the following operation.
   KVM_CREATE_VM
     Create memslots
   close VM
   exit_mm()

Regards
Bibo Mao

> 
> This leads to a potential double-free of
> kvm->arch.kvm_mmu_free_memory_cache and now with NV
> kvm->arch.nested_mmus.
> 
> Cc: stable@vger.kernel.org
> Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty logging is enabled")
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>   arch/arm64/include/asm/kvm_mmu.h |  1 +
>   arch/arm64/kvm/mmu.c             | 23 +++++++++++++++++++----
>   arch/arm64/kvm/nested.c          |  4 +++-
>   3 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index 01e9c72d6aa7..30d5c24fcebb 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -178,6 +178,7 @@ void stage2_unmap_vm(struct kvm *kvm);
>   int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long type);
>   void kvm_uninit_stage2_mmu(struct kvm *kvm);
>   void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
> +void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu);
>   int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>   			  phys_addr_t pa, unsigned long size, bool writable);
>   
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d089c107d9b7..4bab407d43bb 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1021,7 +1021,9 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   
>   void kvm_uninit_stage2_mmu(struct kvm *kvm)
>   {
> -	kvm_free_stage2_pgd(&kvm->arch.mmu);
> +	lockdep_assert_held_write(&kvm->mmu_lock);
> +
> +	kvm_free_stage2_pgd_locked(&kvm->arch.mmu);
>   	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
>   }
>   
> @@ -1095,12 +1097,14 @@ void stage2_unmap_vm(struct kvm *kvm)
>   	srcu_read_unlock(&kvm->srcu, idx);
>   }
>   
> -void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> +static void __kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu, bool locked)
>   {
>   	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>   	struct kvm_pgtable *pgt = NULL;
>   
> -	write_lock(&kvm->mmu_lock);
> +	if (!locked)
> +		write_lock(&kvm->mmu_lock);
> +
>   	pgt = mmu->pgt;
>   	if (pgt) {
>   		mmu->pgd_phys = 0;
> @@ -1111,7 +1115,8 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>   	if (kvm_is_nested_s2_mmu(kvm, mmu))
>   		kvm_init_nested_s2_mmu(mmu);
>   
> -	write_unlock(&kvm->mmu_lock);
> +	if (!locked)
> +		write_unlock(&kvm->mmu_lock);
>   
>   	if (pgt) {
>   		kvm_stage2_destroy(pgt);
> @@ -1119,6 +1124,16 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>   	}
>   }
>   
> +void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> +{
> +	__kvm_free_stage2_pgd(mmu, false);
> +}
> +
> +void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu)
> +{
> +	__kvm_free_stage2_pgd(mmu, true);
> +}
> +
>   static void hyp_mc_free_fn(void *addr, void *mc)
>   {
>   	struct kvm_hyp_memcache *memcache = mc;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 883b6c1008fb..977598bff5e6 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>   {
>   	int i;
>   
> +	guard(write_lock)(&kvm->mmu_lock);
> +
>   	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
>   		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
>   
>   		if (!WARN_ON(atomic_read(&mmu->refcnt)))
> -			kvm_free_stage2_pgd(mmu);
> +			kvm_free_stage2_pgd_locked(mmu);
>   	}
>   	kvfree(kvm->arch.nested_mmus);
>   	kvm->arch.nested_mmus = NULL;
> 


