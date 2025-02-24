Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF645C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkQqnpwYqndRUX8UXmwWgcvggVsTxywAsyTI1tHWoEM=; b=msy6KZZ8xyJSrnl7XVRtJ3PQYb
	xLMFJLZQFxqfTLCBFvMWa90HwPPGFVDL9O31TYWh9lru8R1olzwrRC9ETGHPY/7bVHYy3w3goIpmj
	XP9/5Bzo2XbLWQK42ztHQgDLgr0qa3wnVdx4hkKX5bRQTARQQrwr1OW9NP06dvegNvpGDjc9LBKDQ
	/OkIPMVi28grhOQAPdFgJTz5SNAig/IqdwV10BcHEdhxSotndLeKjO+rj20HBorDKGdu4vpjMdBpr
	Iy2IU+WKAUO269WY/JWvZpgUfrkvicHUenaNfabZ/S6G+Ix0sEVtIL/koPBgUWuxMQhk2KhO8nha4
	hgHnA5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tma1j-0000000EDSp-3bUM;
	Mon, 24 Feb 2025 15:05:47 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZXM-0000000E6zB-30Gj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:34:26 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so8339703a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 06:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740407663; x=1741012463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkQqnpwYqndRUX8UXmwWgcvggVsTxywAsyTI1tHWoEM=;
        b=vu15AYUNmwYEVqVhpsaq56jFp9Tqin31wYlz5srRB7KObX1qn6JGGSXqFMJ0I+lcpq
         oDV3DZRD/4nmxXSFntqfv4Z5Fuke++sA017n1VK0CZddIpOLNp73OXfEdbipFtF+6beF
         WTly36AzOi/V4xMDtmX7r8R+ed9dILC4JieljgdXeTsWvFSXOHmPGP815rEdu0DBsFfw
         viIypCRYRmXEmjvnpsmR/7R7VVElaXcwvDGbW48HvSZ3nPKuiebut2n6Y5ZR2Nmenp6X
         q93kWRdFe1nil2M8ITqD3NeSht62Z9UhEMb72j4JqjH/gtArMJr5yxuFSFvgz/oGLYI2
         t8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407663; x=1741012463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkQqnpwYqndRUX8UXmwWgcvggVsTxywAsyTI1tHWoEM=;
        b=T/zGJuA7nOUa2ZHp9vGPiMZvyfRXZsbt74Ry7ghNcApfOC30fCKUWTzMkd650dzpgs
         HrYo8UhAMduFB15hKjaO8EXkV3P7InCfKeGy4NUbCh+FxiKwLVWCTxHvHUXrwy4fGc+p
         9qZ9yvV4UR4U6c01niKxnaWWG2wRQkviOnN0iOTvUD8hbvkcE8SyMVr1joOUcL9ggtoi
         30BWd2NTiH4dSuLWEEcremqe2oHDfrgGbFGyOk8d7EHTgivMfALW9hxT64REyMt4N/zA
         MsA2m23S84p9CNJXES+grwgk16lKEa6vma2jvK9LBT4AdcYotgISpk99e2r0NhhJ0Wdm
         mbNw==
X-Forwarded-Encrypted: i=1; AJvYcCWaHTfh66fW2739bIBNEwXO8158EEyopDQ0wlhyaHCWKTvO8RxnSkZsllhWw4+Ts4lWAIZt+P3KmZtXjARUyUY6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg+gYYC+8218X5Ki/12QIcdiILS7pekCEjR6doDFUbx38mxSAL
	3ri+GPf0S/d606NMenSuVxMP5lVdXS+XMbo/ZesW127QWf2lltTgwYDcfV0NyaiX6m7J9vkddlK
	/VgWXGLGd7Z705Qp8QQR+NEk34oadQe8uSBXRlQ==
X-Gm-Gg: ASbGncuhgLODlVexmh4fu05FjoF7WvTJkWphxIR01JaRr56D9POXfKIKO3QihfbholS
	ZtsRvNXspANsldXW6Luf0H/tt9AQ7yYA1YH/dD8WP6P92v9W5KyRWT9QMDqqJutUiY5ojEmIXAU
	cDG/bEW+8=
