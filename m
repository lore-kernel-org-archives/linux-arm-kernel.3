Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BAAF3381F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf/9giwzKIydxXGiboXiv6gCzPB39R05aoyKnuoj2ko=; b=4J2Y/BpKTGhQCxgh9Y15ebV9RR
	FbJwK35jar9DBEWL1vBTP4s1dvDuxL1kss4jZBEJjsrBNzUjzlPbJFcdSWeJEJUhWeVpWbAF9/iev
	hYWB1XhCTxH5wsX6rNbGA+2s1YNuv0nn9qiHQEseB0ogDIqFQoP+3EM9cDBd4VrFcNMW9l2txjh6g
	xkKCr7kII+t4udcjsmAal39/PW1cHoSlzICameSrT2onSa2EmC8FdS8HYO150SVbQNT/PMNyjG59E
	9xuSdK9mj19Mxjke+wuAI5EusMkL035299VS+oqlDcN4mug0SknwBgj8TBwVBMoKkjHGG8pegPgmP
	SkmUOOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qdc-00000005rXO-3kcl;
	Tue, 17 Mar 2026 09:22:56 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QdU-00000005rVi-3kOa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:22:50 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-509069a7a7fso447651cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 02:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773739367; cv=none;
        d=google.com; s=arc-20240605;
        b=HV4ZKXDWraf/fPjHBZ4vXviAdh+fCiphjWV2Oakto/DfqqV1aBUKLzFCvaitafjUOY
         8+6XgI1DXfX4Cyx6LFqqRjajNkq6XP71WtoN3wXAwmK0MIVttwxoIIP+mUFc+ZsxRs4p
         qPaE2X2tFGrM7hsQcCXfI4JXqTCdauZf4bTWnja2HOsYHczvtPTJo90ibeZeJnusmst0
         IjdCTLLg4dDZ4tx8SiKrLfLTgfYqvgIkb5ocG+XOYalRhpaqENk2diOIOyFvtFqDvrVK
         DIuIweWJk5oqq1Okmfg+v7Ey+c1aH4Dkf/sgJxH3bZMDEgZycQkoHNA31ZTgAGpDUJz3
         +c3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mf/9giwzKIydxXGiboXiv6gCzPB39R05aoyKnuoj2ko=;
        fh=94fwNBaVgJKzhGm+7HqVqTeaI4TnZbmW6mqLUD/jxlo=;
        b=SWk4q9Y669rmiu/g8jRbR8DC/Y3SR3M3aPJHxOFXiKN+UyeP+UrhW/E90W5cUqUEgc
         OptTzMGm+7vU0UWmMF1DnPWL2wB5KZLyd/dKpEklP9WN54DVFfY6+AHp7xnadHdoSMlP
         sEDdfiV1fC7LOEI1dpYV5yFSFrLzil2xYr+aWjQnEhID/DdgkbDF61heASqQaqmxYt8C
         mZmY6Aiqr/5F9uqzjh0C4/3F4OmJMBu+4uMiyZDd+85m+ktqiHPRbHdMIv2NnQOR3kVB
         tS0PUw+57Md+GdPlYLZOxYdxRVwC1ctnPHPfSaiUAd7aX8iBLPCMhYYpwsvHU+FU2lIa
         cj0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773739367; x=1774344167; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf/9giwzKIydxXGiboXiv6gCzPB39R05aoyKnuoj2ko=;
        b=M/mDbpoDuRntsg2GkBVnUtFe3yeyNL73P7uxSk/TdOKMW6zitw4Mhq4XgndcdhIzmM
         d9m7Fk8ylvx+4H7FcsmNjptsW7hs/CKnJDeb9p+Eh4Dqu5LmqvExEw3bbY+G2DpNqo5f
         inBlyGy1PW/c51fGp6wSFYwiwQ/b7EzeNatp1s9hYFir/eqRuN0acrurZfswY+hC9XWc
         Fz6pYLVgUrRb9nm96Eomlux1SIFew5csj3LyHWnC+PW5vdLZ/cd7ZxIEWtPfjncEsLOp
         T1jk0Iv/iBHrLgI0PF4uTStUzDeYJ4om7BkvDnheZ7rYjaizBKeecZG5X/w91Wb7pdjn
         1GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739367; x=1774344167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf/9giwzKIydxXGiboXiv6gCzPB39R05aoyKnuoj2ko=;
        b=RXwDNED9i2T2pBvfpfJeJolAVeyKuSojD/f2m0Pxq62trJm5iXf+ylzAbFbVXAthQT
         SWmJm4Q5mPlwhlMjdo6RMheB/oifOb2Mi2InMq+es2/vl/tLV6aNQAJfELNL0jrmjBLj
         DPcyHyHiLuuvu07eGGGgRwrDPrRPPrKWm7EQb9G5TbO0uoZXBHj4HiKKKoUGI1Z6S6o7
         RDZ5FNG0fZRpozAA4ivtRnXECSo8oWRoJgDUAV9rjmeDDy6eXCbI1mLei8cg8mtFMzHC
         r2OmNfQM7aRomWDFKJ/rmO/KDYRXgCAa4Cl98320LtYzlfZJ5gxfVG5WkSpBDt6v/r5v
         K29w==
