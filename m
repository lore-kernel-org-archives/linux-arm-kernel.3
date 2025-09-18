Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B82BCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 02:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUrcDxxCfv/aOV5VPN+3PWJa5NNQRUIMJXWE72k63vY=; b=o+rBAIXpl5NrrLYFdGg05T+N0d
	Sz3LDaerKTjMvgPa9vyAYbYWEd6Uj7UErDP3ybQPkPrh3c7ECc3UFwfqm01rEYRdx5A1NZaP4grv6
	PSBeDcO3Tzil59/irRkb+ayTW31wyWkSUdcPmEGTIdFxUYYbMK3jq4t/VyswLrX6qU4GLIcELjGjW
	19QCSoJYLrYtruwlIlK1GKk6wYxuMFUWKq9fOW8t4KXFuwsz9OxW4f2mM7r4GGva4Vfc36WdM9ZHd
	G1OhVvTJQtttIzFWaRPEzp9sajPCPsHhoEEzy/pBPIPSTCCkd+simL09nD/E19ZchQO8c2V684QWg
	6kzA9G9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz46x-0000000G0HE-3A8l;
	Thu, 18 Sep 2025 02:11:03 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz46u-0000000G0Fp-3g4n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 02:11:02 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-266fa7a0552so4317585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 19:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758161459; x=1758766259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUrcDxxCfv/aOV5VPN+3PWJa5NNQRUIMJXWE72k63vY=;
        b=eT0EXXDN6KBvZDwRIACvhChxaLVz583JpfXZQPcIcVqtQ7P9bTAnoS99JtRGZc2659
         FCoPjKYn6O7jltUN7Pr0lOYk4NNCsHCrACfoxOGH3+Ewj4Z26oiHO8SxKWuX+5XHqHRM
         KaLq3jNS/1iVx0NDdPmbDUKPI/LeJEng6qyCbRD14E76iROdjGRLFo5dvk6IqaVJ5eyD
         zbm0kGq8qO1ENndoTh6DdngJsddtIMi+R6HzxnpqzkjSIkRuu2hjvcDARUVRG6FGfr87
         vqGHabmMT0+EvyN8hwcaF80QHyowyvVJn7AaQbGGC3aspGTm/VBGHw7nyeVhevhsB0XJ
         rlJQ==
X-Gm-Message-State: AOJu0Yzv9TtyebJ/fiw2oU8vmKqdpl7wsSy0Xn6T/hkbzwUl5aXLycxa
	X8jg4OJAmiXTWacGhKmbIzjbNsPiacnQIgiw4bQkLRpuiATQqHI9rNOfsVFeh0OfLHRYx/OYlgg
	EvIgsNZHwRyzIBnZ7X2O1xeCKztIynF7SzA9VGxuiWiMxQx0kY2f2rIyz9eyULwPEontA3xyCWs
	65v4NBrkqOcP2p+cTxzxt7chUl2jSgGBAf9PgczDPKtR8dWKaPDCSMmIy2nw0UmHe5iX/q08pds
	KFmpkfQGDTdCZNyL8yLEmR9xNz8+s0=
X-Gm-Gg: ASbGncvGUE+uRgtW3YjD51WZ4+WmaW1j2haPA798cla4y9sdH+5GuArNC/tiS7Iz/sw
	nqz84UxJ2Ritb0F6FYWnctYHeMc+mfEmFKxutMH14zoI1h7xsRaHu5Or3tKjxCq+WNcMyWLpxGY
	4ZG8wHym580frt5yaiAZxS6ZS25vKMK+7KFeZETKpK/YTe59AiRFY5baOUoZyfEqT5VNVGsqWgt
	0CIXFMnnKP0qKXonheuHYnhFZpfLv80JmnqLzeNIpCNfYS/xYzj8HQ/a/+K5La7NjR0vyia1Z2W
	qn+cYTysfsPJRV1FGUq0xkDS9a0DDP0CcWUZkHawDyXoOfmYvLbX2G3dGmdYFqNzmgc9ayaymwA
	hS7Qycbn/oz0EhtX/khkZ9mG2xELDLmg+ZxFthyAxRrzZ9lX57g7j2KiL+XqFyMxJKGyMKUEchc
	MK03E=
X-Google-Smtp-Source: AGHT+IHbuAGxKeJHox5dXAt5UYERs/9WG/7RdwdCD3Wsj0aNTc0zpCWUC/KYTfjXLW5hdRzI2llRYB80CmJd
X-Received: by 2002:a17:903:17c6:b0:269:74bf:f19a with SMTP id d9443c01a7336-26974bff7ddmr34329025ad.11.1758161459443;
        Wed, 17 Sep 2025 19:10:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2698016828fsm969925ad.28.2025.09.17.19.10.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Sep 2025 19:10:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-633bca544e8so227667d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 19:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758161458; x=1758766258; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUrcDxxCfv/aOV5VPN+3PWJa5NNQRUIMJXWE72k63vY=;
        b=iEXHwi1CH1+np4+yt/GBjPIL3oKgw4FsMPuo1IxclYFtHPKeylvzVgxvp7aDl5HR2Y
         vMwqo8kBL2CoVTfjRgn9/WxhSmow5SuBH+atRXV3B6kfNOZliEVUeMTPvWy1xgi68TUj
         u7kElXh6V7o1iwfhDP6MSgtB4YaeVbjJjatwE=
