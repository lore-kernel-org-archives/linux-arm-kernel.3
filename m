Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAC2FD707A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WKdprvW6adU6RgFVo+d3KCZoQm+Cn1qvOXuG+NZlR0=; b=FL8mBKYLECWew4NGzpmdFJnQM3
	Am9pbMUG4eGx/VBJgtubO82uqyPdQTFyyWfHQAW2jY8L+CLX7vJraRbg/sRDSTlGJ3hYfI4VZd3+h
	j6IXvZ7d+Febk9dtKexhOPtPACViT/TDbBcQiSkan4mIxQUvlJqUCABvXDC/BP1fWPcBvJQ4rlxrt
	16rjkSzVIAu0JUR+bGlOe81/twkWsnyV1meaNclVzP4YOOOI83xFGsMOJmdGVq1aZ5SR5XgAdzKGv
	cyHTpgV9dOcBi+43gzJt0Vpv6orntKdwm3coxqUwxMTOPji1w7/jyF9osGPCaGXl4Q3oTnTFNmLkJ
	LFHDojlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SEs-000000065VN-2CAK;
	Tue, 17 Mar 2026 11:05:30 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SEp-000000065Um-2QqN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:05:28 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-50906a98ffeso552471cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 04:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773745526; cv=none;
        d=google.com; s=arc-20240605;
        b=S/P87FGbLbRrRWAoTtQz8ypT51n4z8th053ksVbAR/l8xvhg+wXAiNWGo9/IYQ5QKV
         uln9zU5rxG+bOg9ZgDO9ZsgrJ9DtlclUvlHzh/72PwGXpdNRFTOF5HCFpb9BQgajYnFq
         H9RDbYkz7jtS9tZ52hONrgvPLxwsFhv5Za7wI3AcDwpxJKt4HPZMjJOSvUKQg/L96RWB
         Kub5QCGe0Upt8TgcsBziLtrzQVIPyXsjunFth49QOotNNGtN9k3NenXBVdwlZ+d/H19m
         vEMsuZ8FiO/RYgTYTKfXQlBKo9mlZPHLLT6jVYBIyUsffhHKkmr7xfxFEqIaY70O+K35
         RGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/WKdprvW6adU6RgFVo+d3KCZoQm+Cn1qvOXuG+NZlR0=;
        fh=mJUrBG/UtpjNfUM2yCBNMfc1jmEhoMkGhJ9n9Ju55K8=;
        b=NkEVhO19AvJ22x6iCN+lIjHsazenPwd+r/HOowcEIMyJaBlnqWQJrnJnFgotfOf3/O
         HybMyFlzQCylzN+NKJkPDO/DK37G5orlYAKDQ+p3dpOKsT0jp9vnZdFAM//lmKyb4g61
         qQtURchU0S/1mw1qMWDDpoIrsdrAeoZNTkAIFwWTh2RV2mKPO3UCLoyTkOjUUADxMWxk
         62Qlzt5HvBJuxYe0QGrz2J5P/LOtjxxIGu3HUmr53XuHiSjDaYc5Fh73SZUnLljYuGSS
         JxZDKPrqhQu3RZVN8P6hUhIY/zKs+uJIRq7Tq7x3AVuIo9KCO49x+EKU5/CKVk8My/p6
         ZOcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773745526; x=1774350326; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/WKdprvW6adU6RgFVo+d3KCZoQm+Cn1qvOXuG+NZlR0=;
        b=dNkDOKZIs7gv6mxjCWB8Qfw25yNMELL/sj0BEPYvxaqsqpBuxbTPMtzF+Z6g58LYYI
         dyvy9cT3bphidp+l4xSblQh+z5+NoLHaA91SCsehJ0UPHLsx79sblt+wLVcUQOTmYgqJ
         I5QgV6/PDstE/8DF4qHtHouArlHTXUy4MFAK5EHKWAdOnoCz2R2kCphhjgUc9xFCmX0x
         ob3ubMZ+NW2rIYiDlY/a4I/sL6XNAT8dNDo2+H3KZ2FDRToZ8H3zFLp8shw3/wlnidVy
         C1Hct8qW7qMuQP444B5cu8bEiRzdPl1SAgDB2dOOFH93eETZOSKxU+4TL2bhD2LWW5Ep
         2woQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773745526; x=1774350326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WKdprvW6adU6RgFVo+d3KCZoQm+Cn1qvOXuG+NZlR0=;
        b=lCFhXex+OCFXW1WpxiL2+71mIXxkN9Dj6MSa/KrYrxGrrWIa01g1uRluQ/SWfAIV/4
         20ZMJujdhIOJA6cxujV5On6vkkBa8byAYxFGY6zgJBcwfcWv9ixSYRdLhBOMlqV2ictp
         LfuoI1CBsJkjyj1JP8oA4XFAwraYn//MuNMmNdukQbFX4mzdlaFC/ZvDqQEioTyLsrfU
         cmH2CXshkRuWAWSYDHriofAfw+EnGGkywnLqlCm0DvDQOnSK5LX3pH3cXG1p27uaFczE
         qr0wC7WP6LgmdNMIkyIH4Eqku1/ZX+ibOk3LbUYmZ3AXf8jyeK6bFcv3QZZTkUIWo8Dn
         zcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUilxbYOmThJA23BhkLmneLiOaL4IPc09Z9AXH1OML+Jj9XoGBcklrLorKF2bdXyLJL0se0j4bhu3f1B+M87zXw@lists.infradead.org
