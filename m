Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83517FED9EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56JhFUvPim0I8UWBjC9j9wiB/+QEOjM1sZN9Bz2BVWE=; b=zP2q6tuooLrvW3+Bfns2wZmtNr
	nSy7HMHqIHlQP9sVZ+URf7H295M9qCCOiPqRiV+3tVKw27XIlwxEHMT/ttluy3RLZOyM0zgubDleN
	jK26RoFYQ6Y5n4oP2GV6i9RPCAJyoP07ACk2R4DQBP8cjgSSnX1IV++0CdStPpyJ4kOqihd+VtOuy
	/XylROTAcEqufWVKwASy14JkVv/8T9M3fJ2IXc+OPzHbht4+bZCk4vcWsomssDz+srAIIMp1lX3gl
	0Fy7wTnJjx+qbt9MdjEpXkxanzOOOz1ufxjS3K4bYYVTkLCKLc0gw5afMBcbHfToJmgPMRJrlvars
	QSSbeTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XYg-00000006rHW-3TJv;
	Tue, 17 Mar 2026 16:46:18 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2XYc-00000006rFu-0W1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:46:17 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-509062d829dso657141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 09:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773765973; cv=none;
        d=google.com; s=arc-20240605;
        b=HHOo3gU29KElXbY38zAfOTx864M4oK4aH3PGKAwSQ4l76eWOGGKIswb7L4rlQqiK5k
         NOwDvXBtxE8SquLaYjrhiwfVIGi7J1o5/LxI9e5IbjB6k6n+JbjCGD0so9DxNrcvRUF6
         6uc3RO6/kZqRjMXD7eyNo8UWhvaxSjYbC02EG2H9IQJXUbK8RfKeHh4hj+M8OAnhT7wB
         qpU29iJKSX4JzxdJTSGASf4cJjBcwHVKKckdOZm4w7uAMMYINT0nbnkbl79zGYQj7hot
         vrqc9GzeqnkKFWoNVuEnGMHBw+BmU1tFYAH66WWiuk4iysEoLjsPunMiU1va3Qomx+uV
         xDew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=56JhFUvPim0I8UWBjC9j9wiB/+QEOjM1sZN9Bz2BVWE=;
        fh=9Th7vNHJnIY4ahAF3E7xJKlCWPXYM8onAEhL2Yh1Crs=;
        b=Vu1pHcS+kvuhJeC795iCVH6bERNT0aXliLX2B1k0KfH2jTdvxEMoLErwVuGmy1pToD
         uzYH4M3pwliVsbe/GvZDtY3iIGX5n1XTwqDZoBd4qtEPd79mNJVXZbK0FBhrccUIGkTC
         LFxSeCrzZV1ADXA+sAMoYkYVDmLZRQvjwNp96+8f2dtWy2Ly6I6ZgAmzq9gCrxsSj4df
         zRyu/zARgjN80H+HgiKY6sIMj1qLnswqdtgjZzPa+vnEswlWwiKgu9J6o0fSebmNax9H
         0j5aZ9gDYw6AE7wGZf8qb2LQEzz3PKIJr2hFEBbaA/xEXnkEShid3Am67L3oqwd08tAV
         W+HA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773765973; x=1774370773; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=56JhFUvPim0I8UWBjC9j9wiB/+QEOjM1sZN9Bz2BVWE=;
        b=DeVg1Og7z8fuNUNBIguqv4z+4n3SBKKkjK0A5ZpmB/ABSuxXfTY5+II4f9NHwz/cUI
         cNi+dLlzNo3Wv3f7wb6uNDz2Ohhf4PE4zfmG6sZ2OATkSh7UzeO/oIapxNP8z2JbaKd4
         CqpF8fmMLiJnEkvPMgAQu+c1ZZ0PIclos/AVzHudv5R0jmXwtcE+3tke3C8gSjcTcxuM
         TuZloSU3ndRIVoq2MGGkcqPrFib5Hr4Rk7CJGKkAOVRiMga5dpG0W3uq02gOwANLWojl
         L43qijq06+DneV06BaMiOcdl7ORYCRG7VMphcB9Ucvm7NWev5ctiIyP7OcdWmoRFfgIU
         rY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773765973; x=1774370773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56JhFUvPim0I8UWBjC9j9wiB/+QEOjM1sZN9Bz2BVWE=;
        b=GwTEGD/IVn/rnYzWWNSJwcQMEEtTuy96UKf0J4v8PrFeJDGQXc2p6TIT+UqtPS4/Fx
         Oi8Vu4keO+bEtzjoqKs0MTRQtvCkaifwWN/CCyfdp1ddJSXAojLsEPXt5o6plMut3AVp
         E6ST09XuiXd7Ptf85X9gO8O5KkA7XATePQEMbFj9tjqoAEsIyDkIfq4v3oGjCDOXje9i
         5suxLmIlcKluw9H61hCDnlsSzXTAJ5pMxq1KzAjoGH/ZpQFWuAvB6su2pSQz1hytKls3
         lMEKo8jFp+7crCg8pcPjILuNe4ImD8c/53/QJIehRGGmCVUctYl3jwQZVat59Fa/kpkF
         6QgA==
