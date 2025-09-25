Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C15CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 02:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOWUVB4y6f6aBHjSqnGjPyqrLPwRDo/1K9wFA3FytDY=; b=FoksUibWBfok747loVTSEkT33b
	8XiEED4dlkuqN7cTt7gQzB/gouNcLyfz5znW7KTAOTVfgLiJhweQuT+Piw1j5N/AsDrxTxSI4n0hQ
	pAqPUTDR9KEUmOIzH+wEZhvUHAzDI58hBMNSq1CFMOrzul382rC5OOpWrJJOl68n6Me/AoxHhe6pU
	hvUOO5TMyAEB4o6J1dtSwqlFlT1Z3Rduo1FSVT1q8PDHkBi8U18s2Qedtpga4mZDhSb6U5O1IoIun
	g65I+3mGgXnde1+xUqtQIN0Oy/CqXUqRzDsGEOLcvvwrDaoAJjB1ccLfUyBWxnEU7tuB1NwxQhgP8
	mnVsNWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bxk-00000005LCF-34qw;
	Thu, 25 Sep 2025 02:44:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bxh-00000005LBN-49Xn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 02:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB93D43222
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C716C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758768240;
	bh=S7vb/zf3V2GaassUXCT9UJV1Et/9TJiqD8ubx2PkhwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J58/SCUfWipwZ1MVIpQEBYOUxqgqodgM0cUqxO+6oYTnwX30OAYYFnF0WKJxi5SU3
	 1YOU1P/IZqOtiBNDhKnXN1z4ovoCMhsotskp189F0RKKNay05fweIgyzg2e3gFkOa+
	 mrEzWgOqJIw9XZ1B1L1AdSJy3OwrymPL9j/QShB/+lcZEezrx+noPCD585qWFJNKzN
	 6E6HdZZvyCsVBaO63lJCmSambbsyS5Xwl45MRs1Bl9W47XafA1DEa4nLWflPswoZ74
	 CUlx92J4FcsuHOfMtemFUEOhpKfKnlSdBytdl9IRLQmzaeKqeOP4mbfyhOZCLS3Mji
	 uaOs9TbYVJNTg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b28e1b87c31so73832866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 19:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3pilhBMgUUlLwhZjaax4A6g/owb90bqWl3L7xIBZ3IYRvSAfZNphxSJ6asLMy3XEXYI0xcZnGbrq55dyFwckx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+FejmVg7f3a0Iv9Ger2aw8w18jQmM7GdhsfXzVawSRxDfYRc5
	kL/nclI7sOsvtAtXd5QmZR+k1izDah+SaIFAqNz8evIBetda/kXRx9d2HSVCFYa1Waz9TS4pFsI
	hqbee4kMmn50IIgf6OgoeIAFPsbh824Y=
X-Google-Smtp-Source: AGHT+IFAKAis+f8CsaeB/ZYEn6Mbsm0qvkYWWb/1JIaJw+bN7o9FCGRKh+44tCSaadZ6c4rMcagZJ6G9mHVPClZ1tck=
X-Received: by 2002:a17:907:3f1e:b0:b11:c9df:7a73 with SMTP id
 a640c23a62f3a-b34bd34a2b0mr217761266b.57.1758768239043; Wed, 24 Sep 2025
 19:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250919093615.30235-1-yangtiezhu@loongson.cn> <20250919093615.30235-2-yangtiezhu@loongson.cn>
In-Reply-To: <20250919093615.30235-2-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 25 Sep 2025 10:43:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fdfB3fH0DnfgxNimPBsjiOGQZV-w0g63d7TVDOK5-zw@mail.gmail.com>
X-Gm-Features: AS18NWDZZeQr-H2-K3eeVtlqTGrlSQzrQ7P8GUhNaKX_KK-BVvdywIo1Js7nnoc
Message-ID: <CAAhV-H4fdfB3fH0DnfgxNimPBsjiOGQZV-w0g63d7TVDOK5-zw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] LoongArch: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_194402_062271_5B5A8015 
X-CRM114-Status: GOOD (  23.59  )
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

Hi, Tiezhu,

On Fri, Sep 19, 2025 at 5:36=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
> the following objtool warning:
>
>   vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
>   falls through to next function __efistub_exit_boot_func()
>
> This is because efi_boot_kernel() doesn't end with a return instruction
> or an unconditional jump, then objtool has determined that the function
> can fall through into the next function.
>
> At the beginning, try to do something to make efi_boot_kernel() ends with
> an unconditional jump instruction, but this modification seems not proper=
.
>
> Since the efistub functions are useless for stack unwinder, they can be
> ignored by objtool. After many discussions, no need to link libstub to
> the vmlinux.o, only link libstub to the final vmlinux.
>
> Link: https://lore.kernel.org/lkml/pq4h7jgndnt6p45lj4kgubxjd5gidfetugcuf5=
rcxzxxanzetd@6rrlpjnjsmuy/
> Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  Makefile                | 1 +
>  arch/loongarch/Makefile | 5 ++++-
>  scripts/link-vmlinux.sh | 5 ++---
>  3 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9771619ac596..b8e7c63ae3d1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1201,6 +1201,7 @@ KBUILD_VMLINUX_OBJS :=3D built-in.a $(patsubst %/, =
%/lib.a, $(filter %/, $(libs-y)
>  KBUILD_VMLINUX_LIBS :=3D $(filter-out %/, $(libs-y))
>
>  export KBUILD_VMLINUX_LIBS
> +export KBUILD_VMLINUX_LIBS_PRELINK
>  export KBUILD_LDS          :=3D arch/$(SRCARCH)/kernel/vmlinux.lds
>
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
Why does the LoongArch patch modify the common parts? Since the whole
series is small enough, I suggest modifying everything in a single
patch. And the single patch can be merged via the efi tree.

Huacai

> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index a3a9759414f4..e9c61f76a045 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -164,7 +164,10 @@ CHECKFLAGS +=3D $(shell $(CC) $(KBUILD_CPPFLAGS) $(K=
BUILD_CFLAGS) -dM -E -x c /dev
>  endif
>
>  libs-y +=3D arch/loongarch/lib/
> -libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmware/efi/libstub/lib=
.a
> +
> +ifdef CONFIG_EFI_STUB
> +KBUILD_VMLINUX_LIBS_PRELINK +=3D $(objtree)/drivers/firmware/efi/libstub=
/lib.a
> +endif
>
>  drivers-y              +=3D arch/loongarch/crypto/
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 51367c2bfc21..b3cbff31d8a9 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -61,12 +61,11 @@ vmlinux_link()
>         shift
>
>         if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IB=
T; then
> -               # Use vmlinux.o instead of performing the slow LTO link a=
gain.
>                 objs=3Dvmlinux.o
> -               libs=3D
> +               libs=3D"${KBUILD_VMLINUX_LIBS_PRELINK}"
>         else
>                 objs=3Dvmlinux.a
> -               libs=3D"${KBUILD_VMLINUX_LIBS}"
> +               libs=3D"${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PREL=
INK}"
>         fi
>
>         if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
> --
> 2.42.0
>

