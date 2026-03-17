Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62C8F3382B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl8+CRYT4AqYzj6TfeAkgV0uZq+82OmQ6U8LucFBjLc=; b=hKs5za1JjngoOvDH/NwnUOGikI
	AQ6C5LxaXeGHQej/APoGbks6YEqtige4D6xCh4fhtqzV2Q6DUi+auWzuXdEGTOWpSCJwYQqn9s3Gp
	4V0nXVQKgdSSRO14I1LnAxuqaVo38RdnQmL0molnZ8/O1RDjc6dIEWhVDYpfAfo8rcY2Ww3xLD/Ze
	JcMPV3cIHXC08OV3apBz3cvjR1J2gwDwzldNaeduJdq5DYNvXu+G2734eKIrD3fMN0ZjdZCBCfHqX
	x4E/8zuum/kwVfj2Nf1+kVRpAtLiTTjyuheBXLncGA+7Gu3Hu/zzETZIU+DNdfaTSmTDTlgjVA7kq
	BithTBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qtl-00000005uQC-0PQb;
	Tue, 17 Mar 2026 09:39:37 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qtj-00000005uPr-02In
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:39:36 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-509062d829dso379531cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 02:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773740374; cv=none;
        d=google.com; s=arc-20240605;
        b=PYhsl6aNbvQomRtM+JRAD/ju00U4wyykg1Azmn8zl5Hfzpkj5LTZVzXXo1LxP4MeUb
         mjD21kVYIS67Gx+AU+5vbsRhO3UGlBM0WXSNVFrg5gDD8ctGiRCe24KMvlj+UuzeAsg1
         PzFkRcHRFMwbRq9R5SEFQwrr7TSv7xZ338hVl35bPO8az8uliL3oP813uz2akIG3C4NX
         UOyIBQrS6gT/LpfH190zi4A0ALdNliJm5JVIOJkh/zKlxZPq4xfAmwCxPI7W2Eo6HKQN
         NiDWFEVSjlLt82hwyjxQHUAhhIXdSaC1kzf+K5pO+NDW+0OwECe+4bRajn0qhtMW5Osm
         Zu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nl8+CRYT4AqYzj6TfeAkgV0uZq+82OmQ6U8LucFBjLc=;
        fh=HOTqy0rj8GL6RgFtL3KG0wY3neRlJjmhx9Tchce3/NE=;
        b=SpGLDEToW9T/4fUdo96aitJVSfKOQTLteVF2sKZBNL1IwQPuF51AJKFOWKpjcU/0xC
         1Oc/cWlL1KCSMDumEIatgEx+eC2UzSuUK8jHYVcUPaQZiVmvb285SpDySQouI3a/mRMg
         m6Stsgcz1IEGmPzFKIxGt3F1It+nrXdRRdqKmyK+NEqpymNFKjw76eVw0gPmwlia/L/x
         QajqcUvqMZYO43+Y3Q6bfLECCdpKqRUkjz76rIDrucB6GcmHhbefNe+0a9VWUqqyEoTo
         rR7rCyYu6ky0TQS9vulCvlppHCM+k4ycIob9zXUZEahKCtfemJkda3Dzr7OTtH/8PIvI
         VloQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773740374; x=1774345174; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nl8+CRYT4AqYzj6TfeAkgV0uZq+82OmQ6U8LucFBjLc=;
        b=jSDiNi/tistPIJVDwYI0LzeF2POHtjbzMyzUESVi+msvJOGX/YHKVSOA4+zkZSEf3Y
         pEqtoHVxhQAU7k8CN4R1ywLu73EnT1WA5NIK4xC6vfSlgIB/2zO2E1zE3U9bnFCl2zRA
         KCAEcpSUvEcEa1AvJi/mUJ+sQ8/ak8JOuqdZ9F6dxNQrx1MgHeSqwtFupgF+zvHMx2mi
         gEVBl/k0Gjg7c2BjLHV5u6XT242RG66mUs5gh6jz8IryNslZS18JqFS38W4QkzC4+zPE
         om1oHiFU8pFpD9RRA4BJmT+4M6hcvI+BQHreriIvb7NSp0aeYlkmLwF2AA9HUadqzEvJ
         0C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773740374; x=1774345174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nl8+CRYT4AqYzj6TfeAkgV0uZq+82OmQ6U8LucFBjLc=;
        b=RgRe4abOc/WEtzowsjFnuEQiNPpKn31EujXMt4J56vJ5X9n/YlZ4UayYr+gwH3hZ7O
         qAIQ4mVe7w/srqcQ0SP4hLl6nhmcHg6PXrZ724biZgPrAWnzOmjOeeGX1SwrkzAoAazR
         pti7Phidvh9aTxiB9rLdBQL91BSDv2FkP+XS0hzReIhnpC4eBzvubTPBzFKcIxJGGz/F
         pwmio7x8mC5WLK+iY1ujK7q2dcsGme4jeSoaBpXXZEGNx1i06eZd59cjkdjen2flAzdB
         ScXMHiW5uQ0FRwhbQX05bO+2FD6S5fRDrG2PTHKt4VlTwtyXod2Ztl6EIsVuW3pxfPxM
         1uhg==
