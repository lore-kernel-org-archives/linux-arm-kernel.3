Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B3CFED9E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jWTREPyzCDkGQNDSEs9bLoKmaSEJu/Woq4lGsLjr8c=; b=S0+mXGBVSBm+Lzt8GSqvJhW/3C
	hjHUOBY+vtDkjSLEh6KwZ1rnuDGNk+fkJRk1Z5QsW0BBx20Ug8eNZyDSngzccOMVpEsEFvS9qnStq
	vSJvtKZyNhtfijX5MYihDadZUBC1r5aTlraJa4cemNqOSMlxlRHKtbMQne9sm4+eCutDzR52sy5k8
	tZzb4SRKF3qpR8vq1H8L+joSzbuB7P5y14Gl+0aTeUD4bk1VP4PVngP73Wrybss54CMPBdAGqiuCR
	5EInsM89MWpoZj809v/7Rq4qLRXIdDfsJePFMEtH399b8nvtYaeghwf7+2vMRcqEqjgZlxV65QRCY
	p/cqN4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2W2R-00000006goV-27Vo;
	Tue, 17 Mar 2026 15:08:55 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2W2L-00000006gmX-16Ym
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:08:50 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5091ed02c54so486591cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 08:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773760128; cv=none;
        d=google.com; s=arc-20240605;
        b=NVAaYydV0CrflprR389IkEdDscsTGoZI00N6iRa7u+IPAitfhyqHiqEr8MMV9NayGE
         ff/zP5WGaOBsOYmi3LZAsuM2C0cwWtb0OuIggbLNYn/CV7heQiQjR1b//WKiZjGiLW71
         UChlqUvjtvsSTfeEKTf2+Jvnvj7Ehiy0pgSq6P3U4Ecfa2AUGjis1FiCfIYk/6aa3LsP
         Dn3Cx0Ob9jc6QwwGSHBi6lSVuEEwFgRz39WNgL1yQtB/k5Q8b818Ahdt/Wv/zBXU8H0+
         +qPEFDNYOk6HMG9ApgTeEER06JY94i496nNyCf7LhhpIMYnIY4idMGkN8UFuO4hR/l+2
         tayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7jWTREPyzCDkGQNDSEs9bLoKmaSEJu/Woq4lGsLjr8c=;
        fh=t561rShtgmmUgBIVL3MpLM74lWZeoaNnKcBTmoy3LsA=;
        b=XUwgDNXX4b5KaZ3zvVgn9I7FW4AOmGc0DNfDMizmQVJXWWH5gNuu4U7Iu/LS6WIJ/b
         BrTvwhJjhDKq4g7NCIgzRdYL9RO/ZT3B152v6u7RR8QS+Mqw8+XpuMLXhdYIqiKNia1z
         zbwvewiQML8Wq2y89X/L8B0Qo/3VvneA3yThoTh0XeRrtfgGUa3bQcfxIR6DJuFBgwal
         APNq9kHbXwgkENRQXfBkmbwkz1IqUTRdg2DOGXuTzg+I1R6I4r0VYMbibd2YRWZ/IQPO
         uZDg1N4JiKt04y+GQ7doA2sYgzDrBJUfik1OxPM6q4/DveZUuD4+8Mockv6oQOwyBSSa
         J6bg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773760128; x=1774364928; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7jWTREPyzCDkGQNDSEs9bLoKmaSEJu/Woq4lGsLjr8c=;
        b=ISWj349Bj6czj/5c+nSTwSp3YOL6Xk3/sIcaVfV1vPogFeGRNGtLNoIcBu2N7DZEUq
         7soZp8Hvjj4aifb3jiNgkDIpc8FsYCCCNnldfMRN4CxDgH57c/Y/sw2HdI376wUt/hQD
         VOIKtpEeon6cV8Cei8T0/fBy2P6MyKD57oiLgSgcu4FQmFWfrgJkAuBnqKAy76GTUJxJ
         GdfNxXrqp791zO3Vw7NSQ3LOdiSnugq3XNejkm90rErjPJ7fS99Dg6kHj8x0Z8wEVR8p
         3txpS/GA+jVibGBUpoWFxblN63CsQoM/7bJLgo/BR8Xfe2W2Yisaq0eEn1HTksCBlOyf
         j1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760128; x=1774364928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jWTREPyzCDkGQNDSEs9bLoKmaSEJu/Woq4lGsLjr8c=;
        b=LNQLM/hzbtBeXmEdQ7fSLJb+tkZe69rxHMsybAj3/PICIlPE5JK3HGnD48J5rBC4Ka
         c8lHD0hoL5WDnbIDLZws/kUGGtSPhHhkP8eCwXlFb+qY2qNHtDO6Kcil3fPm8RLtL+QO
         EAEESVZtz+z76RSWpYXCPZfRiGNfU+m0uFPHK2wEgA+SCX6B+hptzJpLyDEvF0uEOy/S
         TPbeGVXd5Ap7ikjLlkuFbn3+EgI2PQkZFoP4TDywS+FHwBOCsn1S07lhDZ3vLdeGby0S
         cjLyVUkn5y/4oxjaiFGIQEMDwcRuuoBJV7jEFibEyuKbeKXnkAPs+1cHyFlgijz+eilm
         vNKg==
