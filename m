Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA08CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DufheDXAcwKt13HIcOdT0J1PoqZ8mER4Cr9RgR82po=; b=aPp9ZtZi4mujiIiIJ1XTpTd1nt
	LTY6xOq/4zjfoc4J+My3xjgWcN7ls1k5lu2kl6+iHzICL7WA/lvGVroD7DGYV/n6CIakw3zvVZE9I
	244AQQTFMnC6qTRlMus2uP5NyJ46qD+l2/ngsok9uJ+tiRzYdJ00ZU321SBJvpWYPQckax14DXmso
	5NurP5lU0JfTc6uj7PymRPivxeTLAaWTP0I8nxl07HervTy0DgY+9tY/CswBv05o/eXa2X8XNyslE
	bUhKW3VlO53YUXmzP7opbH0s7wZmydIQP/DtIvD9TId5f9xuKcWZeCyDSwXeuEFcN8nFFQo1+xGew
	5ahBWMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8YZ-0000000GThT-1Xfg;
	Thu, 18 Sep 2025 06:55:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8YY-0000000GThN-1OTQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93ECC601FC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 06:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFA5C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 06:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758178549;
	bh=5VZCPFcBb02PaX2Pb4NaxJfMwWgXxK+8Fm0rYfC7mCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RDjqhAUjldsW07Ijl6Ytiz2S3/MTHNQuzlPFVZnoZFMpGa6sJudFYFfUsaSGtO4BR
	 dnHQSU/GRR1nSXfxXCDEKbWsqFZO3YZYNy49eUNIdH8q81i4f47Hbb1km4jxv53p7h
	 3iR4S4PbWGJ1zwREKBRmhYre0NtHkOU24Wyb7betxXUE5CUd4l6G0wRNx8QcxVJzDI
	 xheg1/F4S04OUs5umUDW+v9I/rPN5kbkIIe3pZADeQYS0NLCvTsEdXIfPHIupXMrGF
	 TZ5G0y79TXriSWW2sfQDkjXjPSGe8L5puI2MO6uBi7zXBHlzLJvhAzXKPk9NJif0Ts
	 p4Q1AvYJPvLfg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so780422e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 23:55:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YxXg+zlCzEjdgtV11TjBWYvch1H2fvCkWQNqAZsCYrlii1W0ghM
	xgDwZ4GemCHIHPcwDKtduia4pq0iRhPr5YW1vap9ceeTn90g0M/3n420aMcBivUtonh3Pwo2ugC
	/8riSc9iLc/CPOfkiK0LrOLLis3dw1N4=
X-Google-Smtp-Source: AGHT+IG3qMFBjVRKHprkQ1goahVK+L5EvElqOHFhRyZmDROE2xweJlGMpSYniQAR1mY45hxX+o5/TC0Uyp8YgfGFhCA=
X-Received: by 2002:a05:6512:ad4:b0:55f:6d6e:1e97 with SMTP id
 2adb3069b0e04-5779c4811aemr1466545e87.52.1758178547547; Wed, 17 Sep 2025
 23:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
 <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com> <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com>
In-Reply-To: <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 18 Sep 2025 08:55:36 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
X-Gm-Features: AS18NWCzAgOJjuI0wQSqq5IiTPB3kewVTe6JqW7zespWjXvhgZparlV5gtXVxkw
Message-ID: <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
Subject: Re: armv7 R_ARM_PREL31 relocation out of range error when loading module
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux ARM List <linux-arm-kernel@lists.infradead.org>, 
	Kursad Oney <kursad.oney@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Wenchung Su <wenchung.su@broadcom.com>, 
	"song@kernel.org" <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 18 Sept 2025 at 04:11, William Zhang <william.zhang@broadcom.com> w=
