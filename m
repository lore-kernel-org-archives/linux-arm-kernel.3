Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504D7C9832E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVV1KtWyTLSLHpIl6BWB4AgM90d4cWInAt7fjY5duR4=; b=f+UFT7iKhjcEQ7TeowoGxY7oPC
	9HfMgb8IqhZYHfpK4+2kNmbuL80ndabkE3XbdR8QLNkdpqVOAlwVU7hinmk+u2pAox8P+BfsqlTSi
	bE/1TCUtHiEbkUlYMHJpfVGKzlYT8UaSulNobZ7JyfbsCivL2KuYiRL7gy+icQzEIBUVxFwIDQ0Xy
	7Ru2dtDTQqw4oIubj0BzrRba/Wrjp3bKtL/nD+yHbe/fjEyfvzCYuPm9OuL3/9YAptC4SPSYJpE7O
	ES8s0wH3IqMG2u14C76rnqXq6VXOLyZI9mTAMzOl2fD2n1QKfiM3maUvpoH7wUvYrW0iIKLwMd/W6
	l/KQC/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADrF-0000000EXDv-4C32;
	Fri, 25 Sep 2026 21:53:30 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADrC-0000000EXD7-48Nf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:53:28 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-48439feca17so970724f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 14:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373204; cv=none;
        d=google.com; s=arc-20260327;
        b=iATbFeulhXuFLclkZ0ewoQPsoEcWxeVklIdvFIxFwvxZ4Y2kw/WMC3tRHCTjwNkUvE
         bgOGwBaGgk2XLRJpcwsspphbpvGIMWlcFx1LuttFZ/xvDFWn4GU08Aja6L/1BwVT37c9
         S5rVoeqg/UnPyYVM3CdfzGqlab++DO7+urA1hFzgOnir/o8sJUritXg96iZjp+taVKKn
         AWe8z0FXVspAo9S7CV2kYFXUXHJIBSrO72EnTDLCw8AwbKyrnRdenaoHwUJ6cvmiSo+J
         oCts57d0GO22U72zBKhCnkv+up00/KdbNiED+3iKulfAqfEJpfU9X57okPMKI8PuMdfj
         Zw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dVV1KtWyTLSLHpIl6BWB4AgM90d4cWInAt7fjY5duR4=;
        fh=ywZuWI8ARRAF94n26C2caKzl1UEcQ4E/9N3BI6hPUcE=;
        b=eyg/aznEOZYFuvnt5knt4Q0acKwW6Bnq21tBZwAhV7t9ejyI7xjIKKbn/PV1fpeRsV
         +e23A2FoyPZIkaqWl2i8qZpb4sLI4A8hETAiVxci209UxzUwnZS01VXdqcy0Wo4jwbW9
         IcXsPOBTfe6UMNmdCOQ+bp5apgmhVCMoaMLsWVqXvgqMZ68h9r84y/6Qc42g88WtVrQ4
         PzeBMgI81fFxpsMnA88THVWMWWS6cVi2En9pPbDFBQ8TevDPNMdy8RTkZECQm4j/GA2i
         i/42i8Cv08VSV4hIEIwURy9F/T/moYD4issNUstywnBIvPM1k+G4W9NTrSKLX3tSVP8A
         OV2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790373204; x=1790978004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dVV1KtWyTLSLHpIl6BWB4AgM90d4cWInAt7fjY5duR4=;
        b=qsiSkajhZVI37l7qokn/IGRxt/mvegbvfq0F/fVBKQyl2T79imEH2m4uQb9atDwrb/
         V8/7Vfuo7B3AX+T4pkCeM8oA9CZmrw6k9hCtioy26wsJoUYIHcJ9JXUYH/E2Q8fCTpAK
         Jnq5axxZ22UfLONUY+DXaOiwSKCktxq9gNqMdOivTovs3z/3IFUl0MYwePWIrroriobK
         kaNK14sxG4pwhK2/zkX2EmqUPv/9Y3GbNsRbIQ1YMGSien3nx5MRbawlkmMKpR5jBsYT
         7UHc4QeFuaFc/RGjG5EvKap1mjtjhjqfjTBvnzGAcW03pIVxB5Vk3J2J1mGel9K8vsFx
         O74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373204; x=1790978004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVV1KtWyTLSLHpIl6BWB4AgM90d4cWInAt7fjY5duR4=;
        b=Jew9ikJgT/bsnQENvDdKwnB3GxSf2pkzjCR2hoSFt0NT9d6SD1R0tEOcHElzWg/XmC
         HwFcuuH1pwELbpRRkYuvHoWa/2L23487YTwMQBHGfFxeZJ2CnsxUq0tA1QexaU6VHVoX
         6ggkUSrrqX4ZKsHowsZDyWIohAnVhbCrNIsx4F5OMbxxM1W86+VXZgIxrBGlMPHms0Gs
         hVZ8vyF/MlycuAqI5Ay60NFTSTfcTp/w4xM2i/IO8dN5N9gwlu0/HiFw+88ZeqM5RN0m
         Q5eI2MUVmnMx34Ym9pN6KHIG2/0pQfLW3ol2NuWWZ4eeXO3js382Vd7yQAmthUAh6A8n
         bvtg==
