Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DD2FED9E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXLm03NaY5p75qdptgVFDNEv7G3SzFx2yMPW/l+UZLE=; b=2CuXQrE02ugiSyuISSSFUQv8OO
	htjgHE3NMzy6AU3PzOWWe2K1Rbd2PTd/sl1buAxBdwXrB3IfRWtBZloORkZHYCPkFeMLjEoRue94i
	TOLl5hWUqCSb5BkIcuJssV00L+ql6K9lEbiGmf9res2PKY4+5wtRB764B0uxvRGt/BYtTDLdqNf2S
	MRcSjnKvGuT9MFLRR4js2VO6/D7Q7OqZzo5klZds+mZBQn7A8Z/vYFp9rPIyQG+odrMd3XjV86Nf7
	PL2m0aUrdv/+z0kQIdMHSaHqCWeGTMi65IwXgf63FSNInydYzhfF8e42hokIHlOmXPM5TMOsyaz+F
	dzRfFK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WYH-00000006ksc-34gP;
	Tue, 17 Mar 2026 15:41:49 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2WYF-00000006ksD-3JmJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:41:48 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-509069a7a7fso631461cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 08:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773762106; cv=none;
        d=google.com; s=arc-20240605;
        b=AlVZMrgibHPPDsmIjjM2ilCxjNdMbIYq1ail2RyaG5nET/W4WCsPyASxg35wzMJ/Ef
         D7uyDUhvX2RWlxUI7Dom0ewlvgbXHJrSsSpaJMVRBTtpChgofwwc53UG9sTyThkFDcBR
         StUMIzdUZZL6y202/L+zbWYb5Z2GzqiX3lwzB4+CATJhH528Gb1ITf1G+DzWw/UoudJs
         Ke69uQwfjCl11re4cEYR+jlAkVlHbajcwqtuoZTuMPct/5vTu3RSBnxz2VuA4kjajObJ
         xTttLkdwK6H2XeUID7YgSnIADWG8aEIFNzF6ReIZBxbpBWsVhlEVKJ7XXyIF+TDz1K3f
         mBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kXLm03NaY5p75qdptgVFDNEv7G3SzFx2yMPW/l+UZLE=;
        fh=V1Ob3OBqYATyBIs1wbdBh6YzrOWabBftkzJzs3UQemk=;
        b=Z0HPeEg3YO3nUAZ+JQKI52ULhuIIJ9cZ/pMvNDravfebNN8hCJ9p0Kf63PZNtGWOV6
         Zb8Ee7nOnkpNtkYG67/0hQ9nOW1DNrn6X3TdkthsaSVMi3bcjUCXanCJRyQXW40eTbsx
         KIuAe4c8pegYx6g/p0iJsTbiTKGINrB3S09V3hgbrS84ecaC5+I9IC1c8XRIHBWp7YhG
         J7KGg5g9QEP/poHuZOTJucjiE+vz8+SHV4JNwbc7/AOEUDjPGVupN91Q+CIXsRZk+WeO
         iw1ID/mgXJgv2lm3OuvZt4VVhiI2MS8KRWINCSazdr+5cqLJvw/+Xp49LAxyfBPwcxAk
         d0JA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773762106; x=1774366906; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kXLm03NaY5p75qdptgVFDNEv7G3SzFx2yMPW/l+UZLE=;
        b=BOiu6OCPtd8iOdFw1zVF/YVAsxGQFRK7c4gvcn/tNTVF1uiHh+Jqp502ailKERwc2T
         r//T9BMQEhUbgxcLCWtxcTR1BdNq4qiJpPdpAYsUD32dCP0d3vVxC8eKXHmJFtqtgp5L
         SNFbYbFSj8nmoFO3QLgHtmygzNkhSQsDLNCBCKvp7cD2IbUUd+PVtc/XA6isgaaxZwVf
         HyHI9m0zaZuwi6bE/qFBIDlijBRD3C5V1moJ18ayD+vqWJq30V2DX/0wBXnIM5YRSAfN
         XutTPtnc7xTrqoLnUB9D6TSN1FMc8/MKbOjGRsd5db0pwWA8AptQChw3ST6gDCoruAAz
         kugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762106; x=1774366906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXLm03NaY5p75qdptgVFDNEv7G3SzFx2yMPW/l+UZLE=;
        b=jkdSMMODlCz2pVxzlRjdhJhHazAg6wSJhMX8x/6c2r18hCnq0kZcUeOT+YpVZ5UYWM
         iVf7m+4MgbJbxpBtExP0egnRilla3btDMo7ZDrea/yzJOmFSSJs1nReXL7JFyf989Siz
         8g5yLiFGbIf7OlwfnB18oRDd7uZY6HMYru2jpaK1CECcZu/zZATbrch/EFfFY7KQbLkJ
         m9vmk29D+HBWibUCG7mky/uWYPszJdegMQQwyxjrYKptavLscqHc0vsC8mJb8TQsfSzP
         Q9R61L1jfpDGpYikSTwU75LWkqHwbJDgLGtUTn0X5LNt9Qh/qcd8XtoUsEzAZ8wtuHKe
         FdPg==
