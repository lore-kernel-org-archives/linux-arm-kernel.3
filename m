Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A19F531CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFQYviYu5IERsK9WZ4rZwOi+7n5BFxSsKXE2pfOu77M=; b=nLuTX1qPY84AXE2c+k2caMSXP8
	4K3wVRx+CBffYcIeWEFGYDU3IhSNZY1zL9VCZR5CCT7T77QMqRekaCnwjs9CMzokOoPRTF87eljz7
	Ag/g7eqAkzDkGmjdeHvxID7nEPS0Y0MPEBUxoxSD3nKWFLUvYJjyXQVOMlf+0eCaX7zyowcHKcJj6
	R3z3VQTeexMVduAz0ZNPm1J75mIV54scsA8uCZFzP7DAYICIqyVi1dTd/N1fVSNWqR4cKSG951zqs
	4fckdXDTSirXh81pb1Cd+LBSdYba+tTDAqa4Zky1EPON+ectZD4xQVncKXN5e44fg1hSiiAiWx2zK
	MZa2k4wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCNIQ-0000000GKJ0-1n0Q;
	Mon, 13 Apr 2026 19:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCNIO-0000000GKId-1fbS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 19:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 584E843261
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 19:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CC5C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 19:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776109807;
	bh=oJxljyVFYnJlQ71cjOxsdi4l3kBeDgjEaeIU1wDEovQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XIQI+3Dfu1tgIlOd7I9GwqUKy/UHOa+d6+MTpZjl59E8NqsIHW2EmcRPPonI8lMe8
	 sIOIlYsx+sEBhXkKpnAXxSWNep6CkxYmGwJ3rjCuI7l4zWhke1LU+/fxOI5PTLAYEz
	 lhnJZmxwArId51Z8KA/e/gf2lZ/ksGe/+1epkfXkvgt3JLMmgCSnGmDOpCnREiO83a
	 1UoPHwUHw0vZrWO8GgUTfB4Yjx1PpBtea7pv7IWEvQhDzfIQtPLHP2i0YuLrnRurle
	 p+xuDMMxw0joJd9Ig08+k5XaPOhh1KTTAqaDIjO4DC1HyIKLWPp9ya9PAN+xGgq0UV
	 nZSWf0JDuSZcg==
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8acae26e564so17798296d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 12:50:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/v3hgOLlHMzfYzjxYznYPqZQ5sf0bJpExd8Bm6HF7fPt/sEYAhqy4RAmZ8W35NSVLtYEFwv9V7r7pq+WLOob0B@lists.infradead.org
X-Gm-Message-State: AOJu0YwjSnp+kkQh2wLg3d37TAynsqpXPJ6cBCoxbNN3PJAyUwM0oyBz
	vzLFZ1b812a2OVX3VopXy1HniYyXZPVR4Z3kvsEpG/RYpJV3hkj6T7ugv0dfLSb9mzxMc8nWAOH
	e0Lfx2jJvXzZQ0Mj00wQwFImCxNPHxN0=
X-Received: by 2002:a05:6214:c6d:b0:8ac:a57e:ec1f with SMTP id
 6a1803df08f44-8aca57f19a6mr113901546d6.29.1776109806510; Mon, 13 Apr 2026
 12:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-5-baohua@kernel.org>
 <ad0Wyq5--L0SeIqr@kernel.org>
In-Reply-To: <ad0Wyq5--L0SeIqr@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Tue, 14 Apr 2026 03:49:55 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zuBXjm45w3h=x=iK8weVEajW_yaksXa35w0eBK6eoyxQ@mail.gmail.com>
X-Gm-Features: AQROBzA1k3Am_KfJGvo_jQMK1NqwlYnHYsaB7gQDCvz7fR6iifxM7skZxpHGLhk
Message-ID: <CAGsJ_4zuBXjm45w3h=x=iK8weVEajW_yaksXa35w0eBK6eoyxQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/8] mm/vmalloc: Eliminate page table zigzag for huge
 vmalloc mappings
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, david@kernel.org, 
	Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_125008_481518_38A1A43C 
X-CRM114-Status: GOOD (  21.07  )
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

On Tue, Apr 14, 2026 at 12:16=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Wed, Apr 08, 2026 at 10:51:11AM +0800, Barry Song (Xiaomi) wrote:
> > For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer
> > need to iterate over pages one by one, which would otherwise lead to
> > zigzag page table mappings.
> >
> > The code is now unified with the PAGE_SHIFT case by simply
> > calling vmap_small_pages_range_noflush().
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  mm/vmalloc.c | 22 ++++------------------
> >  1 file changed, 4 insertions(+), 18 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 5bf072297536..eba436386929 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -689,27 +689,13 @@ static int vmap_small_pages_range_noflush(unsigne=
d long addr, unsigned long end,
> >  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >               pgprot_t prot, struct page **pages, unsigned int page_shi=
ft)
> >  {
> > -     unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
> > -
> >       WARN_ON(page_shift < PAGE_SHIFT);
> >
> > -     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                     page_shift =3D=3D PAGE_SHIFT)
> > -             return vmap_small_pages_range_noflush(addr, end, prot, pa=
ges, PAGE_SHIFT);
> > -
> > -     for (i =3D 0; i < nr; i +=3D 1U << (page_shift - PAGE_SHIFT)) {
> > -             int err;
> > -
> > -             err =3D vmap_range_noflush(addr, addr + (1UL << page_shif=
t),
> > -                                     page_to_phys(pages[i]), prot,
> > -                                     page_shift);
> > -             if (err)
> > -                     return err;
> > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
> > +             page_shift =3D PAGE_SHIFT;
> >
> > -             addr +=3D 1UL << page_shift;
> > -     }
> > -
> > -     return 0;
> > +     return vmap_small_pages_range_noflush(addr, end, prot, pages,
> > +                     min(page_shift, PMD_SHIFT));
>
> Wouldn't vmap_range_noflush() already "do the right thing" even without
> changes to vmap_small_pages_range_noflush()?

vmap_range_noflush does the right thing for the contiguous physical
address - ioremap case where we map contiguous physical addresses
for iomem etc.

for pages array, they are not contiguous physical addresses. they might be
multiple contiguous physical addresses, but they are not contiguous as
a whole.

>
> >  }
> >
> >  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> > --

Thanks
Barry

