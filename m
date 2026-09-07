Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D64C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 01:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8SfwcOHcFiXuWXMtZLOjZ8Wgybv201Ru9VvBHg88Ic=; b=rCjz9y6McTkUQm+XsmbpuGyFV2
	R6FbJMMChvP1bTOVEJ0lUryPSSCMYB5UgSxoLntUUKNyObjk2M9CtUAx2Z69qu4RGbHiFs3WdFMlk
	Apvtfkl7ESOmZ2X4IN2zAhnr8AusweYJqgUCql9FwpNJ4bhs/CzSe0gtqdNHAvDMNtjV3E+k21tUM
	mNhQ/OG9uOAoi1LfITs1Z3JOWlOUrvUi3LBOaKI+LkZLZKx0B7sJGu4uZYE5Ql3NNv2T9ERHaP9KH
	IMkcCQFPxKQXhkekxIUgT9USMft/SH+ApFv7fRSWUeCIF3TmKS32SW7QqdqArgD5UgAsQjOzEnEyz
	3efkAQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NtV-00000005fDH-14fZ;
	Mon, 07 Sep 2026 01:11:33 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NtS-00000005fCt-1s9n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 01:11:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48583cb7d44so240772f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 18:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788743486; cv=none;
        d=google.com; s=arc-20260327;
        b=QxSr03gSAv0FvKlJ1ac8iD1eBqekCXpR38ehFQW9zOOam8be92/r2sS//NPvs0+5OB
         2JrVEUkZRAqRDIJFK+6JR7QYentre+inXIOOZ4IlguJnWZ7VPSD15zf4sPrVTRUDdL+2
         e/AZbB5G3BNpCuPO3/wFHdWO+BgcV9TOyFbF+xILD78HkqsJgBW/gRa88WI2kYT9Xmn6
         n3u93kw54HewMqaM/dAx1jFX3PjLfFb+c51WCWfHQxIde36yX3K4uBcgCzNjaoJZZk+U
         dBoMLBx5Zy/PmWML6QN+sY4gCbw4muN/+K2SvB7sBO/z2f+cFcwUNVRpF24AJ0bdkmub
         VKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k8SfwcOHcFiXuWXMtZLOjZ8Wgybv201Ru9VvBHg88Ic=;
        fh=BQOj9TEuSJ4j6VumdlpT2Dc0FTbwQHt36VlYrLHmiVc=;
        b=Z4i84aDlZknvKblrSqmETvTHLqg92YA5Fh2r2S7aHheN0/98rVWRvdJfPYS8GkVtFg
         4TSEB/RnGG6U9XijZ8EQyetnlGsTvbK9YaLh2/d8h4blgwsSbybz/fgwsO6CmIoVmbAZ
         Y+xZu+WXVRgxXTsuh2PvoP2g7J2AuqiFb9ws1mWkzrPRPStBsuaJ9ACgEUXAi0Vb9DeH
         tYnCxNvYgwbUcoYL9HMapc8tCrQjU5+NqBvwOMCTqhw7+kzePdhtOoKy3uP1ALNelPeK
         8dYoKASvAXDzQl5gjvtiCIz83Bsf7fEi5wQBF9ckgAkVLoJN8p0G/hC/XbUDbNOg4Uj7
         X1vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788743486; x=1789348286; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k8SfwcOHcFiXuWXMtZLOjZ8Wgybv201Ru9VvBHg88Ic=;
        b=ffHrpoinmaNro2ERq6ykcHSs1S3KyoGWLHuknQtTafeAyosHZL5ORETyMT1dqbAcQi
         bWpndt6ZktcpWmdtnrbsTUnKu6EWc6dZAtTV3B6ulSIDCcbRXWS5A+drZm4m3BEs1Y9U
         8MZmDy59aW8xWKoUZJyb4DGbcpxsnveBmjs3td+WaD6Vik7nf0dvyXJTYf+bRpFLIswX
         3DAlz5zy3/ztkBAIsFyRwJTVPPmNzgfEeelbj9MsQMJVC1sbG7rXga4srwxKkqwvdzeB
         Ncjd5Nu2bmgFnCPnRWufHS4Y7xQ3Lf6Nb/72cFLSHrrWET94o93IbsgMc3uh7rgm9NzK
         k6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788743486; x=1789348286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8SfwcOHcFiXuWXMtZLOjZ8Wgybv201Ru9VvBHg88Ic=;
        b=ZCAO6IgISh8a2IT1gyt2VblEG37xFfVim+U3MJGBb4GVqKx9ZS9nPA2DIhuAFxkUa1
         p+h7s+KBrjg0ulh1z0BgOcNq4EctVzpW70fndjb9qVw6g1+Qt/5YK6hp8siHLbGJxf2G
         iEinWOBI9uhgexI70GA7Qbcca9frWgbMIc6noSoHWzsaiNOME/8Z3rLBo3iY6bzPW5UE
         3udviDbKvb2UU6NYYaj4jGNLVHPpbe2DqzWq0ylUTwD3LTdt+6IHk2RFfyuArzKJWBKm
         MFN8FV+s6jS9uvRxQyydUyWqXy9WedpxNE9HtP5ZDKOlyuNSb+2zpkGYxOh/jhvsOGIj
         rxvg==
