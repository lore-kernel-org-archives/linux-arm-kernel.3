Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C14ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tk4D6lann4Qv6C/cl8XrXlumbr5Ja0zvSdhyNNQBE60=; b=YmOhxtfnXegEXvzDvV9qNQyE17
	OhWIEbkB7jophrK/VNWCh4fmqHrUYsviHhtrUKsjKbVcg3/uxJiNJhGNQ3mxZWq4Tx+aGvASSjNkH
	zq76rDqYmdS57RnaEByaloJfEVGrWk5cs+cCn4Lff2Fe/tqc8gpD5SPjULsZCRertag2+VEOxn8+7
	RhSCohgU8Uc7qDpaUNbZUbdE1w+SioVY/pA5+A0uf7JRoqLsUSh3g1J1o32HKz0+INNuwipjlh8A+
	EVrwAgKTaV2BPYivq5R9GoJuivrt33rThEVLp3dwefAz+mK1ir9jHTq6niitldTwuan7pS7MYHPGv
	0abauN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Fwa-00000008yLJ-3VlG;
	Fri, 10 Oct 2025 16:26:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Fwa-00000008yLC-0p0x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54752626DF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 16:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF97FC116C6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760113571;
	bh=utKCZjeHw3iqnFfYB1ZfxGnO3UrPmvILiol4TqfBHR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ifr5gpgl7oLwDoSrjSSuI0zeIwM1nRb3uRa3RBa2jbNUt9PPmOxDzZDFqVyPvhGcX
	 WyliYCSu7CXX1pxMu3PHD6Y1aAhblPEpsIsqPgEvAL6ftY3BseA4gtaP7J6dgKXrUJ
	 8DqCPlqniOPsbHKH89OgQ7vCcIRVbfOJ0kVt6nTbCMNsEBgsSyrN6GWYCYawGUGD6A
	 +umYAlXJOfreHakJgESAB+O3A8WDuPOatIMec9lkR9Nmdpz/jpJ4g6dOykHpKd9MAv
	 k7p2T1cdrCgYJmGUOZC3oUoLelrCCD3OMRtFXqFy99x4AH1QGdHi0K1umgzIh0I75B
	 4qjAMzB4frdNQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso2513567e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 09:26:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXR5gDadsUXptNcZPQWmnAu6XIZ6IaS6qsb7v+0WS/VUfj+lC3HGIMbR3fPnbQuhaOfl/19xO7AbbcjitJ9A2j+@lists.infradead.org
X-Gm-Message-State: AOJu0YwJMKU+qdPYEnmQHjFyWHLTqrxNtkwM2a3n7BWTY+oC7PM+kEco
	KN6LKwCJe4bNakgTQNAUQmOrjFHtcXzOdMK6p8kWEgxe54ZBFYrTP7E2qZ+Bwz2LsFgcPhweyo1
	/7mBZPqN1E99CUHTBX54zMnur6Alb+uY=
X-Google-Smtp-Source: AGHT+IFlrMsUvrC/ZHyp7C1tmfy80lEWySBj/07SSrfUI6v7Q7I01eOrR8aE8CO2xnNLYI6LpFea10RRzC+bIaZdgH8=
X-Received: by 2002:a05:6512:1152:b0:57b:5794:ccd9 with SMTP id
 2adb3069b0e04-5906d77e26bmr3537150e87.9.1760113569266; Fri, 10 Oct 2025
 09:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com> <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn>
