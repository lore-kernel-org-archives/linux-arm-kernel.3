Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559DA1049515
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Znk/o3FTTjA1o6iiBb0OLOctvOKJgNWplDqjz3yVrX4=; b=HRlnu4/0uIgXlAT9FPiVuVFjaI
	tcWAi3NfvI0EFwNlGIGHWBU8ZSsnBDjYSF5FzqJVectL2/s2jJrQEmm2MZqB5PHYE9gWKV2STa445
	VC0xtqSF0mL2Ae0FuzH0F4ykBFoBraVd7me3ciL0nZVDSF/SF3PKxOBchU/w19LGHfO4kDqU17Cho
	da0HCQ1wCCbFt7IoMmly1aIA46Fiv5NnqUUqKMeg7iIUb8ZF6hXeGHC0mv6PFHgVxhE/0/oQp/n54
	FbYt99EpCk/Y7cmHRzDvUuDoVn3VWyi5i0VjUZZjC/Lo6byxK/YNif8w1jKIX05zmFd4CwaM63tpY
	wYQdynew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gj5-0000000BPc9-3m1X;
	Wed, 11 Mar 2026 10:23:39 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gj3-0000000BPba-2Tj2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:23:38 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-5091ed02c54so404151cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224616; cv=none;
        d=google.com; s=arc-20240605;
        b=cZHTbp+Y86QeJdjief7ILtGrYSY18lzufybQ1gownOmpozHizlLVR3/geMEmFXl4d/
         iY0X+AWNJfemCR3IjCzPvpurwbxYPiyC2ojOLiyhCqEACNeenSnuyAzvYw0Gl0wrUu6+
         QPXSBjhd5XXL0bwE1wwLqndaKRrLjBewrhTt+LHwnrvbOIB4t+JbU1tFlLLbE0gxmek5
         +pPrlsbt5JFIsXKADWEtFRXkXkykvbfeN9DGBVv0cgpfwZ9Urjp9oo49KjxBBxtfceuU
         gCUofOsRWsMgnpBYc/Ppc3M6EKGwm2hr6k62c0ZCvSPgXhkrT0bKYthOEHav5SOdFgCJ
         JWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Znk/o3FTTjA1o6iiBb0OLOctvOKJgNWplDqjz3yVrX4=;
        fh=UtvgimqV4eyJA1p4SFDoYRMu8zbVOdW1ejmSvzBSgG8=;
        b=TOJ8hZuNrIrCwrn08z/0upWMAH5WtHkcODnpBm8kI7Wjeb26UcaM5yOyjyrFq6mO4v
         /+VYf3g3IFUVPCcXiCZ4IVSvSRsBPfvVVl1IIvVL4y0aUObrBwDHG9NOyhpIeKLmDW/0
         Vwo/jyHRIOo8pvIeXzJDoGp8l8l67gAxIn0P8AX3UUzPsuGMS+LXH90INcNu5m4clYW6
         JzSdT7w+fNB2x1zK/TYsMcZ3ayx8/4Z9beSJALZMTufNcfsVuAs8teVRVgzrNblKGhVp
         c4+xTYVAZcGLY4qlKsM+BVZWqIepboZIBCyHxcglqy2OMzX+chUUPwa5P+YBtz4iVRRo
         owew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224616; x=1773829416; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Znk/o3FTTjA1o6iiBb0OLOctvOKJgNWplDqjz3yVrX4=;
        b=yGdkGNxIjKR6sj5PZkftkAPi2GpHw1piUeCOE0mvk1zTgGD3gC5oOy02O5mX5u2686
         wGb47V1m4sb92z8Vl2eTy27SFCuXaQ53tARB2f3kpvqgShX+DmE8zlgP496Olzki/Y6B
         u6AsYsLSGDBaAz5WWg9T0UNKoWCfvBzHbO6X556QW7jCfMlS82F+RiNALyu1PFYqhsmX
         rw5h1i0hQfEGli1RJLObFqtu3DIk0Ch1S+MIJLLVWUB8rTwrJJH/+4hijWJUmSfkf4U8
         Nqb477z0t+ApgSHCaWPhLhZLIT3u8HQNovzz5T5bkVBMGyxHf2Lv88c9/DYG1th5shJ7
         FF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224616; x=1773829416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Znk/o3FTTjA1o6iiBb0OLOctvOKJgNWplDqjz3yVrX4=;
        b=P8jZyPZnLzw7QyVqjQeyA/bNtaULb+KjJVtiZ2C+UgNmnt5OZxavvz+W4tQcjFC75C
         7ToUENNSwe1/bRszfMQP/y46JC1p5qZBS+F//RIH4iMPLPpZ8p9YvHHcDVXykF7zwvgF
         k3O/icECPLloOBpiN4iHb2UedG8jAhq10bLP5Ve8mkExIt8xl2uLaWmM4D601bSeMZV9
         wB3YGDvYsJUTDc7cHK9vKe184C3z5kWdgm7AUEcHeQhC2ykqWY5IH5x62cCUvnD0pUok
         zhOQkRzYpCIfiobYL+bDP8mnW+4Jr2fRqRdbjdqP3F75Pv/NIV6NbXA5nDHHy5pt0tz0
         yOsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVRYDqFVPXoGx5WFJzlKWbBe02s2B5xRrl461KYhGFv2SfbP13uKC7EUbONov9qKNzTUqkXzAciiJkcQlBs39I@lists.infradead.org