X-Forwarded-Encrypted: i=1; AJvYcCVMYAiXmJtL8lee7P3Ltlg89xcVo0/TWKIfDkXyCk4l/yaVu4oeMfFeKy24sTLgg8y/2fsVwICX5rPEGBmktlsO@lists.infradead.org
X-Gm-Message-State: AOJu0YzN2AMsmmQAesGLmkRzCPbJcfxw3070MWXOga2HkBSNlKMIb3W/
	t5P5nYwCIqq/eLeXe2KrLLmw2kHZN5AL5LOf3soYC0QLePR2zD87APQUQRrx4Y+V2n5S3FkU8rJ
	26q9qogv/EcLlv7B/QwWEM8x35vuXJlw0/T31q6R3
X-Gm-Gg: ATEYQzx4PwnrGzWAqQd1TAmLA1SzdQbOKED45uxSbU/0ngDjEfJVha74i99ZaikX8tq
	7pyEzHK16jFO0AeBpcvA9AQN3K4ZVy5SUBD4HzqOZIDNeyy4G6VbCSjz25YdKBuRl9+m2iy0Ii0
	iqHI/brxnu8uoWXCROM/Mz4A5tUlcnwecxBbSTn/8/R8llp/jxsBGcshSSKUf4xUQK9Rdei3C1o
	YiX80XFZK+X5tdj/iL7Q1ElkdNdg0YIigxWfl6GgyFb/Q2XlDOK4WH8FWHXerU5GtB0IE/EbLUZ
	dRJ5LwcbpGtk9OZgFI7+4KymKfZXdmEiKWeo
X-Received: by 2002:a05:622a:1987:b0:509:1c2c:866 with SMTP id
 d75a77b69052e-5099ae2a4ccmr10103971cf.11.1773739367111; Tue, 17 Mar 2026
 02:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-2-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 09:22:09 +0000
X-Gm-Features: AaiRm520Hrh5Ypw764LiCNNkyKgzWy3z6aTOtfYZcmCicvIDTF_qmCHiaIPTc1s
Message-ID: <CA+EHjTwqQ_0Tj8jq8hDnhJTT18abrkL5OqJukpZr24vNk5Zo1A@mail.gmail.com>
Subject: Re: [PATCH 01/17] KVM: arm64: Kill fault->ipa
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_022248_942241_4941CDDC 
X-CRM114-Status: GOOD (  21.15  )
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
> fault->ipa, in a nested contest, represents the output of the guest's
> S2 translation for the fault->fault_ipa input, and is equal to
> fault->fault_ipa otherwise,
>
> Given that this is readily available from kvm_s2_trans_output(),
> drop fault->ipa and directly compute fault->gfn instead, which
> is really what we want.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 5542a50dc8a65..fe8f8057cf412 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1643,7 +1643,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>                                      unsigned long hva,
>                                      struct kvm_memory_slot *memslot,
>                                      struct kvm_s2_trans *nested,
> -                                    bool *force_pte, phys_addr_t *ipa)
> +                                    bool *force_pte)
>  {
>         short vma_shift;
>
> @@ -1681,8 +1681,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
>
>                 max_map_size = *force_pte ? PAGE_SIZE : PUD_SIZE;
>
> -               *ipa = kvm_s2_trans_output(nested);
> -
>                 /*
>                  * If we're about to create a shadow stage 2 entry, then we
>                  * can only create a block mapping if the guest stage 2 page
> @@ -1722,7 +1720,6 @@ struct kvm_s2_fault {
>         bool is_vma_cacheable;
>         bool s2_force_noncacheable;
>         unsigned long mmu_seq;
> -       phys_addr_t ipa;
>         gfn_t gfn;
>         kvm_pfn_t pfn;
>         bool logging_active;
> @@ -1738,6 +1735,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  {
>         struct vm_area_struct *vma;
>         struct kvm *kvm = fault->vcpu->kvm;
> +       phys_addr_t ipa;
>
>         mmap_read_lock(current->mm);
>         vma = vma_lookup(current->mm, fault->hva);
> @@ -1748,8 +1746,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>         }
>
>         fault->vma_pagesize = 1UL << kvm_s2_resolve_vma_size(vma, fault->hva, fault->memslot,
> -                                                            fault->nested, &fault->force_pte,
> -                                                            &fault->ipa);
> +                                                            fault->nested, &fault->force_pte);
>
>         /*
>          * Both the canonical IPA and fault IPA must be aligned to the
> @@ -1757,9 +1754,9 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>          * mapping in the right place.
>          */
>         fault->fault_ipa = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize);
> -       fault->ipa = ALIGN_DOWN(fault->ipa, fault->vma_pagesize);
> +       ipa = fault->nested ? kvm_s2_trans_output(fault->nested) : fault->fault_ipa;
> +       fault->gfn = ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
>
> -       fault->gfn = fault->ipa >> PAGE_SHIFT;
>         fault->mte_allowed = kvm_vma_mte_allowed(vma);
>
>         fault->vm_flags = vma->vm_flags;
> @@ -1970,7 +1967,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>                 .memslot = memslot,
>                 .hva = hva,
>                 .fault_is_perm = fault_is_perm,
> -               .ipa = fault_ipa,
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
>                 .prot = KVM_PGTABLE_PROT_R,
> --
> 2.47.3
>

