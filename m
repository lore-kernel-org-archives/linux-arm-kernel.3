Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0B3CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9e620b0eDD4rrDsC52LTAlOroIxqDWX6kW8waNmCUM=; b=Ug3Pg3kdPXE2r+mLR5ul7aElS5
	dbKez53IVaeG6Z7P1Z8J2kSuDleH1kxsCW3+y9tUIlW5qdU2MIrbgGwHRAe6+XtkdyIivXkBGW28j
	u10Z/wLijWQXsSf1+qkjvJiQQzbIRq7lYwErxUWf8lpeBf7AokLWRME5PZaI1tWYrwyiBrRBgB85A
	0yH6b0E86C23IBF6Q9ULHEE6S0iTEag17cgF5S9xvaffKseD3vxFJ2k8YHxLwz/oEZF4/kvKbT6g7
	0rJKBjVs/DC5q0LUK/RRjrXkmoENU6qPvmBF0HHn9mYKHHWUKa2Q1l0sXpPj7kERx4UECN3eGH329
	sWbiQhJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2rfG-0000000Fo3c-1OSQ;
	Sun, 28 Sep 2025 13:42:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2rfE-0000000Fo2y-35sx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 13:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBB4162170
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 13:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18866C113D0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759066927;
	bh=b7lQZMpm3jaFTG6dtKVKcEubjwdkNUjuclDki/TIr1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m6lhNJFdEkreSucB/dxMB91UrwJt6hhk8u7yLb3moYbEyO3YNCQDQpZeyjmsvdCA1
	 Toga5ITJofDzKTAiQhErydIP7701BjSfwg3kp6sXPKdL0m4FKAIWlEb4k0K6HA6oQj
	 0+VWp3z+6bod1kBnBzJ5bkEyJusUvXNqljcTimM988HiBmJi6VCN8FIGarZwKCEY17
	 2fMnLseHBVhWU0OvsUSNdzw3UGBQS59MU2Bb2Gyubs4sx/raxgTR21vYeCg9Ily9x/
	 zuP0FbPqRv/UjoEOb3hZUnkiKVF1LmvGr4AOcMAziRkQGBrGxpFbGkowGad8zuT8ui
	 zKfCcC33++BgA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso4416787e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 06:42:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXq5tsittSKfxzf5ECA/oDmxOFLLJwXEwraKrPbDB5J6j6HC1q3MSK06OPeA1pNmczpio5YlJFD6+/0E9ISwwL1@lists.infradead.org
X-Gm-Message-State: AOJu0Yywc1/KC8vngGjLUnqhUTDBCS2y5DjEygr7O56C0VE/shZlV5bV
	/ME1Ec71yP7zQYeTcDQYUe3eVgiC5dVjDMcDsBj+aFBcxwDoCpd2gE2dZUSxZyHmR1G6ARiKswX
	AbY2rcdMJWcJwL+ckOnVFo0tOEWeY0JU=
X-Google-Smtp-Source: AGHT+IENjnF+wQFCTm2WX/2LUMrC3xClXeEULM4n0/VRgHOOZVaGDYKViPHE16Jf9kIytcqTJZySM24jjWSQ6nTxM8g=
X-Received: by 2002:a05:6512:12d1:b0:57b:8a82:1dd0 with SMTP id
 2adb3069b0e04-582d0c28621mr4021018e87.15.1759066925407; Sun, 28 Sep 2025
 06:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250928085506.4471-1-yangtiezhu@loongson.cn>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 28 Sep 2025 15:41:54 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
X-Gm-Features: AS18NWAAyvtoI8B9uL7arznbuV6ccfy2mwG4BGuL--lHKmdvv097Yi3SZbekg3Q
Message-ID: <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 28 Sept 2025 at 10:55, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
> the following objtool warning on LoongArch:
>
>   vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
>   falls through to next function __efistub_exit_boot_func()
>
> This is because efi_boot_kernel() doesn't end with a return instruction
> or an unconditional jump, then objtool has determined that the function
> can fall through into the next function.
>
> At the beginning, try to do something to make efi_boot_kernel() ends with
> an unconditional jump instruction, but this modification seems not proper.
>
> Since the efistub functions are useless for stack unwinder, they can be
> ignored by objtool. After many discussions, no need to link libstub to
> the vmlinux.o, only link libstub to the final vmlinux.
>

Please try keeping these changes confined to arch/loongarch. This
problem does not exist on other architectures, and changing the way
vmlinux is constructed might create other issues down the road.

> Do the similar things for arm64 and riscv, otherwise there may be objtool
> warnings when arm64 and riscv support objtool, this is to make consistent
> with the archs that use libstub.
>
> Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5rcxzxxanzetd@6rrlpjnjsmuy/
> Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  Makefile                | 1 +
>  arch/arm64/Makefile     | 5 ++++-
>  arch/loongarch/Makefile | 5 ++++-
>  arch/riscv/Makefile     | 5 ++++-

>  scripts/link-vmlinux.sh | 5 ++---
>  5 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 10355ecf32cb..8ba2e28ef3d1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1201,6 +1201,7 @@ KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)
>  KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
>
>  export KBUILD_VMLINUX_LIBS
> +export KBUILD_VMLINUX_LIBS_PRELINK
>  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
>
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 73a10f65ce8b..038f37ef2143 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -156,7 +156,10 @@ KBUILD_CPPFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>  KBUILD_AFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
>
>  libs-y         := arch/arm64/lib/ $(libs-y)
> -libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +
> +ifdef CONFIG_EFI_STUB
> +KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +endif
>
>  # Default target when executing plain make
>  boot           := arch/arm64/boot
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index ae419e32f22e..4eb904c20718 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -169,7 +169,10 @@ CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev
>  endif
>
>  libs-y += arch/loongarch/lib/
> -libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +
> +ifdef CONFIG_EFI_STUB
> +KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +endif
>
>  drivers-y              += arch/loongarch/crypto/
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index df57654a615e..cfd82b2c1bbf 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -173,7 +173,10 @@ boot-image-$(CONFIG_XIP_KERNEL)            := xipImage
>  KBUILD_IMAGE                           := $(boot)/$(boot-image-y)
>
>  libs-y += arch/riscv/lib/
> -libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +
> +ifdef CONFIG_EFI_STUB
> +KBUILD_VMLINUX_LIBS_PRELINK += $(objtree)/drivers/firmware/efi/libstub/lib.a
> +endif
>
>  ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 51367c2bfc21..b3cbff31d8a9 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -61,12 +61,11 @@ vmlinux_link()
>         shift
>
>         if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
> -               # Use vmlinux.o instead of performing the slow LTO link again.
>                 objs=vmlinux.o
> -               libs=
> +               libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
>         else
>                 objs=vmlinux.a
> -               libs="${KBUILD_VMLINUX_LIBS}"
> +               libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
>         fi
>
>         if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
> --
> 2.42.0
>

