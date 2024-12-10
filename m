Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E256EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=; b=1zXfRxqc4865rufcOwG7iv5brn
	IdA6XWX1qCo96PDGBQgw7/rbeB3zhfu/zyGZp/mdIsLsFsiPq7afRdSP1DH519smmGXOdHb488UH/
	bRCVD9CS4YtgL1rwIbw8ePeN6fSG2aQok8Ty1rFaYXkx0T7l4Q343wQBgYSa6fy0BBjw/+N3FqejT
	LcUpgQEkrS8RrCMkgt6FCLJr+HnEP0IEU/my0T0X/8ZIClMvv5B8qn9jRhyaxBuvc1q3E3spK1cG3
	RWkqtRx/XPWLUCZ2nJIv9Q3Kif6waSmoYDfGMbYYl5qE1gqqxQOzQL/ixhrRxp9f1o5ENQ/aJTuy2
	Lyzjc5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL66V-0000000CY0m-03kM;
	Tue, 10 Dec 2024 19:41:07 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL65S-0000000CXhx-04Pa;
	Tue, 10 Dec 2024 19:40:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso3654431a12.2;
        Tue, 10 Dec 2024 11:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733859600; x=1734464400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
        b=WtLv5QzdXBkzXh2iBEXC4SjSvVRgTM+wcM8h23ydgqHuHosjejLzfl/XAYDr9Cjmx1
         GI8mmZJuHrylT/L8X5wrwPYadcVKoTHqDCYXMKsBPGMPFlzqbzILIch1djK64nnOlST0
         5iyFfPd/h5zAC4tVgKhIT+QDq97bcZW5SMAKSITLth/jwrIPWGxUnNCG6XYofZdMVcnR
         MfILsONZnN4gsTTQ8f1HpYzvBcnFTz3aWQDC4qB93PNx5acYfLQhMHWBXvA/wvzKkjuv
         risD/dkyl0Z+whngEgi9e4OV0bHxqADong3mY/JF3cOFzzI6iIUjGzpfvJ3GWcVpjn4y
         n61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733859600; x=1734464400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
        b=Xr2mqtRmFNRIQ3Fl963jIc9YqfHpa0a9SR5M7DqySAv2kSlGphNB8IeEuiFGHwVtRl
         4dInBEz3/EfBJmoXMPMxZSz1OFs4hTBpFX+CTdw+rNbpoJDxNoSkQc4plJpSDxHMH0jL
         yIH+GZooeU4yXYSBGjxQ/3EqQnb9Z+eoE8o8eiET0LkFBTVkJkQFipoDQRjovAwm90RT
         QZW78GA+XE2UrYihpZ45+e2KO4Z8spn6fMMT1D2WOlgt/DKyehNjGyv+zkIv2zyjylJX
         JiMg1cTKgfAJp5idp+2OGn1i+mnVJ2rW1xi9eQ2WUsVQ6dBrbqLpqGeXfdTMEdlzmKV2
         vztQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIffy4W9RVdte9MBjLleMlB8BOBNLYIjrp5pTP9yyYYISELYA3+SpB93XLrGYc9GOAjGQH3ci6AmYVuDIkolM=@lists.infradead.org, AJvYcCWP0cXphb4i6TEsfYRLCKgtmv/1CFAFCDNYYrshMXKOv8zNxDfCeet56y+KkOsjHPDJnsLNTC73u7PSLCN8divw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy1Hnspn7R6n2+NsdsyMzL0tg0MUo/2tLxh8QF/SiF1cz8Dx0s
	U3fi9dFWntSTVzzEAHIkWQHKWlvO46puAKStdbKhuKgaxuJCuxdfbNzx8iDs2jft83ReOrschYN
	062xtQvNsDmThK2vY4glztL3Jrh4=
X-Gm-Gg: ASbGncscX8iGUtboecOiKq9OdzArAwXSDewOIZ5yThlFS40ewD5zZFx15ZzhDg/R+tn
	Q3dLzPqvQxfQX2Up0vazd17svHlHVYJ/0ACFhWA==
X-Google-Smtp-Source: AGHT+IGn1TGMw5Q3ZRvX4tSkpBgSMsKO1aElzvBulPGolgowmhm7A7II8tzVQjdTXusigtkhjHD3HA/xYigxPDvvUCI=
X-Received: by 2002:a05:6402:5299:b0:5d0:c9e6:30bc with SMTP id
 4fb4d7f45d1cf-5d4330814d0mr38059a12.10.1733859599911; Tue, 10 Dec 2024
 11:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
 <20241210024119.2488608-18-kaleshsingh@google.com> <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
 <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