X-Forwarded-Encrypted: i=1; AJvYcCWaXFIXBe63e0UqhKtgjdOwkCISG3NDFDmy3AberVzjbpcaOS7h5SnVw5F6JI8p7zHExJ8x2aPziOnBvXGqzz6A@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj67RatJC8oxrHTpIi4goT/9+40e8GiBRNmWGiRn64pgrZujIu
	gpTxO80aID823X20pzdWXtBn7oW6h6Yi5jezePu7Qn7oPFrSy0d54Tvl45UFmJ1rdCR88LubZEM
	hxh6j496jU6BUIXKiJ888DZjEynAKA0kOkYBER/sRungPWgERsRxczNM7
X-Gm-Gg: ATEYQzwILwEwi5+roGUe7XycGoLuMI/L2cGHSyJ2AlPyq9AmJhrNcWswOBV3Q4ZAkaL
	xA4HRAO8xkm+UDuhJJJl8KKf1zgsAw4C9IU9TiKW/GnnnowqAPSuh3JUK8ec1Q4fkR/I2FYE0Bs
	uErUB5lGSi3eKXjG1LeEV8AqJV/bHWsvlg8mn9e62u8iYfWUZ5g+j24y9kshX5x7kPlJeJm0qXJ
	x2QbYP8PJ46HLLrPZ05tiPayPDNWSuEt6ZKzPyD+XG3kAyvinuBOjd00fBGifEB3YCasEQQFrNd
	h1gdv/8jHDchl766SU6X4pV7+guZ5LZKODN4
X-Received: by 2002:ac8:5a50:0:b0:509:25d8:9991 with SMTP id
 d75a77b69052e-50998d8a826mr18135281cf.16.1773765971977; Tue, 17 Mar 2026
 09:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-17-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-17-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 16:45:34 +0000
X-Gm-Features: AaiRm50QV38tMVTJx5jeQhSTqhe674956DZz173j0zE_uw_tZBeVRrZc57e2Bak
Message-ID: <CA+EHjTy4n+FWqsqHk3jJP5J5VfgaVMXvYCPnPATG7FynYzEg2A@mail.gmail.com>
Subject: Re: [PATCH 16/17] KVM: arm64: Simplify integration of adjust_nested_*_perms()
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_094615_393040_D8DD5D32 
X-CRM114-Status: GOOD (  24.20  )
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

