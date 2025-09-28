Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDCFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqTHhXwVE7zcVoXLasz2gwE4NJ3HaYyIKveg9EcoCMs=; b=LByf7is4yeha6lkPATld/iYXcC
	LNoNUiXDDbi+2Q5fckoVl/N8JieBHpjfX0mKxAQiwhxnSRyVSwpvkHKhldR3KOqBj7EeVb0TDTp6n
	S9Od7EN00JCQOfMVUWCSFbZCS4VwbbIUFC8+Pz8AGrXXvMCcr+VKCZWWAfL6YjOI4eQFdAWXd31cl
	bs7KrasU8lIn1fi/4ZmWrS7vnsPg8WpvBI3r2AJnBGV4hDPLwaRoYZXeUlqIpvNIJQ5z5YGCmckmB
	rC4i5QKJUuksq/2YoJOpyZFKj0K4qN8ZA/7DONvQPqyAdB49sdDG7HlNVSn0U8fjPyM9r47zqh0rj
	KSM0v7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2rp6-0000000FrA5-0PrA;
	Sun, 28 Sep 2025 13:52:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2rp3-0000000Fr9F-0tqj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 13:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E27B41A0D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 13:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC97C116D0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759067536;
	bh=vkQ3DR6shjQ3t6MMcpywS4EvZ4ogezUqQVNZ4GC2D04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mXr9uKyZS9M924m9O+0vEaRbTM2YgbHW2pDpmKClyuyuTvz2w0c2FfrNBYUBT+buf
	 ey2p4zw9VOVyZcBzBvcflPm3ECJ+EbiqEzhwovyFNAm3PNtPPWHFoU4CXJe+R0lH8l
	 QhMSc2eLl1+kCE7hR9kFsyJ1Om8IA8NuBO4rTfp8e/CAqX6GDtJKPv4PV+h6xywZRP
	 Ajsm8R498idztEdGNHPO9MdnAS2ggrYjgTJRvXcUihFO6duNBkLy9BTLUyCmEbI3LP
	 NqlJxtYzNZFdubalK+6/XZdoFKUSBWLv+tBvWMopRw+6f7Fon8GwEGfEbe/a1afT4+
	 5hOz88vnF7CSQ==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b35f6f43351so722982766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 06:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXELc+pDn8kEZiF8IgpFS7gjwXZONzFVVqPFRY14eKygl/HT7yp/GYVbnMoShmNszoiuR5pMBK+y6l6oFxEUexq@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfaditu5SqXVJFuhHoiuV6/1zhH0Ld7GGf8AI6VdXVPje6BspY
	j6L2YfW9hfoewk/7+iL/cuUTaGx14a93fx8TOkKZJMz88UGxDyAL+M50JJ208GuVrBd7Uwwocc+
	POouQ8LmK3WVF1ETNNIGk8bDqBhHQbOc=
X-Google-Smtp-Source: AGHT+IHZy8MJ+ejdxNUSrUhifjle4FzCaWD2U0zXbL3dW+OQL+t2D3+N0MZXhQRGFwgwVsrAa1mwtimPwbh8/cUxOJQ=
X-Received: by 2002:a17:907:7f0f:b0:aff:16eb:8b09 with SMTP id
 a640c23a62f3a-b34b6449b22mr1296630666b.5.1759067534547; Sun, 28 Sep 2025
 06:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
In-Reply-To: <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 28 Sep 2025 21:52:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
X-Gm-Features: AS18NWAQgrho2v1WBMze1SiIfjphByvTZGCUNAA2HMWHlRk0-R7aennr1EqafME
Message-ID: <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_065217_292933_2B208271 
X-CRM114-Status: GOOD (  30.36  )
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

Hi, Ard,

On Sun, Sep 28, 2025 at 9:42=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Sun, 28 Sept 2025 at 10:55, Tiezhu Yang <yangtiezhu@loongson.cn> wrote=
:
> >
> > When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
> > the following objtool warning on LoongArch:
> >
> >   vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
> >   falls through to next function __efistub_exit_boot_func()
> >
> > This is because efi_boot_kernel() doesn't end with a return instruction
> > or an unconditional jump, then objtool has determined that the function
> > can fall through into the next function.
> >
> > At the beginning, try to do something to make efi_boot_kernel() ends wi=
th
> > an unconditional jump instruction, but this modification seems not prop=
er.
> >
> > Since the efistub functions are useless for stack unwinder, they can be
> > ignored by objtool. After many discussions, no need to link libstub to
> > the vmlinux.o, only link libstub to the final vmlinux.
> >
>
> Please try keeping these changes confined to arch/loongarch. This
> problem does not exist on other architectures, and changing the way
> vmlinux is constructed might create other issues down the road.
ARM, RISC-V and LoongArch do things exactly in the same way. Now
LoongArch is the first of the three to enable objtool, so we meet the
problem first.