X-Google-Smtp-Source: AGHT+IGwinAFCE/+cod9Wduw27y3lE5NvmD0zotgNUTu5vxJxVcMXBTXPbgxsG+pETb3Ou9qZ9ES5D869/jPdRTLpmg=
X-Received: by 2002:a05:6402:3788:b0:5dc:8fb1:d43e with SMTP id
 4fb4d7f45d1cf-5e0b70e6a03mr11963042a12.12.1740407663035; Mon, 24 Feb 2025
 06:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
 <20250127093530.19548-3-alexghiti@rivosinc.com> <Z5ePZt61CM84Hb36@casper.infradead.org>
 <CAHVXubhf7aMwsKA0H9OvTg2Lk8U7+bwntVT9Cm-7L4o7=LM4TQ@mail.gmail.com>
In-Reply-To: <CAHVXubhf7aMwsKA0H9OvTg2Lk8U7+bwntVT9Cm-7L4o7=LM4TQ@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 24 Feb 2025 15:34:12 +0100
X-Gm-Features: AWEUYZn3wPoYfPCBnGXzuvofr3D1NoWw4LTFmErwOP5gdYPjvL31yv0cddSq81Q
Message-ID: <CAHVXubjhkDvFKtK4mQDxJrRekOEAF2P9tmQ-4dyyE9A2O8ojGw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] riscv: Restore the pfn in a NAPOT pte when
 manipulated by core mm code
To: Matthew Wilcox <willy@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_063425_024487_16206ED0 
X-CRM114-Status: GOOD (  34.59  )
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

Hi Matthew,

On Fri, Feb 14, 2025 at 1:39=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> Hi Matthew,
>
> Sorry for the very late reply, the flu hit me!
>
> On Mon, Jan 27, 2025 at 2:51=E2=80=AFPM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Mon, Jan 27, 2025 at 10:35:23AM +0100, Alexandre Ghiti wrote:
> > > +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> > > +static inline void set_ptes(struct mm_struct *mm, unsigned long addr=
,
> > > +                         pte_t *ptep, pte_t pteval, unsigned int nr)
> > > +{
> > > +     if (unlikely(pte_valid_napot(pteval))) {
> > > +             unsigned int order =3D ilog2(nr);
> > > +
> > > +             if (!is_napot_order(order)) {
> > > +                     /*
> > > +                      * Something's weird, we are given a NAPOT pte =
but the
> >
> > No, nothing is weird.  This can happen under a lot of different
> > circumstances.  For example, one might mmap() part of a file and the
> > folio containing the data is only partially mapped.
>
> I don't see how/when we would mark a PTE as napot if we try to mmap an
> address that is not aligned on the size of a napot mapping or does not
> have a napot mapping size.
>
> > The filesystem /
> > page cache might choose to use a folio order that isn't one of your
> > magic hardware orders.
> >
> > > +                      * size of the mapping is not a known NAPOT map=
ping
> > > +                      * size, so clear the NAPOT bit and map this wi=
thout
> > > +                      * NAPOT support: core mm only manipulates pte =
with the
> > > +                      * real pfn so we know the pte is valid without=
 the N
> > > +                      * bit.
> > > +                      */
> > > +                     pr_err("Incorrect NAPOT mapping, resetting.\n")=
;
> > > +                     pteval =3D pte_clear_napot(pteval);
> > > +             } else {
> > > +                     /*
> > > +                      * NAPOT ptes that arrive here only have the N =
bit set
> > > +                      * and their pfn does not contain the mapping s=
ize, so
> > > +                      * set that here.
> > > +                      */
> > > +                     pteval =3D pte_mknapot(pteval, order);
> >
> > You're assuming that pteval is aligned to the order that you've
> > calculated, and again that's not true.  For example, the user may have
> > called mmap() on range 0x21000-0x40000 of a file which is covered by
> > a 128kB folio.  You'll be called with a pteval pointing to 0x21000 and
> > calculate that you can put a 64kB entry there ... no.
>
> Yes, I agree with this, then we have to go through the list of ptes
> and check if inside the region we are currently setting, some
> subregions correspond to a napot mapping.

So I looked at that and I think we are safe with the implementation in
this patch because:

- this patchset only deals with hugetlb, which cannot be partially
mapped (right?)
- when we'll add support for THP (upcoming series), we'll use arm64
set_ptes() implementation which splits the region to map using the
contpte mapping size
(https://elixir.bootlin.com/linux/v6.13.4/source/arch/arm64/mm/contpte.c#L2=
68),
so we can't mark an unaligned region with the contpte bit.

Let me know if I missed something,

Thanks again,

Alex

>
> Thanks for your feedback,
>
> Alex
>
>
> >
> > I'd suggest you do some testing with fstests and xfs as your underlying
> > filesystem.  It should catch these kinds of mistakes.

