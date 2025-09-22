Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07790CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maAo7eOe8o8YutYShD5omzBkIATahAgKdVnzIjAE84c=; b=AVYG8etIlAQwAiGO+WZSfhHwsg
	a97MdHwQvVTEZKKtUKdVWhtPawfSyNewcOs4aIwn02zsr0ApGoStIjlXqBuY+qHw9CRXtLGyl558L
	PFr1GGrdxVBOylfxx+X1ialRi99hNltL293UmCGnbXCBRwFTXJiVdP0Kvzb/gqBIE4lFunferOiOR
	2kzGma6+fIF+cGpuz+CLhlp6IDwgRRqm+6IhmcNimDiuQfxKLCwA9IDUYAifhZ/9lg+ZtPMBtVnXk
	9zAPIdfb9thnz80aWDBrREoBb8OYwbbr8SF+xkGzKIi3vaCl77Z4qHQZKrLKtMW6XJgx9jONJmkp1
	wwFtrpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jVa-0000000AzuY-3GYS;
	Mon, 22 Sep 2025 16:35:22 +0000
Received: from mail-qv1-xf61.google.com ([2607:f8b0:4864:20::f61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jVZ-0000000Aztq-0B42
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:35:22 +0000
Received: by mail-qv1-xf61.google.com with SMTP id 6a1803df08f44-76b8fd4ba2cso36434826d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 09:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758558919; x=1759163719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maAo7eOe8o8YutYShD5omzBkIATahAgKdVnzIjAE84c=;
        b=aoRWvTgM3phT2DrfYtGPwR3y8uFV+J7SQLCf9JNLGFrB2xHY6oxXe4eSrOyLIq7rBV
         ciNwdMC+pbtpZXRMdRA70zpoJCsCBxjpPtm1OX2hcZC/ZxmHmn7rYWHBXMJnp3LJFERP
         XSEZqB0MkU2J259IFJd63qro0L/MDwfzVjG3aImaOvcJXrISSEfY5ytI2OPxWGcu+L9q
         tBc7Ox4FAmqtR1PP3kk7bAj72orR4tfnmKJzESJaSB/W2CnqDUQJISoc7bXw6gdS1M7F
         IKjdI0D9+T9iA4Y96xaf+IoAxYzEw08g/bgs+26UN4C/QFxSFVNoesRW2TTYoq50RqBw
         qkfg==
X-Gm-Message-State: AOJu0YxclFKxn3SbeGbPTBSKCWzIOufdfjsY1MvYf/+UWjLM5qfnrHMc
	na3Bg1+1/3KKobIYUSNxcmKk4Owxyp6TY4yjKydBPHXGm/9RyJiall3/6P6tcvrZXNI0WqRzSP6
	7B6TJQy+DMvkqlAPFHo45PSqdfOiN8M3gH3d0MHUqQSa4odr9mbb538O7DxSdm9DVTKH/l1vatj
	t6eJRwRzMVOMZksINxx18QWf09oHboRpt+Qv1G6UD3lh4vW7rJ/cDTU9/SGOGLCMZSeiLuIBR1t
	rFPszMTwc+mV1LPYs2LATXoQzKkNKQ=
X-Gm-Gg: ASbGncsWdM4HhsuuuUi7x9CxS0uM840mFKwgwM05FqjcMgdwomiKFIz6YwZw2jZzQJY
	Byz6stRjEonwG+BmqgJMcarnwbsDWgX5UFFxgoFRS0gjE438FPAq8DEIkxN2Qr4F8qJ/96R5Ndj
	/9aD4sgag1V+b9ogBRnbqfnhz/2cXW/khOdj0VtsXZbDKqICppcyPEeHOl3lV3yZi48MFnpn/Yg
	mOhm+grO4SwV7+ArVRJgSjWhZdQD7Hx6vet6CIpzEpVWuXWOf9TGWuIjLoQwVQSyOxZIc0UZj0R
	M/ASAR++y0qU0hbVpESOZCiyqdIcla7AmDyDLsIkz1XGRyQVmJ7N5WJAwd5VjRcK3RsqYGOcNee
	LL9Ecvj4ZK6IAqLjje2GizMtHZkzzvIiVdqWMnleFxYYajfXE14jnliwinWk9ViUnFJwQjwWiOa
	dBtjE=
X-Google-Smtp-Source: AGHT+IEAYH5AKlYjnbbZiBjNHQ9Q9tWCX/5qepDB5Ko31M7Y+2cL0YDG7Xhdl9FTe0jiY13F6Q7AkRjthc7g
X-Received: by 2002:a05:6214:ac1:b0:78d:9cbb:2f58 with SMTP id 6a1803df08f44-7991cbb1a7fmr164786216d6.52.1758558918186;
        Mon, 22 Sep 2025 09:35:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-7934ee8bab1sm8097176d6.22.2025.09.22.09.35.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Sep 2025 09:35:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-73cc7f3ec4aso15173697b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 09:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758558917; x=1759163717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maAo7eOe8o8YutYShD5omzBkIATahAgKdVnzIjAE84c=;
        b=DmSK9/VPXbZ50C03cqrvaaT8qhcuicnBAosE+9IuPdvS8TV7dKJ2vk0iJwKNRct4nO
         KDedBNgttCiMHw/bLcJ8SXruFJn0435AQf4SCHUbrRYq67g0TY5qP8t1j5ndQt15Q/7H
         /LVTyT4xYUQi2OrbfdKsZuk3DeXlXb18DYpA0=
X-Received: by 2002:a05:690c:4c03:b0:721:3bd0:d5c0 with SMTP id 00721157ae682-73d222a3e42mr118281727b3.9.1758558917396;
        Mon, 22 Sep 2025 09:35:17 -0700 (PDT)
X-Received: by 2002:a05:690c:4c03:b0:721:3bd0:d5c0 with SMTP id
 00721157ae682-73d222a3e42mr118281367b3.9.1758558916916; Mon, 22 Sep 2025
 09:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250920021024.847323-1-william.zhang@broadcom.com> <CAMm8Nh0oGokMDFt8ghomX1_SA3sbfv_xJVUXd2V1XeBA0OR08g@mail.gmail.com>
In-Reply-To: <CAMm8Nh0oGokMDFt8ghomX1_SA3sbfv_xJVUXd2V1XeBA0OR08g@mail.gmail.com>
From: William Zhang <william.zhang@broadcom.com>
Date: Mon, 22 Sep 2025 09:35:05 -0700
X-Gm-Features: AS18NWDDY16I_X8qmh0EBU9sMd591UP-PTflwsPGfCYMoggseyLlr2EinoIFL5E
Message-ID: <CAHi4H7HeEdmOx1xUDj81hY8qAeshFKjH52HyQhNATMYwwSbNhw@mail.gmail.com>
Subject: Re: [PATCH] ARM: module: fix unwind section relocation out of range error
To: Kursad Oney <kursad.oney@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, song@kernel.org, 
	linus.walleij@linaro.org, florian.fainelli@broadcom.com, ardb@kernel.org, 
	anand.gore@broadcom.com, 
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_093521_126101_CC678A22 
X-CRM114-Status: GOOD (  25.99  )
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

Hi Kursad,

On Mon, Sep 22, 2025 at 6:13=E2=80=AFAM Kursad Oney <kursad.oney@broadcom.c=
om> wrote:
>
> Hi William,
>
>
> On Fri, Sep 19, 2025 at 10:10=E2=80=AFPM William Zhang
> <william.zhang@broadcom.com> wrote:
> >
> > In an armv7 system that uses non-3G/1G split and with more than 512MB
> > physical memory, driver load may fail with following error:
> >    section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 ->
> > 0x7fad5998)
> >
> > This happens when relocation R_ARM_PREL31 from the unwind section
> > .ARM.extab and .ARM.exidx are allocated from the VMALLOC space while
> > .text section is from MODULES_VADDR space. It exceeds the +/-1GB
> > relocation requirement of R_ARM_PREL31 hence triggers the error.
> >
> > The fix is to mark .ARM.extab and .ARM.exidx sections as executable so
> > they can be allocated within .text section and always meet range
> > requirement.
>
> Not "within" .text, but "along with" or "in close proximity to".
Yeah that is more accurate.  Will update.

>
> >
> > Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: William Zhang <william.zhang@broadcom.com>
>
> I think a Fixes tag might be appropriate?
Yes, the change ac3b43283923 ("module: replace module_layout with
module_memory") does expose this issue. But I won't say that change
itself has a bug and it is more of an enhancement that this arm module
code has to handle different memory allocation scenarios.
>
> >
> > ---
> >
> >  arch/arm/kernel/module-plts.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm/kernel/module-plts.c b/arch/arm/kernel/module-plt=
s.c
> > index 354ce16d83cb..5f5bf5e63bd6 100644
> > --- a/arch/arm/kernel/module-plts.c
> > +++ b/arch/arm/kernel/module-plts.c
> > @@ -225,6 +225,18 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_=
Shdr *sechdrs,
> >                         mod->arch.init.plt =3D s;
> >                 else if (s->sh_type =3D=3D SHT_SYMTAB)
> >                         syms =3D (Elf32_Sym *)s->sh_addr;
> > +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> > +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND ||
> > +                        (strncmp(".ARM.extab", secstrings + s->sh_name=
, 10) =3D=3D 0)) {
> > +                       /*
> > +                        * To avoid the possible relocation out of rang=
e issue for
> > +                        * R_ARM_PREL31, mark unwind section .ARM.extab=
 and .ARM.exidx as
> > +                        * executable so they will be allocated within =
.text section to meet
> > +                        * +/-1GB range requirement of the R_ARM_PREL31=
 relocation
> > +                        */
> > +                       s->sh_flags |=3D SHF_EXECINSTR;
> > +               }
> > +#endif
> >         }
> >
> >         if (!mod->arch.core.plt || !mod->arch.init.plt) {
> > --
> > 2.43.7
> >

