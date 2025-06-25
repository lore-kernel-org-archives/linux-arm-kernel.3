Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552C8C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUVMCYmT5xPKkKgpGbtyRLj5YkB7Pm1d90n1lU4Bdkg=; b=JNyskFxeaVC4mCOEVcSmDMR5WR
	IUm43SSq1Zy2TL1r70p+FfPmCKCNHKHNYZowOTxb8pHoEUFbz/JPscxbrnx2ChTRchUpE6cNJZM9Z
	yxz/TrsPE/BuYmWq+ZA9O/Ln4lYw+OVaOqrZBOtF4hGUzEzmmW7f9CDG5HN8aZAU7h1fDjkbuuFgw
	oeFe2ehQcqpM7yVKptX7EI/0hjUCSVjOPQa4sSQbMBAE4HdazAlfWJeVh2W69n9fU27tD1gQH8+tn
	m8seSP1SKg9gENOhJ7TLpgCyFDZBtIyrQWS1XneA+hPYr8DTXwfklqSIpusxRYdLePeucTzI40ayk
	gi2+chIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUre-00000009ZG8-49xt;
	Wed, 25 Jun 2025 18:28:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQr1-00000008uwm-0F4G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:11:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C73D61784
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 14:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10971C4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750860718;
	bh=ydo2ZEycKIerkKDbl9l9TAKEUvkjjljuXIhPvWsDuF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HExtZW+T85Lle2Z7nUb8pQQ5hb76Fnn1c5nwck0n07oOKF+i08w8CNq1m8lEcRc2X
	 P4WF33RIRQ8camLQvrsUr3TT8BmdYZtabuZT/by+LNzQdVoSegSEJSMy1LGGdqiFlQ
	 RpcH9d27tTx+F9GzdGnO+pofEXOWK5YE3I3n/VEaU8egvO95QJebasDB5Kg1Yg/U9/
	 pTx8KEdM5xYqNXIgFvZ8gvvD1VQfwLKttsgTdywRoMXrT6XJrRh0sN6YrNOUq7usVA
	 qV9Pz2ou97o3kIRgis7HqVPV45653KjokaV1GAeLTxcp7JlAEmGfq/zTYQQMJjSGCo
	 8FQHM0pjc+Wcw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b16a0e38so1788381e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 07:11:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgu7vFlqS61tTvhpE6b0ybVYl1Ep9UifrvfLfwbshbWZyhfvA1uflYeupXZqsj3qmBbqVGuGpDnz2dK62wD+Uk@lists.infradead.org
X-Gm-Message-State: AOJu0YzCcOVsInRD61g5ySqC+8TilOfcjOxly1zjSl8WX70C7XAxEPDp
	EpZtKd/y3dn5BoR25DllYJRH6puxw8BfgLuEr5r7GnvACwyZqhUim7EW0p9blR/rN6V8Hm0L5+S
	k2Mtr3Qp1AbSr0345yJUyfeBH3VEVqTM=
X-Google-Smtp-Source: AGHT+IFNJVqQORy+745pCk5ps8bt7Hvz1Ly+xQOtAVtlxVCDnsn2OzbFr24T/jaUutdSCtTFY7dBgOD1BX7yACDHGkY=
X-Received: by 2002:a05:6512:3f0b:b0:554:f74e:9f10 with SMTP id
 2adb3069b0e04-554fde57615mr1297929e87.28.1750860716386; Wed, 25 Jun 2025
 07:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250625125555.2504734-1-masahiroy@kernel.org>