In-Reply-To: <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 10 Dec 2024 11:39:48 -0800
Message-ID: <CAHbLzkqbH_AR2jy_6LZ7KSh6bcf4L5B51Mq9DwYtdBcVz1Lu6w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Kalesh Singh <kaleshsingh@google.com>
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
X-CRM114-CacheID: sfid-20241210_114002_058228_439CF768 
X-CRM114-Status: GOOD (  35.61  )
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

On Tue, Dec 10, 2024 at 9:34=E2=80=AFAM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> On Mon, Dec 9, 2024 at 7:37=E2=80=AFPM Yang Shi <shy828301@gmail.com> wro=
te:
> >
> > On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google=
.com> wrote:
> > >
> > > Commit 249608ee4713 ("mm: respect mmap hint address when aligning for=
 THP")
> > > fallsback to PAGE_SIZE alignment instead of THP alignment
> > > for anonymous mapping as long as a hint address is provided by the us=
er
> > > -- even if we weren't able to allocate the unmapped area at the hint
> > > address in the end.
> > >
> > > This was done to address the immediate regression in anonymous mappin=
gs
> > > where the hint address were being ignored in some cases; due to commi=
t
> > > efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries"=
).
> > >
> > > It was later pointed out that this issue also existed for file-backed
> > > mappings from file systems that use thp_get_unmapped_area() for their
> > > .get_unmapped_area() file operation.
> > >
> > > The same fix was not applied for file-backed mappings since it would
> > > mean any mmap requests that provide a hint address would be only
> > > PAGE_SIZE-aligned regardless of whether allocation was successful at
> > > the hint address or not.
> > >
> > > Instead, use arch_mmap_hint() to first attempt allocation at the hint
> > > address and fallback to THP alignment if that fails.
> >
> > Thanks for taking time to try to fix this.
> >
> > >
> > > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > > ---
> > >  mm/huge_memory.c | 15 ++++++++-------
> > >  mm/mmap.c        |  1 -
> > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 137abeda8602..f070c89dafc9 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(s=
truct file *filp,
> > >         loff_t off_align =3D round_up(off, size);
> > >         unsigned long len_pad, ret, off_sub;
> > >
> > > +       /*
> > > +        * If allocation at the address hint succeeds; respect the hi=
nt and
> > > +        * don't try to align to THP boundary.
> > > +        */
> > > +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> > > +       if (addr)
> > > +               return addr;
> > > +
>
> Hi Yang,
>
> Thanks for the comments.
>
> >
> > IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
> > arch_get_unmapped_area_topdown() again. So we will actually look up
> > maple tree twice. It sounds like the second hint address search is
> > pointless. You should be able to set addr to 0 before calling
> > mm_get_unmapped_area_vmflags() in order to skip the second hint
> > address search.
>
> You are right that it would call into arch_mmap_hint() twice but it
> only attempts the lookup once since on the second attempt addr =3D=3D 0.

Aha, yeah, I missed addr is going to be reset if arch_mmap_hint()
fails to find a suitable area.

>
> Thanks,
> Kalesh
> >
> > >         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
> > >                 return 0;
> > >
> > > @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(s=
truct file *filp,
> > >         if (IS_ERR_VALUE(ret))
> > >                 return 0;
> > >
> > > -       /*
> > > -        * Do not try to align to THP boundary if allocation at the a=
ddress
> > > -        * hint succeeds.
> > > -        */
> > > -       if (ret =3D=3D addr)
> > > -               return addr;
> > > -
> > >         off_sub =3D (off - ret) & (size - 1);
> > >
> > >         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 59bf7d127aa1..6bfeec80152a 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned l=
ong addr, unsigned long len,
> > >         if (get_area) {
> > >                 addr =3D get_area(file, addr, len, pgoff, flags);
> > >         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> > > -                  && !addr /* no hint */
> > >                    && IS_ALIGNED(len, PMD_SIZE)) {
> > >                 /* Ensures that larger anonymous mappings are THP ali=
gned. */
> > >                 addr =3D thp_get_unmapped_area_vmflags(file, addr, le=
n,
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >
> > >

