Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ECDFD877D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDgXPQFxNwyLbF7UxodwiAipSXFBQ9HY2PjQ5y6FI3s=; b=nSgObFzPmCD8l4wCipmLlDFyJr
	844gGmrYWXGmy/cBrrLdGEbBvP/UjJ7nl+GXhu3mAlk2/raDBt+VpuYEU3FIHxwDbHR1W7OsVj3Ry
	StcwpuZwfYueSKkp/bmVZ6TUFLlalFha/6PvYyTkb9MCvjIzUgB2XT3+Krc9EMYLbwvUNsumy45Yz
	Pl3B+VkIb71DJAnNMn6Xi6zXCwblzeJUOTWNiTFi+88jlIAT9Vvjoayi6RUP2m55SDfLSYKnnlodb
	Fzf4JjYoQJ+vhHMz2jxlTk1rBL77RuUeDdnsStUVHAy7LcnAYcZd+/v/duch2l6CS9IbDonplpFPv
	EoAEESYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VMj-00000006ait-1qUI;
	Tue, 17 Mar 2026 14:25:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VMh-00000006ae5-2DZN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 14:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RDgXPQFxNwyLbF7UxodwiAipSXFBQ9HY2PjQ5y6FI3s=; b=fcizZV5ieIMUmCzqYGPBuU8Vf4
	hcl9Le9Fg5wsaB0iJQkkRgc8fztnUXWRhjLO1TBEdR3mcjg1Wj8gDnJKhPQJbRCFpNRBR8EGWMSwe
	lcxHYD7mgGGQ1I8jOWwVi36DqZBoXu9HopV51VRyYWrve8Xm0evI29X2ckpxbcHsfQ52iPZLNw67H
	ibZPRtuVn3MgoCg4SG+LRocwGJeBzMt2di8DVaRPiuWyLJgGh/iZ9Jd7sSWkvSRV8FqvoFXYSoUty
	WMsQPDtwgfOGZfE1yINZpIQgqNhuLlQxZckvbGxJdrPxvYffJq4zciW40VYZWMVaSaor5dXMxFhyN
	bQGxSVPg==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VMb-00000009DpU-0dri
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:25:45 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5091ed02c54so454001cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773757539; cv=none;
        d=google.com; s=arc-20240605;
        b=j6WVarlyiBrDnAp+cWv4gLr9RB6xOqVJM/3i8/oab9nE2+WhYVWCgt219dnHfbSY0R
         rfUj73T91Mp95tk3orATeCmzTBOsX2tqLr3y8Lm/yYkfTbh0NmwvjtCQQiLSIegjZH2e
         4edPwqNad74wMQp3HBLufYFxj0Eyug9KQk+oCnF+TyO2+Q01V4M9Gj66kQyBICWVuetm
         OP2DzhzDN74x31UD+FuE7NEswo/geKqUOhn9tCR0mh7DxvM0AzaAjmM/18TOTRsv6Fxr
         LMD1F5Urw6SkhmkanNNjvLMV74FP8qcQ72MtfFRQQHxgoCvnH8FKX2qrrESHKPGaPhte
         khIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RDgXPQFxNwyLbF7UxodwiAipSXFBQ9HY2PjQ5y6FI3s=;
        fh=n4xyQHOt85FFMiPeRJdjhhQ0mACnMesiAPj3lyB1WzE=;
        b=JH0ertUELedeyXZhoLjrNF0EAjqTneM+hFfVFZEee3Ocu3z55Efd0S8V3G4YFmIgn1
         Evsc0WqY1eN0SBfS8xaXJPvlsSOcT8yNSsp2dW6oSvzAzWojUkbQUKgp6mLS4OeTcfnW
         6t2KHqjjSFcQk6gC6rvc0Fpe1h/CyxyB9qyVsl4eMUYnEOcRJvL579ZMHp9D+fJTZrEj
         wSRVjjgRgtoAkWkDqw2xPN+RfjAEkiukf8FhTzhTMzphvAieIYEHROS46wN5tRTfIbDf
         SwvwJ/yFIMSdjJ4qccnL8sX5qVqjxphP4Bb9BluVuTtCF0N5o8QUPxGz0Mgmzhq7z2C7
         JSKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773757539; x=1774362339; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RDgXPQFxNwyLbF7UxodwiAipSXFBQ9HY2PjQ5y6FI3s=;
        b=NhqPyAjwAeDSA1d6qFKUrcYsIM7/QAHWupQho+so8CKQZS3VYvDi0rYtaw1a1r9fBS
         OLFArOCHqW8fVvfd2ALFGb1S/wdUCm49nsq0AlZ3IfIalwDxmJM2BfJyWrynSxKmjVLG
         CddXw2I/NAaub3Nda7dyctqg2bmzSMi8xk0NUwcoaRQeD1PC6beTRJPFfZQ8lizD+FB1
         nDumtBrUyJ3y0TCzaCuGrmE2jpWm12bw/paR9RgCz5tf8Eh2aH5gDST1GkzId9BKW0Em
         4j5OTVNcN8O8UThpi8kaTlYhjSjPrw0hP6klx6VUwJj6VLOGamz2flsrbQNQb996cBBn
         1gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757539; x=1774362339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDgXPQFxNwyLbF7UxodwiAipSXFBQ9HY2PjQ5y6FI3s=;
        b=qRAoPN90oHzFR2DFQfijVIYAZ1temJqzZfMIrT6Y/RQTIc2KNkvHDpKPB/wYbaay8z
         dDG9PYiEG8GJ7Y2lpQ1ctiLuCzR18k3vVnOcMybPFfRrVrS55G/Iwg4KbzQ4udclHZpw
         5MDf3L3n9NRwFz89YbbNSPUc/kfS61IOlcO/Tlg1N4kzPs3bHbjdVbeM6XUNJlt5WdA1
         kx5x3NYLtbkwkIQCAYFe6QLkGuI1p7AeduQ2PRRQlfELFxnOopL4gELRueTq+GrGhpNp
         KRXfAzhYBS6+qLRAo8I5IS6C27g4p6nI5ChoJ5mz8zPvhF3pYsamBXJwOPDqP8DH1guG
         5boA==
