Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E72F3D604
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aF4Epmx2n9nntDB8c7LNu8cL/wQsJEEhS1gBTnU+6mE=; b=Bjc4Sy0G126pBIxHi6t41+E4Pc
	elW3kOQD/cUdgEmcqskPTAk8eS1oJcSvrI+Vh0V/hkhGlA7RyEhVPZFd0Sg3fkkLtUjK7mjuj8szN
	u9Mft8nFUhwEqh27zfFL3V/5dSP9Arjc7YAqmo7l3vzioZ7bUHVy8NlvHw2nms4FPQsWvqHt3+x8M
	Q/nzy3DutRg1UXEoYrS2j2T3CmQvN0ZEaWwxOpPd8I1VgED4XDMjGov/5yclTH+3BG72OVK0c7fq/
	LEOyj/0N7neUxxqLl/O1td3byKm9juDYgGkZ+26qtxzyHGxyrhHSZkPu3oX7QIuvktC6xXX8jjBRy
	4pcnWvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6qOz-00000009zMQ-0Y83;
	Sun, 29 Mar 2026 13:42:05 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6qOw-00000009zM5-2e7V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 13:42:04 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50b6c45781aso724671cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 06:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774791720; cv=none;
        d=google.com; s=arc-20240605;
        b=hb9Ky8MxTsbArK35YOVlT6xmeHBeuFD4EJ4RLFGoWqB7aZPRPcR1wN0HHpIK5qktp2
         mojLYbSMTab622uvuQh9fY8ilZ6TMWNMxrw4AKOaGjSW7dOutzRKPj4AqcoamHVf0eyw
         u6nxahWGBumiJCa8dcXAt6CavdVBfqHmQmZg37mycWCp3rInxFzV5ZuDOpKiCgQmWqAX
         jEXVRXaxn4LzCFybvCfF7gL28IlRn90ZSOJk1jnxzxhnG47/u99VtxN+UZUxUqHefWWQ
         nj4MRozFvAYjd3lgwYpH9XQPPBEKF1zhz9oHk4W6ru6ZdqueCFzTa9/KqXloRhOkbIzd
         XgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aF4Epmx2n9nntDB8c7LNu8cL/wQsJEEhS1gBTnU+6mE=;
        fh=6bB0yKEqkoVxpFHdW76LVbkcg95axeJ6yv6R5pF31HQ=;
        b=K4FFaNlr+YlZGNfoygGJ6o7mXMpzvAh0hsSm0cG+asv/ZmU9ymR3qiTEOiOT30nUJV
         exTPNNAF7D2F85+qG2+hKuVeYJ/K2f5T6smE9oD9EbBjrWMl1OYsDEeBd6Z9FyRulEtW
         DZhkvnc7mQXlo8P7q2nQ0vbDJHjj7eNvQ/CZmQI3v4S1eOHXEA6bSNGAG6rPn7g8J0+h
         IEcAcpY3o+bp0DvQVtEj23WJGB6Oqzr+fPPvsDUAz0JnX2gGZPmaOqjG1TFt13wdwGrR
         6in60hKsi4L34EI2QARBSbi3pvZrrKXvNpFqu6BuZPR389gU5GImuIQJKIbutk1X7CP1
         loFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774791720; x=1775396520; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aF4Epmx2n9nntDB8c7LNu8cL/wQsJEEhS1gBTnU+6mE=;
        b=ifdH6Gy2XMqs0HXu4DBXnlrAr8sXBhGm8v7OiuzzByxKgARYmxBTkTdBhnV3k0L3wH
         Fcw5kpJS0ggKMUiKzNIcQk1ILM+GwiU7/3otTSG1YLfGsB0w1cqV/kk4YCBz+64+b8LM
         V0BfEx9Rkp56XYPcypWRzs7f/WDwntTWU0SSwb7FQ+7owuYS0ZVUb4pgtbl/7i4x+7BX
         +JTM+YUTAauQDleU5+8gQqfmVIisvRUixhLIIu+a+I0Ndff3zz5q0tcqA/whK2Kbqy1V
         tBg0apCRQIKdUvswjT2uJ6+urMSXexuePKncpAiD7wqeVuLdFq6LfEs6Kj2NjeAnC+Nt
         7vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774791720; x=1775396520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF4Epmx2n9nntDB8c7LNu8cL/wQsJEEhS1gBTnU+6mE=;
        b=dkMjaJ4PogaLSXG7w18RrjbGfUHrItzdzKxW8wy51+Fh+QU9OwDvtINEQn0Lut2vX3
         351k4NmV/4uCfWWEyyCJc0xjZToQ+j5UuT+nSW1ZWovEe5pbomzevxUHkH4Dorbf36Tu
         OEdcFAW8f6o6HQPugF6+InIB0HBjAXoSh0uS7rQKzwT0QbdYO1qROR987y836p9mhDud
         dcyRoL/rH+tWFNJpg9cpm5OYzp0VCJ07BQ56EWLRRor4OPTSY7i1uWMK9+N8IJOY3IR8
         ksNa0JhZEnNoZgEDjU7XxQako46Ns53ypzETcCwtanph7nXKk1IXFCTRKpBlDwcxGNro
         vY9g==