X-Forwarded-Encrypted: i=1; AKwUvBxHVdXjPi9DBvPz2P7SAHMkV68jy3yAfO0DtruOx5SMhdvKQs7KJXLgqlHFdttM9uUEmmE21i204Z2VFpt+Bqxf@lists.infradead.org
X-Gm-Message-State: AFuF++nkgmOUt8EG87XXA9fCMwxG5xjLTHKD/sUEBqXDZG7OmMtIKmcu
	sz7zzz7NJ7G+VwqljmwiUWsztj9QSmFNLOGsiS4v5xWxkhOZwL239qnVj5b4PIXvDYyZSlLN3FJ
	hVKNGFm+nP8QPXqgLhuwjANCRukgY1j8HYCCydZB0
X-Gm-Gg: AYBFou0VqaLTGejFgOezN/k3JE3/1MJJ/EyKP34JML8RQQjsh+UaSYwC0q+aVhtNmUI
	SW2MP+GFAgcX9URXw+jSLEU3kROIymtQ1741S+YYSno+okxPhBff3y3hB5hfqmpTo/K51BeAv20
	auYQTXJ+QRyx5jsTldXV2MBrrTIJaatX64yPLGiJDgLgd2mDnRKvIxABUBHRaSHNWHSdd9a5BiR
	ZY5od+MJ8Rc0ENi7xj5B/zHk1JEhdylQo30h565dfmdMEcvb3yZJtTBHpqeJszQyvJSvDe4dN/h
	0Gz7XlYaaOJgB/QxQD0lvWwHnzTZ42ER9YWDDuIV3b11FpWxng3fMu4demZSHMtK5nbHi261aIt
	SV7o0uHaKFuaYwu0UUAlUXHJvbVRUofzXNqyL9kx5GnuF+UvWnCpUtaDSNlFOQ3+sHGH3Tg==
X-Received: by 2002:a5d:59c9:0:b0:488:8232:d16e with SMTP id
 ffacd0b85a97d-4888232d398mr4215448f8f.45.1790373203169; Fri, 25 Sep 2026
 14:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
In-Reply-To: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Sep 2026 14:53:11 -0700
X-Gm-Features: AclHuK_Ft21uXDV_iMRtDzCCVqU8DQdapOlwM8X7gfzinGS8ws8kiw9mFw7TZZY
Message-ID: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260925_145327_092503_02951EB7 
X-CRM114-Status: GOOD (  33.52  )
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

