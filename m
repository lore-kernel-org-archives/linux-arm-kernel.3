Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C99CEFD01
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 19:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9+aHBxxyMm5uEUryvCGnluoRKqqLv7iqR1X9acm+vo=; b=mzyAbUtZ+9LH19sCCLwRBdtLCi
	gEyeAOzp1ZKFcaz1ND9IWSrwOS5h8vF2xATUpfFTOJNSvaeTWnvZUiMNZkEIpB9o/nYSND17Pd8eN
	QeR7vNsMTisPJVY35l42CKSpd4m30YReHUkzzUYM/xiGK7mAGrP5+aeih+OExQlvTK4yR0420SRVK
	4RcOqMwQNQveFGwpvXrkzBg0oVRS8jAPzAKd0u3/gW4C8wh7AwU4h3prH9NZE4/61zFMpbigmvEsc
	w7s8v88VWLA0xMZ22WIscBNVYzn1cZWtrNDffflJd6tXDfdv4Cyx4uySdv/KU8PRVu70WcTXfVQR/
	vte6ofGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdD3e-0000000DmXF-3eRa;
	Tue, 06 Jan 2026 19:49:36 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdD3b-0000000DmWY-00uk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 19:49:33 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4ee147baf7bso59761cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 11:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767728970; cv=none;
        d=google.com; s=arc-20240605;
        b=BFansM00aVX43wEslY6J7ztkFePQ9JGnWB9uFxV3nUy6xFIVHLdseFdntRzp7fbyTY
         7WR0/8qMbT18NXY+347/LZrA9lW9E/RivBEaa1kNPYD1e9z5Waei/5BNyCKwu5kVaMMl
         YM9t3jKiRsPAvZX/vqhJ8rJHejsmW5aOK5w4Fm8zU8Tg8fbBwMMG1GQUq/0ckihZFWdh
         FNkdJfLRA7muYsccNfc1HSFsJRSMyWP8dY0N0G46oq61P0U8vHvD35goRGw87i81fq79
         cxtCiHJRAxDCg4nygkXz+9QW5NWEriPVJDHgXFU2+RkYdLzR4qyq3TpXh2Uc5SSY9D53
         o4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k9+aHBxxyMm5uEUryvCGnluoRKqqLv7iqR1X9acm+vo=;
        fh=NbA46iS/EHS4TcQi4JPJ9d0nifLFuG9T19k5dMMEDh8=;
        b=DNFDGmv73adZxSHZPi7n0/N0RfRvAKtBIImCvRg8kI3zJOpvoOufKMlECt05hh0R2a
         Ava50jB8rZ9twnyn5jQM3i1RtgULJHzaYCccv4A3hNad0qnLiSDcCC5HZGvdJhgJ3Aqa
         Ko7tt5DqxwuOLVVn8vQqCUC18GgulfyEn4PUuJOAWBBdP6mDw/NXnDTh2S4JBfQd7YXc
         CovxbYIFrG0LdD4IsLIsyIBl4xsB8+Psa7dVxN45NsYVafSGm9MiKxsSDOxj+b75Jz6p
         ojvHy4dWI02MtExxuvcvaVuel3GJeHdAVagyX7FY0J9zav0dqibLyqMJbrb+vI4XZqPj
         jICQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767728970; x=1768333770; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k9+aHBxxyMm5uEUryvCGnluoRKqqLv7iqR1X9acm+vo=;
        b=jjYL9sJlUVfeoEtERe7dcJA1n7L9Dgd3U+fZNXzBPyuop/sEeJHTzI5iunuPXP6lHs
         pNnxEcfHeklmtMmgENks/SkzBW4gRhEbt1bH4jEoXVXvuFeWuGyc7gV2GLo30iNZmKar
         bcSeF55kk3CoT2I83QKm7NASN4/9uKWhij6U6Nl0QYQu3eGeasl5b0FqaYVw9Q/Y4Wxu
         CdwkGfQ5yI+YWdWYJ2ZzkiVL53DKTIAEI/4jz2y+1pSvvShSwSqv6CdCElaXPH1zARaq
         m7xNEL+PJ0pqP5fWQIdfiaPGANussvWfDUs0U+SYq5x9N/lRwREBJZ0manCLebF8DsaZ
         Wyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728970; x=1768333770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9+aHBxxyMm5uEUryvCGnluoRKqqLv7iqR1X9acm+vo=;
        b=qHvZFSCuT8147Y5DabQ70z/KU37zt/mk4a0mFobkvw0/WQus9p4xp2v4XKzHpCrwCh
         Fqnfn46f3sDiBpc0JfynSObCheXIVlmAqZaL70bHiC8wWD6TLYlXyvYYB2+QXGjhB7nS
         nvH/19J8ngGkvxTOtWHe7xF8TPKwwOVfEe1Kkyd6T0Kv4QXV3RPQZeKzPg/jjHXSIS0a
         HfQcpOVl6+8DNnYh1DIlqsX5/youWAp1euKEIPEW2uQloZlZQkJMBrtfxj4+TVToaF63
         skdh0DALMzMUihZLeTWLPZtEBZICf46QwVAiWhB8V3T/oyrkjZXy0jpKfZOeKSudoGym
         eTrw==
