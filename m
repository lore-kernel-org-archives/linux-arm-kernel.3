Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F96FD8775
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQnRDSt6fhx6qZCPagnHsoKy2Gq1xtg11v45i8dRbO8=; b=cNWkcwH9TWQ36MeFDWdr1x50zz
	dLBqIHtN2E8/JUpqHfeK3eM82b8eRK+240HOcIVFkYATM4b0C2uDA3ZzzrcNkv5cWo0HrXGffMx1S
	houjeq2rrCJtQ3wI/CE/96wG3vvxRMQ3UHnP6VmDmXuVz347eaPAbIAGSOK+KXPbc1E/wUB6S4rBJ
	4/WpoNYbJ6Ma8VkTHZzLw40JJAtGsr/tSyI4A0hPdXzqo4XTQvAUW+Pfsy4cSR2lMXrglAw71cHlq
	Sx8EZKUWN3/0axp7joqUe/NEJJjea1lEj+3ZqDMgSyN9tuk4r1uhnQF9zXS08ZqB/MHJRnfTYuIl6
	sQH0smWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Utj-00000006UCX-1erj;
	Tue, 17 Mar 2026 13:55:51 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Utg-00000006UBR-1skM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:55:49 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-509062d829dso514441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 06:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773755747; cv=none;
        d=google.com; s=arc-20240605;
        b=NbeCwcCdxP3oZN4V4m5KCjNomlbdK7YT3EhjQ54i3ZZyUJMb7d+2znX2lm+aOZxDCN
         1chJjeF6m5lepr1w+xPsQu5Y5UCj3b5mAxHsCCKfChkalXQl/IwvVW62bOYdcyRcYtmc
         yjS5wvp/XcjXqDsvQNhIiZrQZH1d0y8KjVT2JCOv/8pXIi2H5DtxLKUlJ0ONcpobgsQu
         LLkfyro+baOLuyVwwgrUNzW9qahvoYVQ9rtq8sLuAK/vbFVTScge4/tCOO534JQxvtUf
         Fbwm9JWyhLxAO+3zMqmat/CKBOpY3K0ZOlzs8ubxcIWOrA/w9vB1Pp39m16qNhN+mDE2
         jnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QQnRDSt6fhx6qZCPagnHsoKy2Gq1xtg11v45i8dRbO8=;
        fh=+E8JPvbjaWmc3aFTZYJjrNo7l1K/QxQQLPWcfk+s7vg=;
        b=U16IrYf0vXQRCRr3U5Nza58HRk8HI5tojOojGIzqAJBhq/ji+fVyQT+goa3Os+e1AN
         RV7YjU+QkgKBaclkhs8Jvtmgq+Ye1uTOr58ThU9J4fjkrnJrtik4+Uv85xCiu83LyQn7
         zyZlP0MI+rDsVa0eq5calJ+3TD62pBVoYGHFot0evRGjW+ofrW5wvvb2mBficmJZ0zkP
         rd5OqI1YdsLwd2Gqfn/tbfnIxryDa+bYxAZMPcs5USBJSJ3JkGl2Hg3XZKewzjpPa8oZ
         NGNLCo1aiIa0fKt/hUtOWHlgV1eZU6yCBumFB0EvJYS76evm/dkiW/MQHO5DOdYQz0Nd
         Ykcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773755747; x=1774360547; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QQnRDSt6fhx6qZCPagnHsoKy2Gq1xtg11v45i8dRbO8=;
        b=LzRPy5wMJ9TCRMnj3cLILumvnKW8AOu+KWDQE5yFtP+i12/cQvf7uo2mEOsNqA/d40
         KdJvbOMdSCIVq1aiwmWmUY8Bx9XqrBp/B+RVqmQlwVBQqz/7bVDlQCC9dQrTWvlc5FYc
         a4klOfQo0Xqj+wk8+2/yl0VXx6caEJOzBK2S70huejMeGSB4N8VLDU/waWSDGft5HlKJ
         gsISWXgENFdQFaSfO51R3ovw6RLoDIf5sFceIMXZsLcx2g7tYhbgFBZfcguYZ4x/6Hps
         LKN4O1d7+HTkSK48K5ZrPMzEkm0AgUZLrJqXg/+MrYYEY5Ldz2EzIX1cAa76DlTEGI6v
         hMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755747; x=1774360547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQnRDSt6fhx6qZCPagnHsoKy2Gq1xtg11v45i8dRbO8=;
        b=pbKyrmauWxr65FfobEJNcWLYWWe8K9DJr9sfy23F/binHO2K31rChqVgRdDLWVKDGL
         8e4I791n9n7TzvBJdse/tSZdJ+4kOH8byFRgLlySeCj+W93fKE+njfPxcXz/I12AptCB
         be8XwRmsku13IjlTJR6uIg/MfKnqhOpd6TGDDPx/G18SVdoDj+E0AI38kTWcxn7J7m2y
         6nL56ymjnG0HkxYBo3Y+LZlabPNCiwQqcZGPdIdjVlQyOdaLUISqJYGQP/DV0elcIFSV
         eg6KpPR9ag3yli5XUaSksqNs5u7Px2ODd+pOV7fRQb+7pzyAvq566rrXsfVA9Zup3shH
         y9yg==