In-Reply-To: <20250625125555.2504734-1-masahiroy@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 Jun 2025 16:11:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGUcQ2QpFMB8dfm=0q6yzUSBrxs_Xuo4q7HWPrp-f-+DQ@mail.gmail.com>
X-Gm-Features: Ac12FXygtnelNOU0Vpn-lYagNY9g6kFU_cK7b4VwWiynjWBXKArEkjipyRdIz3o
Message-ID: <CAMj1kXGUcQ2QpFMB8dfm=0q6yzUSBrxs_Xuo4q7HWPrp-f-+DQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: fix unnecessary rebuilding when CONFIG_DEBUG_EFI=y
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 25 Jun 2025 at 14:56, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When CONFIG_DEBUG_EFI is enabled, some objects are needlessly rebuilt.
>
> [Steps to reproduce]
>
>   Enable CONFIG_DEBUG_EFI and run 'make' twice in a clean source tree.
>   On the second run, arch/arm64/kernel/head.o is rebuilt even though
>   no files have changed.
>
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- clean
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>      [ snip ]
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>     CALL    scripts/checksyscalls.sh
>     AS      arch/arm64/kernel/head.o
>     AR      arch/arm64/kernel/built-in.a
>     AR      arch/arm64/built-in.a
>     AR      built-in.a
>      [ snip ]
>
> The issue is caused by the use of the $(realpath ...) function.
>
> At the time arch/arm64/kernel/Makefile is parsed on the first run,
> $(objtree)/vmlinux does not exist. As a result,
> $(realpath $(objtree)/vmlinux) expands to an empty string.
>
> On the second run of Make, $(objtree)/vmlinux already exists, so
> $(realpath $(objtree)/vmlinux) expands to the absolute path of vmlinux.
> However, this change in the command line causes arch/arm64/kernel/head.o
> to be rebuilt.
>
> To address this issue, use $(abspath ...) instead, which does not require
> the file to exist. While $(abspath ...) does not resolve symlinks, this
> should be fine from a debugging perspective.
>
> The GNU Make manual [1] clearly explains the difference between the two:
>
>   $(realpath names...)
>     For each file name in names return the canonical absolute name.
>     A canonical name does not contain any . or .. components, nor any
>     repeated path separators (/) or symlinks. In case of a failure the
>     empty string is returned. Consult the realpath(3) documentation for
>     a list of possible failure causes.
>
>   $(abspath namees...)
>     For each file name in names return an absolute name that does not
>     contain any . or .. components, nor any repeated path separators (/).
>     Note that, in contrast to realpath function, abspath does not resolve
>     symlinks and does not require the file names to refer to an existing
>     file or directory. Use the wildcard function to test for existence.
>
> The same problem exists in drivers/firmware/efi/libstub/Makefile.zboot.
> On the first run of Make, $(obj)/vmlinuz.efi.elf does not exist when the
> Makefile is parsed, so -DZBOOT_EFI_PATH is set to an empty string.
> Replace $(realpath ...) with $(abspath ...) there as well.
>
> [1]: https://www.gnu.org/software/make/manual/make.html#File-Name-Functions
>
> Fixes: 757b435aaabe ("efi: arm64: Add vmlinux debug link to the Image binary")
> Fixes: a050910972bb ("efi/libstub: implement generic EFI zboot")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>
>  arch/arm64/kernel/Makefile                  | 2 +-
>  drivers/firmware/efi/libstub/Makefile.zboot | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index 2920b0a51403..a2604c33f35c 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -81,7 +81,7 @@ obj-y                                 += head.o
>  always-$(KBUILD_BUILTIN)               += vmlinux.lds
>
>  ifeq ($(CONFIG_DEBUG_EFI),y)
> -AFLAGS_head.o += -DVMLINUX_PATH="\"$(realpath $(objtree)/vmlinux)\""
> +AFLAGS_head.o += -DVMLINUX_PATH="\"$(abspath vmlinux)\""
>  endif
>
>  # for cleaning
> diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
> index 92e3c73502ba..832deee36e48 100644
> --- a/drivers/firmware/efi/libstub/Makefile.zboot
> +++ b/drivers/firmware/efi/libstub/Makefile.zboot
> @@ -36,7 +36,7 @@ aflags-zboot-header-$(EFI_ZBOOT_FORWARD_CFI) := \
>                 -DPE_DLL_CHAR_EX=IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT
>
>  AFLAGS_zboot-header.o += -DMACHINE_TYPE=IMAGE_FILE_MACHINE_$(EFI_ZBOOT_MACH_TYPE) \
> -                        -DZBOOT_EFI_PATH="\"$(realpath $(obj)/vmlinuz.efi.elf)\"" \
> +                        -DZBOOT_EFI_PATH="\"$(abspath $(obj)/vmlinuz.efi.elf)\"" \
>                          -DZBOOT_SIZE_LEN=$(zboot-size-len-y) \
>                          -DCOMP_TYPE="\"$(comp-type-y)\"" \
>                          $(aflags-zboot-header-y)
> --
> 2.43.0
>

