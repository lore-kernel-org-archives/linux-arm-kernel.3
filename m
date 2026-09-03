Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C32C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59Wj+J6S9wt/dcmTRFnqS+5MGklja5S5ehnxj0FnuDo=; b=NrM+9fQV0HGfZYaI7JbA8BGWiL
	l6j4ZEwyx/POCb+0z1SRwJLpvb1ObDyshXptNUG0emanXGbfv/Lcy6MwJ5hASdCL0pIwkn0qTKfdX
	8Eb5tRyLIZ2jUnogQ9j56oP1+6SRiPjzcxyvoNgLdMv2No4/Vv/e5SAdu3XOvhVWz2jB66PcMMTuw
	akWIovUb+eP5jqEjmkqxN58Ao0+lN5zTWxubnKI6Jhu4leiN3/JVXrpGd8pATsogpOfSTh241ohDs
	iedXlcP1RBK83v5kxsCsk4cFaeIucHPO2HSL6n0M+R/iURTagja7feVRXMPSgenl0oAwsorhMI5Sh
	OpcKL88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26tL-0000000HLmE-2PUt;
	Thu, 03 Sep 2026 12:50:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26tJ-0000000HLlF-0q5u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:50:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-499b10c86edso913865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:50:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788439803; cv=none;
        d=google.com; s=arc-20260327;
        b=TtyLTKdLvRh6SRlfSfBWjqNQtFKZCQBb3yL8w7pbnXcEsjrmFXMAUTyTLgrhWPb5IB
         WudEQ1rAq9HH8LRWB4kr+yplcDLNi8mWLQDOQNKBcIf/aFor/qHf1n5HvPQpva9rG4eU
         c3oyFXCzx7WaKIXdWrVwZdIrd7985rbB/WbDwm+2FNRs0II9Hyf3VD2xn5f0rBVf21X3
         bNmCEwnfhCVPWN7AF8yxfRIYRWhz1yq1w1poodoX7tlvz/6h24GMc0CF4vjxd6ey5ws0
         FBlT6eTgJbeSp0pCn1omV090P1T/bVuPAPe06F0Z+2TPmho43asaP4y7Zkb6+PALJmSP
         upMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59Wj+J6S9wt/dcmTRFnqS+5MGklja5S5ehnxj0FnuDo=;
        fh=fhzBzoEkB2ZbA+C7BlhEGrzwugZyC6s79wzTs+CtStA=;
        b=LJfzSGv2vOS/EzLXKk0rND50LTqhdhvByfUGQtLXO5wbfeT3S69dJkLFQ+ZIGxcB0T
         lo3uH+kxHEHxee1Nn4whYoSQPk+pw9hz4ni2m9oXGxxTbnu4nE51RvqAIOvQZXjq43CZ
         NdDDnzvw7cRqK43zXY6SOM0Fi8qTxUh1/mOKaYnUeOJmDj9rUh939daUQPoPAQg0of+/
         2c8yLFZDIj8nAO6FQ3V5c57LyaTtcH0vVpbrog29aBxgjjNtskm8bycFgHRhLYOlLRNr
         SV0z6eahkLthDXOYEvN/nyEnOAKyN32FubgIMkPJaq/u8wKlj9FO72HLVPb6vwb1VlDv
         ot6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788439803; x=1789044603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59Wj+J6S9wt/dcmTRFnqS+5MGklja5S5ehnxj0FnuDo=;
        b=gHGN519x3ed+DIpr2w2olFPAmrVMU7BuYizOkp4z1rYvKjb3mifdpDwwwBXHMg7aFa
         BWYyUjHK6Y5xDX8LJK0sucE99Db2wdkn8kV0LEUTTR8JrfV6IQTLJkulCVPCWmq+fExz
         dsuv+y+yMX5XXkuLDMUtuc13D+O7WSoUkMXBq8fwr8xrETlgkqXpero09BPodtpE0Ucw
         7oT8BKyPPyJ+2ry4/xuGWp0fIxEO9LmQmpMN7Ukk94uEWhaqRtDBwtdkr+02uDdrrQvC
         JNAXSQF75FMWiFIer6HLdfZPcNpx9aOSdoNbsFlAMmfYdW5UwqBPn/LvNSDltI1lPxYA
         hPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439803; x=1789044603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59Wj+J6S9wt/dcmTRFnqS+5MGklja5S5ehnxj0FnuDo=;
        b=fqMy8u7IGlD+XrcQsvX2zHn34S5lvQKuynoTap8ImYSnXBsRlc/Du5hgBiZxuBbZom
         kHt9GI/Aptqu/dQSkb4ZIwrMz/mPDTApn9aceO33aMm/TjcvxhUEbDSKZhlM8pgnBlge
         ePJCjAVJvtz22zLlERkMwuFvWbBGqWVWJpi6IrBY8miZxJOZt4fAeqfvkdOsdGTh1Aw8
         r9ArvZTqMVVKK6a6wXOjXYi4rpYNP57g1/JU+b/+KeVkXcrZqby7sMeYLK5no1b0j4N2
         rk2GNb8HVVnShjDZbxrjBuFfj0gBwZvMJgvTwgAPqnmOCU6JqurxK7Aq3f09uDSP6lst
         bwLA==
X-Forwarded-Encrypted: i=1; AKwUvBwcCEjhcINg9hFifw6i0ddqwk5GcqpM3KfKsjmf3/zBHhPPUyUU77UFH9KEqB3vsVxemAjhd/PO5zfMpuOmV7hO@lists.infradead.org
X-Gm-Message-State: AFuF++nQvuHFTgzzMSdukpmZuVn09gNHLuS6/atl4IMd80gX7Bpsctqa
	9q2rvG/BcTdcOBsJ/OqvrK15SiMxe/00yQz2v0RyV2IEtZyRGNhKW1ziVUvrLj/G5vwG4laMRb2
	hMWexcwydq1gSygs6fvwGxazMLVuPi7c=