X-Forwarded-Encrypted: i=1; AJvYcCXi7SL1DZWssKMVLrSUdin2vcuZlFmO8xFcbwQ6A7mxcIrtaC3R3XHsjxzfKE0SWZWqid6auxbwneeArfjG47V0@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9e+abDOebCVPbfpbygamoHF+zlATxPaSPu39QRQ5cGwKXC4Ni
	wHxC7uF85/ngLloOFCp5CCqq1EqZ2dxuPsygBss5k90qSfT/IleI46stJr5VmakqqfO/hTWhJG4
	H+S9akNsgLLB6nI453Rrt7yZjCdPNdSQEgP8uDQ5s
X-Gm-Gg: ATEYQzySr2fPGpt5taV5ZwJuxZpKHqX3STasPWStebQen4Q8CqM4hHAZeJ7itXt1GHP
	u9NdieedLXBvDK1FxUxaeQm4IzXxPke36VCXCj9lvkLsPtVUV7FOZSTbkDqjR4UZ4z8eDnchll1
	gO2kIcVCurNA4D+/yNlpoCW/cFViAdy/r6z82WSZ+IJUYtr882ERGDdx/gObINcXll4HwBGdlB6
	ytrhQEn/8INJoZIkGB+zs8wF18iy/lcui4qYvwvpEoPT5FCetTTtLhebwJqzBJEQ+lPp+sBvZnn
	11tbVlzR
X-Received: by 2002:a05:622a:3cd:b0:509:1d4b:f86f with SMTP id
 d75a77b69052e-50bb27f6ef2mr18579571cf.14.1774791719904; Sun, 29 Mar 2026
 06:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260327113618.4051534-1-maz@kernel.org> <20260327113618.4051534-22-maz@kernel.org>
 <86ecl549aw.wl-maz@kernel.org>
In-Reply-To: <86ecl549aw.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 29 Mar 2026 14:41:22 +0100
X-Gm-Features: AQROBzAIIIl4BXFhMlior6x1Oks2QHN0i-uK1SaLiMYW9yClQIV8jdg80mHlByo
Message-ID: <CA+EHjTz60sr7sVaizJT3Cxg+AHLBy09032VBvmqc-dRtEFeNeg@mail.gmail.com>
Subject: Re: [PATCH v2 21/30] KVM: arm64: Kill topup_memcache from kvm_s2_fault
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_064202_722223_0A786930 
X-CRM114-Status: GOOD (  32.87  )
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

Hi Marc,

On Fri, 27 Mar 2026 at 14:49, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 27 Mar 2026 11:36:09 +0000,
> Marc Zyngier <maz@kernel.org> wrote:
> >
> > The topup_memcache field can be easily replaced by the equivalent
> > conditions, and the resulting code is not much worse.

This is easier to reason about I think, so (not sure if it applies to
fold-ins, but fwiw):
Reviewed-by: Fuad Tabba <tabba@google.com>

Thanks,
/fuad

