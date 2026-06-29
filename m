Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340F0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=; b=iQE3j32THI1BDOYGkBV3a8v0Rv
	04HP9/HBtrecEYH/Qy81SdHMHxVdFDOGqB/IJ0SVr9C4IdJzBz3ogoeYNyYAlzkvuQ56GbFS+1Ize
	e/aI8RRO4EGuKDO3+pyTBi7syPcNkG+yXQOAxZ21636usp9dHbfRFnWNgJoUnfm8XXX3nJNNUxv0M
	Zi5dYD7uLC9hasURgfI2tgYZa2D/ljaklRbdIZQJR5+RXCfstTtBio7qshfg2CcWDFbzl4kMKQBwq
	xcETypiQiYKPeIeU4T/vpRFGiwOirbk/wMKdgKbpW9rwOFphqtRHlaIb68/CVvnHyTbDlw4aTQedp
	F641hHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFA3-0000000FFPj-4BU7;
	Mon, 29 Jun 2026 16:48:44 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFA0-0000000FFOS-2GUO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:48:42 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-664c6304683so1672010d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782751719; cv=none;
        d=google.com; s=arc-20260327;
        b=M+J9kkEKtHO0W90EZG+p5q22/434cs9IT6xA4N5coi52qpGGZvo+wZEDLaUkwU6IXl
         TAGeU9PX4KUtbEIWTKEwUa1RqYvSKcGE2zi2XRICLpzTN/kJ6AwIxHSy2yY9dMEXFhoK
         wNBmQNtk+0muArNs0mqAfLnuzUBvxz8lqbGrWbZe/DnaS0fnSJK/ccQFNlGBJkhO/y7Z
         LHOI1D6WnbfmEzWHyOxH9inCqYuQX7tPBYnMXgo+TA2cfSNjVJ/Xrs7QAz5b3Chl47dv
         qyNrSlBw+daRuVi45HcpEyVDFxrIMdn8oyw26xzL0+QXZxHKOk4nf5kYivnLJxs2lMnD
         G2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        fh=qLXito0mp2Abued/T7Yqb6A6imTLGjZBTYOuTMSYBrw=;
        b=qw6Mmk2GJD6GLPZNeDGW3krJ3ah0lVedXm7tpbiKt91UPEogqvg8G3rxr9mhBuD+mv
         dbOskVUUIpL9FrozlSxUlB8IRtV0vOPxg6MK3RUCKDfSNKxNyrw0XCMxTezkU8ptZ/LX
         H3tT2qLnWiKaoaBVLiOzJJHg3VP94we9wFtBIvUZR3kPoD44jUpw3YZHe5qrCglOnphh
         X5I90yFjic6EJ1RQRM5Tjbu1N1oq5BaKy9XpJA41QbMsn78MCvcq0nBba+nyEprWnj7P
         VDgWX4But7XFmK9FJpzgruM2F9GFYN0s6HUS+roepbaWN/NAML/ZuHWa93xswCexRy1G
         SOYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751719; x=1783356519; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        b=jDig6LzCOKHm542CM4SrqNktw8ha7r6YOjLEPt5gu8wuKbSB3OjVnalJAzQW4uSkNT
         YO7Y1dUsXpXBdL8u8j4S9icC9yeV710ChJYua7cjACG+9OnTFxmQ6CtnKhARJOB2Tw9l
         21rkwSFNRXeJXpTjOVMGK5P9EpBPj1IOpc7RB9Mb3dRDH/v6+i0bvuVxjl4CBJxEu0Aq
         HwlmE0wG33okr2nw+JBW4QXh8C8XJO/0fM1Xf+ptc5A/mL6S5sXHvYW6kBvptTVRi+A6
         meeL1G1ujXUhjyiypkWZTAuk4ZLREyHOQcEWF+EKLfv0DugtAmxcd50kj32GjpDt0Q++
         wfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751719; x=1783356519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        b=RHl4M6fv6ZMILBkJEH572LDk8Zi/uTGzOJaV7Ee9mvOCaKpAjYErN59YNRrubGDVu0
         H+XiHbxP7xbaYuUM06GBLy5o5usKr486BteY5n7NfZI4W8WUztRFU9P7bHQJFzgTnWYA
         Kr6d6Wb4nOzwq7WekIu8I82c/gMlA8cZpnBKXqsDRjOGC/9L57kBtjB/pgsSodlS+I8+
         lIQ6XwOmDbU9Ko3Uak/kVap+4BEfaWaugaXbYwHGwKkVGS3VfOXahD5IxCEuxmuHI+E3
         5V89X2y0Vv/vJtwRxPM2NrCJTiasxaVRmNq9hUCYwEVpBrzIRv1q0VetFdsrcF/MMHKC
         GrJw==