X-Forwarded-Encrypted: i=1; AJvYcCU+mH5QzwRO3+TjRMzGu386gRi06bXnvNio0mPh/CEYEFvzVJCHklEUJowHb/Oo7eumtBFRATZ++vun1XPYAEmH@lists.infradead.org
X-Gm-Message-State: AOJu0YwRPdv8uuWOqsds9USOtPB4Gq0EpJC7sveGa/T/wSwNJdiI+PgR
	Z06vChXTzlqxDU6jUI8QxmVidQAv/P5GFJj3KbSImirVhNyzhG8NMk/y54RNJzq3SMyt5NwY48Q
	S+PzYMD4qpB0+XZJa10PyLiWxxmicYpxwiOpfO+9q
X-Gm-Gg: ATEYQzwcaFsYa+UsomvYDJU0hR16bBuvHUp9436xkgoSmGkfhMDv4Uz2C8MmQMimdTE
	jxbPgYH10bFIoSu5iciCoaLkK6KcsctFRo98MJWAsuJeUMA9Cp0TcfgZSgKRHphUvzaRLVwFnZc
	S9MqZN40r6hq6Dv/4zYLbR7PJBpimul7yhpRa3EaYpXillx39064o/99+USqLWKrs4Qlo9RaUIQ
	6A9rE9bgMl5MUgRErpjviVK125D3MDjEEAM+Kd3fAKZouAadTQmjZLv/7ALEcLSw6mQcCDGDAn0
	zP7hn/L1kUCxuxqra3iZH/DujFtxq9cAfqbDhn8XP9GIms8=
X-Received: by 2002:ac8:5e12:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5099ac78738mr13659191cf.1.1773757537772; Tue, 17 Mar 2026
 07:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-13-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-13-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 14:24:59 +0000