X-Forwarded-Encrypted: i=1; AJvYcCV8Cd+BIDPEw1KJhH+7NBUW43Lffmue/odk8wF42j56TcZH/InvHXFh4n7f7ZBaq5rxeo7Buan6qMpaBEfniW03@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr9YSEGc9Rb/l/x7OneEUlmwF7ILeX2P7cMpgBHfasu86/4qb3
	ryfSY7V98ny92iBmETItDe0/7lgXJDonuhTauKfcnM0vAcYyFpYwo9LSUl1VVWvXx471MWhh5dH
	c1geDxz5vkTdr9aLjHTE4PgLk/MukuVvvw/zjS/T/TkOz18pn9pq+DEuO
X-Gm-Gg: ATEYQzzOWyGU+Mp2gbLDt9mb1q6v9pYecXaWUAwNRVkxR4iphYo8CpWpsqKpRlO0f6S
	bWa+fl2tJn0idvY+GElxpR2OZEfQrJ3SF1mTRUrA1O/uM0a+AhOTZmGeUQ5dEjFQ+CYSu+Y1FMb
	iNoz0k7qYykZVKxtqeg1msPKOQMcivIWOO/ZNc8rNMn4/OMprLoHRNJ9Ht6vLl5wjBjS4HL5I+c
	fIvuzobahBctMxtpJj3DC7Nf+TUmSOZLgon6B34aaF9nU8RuixwEvg0mMj9o2OTDfDR7dd3nP4f
	8wgDujtmW4nxjSPYZ7oCei9PmnPQ3qJq4GnB
X-Received: by 2002:ac8:5e12:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5099ac78738mr14418391cf.1.1773760127098; Tue, 17 Mar 2026
 08:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-14-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-14-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 15:08:10 +0000
X-Gm-Features: AaiRm50tQZvylKlDpbQUpvWQUJ1v8L_ILPY_XeQv1DUqi7KBL0ZloUbelEHsyIo
Message-ID: <CA+EHjTxozYXqAwdmwnFX5DTPr80+xv9kA6_SYP-OMndNu1UcVQ@mail.gmail.com>
Subject: Re: [PATCH 13/17] KVM: arm64: Replace force_pte with a max_map_size attribute
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_080849_320569_FAE2B520 
X-CRM114-Status: GOOD (  23.61  )
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
> force_pte is annoyingly limited in what it expresses, and we'd
> be better off with a more generic primitive. Introduce max_map_size
> instead, which does the trick and can be moved into the vma_info
> structure. This firther allows it to reduce the scopes in which

nit: firther -> further