X-Forwarded-Encrypted: i=1; AJvYcCVkVn/rsVhpUNQeNkvt7Il7H8NMsGn9l1/WGLHCbNpmdE9TcDCDNzO4KsvLND8jJjMT/S3iQdvXUmV/gQFa3Rj2@lists.infradead.org
X-Gm-Message-State: AOJu0YwB096HYtyElhfDFEUM5SRS16VxFks9vYbZrrpWdYZ5WE6cieK9
	OQGMte1sVdNvMTXVjuafhtRQGbv0PLrBH1pHmbx0VrI/Ay9SoxoIleZQmIHL4e5o9iar+4PGInx
	iCAIRQaLDwRsK4Z1I/XTYfj0gALs1W+AmdwmwhLqN
X-Gm-Gg: AY/fxX6P1C+/Tyy677MpLGcm+IhLv5sdByMzHJN23vZVRXwrNgvROq8IWYXbpoHuO1g
	Y3lngawCtNT/yzbss9CP3YyD+MJxHaQqKNvsVPmwOMAkQBA6BNoIg0U+3WenKg8+MlwTZcsVCew
	pPovvJ0EuDpxqQCy11tFH31vm3zan6LzfV0fC16Gn/JLzjk5dqUddxBNI4fYEORKbmsdwhMyGbI
	eEvT4EBAz7CGrKkxQkNb7tVht18PJS1r+PtG/b6uMHJTjLwVKJMYdlI2E/Tt1iA0SAuBqPI
X-Received: by 2002:ac8:58d3:0:b0:4ff:a98b:c33e with SMTP id
 d75a77b69052e-4ffb3c9bfd7mr1612321cf.6.1767728969218; Tue, 06 Jan 2026
 11:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com> <20260106092425.1529428-5-tabba@google.com>
 <aV1mqQtALFIUBHVM@google.com>
In-Reply-To: <aV1mqQtALFIUBHVM@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 6 Jan 2026 19:48:52 +0000
X-Gm-Features: AQt7F2oD6imhUH1-IKtVcA97OhzMLb8nSqzV2q_rb-md0NTxT87GehM6m6PIMYQ
Message-ID: <CA+EHjTw3YBG9HNateXEAYsSUJ625eWGu2OHt-2=Y0=-qzbObWw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] KVM: selftests: Move page_align() to shared header
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_114931_934311_E05831FB 
X-CRM114-Status: GOOD (  19.44  )
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

On Tue, 6 Jan 2026 at 19:46, Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Jan 06, 2026, Fuad Tabba wrote:
> > To avoid code duplication, move page_align() to the shared `kvm_util.h`
> > header file.
> >
> > No functional change intended.
> >
> > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  tools/testing/selftests/kvm/include/kvm_util.h    | 5 +++++
> >  tools/testing/selftests/kvm/lib/arm64/processor.c | 5 -----
> >  tools/testing/selftests/kvm/lib/riscv/processor.c | 5 -----
> >  3 files changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> > index 81f4355ff28a..dabbe4c3b93f 100644
> > --- a/tools/testing/selftests/kvm/include/kvm_util.h
> > +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> > @@ -1258,6 +1258,11 @@ static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
> >       return __vm_enable_cap(vm, KVM_CAP_VM_DISABLE_NX_HUGE_PAGES, 0);
> >  }
> >
> > +static inline uint64_t page_align(struct kvm_vm *vm, uint64_t v)
>
> Maybe vm_page_align()?  So that it's a bit more obvious when reading call sites
> that the alignment is done with respect to the guest's "base" page size, not the
> host's page size.

Yes, that's clearer. I'll fix this.

Thanks,
/fuad

> > +{
> > +     return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> > +}
> > +
> >  /*
> >   * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
> >   * to allow for arch-specific setup that is common to all tests, e.g. computing
> > diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> > index 607a4e462984..143632917766 100644
> > --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> > @@ -21,11 +21,6 @@
> >
> >  static vm_vaddr_t exception_handlers;
> >
> > -static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
> > -{
> > -     return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> > -}
> > -
> >  static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
> >  {
> >       unsigned int shift = (vm->pgtable_levels - 1) * (vm->page_shift - 3) + vm->page_shift;
> > diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > index d5e8747b5e69..f8ff4bf938d9 100644
> > --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> > @@ -26,11 +26,6 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
> >       return !ret && !!value;
> >  }
> >
> > -static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
> > -{
> > -     return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> > -}
> > -
> >  static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
> >  {
> >       return ((entry & PGTBL_PTE_ADDR_MASK) >> PGTBL_PTE_ADDR_SHIFT) <<
> > --
> > 2.52.0.351.gbe84eed79e-goog
> >