X-Gm-Gg: AYBFou2kEl28TBU0ZtbIqUbZSYbXUXKOngCpmS0tfxVEMo6iUgIJXY0Gs3JOqO+6kbx
	I0HRjWsjTbxnq36yC7/ynXZME0D6InX7Y9fA9BjI3/9PhKAt0SDFiGFIjVsk8NjofZ/98PYDFyO
	v79flJoCbwnIXXFPdy/y768ocYZmuee1R9tD8YexvaJ3qy6REIuSJUaYHKtrs8j8oBFu6A8ICmf
	LGh1Q/Vpc9ZR1lKppgfQaoqFD7i5dYdXhlRKjVicLwYR6XmjhTgUC6xK2Y0OW6aM7Hqlf8yCUYR
	gZjkNRVseFw6WOAJIEsP5GafhovgoA4LAk9q1xWqY7kl0euAS8pe8wH2yQy6oeHtwRBo7+HWSD9
	/s0fekkD3/bww4iuA6bdMNg14469+
X-Received: by 2002:a05:600c:530c:b0:499:cef6:104c with SMTP id
 5b1f17b1804b1-49ce58369f4mr98184805e9.1.1788439802952; Thu, 03 Sep 2026
 05:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <apk8ZRr6do_YAlzf@kernel.org>
In-Reply-To: <apk8ZRr6do_YAlzf@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Thu, 3 Sep 2026 20:49:52 +0800
X-Gm-Features: AcwNN1UgFTYq7ea9-qGswA9Jf4fWjx8u_UTgGqrDxE_25OvzBaj7okOUxHJIdeg
Message-ID: <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_055005_269436_BC18FD22 
X-CRM114-Status: GOOD (  31.72  )
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

On Thu, Sep 3, 2026 at 5:22=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Tue, Sep 01, 2026 at 11:18:16PM +0800, Xueyuan Chen wrote:
> > The persistent huge zero folio is shared globally and should stay zero
> > after initialization. As Jann Horn pointed out [1], kernel bugs have
> > ended up writing to pages that were meant to be read-only, including in
> > security-sensitive cases. Making the folio read-only in the direct map
> > turns such writes into faults instead of silent zero-page corruption.
> >
> > Add a page-based helper consistent with the existing direct-map interfa=
ces.
> > Handle TLB invalidation in the architecture implementation; unsupported
> > architectures retain their current behavior.
> >
> > Protect the folio after initialization. Skip highmem folios, which have=
 no
> > permanent direct-map mapping.
> >
> > Inspired by Jann Horn's read-only zero page work [1] and follow-up
> > discussion [3] with Yang Shi.
> >
> > Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@=
google.com [1]
> > Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@ke=
rnel.org [2]
> > Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=3DjDx9E6dL=
OULohnhBguvi9A@mail.gmail.com [3]
> >
> > Suggested-by: David Hildenbrand <david@kernel.org>
> > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  include/linux/set_memory.h | 17 +++++++++++++++++
> >  mm/huge_memory.c           | 13 ++++++++++---
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> > index 3fe293cfed8c..ed9ce04b18a1 100644
> > --- a/include/linux/set_memory.h
> > +++ b/include/linux/set_memory.h
> > @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> >  #endif
> >  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >
> > +#ifndef set_direct_map_ro
> > +/**
> > + * set_direct_map_ro - make a direct-map range read-only
> > + * @page: first page in the direct-map range
> > + * @nr: number of pages in the range
> > + *
> > + * Make the direct-map range starting at @page read-only and invalidat=
e stale
> > + * writable translations before returning.
> > + *
> > + * Return: 0 on success, or a negative error code on failure.
> > + */
> > +static inline int set_direct_map_ro(struct page *page, unsigned int nr=
)
> > +{
> > +     return 0;
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_X86_64
> >  int set_mce_nospec(unsigned long pfn);
> >  int clear_mce_nospec(unsigned long pfn);
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 54494c3fa983..742283b36d74 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -42,6 +42,7 @@
> >  #include <linux/pgalloc_tag.h>
> >  #include <linux/pagewalk.h>
> >  #include <linux/cleanup.h>
> > +#include <linux/set_memory.h>
> >
> >  #include <asm/tlb.h>
> >  #include "internal.h"
> > @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> >       huge_zero_folio =3D alloc_huge_zero_folio();
> >       if (!huge_zero_folio) {
> >               pr_warn("Allocating persistent huge zero folio failed\n")=
;
> > -     } else {
> > -             huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> > +             return 0;
> >       }
> > +
> > +     huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> > +
> > +     /* Highmem folios have no permanent direct-map mapping to protect=
. */
> > +     if (!folio_test_highmem(huge_zero_folio))
> > +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_P=
MD_NR);
>
> Sorry, I don't remember if it was discussed previously, but why can't we
> use the existing set_memory_ro() here?

Hi Mike,

We want to change the linear map here, but arm64 set_memory_ro() only
works on vmalloc addresses.
So a new helper is needed on arm64, and x86 implements the same
helper to keep the two architectures consistent. On x86 it is
basically set_memory_ro() minus the alias check.

Thanks,
Xueyuan

>
> > +
> >       return 0;
> >  }
> >
> > --
> > 2.47.3
> >
>
> --
> Sincerely yours,
> Mike.

