Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8746D104BECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bX+mY2WVrmnpJpn2taxiXuV/3B4F/EocZyWSHgahxE8=; b=smy6RJlUpmfflkFZe7x5DE18pw
	NneOG17HV1kIuNw8EfdWcA8vqn6jn0aXM0flOnClvSJOFVasC4u31TsYP1EeAmuII+g6FYEpbexyr
	eIWhTizFHrHfBMRRTtxgeoMFEbNi4jfWn3BRXIarbWh7bgY26dsAewTFAZvxco360ag+1342ktN5B
	l4pYA3EJR+tkYvpMtXBfkDdolU+8Cf7/14wBb7vk+D7UnqQdFrsHd3j+Xah/oU2dCDJByN5pJcFT/
	NM8LxJKWwmKuNvpC6Nu6cz4ys+58NctXgH2sZS9VtqahFUYpEhRqtRkjYriGDatEeq9D9P2cwRRkc
	WXBFi66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GkZ-0000000BPts-1WTr;
	Wed, 11 Mar 2026 10:25:11 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GkW-0000000BPtM-2EU3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:25:10 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50906a98ffeso521881cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224707; cv=none;
        d=google.com; s=arc-20240605;
        b=iyJq58aTXILKwvyJBHZ0J3lj8L44umuhN4KSJzSFyXy57ZzdZR74vWsYcYPJw1EgKu
         USFugYvsbhuQKrTGO24wJabWuaq1VskNPJZIdJ4jDgcsbqY6d8st/249ASMS7PdoIj+u
         1gqF3e6CiOfs/ptw0gDuXs2CSwsx+YE8KITV1RrJUSb7IzNrU/RqYjNATo2YboabPf12
         3vU9QBjIGML2/O0ybTf7OYIQHWd3YrxvhOtmdSM6YANUCjHp99JjSPUC7TvvPOC72FWz
         ie/Qsa4pkOHzVxqHN97Uj4Lr4X0GJfSdlzQBSxUWIkDH8EVJvsrnbt/MdnbSXZG9IenX
         BQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bX+mY2WVrmnpJpn2taxiXuV/3B4F/EocZyWSHgahxE8=;
        fh=V3Dtdc+m82ljNuhWiJajf9cspvC50LIt/2jz6k98ib4=;
        b=KG304zCcXb5iOUAr/k515bVRWiKQQT9GdErfyAXXpJUywOJRuya2IgJfSD4qgr9tZi
         lTBl2yWWGo450XpcatNnEimmGnstOU+oO173DyzG/emq7Gwwodqq46eEi4T1ktUa8rkX
         sCipB17fS/0PD8PtINetyFqfnRJord/M+1cE7veDqno3AaU3+4Cq7SgCVRdDyN21AieK
         Inqmzn5kaCLtyXAlxnB/+XlK3jWG7kBQw1vUUJQ3QmOJHYMyM25LnC8adlDfpIRF0pqO
         sBAZqAqio+S+SGSn9q9TzBC4MzxZ6hDZmS0YDn5J2GSQebV5Of5Z3TYEWF7W6Iol16AT
         R7TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224707; x=1773829507; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bX+mY2WVrmnpJpn2taxiXuV/3B4F/EocZyWSHgahxE8=;
        b=iiId52V9wCAL/AqTNQnAyTRBfRUwxB0WyXS5+IljSZujzgRR5XLKDXtYkKLb0aE6An
         JTjajgVSOY2rHltcEqHE7xRB1U0IZmdNEUqM58WBC4HccQyWsuWWF8WYDFeDYh6r77DC
         nIaImXijmAXBmWTziKiYlF8YqKc2jf2Vhgdk2iY2mhnHzXapyKH59gEvzuUvc5VjC2R1
         eFWT6a17Vy5kOBK5B9PkH/yJXLU4FuI7z8kha6f8QYYi1m9xh9hq9AVlZGRgUkPc6TUP
         LEStvC9rgdulp66PHlsQD3Kg/HY62O9812wxIFM9pdzvO11DAWrr4J2goJyXSkH/lCmu
         tOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224707; x=1773829507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX+mY2WVrmnpJpn2taxiXuV/3B4F/EocZyWSHgahxE8=;
        b=euueg2awBz4jgsDwgsSZg1Iiy4JmIU3I/T7+PX9M9qkS+0I3rXm4DyqnsHvG+JObCZ
         0PK9rmNAs/Ljjh9gM777TM/ILfJM/ng4QGdDD1yXqNsaLtdkwELrZG6nYjx96bEWBt7D
         YujHNzK1DEbgHZeG8hPJglyNZDLEgmIfzS+kqNB/Tqy2+dgSX3TjeHJ9n26473WUVfIp
         0sGH30zUkgU+PSBgbmuPH/Zj+zRyLhaex211OlxM6Wm98EC203vL9KSS+gVfizBn7R1q
         HmjqyvHwWXp83pa43ZNu2WgRmCTXhGweEL/OvNvFnr8nvtwuYQDxvQCXTxysJeh/RShN
         ePdg==
