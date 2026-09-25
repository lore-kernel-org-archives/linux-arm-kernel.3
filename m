Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50268C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6NlhQyLBvAL6TKdL1Aq5LRNoXywD8yKGimzHFh9xgc=; b=m+Vi+wqaYpf2EqffVDnkJi59pI
	Fd798+OBGrnPggWZmbbYR7yB7WPETGv6GDwjyBrcXm6ojKUf65viyuYtxXsrkM8uSKfTS/DCtr3ZU
	Z8GNw1v+IqQTRSwbyqjEGJwB7kAxtVJiJ1/mQQRfAwBORSetj0Fww5rL+ZbBYle9Yq6THJnTV2dmi
	MDbi/D9T87awjBlDtnkn9D9x60jF7PpMqwZBTAYIeR3Pga6Qs8k5QOBqW+CM6CE5Zkp4ugyWIueSQ
	EC4aEYGfMeYfdrQHIOMJnsdvZQOYkKt5IpZXuoz0UTqdKoa5GjlEAIp9k4X8e2xIt/IPB5NmHBIj2
	F9yLRfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADuh-0000000EXVg-2its;
	Fri, 25 Sep 2026 21:57:03 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADue-0000000EXUz-23Z9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:57:02 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f63546c5so1113605f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 14:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373418; cv=none;
        d=google.com; s=arc-20260327;
        b=gX+F8CcBBxzLaOFY4YcP/mcgULi+kYfRfdMCZtooOTodMOQ6ctCxm0lNLWQS0XH0nM
         eRGHWj2UQ39TxEjw7aU7nWgxbdD13LVJ09UArNemczNUAG1ypwcPpBLqfn6gJ2/+yBt1
         N7og8Nn9Rl+m9JDQJ9uPbqTId9dEaZLHvdwvj698DcymNYQC6VQnHnKpvYSSR41wheYM
         a2c6w+9O2RI1mXrpmhyr41CwGGV2b1OYK855TkzlrLjWW0gfYBs5sWO9sjMrTTHzhT9y
         rmMLe7qCjcfgsrZVh0/1Cy86fGuOQxCae5Vpcy246DWRZVHDs7Ri/Ljrt6vWlmMHub8T
         +RBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G6NlhQyLBvAL6TKdL1Aq5LRNoXywD8yKGimzHFh9xgc=;
        fh=54HHMHd0ZbdQ9VrjyHMXwAErpc0hkxdeaqs9QOu0cqk=;
        b=WJSIlBlfWCaFrQKw5iBi+C10iKvTaBgWqIF9iwJueGxDPIQ6fQYzSyFLwqXxoVXZi6
         ff5p3v283zXsZdUgsRCfGdHwmLbaiNcznHTRg7/GRzeQHcTPJeic/HBHYuKDq8Zh0PrZ
         tNOpapLIfyvz4JIUz9az9qS2IuGejUveMQnXdoly+v3SuSSpjR68nZQkHJMW3rcmFHoc
         3fSt/V7yyCP1lwFAsBoKYBtcXjS5fhfRjwNZgwuy8uIkOrjCCw99BwpZR0yDwZBz0uwt
         A3dw+E3BEj/nCuy7CVGvSmDhLKz1ySez2q8tJZ83rtiuzMbFQB8s+6X7VNCntvc10LDp
         mTqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790373418; x=1790978218; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G6NlhQyLBvAL6TKdL1Aq5LRNoXywD8yKGimzHFh9xgc=;
        b=BgSolQmpBBLAdzqtozp0mSw8O1f1PhJT2GERwEjsx3r6K4kxe+wWF+KMGImLcKeMBS
         X3+b1yYjGeiQJ42esf0N6VwndOshaYDA8gHLI7fK1yv1RSuRToTmaAomhu1lsTpkcppF
         hPJ+HHw/SO06vVwi3jajeJLFNuMsdlhF4HYcYslr+FllqR3CtiW3i4z0VKmfdrI65ywZ
         TjyIrgZHWzD4SfUBjlQzar1jlIbIPFbGAcbwTU8gqfZup+GRhW3Wove3IOgUJYW+DhEZ
         OUqYFe5E0jNdx7Dwudru4LHMyWNB2aichnYcyO1z2aG7XNWfliqMQdjvjFbPsZfNpEIv
         O4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373418; x=1790978218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6NlhQyLBvAL6TKdL1Aq5LRNoXywD8yKGimzHFh9xgc=;
        b=cFX3BNOutAiVtZhh/UVti0mIwo5UwZTxgCo2RwwWAdJel8fYuVaq3NG7nqBBeMVdWl
         iI7wIJAY6kWX2pVv8CKo8eJbPPEgKgvmQNI9BoFq8IQhWi6eZTkGg3lf5bi1EF7A9e5D
         rdiJr1kU123xc8e6JX3HTd60MMITgXJ+wINrB2yCUmp0OEnLV6dccRh2zBdXOcaaqXAT
         2t2vsnYsNinR7XepgSodYKGYBmp/MN440R0i2uo6yIF3DwptfP8ilDCNJ2rBjIN2mfEi
         iFjkyap5Wp+sk8mvz3Y1mD4Iiue8nQRWDBgVMLtpU6Y8nwX3EBfyI0fm/H7/spfxTqG2
         OAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3T15vjDlZENcbqTk+Z6RWbFzyCpSBjLRHEvrqxcmGuq/QwI2YZEVwgibDriP0aOZTSGqdveWV1tcoYgB1Jovr@lists.infradead.org
