Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068DDD5E14A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt49mrwiI5RXMzjgZXdGAhn0ZQBXpXpr+uCW5AQrbRk=; b=ZClrHvbMEiOAHk7zxxzvNxGTn4
	avna71jyazSlz/765mH4B7mNuiRdIPgvSOyvFsOLflxw5z2+orgmWSHaaGOuKrV6go/pgeaT4/A4c
	/SBL6QQPwqC54YyQDfc8f3joyKsIgHtlSG2Apa38wW5sYf393xStRBF2IN25TOMAonSdrJbpjGZ8/
	r5vREpHIO58NI5POLANv07+Frhf77fQsPCo6DGEvQmAyYTGgOlrFvqAXTIYjbk4vkXvyat/gsUMSv
	Ex6bNNB7yOXlUwVXUXehbEhmNNlPJRHRTDhuXzbXOUUK/+v8z9tGcJIyWrv+cpXY92RvjX1cosVJ9
	9MNMFAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV1i-00000005F41-3Fsx;
	Tue, 16 Dec 2025 13:23:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV1g-00000005F3Q-3juF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:23:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6C606001D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D312C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765891419;
	bh=DPq1jAGc1D2O/ZyUazla2tvm5eNJUgScceBv0fDtLkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nGre6DbvGUgnZ+ESxttsrnECY5lWVvqQ1gRq4R08/NWMM6Rb5ayGTuV9K9W/HqR3Q
	 YGAGrMdKjxCZnF9RFyzdK69F1AQUANMKOGzht2N/FoW3JIeHZRdnF2XsY2K6sgW70V
	 U+HDhuzRiG/Lo6imIWRSAqVyL/NRr0FvFO4gOUpyGp6IDnfl/qh3D/gj1x5B8ycpG2
	 gAzN/+9lxsa+fl1T+WbVyRxI/k88S3LHjZRCLCWuBXE6N3osXAj09ZGHK4TAGCckwT
	 gZZIYQP8g382SyQr6jZi16qKdej6YlbWsF/u8WCmfc+fxrtTHYs0PrlqLhepsiLRQ3
	 PMZCjx7IxWsOg==
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c84ec3b6eso2728797a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 05:23:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSYLDrq44LGmzTgRcmr/bjyMOp1gOtP+/8LHI3SxK/gAHrk21dA7M05MCTlS5QqhBT40fbefr0XDwtJZvdyKHm@lists.infradead.org
X-Gm-Message-State: AOJu0YzN9MTv1gYofBG2Fk8IdDW9Kn9WeeCXh0fRBPfvFBvfYpSC0Mmr
	fdHjlbqS2zPUo/gpiUmDWgozCrjdwIx85ADKQes/aq7KFyacIj+NqnrUibM6BK+CBGVrgiyDS72
	E/DKWb7rEAbksS0vTE2Kvu4aPB1Plf2w=
X-Google-Smtp-Source: AGHT+IHUnDpKNHYUuXbGrQN2jg3vGOrZPyoOq5q+Rmr8AbIh7IbWBUkMTVkTTrw2Wag6CLrhtskPUlwtBJIXFO06Kbc=
X-Received: by 2002:a17:90b:4cce:b0:34a:b1ea:664e with SMTP id
 98e67ed59e1d1-34abd734361mr11835652a91.15.1765891419204; Tue, 16 Dec 2025
 05:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20251126160854.553077-1-tzimmermann@suse.de> <20251126160854.553077-10-tzimmermann@suse.de>
In-Reply-To: <20251126160854.553077-10-tzimmermann@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Dec 2025 14:23:28 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFeBS7O5A-CPds3UfFnjegGTpVsuF7VznBc-zZ+gjygtw@mail.gmail.com>
X-Gm-Features: AQt7F2oAVMGGFI57G40bXQNZ0WT8L2VZYIDSVOafxb5SZLs3ZzjQIedL6et7Yfs
Message-ID: <CAMj1kXFeBS7O5A-CPds3UfFnjegGTpVsuF7VznBc-zZ+gjygtw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] efi: libstub: Simplify interfaces for primary_display
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, arnd@arndb.de, richard.lyu@suse.com, 
	helgaas@kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
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

