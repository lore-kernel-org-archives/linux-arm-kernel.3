Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748E2C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXrMG36LL80IPDG1moLhJVFD+uNkGq7OI7LXnw5lOsI=; b=U17E8WxDi3HOPLdA3hlXFteYTi
	yrU8PvayDCTfRyzK7QOA7VEeKvvQlI9m5rCM9r0DUSTDomNdbD4UUnugBuXoT9IWFkDkF5lgYoaEp
	Al8BaURsq5vjFUlPnSI9zg59n6xqezG1yfm0Tz4O63Tx+LT1E1LuiVxBEU5dsv5QB1zKj+vHgPV2v
	nxouZQ48iHrSkd25ddD8yUsgeluUFyJYRv4VH8HxxA5rKWYRlXe98NcNLTyrPNnveo2e1PYRAXQkQ
	xJPo31xAWu+VyK9/weiT6MZS2Aj4tNpkuVCwJVicp5ZYmqCx/vLIqKJ9fEuI9wchkGLRDPgXNTPEw
	Hp4kEEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YBI-0000000DVLU-3MnV;
	Thu, 10 Sep 2026 06:22:44 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YBG-0000000DVJa-00Pa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:22:43 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-499db17b40eso2863965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:22:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789021359; cv=none;
        d=google.com; s=arc-20260327;
        b=X/6nyOT1qMsjNbAFEA9ZqyDKPm/K5cJBv7TN10pCAcVqA1HD5WFE5i62PW5OD9AfLk
         7z7b6bMXqpJ2+4uik5SlaxoXdA6XRvvWHBuca4B+lMJXVda9cQY/TEQpCKfDZBVwqFGN
         OKX/KUVi7p53R50Bry3XfLbVB6iJScG3ShLim/jzvF3k6XMmpPbtYeV4uaLm8zxx9sVI
         nx++oyFcE4KnuM0O9yfB8WFHs5dfYvG862GRvc71JLyM+U1yYCjswHlJqUjkIpPYd5l9
         vGzcb7EFKTQY1lIfhTABQIuvg9u+9NSGmC/GmpRXd42d+w1QZ4Js4oSnKOIRLRKEXDbP
         62Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXrMG36LL80IPDG1moLhJVFD+uNkGq7OI7LXnw5lOsI=;
        fh=7hs9ptg7kIsl9GXFWW3mVtGfT+ylikp10CTnHnCMjPw=;
        b=KQyQ590i32kXlm2626Z0lqLETEylToKPhJEDCzj4X8Hh92QEfCzCbgrQXFKf1yRphE
         Zh91kQNJFOfNZon4G4F0A4vLGs2TKcLEAEBZCagrjB/TyUim1NJYY8hEQIybdJLE5iXw
         +JtBELcqW+nM5u98owvKUrCsNPg7OeMouc/rT130HOX1UsAtVqniNbgr9AIWXvQdbffx
         BENde5p7HlOdDWpmTDkqBb+iy4YcCYC69gW2mPDocbramZyqt3Zvfn8KzipGjJUUtQDZ
         gPmxc7aHwB/N/oGBuEZYueuPm3JGgahtLMMxrkOjHjHovAIBYBssL2E4cUtlnOGWmvMp
         +39Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789021359; x=1789626159; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXrMG36LL80IPDG1moLhJVFD+uNkGq7OI7LXnw5lOsI=;
        b=mqOLj0Mb93zxHDnrSOzfXAr6xHlDs7a5ygweWOmfYJuVW2TorOc9JoAHgKfVlzDfPN
         qVZ9XlDE9IP+wPqklWboWy2QV4YhoW/t1fgXPQkl9twBXy4doPzEQYRa0kxKrelguKD2
         psDzUk66JmI+NgnuSehI5vbl4G1Do+8NQbqW80YUFf+L8gzKvRdwwm/ontjspPwJz8MP
         n8xK/mg4AYVP/Etbl5rh2OkIwuWqsTWMqhkE3omcUfRrRzCWCoG1WCUot6W6G2WUPLv6
         6RrVcMZ/xEZkGH5Np0RMuCbFjNKPsnPJOPyK0/jk+lVjZX2IIQ9wfWpVr/fQGQHc4fJL
         c68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021359; x=1789626159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXrMG36LL80IPDG1moLhJVFD+uNkGq7OI7LXnw5lOsI=;
        b=BQKGQJgqa2Eoo8B1ir1t5FXV3EZp68kCnk65seMhqAGWG7eY5xS88+rIyvzO+91kds
         Y9EvLYeAGgfAXvfsLrkNJaV/vm7CZ0DVn1trkMZhxNfo0k/LhN9CqLWLy1Pwd5ZVviaF
         DLffMMq4LhELAxFElghluwefOQF1556KS3pqd+fVVHdeDX/0DXRNpfqameql/Xon1F+b
         7yZjGijtMBekbF9F6uLmPXsZizkdiAlJbEtfJx3zJkYLvDEmbVHnws7ARhI71OZKO53V
         Xblh6SVpv3sClnwxJslfkd1U0AQ02XO0s+Cv3jzdxNm8Xmgfh05Lmf46GHFEzyKIr3G9
         3uHg==
