Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FC9CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 00:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZQj7LpQcF/ioVlmlDp52zh38BkeFWe7VJBWuSaoj5g=; b=y+msY+HILuiUkWsgGO0uA18nsc
	pwUGmpq24FTS1u6Hnb8y8NByo8/zpcHebZ0ma1lrEeviOUUN2/7C48M5mCHl5CnLSYGIMesIXmc7z
	IZA/HoURIn34BvCwFWlre1KG6QRSvafVK0rCkt1N1fPSyjT5xztnnVLGGzUADxbwjvQ+DsEGW27Le
	T1FbSOFPzHxvSMQkqvZnuFvCyBNd5zQaPM7e/oltOdLH7biAArvy1ZaeudiqwIJrY+DLYQBOpwU8U
	QWlO9A1mrxAXzoE8129mZp7SugVMGoWbs+lvIAM/PFEbi8ciB3Vq5jzDeuJecahZthgg5M31qzjKE
	kKavM7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOwN-00000001WBA-3naV;
	Fri, 19 Sep 2025 00:25:31 +0000
Received: from mail-il1-x162.google.com ([2607:f8b0:4864:20::162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOwL-00000001WAj-2PmB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 00:25:30 +0000
Received: by mail-il1-x162.google.com with SMTP id e9e14a558f8ab-423fe622487so17107835ab.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 17:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758241528; x=1758846328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZQj7LpQcF/ioVlmlDp52zh38BkeFWe7VJBWuSaoj5g=;
        b=cjmXDZwt9dMDSuJail1VKg4DS/6sS9pYQQj1shh5xzGfoCVboUdi57b3R0wNvBSwTF
         cNJAojpTlBuaEUAm1ys/+l0hFDsaiD3lVyBi/5NsNappg38hsZjiIKoBhNIBgJ5MqQi6
         0qybwOt+90PaYcc42+DAd7TYlfojzGvhFcnUSOBhzxC7Pl/MF8YJIwU0RAm01i5mdG14
         Hy4bp9b8BIjZyBVn+AsCfLkW7uwJyVa9qCZ+NZmZ8KSvN0/nDiaH+o/kLPsLol/VuZCC
         snFraMYr26ezHtj3FjlEXzTVwsy3/9VTJaxsiLz7TIys/FO9J/Pg+L0s6065Isiq34V7
         81eg==
X-Gm-Message-State: AOJu0YyUzV4/A0Bz+cm8fYo/Jtnp0vbBkVAztW7wviNJv6WHh17gpwIV
	ekQiEOyYvxI1yiDK3e/OQvyPQbLrYyaalMWfe18ky6eQAFuwvvw3yxboZNhDvvAkaLZPDSJ7v9N
	lA8nwerv0eGumCIQ9KBDCbAgHfDUkcwIAsW6hOlGIlZxeHDmI8fbJ9CDxT7ddSrewJB2WLK8kjm
	5HHebK/6SHLikgrv0NvS+mOEcX3OQpVBhrCSfK6Qf9louAcnQXp7TxObvVy40yvsqsvrGGQug9I
	EkXV3cZKQrnVnJxNDDZBgjPI/EKTuo=
X-Gm-Gg: ASbGncswVY6QGAvtpeFbeKwtI9JVYJCGexKRVBgcBmWBQBPGhxgLw1sf6ghhGLKZ6vp
	tkvJSWOZzkRtERSUoglpMs9M1o+yxOUnqq+aLWgNzo1M+AmHy00nc9td74hKjmz+UWMYeiBfYC0
	/C0eBEzAOSQXcdr+jz/dQRasiOPsb9+OlexXHrKBMzOAbEFfQ/uIpuJ+1dqklCT29h6jgfE38UQ
	kZCKXhKjGIu+zJx+KUGktYm1SUPQ7XIl0LU3fOIlLe5n0NhkqORpxts7/mZ/JHuMZB6j3P/dcsJ
	p8G5z5DnqRwe+wkQ2/2cXFdKM/ClOnbIZAyr6XRkNuYk8myF33io+ykR5bralBm/BM/v7fohueA
	rh01S6As2vAx2Kn+wwO9FkE8qb+mf412CW7/67VKr5tgD5c89MxwYrYXxLtXawZHMzxskkeyatF
	yDtR0=
X-Google-Smtp-Source: AGHT+IHJk/6QJg329KgdpHc5wClj3diJH4CneGBk5gLPpGsDJkHFq9N5Ns9Mc9GdxjAf5Mdbd/Tp5xjSkFLV
X-Received: by 2002:a05:6e02:1fe7:b0:423:fcd6:5488 with SMTP id e9e14a558f8ab-42481927122mr27417965ab.12.1758241528430;
        Thu, 18 Sep 2025 17:25:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-119.dlp.protect.broadcom.com. [144.49.247.119])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-53d39a178edsm255675173.6.2025.09.18.17.25.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Sep 2025 17:25:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-606b7cad6fbso851407d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758241527; x=1758846327; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZQj7LpQcF/ioVlmlDp52zh38BkeFWe7VJBWuSaoj5g=;
        b=C5X3FKIh+WrXKyaqH4obDmYUgDsPhpemFsf2wNiwysxt3M8CpDF3c0FB8MVV10dBzp
         3fvHiLJG1eI58J1rHovUqGEX5vL4voH+IGkzkFdpzvSTxCtWzZJMXz/ALrd82eVF4IiE
         8mCLCvHn7WUZizph61n8jsnYfpR5XCm1/pjYw=
X-Received: by 2002:a05:690e:4285:20b0:62b:686:e226 with SMTP id 956f58d0204a3-634779efda4mr1268614d50.10.1758241527353;
        Thu, 18 Sep 2025 17:25:27 -0700 (PDT)
X-Received: by 2002:a05:690e:4285:20b0:62b:686:e226 with SMTP id
 956f58d0204a3-634779efda4mr1268605d50.10.1758241526917; Thu, 18 Sep 2025
 17:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
 <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
 <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com>
 <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
 <CAHi4H7EC_T67sTjh8kQbObR0NmREQXR1xmfX_7jophAdxEZQqQ@mail.gmail.com> <CAMj1kXFGtMGi428LLo0Go-spKxhEV6CLXat6nS8=VH8CdfRRLA@mail.gmail.com>
In-Reply-To: <CAMj1kXFGtMGi428LLo0Go-spKxhEV6CLXat6nS8=VH8CdfRRLA@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Thu, 18 Sep 2025 17:25:16 -0700
X-Gm-Features: AS18NWAc_HuIfhVLc9tEbRSbEGkEB8Ejh8_66qfteKWnJbYhoN1gP4asCQYFS9Q
Message-ID: <CAHi4H7Eife7_sKxTk_nhvv7StwiX=A6UTe8Cxe_w_p1oYfp2yA@mail.gmail.com>
Subject: Re: armv7 R_ARM_PREL31 relocation out of range error when loading module
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linux ARM List <linux-arm-kernel@lists.infradead.org>, 
	Kursad Oney <kursad.oney@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Wenchung Su <wenchung.su@broadcom.com>, 
	"song@kernel.org" <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_172529_674385_72F51210 
X-CRM114-Status: GOOD (  57.75  )
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

On Thu, Sep 18, 2025 at 3:41=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Thu, 18 Sept 2025 at 20:30, William Zhang <william.zhang@broadcom.com>=
 wrote:
> >
> > On Wed, Sep 17, 2025 at 11:55=E2=80=AFPM Ard Biesheuvel <ardb@kernel.or=
g> wrote:
> > >
> > > On Thu, 18 Sept 2025 at 04:11, William Zhang <william.zhang@broadcom.=
com> wrote:
> > > >
> > > > On Wed, Sep 17, 2025 at 3:11=E2=80=AFAM Ard Biesheuvel <ardb@kernel=
.org> wrote:
> > > > >
> > > > > On Wed, 17 Sept 2025 at 04:55, William Zhang <william.zhang@broad=
com.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > We recently ran into the driver loading error resulting from
> > > > > > apply_relocate function when it handle the R_ARM_PREL31 case in
> > > > > > arch/arm/kernel/module.c:
> > > > > > section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9b=
e8 ->
> > > > > > 0x7fad5998)
> > > > > >
> > > > > > After some dig, it seems this issue is caused by this change:
> > > > > > ac3b43283923 ("module: replace module_layout with module_memory=
")
> > > > > >
> > > > > > I can see the necessity of this change but it seems it can caus=
e this
> > > > > > kind of error under certain configurations. In our particular c=
ase, we
> > > > > > use the 2G/2G split and our armv7 board has 1GB ddr memory. Thi=
s means
> > > > > > the kernel lower memory is from 0x8000-0000 to 0xc000-0000 and =
vmalloc
> > > > > > range is from 0xc000-0000 and above.
> > > > > >
> > > > > > Before this module layout change, the module is loaded through =
two
> > > > > > layout sections: core and init. The driver in the test is fairl=
y big
> > > > > > and core module layout(text, data, rodata, sections) can not fi=
t into
> > > > > > the 16MB MODULE memory so both text, data and rodata fallback t=
o
> > > > > > vmalloc range. But with this change, it will text, data and rod=
ata one
> > > > > > by one. So it ends up text in the MODULES memory but rodata is
> > > > > > allocated in VMALLOC and the distance is more than 1GB hence we
> > > > > > believe it causes the above error when R_ARM_PREL31 relocation =
can not
> > > > > > support more than 1GB offset.
> > > > > >
> > > > > > Since the default split is 1G/3G model, the distance between vm=
alloc
> > > > > > and module memory is always below 1G so we won't see this issue=
. But
> > > > > > it seems to us the problem is real when use 2G/2G split.
> > > > > >
> > > > > > It appears the sections containing R_ARM_PREL31 in our driver a=
re
> > > > > > mostly in .ARM.exidx section. Some search shows this is used by=
 ARM
> > > > > > C++ exception handling but our driver does not use C++. Is ther=
e a way
> > > > > > to disable such section for R_ARM_PREL31? If not, is there any
> > > > > > workaround or fix to handle this run-time R_ARM_PREL31 relocati=
on
> > > > > > issue? The same apply_relocate function can handle R_ARM_JUMP24=
 out of
> > > > > > range using PLTS. Can this apply to R_ARM_PREL31?
> > > > > >
> > > > >
> > > > > Hi William,
> > > > >
> > > > > Two options come to mind:
> > > > >
> > > > > 1) use the frame pointer for unwind information instead of the C+=
+
> > > > > exception metadata, i.e., enable CONFIG_UNWINDER_FRAME_POINTER
> > > > >
> > > > > 2) ensure that ARM.exidx sections are allocated from the same buc=
ket
> > > > > as the .text sections they annotate, e.g., something like the bel=
ow
> > > > >
> > > > > --- a/arch/arm/kernel/module-plts.c
> > > > > +++ b/arch/arm/kernel/module-plts.c
> > > > > @@ -225,6 +225,11 @@
> > > > >                         mod->arch.init.plt =3D s;
> > > > >                 else if (s->sh_type =3D=3D SHT_SYMTAB)
> > > > >                         syms =3D (Elf32_Sym *)s->sh_addr;
> > > > > +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> > > > > +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND)
> > > > > +                       s->sh_flags |=3D SHF_EXECINSTR;
> > > > > +#endif
> > > > > +
> > > > >         }
> > > > >
> > > > >         if (!mod->arch.core.plt || !mod->arch.init.plt) {
> > > >
> > > > Thank you Ard for your quick response!   We tried the option 1 and
> > > > also tried with gcc -fno-unwind-tables option just for the driver,
> > > > both do not generate any PRREL31 relocation and the driver can load
> > > > successfully.
> > > > But we have some tool that needs to use the unwind tables so option=
 2
> > > > will be the right direction for us.
> > > >
> > > > Applied your patch however it still reports the same error but from
> > > > different section as we confirmed all the ARM.exidx sections are
> > > > allocated from .text section.
> > > >      mod_mem_type 0 execmem_type 0 base 0x7f3e8000 size 0x6eb000
> > > >      mod_mem_type 1 execmem_type 4 base 0x7fad4000 size 0x9e000
> > > >      mod_mem_type 2 execmem_type 4 base 0xc21a4000 size 0x3dd000
> > > >      mod_mem_type 4 execmem_type 0 base 0x7f1ae000 size 0x1000
> > > >      mod_mem_type 5 execmem_type 4 base 0x7fb73000 size 0x10c000
> > > >      section 43 reloc 11360 sym '': relocation 42 out of range
> > > > (0x7facca74 -> 0xc2580734)
> > > >
> > > > This loc address  0x7facca74 is from the MOD_DATA memory based on m=
od
> > > > mem allocation log above.
> > > > I also print some extra info about the dstsect with
> > > >     pr_err("dstsec name %s add %#lx size %u rel 0x%px rel offset %u=
\n",
> > > >         strtab + dstsec->sh_name, dstsec->sh_addr, dstsec->sh_size,
> > > > rel, rel->r_offset)
> > > > and got this print out
> > > >     dstsec name FUNCTION__.2 add 0x7fabd3c0 size 86912 rel 0xc33f93=
1c
> > > > rel offset 63156
> > > >
> > > > FUNCTION__.2 is in the rodata section from the symbol table.
> > > >
> > > > So looks like there is reference to ARM.exidx from the data/rodata
> > > > section and that also need to be taken care of?
> > >
> > > It looks like the ARM.exidx, which is now in .text (the first entry i=
n
> > > your table), contains a reference to code that is emitted in .rodata
> > > rather than .text, and .rodata (mod_mem_type 2) is emitted in the
> > > vmalloc space, and is too far from .text.
> > >
> > This loc address 0x7facca74 is actually from the MOD_DATA mod_mem_type =
1.
> > Seems to me that it is some .data reference .rodata but how is this pos=
sible?
> >
>
> How so? That MOD_DATA region starts at 0x7fad4000, no?
>
My bad.  Wrong math.. That address is in the MOD_TEXT so it totally
makes sense now.

> > > If FUNCTION__.2 is really a function, why is it in .rodata and not in=
 .text?
> > >
> > Not that symbol is not a function. I believe it is probably some
> > string or fixed data
> > that the compiler generated for a function so it is in .rodata.  There
> > are many of
> > these instances from the objdump:
> >
> > 00001058 l     O .rodata 0000000b __FUNCTION__.2
> > 00001118 l     O .rodata 0000001b __FUNCTION__.2
> > ...
> >
>
> So one thing you might consider is to find a way to emit these into
> .text as well, or any other section that has the 'x' bit set.
Thanks we will look more into this and see if it is possible.

