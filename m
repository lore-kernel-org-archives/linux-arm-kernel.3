Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21E1CE8D4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYOoXKZ0pdYqNHv9oXLT75bT10eEVy7tT+2/Am8YgPo=; b=36gwzRQiH7SqpVgH6moS2oyksd
	6WRyOyHk3KioMw6leQI3VOj8OC/UVwnqJZcnE8OxQCJ5hSKbocwr12+KeGJQA7SUyy0ph6S+RdyLB
	zqOmh6Pb/jBzl/Hug+QuGEXNJ8In0TrbHgXpLMSGkDr+6QmD80Ji/YVOwLHKztv8mz41wzMXz3HYd
	U7EnDWHTER9Yq4FDYSdLSpwX9yCcxPASnXfWu3XV6AvIvEEidU6hh5Z8sXmlQjmyn7V9dqXnk843M
	dPGwM3UYgJ36WbpPyfI9HSnvFnAMRTjgTe/WiCi/H1GXae/KYzpSB0NahD+Amq8zdRuvsmCVkpRLL
	tqnqCNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw1S-0000000CbuZ-3c87;
	Fri, 14 Nov 2025 15:47:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJw1S-0000000Cbtf-0oR2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OYOoXKZ0pdYqNHv9oXLT75bT10eEVy7tT+2/Am8YgPo=; b=GR3GtKgm3No0MGq97VIpXRIACS
	iWYf83dhta/aAS7Y9gx03UkRmOZ0FQPuSsXWdrgX3GlKMi0bk1FtGzPFi/vOPdWe0pz6eOZpPw2WM
	cOqL18wOqyZz5CdwnTCYSdA6vpe7rzJnbIPpYLi3shOfi3mOglRRn+5h77V3ElQClP9xUGlgvoGXm
	KBp7Hx23UIusv4avRQHBZ47I2MiEc++7avbVK7ieYm0O3y03txDMo3NeYEhN4j2kT+TQVOcsLfCcG
	9IgfgkvEjE1eeAk0ng/0TE9v/rQfi6y+tdSvjgceYmOGupNc1Q8MSiH/H0Zx5TZCNpqyRNAZ4XEB7
	67Xh8Rdg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJv9k-00000002s6d-1yHU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E1B044568
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 15:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72750C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135251;
	bh=HYPwYAIQdgdyDW1orXQ9X7fxlH8UCdDY5uK1l36WSH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AGKyBLEXtgqYOVxx92sdZmlP9wInrDR7IGNQNm4lZh3okkzjsqi+ctNtvT1Z356BT
	 EnRKkH08kJt6lDsayrLcZyIhsjLIsAUh9WqniwINYxaNXV7n+Pj6EElvTVKirkf0x8
	 kpjRfIeLCCa3BcNpSuGN3JLLsG9h3nC/KFULyePEt9qhW4G+EXT91BEHeC/QjWYrR3
	 /1IfzicZ9blS30hFm61x6udISub275pHWDe5DRMhuSbCt9IWQzlIQBFnKV8Qs2kwO+
	 Z13Aehn4Wsy8tgm955X4SErSwriYkd1fCw4LSixnKOiBxrNt3Q/qoSYlAhf60ogD/O
	 l+1N9Q9oDWtzg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37a56a475e8so20018101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 07:47:31 -0800 (PST)
X-Gm-Message-State: AOJu0YwbnUC2L4SKNkARuMFlP7TapwN3ACRGlq+ntoiU6gUUfnaF1Qy8
	BttX+Q2udLc2cMwNiw9uPs4mkN/I0rBczy4fIeler478bTfD5w0ERaRSjzZvS7hVYSLYogclTcY
	8gsM+w6SXMB3+7RBS6H94/zsc1lT2IBg=
X-Google-Smtp-Source: AGHT+IG2Fkv/IgclsD0YlHWH+j/0FfrRHwioIdacdg5DCe0XUW6hYHcrIV116X3ZHz8YfJIjxlRfH/dH6PHawF8Lzw8=
X-Received: by 2002:a05:6512:3b9c:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-59584201168mr1295463e87.43.1763135249734; Fri, 14 Nov 2025
 07:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-3-sumit.garg@kernel.org> <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
 <aRb2_OmkRTD46vnx@sumit-X1> <CAMj1kXFpi1fMuAhuaBbMSd57F79E7Z0u4okzkKL+_6eKfGUKXA@mail.gmail.com>
 <CAMj1kXE60LrWi8Au6qQ4EMQDFxQCJt5h6hBLuQHCz3HEp=2o3w@mail.gmail.com> <aRcdiwgM9h_S7rP-@sumit-X1>
In-Reply-To: <aRcdiwgM9h_S7rP-@sumit-X1>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Nov 2025 16:47:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGN=LFL0Cfp6DonAxTLMK7E4Pb0ocYRtQGBr52EHiRmrw@mail.gmail.com>
X-Gm-Features: AWmQ_bkirZe4HuEHGum2WhjPW6jhtzALR2NZIjjMF5uSrVSzEoGWnqkRI8nCmQQ
Message-ID: <CAMj1kXGN=LFL0Cfp6DonAxTLMK7E4Pb0ocYRtQGBr52EHiRmrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: efi: Pass reboot cmd parameter to efi_reboot()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, andersson@kernel.org, konradybcio@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, shivendra.pratap@oss.qualcomm.com, 
	leif.lindholm@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_145208_926279_979635AF 