X-Forwarded-Encrypted: i=1; AKwUvBw8JZ0KZ2aXvOBtqVAi3qP1QiAf45KKUvbmDLfjzR14x/bHfdNN3qUWz6bZdReKPiYkYXUgKZqMkovo3jwb1eSX@lists.infradead.org
X-Gm-Message-State: AFuF++lk96hb7TBqiQLUWE/E8LzOd2HWJZZq/mPBCAhhSYkqbLajSs3H
	Ul+zuBOhMQBVu3J4Gg7o2zb9w8bXbCYGSoDX2aoTRjP/7ULTV/Kmm8Znlh93EzKR8wzXwXigMPf
	mbrDwj7dCPOkIzigkjvhfefre+BFvYS0=
X-Gm-Gg: AYBFou1X/MuZyhBYhA9C+j0wXTuoeNpyN9yOxYdkPbbSwAIAuwBD4L2AwA2MH93gHpN
	A/bfyIseGfOspuEMTPRkpu3cqbdaHI1fWAjkrjYds2jKLQRbLYm38/utqPUnRM+wXb5+RMYmiss
	mVorJdaPpLUkV3lsj+hs7rot7c67ljgAsnZl/gWxIV2CQvOWKTqAzMfcxDNUyqJ/rsrZ5YE+p4L
	jK/i2e5qHb0mNnKAIAZOfQoFRyt1qS3/jmtudc6uGgL8yi/Xvvd9q5oNGbUGig5oCD1YYDfZc/Q
	QFS/t33JU2fhpg4UGNLo6555wzEP3xj9imEFpHBCjivo1V8Zwsq0ZAY05Qt9K8Vp/iOdpOpPYR6
	XIjiAvYI0gvYBvtrGs7EHf/uNlHC6rUZQans3OX9k
X-Received: by 2002:a05:600c:c48f:b0:49b:9241:7ff0 with SMTP id
 5b1f17b1804b1-49d010c4f64mr283813775e9.0.1789021358682; Wed, 09 Sep 2026
 23:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
 <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com> <d3723be0-46f4-4025-b526-e1bb3cc2cad6@kernel.org>
In-Reply-To: <d3723be0-46f4-4025-b526-e1bb3cc2cad6@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Thu, 10 Sep 2026 14:22:25 +0800
X-Gm-Features: AcwNN1UCOqtjDA1IEA-_iwUx-h9ia6X61kVWP5KJZ4OCo5OwMJqwEZfSFHyzJMA
Message-ID: <CA+qSx6x2-Md9uVZo+HV0z5CfmGPDzhL482eJNnM2VYVtn_e72w@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, usama.arif@linux.dev, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, rppt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_232242_108410_C36CE2B9 
X-CRM114-Status: GOOD (  29.95  )
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