X-Forwarded-Encrypted: i=1; AJvYcCXjyeoYwZRN3iTQCGknFeQwFciwmZMQbriOkI/Gb2DJyVzGa+XX9IYZQSlsEqOUTQ6bEK8GQxTQAkSx6/4e13FV@lists.infradead.org
X-Gm-Message-State: AOJu0YwcSYBpkaXSwnQfIxeSBKpGIPyNvDJQStivcHQYjxAiGdp718E+
	O5cG1Rd1jl+KVhLU9BFZMBMKAOW1bKHnymc0iPZSnreINNF1PhA09n2nuxN2eJ6q04PdOA4fFGf
	lXR4c/E9oWjadks9NDlZlnSc9J7F7FCaN6KAbYZHn
X-Gm-Gg: ATEYQzzVWElEZabYsSYWVXLq/7tBhY13yWddrpGaihOXo7/sYedsdcDAqflK7NTNb3R
	Tr/Vln/xVpkC273VmIw0NeulZclhO1Zyl90zy15slZ5RipaoN6+HPHosjj3dlj4SI3mR3tDCO+R
	dDZMSVqTjKPkP7Rm1L7dsZe/YAY2s3DPlPn9WK8Xh9hm214UmNLo5S0jr3+vRZX1i+AN1pf59p6
	EUX66KDiaZMDihCq+uXJmEEqlhhoUbpao7Ph73Wgh02YBwzASImaOl7kwTiyo321OYH3OL8HPvn
	+lFkxbnWl8aM0VB72ug/3KpaVp3xxuLnsaps7eKXYAXtNYw=
X-Received: by 2002:a05:622a:4c9:b0:507:35b2:6b9 with SMTP id
 d75a77b69052e-5099ae2ae24mr10556781cf.7.1773740373177; Tue, 17 Mar 2026
 02:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-3-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-3-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 09:38:55 +0000