X-CRM114-Status: GOOD (  40.20  )
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

On Fri, 14 Nov 2025 at 13:16, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> On Fri, Nov 14, 2025 at 10:35:33AM +0100, Ard Biesheuvel wrote:
> > On Fri, 14 Nov 2025 at 10:33, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Fri, 14 Nov 2025 at 10:31, Sumit Garg <sumit.garg@kernel.org> wrote:
> > > >
> > > > On Fri, Nov 14, 2025 at 10:26:03AM +0100, Ard Biesheuvel wrote:
> > > > > On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
> > > > > >
> > > > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > >
> > > > > > EFI ResetSystem runtime service allows for platform specific reset type
> > > > > > allowing the OS to pass reset data for the UEFI implementation to take
> > > > > > corresponding action. So lets pass the reboot cmd parameter for the EFI
> > > > > > driver to determine whether it's a platform specific reset requested or
> > > > > > not.
> > > > > >
> > > > > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > > ---
> > > > > >  arch/arm64/kernel/process.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > > > > index fba7ca102a8c..51784986c568 100644
> > > > > > --- a/arch/arm64/kernel/process.c
> > > > > > +++ b/arch/arm64/kernel/process.c
> > > > > > @@ -136,7 +136,7 @@ void machine_restart(char *cmd)
> > > > > >          * ResetSystem().
> > > > > >          */
> > > > > >         if (efi_enabled(EFI_RUNTIME_SERVICES))
> > > > > > -               efi_reboot(reboot_mode, NULL);
> > > > > > +               efi_reboot(reboot_mode, cmd);
> > > > > >
> > > > >
> > > > > I agree with the general principle. However, there are already
> > > > > existing callers of kernel_restart() that would end up passing a
> > > > > random string to efi_reboot(), resulting in platform specific reset
> > > > > with undefined result.
> > > >
> > > > Yeah true but the UEFI spec says:
> > > >
> > > > "If the platform does not recognize the EFI_GUID in ResetData the platform
> > > > must pick a supported reset type to perform. The platform may optionally
> > > > log the parameters from any non-normal reset that occurs."
> > > >
> > > > So, in these cases the UEFI implementation can fallback to normal reset
> > > > optionally logging the reset data being passed. Does that sounds
> > > > reasonable to you?
> > > >
> > >
> > > What the UEFI spec says might deviate from how real platforms in the
> > > field will behave when being passed a reset type that nobody ever
> > > tried passing before.
>
> I suppose from OS point of view, we need to follow the UEFI
> specification. However, there will be scope for quirks later if the real
> world problems occur. Currently, in case of EFI reboot we are just
> ignoring the reboot cmd parameter.
>
> If you have in mind any sanity checks we should do here then feel free
> to propose and I can try to implement them.
>
> >
> > Also, the GUID is expected to follow an unbounded NULL terminated
> > UTF-16 string in memory, so we could easily cause a crash by doing
> > this if \0\0 doesn't appear in the memory following the string.
>
> Okay I see, would following change on top of this patchset address this
> concern?
>
> --- a/drivers/firmware/efi/reboot.c
> +++ b/drivers/firmware/efi/reboot.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
> +#include <linux/ucs2_string.h>
>
>  static struct sys_off_handler *efi_sys_off_handler;
>
> @@ -14,11 +15,18 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *data)
>  {
>         const char *str[] = { "cold", "warm", "shutdown", "platform" };
>         int efi_mode, cap_reset_mode;
> +       unsigned long reset_data_sz = 0;
> +       efi_char16_t *reset_data = NULL;
>
>         if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
>                 return;
>
>         if (data) {
> +               reset_data_sz = ucs2_strlen(data) * sizeof(efi_char16_t);

You can't just run ucs2_strlen() on an arbitrary buffer.

> +               reset_data = kzalloc(reset_data_sz + 2, GFP_KERNEL);
> +               memcpy(reset_data, data, reset_data_sz);
> +               reset_data_sz += 2;
> +

What happened to the GUID? It comes after the UTF-16 string, no?

>                 efi_mode = EFI_RESET_PLATFORM_SPECIFIC;
>         } else {
>                 switch (reboot_mode) {
> @@ -47,8 +55,7 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *data)
>                 efi_mode = cap_reset_mode;
>         }
>
> -       efi.reset_system(efi_mode, EFI_SUCCESS, sizeof(data),
> -                        (efi_char16_t *)data);
> +       efi.reset_system(efi_mode, EFI_SUCCESS, reset_data_sz, reset_data);
>  }
>

I think the main issue here is tying machine_restart(), which takes a
u8[] argument, to efi_reboot(), which takes a (u16[]) + L"\0" + GUID
buffer. So the change to efi_reboot() looks fine to me, we just cannot
call it directly from machine_restart() as you are suggesting.