On Wed, Sep 9, 2026 at 11:18=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/8/26 16:48, Xueyuan Chen wrote:
> > On Tue, Sep 8, 2026 at 4:30=E2=80=AFPM David Hildenbrand (Arm) <david@k=
ernel.org> wrote:
> >>
> >> On 9/1/26 17:18, Xueyuan Chen wrote:
> >>> The persistent huge zero folio is shared globally and should stay zer=
o
> >>> after initialization. As Jann Horn pointed out [1], kernel bugs have
> >>> ended up writing to pages that were meant to be read-only, including =
in
> >>> security-sensitive cases. Making the folio read-only in the direct ma=
p
> >>> turns such writes into faults instead of silent zero-page corruption.
> >>>
> >>> Add a page-based helper consistent with the existing direct-map inter=
faces.
> >>> Handle TLB invalidation in the architecture implementation; unsupport=
ed
> >>> architectures retain their current behavior.
> >>>
> >>> Protect the folio after initialization. Skip highmem folios, which ha=
ve no
> >>> permanent direct-map mapping.
> >>>
> >>> Inspired by Jann Horn's read-only zero page work [1] and follow-up
> >>> discussion [3] with Yang Shi.
> >>>
> >>> Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b4=
9@google.com [1]
> >>> Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@=
kernel.org [2]
> >>> Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=3DjDx9E6=
dLOULohnhBguvi9A@mail.gmail.com [3]
> >>>
> >>> Suggested-by: David Hildenbrand <david@kernel.org>
> >>> Suggested-by: Usama Arif <usama.arif@linux.dev>
> >>> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> >>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> >>> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> >>> ---
> >>>  include/linux/set_memory.h | 17 +++++++++++++++++
> >>>  mm/huge_memory.c           | 13 ++++++++++---
> >>>  2 files changed, 27 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> >>> index 3fe293cfed8c..ed9ce04b18a1 100644
> >>> --- a/include/linux/set_memory.h
> >>> +++ b/include/linux/set_memory.h
> >>> @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> >>>  #endif
> >>>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >>>
> >>> +#ifndef set_direct_map_ro
> >>> +/**
> >>> + * set_direct_map_ro - make a direct-map range read-only
> >>> + * @page: first page in the direct-map range
> >>> + * @nr: number of pages in the range
> >>> + *
> >>> + * Make the direct-map range starting at @page read-only and invalid=
ate stale
> >>> + * writable translations before returning.
> >>> + *
> >>> + * Return: 0 on success, or a negative error code on failure.
> >>> + */
> >>> +static inline int set_direct_map_ro(struct page *page, unsigned int =
nr)
> >>> +{
> >>> +     return 0;
> >>> +}
> >>> +#endif
> >>> +
> >>>  #ifdef CONFIG_X86_64
> >>>  int set_mce_nospec(unsigned long pfn);
> >>>  int clear_mce_nospec(unsigned long pfn);
> >>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >>> index 54494c3fa983..742283b36d74 100644
> >>> --- a/mm/huge_memory.c
> >>> +++ b/mm/huge_memory.c
> >>> @@ -42,6 +42,7 @@
> >>>  #include <linux/pgalloc_tag.h>
> >>>  #include <linux/pagewalk.h>
> >>>  #include <linux/cleanup.h>
> >>> +#include <linux/set_memory.h>
> >>>
> >>>  #include <asm/tlb.h>
> >>>  #include "internal.h"
> >>> @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> >>>       huge_zero_folio =3D alloc_huge_zero_folio();
> >>>       if (!huge_zero_folio) {
> >>>               pr_warn("Allocating persistent huge zero folio failed\n=
");
> >>> -     } else {
> >>> -             huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> >>> -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> >>> +             return 0;
> >>>       }
> >>> +
> >>> +     huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> >>> +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> >>> +
> >>> +     /* Highmem folios have no permanent direct-map mapping to prote=
ct. */
> >>> +     if (!folio_test_highmem(huge_zero_folio))
> >>> +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE=
_PMD_NR);
> >>
> >> Assuming we keep the page-based approach, can't we just move the highm=
em test in
> >> there?
> >
> > Hi David,
> >
> > We can move the check into set_direct_map_ro(). However, on x86,
> > set_direct_map_invalid_noflush() and set_direct_map_default_noflush()
> > also expect callers to exclude highmem pages.
> >
> > Would it make sense to make highmem a documented no-op for those
> > helpers as well, so the direct-map APIs handle it consistently?
>
> I think getting something consistent for now is the most important thing.=
 :)
>
Hi David,

OK, I'll move the highmem check into set_direct_map_ro().

Should I also update the x86 set_direct_map_invalid_noflush() and
set_direct_map_default_noflush() helpers in this series to skip
highmem pages?

Thanks,
Xueyuan
> --
> Cheers,
>
> David