X-Forwarded-Encrypted: i=1; AHgh+RqEu6p9YRTCVBDSLNx7JnGT3r0roFZpIYqDKjpt7+Ka0rn/7uNFfQ6vSiY4+cRlnMTjqBGYPMDtPrCCkwIHURHO@lists.infradead.org
X-Gm-Message-State: AOJu0YzEitPdpDhZO4aJ5a34zbE+/vui7u2tlfkSLXhI8EzzH46vL3fG
	UperHW5X06exFiZpJVvfRIp7dWcu0559280GV6ttvokai5DcjE2lGAvpafBtML6pbxGNatLx+nO
	aEmeesQG3++t3SsIqDineH8Mu2y2Gx3o=
X-Gm-Gg: AfdE7cnXfOonTPhdsjqL/T7dDZHd53Waso/HN36GEg9QwDNLyhgi4gqph6w5AlubBfV
	mq3v81P8Qm9yigSBmC9DcyuQG1Lf1hH80KOj1HL8OhXhsupTb57yEerkb3IUF3dXxsgTkam1XMw
	mBvSwFkZqqruCcLcSZLJE9QijCjcqbXzshXygTPfSbSC/VN69I0VTERVM5B0P4Te22WmqnqVzqg
	v2Czr96Ae6VXVo0RnM0hQcSbxqiOEUH50Rp8lQlgTnEbvi7VBKf+HCVY70xviO/3+jtOA==
X-Received: by 2002:a53:a7cd:0:b0:664:c1a2:36ed with SMTP id
 956f58d0204a3-664f9a828b9mr336123d50.63.1782751719282; Mon, 29 Jun 2026
 09:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260621145919.1453-1-ekffu200098@gmail.com> <aj426bA-YiOKt06m@kernel.org>
 <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com> <akJafRKJJBd5Jrv0@kernel.org>
In-Reply-To: <akJafRKJJBd5Jrv0@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 30 Jun 2026 01:48:27 +0900
X-Gm-Features: AVVi8Ce7e8tTlZ7wLMJcBpYQ1j4KVXqbB4X7R45vGUUSJRnYUp1U99vuoyq3ILs
Message-ID: <CABFDxMFTfFO_jePBnM_uZXcmLBHJM3db-=VzFE+bxSYgm1G-1Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
To: Mike Rapoport <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Will Deacon <will@kernel.org>, Alexander Potapenko <glider@google.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrey Konovalov <andreyknvl@gmail.com>, David Hildenbrand <david@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_094840_586578_D4BA3EB4 
X-CRM114-Status: GOOD (  23.54  )
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

On Mon, Jun 29, 2026 at 8:44=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Fri, Jun 26, 2026 at 07:59:22PM +0900, Sang-Heon Jeon wrote:
> > On Fri, Jun 26, 2026 at 5:23=E2=80=AFPM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > On Sun, Jun 21, 2026 at 11:59:10PM +0900, Sang-Heon Jeon wrote:
> > > > The memblock API guarantees that for_each_mem_range() and
> > > > for_each_mem_pfn_range() never return an invalid range, meaning sta=
rt is
> > > > always less than end.
> > > >
> > > > Several memblock callers still have unnecessary invalid range check=
s in
> > > > their loop bodies, so remove them.
> > > >
> > > > Sang-Heon Jeon (6):
> > > >   arm64: mm: remove unreachable invalid range check in
> > > >     kasan_init_shadow()
> > > >   LoongArch: remove unreachable invalid range check in kasan_init()
> > > >   riscv: remove unreachable invalid range check in
> > > >     create_linear_mapping_page_table()
> > > >   riscv: remove unreachable invalid range check in kasan_init()
> > > >   mm: remove unnecessary empty range check in
> > > >     early_calculate_totalpages()
> > > >   mm/hugetlb: remove unnecessary empty range check in
> > > >     hugetlb_bootmem_set_nodes()
> > >
> > > I queued this for inclusion into memblock tree.
> >
> > Thank you, Mike.
> >
> > Could you please review and queue this patch [1] as well? It does the
> > same kind of clean up, I just missed it at the time.
>
> Can you please resend them all as a single set?

Thanks for considering, Mike.
I've sent v2 patch series [1] that includes the missing patches.

[1] https://lore.kernel.org/all/20260629163736.1606688-1-ekffu200098@gmail.=
com/#t

> > [1] https://lore.kernel.org/all/20260626032902.703944-1-ekffu200098@gma=
il.com/
> >
> > > >  arch/arm64/mm/kasan_init.c     | 3 ---
> > > >  arch/loongarch/mm/kasan_init.c | 3 ---
> > > >  arch/riscv/mm/init.c           | 2 --
> > > >  arch/riscv/mm/kasan_init.c     | 3 ---
> > > >  mm/hugetlb.c                   | 3 +--
> > > >  mm/mm_init.c                   | 3 +--
> > > >  6 files changed, 2 insertions(+), 15 deletions(-)
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
> >
> > Best Regards,
> > Sang-Heon Jeon
>
> --
> Sincerely yours,
> Mike.

Best Regards,
Sang-Heon Jeon