X-Forwarded-Encrypted: i=1; AKwUvBwAP3aBeE17R9xzt3DaymLIbvGiZW6cRUFBsgqDS/zpmhkVnxO5J/MXN14eTfpGwV7qounuMA/0xi/o7oaXqiR3@lists.infradead.org
X-Gm-Message-State: AFuF++nloDtCq2wHFaiO5QQ+/ZsrnB1+KctaaK2PbfC7lneCCpcol75e
	XQb8JoFmuEzN6DNe5SPQLz4r+i50aIiYZBGp04igMJ5jqLV7LnMrc1j/g/4TguBww7W5xR2SP7K
	ArLDvFO8nK9FqA9hZkI+id/1rAr6fGWs=
X-Gm-Gg: AYBFou0CJLYl1ySm/ZJLAAMxQ0/aJdbxxYSo+F5CioiE6SrnMif3oc30zV1duPHfD50
	YoE7BeUw6kB2cLZw2qYjkm6FUNMGCAVRyBiDgwKXBMgncchuma8iMbkiyJdDnVx0QvjZy9ucs2b
	XtsFVv+xNq4qiVurcRLYftGgvgo2gqOw2BGozn8Zy4CdmCb1yVzL4lztumF8IAX1BokOoUotYUu
	SCTt0O4O+UqZt8MW/rR3GlceAOBaMcc770XdhrTO4nwfZOYAVOeLsGXwnRjBsRWc267dViAr1AB
	FE7UNOgGFZLqyxsOvy8ayOcXvTeX3K12N7dHLxn5dW7nM0dbtWMGieUjJN4vGatPlGS1qVUGSUV
	Zop8krRK2hYdJMf2EwgKrLXUTvVgT7A==
X-Received: by 2002:a05:6000:2089:b0:484:3313:4a04 with SMTP id
 ffacd0b85a97d-48590807e07mr10355875f8f.6.1788743486138; Sun, 06 Sep 2026
 18:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com> <ap05ue1pq3TgHOS6@kernel.org>
In-Reply-To: <ap05ue1pq3TgHOS6@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Mon, 7 Sep 2026 09:11:14 +0800
X-Gm-Features: AcwNN1WufdM6tUiTu-c39ZQdufSwNkBnDu9lho31Iod0EgTEfjYNFPqnmJIZUMA
Message-ID: <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260906_181130_530455_53E37CCE 
X-CRM114-Status: GOOD (  37.14  )
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