> >
> > Tested-by: Fuad Tabba <tabba@google.com>
> > Reviewed-by: Fuad Tabba <tabba@google.com>
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  arch/arm64/kvm/mmu.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index e8bda71e862b2..5b05caecdbd92 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1712,7 +1712,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
> >
> >  struct kvm_s2_fault {
> >       bool writable;
> > -     bool topup_memcache;
> >       bool mte_allowed;
> >       bool is_vma_cacheable;
> >       bool s2_force_noncacheable;
> > @@ -1983,9 +1982,8 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> >               .logging_active = logging_active,
> >               .force_pte = logging_active,
> >               .prot = KVM_PGTABLE_PROT_R,
> > -             .topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
> >       };
> > -     void *memcache;
> > +     void *memcache = NULL;
> >       int ret;
> >
> >       /*
> > @@ -1994,9 +1992,11 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
> >        * only exception to this is when dirty logging is enabled at runtime
> >        * and a write fault needs to collapse a block entry into a table.
> >        */
> > -     ret = prepare_mmu_memcache(s2fd->vcpu, fault.topup_memcache, &memcache);
> > -     if (ret)
> > -             return ret;
> > +     if (!perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu))) {
> > +             ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
> > +             if (ret)
> > +                     return ret;
> > +     }
> >
> >       /*
> >        * Let's check if we will get back a huge page backed by hugetlbfs, or
>
> Sashiko has spotted [1] an interesting corner case here, which is that the
> original code always initialises memcache to its correct value, while
> we now only do it in a limited number of cases.
>
> I'm proposing to restore the original behaviour by folding the
> following change into this patch, splitting the retrieval of the
> memcache pointer from the top-up and avoiding the ugly pointer
> indirection:
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1fe7182be45ac..03e1f389339c7 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1513,25 +1513,22 @@ static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
>         }
>  }
>
> -static int prepare_mmu_memcache(struct kvm_vcpu *vcpu, bool topup_memcache,
> -                               void **memcache)
> +static void *get_mmu_memcache(struct kvm_vcpu *vcpu)
>  {
> -       int min_pages;
> -
>         if (!is_protected_kvm_enabled())
> -               *memcache = &vcpu->arch.mmu_page_cache;
> +               return &vcpu->arch.mmu_page_cache;
>         else
> -               *memcache = &vcpu->arch.pkvm_memcache;
> -
> -       if (!topup_memcache)
> -               return 0;
> +               return &vcpu->arch.pkvm_memcache;
> +}
>
> -       min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
> +static int topup_mmu_memcache(struct kvm_vcpu *vcpu, void *memcache)
> +{
> +       int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
>
>         if (!is_protected_kvm_enabled())
> -               return kvm_mmu_topup_memory_cache(*memcache, min_pages);
> +               return kvm_mmu_topup_memory_cache(memcache, min_pages);
>
> -       return topup_hyp_memcache(*memcache, min_pages);
> +       return topup_hyp_memcache(memcache, min_pages);
>  }
>
>  /*
> @@ -1589,7 +1586,8 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>         gfn_t gfn;
>         int ret;
>
> -       ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
> +       memcache = get_mmu_memcache(s2fd->vcpu);
> +       ret = topup_mmu_memcache(s2fd->vcpu, memcache);
>         if (ret)
>                 return ret;
>
> @@ -1993,7 +1991,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
>         struct kvm_s2_fault_vma_info s2vi = {};
>         enum kvm_pgtable_prot prot;
> -       void *memcache = NULL;
> +       void *memcache;
>         int ret;
>
>         /*
> @@ -2002,9 +2000,10 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>          * only exception to this is when dirty logging is enabled at runtime
>          * and a write fault needs to collapse a block entry into a table.
>          */
> +       memcache = get_mmu_memcache(s2fd->vcpu);
>         if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
>                             kvm_is_write_fault(s2fd->vcpu))) {
> -               ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
> +               ret = topup_mmu_memcache(s2fd->vcpu, memcache);
>                 if (ret)
>                         return ret;
>         }
>
> The bot has also pointed out a couple of cases where memcache and
> permission faults interact badly. I'll look into them separately, as
> they predate this rework.
>
> Thanks,
>
>         M.
>
> [1] https://sashiko.dev/#/patchset/20260327113618.4051534-1-maz%40kernel.org?patch=12134
>
> --
> Without deviation from the norm, progress is not possible.