X-Gm-Message-State: AFuF++lzDb/YP7VWvkvLTlfCbxyK/aHCeoe2Jf1iw8k2Zmb0b7Ky8zVj
	fqSRKn1M/YagUgwDILCJFiOgx2T144zvUXSYXCCpC/+qTMIFjPPe9Edx+9UeMzZQqAF4oCVnIpl
	wvnu0NV7ahx4NJcrKwWAlAC0G2W3JURhdrtPU4bwW
X-Gm-Gg: AYBFou1axaiMWrBQZWGxqJkVV5tEVoZLn+obM6q/MCze3oABQNXQyjou03Cy/Sn7lPh
	QXITii5bNn9/ZjJwC1yE9tpdHd6PWOS6tGhSKtpf6zje1CRB7gRnZeg7BwdufrcmoB/L2Uo+ZlG
	aDIFT7QgLpUetrAGhdjZmmDcukRFB9e7yXRNGKyLXRw1Mu7qamhzwN0pQT+KtX1y8MzWbAh3BvU
	ZnZ037WBnxzAgAibBR6DMivQyp4xiAp/giU7PNmfhlxUDs/Rih16QrLK4XviRiL8/fg5N34uqoX
	4TIkJETYPO1A9qq1B9AyowiXZbb6y/8c1A6YAuoBSDeQ4abElGjWx/lJYfQUkdZDEqXERQOcBJZ
	rQaaQVo8x8rbzuGpuckLCdAV0xyR3ooDrwSewv+n+ebvg+fy0DzBW+jU/kM8mMFZ5wuukcTNu5a
	crB2+0
X-Received: by 2002:a05:6000:288b:b0:485:1bcc:67f8 with SMTP id
 ffacd0b85a97d-4887171d8demr12695578f8f.13.1790373417936; Fri, 25 Sep 2026
 14:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
In-Reply-To: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Sep 2026 14:56:46 -0700
X-Gm-Features: AclHuK8SDWvgFgIHW9y7_70sxeUurbOgosEQfmvpDPf9DmnqXM-fPyBkhdpsidg
Message-ID: <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_145700_602187_BED1AF36 
X-CRM114-Status: GOOD (  37.11  )
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