X-Forwarded-Encrypted: i=1; AJvYcCWYTg29k+wUOJf4r6YnuAPxZHRVmUQC+qr7AeFByS8R17LI7N0uh+G/pSK2uz+i6RYpcvDKsQWaEh0TJ0cuX8DA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgy2WzPMQhCZbAMRjOgjmotQrM/lGxAD+29G71PgZGvelDSnNo
	KPh6EQT1+Ygp+s4WC5gzCvCA0mOyfNd+0hKCthaLrpWwdHgUeGmr8690WhqQyof7mvbvtUK3DEK
	D50dcfPoiPzaaZIdIZgo5+h9zE8SlcLCfR3KIHKo+
X-Gm-Gg: ATEYQzzUlKIRud5YwR3MH2aY0NPeFsHuCu+YITAC+VR5Bb49kLlnuQosWzQ9sdkdoCn
	AuwooZHAKERqliJO+0qH9Gt2IZ1LBNgwKKkxrOK33zJj1kA19m34tONCEun3/v8xAeFwJuONJbL
	/abdmNaUkme04CN1G/u7J023A1DAHLwxF4zaXHg/HZzwyX8liT8W2ISp4iHOjYzBEkEH+T0IlKf
	wvkNgvM1WxpTxyV9Nwfny/8Xk4os+MhZneLLGpLnx7NGqU03v20p3qFJsIvKpZjLksOcLIhAq17
	B05Rvp63s+tvSEN0ms9vW8FDzX9+g5PbZKQy
X-Received: by 2002:a05:622a:1987:b0:509:1c2c:866 with SMTP id
 d75a77b69052e-5099ae2a4ccmr15436131cf.11.1773762105375; Tue, 17 Mar 2026
 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-15-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-15-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 15:41:06 +0000