On Sun, Sep 6, 2026 at 6:00=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 08:49:52PM +0800, Xueyuan Chen wrote:
> > On Thu, Sep 3, 2026 at 5:22=E2=80=AFPM Mike Rapoport <rppt@kernel.org> =
wrote:
> > >
> > > On Tue, Sep 01, 2026 at 11:18:16PM +0800, Xueyuan Chen wrote:
> > > > The persistent huge zero folio is shared globally and should stay z=
ero
> > > > after initialization. As Jann Horn pointed out [1], kernel bugs hav=
e
> > > > ended up writing to pages that were meant to be read-only, includin=
g in
> > > > security-sensitive cases. Making the folio read-only in the direct =
map
> > > > turns such writes into faults instead of silent zero-page corruptio=
n.
> > > >
> > > > Add a page-based helper consistent with the existing direct-map int=
erfaces.
> > > > Handle TLB invalidation in the architecture implementation; unsuppo=
rted
> > > > architectures retain their current behavior.
> > > >
> > > > Protect the folio after initialization. Skip highmem folios, which =
have no
> > > > permanent direct-map mapping.
> > > >
> > > > Inspired by Jann Horn's read-only zero page work [1] and follow-up
> > > > discussion [3] with Yang Shi.
> > > >
> > > > Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20=
b49@google.com [1]
> > > > Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc299=
1@kernel.org [2]
> > > > Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=3DjDx9=
E6dLOULohnhBguvi9A@mail.gmail.com [3]
> > > >
> > > > Suggested-by: David Hildenbrand <david@kernel.org>
> > > > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > > > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > > > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > > > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > > ---
> > > >  include/linux/set_memory.h | 17 +++++++++++++++++
> > > >  mm/huge_memory.c           | 13 ++++++++++---
> > > >  2 files changed, 27 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.=
h
> > > > index 3fe293cfed8c..ed9ce04b18a1 100644
> > > > --- a/include/linux/set_memory.h
> > > > +++ b/include/linux/set_memory.h
> > > > @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> > > >  #endif
> > > >  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> > > >
> > > > +#ifndef set_direct_map_ro
> > > > +/**
> > > > + * set_direct_map_ro - make a direct-map range read-only
> > > > + * @page: first page in the direct-map range
> > > > + * @nr: number of pages in the range
> > > > + *
> > > > + * Make the direct-map range starting at @page read-only and inval=
idate stale
> > > > + * writable translations before returning.
> > > > + *
> > > > + * Return: 0 on success, or a negative error code on failure.
> > > > + */
> > > > +static inline int set_direct_map_ro(struct page *page, unsigned in=
t nr)
> > > > +{
> > > > +     return 0;
> > > > +}
> > > > +#endif
> > > > +
> > > >  #ifdef CONFIG_X86_64
> > > >  int set_mce_nospec(unsigned long pfn);
> > > >  int clear_mce_nospec(unsigned long pfn);
> > > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > > index 54494c3fa983..742283b36d74 100644
> > > > --- a/mm/huge_memory.c
> > > > +++ b/mm/huge_memory.c
> > > > @@ -42,6 +42,7 @@
> > > >  #include <linux/pgalloc_tag.h>
> > > >  #include <linux/pagewalk.h>
> > > >  #include <linux/cleanup.h>
> > > > +#include <linux/set_memory.h>
> > > >
> > > >  #include <asm/tlb.h>
> > > >  #include "internal.h"
> > > > @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> > > >       huge_zero_folio =3D alloc_huge_zero_folio();
> > > >       if (!huge_zero_folio) {
> > > >               pr_warn("Allocating persistent huge zero folio failed=
\n");
> > > > -     } else {
> > > > -             huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > > > -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> > > > +             return 0;
> > > >       }
> > > > +
> > > > +     huge_zero_pfn =3D folio_pfn(huge_zero_folio);
> > > > +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> > > > +
> > > > +     /* Highmem folios have no permanent direct-map mapping to pro=
tect. */
> > > > +     if (!folio_test_highmem(huge_zero_folio))
> > > > +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPA=
GE_PMD_NR);
> > >
> > > Sorry, I don't remember if it was discussed previously, but why can't=
 we
> > > use the existing set_memory_ro() here?
> >
> > Hi Mike,
> >
> > We want to change the linear map here, but arm64 set_memory_ro() only
> > works on vmalloc addresses.
>
> I believe this is an historical artifact. change_memory_common() already
> updates the linear map when a vmalloc mapping switches to RO and the syst=
em
> supports it.

On x86, set_memory_ro() does work on direct-map addresses.

>
> I believe arm64::set_memory_ro() can change the linear map in the general
> case as well as long as can_set_direct_map() is true.
>

On arm64, I'm reading arch/arm64/mm/pageattr.c, and the linear-map
update in change_memory_common() is only reachable for vmalloc
addresses:

  set_memory_ro
    change_memory_common
       area =3D find_vm_area((void *)addr);
       if (!area || ...)
          return -EINVAL;

So set_memory_ro() on a linear-map address returns -EINVAL on arm64.

Am I missing something here?

> > So a new helper is needed on arm64, and x86 implements the same
> > helper to keep the two architectures consistent. On x86 it is
> > basically set_memory_ro() minus the alias check.
> >
> > Thanks,
> > Xueyuan
> >
> > >
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > --
> > > > 2.47.3
> > > >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
>
> --
> Sincerely yours,
> Mike.