In-Reply-To: <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Oct 2025 09:25:57 -0700
X-Gmail-Original-Message-ID: <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
X-Gm-Features: AS18NWAp30BvVY9ZXh0_0XY6OhGFXDo-CTjUdGdhBNHw2LQ_EFhIlBfBfuAUJuI
Message-ID: <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 9 Oct 2025 at 00:27, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> On 2025/9/28 =E4=B8=8B=E5=8D=8810:41, Ard Biesheuvel wrote:
> > On Sun, 28 Sept 2025 at 16:39, Ard Biesheuvel <ardb@kernel.org> wrote:
> >>
> >> On Sun, 28 Sept 2025 at 15:52, Huacai Chen <chenhuacai@kernel.org> wro=
te:
> >>>
> >>> Hi, Ard,
> >>>
> >>> On Sun, Sep 28, 2025 at 9:42=E2=80=AFPM Ard Biesheuvel <ardb@kernel.o=
rg> wrote:
> >>>>
> >>>> On Sun, 28 Sept 2025 at 10:55, Tiezhu Yang <yangtiezhu@loongson.cn> =
wrote:
> >>>>>
> >>>>> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exists
> >>>>> the following objtool warning on LoongArch:
> >>>>>
> >>>>>    vmlinux.o: warning: objtool: __efistub_efi_boot_kernel()
> >>>>>    falls through to next function __efistub_exit_boot_func()
> >>>>>
> >>>>> This is because efi_boot_kernel() doesn't end with a return instruc=
tion
> >>>>> or an unconditional jump, then objtool has determined that the func=
tion
> >>>>> can fall through into the next function.
> >>>>>
> >>>>> At the beginning, try to do something to make efi_boot_kernel() end=
s with
> >>>>> an unconditional jump instruction, but this modification seems not =
proper.
> >>>>>
> >>>>> Since the efistub functions are useless for stack unwinder, they ca=
n be
> >>>>> ignored by objtool. After many discussions, no need to link libstub=
 to
> >>>>> the vmlinux.o, only link libstub to the final vmlinux.
> >>>>>
> >>>>
...
> Are you OK with the following changes?
>
> (1) libstub doesn't link to vmlinux.o, only link libstub with vmlinux.o
> during the final vmlinux link, keep the changes confined to LoongArch,
> no need to be something more generic.
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index dc5bd3f1b8d2..f34b416f5ca2 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -169,7 +169,6 @@ CHECKFLAGS +=3D $(shell $(CC) $(KBUILD_CPPFLAGS)
> $(KBUILD_CFLAGS) -dM -E -x c /dev
>   endif
>
>   libs-y +=3D arch/loongarch/lib/
> -libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmware/efi/libstub/lib=
.a
>
>   drivers-y              +=3D arch/loongarch/crypto/
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 433849ff7529..ed94871c3606 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -69,6 +69,12 @@ vmlinux_link()
>                  libs=3D"${KBUILD_VMLINUX_LIBS}"
>          fi
>
> +       if [ "${SRCARCH}" =3D "loongarch" ]; then
> +               if is_enabled CONFIG_EFI_STUB; then
> +                       libs=3D"${libs} drivers/firmware/efi/libstub/lib.=
a"
> +               fi
> +       fi
> +
>          if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
>                  objs=3D"${objs} .builtin-dtbs.o"
>          fi
>
> (2) remove the attribute __noreturn for real_kernel_entry() and add
> "while (1);" at the end of efi_boot_kernel().
>
> diff --git a/drivers/firmware/efi/libstub/loongarch.c
> b/drivers/firmware/efi/libstub/loongarch.c
> index 3782d0a187d1..e309fd78fca7 100644
> --- a/drivers/firmware/efi/libstub/loongarch.c
> +++ b/drivers/firmware/efi/libstub/loongarch.c
> @@ -10,7 +10,7 @@
>   #include "efistub.h"
>   #include "loongarch-stub.h"
>
> -typedef void __noreturn (*kernel_entry_t)(bool efi, unsigned long cmdlin=
e,
> +typedef void (*kernel_entry_t)(bool efi, unsigned long cmdline,
>                                           unsigned long systab);
>
>   efi_status_t check_platform_features(void)
> @@ -81,4 +81,7 @@ efi_status_t efi_boot_kernel(void *handle,
> efi_loaded_image_t *image,
>
>         real_kernel_entry(true, (unsigned long)cmdline_ptr,
>                           (unsigned long)efi_system_table);
> +
> +       /* We should never get here */
> +       while (1);
>   }
>

Why do we need both (1) and (2)?