X-Gm-Features: AaiRm5280nFVi9VVGMV9I5qqtqhUNzi2m_pJsphpi_PzXiuG8fQT2oFQsOr0Voo
Message-ID: <CA+EHjTwxKxpUg06J9tRqz=v1M2vGh=xUKijKNtxn0PMYcn9PiA@mail.gmail.com>
Subject: Re: [PATCH 14/17] KVM: arm64: Move device mapping management into kvm_s2_fault_pin_pfn()
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_084147_860835_1DB1A6F7 
X-CRM114-Status: GOOD (  28.21  )
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
> Attributes computed for devices are computed very late in the fault
> handling process, meanning they are mutable for that long.
>
> Introduce both 'device' and 'map_non_cacheable' attributes to the
> vma_info structure, allowing that information to be set in stone
> earlier, in kvm_s2_fault_pin_pfn().
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 52 ++++++++++++++++++++++++--------------------
>  1 file changed, 29 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ac4bfcc33aeb1..97cb3585eba03 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1656,9 +1656,11 @@ struct kvm_s2_fault_vma_info {
>         struct page     *page;
>         kvm_pfn_t       pfn;
>         gfn_t           gfn;
> +       bool            device;
>         bool            mte_allowed;
>         bool            is_vma_cacheable;
>         bool            map_writable;
> +       bool            map_non_cacheable;
>  };
>
>  static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
> @@ -1728,7 +1730,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>  }
>
>  struct kvm_s2_fault {
> -       bool s2_force_noncacheable;
>         enum kvm_pgtable_prot prot;
>  };
>
> @@ -1738,7 +1739,6 @@ static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
>  }
>
>  static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
> -                                    struct kvm_s2_fault *fault,
>                                      struct kvm_s2_fault_vma_info *s2vi)
>  {
>         struct vm_area_struct *vma;
> @@ -1794,12 +1794,11 @@ static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
>  }
>
>  static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
> -                               struct kvm_s2_fault *fault,
>                                 struct kvm_s2_fault_vma_info *s2vi)
>  {
>         int ret;
>
> -       ret = kvm_s2_fault_get_vma_info(s2fd, fault, s2vi);
> +       ret = kvm_s2_fault_get_vma_info(s2fd, s2vi);
>         if (ret)
>                 return ret;
>
> @@ -1814,16 +1813,6 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>                 return -EFAULT;
>         }
>
> -       return 1;
> -}
> -
> -static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
> -                                    struct kvm_s2_fault *fault,
> -                                    const struct kvm_s2_fault_vma_info *s2vi)
> -{
> -       struct kvm *kvm = s2fd->vcpu->kvm;
> -       bool writable = s2vi->map_writable;
> -
>         /*
>          * Check if this is non-struct page memory PFN, and cannot support
>          * CMOs. It could potentially be unsafe to access as cacheable.
> @@ -1842,8 +1831,10 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                          * S2FWB and CACHE DIC are mandatory to avoid the need for
>                          * cache maintenance.
>                          */
> -                       if (!kvm_supports_cacheable_pfnmap())
> +                       if (!kvm_supports_cacheable_pfnmap()) {
> +                               kvm_release_faultin_page(s2fd->vcpu->kvm, s2vi->page, true, false);
>                                 return -EFAULT;
> +                       }
>                 } else {
>                         /*
>                          * If the page was identified as device early by looking at
> @@ -1855,9 +1846,24 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                          * In both cases, we don't let transparent_hugepage_adjust()
>                          * change things at the last minute.
>                          */
> -                       fault->s2_force_noncacheable = true;
> +                       s2vi->map_non_cacheable = true;
>                 }
> -       } else if (memslot_is_logging(s2fd->memslot) && !kvm_is_write_fault(s2fd->vcpu)) {
> +
> +               s2vi->device = true;
> +       }
> +
> +       return 1;
> +}
> +
> +static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
> +                                    struct kvm_s2_fault *fault,
> +                                    const struct kvm_s2_fault_vma_info *s2vi)
> +{
> +       struct kvm *kvm = s2fd->vcpu->kvm;
> +       bool writable = s2vi->map_writable;
> +
> +       if (!s2vi->device && memslot_is_logging(s2fd->memslot) &&
> +           !kvm_is_write_fault(s2fd->vcpu)) {
>                 /*
>                  * Only actually map the page as writable if this was a write
>                  * fault.
> @@ -1865,7 +1871,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                 writable = false;
>         }
>
> -       if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && fault->s2_force_noncacheable)
> +       if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && s2vi->map_non_cacheable)
>                 return -ENOEXEC;
>
>         /*
> @@ -1888,7 +1894,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>         if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
>                 fault->prot |= KVM_PGTABLE_PROT_X;
>
> -       if (fault->s2_force_noncacheable)
> +       if (s2vi->map_non_cacheable)
>                 fault->prot |= (s2vi->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
>                                KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
>         else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
> @@ -1897,7 +1903,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>         if (s2fd->nested)
>                 adjust_nested_exec_perms(kvm, s2fd->nested, &fault->prot);
>
> -       if (!kvm_s2_fault_is_perm(s2fd) && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
> +       if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
>                 /* Check the VMM hasn't introduced a new disallowed VMA */
>                 if (!s2vi->mte_allowed)
>                         return -EFAULT;
> @@ -1937,7 +1943,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>          * backed by a THP and thus use block mapping if possible.
>          */
>         if (mapping_size == PAGE_SIZE &&
> -           !(s2vi->max_map_size == PAGE_SIZE || fault->s2_force_noncacheable)) {
> +           !(s2vi->max_map_size == PAGE_SIZE || s2vi->map_non_cacheable)) {
>                 if (perm_fault_granule > PAGE_SIZE) {
>                         mapping_size = perm_fault_granule;
>                 } else {
> @@ -1951,7 +1957,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                 }
>         }
>
> -       if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
> +       if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
>                 sanitise_mte_tags(kvm, pfn, mapping_size);
>
>         /*
> @@ -2016,7 +2022,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>          * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
>          * get block mapping for device MMIO region.
>          */
> -       ret = kvm_s2_fault_pin_pfn(s2fd, &fault, &s2vi);
> +       ret = kvm_s2_fault_pin_pfn(s2fd, &s2vi);
>         if (ret != 1)
>                 return ret;
>
> --
> 2.47.3
>