On Fri, Sep 25, 2026 at 2:53=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 25, 2026 at 2:46=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > After a recent change in LLVM [1], builds with the random vDSO
> > implementation, such as PowerPC and RISC-V, fail when checking the vDSO=
:
> >
> >   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not s=
upported
> >   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not suppo=
rted
> >
> > memset() is now generated when zeroing params->reserved for some builds
> > because LLVM has an optimization (now run in more instances) that can
> > recognize at compile time when it is assigning a static value to a
> > contiguous area of memory and turn that into a call to memset(). Both
> > clang and GCC assume memset() is always available [2].
> >
> > clang provides a builtin, __builtin_memset_inline [3][4], that can be
> > used to ensure an external function call is not generated when zeroing
> > this memory. Use it when it is available.
> >
> > While GCC has no issues with the current code, it has generated memset(=
)
> > before, as seen in commit b7bad082e113 ("random: vDSO: avoid call to ou=
t
> > of line memset()"). GCC 14 provides '-finline-stringops=3Dmemset' [5][6=
]
> > with a similar guarantee to the clang builtin, so use it and
> > __builtin_memset() when available.
> >
> > If no option is available, provide a simple memset_inline() like the on=
e
> > from lib/string.c to avoid adding an ugly ifdef.
> >
> > Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3eedd=
359bdf00cb44b1c2439 [1]
> > Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#inde=
x-ffreestanding [2]
> > Link: https://github.com/llvm/llvm-project/commit/38637ee477541370a90b3=
7f149069d8e5c0c2efd [3]
> > Link: https://clang.llvm.org/docs/LanguageExtensions.html#guaranteed-in=
lined-memset [4]
> > Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D1ff6d9f7428b0=
668cd8ab0b3e3ab94f1d733124d [5]
> > Link: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-fi=
nline-stringops [6]
> > Suggested-by: "Jason A. Donenfeld" <Jason@zx2c4.com>
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Changes in v2:
> > - Switch approach entirely (Jason, Nick)
> >   - clang: use __builtin_memset_inline() to avoid external call
> >   - GCC 14+: use __builtin_memset + -finline-stringops=3Dmemset (hence =
the
> >     massive CC list increase)
> >   - GCC < 14: no issues currently but avoid ifdef with simple memset
> >     implementation
> > - Link to v1: https://patch.msgid.link/20260916-vdso-getrandom-avoid-me=
mset-llvm-24-v1-1-80a92f2e225a@kernel.org
> > ---
> >  arch/arm64/kernel/vdso/Makefile     |  2 +-
> >  arch/loongarch/vdso/Makefile        |  1 +
> >  arch/powerpc/kernel/vdso/Makefile   |  1 +
> >  arch/riscv/kernel/vdso/Makefile     |  1 +
> >  arch/s390/kernel/vdso/Makefile      |  1 +
> >  arch/x86/entry/vdso/vdso64/Makefile |  2 +-
> >  init/Kconfig                        |  7 +++++++
> >  lib/vdso/getrandom.c                | 19 +++++++++++++++++--
> >  8 files changed, 30 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/M=
akefile
> > index 7dec05dd33b7..f6619e1cb2ce 100644
> > --- a/arch/arm64/kernel/vdso/Makefile
> > +++ b/arch/arm64/kernel/vdso/Makefile
> > @@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC=
_FLAGS_SCS) \
> >                         $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
> >                         -Wmissing-prototypes -Wmissing-declarations
> >
> > -CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-table=
s
> > +CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-table=
s $(CONFIG_CC_OPT_INLINE_MEMSET)
> >
> >  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
> >  CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)
> > diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefil=
e
> > index 9c9181bb4071..0b84892d084b 100644
> > --- a/arch/loongarch/vdso/Makefile
> > +++ b/arch/loongarch/vdso/Makefile
> > @@ -16,6 +16,7 @@ ccflags-vdso :=3D \
> >         $(filter -m64,$(KBUILD_CFLAGS)) \
> >         $(filter -march=3D%,$(KBUILD_CFLAGS)) \
> >         $(filter -m%-float,$(KBUILD_CFLAGS)) \
> > +       $(CONFIG_CC_OPT_INLINE_MEMSET) \
> >         $(CLANG_FLAGS) \
> >         -D__VDSO__
> >
> > diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vd=
so/Makefile
> > index 368759f81708..0d1a49529885 100644
> > --- a/arch/powerpc/kernel/vdso/Makefile
> > +++ b/arch/powerpc/kernel/vdso/Makefile
> > @@ -43,6 +43,7 @@ ccflags-y :=3D -fno-common -fno-builtin -DBUILD_VDSO
> >  ccflags-y +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
> >  ccflags-y +=3D $(call cc-option, -fno-stack-protector)
> >  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> > +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> >  ccflags-y +=3D -ffreestanding -fasynchronous-unwind-tables
> >  ccflags-remove-y :=3D $(CC_FLAGS_FTRACE)
> >  ldflags-y :=3D -Wl,--hash-style=3Dboth -nostdlib -shared -z noexecstac=
k $(CLANG_FLAGS)
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/M=
akefile
> > index 8dbf2532a573..c023046a3fd7 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -36,6 +36,7 @@ endif
> >  ccflags-y :=3D -fno-stack-protector
> >  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> >  ccflags-y +=3D -fno-builtin
> > +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> >  ccflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> >  ccflags-y +=3D $(CFI_FULL)
> >  asflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> > diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/Mak=
efile
> > index 35c834b895ec..54bcf2984ca1 100644
> > --- a/arch/s390/kernel/vdso/Makefile
> > +++ b/arch/s390/kernel/vdso/Makefile
> > @@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO :=3D $(filter-out -munaligned-symb=
ols,$(KBUILD_CFLAGS_VDSO))
> >  KBUILD_CFLAGS_VDSO :=3D $(filter-out -fno-asynchronous-unwind-tables,$=
(KBUILD_CFLAGS_VDSO))
> >  KBUILD_CFLAGS_VDSO +=3D -fPIC -fno-common -fno-builtin -fasynchronous-=
unwind-tables
> >  KBUILD_CFLAGS_VDSO +=3D -fno-stack-protector $(DISABLE_KSTACK_ERASE)
> > +KBUILD_CFLAGS_VDSO +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
> >  ldflags-y :=3D -shared -soname=3Dlinux-vdso.so.1 \
> >              --hash-style=3Dboth --build-id=3Dsha1 \
> >              $(call ld-option, --eh-frame-hdr) -T
> > diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vdso/=
vdso64/Makefile
> > index 7c0790065b5e..c2353a065279 100644
> > --- a/arch/x86/entry/vdso/vdso64/Makefile
> > +++ b/arch/x86/entry/vdso/vdso64/Makefile
> > @@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)                       +=3D vs=
gx.o
> >  vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)    +=3D vfutex.o
> >
> >  # Compilation flags
> > -flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcmod=
el=3Dsmall
> > +flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcmod=
el=3Dsmall $(CONFIG_CC_OPT_INLINE_MEMSET)
> >
> >  # The location of this include matters!
> >  include $(src)/../common/Makefile.include
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 8583d9f06c52..ff3f8475dd2f 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -173,6 +173,13 @@ config CC_HAS_ALLOC_TOKEN
> >  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
> >         def_bool $(success,echo 'char tag[][4] __attribute__((__nonstri=
ng__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
> >
> > +config CC_HAS_OPT_INLINE_MEMSET
> > +       def_bool $(cc-option,-finline-stringops=3Dmemset)
> > +
> > +config CC_OPT_INLINE_MEMSET
> > +       string
> > +       default "-finline-stringops=3Dmemset" if CC_HAS_OPT_INLINE_MEMS=
ET
> > +
> >  config LD_CAN_USE_KEEP_IN_OVERLAY
> >         # ld.lld prior to 21.0.0 did not support KEEP within an overlay=
 description
> >         # https://github.com/llvm/llvm-project/pull/130661
> > diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> > index 2851afa9154f..f5cad5641985 100644
> > --- a/lib/vdso/getrandom.c
> > +++ b/lib/vdso/getrandom.c
> > @@ -29,6 +29,22 @@
> >         }                                                              =
         \