But yes, I also don't want to change the way of constructing vmlinux.
So I prefer the earliest way to fix this problem.
https://lore.kernel.org/loongarch/CAAhV-H7fRHGFVKV8HitRgmuoDPt5ODt--iSuV0Em=
eeUb9d5FNw@mail.gmail.com/T/#meef7411abd14f4c28c85e686614aa9211fccdca0

Huacai

>
> > Do the similar things for arm64 and riscv, otherwise there may be objto=
ol
> > warnings when arm64 and riscv support objtool, this is to make consiste=
nt
> > with the archs that use libstub.
> >
> > Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcu=
f5rcxzxxanzetd@6rrlpjnjsmuy/
> > Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >  Makefile                | 1 +
> >  arch/arm64/Makefile     | 5 ++++-
> >  arch/loongarch/Makefile | 5 ++++-
> >  arch/riscv/Makefile     | 5 ++++-
>
> >  scripts/link-vmlinux.sh | 5 ++---
> >  5 files changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 10355ecf32cb..8ba2e28ef3d1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1201,6 +1201,7 @@ KBUILD_VMLINUX_OBJS :=3D built-in.a $(patsubst %/=
, %/lib.a, $(filter %/, $(libs-y)
> >  KBUILD_VMLINUX_LIBS :=3D $(filter-out %/, $(libs-y))
> >
> >  export KBUILD_VMLINUX_LIBS
> > +export KBUILD_VMLINUX_LIBS_PRELINK
> >  export KBUILD_LDS          :=3D arch/$(SRCARCH)/kernel/vmlinux.lds
> >
> >  ifdef CONFIG_TRIM_UNUSED_KSYMS
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 73a10f65ce8b..038f37ef2143 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -156,7 +156,10 @@ KBUILD_CPPFLAGS +=3D -DKASAN_SHADOW_SCALE_SHIFT=3D=
$(KASAN_SHADOW_SCALE_SHIFT)
> >  KBUILD_AFLAGS +=3D -DKASAN_SHADOW_SCALE_SHIFT=3D$(KASAN_SHADOW_SCALE_S=
HIFT)
> >
> >  libs-y         :=3D arch/arm64/lib/ $(libs-y)
> > -libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmware/efi/libstub/l=
ib.a
> > +
> > +ifdef CONFIG_EFI_STUB
> > +KBUILD_VMLINUX_LIBS_PRELINK +=3D $(objtree)/drivers/firmware/efi/libst=
ub/lib.a
> > +endif
> >
> >  # Default target when executing plain make
> >  boot           :=3D arch/arm64/boot
> > diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> > index ae419e32f22e..4eb904c20718 100644
> > --- a/arch/loongarch/Makefile
> > +++ b/arch/loongarch/Makefile
> > @@ -169,7 +169,10 @@ CHECKFLAGS +=3D $(shell $(CC) $(KBUILD_CPPFLAGS) $=
(KBUILD_CFLAGS) -dM -E -x c /dev
> >  endif
> >
> >  libs-y +=3D arch/loongarch/lib/
> > -libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmware/efi/libstub/l=
ib.a
> > +
> > +ifdef CONFIG_EFI_STUB
> > +KBUILD_VMLINUX_LIBS_PRELINK +=3D $(objtree)/drivers/firmware/efi/libst=
ub/lib.a
> > +endif
> >
> >  drivers-y              +=3D arch/loongarch/crypto/
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index df57654a615e..cfd82b2c1bbf 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -173,7 +173,10 @@ boot-image-$(CONFIG_XIP_KERNEL)            :=3D xi=
pImage
> >  KBUILD_IMAGE                           :=3D $(boot)/$(boot-image-y)
> >
> >  libs-y +=3D arch/riscv/lib/
> > -libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmware/efi/libstub/l=
ib.a
> > +
> > +ifdef CONFIG_EFI_STUB
> > +KBUILD_VMLINUX_LIBS_PRELINK +=3D $(objtree)/drivers/firmware/efi/libst=
ub/lib.a
> > +endif
> >
> >  ifeq ($(KBUILD_EXTMOD),)
> >  ifeq ($(CONFIG_MMU),y)
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index 51367c2bfc21..b3cbff31d8a9 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -61,12 +61,11 @@ vmlinux_link()
> >         shift
> >
> >         if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_=
IBT; then
> > -               # Use vmlinux.o instead of performing the slow LTO link=
 again.
> >                 objs=3Dvmlinux.o
> > -               libs=3D
> > +               libs=3D"${KBUILD_VMLINUX_LIBS_PRELINK}"
> >         else
> >                 objs=3Dvmlinux.a
> > -               libs=3D"${KBUILD_VMLINUX_LIBS}"
> > +               libs=3D"${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PR=
ELINK}"
> >         fi
> >
> >         if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
> > --
> > 2.42.0
> >

