Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD65E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RArVkKSCeMH/NY6o3gQIWtxTREQOsCr1U+SuNtxbEwg=; b=3f3c+eeFw/ccqCuDh4T1Tluan1
	cGlQ5XzkCsCh6zuGOl5EUUwedODFOpFE+UrhIv83YMNWmJjhWz7cx3Z7THwgOU72PcT47B/9W1kTP
	qYqnrTn7v469GFRQ4TJJXEtoyCdweUynsVsmx6wHVZGhMztAygp5kuai7NdQ3ZRFwowjjOR0scuSi
	0dTlf+WOQazj/zqyk48Ptt7UrgF5xwD22vfcrPp1CmLEH0U1pWKCKTjYtXjV1AVxOWCK/oEm+2ME5
	R7vg52jxxVR0rOZXhXwWEWSL/HfcnZ7Sm4cirtTdOJpj+Ob8hJxu7Am1BOOrFBW63cIy3ra91le0y
	wZKt/+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4CB-0000000CIzi-0ek2;
	Tue, 10 Dec 2024 17:38:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL47j-0000000CI4i-2f55
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:34:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2155c25e9a4so137325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733852054; x=1734456854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RArVkKSCeMH/NY6o3gQIWtxTREQOsCr1U+SuNtxbEwg=;
        b=sdo2bYjLIK7xF7V/+2ay6ZBCi+9MoLTzMACWSzpEaxuKyJVaVxWWGMrC8+NE+G9f1B
         Z4SNx04u4jDKygXklgec1uFxjf/liGcHBeWmuJXHq4WxunhppKHMQ96jqoYGCJWOyAcU
         nin++9dLDjsyYkdMFM4pmMAyDhlLjtJEXXAt7c+FoxELvzHT/jhqcrRSD4idu4ZGgwFx
         KCNTey3L9VxBa2QsujiguIJLfCX3c1qlmagMtoZytT/eNkKrl3BiK6TD0GCAYyaJHZJ5
         T3cSCqm9IIxelvrawZcz++NehoFnvVZPFJGeDaevOw6m8xCnOGtZrJPp8LNBQfhupSd9
         hn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733852054; x=1734456854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RArVkKSCeMH/NY6o3gQIWtxTREQOsCr1U+SuNtxbEwg=;
        b=Lu92tTcA8aIbHjR3yOpcH/97bOxDoE/5RfY3cUKel9rFvj/FELEerwOfTpMNA3VlEZ
         exxpDI5/xM7j9AHfZjC+qba5lQ8MKBvaU9LF9VoBsZ29VqSpb9aSkQWZqozTrRJVFt/g
         DmzdHMBKnxQ+RCfFc8Pe9nXtljPz28fmujfiQ0ikCG1JipHgS7opbSgyMbs7rfQYPfx1
         6hVUK2h6nW5kFGM7m+WGcSHwpmw5fIS60pIONzYezcFkgfgk3YxYms0pfys732S/8bVu
         l0vTzpapPwS39BC7vnfGL8URLsFUE01CLRGofwh/8N3QXSQK05lVxlO6fDD1MURwjY4B
         Xu4w==
X-Forwarded-Encrypted: i=1; AJvYcCWaVfAHdP8639mG4vuVau9rYtkUWwpzLVghrZtJ5Jm8YN/il+v7QdZ07xQCZvDijftXX9zD2Z5FQDZRWrONZKfe@lists.infradead.org
X-Gm-Message-State: AOJu0Yw74nzX8SiotZcE0JBNhPcimIIBTVP+sDp8vIu6bneD1xlrQ22P
	1jjAG+C3RI5Sfeb3jpwErDxlNZZPwOWRTsVpWyw5qjwhDbNPzgezGQMoLIT2n7oUtWTw/UhE5DF
	ViqvKzJY0ACF/vxgjXjciOmCnZfMTIpsV3xR0
X-Gm-Gg: ASbGncsBPeb9e19pSeO7tgwt77EOHu1l3KXChn/bW7eOMLQipgbjYR0KxqzirDuXk70
	BeImxc/Dhp7svEynDvygqV9CYaHzJm0ks1LBUGpCCWA9jUhbKu8yZQS6duz2wXO3Q
