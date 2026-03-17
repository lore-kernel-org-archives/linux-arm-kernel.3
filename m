Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E903FED9E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etlYVXNvY0jwdMjflLRbzx8XEtV3TCYbBQva0N1eERE=; b=kL/yoj08H9vDr9qe4n5qkh2KuN
	iaEKqFEQdvlStU6wdJ3MA7aQaPJs3iZ95HmAyNiOrtQ3bxaifTk4wJDuqyuEtpW0/tV3glc/8iQtM
	Z7bIFTVVCwZrwMcBxZOLBtJT5dSKtvb2M+kiTTr2Ahc/eeIT1tmQk8fe1129KJLWtqFnoZ96cbxo9
	RX1HO2EGVlcw/RH7RZrZTpWeLuDwDodZgYEG7YzzX3h+aRN66MwX0Moe0/pwforRl/jUILAkGOR3y
	1XJNqgLH2ClboF+pW0hAFnhCiZ8SvUaQ1lUSy0bFVeWZvPmayp8F8ymvI6+40Nrcz5LKmYSn+ubA9
	DUl79NNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2X4j-00000006nUs-4B4C;
	Tue, 17 Mar 2026 16:15:22 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2X4h-00000006nSf-0KZ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:15:20 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50906a98ffeso753631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 09:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773764117; cv=none;
        d=google.com; s=arc-20240605;
        b=i4jz8+Foq6Va+quf2h07rscFah3wj/PYBJOx2qYL7p89vTbU1pgA0+Y3IOR+d+tcGI
         jDlGSSnh3yPpRCLJxEofaS9cW9HvEmZuAIN852u/uXExnpUV+9Nb8kFhICak2cgP4Jpf
         vveye6ea85t0/c6/yZhcqMv3sM9c9HWE+/SKZryTropYbRnRu1+dPcPD2oOj1KIOhutH
         2kmhjBLRoj+vmLzwOFP8P6zo9fTpnbkY2BPhAGPpr7QtgmC59OOu9URP9Vhud8q7Y1Rk
         bHZcgKrKEF//OBwK3Ju7d5Gh4RGJfonoSEdrltQ1WfWjqDrxzJjn5dNtjq4xAH2bYpuP
         sbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=etlYVXNvY0jwdMjflLRbzx8XEtV3TCYbBQva0N1eERE=;
        fh=KWFRe+rx6wNkEvEw+9cpx4YnPYjQTjMTcm7GgSFrJKQ=;
        b=R2Ejur6ZkH40xTKWDFI/Eb8darLE6Mj6PEU1ogi1/XLlSR/H7GdcxWJkn2jFejzvE1
         H26ssCrIFNATahfiAzNwcoDk5CFCMt1zwc90BKR18YHb+dkLl6WDO+yAr2QRIDgNsOTM
         NsfiQVmNa+IotJjvi7UwGjOhAlUL1otXak6izjhpGyjLYGyU9RXNNb0F5Tn5FWlDjax7
         Tc/LZl4JBksQ0TMT5EowyDLjwwoqb7K1/seqJX0sdQTN0VRL7HbdexkHEI7LLFbplFMi
         dpkc79dxhaIMl4phgOJT/Gb49RIaYodsqrC9cJvsAIRoq0V7QhlJ8ikWO8D39xq9F+Wv
         SccA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773764117; x=1774368917; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=etlYVXNvY0jwdMjflLRbzx8XEtV3TCYbBQva0N1eERE=;
        b=tfOlSS4stKM/zEAInOlXGpYCjBsP9m3pjQWENUQr6W1LwbsIDXRLL/isU5Hmk18hPT
         zUj6N4E82Me0WXmOlZc+YZVJzi7EwWK2QaytH5mYao10BHdl8qiwvd9Q7giWc2HleDrG
         2IYynOzxWLppAjnosHWbggy+w+yG7wi2ELbSJEL7dYaNvsQwigjisK2Wea51uiao7BuZ
         Qa06NX+XwzOFoPIB+1rQT25ybnWpJoRbPNLysRVCo3d9U6EK99EI9EnAzc1RWzeYrale
         Engq8OuxvetM43+avLV64uNdX3O1X0S/qtUEna3nnE1urgDCBeZEDoK/YOSryVX4xNeg
         KjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773764117; x=1774368917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etlYVXNvY0jwdMjflLRbzx8XEtV3TCYbBQva0N1eERE=;
        b=OkDxGVJpQlgChnH3DAQIJPx76fVqtceR7vnXhpam20+mevoO0ni9/4qglRV1Xd5ZQl
         yIrL1QzeaqGJGNASdspeBpLK98dHzq01cVgrdXQ8pZpkYbLP0dx4Fm0KjR5m0DLSdYZa
         Y32lZblz3PFOuTm5ylvGMJ8YxFwyblrw0J/Jfa3RKl/yrPXk8IA/SXZnAK9oV5sF0AIJ
         buRPDccTY5flSnIE8vmGkWHD/gTEvWcbC5DZjJ8ieZ71+GVoE1dNIDqMKkIUFDCn0rRp
         k0cCk5zqZg95eqXhQZM4Rmv/un4Cps6Y3aLKExo8qVUqSivRoSbqomLHoOMurHHigaC0
         jvgA==