X-Forwarded-Encrypted: i=1; AJvYcCWkSsdNJO484BsTSVMKk8fuoOA1uVao9nV+69uCa5dhMDnmswUgH5yoyrk3YrJT1V/9wBSY4BTQ1kFRZQkbZCM/@lists.infradead.org
X-Gm-Message-State: AOJu0YwmtyfZL1ED/G4BJioVMATcX23a+12CfFqdBDayd7gqh8D1pZLq
	YQGAFcCdmXk9wwYkXc4jN8iErLb+DKm4YM3np8VKXfIxtgXurkxpWyS+UsJOS31jKZ0D36uo3jc
	5gLaXX3uVoJBTXocHC/4vTbCTjTc/gXPZuTfTWIRx
X-Gm-Gg: ATEYQzySNzLPiTpq75Kr2Opk5EcUd2DFsx5D87+xpqiiKGXIUO6Omdu0xuZoBk7+6XS
	Cz3/XXTWWUbyplMxRQsuHZSHGq/7UKQ72ckG8E6jLb5qG1fvy9rNlXnRSOC7c3gEa7vJfqaGsc0
	y6C0sMCt8aJivOmjiLNrrfNxKz5LXfWJfoNr9e5+EzKs+hHxauSmkbLvbpyljOkLotlwI2LZUNr
	N/A1D3lgcjhPO1brPcWLNUSUCsi26ctOFaUh4UsAaKKnbTcycmdQPD1E7sZIeGWI3HfN6RSsZMg
	iKcXUtmjipGwFR33db+5YfPRnqeGePb5zzqXTYiDFF05RVU=
X-Received: by 2002:a05:622a:3cb:b0:509:2cd4:b705 with SMTP id
 d75a77b69052e-50998c18cb5mr16297621cf.4.1773755746442; Tue, 17 Mar 2026
 06:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-12-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-12-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 13:55:09 +0000
X-Gm-Features: AaiRm52vhO-0_fyw-KU_tGB1ZZCMQknIbuzbybziiN4mR8MVeeBdjDQp9RpfHh8
Message-ID: <CA+EHjTzH9RHEDS6XcGQ4A0zt2HcCaFzvBg6xww82hpDSF_rAmg@mail.gmail.com>
Subject: Re: [PATCH 11/17] KVM: arm64: Restrict the scope of the 'writable' attribute
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_065548_531077_8F21AF57 
X-CRM114-Status: GOOD (  23.20  )
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
> The 'writable' field is ambiguous, and indicates multiple things:
>
> - whether the underlying memslot is writable
>
> - whether we are resolving the fault with writable attributes
>
> Add a new field to kvm_s2_fault_vma_info (map_writable) to indicate
> the former condition, and have local writable variables to track
> the latter.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

user_mem_abort() was overloading a lot of variables!

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index caa5bedc79e19..3cfb8f2a6d186 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1717,10 +1717,10 @@ struct kvm_s2_fault_vma_info {
>         gfn_t           gfn;
>         bool            mte_allowed;
>         bool            is_vma_cacheable;
> +       bool            map_writable;
>  };
>
>  struct kvm_s2_fault {
> -       bool writable;
>         bool s2_force_noncacheable;
>         kvm_pfn_t pfn;
>         bool force_pte;
> @@ -1801,7 +1801,7 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>
>         fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, s2vi),
>                                        kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
> -                                      &fault->writable, &fault->page);
> +                                      &s2vi->map_writable, &fault->page);
>         if (unlikely(is_error_noslot_pfn(fault->pfn))) {
>                 if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
>                         kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
> @@ -1818,6 +1818,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                                      const struct kvm_s2_fault_vma_info *s2vi)
>  {
>         struct kvm *kvm = s2fd->vcpu->kvm;
> +       bool writable = s2vi->map_writable;
>
>         /*
>          * Check if this is non-struct page memory PFN, and cannot support
> @@ -1857,7 +1858,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                  * Only actually map the page as writable if this was a write
>                  * fault.
>                  */
> -               fault->writable = false;
> +               writable = false;
>         }
>
>         if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && fault->s2_force_noncacheable)
> @@ -1875,9 +1876,9 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>         }
>
>         if (s2fd->nested)
> -               adjust_nested_fault_perms(s2fd->nested, &fault->prot, &fault->writable);
> +               adjust_nested_fault_perms(s2fd->nested, &fault->prot, &writable);
>
> -       if (fault->writable)
> +       if (writable)
>                 fault->prot |= KVM_PGTABLE_PROT_W;
>
>         if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
> @@ -1906,6 +1907,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                             const struct kvm_s2_fault_vma_info *s2vi, void *memcache)
>  {
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
> +       bool writable = fault->prot & KVM_PGTABLE_PROT_W;
>         struct kvm *kvm = s2fd->vcpu->kvm;
>         struct kvm_pgtable *pgt;
>         long perm_fault_granule;
> @@ -1966,11 +1968,11 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>         }
>
>  out_unlock:
> -       kvm_release_faultin_page(kvm, fault->page, !!ret, fault->writable);
> +       kvm_release_faultin_page(kvm, fault->page, !!ret, writable);
>         kvm_fault_unlock(kvm);
>
>         /* Mark the page dirty only if the fault is handled successfully */
> -       if (fault->writable && !ret) {
> +       if (writable && !ret) {
>                 phys_addr_t ipa = gfn_to_gpa(get_canonical_gfn(s2fd, s2vi));
>                 ipa &= ~(mapping_size - 1);
>                 mark_page_dirty_in_slot(kvm, s2fd->memslot, gpa_to_gfn(ipa));
> --
> 2.47.3
>