rote:
>
> On Wed, Sep 17, 2025 at 3:11=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> > On Wed, 17 Sept 2025 at 04:55, William Zhang <william.zhang@broadcom.co=
m> wrote:
> > >
> > > Hi,
> > >
> > > We recently ran into the driver loading error resulting from
> > > apply_relocate function when it handle the R_ARM_PREL31 case in
> > > arch/arm/kernel/module.c:
> > > section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 ->
> > > 0x7fad5998)
> > >
> > > After some dig, it seems this issue is caused by this change:
> > > ac3b43283923 ("module: replace module_layout with module_memory")
> > >
> > > I can see the necessity of this change but it seems it can cause this
> > > kind of error under certain configurations. In our particular case, w=
e
> > > use the 2G/2G split and our armv7 board has 1GB ddr memory. This mean=
s
> > > the kernel lower memory is from 0x8000-0000 to 0xc000-0000 and vmallo=
c
> > > range is from 0xc000-0000 and above.
> > >
> > > Before this module layout change, the module is loaded through two
> > > layout sections: core and init. The driver in the test is fairly big
> > > and core module layout(text, data, rodata, sections) can not fit into
> > > the 16MB MODULE memory so both text, data and rodata fallback to
> > > vmalloc range. But with this change, it will text, data and rodata on=
e
> > > by one. So it ends up text in the MODULES memory but rodata is
> > > allocated in VMALLOC and the distance is more than 1GB hence we
> > > believe it causes the above error when R_ARM_PREL31 relocation can no=
t
> > > support more than 1GB offset.
> > >
> > > Since the default split is 1G/3G model, the distance between vmalloc
> > > and module memory is always below 1G so we won't see this issue. But
> > > it seems to us the problem is real when use 2G/2G split.
> > >
> > > It appears the sections containing R_ARM_PREL31 in our driver are
> > > mostly in .ARM.exidx section. Some search shows this is used by ARM
> > > C++ exception handling but our driver does not use C++. Is there a wa=
y
> > > to disable such section for R_ARM_PREL31? If not, is there any
> > > workaround or fix to handle this run-time R_ARM_PREL31 relocation
> > > issue? The same apply_relocate function can handle R_ARM_JUMP24 out o=
f
> > > range using PLTS. Can this apply to R_ARM_PREL31?
> > >
> >
> > Hi William,
> >
> > Two options come to mind:
> >
> > 1) use the frame pointer for unwind information instead of the C++
> > exception metadata, i.e., enable CONFIG_UNWINDER_FRAME_POINTER
> >
> > 2) ensure that ARM.exidx sections are allocated from the same bucket
> > as the .text sections they annotate, e.g., something like the below
> >
> > --- a/arch/arm/kernel/module-plts.c
> > +++ b/arch/arm/kernel/module-plts.c
> > @@ -225,6 +225,11 @@
> >                         mod->arch.init.plt =3D s;
> >                 else if (s->sh_type =3D=3D SHT_SYMTAB)
> >                         syms =3D (Elf32_Sym *)s->sh_addr;
> > +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> > +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND)
> > +                       s->sh_flags |=3D SHF_EXECINSTR;
> > +#endif
> > +
> >         }
> >
> >         if (!mod->arch.core.plt || !mod->arch.init.plt) {
>
> Thank you Ard for your quick response!   We tried the option 1 and
> also tried with gcc -fno-unwind-tables option just for the driver,
> both do not generate any PRREL31 relocation and the driver can load
> successfully.
> But we have some tool that needs to use the unwind tables so option 2
> will be the right direction for us.
>
> Applied your patch however it still reports the same error but from
> different section as we confirmed all the ARM.exidx sections are
> allocated from .text section.
>      mod_mem_type 0 execmem_type 0 base 0x7f3e8000 size 0x6eb000
>      mod_mem_type 1 execmem_type 4 base 0x7fad4000 size 0x9e000
>      mod_mem_type 2 execmem_type 4 base 0xc21a4000 size 0x3dd000
>      mod_mem_type 4 execmem_type 0 base 0x7f1ae000 size 0x1000
>      mod_mem_type 5 execmem_type 4 base 0x7fb73000 size 0x10c000
>      section 43 reloc 11360 sym '': relocation 42 out of range
> (0x7facca74 -> 0xc2580734)
>
> This loc address  0x7facca74 is from the MOD_DATA memory based on mod
> mem allocation log above.
> I also print some extra info about the dstsect with
>     pr_err("dstsec name %s add %#lx size %u rel 0x%px rel offset %u\n",
>         strtab + dstsec->sh_name, dstsec->sh_addr, dstsec->sh_size,
> rel, rel->r_offset)
> and got this print out
>     dstsec name FUNCTION__.2 add 0x7fabd3c0 size 86912 rel 0xc33f931c
> rel offset 63156
>
> FUNCTION__.2 is in the rodata section from the symbol table.
>
> So looks like there is reference to ARM.exidx from the data/rodata
> section and that also need to be taken care of?

It looks like the ARM.exidx, which is now in .text (the first entry in
your table), contains a reference to code that is emitted in .rodata
rather than .text, and .rodata (mod_mem_type 2) is emitted in the
vmalloc space, and is too far from .text.

If FUNCTION__.2 is really a function, why is it in .rodata and not in .text=
?

In any case, the right way to solve this would be to ensure that all
module sections are allocated in the vmalloc space if they cannot all
fit into the module region. That is slightly tricky to implement
correctly, but we could add a heuristic based on the module's overall
size.