On Fri, Sep 25, 2026 at 2:46=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After a recent change in LLVM [1], builds with the random vDSO
> implementation, such as PowerPC and RISC-V, fail when checking the vDSO:
>
>   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not sup=
ported
>   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not support=
ed
>
> memset() is now generated when zeroing params->reserved for some builds
> because LLVM has an optimization (now run in more instances) that can
> recognize at compile time when it is assigning a static value to a
> contiguous area of memory and turn that into a call to memset(). Both
> clang and GCC assume memset() is always available [2].
>
> clang provides a builtin, __builtin_memset_inline [3][4], that can be
> used to ensure an external function call is not generated when zeroing
> this memory. Use it when it is available.
>
> While GCC has no issues with the current code, it has generated memset()
> before, as seen in commit b7bad082e113 ("random: vDSO: avoid call to out
> of line memset()"). GCC 14 provides '-finline-stringops=3Dmemset' [5][6]
> with a similar guarantee to the clang builtin, so use it and
> __builtin_memset() when available.
>
> If no option is available, provide a simple memset_inline() like the one
> from lib/string.c to avoid adding an ugly ifdef.
>
> Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3eedd35=
9bdf00cb44b1c2439 [1]
> Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#index-=
ffreestanding [2]
> Link: https://github.com/llvm/llvm-project/commit/38637ee477541370a90b37f=
149069d8e5c0c2efd [3]
> Link: https://clang.llvm.org/docs/LanguageExtensions.html#guaranteed-inli=
ned-memset [4]
> Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D1ff6d9f7428b066=
8cd8ab0b3e3ab94f1d733124d [5]
> Link: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-finl=
ine-stringops [6]
> Suggested-by: "Jason A. Donenfeld" <Jason@zx2c4.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Switch approach entirely (Jason, Nick)
>   - clang: use __builtin_memset_inline() to avoid external call
>   - GCC 14+: use __builtin_memset + -finline-stringops=3Dmemset (hence th=
e
>     massive CC list increase)
>   - GCC < 14: no issues currently but avoid ifdef with simple memset
>     implementation
> - Link to v1: https://patch.msgid.link/20260916-vdso-getrandom-avoid-mems=
et-llvm-24-v1-1-80a92f2e225a@kernel.org
> ---
>  arch/arm64/kernel/vdso/Makefile     |  2 +-
>  arch/loongarch/vdso/Makefile        |  1 +
>  arch/powerpc/kernel/vdso/Makefile   |  1 +
>  arch/riscv/kernel/vdso/Makefile     |  1 +
>  arch/s390/kernel/vdso/Makefile      |  1 +
>  arch/x86/entry/vdso/vdso64/Makefile |  2 +-
>  init/Kconfig                        |  7 +++++++
>  lib/vdso/getrandom.c                | 19 +++++++++++++++++--
>  8 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Mak=
efile
> index 7dec05dd33b7..f6619e1cb2ce 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC_F=
LAGS_SCS) \
>                         $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
>                         -Wmissing-prototypes -Wmissing-declarations
>
> -CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables
> +CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables =
$(CONFIG_CC_OPT_INLINE_MEMSET)
>
>  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 9c9181bb4071..0b84892d084b 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -16,6 +16,7 @@ ccflags-vdso :=3D \
>         $(filter -m64,$(KBUILD_CFLAGS)) \
>         $(filter -march=3D%,$(KBUILD_CFLAGS)) \
>         $(filter -m%-float,$(KBUILD_CFLAGS)) \
> +       $(CONFIG_CC_OPT_INLINE_MEMSET) \
>         $(CLANG_FLAGS) \
>         -D__VDSO__
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso=
/Makefile
> index 368759f81708..0d1a49529885 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -43,6 +43,7 @@ ccflags-y :=3D -fno-common -fno-builtin -DBUILD_VDSO
>  ccflags-y +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
>  ccflags-y +=3D $(call cc-option, -fno-stack-protector)
>  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
>  ccflags-y +=3D -ffreestanding -fasynchronous-unwind-tables
>  ccflags-remove-y :=3D $(CC_FLAGS_FTRACE)
>  ldflags-y :=3D -Wl,--hash-style=3Dboth -nostdlib -shared -z noexecstack =
$(CLANG_FLAGS)
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Mak=
efile
> index 8dbf2532a573..c023046a3fd7 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -36,6 +36,7 @@ endif
>  ccflags-y :=3D -fno-stack-protector
>  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
>  ccflags-y +=3D -fno-builtin
> +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
>  ccflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
>  ccflags-y +=3D $(CFI_FULL)
>  asflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/Makef=
ile
> index 35c834b895ec..54bcf2984ca1 100644
> --- a/arch/s390/kernel/vdso/Makefile
> +++ b/arch/s390/kernel/vdso/Makefile
> @@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO :=3D $(filter-out -munaligned-symbol=
s,$(KBUILD_CFLAGS_VDSO))
>  KBUILD_CFLAGS_VDSO :=3D $(filter-out -fno-asynchronous-unwind-tables,$(K=
BUILD_CFLAGS_VDSO))
>  KBUILD_CFLAGS_VDSO +=3D -fPIC -fno-common -fno-builtin -fasynchronous-un=
wind-tables
>  KBUILD_CFLAGS_VDSO +=3D -fno-stack-protector $(DISABLE_KSTACK_ERASE)
> +KBUILD_CFLAGS_VDSO +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
>  ldflags-y :=3D -shared -soname=3Dlinux-vdso.so.1 \
>              --hash-style=3Dboth --build-id=3Dsha1 \
>              $(call ld-option, --eh-frame-hdr) -T
> diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vdso/vd=
so64/Makefile
> index 7c0790065b5e..c2353a065279 100644
> --- a/arch/x86/entry/vdso/vdso64/Makefile
> +++ b/arch/x86/entry/vdso/vdso64/Makefile
> @@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)                       +=3D vsgx=
.o
>  vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)    +=3D vfutex.o
>
>  # Compilation flags
> -flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcmodel=
=3Dsmall
> +flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcmodel=
=3Dsmall $(CONFIG_CC_OPT_INLINE_MEMSET)
>
>  # The location of this include matters!
>  include $(src)/../common/Makefile.include
> diff --git a/init/Kconfig b/init/Kconfig
> index 8583d9f06c52..ff3f8475dd2f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -173,6 +173,13 @@ config CC_HAS_ALLOC_TOKEN
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>         def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring=
__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>
> +config CC_HAS_OPT_INLINE_MEMSET
> +       def_bool $(cc-option,-finline-stringops=3Dmemset)
> +
> +config CC_OPT_INLINE_MEMSET
> +       string
> +       default "-finline-stringops=3Dmemset" if CC_HAS_OPT_INLINE_MEMSET
> +
>  config LD_CAN_USE_KEEP_IN_OVERLAY
>         # ld.lld prior to 21.0.0 did not support KEEP within an overlay d=
escription
>         # https://github.com/llvm/llvm-project/pull/130661
> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index 2851afa9154f..f5cad5641985 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -29,6 +29,22 @@
>         }                                                                =
       \
>  } while (0)
>
> +#if __has_builtin(__builtin_memset_inline)
> +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, val=
ue, size)
> +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> +#define memset_inline(dst, value, size) __builtin_memset(dst, value, siz=
e)
> +#else
> +static inline void *memset_inline(void *dst, int value, size_t size)
> +{
> +       char *d =3D dst;
> +
> +       while (size--)
> +               *d++ =3D value;
> +
> +       return d;
> +}
> +#endif

Does this work?
https://godbolt.org/z/Tx6EaGMfb

(Sorry, I _should_ have replied to Jason on V1. I'm not ignoring him,
just way behind on my code reviews. Sorry!)

> +
>  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
>  {
>         if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> @@ -83,8 +99,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_=
info, void *buffer, size_
>                 params->size_of_opaque_state =3D sizeof(*state);
>                 params->mmap_prot =3D PROT_READ | PROT_WRITE;
>                 params->mmap_flags =3D MAP_DROPPABLE | MAP_ANONYMOUS;
> -               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved); ++=
i)
> -                       params->reserved[i] =3D 0;
> +               memset_inline(params->reserved, 0, sizeof(params->reserve=
d));
>                 return 0;
>         }
>
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
>
> Best regards,
> --
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers

