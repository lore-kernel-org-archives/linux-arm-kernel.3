Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC97CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 18:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZAKNp022iYWYUn1tVW6EB8V8K3jVWZ9pR5ZR8boxc0=; b=eOGsExU7b8PtuwmSD/q9OoDmvI
	iba+ywqEoPvkImzBPhQfH/uzhvMVljDksl2kwWli2DsKCAsgdPGLWvzsdybRnECH+4Dn1A276PpMS
	cWw20/MHoUh3328jVfGhqBF1NrQXbyW7qYMl0fbKoz8nIkA6RP5OBZMZZ4wLUXOUcEe31fvZDlY18
	HoLPHDtGeRXkQW+NiTwympx/gUywTy5PLpLX3vf9TFF1uc7lYIp0/N+aGTR9us1FHMZ25jIN7XgdC
	Y+dzoGhYAJjT2aQ9Y4KL2BiqS3fdXecdqyLS399jebSZflBgzmCdXdzu5tiZmGV7+297/xGwLlBZQ
	+00F3AJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJOl-00000000rxr-0nuZ;
	Thu, 18 Sep 2025 18:30:27 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJOi-00000000rxQ-3v0k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 18:30:26 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-32e74ae0306so1888100a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758220223; x=1758825023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZAKNp022iYWYUn1tVW6EB8V8K3jVWZ9pR5ZR8boxc0=;
        b=vvGyLKLhDr8mu7SZ3CFv6hsVgbp9i+MYAuCX3Dsvfri/4kY6SpZfC/9RpMuC6EKIGx
         vJcyjH9C0gJhWr2U5NTh3ei1xn1lSLrWIC68OySNzd6+6ku5Ijycr6bDWM40nPbcYZ1v
         21FDYTyLmAR5l2e9Fd5AzJngiXrSYxrmxWvF8jNnNYBMQBP3eJdVZGsYAEsczWqiavvF
         ysefROZT66b47lyzaNU4XaWAZQhe50lF485qpzBGtUmRtzl9kWqrOaejLvudawW8EdEk
         /70qzfhM2GApeNQxLgAsncuV2v82VnY/c0gqcKx5yWIV+1QVaC1JxuU7MdPlabuA+iXP
         byDg==
X-Gm-Message-State: AOJu0Yz1Ekff4OXNLEgrl9+8ccKsVwq3DDbJJjz2akJWpLHmHje9WPV3
	YzOeOeQKjgDt98v0droriyibzdMQII5xVzQh7JkvIyRmImRYWA4bzn29r3yeX83I2MxQ9GiKDSm
	GREGcRAhEw9MxA+7D8kRzSYwbESDDreS3lk2hKsUL8MbJyycEOnEQCAL6ho/+XVObrL75x6+QK0
	BpgQXsPL4QHbvOyOWcU5WTHki0eM51cn11d3qejdI42/EsRrVOd2It053yKeEem8AI9graYmq2d
	Oo20T8TnbasUdnImnhOA5kJstDYx1A=
X-Gm-Gg: ASbGncu9vpu326A9f8CWIB9MChXKqQIZQYJ+hkXnR6wLVRQMr0RDyQcqDO2qXbAAd/t
	rq38gGa5qYiRuFCreGLCVt5QsrtFJRww6Mw3SCf/nxy90RoBG8/NiMHhU+wJ2swQ+NuQyOa/WEk
	k9Ih3HIxRbqqL5pAuacx4ta2uW8VKK4zVnhgeWZl6DrzX0ewY6bLWEsGbXnS2aV0WQdx872kg3f
	U+HygpCjAt0iBNMlNje8ZRlpesuj4eq7YI3aXQkCbH9XlalQtSgfQpmDzralBz+6FFJHcebqQr9
	ni8rVKyu3AkOhtHxvA5rxH7IpVqaKPMx1TZhqKUkHbjOHOypdMY5UPoGiHdJOXLjz/vwgRs/tHD
	otYQB+oTxw/zdFeVdW0dt/8rXt/ph9ZV8S20H1RBxf+BYSWfBNBlZIAFGtneuDAEJ66oe2HoRSJ
	jTjOM=