On Mon, 16 Mar 2026 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
>
> Instead of passing pointers to adjust_nested_*_perms(), allow
> them to return a new set of permissions.
>
> With some careful moving around so that the canonical permissions
> are computed before the nested ones are applied, we end-up with
> a bit less code, and something a bit more readable.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 62 +++++++++++++++++++-------------------------
>  1 file changed, 27 insertions(+), 35 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9b5df70807875..18cf7e6ba786d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1544,32 +1544,34 @@ static int prepare_mmu_memcache(struct kvm_vcpu *vcpu, bool topup_memcache,
>   * TLB invalidation from the guest and used to limit the invalidation scope if a
>   * TTL hint or a range isn't provided.
>   */
> -static void adjust_nested_fault_perms(struct kvm_s2_trans *nested,
> -                                     enum kvm_pgtable_prot *prot,
> -                                     bool *writable)
> +static enum kvm_pgtable_prot adjust_nested_fault_perms(struct kvm_s2_trans *nested,
> +                                                      enum kvm_pgtable_prot prot)
>  {
> -       *writable &= kvm_s2_trans_writable(nested);
> +       if (!kvm_s2_trans_writable(nested))
> +               prot &= ~KVM_PGTABLE_PROT_W;
>         if (!kvm_s2_trans_readable(nested))
> -               *prot &= ~KVM_PGTABLE_PROT_R;
> +               prot &= ~KVM_PGTABLE_PROT_R;
>
> -       *prot |= kvm_encode_nested_level(nested);
> +       return prot | kvm_encode_nested_level(nested);
>  }
>
> -static void adjust_nested_exec_perms(struct kvm *kvm,
> -                                    struct kvm_s2_trans *nested,
> -                                    enum kvm_pgtable_prot *prot)
> +static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
> +                                                     struct kvm_s2_trans *nested,
> +                                                     enum kvm_pgtable_prot prot)
>  {
>         if (!kvm_s2_trans_exec_el0(kvm, nested))
> -               *prot &= ~KVM_PGTABLE_PROT_UX;
> +               prot &= ~KVM_PGTABLE_PROT_UX;
>         if (!kvm_s2_trans_exec_el1(kvm, nested))
> -               *prot &= ~KVM_PGTABLE_PROT_PX;
> +               prot &= ~KVM_PGTABLE_PROT_PX;
> +
> +       return prot;
>  }
>
>  static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                       struct kvm_s2_trans *nested,
>                       struct kvm_memory_slot *memslot, bool is_perm)
>  {
> -       bool write_fault, exec_fault, writable;
> +       bool write_fault, exec_fault;
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>         struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> @@ -1606,19 +1608,17 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                 return ret;
>         }
>
> -       writable = !(memslot->flags & KVM_MEM_READONLY);
> +       if (!(memslot->flags & KVM_MEM_READONLY))
> +               prot |= KVM_PGTABLE_PROT_W;
>
>         if (nested)
> -               adjust_nested_fault_perms(nested, &prot, &writable);
> -
> -       if (writable)
> -               prot |= KVM_PGTABLE_PROT_W;
> +               prot = adjust_nested_fault_perms(nested, prot);
>
>         if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
>                 prot |= KVM_PGTABLE_PROT_X;
>
>         if (nested)
> -               adjust_nested_exec_perms(kvm, nested, &prot);
> +               prot = adjust_nested_exec_perms(kvm, nested, prot);
>
>         kvm_fault_lock(kvm);
>         if (mmu_invalidate_retry(kvm, mmu_seq)) {
> @@ -1631,10 +1631,10 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                                                  memcache, flags);
>
>  out_unlock:
> -       kvm_release_faultin_page(kvm, page, !!ret, writable);
> +       kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
>         kvm_fault_unlock(kvm);
>
> -       if (writable && !ret)
> +       if ((prot & KVM_PGTABLE_PROT_W) && !ret)
>                 mark_page_dirty_in_slot(kvm, memslot, gfn);
>
>         return ret != -EAGAIN ? ret : 0;
> @@ -1856,16 +1856,6 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                                      enum kvm_pgtable_prot *prot)
>  {
>         struct kvm *kvm = s2fd->vcpu->kvm;
> -       bool writable = s2vi->map_writable;
> -
> -       if (!s2vi->device && memslot_is_logging(s2fd->memslot) &&
> -           !kvm_is_write_fault(s2fd->vcpu)) {
> -               /*
> -                * Only actually map the page as writable if this was a write
> -                * fault.
> -                */
> -               writable = false;
> -       }
>
>         if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && s2vi->map_non_cacheable)
>                 return -ENOEXEC;
> @@ -1883,12 +1873,14 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>
>         *prot = KVM_PGTABLE_PROT_R;
>
> -       if (s2fd->nested)
> -               adjust_nested_fault_perms(s2fd->nested, prot, &writable);
> -
> -       if (writable)
> +       if (s2vi->map_writable && (s2vi->device ||
> +                                  !memslot_is_logging(s2fd->memslot) ||
> +                                  kvm_is_write_fault(s2fd->vcpu)))
>                 *prot |= KVM_PGTABLE_PROT_W;
>
> +       if (s2fd->nested)
> +               *prot = adjust_nested_fault_perms(s2fd->nested, *prot);
> +
>         if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
>                 *prot |= KVM_PGTABLE_PROT_X;
>
> @@ -1899,7 +1891,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                 *prot |= KVM_PGTABLE_PROT_X;
>
>         if (s2fd->nested)
> -               adjust_nested_exec_perms(kvm, s2fd->nested, prot);
> +               *prot = adjust_nested_exec_perms(kvm, s2fd->nested, *prot);
>
>         if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
>                 /* Check the VMM hasn't introduced a new disallowed VMA */
> --
> 2.47.3
>
>