X-Forwarded-Encrypted: i=1; AJvYcCXyAk4KpRg3SUjWUaD4yPjXOwHzRcAaFOji3JsKgYJaF/Ds7kUqyr/N35wgC8lCR1ajq95KpwMqYaoIbKsGlaJs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt51VixMEjB4tsy+oR+EsvsBqomLl8e3SKnPMqj4yMCdkkBkaF
	o7FJbyGyqT3E6Gf3/TcfqgvmvKNFxV3dxQho0HRJyaHq8pyBI8oRlaKEbfsSm9vxDDEDY05Us1q
	7bw8ILj3azaUo157NUfgmxnZZ5T/kQo1csqVDsyHL
X-Gm-Gg: ATEYQzwq7b95YMwVYzQMBZxxPXGBTtXJeSqtl7pG61S0FSEsDXXVlajx8pUfyibwW/T
	UsMHhhr5TzgjjT5vuw0zGC/+7na22zIYNNukGwPGCnOpWcrr4/Av2YZ7JYL+zbuYSN85tYTG7It
	mVOExkDg/OmVkb32etftSkkD0i9/7MR9WUNL40aRmHkKoz74w7B9OvGEmqT22cB2KIOJDvVapTv
	SpqiVeGtap9wsbIiT0TvbvI1EmO/5kMZj+IPADIfg3Gc+ocGZh+dZtriC6mOzKtZpZD4r3JYQ+V
	qIpslKfBRxqZjl3tlK3lQYJ0zPvvkxiEmn75YQ==
X-Received: by 2002:a05:622a:11d5:b0:509:174d:3224 with SMTP id
 d75a77b69052e-50939a12f0amr9025571cf.11.1773224706917; Wed, 11 Mar 2026
 03:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260119124629.2563-1-will@kernel.org> <20260119124629.2563-15-will@kernel.org>
In-Reply-To: <20260119124629.2563-15-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:24:30 +0000
X-Gm-Features: AaiRm53g6mmzRXB6NETrMopC8OxkyI8MPN0iN1tfTmOqJxXbfxGb6_DHFLuJIms
Message-ID: <CA+EHjTzst-FLQ=6Zn=ERDHpeKWd=3w3WeAhZ9PUEjqw5a1vPtA@mail.gmail.com>
Subject: Re: [PATCH v2 14/35] KVM: arm64: Handle aborts from protected VMs
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032508_605731_39041388 
X-CRM114-Status: GOOD (  27.19  )
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

On Mon, 19 Jan 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
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
> index a23a4b7f108c..b21a5bf3d104 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1641,6 +1641,74 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
> @@ -2190,15 +2258,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
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
> 2.52.0.457.g6b5491de43-goog
>