X-Google-Smtp-Source: AGHT+IEDudBnir5+jttzQm+7tNnzRHUlcioRTO8j0Dis2V+coMoC8sfWSozH23fEnrYfZy4bwgZvjEwIXStM7LatHiM=
X-Received: by 2002:a17:903:4403:b0:215:9d29:1aba with SMTP id
 d9443c01a7336-21674cbdb12mr2775015ad.1.1733852054062; Tue, 10 Dec 2024
 09:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
 <20241210024119.2488608-18-kaleshsingh@google.com> <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
In-Reply-To: <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 10 Dec 2024 09:34:01 -0800
Message-ID: <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Yang Shi <shy828301@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093415_681171_10F86A60 
X-CRM114-Status: GOOD (  34.35  )
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

On Mon, Dec 9, 2024 at 7:37=E2=80=AFPM Yang Shi <shy828301@gmail.com> wrote=
:
>
> On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google.c=
om> wrote:
> >
> > Commit 249608ee4713 ("mm: respect mmap hint address when aligning for T=
HP")
> > fallsback to PAGE_SIZE alignment instead of THP alignment
> > for anonymous mapping as long as a hint address is provided by the user
> > -- even if we weren't able to allocate the unmapped area at the hint
> > address in the end.
> >
> > This was done to address the immediate regression in anonymous mappings
> > where the hint address were being ignored in some cases; due to commit
> > efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").
> >
> > It was later pointed out that this issue also existed for file-backed
> > mappings from file systems that use thp_get_unmapped_area() for their
> > .get_unmapped_area() file operation.
> >
> > The same fix was not applied for file-backed mappings since it would
> > mean any mmap requests that provide a hint address would be only
> > PAGE_SIZE-aligned regardless of whether allocation was successful at
> > the hint address or not.
> >
> > Instead, use arch_mmap_hint() to first attempt allocation at the hint
> > address and fallback to THP alignment if that fails.
>
> Thanks for taking time to try to fix this.
>
> >
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > ---
> >  mm/huge_memory.c | 15 ++++++++-------
> >  mm/mmap.c        |  1 -
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 137abeda8602..f070c89dafc9 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(str=
uct file *filp,
> >         loff_t off_align =3D round_up(off, size);
> >         unsigned long len_pad, ret, off_sub;
> >
> > +       /*
> > +        * If allocation at the address hint succeeds; respect the hint=
 and
> > +        * don't try to align to THP boundary.
> > +        */
> > +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> > +       if (addr)
> > +               return addr;
> > +

Hi Yang,

Thanks for the comments.

>
> IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
> arch_get_unmapped_area_topdown() again. So we will actually look up
> maple tree twice. It sounds like the second hint address search is
> pointless. You should be able to set addr to 0 before calling
> mm_get_unmapped_area_vmflags() in order to skip the second hint
> address search.

You are right that it would call into arch_mmap_hint() twice but it
only attempts the lookup once since on the second attempt addr =3D=3D 0.

Thanks,
Kalesh
>
> >         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
> >                 return 0;
> >
> > @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(str=
uct file *filp,
> >         if (IS_ERR_VALUE(ret))
> >                 return 0;
> >
> > -       /*
> > -        * Do not try to align to THP boundary if allocation at the add=
ress
> > -        * hint succeeds.
> > -        */
> > -       if (ret =3D=3D addr)
> > -               return addr;
> > -
> >         off_sub =3D (off - ret) & (size - 1);
> >
> >         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 59bf7d127aa1..6bfeec80152a 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned lon=
g addr, unsigned long len,
> >         if (get_area) {
> >                 addr =3D get_area(file, addr, len, pgoff, flags);
> >         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> > -                  && !addr /* no hint */
> >                    && IS_ALIGNED(len, PMD_SIZE)) {
> >                 /* Ensures that larger anonymous mappings are THP align=
ed. */
> >                 addr =3D thp_get_unmapped_area_vmflags(file, addr, len,
> > --
> > 2.47.0.338.g60cca15819-goog
> >
> >