Hi Thomas

On Wed, 26 Nov 2025 at 17:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Rename alloc_primary_display() and __alloc_primary_display(), clarify
> free semantics to make interfaces easier to understand.
>
> Rename alloc_primary_display() to lookup_primary_display() as it
> does not necessarily allocate. Then rename __alloc_primary_display()
> to the new alloc_primary_display(). The helper belongs to
> free_primary_display), so it should be named without underscores.
>
> The lookup helper does not necessarily allocate, so the output
> parameter needs_free to indicate when free should be called.

I don't understand why we need this. Whether or not the helper
allocates is a compile time decision, and in builds where it doesn't,
the free helper doesn't do anything.

I'm all for making things simpler, but I don't think this patch
achieves that tbh.

I've queued up this series now up until this patch - once we converge
on the simplification, I'm happy to apply it on top.

Thanks,



> Pass
> an argument through the calls to track this state. Put the free
> handling into release_primary_display() for simplificy.
>
> Also move the comment fro primary_display.c to efi-stub-entry.c,
> where it now describes lookup_primary_display().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 23 +++++++++++++++++--
>  drivers/firmware/efi/libstub/efi-stub.c       | 22 ++++++++++++------
>  drivers/firmware/efi/libstub/efistub.h        |  2 +-
>  .../firmware/efi/libstub/primary_display.c    | 17 +-------------
>  drivers/firmware/efi/libstub/zboot.c          |  6 +++--
>  5 files changed, 42 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
> index aa85e910fe59..3077b51fe0b2 100644
> --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
> +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
> @@ -14,10 +14,29 @@ static void *kernel_image_addr(void *addr)
>         return addr + kernel_image_offset;
>  }
>
> -struct sysfb_display_info *alloc_primary_display(void)
> +/*
> + * There are two ways of populating the core kernel's sysfb_primary_display
> + * via the stub:
> + *
> + *   - using a configuration table, which relies on the EFI init code to
> + *     locate the table and copy the contents; or
> + *
> + *   - by linking directly to the core kernel's copy of the global symbol.
> + *
> + * The latter is preferred because it makes the EFIFB earlycon available very
> + * early, but it only works if the EFI stub is part of the core kernel image
> + * itself. The zboot decompressor can only use the configuration table
> + * approach.
> + */
> +
> +struct sysfb_display_info *lookup_primary_display(bool *needs_free)
>  {
> +       *needs_free = true;
> +
>         if (IS_ENABLED(CONFIG_ARM))
> -               return __alloc_primary_display();
> +               return alloc_primary_display();
> +
> +       *needs_free = false;
>
>         if (IS_ENABLED(CONFIG_X86) ||
>             IS_ENABLED(CONFIG_EFI_EARLYCON) ||
> diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
> index 42d6073bcd06..dc545f62c62b 100644
> --- a/drivers/firmware/efi/libstub/efi-stub.c
> +++ b/drivers/firmware/efi/libstub/efi-stub.c
> @@ -51,14 +51,14 @@ static bool flat_va_mapping = (EFI_RT_VIRTUAL_OFFSET != 0);
>  void __weak free_primary_display(struct sysfb_display_info *dpy)
>  { }
>
> -static struct sysfb_display_info *setup_primary_display(void)
> +static struct sysfb_display_info *setup_primary_display(bool *dpy_needs_free)
>  {
>         struct sysfb_display_info *dpy;
>         struct screen_info *screen = NULL;
>         struct edid_info *edid = NULL;
>         efi_status_t status;
>
> -       dpy = alloc_primary_display();
> +       dpy = lookup_primary_display(dpy_needs_free);
>         if (!dpy)
>                 return NULL;
>         screen = &dpy->screen;
> @@ -68,15 +68,22 @@ static struct sysfb_display_info *setup_primary_display(void)
>
>         status = efi_setup_graphics(screen, edid);
>         if (status != EFI_SUCCESS)
> -               goto err_free_primary_display;
> +               goto err___free_primary_display;
>
>         return dpy;
>
> -err_free_primary_display:
> -       free_primary_display(dpy);
> +err___free_primary_display:
> +       if (*dpy_needs_free)
> +               free_primary_display(dpy);
>         return NULL;
>  }
>
> +static void release_primary_display(struct sysfb_display_info *dpy, bool dpy_needs_free)
> +{
> +       if (dpy && dpy_needs_free)
> +               free_primary_display(dpy);
> +}
> +
>  static void install_memreserve_table(void)
>  {
>         struct linux_efi_memreserve *rsv;
> @@ -156,13 +163,14 @@ efi_status_t efi_stub_common(efi_handle_t handle,
>                              char *cmdline_ptr)
>  {
>         struct sysfb_display_info *dpy;
> +       bool dpy_needs_free;
>         efi_status_t status;
>
>         status = check_platform_features();
>         if (status != EFI_SUCCESS)
>                 return status;
>
> -       dpy = setup_primary_display();
> +       dpy = setup_primary_display(&dpy_needs_free);
>
>         efi_retrieve_eventlog();
>
> @@ -182,7 +190,7 @@ efi_status_t efi_stub_common(efi_handle_t handle,
>
>         status = efi_boot_kernel(handle, image, image_addr, cmdline_ptr);
>
> -       free_primary_display(dpy);
> +       release_primary_display(dpy, dpy_needs_free);
>
>         return status;
>  }
> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> index 979a21818cc1..1503ffb82903 100644
> --- a/drivers/firmware/efi/libstub/efistub.h
> +++ b/drivers/firmware/efi/libstub/efistub.h
> @@ -1176,8 +1176,8 @@ efi_enable_reset_attack_mitigation(void) { }
>
>  void efi_retrieve_eventlog(void);
>
> +struct sysfb_display_info *lookup_primary_display(bool *needs_free);
>  struct sysfb_display_info *alloc_primary_display(void);
> -struct sysfb_display_info *__alloc_primary_display(void);
>  void free_primary_display(struct sysfb_display_info *dpy);
>
>  void efi_cache_sync_image(unsigned long image_base,
> diff --git a/drivers/firmware/efi/libstub/primary_display.c b/drivers/firmware/efi/libstub/primary_display.c
> index cdaebab26514..34c54ac1e02a 100644
> --- a/drivers/firmware/efi/libstub/primary_display.c
> +++ b/drivers/firmware/efi/libstub/primary_display.c
> @@ -7,24 +7,9 @@
>
>  #include "efistub.h"
>
> -/*
> - * There are two ways of populating the core kernel's sysfb_primary_display
> - * via the stub:
> - *
> - *   - using a configuration table, which relies on the EFI init code to
> - *     locate the table and copy the contents; or
> - *
> - *   - by linking directly to the core kernel's copy of the global symbol.
> - *
> - * The latter is preferred because it makes the EFIFB earlycon available very
> - * early, but it only works if the EFI stub is part of the core kernel image
> - * itself. The zboot decompressor can only use the configuration table
> - * approach.
> - */
> -
>  static efi_guid_t primary_display_guid = LINUX_EFI_PRIMARY_DISPLAY_TABLE_GUID;
>
> -struct sysfb_display_info *__alloc_primary_display(void)
> +struct sysfb_display_info *alloc_primary_display(void)
>  {
>         struct sysfb_display_info *dpy;
>         efi_status_t status;
> diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
> index 4b76f74c56da..c1fd1fdbcb08 100644
> --- a/drivers/firmware/efi/libstub/zboot.c
> +++ b/drivers/firmware/efi/libstub/zboot.c
> @@ -26,9 +26,11 @@ void __weak efi_cache_sync_image(unsigned long image_base,
>         // executable code loaded into memory to be safe for execution.
>  }
>
> -struct sysfb_display_info *alloc_primary_display(void)
> +struct sysfb_display_info *lookup_primary_display(bool *needs_free)
>  {
> -       return __alloc_primary_display();
> +       *needs_free = true;
> +
> +       return alloc_primary_display();
>  }
>
>  asmlinkage efi_status_t __efiapi
> --
> 2.51.1
>