X-Gm-Features: AaiRm50ulOtZPjDdImqlxYz51RCxyAEIHQJXJIULb8YzYDGnqaOlaLRa9XRiilY
Message-ID: <CA+EHjTwC_TNj9Ggb7P3z+EwJ0cp6eS=NCx0NqDa1=E4FWP50ow@mail.gmail.com>
Subject: Re: [PATCH 02/17] KVM: arm64: Make fault_ipa immutable
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_023935_090779_F4083E30 
X-CRM114-Status: GOOD (  26.88  )
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
> Updating fault_ipa is conceptually annoying, as it changes something
> that is a property of the fault itself.
>
> Stop doing so and instead use fault->gfn as the sole piece of state
> that can be used to represent the faulting IPA.
>
> At the same time, introduce get_canonical_gfn() for the couple of case
> we're we are concerned with the memslot-related IPA and not the faulting
> one.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index fe8f8057cf412..ab8a269d4366d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1400,10 +1400,10 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
>   */
>  static long
>  transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
> -                           unsigned long hva, kvm_pfn_t *pfnp,
> -                           phys_addr_t *ipap)
> +                           unsigned long hva, kvm_pfn_t *pfnp, gfn_t *gfnp)
>  {
>         kvm_pfn_t pfn = *pfnp;
> +       gfn_t gfn = *gfnp;
>
>         /*
>          * Make sure the adjustment is done only for THP pages. Also make
> @@ -1419,7 +1419,8 @@ transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
>                 if (sz < PMD_SIZE)
>                         return PAGE_SIZE;
>
> -               *ipap &= PMD_MASK;
> +               gfn &= ~(PTRS_PER_PMD - 1);
> +               *gfnp = gfn;
>                 pfn &= ~(PTRS_PER_PMD - 1);
>                 *pfnp = pfn;
>
> @@ -1735,7 +1736,6 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  {
>         struct vm_area_struct *vma;
>         struct kvm *kvm = fault->vcpu->kvm;
> -       phys_addr_t ipa;
>
>         mmap_read_lock(current->mm);
>         vma = vma_lookup(current->mm, fault->hva);
> @@ -1753,9 +1753,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>          * mapping size to ensure we find the right PFN and lay down the
>          * mapping in the right place.
>          */
> -       fault->fault_ipa = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize);
> -       ipa = fault->nested ? kvm_s2_trans_output(fault->nested) : fault->fault_ipa;
> -       fault->gfn = ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
> +       fault->gfn = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize) >> PAGE_SHIFT;
>
>         fault->mte_allowed = kvm_vma_mte_allowed(vma);
>
> @@ -1777,6 +1775,17 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>         return 0;
>  }
>
> +static gfn_t get_canonical_gfn(struct kvm_s2_fault *fault)
> +{
> +       phys_addr_t ipa;
> +
> +       if (!fault->nested)
> +               return fault->gfn;
> +
> +       ipa = kvm_s2_trans_output(fault->nested);
> +       return ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
> +}
> +
>  static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>  {
>         int ret;
> @@ -1785,7 +1794,7 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>         if (ret)
>                 return ret;
>
> -       fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
> +       fault->pfn = __kvm_faultin_pfn(fault->memslot, get_canonical_gfn(fault),
>                                        fault->write_fault ? FOLL_WRITE : 0,
>                                        &fault->writable, &fault->page);
>         if (unlikely(is_error_noslot_pfn(fault->pfn))) {
> @@ -1885,6 +1894,11 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
>         return 0;
>  }
>
> +static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
> +{
> +       return gfn_to_gpa(fault->gfn);
> +}
> +
>  static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  {
>         struct kvm *kvm = fault->vcpu->kvm;
> @@ -1909,7 +1923,7 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>                 } else {
>                         fault->vma_pagesize = transparent_hugepage_adjust(kvm, fault->memslot,
>                                                                           fault->hva, &fault->pfn,
> -                                                                         &fault->fault_ipa);
> +                                                                         &fault->gfn);
>
>                         if (fault->vma_pagesize < 0) {
>                                 ret = fault->vma_pagesize;
> @@ -1932,10 +1946,10 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>                  * PTE, which will be preserved.
>                  */
>                 fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
> -               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault->fault_ipa,
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, get_ipa(fault),
>                                                                  fault->prot, flags);
>         } else {
> -               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault->fault_ipa, fault->vma_pagesize,
> +               ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, get_ipa(fault), fault->vma_pagesize,
>                                                          __pfn_to_phys(fault->pfn), fault->prot,
>                                                          memcache, flags);
>         }
> @@ -1946,7 +1960,7 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>
>         /* Mark the fault->page dirty only if the fault is handled successfully */
>         if (fault->writable && !ret)
> -               mark_page_dirty_in_slot(kvm, fault->memslot, fault->gfn);
> +               mark_page_dirty_in_slot(kvm, fault->memslot, get_canonical_gfn(fault));
>
>         if (ret != -EAGAIN)
>                 return ret;
> --
> 2.47.3
>