X-Forwarded-Encrypted: i=1; AJvYcCXJdvpHK1gXMiHQFIOmVB30O+WRvrLgvQzBcZLioYzeDXGr/aLAEhYfWmqc/vFFRJvtvvbCFq4+gWxANDGYCyMO@lists.infradead.org
X-Gm-Message-State: AOJu0YxKAIkNxTlbBlAfjaag7Bav8yocQvhcATtFPjnK1tnZ1ux3sq2B
	prn1Wt+2b/Jafggjr6CEfikvGFLBVbu8cao/Ht9kg9ng4sdEx1SBgs2l7yOjVADcjokE0Tdraa4
	PD7bsyHEeRyI2oAjHlY7kE7iRt7gP7tzS2ifw+9Kv
X-Gm-Gg: ATEYQzw5yJgTg+cDcR8Ie+wFH8b/ovXYO6bBURkr4QIvGIxLTPN7UdUoPswc2TKhfug
	tm4Xsq60csFhM4zn2mk98WD6YQDCvwkNCJbv9N4M6IR6Wv7m1VcsR/z36mGF5QG+KtSVsjfcrB/
	pTuKXSPWcfF4bDWC+5GNLcIUNTgTbduk83Yqi6frWKBZlkphAH3H492TizAuWIY7K47ctop+DIn
	3q62zbp3KUwze/oD24VcKaoAM2vQbIO1TcbNuOMIHIDlXDu41wf69hj75OgdhR6aWreEiPOhXDt
	xrY5aNSJ7VxBHSj4T9nQgYu2BZM8EKKd1zv8
X-Received: by 2002:a05:622a:1101:b0:509:371:f2ab with SMTP id
 d75a77b69052e-50998d570b3mr16752381cf.16.1773764116289; Tue, 17 Mar 2026
 09:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-16-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-16-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 16:14:38 +0000