> >  } while (0)
> >
> > +#if __has_builtin(__builtin_memset_inline)
> > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, v=
alue, size)
> > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > +#define memset_inline(dst, value, size) __builtin_memset(dst, value, s=
ize)
> > +#else
> > +static inline void *memset_inline(void *dst, int value, size_t size)
> > +{
> > +       char *d =3D dst;
> > +
> > +       while (size--)
> > +               *d++ =3D value;
> > +
> > +       return d;
> > +}
> > +#endif
>
> Does this work?
> https://godbolt.org/z/Tx6EaGMfb

Hmmm...possibly.
https://godbolt.org/z/ec9rzd9Yf
I don't get it...

>
> (Sorry, I _should_ have replied to Jason on V1. I'm not ignoring him,
> just way behind on my code reviews. Sorry!)
>
> > +
> >  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
> >  {
> >         if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> > @@ -83,8 +99,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rn=
g_info, void *buffer, size_
> >                 params->size_of_opaque_state =3D sizeof(*state);
> >                 params->mmap_prot =3D PROT_READ | PROT_WRITE;
> >                 params->mmap_flags =3D MAP_DROPPABLE | MAP_ANONYMOUS;
> > -               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved); =
++i)
> > -                       params->reserved[i] =3D 0;
> > +               memset_inline(params->reserved, 0, sizeof(params->reser=
ved));
> >                 return 0;
> >         }
> >
> >
> > ---
> > base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> > change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
> >
> > Best regards,
> > --
> > Cheers,
> > Nathan
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers

