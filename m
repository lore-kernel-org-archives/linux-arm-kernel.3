Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF237C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Abwexrx3STWIOFLMOpdQYYOfUcKsZm/bW7Oowebp/w=; b=SIdFzMb00iHLABZh9IxZIOCZs/
	WXnUhoTnrF0JGdX4Sd70+pbfRJHnpyrhdQBE8BbwxkL/neBqbeATC5IZ6jtOZh4SxpFDejuGig9GT
	fgm7/8MbNEi3clzlhemE+IZxlGx2g3cNUn7vZzl1NocK2eUgcmPbY4lhT5f+oVpwFCgwJ2qAFVG/5
	Emoky1OVvJg3X7ECiimcxObvVUUmP7ZSya80GJ26ZG4XSqaKljpl8bvp7/llMqJvq5rDNNLcFYT1N
	c4r7hUZCVPqicy/YZG4SNbABQch2wFZ+KjJYZGtpTPcYmDkLNzApjhuqVYNm7xqUFVB/mUcGkhgPA
	sUz9EkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SoU-00000009LhO-1O7X;
	Wed, 23 Sep 2026 19:39:30 +0000
Received: from out-163.mta1.migadu.com ([95.215.58.163] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SoR-00000009Lga-2keq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 19:39:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=HcEVCm7J07mW25PyHEIzQI7mWJneYzDJXYLjvDY/cSg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790192362; v=1; x=1790797162;
 b=KXNtAClFVoKOIuF1xFRMjxSrhYBviCBIS7fSmzdlN9smMqsu+INZQ2On9pHvsis3b9YF1gxe
 Byqyel6d4wHRhyOEZgZMNgjXFHve+GTqGKS+3uF4VrKTnfOoh/5gf8blwomcqhXgS08DSjrKQ39
 lkIksg2GMvRSuysyyBVTzL4U=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 527cd7c346545711;
	Wed, 23 Sep 2026 19:39:21 +0000
X-Mizu-Trace-ID: 527cd7c346545711
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8c42da963so2316e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:39:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxy8P4eAiQOSIm68NbFpdItGkH3ye3lc4ueMuBTXzUbfm6MQ4tXz/K/69nMdGyUaZFw1hVZeorq2PPAIxaiOmbh@lists.infradead.org
X-Gm-Message-State: AFuF++luR6p5/rbIt+exo54Px+M+7UfIQgTUZgBsWProlK/DhU3bXCMT
	PyeIQYr/wpAqARf8dkz+xvSDIF9HdFOx1zHMoz0BppyD4MY0OqXZ+M8AFyAL3F4NxCZpZ4HeSvE
	oOXGNHz3e7J53n4rsUf1FuzisBxdDjpp8kcfJAgFB
X-Received: by 2002:a05:6512:b23:b0:5b4:9dba:7403 with SMTP id
 2adb3069b0e04-5b8de5db629mr43994e87.13.1790192355078; Wed, 23 Sep 2026
 12:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com> <20260922130821.1666713-4-vdonnefort@google.com>
In-Reply-To: <20260922130821.1666713-4-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 20:38:38 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw6VJr9do3=S9yoHoAwFe7LQFUV1iTFqzzBZXcb12_0LA@mail.gmail.com>
X-Gm-Features: AclHuK-nljR5CfJ4sg1KRiiyGWOOUzMiszja47ySxMb79yFhQ355YotVV0O1BPY
Message-ID: <CA+EHjTw6VJr9do3=S9yoHoAwFe7LQFUV1iTFqzzBZXcb12_0LA@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] KVM: arm64: Move pkvm_mem_abort()
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_123927_845024_36562E35 
X-CRM114-Status: GOOD (  25.86  )
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