X-Gm-Features: AaiRm53KaKAYPLiiykSZkaQGEnrJnLw55L58DrfKhGoM2E5oJXLDC8vITPX0HY0
Message-ID: <CA+EHjTw2XkbM83YTE1fRaPMdLZt_nxZcYkfdNag2F16Z=1kXfg@mail.gmail.com>
Subject: Re: [PATCH 12/17] KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_142541_327709_DA418E5D 
X-CRM114-Status: GOOD (  24.41  )
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
> Continue restricting the visibility/mutability of some attributes
> by moving kvm_s2_fault.{pfn,page} to kvm_s2_vma_info.
>
> This is a pretty mechanical change.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 3cfb8f2a6d186..ccdc9398e4ce2 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1714,6 +1714,8 @@ struct kvm_s2_fault_vma_info {
>         unsigned long   mmu_seq;
>         long            vma_pagesize;
>         vm_flags_t      vm_flags;
> +       struct page     *page;
> +       kvm_pfn_t       pfn;
>         gfn_t           gfn;
>         bool            mte_allowed;
>         bool            is_vma_cacheable;
> @@ -1722,10 +1724,8 @@ struct kvm_s2_fault_vma_info {
>
>  struct kvm_s2_fault {
>         bool s2_force_noncacheable;
> -       kvm_pfn_t pfn;
>         bool force_pte;
>         enum kvm_pgtable_prot prot;
> -       struct page *page;
>  };
>
>  static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
> @@ -1799,11 +1799,11 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>         if (ret)
>                 return ret;
>
> -       fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
> -                                      kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
> -                                      &s2vi->map_writable, &fault->page);
> -       if (unlikely(is_error_noslot_pfn(fault->pfn))) {
> -               if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> +       s2vi->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
> +                                     kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
> +                                     &s2vi->map_writable, &s2vi->page);
> +       if (unlikely(is_error_noslot_pfn(s2vi->pfn))) {
> +               if (s2vi->pfn == KVM_PFN_ERR_HWPOISON) {
>                         kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
>                         return 0;
>                 }
> @@ -1824,7 +1824,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>          * Check if this is non-struct page memory PFN, and cannot support
>          * CMOs. It could potentially be unsafe to access as cacheable.
>          */
> -       if (s2vi->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
> +       if (s2vi->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(s2vi->pfn)) {
>                 if (s2vi->is_vma_cacheable) {
>                         /*
>                          * Whilst the VMA owner expects cacheable mapping to this
> @@ -1912,6 +1912,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>         struct kvm_pgtable *pgt;
>         long perm_fault_granule;
>         long mapping_size;
> +       kvm_pfn_t pfn;
>         gfn_t gfn;
>         int ret;
>
> @@ -1924,10 +1925,11 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>         perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
>                               kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
>         mapping_size = s2vi->vma_pagesize;
> +       pfn = s2vi->pfn;
>         gfn = s2vi->gfn;
>
>         /*
> -        * If we are not forced to use fault->page mapping, check if we are
> +        * If we are not forced to use page mapping, check if we are
>          * backed by a THP and thus use block mapping if possible.
>          */
>         if (mapping_size == PAGE_SIZE &&
> @@ -1936,7 +1938,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                         mapping_size = perm_fault_granule;
>                 } else {
>                         mapping_size = transparent_hugepage_adjust(kvm, s2fd->memslot,
> -                                                                  s2fd->hva, &fault->pfn,
> +                                                                  s2fd->hva, &pfn,
>                                                                    &gfn);
>                         if (mapping_size < 0) {
>                                 ret = mapping_size;
> @@ -1946,7 +1948,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>         }
>
>         if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
> -               sanitise_mte_tags(kvm, fault->pfn, mapping_size);
> +               sanitise_mte_tags(kvm, pfn, mapping_size);
>
>         /*
>          * Under the premise of getting a FSC_PERM fault, we just need to relax
> @@ -1963,12 +1965,12 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                                                                  fault->prot, flags);
>         } else {
>                 ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
> -                                                        __pfn_to_phys(fault->pfn), fault->prot,
> +                                                        __pfn_to_phys(pfn), fault->prot,
>                                                          memcache, flags);
>         }
>
>  out_unlock:
> -       kvm_release_faultin_page(kvm, fault->page, !!ret, writable);
> +       kvm_release_faultin_page(kvm, s2vi->page, !!ret, writable);
>         kvm_fault_unlock(kvm);
>
>         /* Mark the page dirty only if the fault is handled successfully */
> @@ -2017,7 +2019,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>
>         ret = kvm_s2_fault_compute_prot(s2fd, &fault, &s2vi);
>         if (ret) {
> -               kvm_release_page_unused(fault.page);
> +               kvm_release_page_unused(s2vi.page);
>                 return ret;
>         }
>
> --
> 2.47.3
>
>