> it is mutable.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>


Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 47 +++++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ccdc9398e4ce2..ac4bfcc33aeb1 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1648,15 +1648,32 @@ struct kvm_s2_fault_desc {
>         unsigned long           hva;
>  };
>
> +struct kvm_s2_fault_vma_info {
> +       unsigned long   mmu_seq;
> +       long            vma_pagesize;
> +       vm_flags_t      vm_flags;
> +       unsigned long   max_map_size;
> +       struct page     *page;
> +       kvm_pfn_t       pfn;
> +       gfn_t           gfn;
> +       bool            mte_allowed;
> +       bool            is_vma_cacheable;
> +       bool            map_writable;
> +};
> +
>  static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
> -                                    struct vm_area_struct *vma, bool *force_pte)
> +                                    struct kvm_s2_fault_vma_info *s2vi,
> +                                    struct vm_area_struct *vma)
>  {
>         short vma_shift;
>
> -       if (*force_pte)
> +       if (memslot_is_logging(s2fd->memslot)) {
> +               s2vi->max_map_size = PAGE_SIZE;
>                 vma_shift = PAGE_SHIFT;
> -       else
> +       } else {
> +               s2vi->max_map_size = PUD_SIZE;
>                 vma_shift = get_vma_page_shift(vma, s2fd->hva);
> +       }
>
>         switch (vma_shift) {
>  #ifndef __PAGETABLE_PMD_FOLDED
> @@ -1674,7 +1691,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>                 fallthrough;
>         case CONT_PTE_SHIFT:
>                 vma_shift = PAGE_SHIFT;
> -               *force_pte = true;
> +               s2vi->max_map_size = PAGE_SIZE;
>                 fallthrough;
>         case PAGE_SHIFT:
>                 break;
> @@ -1685,7 +1702,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>         if (s2fd->nested) {
>                 unsigned long max_map_size;
>
> -               max_map_size = *force_pte ? PAGE_SIZE : PUD_SIZE;
> +               max_map_size = min(s2vi->max_map_size, PUD_SIZE);
>
>                 /*
>                  * If we're about to create a shadow stage 2 entry, then we
> @@ -1703,28 +1720,15 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>                 else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
>                         max_map_size = PAGE_SIZE;
>
> -               *force_pte = (max_map_size == PAGE_SIZE);
> +               s2vi->max_map_size = max_map_size;
>                 vma_shift = min_t(short, vma_shift, __ffs(max_map_size));
>         }
>
>         return vma_shift;
>  }
>
> -struct kvm_s2_fault_vma_info {
> -       unsigned long   mmu_seq;
> -       long            vma_pagesize;
> -       vm_flags_t      vm_flags;
> -       struct page     *page;
> -       kvm_pfn_t       pfn;
> -       gfn_t           gfn;
> -       bool            mte_allowed;
> -       bool            is_vma_cacheable;
> -       bool            map_writable;
> -};
> -
>  struct kvm_s2_fault {
>         bool s2_force_noncacheable;
> -       bool force_pte;
>         enum kvm_pgtable_prot prot;
>  };
>
> @@ -1748,7 +1752,7 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>                 return -EFAULT;
>         }
>
> -       s2vi->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, vma, &fault->force_pte));
> +       s2vi->vma_pagesize = BIT(kvm_s2_resolve_vma_size(s2fd, s2vi, vma));
>
>         /*
>          * Both the canonical IPA and fault IPA must be aligned to the
> @@ -1933,7 +1937,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>          * backed by a THP and thus use block mapping if possible.
>          */
>         if (mapping_size == PAGE_SIZE &&
> -           !(fault->force_pte || fault->s2_force_noncacheable)) {
> +           !(s2vi->max_map_size == PAGE_SIZE || fault->s2_force_noncacheable)) {
>                 if (perm_fault_granule > PAGE_SIZE) {
>                         mapping_size = perm_fault_granule;
>                 } else {
> @@ -1990,7 +1994,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
>         struct kvm_s2_fault_vma_info s2vi = {};
>         struct kvm_s2_fault fault = {
> -               .force_pte = memslot_is_logging(s2fd->memslot),
>                 .prot = KVM_PGTABLE_PROT_R,
>         };
>         void *memcache;
> --
> 2.47.3
>