On Tue, 22 Sept 2026 at 14:08, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
>
> Move pkvm_mem_abort() below kvm_s2_fault_get_vma_info() so it can
> resolve stage-2 fault VMA metadata without forward declarations.
>
> No functional change intended.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 138 +++++++++++++++++++++----------------------
>  1 file changed, 69 insertions(+), 69 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9dfaf4f277b5..242f63066252 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1706,75 +1706,6 @@ struct kvm_s2_fault_vma_info {
>         bool            map_non_cacheable;
>  };
>
> -static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> -{
> -       unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
> -       struct kvm_vcpu *vcpu = s2fd->vcpu;
> -       struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> -       struct mm_struct *mm = current->mm;
> -       struct kvm *kvm = vcpu->kvm;
> -       void *hyp_memcache;
> -       struct page *page;
> -       int ret;
> -
> -       hyp_memcache = get_mmu_memcache(vcpu);
> -       ret = topup_mmu_memcache(vcpu, hyp_memcache);
> -       if (ret)
> -               return -ENOMEM;
> -
> -       ret = account_locked_vm(mm, 1, true);
> -       if (ret)
> -               return ret;
> -
> -       mmap_read_lock(mm);
> -       ret = pin_user_pages(s2fd->hva, 1, flags, &page);
> -       mmap_read_unlock(mm);
> -
> -       if (ret == -EHWPOISON) {
> -               kvm_send_hwpoison_signal(s2fd->hva, PAGE_SHIFT);
> -               ret = 0;
> -               goto dec_account;
> -       } else if (ret != 1) {
> -               ret = -EFAULT;
> -               goto dec_account;
> -       } else if (!folio_test_swapbacked(page_folio(page))) {
> -               /*
> -                * We really can't deal with page-cache pages returned by GUP
> -                * because (a) we may trigger writeback of a page for which we
> -                * no longer have access and (b) page_mkclean() won't find the
> -                * stage-2 mapping in the rmap so we can get out-of-whack with
> -                * the filesystem when marking the page dirty during unpinning
> -                * (see cc5095747edf ("ext4: don't BUG if someone dirty pages
> -                * without asking ext4 first")).
> -                *
> -                * Ideally we'd just restrict ourselves to anonymous pages, but
> -                * we also want to allow memfd (i.e. shmem) pages, so check for
> -                * pages backed by swap in the knowledge that the GUP pin will
> -                * prevent try_to_unmap() from succeeding.
> -                */
> -               ret = -EIO;
> -               goto unpin;
> -       }
> -
> -       write_lock(&kvm->mmu_lock);
> -       ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
> -                                     page_to_phys(page), KVM_PGTABLE_PROT_RWX,
> -                                     hyp_memcache, 0);
> -       write_unlock(&kvm->mmu_lock);
> -       if (ret) {
> -               if (ret == -EAGAIN)
> -                       ret = 0;
> -               goto unpin;
> -       }
> -
> -       return 0;
> -unpin:
> -       unpin_user_pages(&page, 1);
> -dec_account:
> -       account_locked_vm(mm, 1, false);
> -       return ret;
> -}
> -
>  static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>                                      struct kvm_s2_fault_vma_info *s2vi,
>                                      struct vm_area_struct *vma)
> @@ -2235,6 +2166,75 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>         return 0;
>  }
>
> +static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> +{
> +       unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
> +       struct kvm_vcpu *vcpu = s2fd->vcpu;
> +       struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +       struct mm_struct *mm = current->mm;
> +       struct kvm *kvm = vcpu->kvm;
> +       void *hyp_memcache;
> +       struct page *page;
> +       int ret;
> +
> +       hyp_memcache = get_mmu_memcache(vcpu);
> +       ret = topup_mmu_memcache(vcpu, hyp_memcache);
> +       if (ret)
> +               return -ENOMEM;
> +
> +       ret = account_locked_vm(mm, 1, true);
> +       if (ret)
> +               return ret;
> +
> +       mmap_read_lock(mm);
> +       ret = pin_user_pages(s2fd->hva, 1, flags, &page);
> +       mmap_read_unlock(mm);
> +
> +       if (ret == -EHWPOISON) {
> +               kvm_send_hwpoison_signal(s2fd->hva, PAGE_SHIFT);
> +               ret = 0;
> +               goto dec_account;
> +       } else if (ret != 1) {
> +               ret = -EFAULT;
> +               goto dec_account;
> +       } else if (!folio_test_swapbacked(page_folio(page))) {
> +               /*
> +                * We really can't deal with page-cache pages returned by GUP
> +                * because (a) we may trigger writeback of a page for which we
> +                * no longer have access and (b) page_mkclean() won't find the
> +                * stage-2 mapping in the rmap so we can get out-of-whack with
> +                * the filesystem when marking the page dirty during unpinning
> +                * (see cc5095747edf ("ext4: don't BUG if someone dirty pages
> +                * without asking ext4 first")).
> +                *
> +                * Ideally we'd just restrict ourselves to anonymous pages, but
> +                * we also want to allow memfd (i.e. shmem) pages, so check for
> +                * pages backed by swap in the knowledge that the GUP pin will
> +                * prevent try_to_unmap() from succeeding.
> +                */
> +               ret = -EIO;
> +               goto unpin;
> +       }
> +
> +       write_lock(&kvm->mmu_lock);
> +       ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
> +                                     page_to_phys(page), KVM_PGTABLE_PROT_RWX,
> +                                     hyp_memcache, 0);
> +       write_unlock(&kvm->mmu_lock);
> +       if (ret) {
> +               if (ret == -EAGAIN)
> +                       ret = 0;
> +               goto unpin;
> +       }
> +
> +       return 0;
> +unpin:
> +       unpin_user_pages(&page, 1);
> +dec_account:
> +       account_locked_vm(mm, 1, false);
> +       return ret;
> +}
> +
>  /**
>   * kvm_handle_guest_abort - handles all 2nd stage aborts
>   * @vcpu:      the VCPU pointer
> --
> 2.55.0.1082.g2b9226bbc0-goog
>
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