X-Gm-Message-State: AOJu0YxDTWYZtNSv1a7hblpunm6gFzDdmGlDC8rIjE7O5/5GFjzuvSCr
	zgk6xIua6j73gN83mf5BjRjYErl/y/lmcifMfq+ZjFzUh+6ceiDGgZGf/gy/yuX4HDul7s5cgc+
	SsmFUDM2TugW2haobz49wjaEMN03+TfqOnOGxQOD2
X-Gm-Gg: ATEYQzw+QVfnwrxuIvHdCQ2rVCx86hrM/Qp2FN+hojkIwQ7zJIJxiVoBMdY9VKYkd4X
	Rwh5odDEjYDu5ntHE/suA3hdWSPmzFkCnumcuTxMywpiViKEIDBzcQ7bIHw1a0WXUp2OLzLAJAZ
	roeKg8awL4Qhc2VJZVl5ZdP2s5vJSTWLMkm27l1ExyWYb0u6P7NEsomGv9XoyNVnt/84q7Z3VzR
	wyPKb0UuuHI4dEkk7TrsuIceVfFf9WpEDZwUZCL+lSQ8NaPIDJpMLm5IdeN1ezagt5uWSNkseJx
	aVd+LTSFtyCF71PoQJv368uSdAf1sWYoJfnJeA==
X-Received: by 2002:a05:622a:14cb:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-5093818c817mr10979211cf.2.1773224615864; Wed, 11 Mar 2026
 03:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-14-will@kernel.org>
In-Reply-To: <20260305144351.17071-14-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:22:58 +0000
X-Gm-Features: AaiRm51nPsb7tNbmy2Jyecx_WTDjL9A5ByE7o_zgvxGOIXmo2XmEdSMXGPWCjcc
Message-ID: <CA+EHjTzCzgMRF7uirWtd7GjXqjTvUf8sootS5yzj2nfQxMZMVg@mail.gmail.com>
Subject: Re: [PATCH v3 13/36] KVM: arm64: Handle aborts from protected VMs
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032337_651145_858C983F 
X-CRM114-Status: GOOD (  27.26  )
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

On Thu, 5 Mar 2026 at 14:44, Will Deacon <will@kernel.org> wrote:
>
> Introduce a new abort handler for resolving stage-2 page faults from
> protected VMs by pinning and donating anonymous memory. This is
> considerably simpler than the infamous user_mem_abort() as we only have
> to deal with translation faults at the pte level.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/arm64/kvm/mmu.c | 89 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 81 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9d183df0b0ac..4e64528d86a6 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1642,6 +1642,74 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>         return ret != -EAGAIN ? ret : 0;
>  }
>
> +static int pkvm_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> +               struct kvm_memory_slot *memslot, unsigned long hva)
> +{
> +       unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
> +       struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +       struct mm_struct *mm = current->mm;
> +       struct kvm *kvm = vcpu->kvm;
> +       void *hyp_memcache;
> +       struct page *page;
> +       int ret;
> +
> +       ret = prepare_mmu_memcache(vcpu, true, &hyp_memcache);
> +       if (ret)
> +               return -ENOMEM;
> +
> +       ret = account_locked_vm(mm, 1, true);
> +       if (ret)
> +               return ret;
> +
> +       mmap_read_lock(mm);
> +       ret = pin_user_pages(hva, 1, flags, &page);
> +       mmap_read_unlock(mm);
> +
> +       if (ret == -EHWPOISON) {
> +               kvm_send_hwpoison_signal(hva, PAGE_SHIFT);
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
> +       ret = pkvm_pgtable_stage2_map(pgt, fault_ipa, PAGE_SIZE,
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
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                           struct kvm_s2_trans *nested,
>                           struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -2201,15 +2269,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>                 goto out_unlock;
>         }
>
> -       VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> -                       !write_fault && !kvm_vcpu_trap_is_exec_fault(vcpu));
> +       if (kvm_vm_is_protected(vcpu->kvm)) {
> +               ret = pkvm_mem_abort(vcpu, fault_ipa, memslot, hva);
> +       } else {
> +               VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> +                               !write_fault &&
> +                               !kvm_vcpu_trap_is_exec_fault(vcpu));
>
> -       if (kvm_slot_has_gmem(memslot))
> -               ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
> -                                esr_fsc_is_permission_fault(esr));
> -       else
> -               ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> -                                    esr_fsc_is_permission_fault(esr));
> +               if (kvm_slot_has_gmem(memslot))
> +                       ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
> +                                        esr_fsc_is_permission_fault(esr));
> +               else
> +                       ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> +                                            esr_fsc_is_permission_fault(esr));
> +       }
>         if (ret == 0)
>                 ret = 1;
>  out:
> --
> 2.53.0.473.g4a7958ca14-goog
>