X-Gm-Features: AaiRm51dtBuZjVM3yg5vE22x6fvA5zeYPFHcjLNbulKXj0wAV_GwlAkFIood97o
Message-ID: <CA+EHjTx=vPSei-csjGorTg-=eXpW_uKG2dK4FjKT+xk_pYRLNA@mail.gmail.com>
Subject: Re: [PATCH 15/17] KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_091519_138480_2B44C1EB 
X-CRM114-Status: GOOD (  21.74  )
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
> The 'prot' field is the only one left in kvm_s2_fault. Expose it
> directly to the functions needing it, and get rid of kvm_s2_fault.
>
> It has served us well during this refactoring, but it is now no
> longer needed.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 45 +++++++++++++++++++++-----------------------
>  1 file changed, 21 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 97cb3585eba03..9b5df70807875 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1729,10 +1729,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>         return vma_shift;
>  }
>
> -struct kvm_s2_fault {
> -       enum kvm_pgtable_prot prot;
> -};
> -
>  static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
>  {
>         return kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> @@ -1856,8 +1852,8 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>  }
>
>  static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
> -                                    struct kvm_s2_fault *fault,
> -                                    const struct kvm_s2_fault_vma_info *s2vi)
> +                                    const struct kvm_s2_fault_vma_info *s2vi,
> +                                    enum kvm_pgtable_prot *prot)
>  {
>         struct kvm *kvm = s2fd->vcpu->kvm;
>         bool writable = s2vi->map_writable;
> @@ -1885,23 +1881,25 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                 return 1;
>         }
>
> +       *prot = KVM_PGTABLE_PROT_R;
> +
>         if (s2fd->nested)
> -               adjust_nested_fault_perms(s2fd->nested, &fault->prot, &writable);
> +               adjust_nested_fault_perms(s2fd->nested, prot, &writable);
>
>         if (writable)
> -               fault->prot |= KVM_PGTABLE_PROT_W;
> +               *prot |= KVM_PGTABLE_PROT_W;
>
>         if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
> -               fault->prot |= KVM_PGTABLE_PROT_X;
> +               *prot |= KVM_PGTABLE_PROT_X;
>
>         if (s2vi->map_non_cacheable)
> -               fault->prot |= (s2vi->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
> -                              KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
> +               *prot |= (s2vi->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
> +                       KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
>         else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
> -               fault->prot |= KVM_PGTABLE_PROT_X;
> +               *prot |= KVM_PGTABLE_PROT_X;
>
>         if (s2fd->nested)
> -               adjust_nested_exec_perms(kvm, s2fd->nested, &fault->prot);
> +               adjust_nested_exec_perms(kvm, s2fd->nested, prot);
>
>         if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
>                 /* Check the VMM hasn't introduced a new disallowed VMA */
> @@ -1913,11 +1911,12 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>  }
>
>  static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
> -                           struct kvm_s2_fault *fault,
> -                           const struct kvm_s2_fault_vma_info *s2vi, void *memcache)
> +                           const struct kvm_s2_fault_vma_info *s2vi,
> +                           enum kvm_pgtable_prot prot,
> +                           void *memcache)
>  {
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
> -       bool writable = fault->prot & KVM_PGTABLE_PROT_W;
> +       bool writable = prot & KVM_PGTABLE_PROT_W;
>         struct kvm *kvm = s2fd->vcpu->kvm;
>         struct kvm_pgtable *pgt;
>         long perm_fault_granule;
> @@ -1970,12 +1969,12 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                  * Drop the SW bits in favour of those stored in the
>                  * PTE, which will be preserved.
>                  */
> -               fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
> +               prot &= ~KVM_NV_GUEST_MAP_SZ;
>                 ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
> -                                                                fault->prot, flags);
> +                                                                prot, flags);
>         } else {
>                 ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
> -                                                        __pfn_to_phys(pfn), fault->prot,
> +                                                        __pfn_to_phys(pfn), prot,
>                                                          memcache, flags);
>         }
>
> @@ -1999,9 +1998,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
>         struct kvm_s2_fault_vma_info s2vi = {};
> -       struct kvm_s2_fault fault = {
> -               .prot = KVM_PGTABLE_PROT_R,
> -       };
> +       enum kvm_pgtable_prot prot;
>         void *memcache;
>         int ret;
>
> @@ -2026,13 +2023,13 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         if (ret != 1)
>                 return ret;
>
> -       ret = kvm_s2_fault_compute_prot(s2fd, &fault, &s2vi);
> +       ret = kvm_s2_fault_compute_prot(s2fd, &s2vi, &prot);
>         if (ret) {
>                 kvm_release_page_unused(s2vi.page);
>                 return ret;
>         }
>
> -       return kvm_s2_fault_map(s2fd, &fault, &s2vi, memcache);
> +       return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
>  }
>
>  /* Resolve the access fault by making the page young again. */
> --
> 2.47.3
>