X-Gm-Message-State: AOJu0YzBLeGVDEL65y6+AMrZ2LbOO+Dc9SqYR5QMBGr4edq8DrAyOFiZ
	B9HNA7ODd1j2dz5w+puOeYxaHyXmuDDG75U39uUDzj25GZv9rJiyUs8d+Mlgs9ljhH1+5zP+EDh
	hSsqc8AK/k2zJ7ZzVaUo03+F5QOV0FUsyTinvpQQM
X-Gm-Gg: ATEYQzyhc06eNYusb34EQy+D/x/5YYKmZbpP2eeLc8V4ncVrD45iBpmquX2FvF2LvwA
	xucNIeSwhqi/F9PlTdCIVeYnX0Lae1Qsz68fg6gQEMfJ2DDF3MYy4HTGtTa3AD+kn7LUkMLKMIG
	dzIbrogHqgIUjz2usxeQd9kZE0WzU/EGSfIG8ToRgbRBYV/sb6BfeAlnXqAElqhx1lpoyVEKkA2
	RZA6djG4wcN+gmFQaz/RurEmjBCZO1ESQxWb84pHPWBFD2h79NVkYoAAryXw99kzZMeKDdcoaUi
	bm7JtSOa9wPMdvucLUFWFOY3jTKe/7UV55Ar
X-Received: by 2002:a05:622a:1905:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5099ae32a3amr11048511cf.5.1773745524297; Tue, 17 Mar 2026
 04:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-6-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-6-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 11:04:47 +0000
X-Gm-Features: AaiRm52BrqjoXTcX4p8Zz17WuQuzN8NXXt28Rw0tRU6bXjzxR_z_iFz7YXzu9e4
Message-ID: <CA+EHjTwmHKCqeHCzjhRj6sXu+ahtO69spFEmegUTzwxbH5=QVA@mail.gmail.com>
Subject: Re: [PATCH 05/17] KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_040527_635845_82802F28 
X-CRM114-Status: GOOD (  23.45  )
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
> The notion of fault_granule is specific to kvm_s2_fault_map(), and
> is unused anywhere else.
>
> Move this variable locally, removing it from kvm_s2_fault.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/arm64/kvm/mmu.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1b32f2e6c3e61..12c2f0aeaae4c 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1724,7 +1724,6 @@ struct kvm_s2_fault {
>         bool logging_active;
>         bool force_pte;
>         long vma_pagesize;
> -       long fault_granule;
>         enum kvm_pgtable_prot prot;
>         struct page *page;
>         vm_flags_t vm_flags;
> @@ -1908,9 +1907,9 @@ static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
>  static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                             struct kvm_s2_fault *fault, void *memcache)
>  {
> -       bool fault_is_perm = kvm_s2_fault_is_perm(s2fd);
>         struct kvm *kvm = s2fd->vcpu->kvm;
>         struct kvm_pgtable *pgt;
> +       long perm_fault_granule;
>         int ret;
>         enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>
> @@ -1920,14 +1919,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>         if (mmu_invalidate_retry(kvm, fault->mmu_seq))
>                 goto out_unlock;
>
> +       perm_fault_granule = (kvm_s2_fault_is_perm(s2fd) ?
> +                             kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0);
> +
>         /*
>          * If we are not forced to use fault->page mapping, check if we are
>          * backed by a THP and thus use block mapping if possible.
>          */
>         if (fault->vma_pagesize == PAGE_SIZE &&
>             !(fault->force_pte || fault->s2_force_noncacheable)) {
> -               if (fault_is_perm && fault->fault_granule > PAGE_SIZE) {
> -                       fault->vma_pagesize = fault->fault_granule;
> +               if (perm_fault_granule > PAGE_SIZE) {
> +                       fault->vma_pagesize = perm_fault_granule;
>                 } else {
>                         fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
>                                                                           s2fd->hva, &fault->pfn,
> @@ -1940,15 +1942,15 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                 }
>         }
>
> -       if (!fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
> +       if (!perm_fault_granule && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
>                 sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
>
>         /*
>          * Under the premise of getting a FSC_PERM fault, we just need to relax
> -        * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,
> +        * permissions only if vma_pagesize equals perm_fault_granule. Otherwise,
>          * kvm_pgtable_stage2_map() should be called to change block size.
>          */
> -       if (fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
> +       if (fault->vma_pagesize == perm_fault_granule) {
>                 /*
>                  * Drop the SW bits in favour of those stored in the
>                  * PTE, which will be preserved.
> @@ -1984,7 +1986,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
>                 .prot = KVM_PGTABLE_PROT_R,
> -               .fault_granule = perm_fault ? kvm_vcpu_trap_get_perm_fault_granule(s2fd->vcpu) : 0,
>                 .write_fault = write_fault,
>                 .exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
>                 .topup_memcache = !perm_fault || (logging_active && write_fault),
> --
> 2.47.3
>