X-Google-Smtp-Source: AGHT+IEBjhjTG5k0XmpAKOL8vXi9kpPJgmAg4a6qJQg3VKy42jfwd59Qvt9kITa99UP3lzqiow8ROnVmwJxq
X-Received: by 2002:a17:90b:2587:b0:330:55de:8c20 with SMTP id 98e67ed59e1d1-3305c591be5mr5462378a91.2.1758220223307;
        Thu, 18 Sep 2025 11:30:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-119.dlp.protect.broadcom.com. [144.49.247.119])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-b54ff3d6c17sm202865a12.15.2025.09.18.11.30.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:30:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-72ab54910e9so20446217b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758220222; x=1758825022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZAKNp022iYWYUn1tVW6EB8V8K3jVWZ9pR5ZR8boxc0=;
        b=CWCBTtjtHj7G1SHdLk7dVOS0ci68Y70VIRc2JB82Rf1sBEauRLhIViDTUGA++2rC0D
         BSMBqgtmKaRie/sEv9hc9aMEbj1IgjfkhhxjiKZY6enOYVWsm55/cHXP6rmUU7DSEuSw
         er/g5u782TGwrzTSLqiikArkpgqi/5aXe2iBU=
X-Received: by 2002:a05:690c:7013:b0:735:1a95:37c3 with SMTP id 00721157ae682-73cd21be5d3mr7407517b3.25.1758220221645;
        Thu, 18 Sep 2025 11:30:21 -0700 (PDT)
X-Received: by 2002:a05:690c:7013:b0:735:1a95:37c3 with SMTP id
 00721157ae682-73cd21be5d3mr7407057b3.25.1758220221073; Thu, 18 Sep 2025
 11:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
 <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
 <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com> <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Thu, 18 Sep 2025 11:30:09 -0700
X-Gm-Features: AS18NWDVMBl0MPrQBvQUwHOX4Orhn507Vbb8k07uD2wed_dYtMFN88ObUQoXJ3g
Message-ID: <CAHi4H7EC_T67sTjh8kQbObR0NmREQXR1xmfX_7jophAdxEZQqQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250918_113025_028863_113D85E1 
X-CRM114-Status: GOOD (  57.64  )
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

On Wed, Sep 17, 2025 at 11:55=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Thu, 18 Sept 2025 at 04:11, William Zhang <william.zhang@broadcom.com>=
 wrote:
> >
> > On Wed, Sep 17, 2025 at 3:11=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > >
> > > On Wed, 17 Sept 2025 at 04:55, William Zhang <william.zhang@broadcom.=
com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > We recently ran into the driver loading error resulting from
> > > > apply_relocate function when it handle the R_ARM_PREL31 case in
> > > > arch/arm/kernel/module.c:
> > > > section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 -=
>
> > > > 0x7fad5998)
> > > >
> > > > After some dig, it seems this issue is caused by this change:
> > > > ac3b43283923 ("module: replace module_layout with module_memory")
> > > >
> > > > I can see the necessity of this change but it seems it can cause th=
is
> > > > kind of error under certain configurations. In our particular case,=
 we
> > > > use the 2G/2G split and our armv7 board has 1GB ddr memory. This me=
ans
> > > > the kernel lower memory is from 0x8000-0000 to 0xc000-0000 and vmal=
loc
> > > > range is from 0xc000-0000 and above.
> > > >
> > > > Before this module layout change, the module is loaded through two
> > > > layout sections: core and init. The driver in the test is fairly bi=
g
> > > > and core module layout(text, data, rodata, sections) can not fit in=
to
> > > > the 16MB MODULE memory so both text, data and rodata fallback to
> > > > vmalloc range. But with this change, it will text, data and rodata =
one
> > > > by one. So it ends up text in the MODULES memory but rodata is
> > > > allocated in VMALLOC and the distance is more than 1GB hence we
> > > > believe it causes the above error when R_ARM_PREL31 relocation can =
not
> > > > support more than 1GB offset.
> > > >
> > > > Since the default split is 1G/3G model, the distance between vmallo=
c
> > > > and module memory is always below 1G so we won't see this issue. Bu=
t
> > > > it seems to us the problem is real when use 2G/2G split.
> > > >
> > > > It appears the sections containing R_ARM_PREL31 in our driver are
> > > > mostly in .ARM.exidx section. Some search shows this is used by ARM
> > > > C++ exception handling but our driver does not use C++. Is there a =
way
> > > > to disable such section for R_ARM_PREL31? If not, is there any
> > > > workaround or fix to handle this run-time R_ARM_PREL31 relocation
> > > > issue? The same apply_relocate function can handle R_ARM_JUMP24 out=
 of
