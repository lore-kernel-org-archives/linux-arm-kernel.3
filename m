Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E75CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7GqYa0PZvs1lPvGIv2m/irBQcQ47+i8X7jammRGjl0=; b=nrN+vOlt3GqaksGo7qliK5EEYV
	aShMpLisPtv5pQXGribPYKxPKecSGA2ypl499HwFLh2cYFpPTGzbobyKeeOtQwcGqZ47wVzbMMh/W
	zDKKtpI6Gc36WlONf7Z0X9J1UHI5P6k2hgbYHxCOsUv2rcy77sSMCuqVHigBGeLmJQGzSNJQxB9Sp
	z3dhEMZunStcJU8+yMVkAYGlo6l8odtEZ3On5ARXHpNtR37T8CUHxWw4VHWCfLBFeDyI/VwG27Wtn
	nViA1pKR9QImAmkw5EL8F1TmjU2duMU7S5neWMUHI6zXFKvBKBtIgU1EU8k8MMq7oizoJ6xguaWUb
	V8id9yDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeDF-00000003ZS3-3kIk;
	Fri, 19 Sep 2025 16:43:57 +0000
Received: from mail-il1-x161.google.com ([2607:f8b0:4864:20::161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeDC-00000003ZRE-46MG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:43:56 +0000
Received: by mail-il1-x161.google.com with SMTP id e9e14a558f8ab-4248b07bb14so747055ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 09:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300233; x=1758905033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7GqYa0PZvs1lPvGIv2m/irBQcQ47+i8X7jammRGjl0=;
        b=E4kKhgV0DRlMVVu0PAfSWruXUpC4Dp0pmS0XaQ9gKyO1KF3tscUgHK+rCgTv0h8h8x
         MJMSMFc6DVhxUsfKtbkwZ2fsEohH2AjGvMlM5mAFbspSCNe5mkW/kZupAXpPzawM97E7
         KOFEHnq93e7xPZ+RhvwjyVUwv8b6SCDD7lWtywfrrpuw5fFLcS4h+1BUVGpqQdkdEJzT
         fYyvwNk7zOUmP76ao0OoFiR7EldT4p69W1xH5B6NOhxzZ8RV0UvtTbD/DvHJMAwXzAUc
         P1std9Zs54uoxRCWk0eKvo3xOVAXLz02AtNptnqeMtOoBGfxoAPVSMOZUze89/SbTf+R
         HgYw==
X-Gm-Message-State: AOJu0YyJGkVvuSyXV/HPK7khJiY/Idea/3fxBX59UN36oR5JWYPb1Ije
	xHganwlFfRYvZlmAJ5aikbAjS3LOd6Xzg/m6QL9BsQ1PdplfOcPEIuQ56IM92pNhmH+5Er+bJ1R
	bqjvJ60lRj+MdycAtVOlv+CiUtbdoc54Xh+XxoGzF/dEpoBj6GL/1HJXmeZoYEus2T+8EweBr39
	G2LnDbbtFj80rPe7OLEeP9VMozv8OogIqg2Aj6/o5hiskw0A/O7VF16WSF7U0GUozejYELTKUY7
	Q5sbojLWfY7Ale4ANBqpaH8OKa5j8Q=
X-Gm-Gg: ASbGncu1vf4boKKA9euRwc9+woV4HMVGop9Yie2E/yd65bYB6nV26bCoHcGgIAXXsxx
	irmwv3/0sfTBYxwOmxxDHAgZaZ2d6LDVKZQQvafN7diygG2SWBw7708Oq0ZO/nUFLvnblneH2e9
	RxKV7opqTu8ANnozNhuvit2Tphaz3ipXx3eH77YeSXT19tObPe3e3G0P2oCNOEOEIdTrRSTvFws
	Bxp3UkWijaOTf+b4suAkl52NOfc54uvKyJbFHW9HfDH39mGocSiAH1XEzsohpbD7D16ooTNwrGz
	6U+VAL4SQ6dN5+I2CUGkhXmZgMscU+S4z/3os4AZ8My2ss6bRB1HpclkKWWjn9VdmNDV/YXOO7r
	eO/f0Rl466l+Biw9fQwJvM9dTm34HBz0QVg4GsNrQN/CeTBmHzIjba2yFTgztpRNphykz4fwRMX
	+E
X-Google-Smtp-Source: AGHT+IF7ClyO3LslOIezRqygqJk4HP4YM7amGp+FAlNP3KYqkd8Hxlxxp0aXfncK8/Hhj094eA+61F5DhOaR
X-Received: by 2002:a05:6e02:17cd:b0:409:88ab:d51d with SMTP id e9e14a558f8ab-424819745fcmr79718575ab.18.1758300233412;
        Fri, 19 Sep 2025 09:43:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-53d510621fcsm307450173.27.2025.09.19.09.43.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Sep 2025 09:43:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-741d0a25635so5448887b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758300232; x=1758905032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7GqYa0PZvs1lPvGIv2m/irBQcQ47+i8X7jammRGjl0=;
        b=aK1771bcWl7F8uC/IqM5H66iO4qgvZz2bmmqYzuA0dt9mvCj3qrZoEoPMusQsufUCR
         6x6B8qqDr6ohrbcdS8OztKEmQ8n3MyXVlCkDnHba7lRh+jM0OzmCO1pGbVD+hs6eT25v
         IcOhfh807Dqtp0/Wgt6L3AUfoq8v9s5hadfKQ=
X-Received: by 2002:a05:690c:3:b0:71c:1754:2696 with SMTP id 00721157ae682-73d3cb97b5amr33416527b3.36.1758300232012;
        Fri, 19 Sep 2025 09:43:52 -0700 (PDT)
X-Received: by 2002:a05:690c:3:b0:71c:1754:2696 with SMTP id
 00721157ae682-73d3cb97b5amr33416177b3.36.1758300231402; Fri, 19 Sep 2025
 09:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
 <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
 <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com>
 <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
 <CAHi4H7EC_T67sTjh8kQbObR0NmREQXR1xmfX_7jophAdxEZQqQ@mail.gmail.com>
 <CAMj1kXFGtMGi428LLo0Go-spKxhEV6CLXat6nS8=VH8CdfRRLA@mail.gmail.com>
 <CAHi4H7Eife7_sKxTk_nhvv7StwiX=A6UTe8Cxe_w_p1oYfp2yA@mail.gmail.com>
 <CAHi4H7Fjk-X+2A+7-WF+i6zv=RHgbPeJ6aHZFxxaUmPPC=U3Kw@mail.gmail.com> <CAMj1kXG61XvxshYb1Mmq1XtY9fpbtF1Jb=1_5UOhi+2k+pJJ-w@mail.gmail.com>
In-Reply-To: <CAMj1kXG61XvxshYb1Mmq1XtY9fpbtF1Jb=1_5UOhi+2k+pJJ-w@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 19 Sep 2025 09:43:40 -0700
X-Gm-Features: AS18NWCuBUakj3PmPIiv3BH8cpQCVqpB_Zl-nQlaSgFEDTGu41Uo-fSld47ed5w
Message-ID: <CAHi4H7H-x7f4wMBrtBXKsxpm-oTXMWNtvV-Sz_DotrAnD_EiRg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250919_094355_059653_2129D30E 
X-CRM114-Status: GOOD (  66.06  )
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

On Fri, Sep 19, 2025 at 12:23=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Fri, 19 Sept 2025 at 08:58, William Zhang <william.zhang@broadcom.com>=
 wrote:
> >
> >
> >
> > On Thu, Sep 18, 2025 at 5:25=E2=80=AFPM William Zhang <william.zhang@br=
oadcom.com> wrote:
> >>
> >> On Thu, Sep 18, 2025 at 3:41=E2=80=AFPM Ard Biesheuvel <ardb@kernel.or=
g> wrote:
> >> >
> >> > On Thu, 18 Sept 2025 at 20:30, William Zhang <william.zhang@broadcom=
.com> wrote:
> >> > >
> >> > > On Wed, Sep 17, 2025 at 11:55=E2=80=AFPM Ard Biesheuvel <ardb@kern=
el.org> wrote:
> >> > > >
> >> > > > On Thu, 18 Sept 2025 at 04:11, William Zhang <william.zhang@broa=
dcom.com> wrote:
> >> > > > >
> >> > > > > On Wed, Sep 17, 2025 at 3:11=E2=80=AFAM Ard Biesheuvel <ardb@k=
ernel.org> wrote:
> >> > > > > >
> >> > > > > > On Wed, 17 Sept 2025 at 04:55, William Zhang <william.zhang@=
broadcom.com> wrote:
> >> > > > > > >
> >> > > > > > > Hi,
> >> > > > > > >
> >> > > > > > > We recently ran into the driver loading error resulting fr=
om
> >> > > > > > > apply_relocate function when it handle the R_ARM_PREL31 ca=
se in
> >> > > > > > > arch/arm/kernel/module.c:
> >> > > > > > > section 29 reloc 0 sym '': relocation 42 out of range (0xc=
2ab9be8 ->
> >> > > > > > > 0x7fad5998)
> >> > > > > > >
> >> > > > > > > After some dig, it seems this issue is caused by this chan=
ge:
> >> > > > > > > ac3b43283923 ("module: replace module_layout with module_m=
emory")
> >> > > > > > >
> >> > > > > > > I can see the necessity of this change but it seems it can=
 cause this
> >> > > > > > > kind of error under certain configurations. In our particu=
lar case, we
> >> > > > > > > use the 2G/2G split and our armv7 board has 1GB ddr memory=
. This means
> >> > > > > > > the kernel lower memory is from 0x8000-0000 to 0xc000-0000=
 and vmalloc
> >> > > > > > > range is from 0xc000-0000 and above.
> >> > > > > > >
> >> > > > > > > Before this module layout change, the module is loaded thr=
ough two
> >> > > > > > > layout sections: core and init. The driver in the test is =
fairly big
> >> > > > > > > and core module layout(text, data, rodata, sections) can n=
ot fit into
> >> > > > > > > the 16MB MODULE memory so both text, data and rodata fallb=
ack to
> >> > > > > > > vmalloc range. But with this change, it will text, data an=
d rodata one
> >> > > > > > > by one. So it ends up text in the MODULES memory but rodat=
a is
> >> > > > > > > allocated in VMALLOC and the distance is more than 1GB hen=
ce we
> >> > > > > > > believe it causes the above error when R_ARM_PREL31 reloca=
tion can not
> >> > > > > > > support more than 1GB offset.
> >> > > > > > >
> >> > > > > > > Since the default split is 1G/3G model, the distance betwe=
en vmalloc
> >> > > > > > > and module memory is always below 1G so we won't see this =
issue. But
> >> > > > > > > it seems to us the problem is real when use 2G/2G split.
> >> > > > > > >
> >> > > > > > > It appears the sections containing R_ARM_PREL31 in our dri=
ver are
> >> > > > > > > mostly in .ARM.exidx section. Some search shows this is us=
ed by ARM
> >> > > > > > > C++ exception handling but our driver does not use C++. Is=
 there a way
> >> > > > > > > to disable such section for R_ARM_PREL31? If not, is there=
 any
> >> > > > > > > workaround or fix to handle this run-time R_ARM_PREL31 rel=
ocation
> >> > > > > > > issue? The same apply_relocate function can handle R_ARM_J=
UMP24 out of
> >> > > > > > > range using PLTS. Can this apply to R_ARM_PREL31?
> >> > > > > > >
> >> > > > > >
> >> > > > > > Hi William,
> >> > > > > >
> >> > > > > > Two options come to mind:
> >> > > > > >
> >> > > > > > 1) use the frame pointer for unwind information instead of t=
he C++
> >> > > > > > exception metadata, i.e., enable CONFIG_UNWINDER_FRAME_POINT=
ER
> >> > > > > >
> >> > > > > > 2) ensure that ARM.exidx sections are allocated from the sam=
e bucket
> >> > > > > > as the .text sections they annotate, e.g., something like th=
e below
> >> > > > > >
> >> > > > > > --- a/arch/arm/kernel/module-plts.c
> >> > > > > > +++ b/arch/arm/kernel/module-plts.c
> >> > > > > > @@ -225,6 +225,11 @@
> >> > > > > >                         mod->arch.init.plt =3D s;
> >> > > > > >                 else if (s->sh_type =3D=3D SHT_SYMTAB)
> >> > > > > >                         syms =3D (Elf32_Sym *)s->sh_addr;
> >> > > > > > +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3=
G)
> >> > > > > > +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIN=
D)
> >> > > > > > +                       s->sh_flags |=3D SHF_EXECINSTR;
> >> > > > > > +#endif
> >> > > > > > +
> >> > > > > >         }
> >> > > > > >
> >> > > > > >         if (!mod->arch.core.plt || !mod->arch.init.plt) {
> >> > > > >
> >> > > > > Thank you Ard for your quick response!   We tried the option 1=
 and
> >> > > > > also tried with gcc -fno-unwind-tables option just for the dri=
ver,
> >> > > > > both do not generate any PRREL31 relocation and the driver can=
 load
> >> > > > > successfully.
> >> > > > > But we have some tool that needs to use the unwind tables so o=
ption 2
> >> > > > > will be the right direction for us.
> >> > > > >
> >> > > > > Applied your patch however it still reports the same error but=
 from
> >> > > > > different section as we confirmed all the ARM.exidx sections a=
re
> >> > > > > allocated from .text section.
> >> > > > >      mod_mem_type 0 execmem_type 0 base 0x7f3e8000 size 0x6eb0=
00
> >> > > > >      mod_mem_type 1 execmem_type 4 base 0x7fad4000 size 0x9e00=
0
> >> > > > >      mod_mem_type 2 execmem_type 4 base 0xc21a4000 size 0x3dd0=
00
> >> > > > >      mod_mem_type 4 execmem_type 0 base 0x7f1ae000 size 0x1000
> >> > > > >      mod_mem_type 5 execmem_type 4 base 0x7fb73000 size 0x10c0=
00
> >> > > > >      section 43 reloc 11360 sym '': relocation 42 out of range
> >> > > > > (0x7facca74 -> 0xc2580734)
> >> > > > >
> >> > > > > This loc address  0x7facca74 is from the MOD_DATA memory based=
 on mod
> >> > > > > mem allocation log above.
> >> > > > > I also print some extra info about the dstsect with
> >> > > > >     pr_err("dstsec name %s add %#lx size %u rel 0x%px rel offs=
et %u\n",
> >> > > > >         strtab + dstsec->sh_name, dstsec->sh_addr, dstsec->sh_=
size,
> >> > > > > rel, rel->r_offset)
> >> > > > > and got this print out
> >> > > > >     dstsec name FUNCTION__.2 add 0x7fabd3c0 size 86912 rel 0xc=
33f931c
> >> > > > > rel offset 63156
> >> > > > >
> >> > > > > FUNCTION__.2 is in the rodata section from the symbol table.
> >> > > > >
> >> > > > > So looks like there is reference to ARM.exidx from the data/ro=
data
> >> > > > > section and that also need to be taken care of?
> >> > > >
> >> > > > It looks like the ARM.exidx, which is now in .text (the first en=
try in
> >> > > > your table), contains a reference to code that is emitted in .ro=
data
> >> > > > rather than .text, and .rodata (mod_mem_type 2) is emitted in th=
e
> >> > > > vmalloc space, and is too far from .text.
> >> > > >
> >> > > This loc address 0x7facca74 is actually from the MOD_DATA mod_mem_=
type 1.
> >> > > Seems to me that it is some .data reference .rodata but how is thi=
s possible?
> >> > >
> >> >
> >> > How so? That MOD_DATA region starts at 0x7fad4000, no?
> >> >
> >> My bad.  Wrong math.. That address is in the MOD_TEXT so it totally
> >> makes sense now.
> >>
> >> > > > If FUNCTION__.2 is really a function, why is it in .rodata and n=
ot in .text?
> >> > > >
> >> > > Not that symbol is not a function. I believe it is probably some
> >> > > string or fixed data
> >> > > that the compiler generated for a function so it is in .rodata.  T=
here
> >> > > are many of
> >> > > these instances from the objdump:
> >> > >
> >> > > 00001058 l     O .rodata 0000000b __FUNCTION__.2
> >> > > 00001118 l     O .rodata 0000001b __FUNCTION__.2
> >> > > ...
> >> > >
> >> >
> >> > So one thing you might consider is to find a way to emit these into
> >> > .text as well, or any other section that has the 'x' bit set.
> >> Thanks we will look more into this and see if it is possible.
> >
> >
> > It turns out that section .ARM.extab also contains R_ARM_PREL31 relocat=
ion but this section has a regular type of PROGBITS.
> > Below is the dump of the headers of the .ko module with .ARM.extab keyw=
ord:
> >
> >   [27] .ARM.extab.t[...] PROGBITS        00000000 ac0e55 000000 00   A =
 0   0  1
> >   [31] .ARM.extab.i[...] PROGBITS        00000000 ac17da 000000 00   A =
 0   0  1
> >   [34] .ARM.extab.e[...] PROGBITS        00000000 ac17e4 000000 00   A =
 0   0  1
> >   [41] .ARM.extab        PROGBITS        00000000 ac1a60 000054 00   A =
 0   0  4
> > 000000fc  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> > 00000a5c  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> > 00003c24  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> > 0000479c  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> > 0000f6b4  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> > 00011ba4  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> > 000135cc  00001a2a R_ARM_PREL31      00000000   .ARM.extab
> >     17: 00000000     0 SECTION LOCAL  DEFAULT   27 .ARM.extab.text.[...=
]
> >     20: 00000000     0 SECTION LOCAL  DEFAULT   31 .ARM.extab.init.text
> >     22: 00000000     0 SECTION LOCAL  DEFAULT   34 .ARM.extab.exit.text
> >     26: 00000000     0 SECTION LOCAL  DEFAULT   41 .ARM.extab
> >
> > So with an extra check on this specific section,  the driver can load s=
uccessfully.   Can this be a real fix for this issue?
>
> Yes, that seems reasonable. Apparently, both ARM.exidx and ARM.extab
> need to live within -/+ 1 GiB of the .text sections they annotate, and
> this is a reasonable and unintrusive way to achieve that.
>
> > But if the section type is PROGBITS, why do we need to set the SHF_EXEC=
INSTR flag?  Shouldn't it be treated as instruction by default?
> >
>
> PROGBITS just means the section contents in the file need to be copied
> into the image in memory in order to initialize it, not that the
> contents are code.
>
> E.g., NOBITS means that the associated memory region needs to be
> zeroed. Other types exist that are not part of the static memory image
> at all (i.e., relocations, ELF notes, debug data, symbol tables, etc)
>
Got you. Since both .ARM.extab and .ARM.extidx are used for unwind info,  i=
t
seems reasonable to mark.ARM.extab as ELF_SECTION_UNWIND type too
then the change will be much cleaner.   But this will be the linker to solv=
e...

> >
> > --- a/arch/arm/kernel/module-plts.c
> > +++ b/arch/arm/kernel/module-plts.c
> > @@ -225,6 +225,12 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_=
Shdr *sechdrs,
> >                         mod->arch.init.plt =3D s;
> >                 else if (s->sh_type =3D=3D SHT_SYMTAB)
> >                         syms =3D (Elf32_Sym *)s->sh_addr;
> > +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> > +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND ||
> > +                                (strncmp(".ARM.extab", secstrings + s-=
>sh_name, 10) =3D=3D 0)) {
> > +                       s->sh_flags |=3D SHF_EXECINSTR;
> > +               }
> > +#endif
> >         }
> >
> >         if (!mod->arch.core.plt || !mod->arch.init.plt) {
> >
>
> You can send this out to the list as a patch. Please align the added
> line vertically with the 's' after 'else if(' and add
>
Will do.

> Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