X-Received: by 2002:a53:e945:0:b0:628:10ee:ab85 with SMTP id 956f58d0204a3-633b0637837mr2904927d50.3.1758161458118;
        Wed, 17 Sep 2025 19:10:58 -0700 (PDT)
X-Received: by 2002:a53:e945:0:b0:628:10ee:ab85 with SMTP id
 956f58d0204a3-633b0637837mr2904912d50.3.1758161457485; Wed, 17 Sep 2025
 19:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
 <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
In-Reply-To: <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Wed, 17 Sep 2025 19:10:47 -0700
X-Gm-Features: AS18NWCdzxOL839Zz2si502YE_GjpcTE_rbg3yE5Ev6-ckQ3PLZGbQiHFufhihs
Message-ID: <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250917_191100_946528_DD84D159 
X-CRM114-Status: GOOD (  38.06  )
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

On Wed, Sep 17, 2025 at 3:11=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Wed, 17 Sept 2025 at 04:55, William Zhang <william.zhang@broadcom.com>=
 wrote:
> >
> > Hi,
> >
> > We recently ran into the driver loading error resulting from
> > apply_relocate function when it handle the R_ARM_PREL31 case in
> > arch/arm/kernel/module.c:
> > section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 ->
> > 0x7fad5998)
> >
> > After some dig, it seems this issue is caused by this change:
> > ac3b43283923 ("module: replace module_layout with module_memory")
> >
> > I can see the necessity of this change but it seems it can cause this
> > kind of error under certain configurations. In our particular case, we
> > use the 2G/2G split and our armv7 board has 1GB ddr memory. This means
> > the kernel lower memory is from 0x8000-0000 to 0xc000-0000 and vmalloc
> > range is from 0xc000-0000 and above.
> >
> > Before this module layout change, the module is loaded through two
> > layout sections: core and init. The driver in the test is fairly big
> > and core module layout(text, data, rodata, sections) can not fit into
> > the 16MB MODULE memory so both text, data and rodata fallback to
> > vmalloc range. But with this change, it will text, data and rodata one
> > by one. So it ends up text in the MODULES memory but rodata is
> > allocated in VMALLOC and the distance is more than 1GB hence we
> > believe it causes the above error when R_ARM_PREL31 relocation can not
> > support more than 1GB offset.
> >
> > Since the default split is 1G/3G model, the distance between vmalloc
> > and module memory is always below 1G so we won't see this issue. But
> > it seems to us the problem is real when use 2G/2G split.
> >
> > It appears the sections containing R_ARM_PREL31 in our driver are
> > mostly in .ARM.exidx section. Some search shows this is used by ARM
> > C++ exception handling but our driver does not use C++. Is there a way
> > to disable such section for R_ARM_PREL31? If not, is there any
> > workaround or fix to handle this run-time R_ARM_PREL31 relocation
> > issue? The same apply_relocate function can handle R_ARM_JUMP24 out of
> > range using PLTS. Can this apply to R_ARM_PREL31?
> >
>
> Hi William,
>
> Two options come to mind:
>
> 1) use the frame pointer for unwind information instead of the C++
> exception metadata, i.e., enable CONFIG_UNWINDER_FRAME_POINTER
>
> 2) ensure that ARM.exidx sections are allocated from the same bucket
> as the .text sections they annotate, e.g., something like the below
>
> --- a/arch/arm/kernel/module-plts.c
> +++ b/arch/arm/kernel/module-plts.c
> @@ -225,6 +225,11 @@
>                         mod->arch.init.plt =3D s;
>                 else if (s->sh_type =3D=3D SHT_SYMTAB)
>                         syms =3D (Elf32_Sym *)s->sh_addr;
> +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND)
> +                       s->sh_flags |=3D SHF_EXECINSTR;
> +#endif
> +
>         }
>
>         if (!mod->arch.core.plt || !mod->arch.init.plt) {

Thank you Ard for your quick response!   We tried the option 1 and
also tried with gcc -fno-unwind-tables option just for the driver,
both do not generate any PRREL31 relocation and the driver can load
successfully.
But we have some tool that needs to use the unwind tables so option 2
will be the right direction for us.

Applied your patch however it still reports the same error but from
different section as we confirmed all the ARM.exidx sections are
allocated from .text section.
     mod_mem_type 0 execmem_type 0 base 0x7f3e8000 size 0x6eb000
     mod_mem_type 1 execmem_type 4 base 0x7fad4000 size 0x9e000
     mod_mem_type 2 execmem_type 4 base 0xc21a4000 size 0x3dd000
     mod_mem_type 4 execmem_type 0 base 0x7f1ae000 size 0x1000
     mod_mem_type 5 execmem_type 4 base 0x7fb73000 size 0x10c000
     section 43 reloc 11360 sym '': relocation 42 out of range
(0x7facca74 -> 0xc2580734)

This loc address  0x7facca74 is from the MOD_DATA memory based on mod
mem allocation log above.
I also print some extra info about the dstsect with
    pr_err("dstsec name %s add %#lx size %u rel 0x%px rel offset %u\n",
        strtab + dstsec->sh_name, dstsec->sh_addr, dstsec->sh_size,
rel, rel->r_offset)
and got this print out
    dstsec name FUNCTION__.2 add 0x7fabd3c0 size 86912 rel 0xc33f931c
rel offset 63156

FUNCTION__.2 is in the rodata section from the symbol table.

So looks like there is reference to ARM.exidx from the data/rodata
section and that also need to be taken care of?