> > > > range using PLTS. Can this apply to R_ARM_PREL31?
> > > >
> > >
> > > Hi William,
> > >
> > > Two options come to mind:
> > >
> > > 1) use the frame pointer for unwind information instead of the C++
> > > exception metadata, i.e., enable CONFIG_UNWINDER_FRAME_POINTER
> > >
> > > 2) ensure that ARM.exidx sections are allocated from the same bucket
> > > as the .text sections they annotate, e.g., something like the below
> > >
> > > --- a/arch/arm/kernel/module-plts.c
> > > +++ b/arch/arm/kernel/module-plts.c
> > > @@ -225,6 +225,11 @@
> > >                         mod->arch.init.plt =3D s;
> > >                 else if (s->sh_type =3D=3D SHT_SYMTAB)
> > >                         syms =3D (Elf32_Sym *)s->sh_addr;
> > > +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> > > +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND)
> > > +                       s->sh_flags |=3D SHF_EXECINSTR;
> > > +#endif
> > > +
> > >         }
> > >
> > >         if (!mod->arch.core.plt || !mod->arch.init.plt) {
> >
> > Thank you Ard for your quick response!   We tried the option 1 and
> > also tried with gcc -fno-unwind-tables option just for the driver,
> > both do not generate any PRREL31 relocation and the driver can load
> > successfully.
> > But we have some tool that needs to use the unwind tables so option 2
> > will be the right direction for us.
> >
> > Applied your patch however it still reports the same error but from
> > different section as we confirmed all the ARM.exidx sections are
> > allocated from .text section.
> >      mod_mem_type 0 execmem_type 0 base 0x7f3e8000 size 0x6eb000
> >      mod_mem_type 1 execmem_type 4 base 0x7fad4000 size 0x9e000
> >      mod_mem_type 2 execmem_type 4 base 0xc21a4000 size 0x3dd000
> >      mod_mem_type 4 execmem_type 0 base 0x7f1ae000 size 0x1000
> >      mod_mem_type 5 execmem_type 4 base 0x7fb73000 size 0x10c000
> >      section 43 reloc 11360 sym '': relocation 42 out of range
> > (0x7facca74 -> 0xc2580734)
> >
> > This loc address  0x7facca74 is from the MOD_DATA memory based on mod
> > mem allocation log above.
> > I also print some extra info about the dstsect with
> >     pr_err("dstsec name %s add %#lx size %u rel 0x%px rel offset %u\n",
> >         strtab + dstsec->sh_name, dstsec->sh_addr, dstsec->sh_size,
> > rel, rel->r_offset)
> > and got this print out
> >     dstsec name FUNCTION__.2 add 0x7fabd3c0 size 86912 rel 0xc33f931c
> > rel offset 63156
> >
> > FUNCTION__.2 is in the rodata section from the symbol table.
> >
> > So looks like there is reference to ARM.exidx from the data/rodata
> > section and that also need to be taken care of?
>
> It looks like the ARM.exidx, which is now in .text (the first entry in
> your table), contains a reference to code that is emitted in .rodata
> rather than .text, and .rodata (mod_mem_type 2) is emitted in the
> vmalloc space, and is too far from .text.
>
This loc address 0x7facca74 is actually from the MOD_DATA mod_mem_type 1.
Seems to me that it is some .data reference .rodata but how is this possibl=
e?

> If FUNCTION__.2 is really a function, why is it in .rodata and not in .te=
xt?
>
Not that symbol is not a function. I believe it is probably some
string or fixed data
that the compiler generated for a function so it is in .rodata.  There
are many of
these instances from the objdump:

00001058 l     O .rodata 0000000b __FUNCTION__.2
00001118 l     O .rodata 0000001b __FUNCTION__.2
...

> In any case, the right way to solve this would be to ensure that all
> module sections are allocated in the vmalloc space if they cannot all
> fit into the module region. That is slightly tricky to implement
> correctly, but we could add a heuristic based on the module's overall
> size.
This will be tricky.  The module_memory_alloc and execmem is meant to be
generic and not arm specific.  Not sure such change is needed for other
platforms. The main issue is these APIs do not have a way to force the
allocation from vmalloc.  I did have a hack to add new execmem types
EXECMEM_MODULE_TEXT_VM/DATA_VM and add execmem range
for them in execmem_info from execmem_arch_setup to always allocate
from vmalloc but I hope there will be a better solution and ideally still i=
n the
arm specific place where we handle the PREL31 case.

