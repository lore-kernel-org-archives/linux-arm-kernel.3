Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43D2CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 06:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA6PlkdbLEYL3UDRClSUNU5vQgD5IcE1FmAyVN44e/4=; b=NacUWs7TAKtddAi2C4NvzV2x1v
	YexLxAY5U8gDBJjSZMO+gB3WpfNQFx2UjQs6gpfnsjCx3SQ1VNpHB0QjORixd+1Xuo9OjslO7l4sG
	ajr0/jPIg0EsEUyIvJ+X6AuE7vMMDb8z5KzVh+xeIz9pV4JoSzPH6laQD0/j39THGaLqPFOLjl09i
	0cWrQ2sQuBRIJ8uYTrkD7nwNE5MuNxexdnaQC8RgDKF5FnF0cr+vkbf86rVaM1enFFjnIwGATL+Ke
	IzmDP7lFWLJFprWdd0wTImLIJtv93xkBlpI+57lUK5UjXCh5Qt8I8tflIH9BES4IZcpB/VWc0qSYl
	vshF6cnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKsxx-0000000FXCY-2TyU;
	Mon, 17 Nov 2025 06:43:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKsxt-0000000FXAs-2fM0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 06:43:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9558D43D1F;
	Mon, 17 Nov 2025 06:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F640C4CEF1;
	Mon, 17 Nov 2025 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763361832;
	bh=eMKrosCr86r2AZmru6BsvrPdgcCkjYmPkZP9Gz9nReo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Whi8aGx3Dtn1aCjHzt0gA1ifjb1f2/ocPhTX2P0NEKiVl1mBfzTi+LsR6Bou9cB+E
	 qN2WlEZW8WlpfvLIKegiO5R/odPCeNfZPpvsDMmAfHbR1qtzGaFQCFQLAmzeRZFM30
	 /FN7ZBgk12a2mbEgmcw4UWEa9gxzzg6fwQVs/Ak9t+kTPvsdFf/IRTTJ0mZI0guA82
	 t7RqVQMSv3UK1gIzYe4hszUoYt7EG402u5YmHMnFD4Cn8l8uMMPaqJkvgeF5r6dui7
	 FDIACmxCW2akz6vG5L1zkiZlr2pEgVu1X112G8s93TP+jg1NqXSpM2k7WFci7RAofW
	 UX7B2jnJ0WONg==
Date: Mon, 17 Nov 2025 12:13:45 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, andersson@kernel.org,
	konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	shivendra.pratap@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: efi: Pass reboot cmd parameter to efi_reboot()
Message-ID: <aRrEIeBBPBCE5oYb@sumit-X1>
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-3-sumit.garg@kernel.org>
 <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
 <aRb2_OmkRTD46vnx@sumit-X1>
 <CAMj1kXFpi1fMuAhuaBbMSd57F79E7Z0u4okzkKL+_6eKfGUKXA@mail.gmail.com>
 <CAMj1kXE60LrWi8Au6qQ4EMQDFxQCJt5h6hBLuQHCz3HEp=2o3w@mail.gmail.com>
 <aRcdiwgM9h_S7rP-@sumit-X1>
 <CAMj1kXGN=LFL0Cfp6DonAxTLMK7E4Pb0ocYRtQGBr52EHiRmrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGN=LFL0Cfp6DonAxTLMK7E4Pb0ocYRtQGBr52EHiRmrw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_224353_741970_F95145F5 
X-CRM114-Status: GOOD (  42.18  )
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

On Fri, Nov 14, 2025 at 04:47:18PM +0100, Ard Biesheuvel wrote:
> On Fri, 14 Nov 2025 at 13:16, Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Fri, Nov 14, 2025 at 10:35:33AM +0100, Ard Biesheuvel wrote:
> > > On Fri, 14 Nov 2025 at 10:33, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Fri, 14 Nov 2025 at 10:31, Sumit Garg <sumit.garg@kernel.org> wrote:
> > > > >
> > > > > On Fri, Nov 14, 2025 at 10:26:03AM +0100, Ard Biesheuvel wrote:
> > > > > > On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
> > > > > > >
> > > > > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > > >
> > > > > > > EFI ResetSystem runtime service allows for platform specific reset type
> > > > > > > allowing the OS to pass reset data for the UEFI implementation to take
> > > > > > > corresponding action. So lets pass the reboot cmd parameter for the EFI
> > > > > > > driver to determine whether it's a platform specific reset requested or
> > > > > > > not.
> > > > > > >
> > > > > > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >  arch/arm64/kernel/process.c | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > > > > > index fba7ca102a8c..51784986c568 100644
> > > > > > > --- a/arch/arm64/kernel/process.c
> > > > > > > +++ b/arch/arm64/kernel/process.c
> > > > > > > @@ -136,7 +136,7 @@ void machine_restart(char *cmd)
> > > > > > >          * ResetSystem().
> > > > > > >          */
> > > > > > >         if (efi_enabled(EFI_RUNTIME_SERVICES))
> > > > > > > -               efi_reboot(reboot_mode, NULL);
> > > > > > > +               efi_reboot(reboot_mode, cmd);
> > > > > > >
> > > > > >
> > > > > > I agree with the general principle. However, there are already
> > > > > > existing callers of kernel_restart() that would end up passing a
> > > > > > random string to efi_reboot(), resulting in platform specific reset
> > > > > > with undefined result.
> > > > >
> > > > > Yeah true but the UEFI spec says:
> > > > >
> > > > > "If the platform does not recognize the EFI_GUID in ResetData the platform
> > > > > must pick a supported reset type to perform. The platform may optionally
> > > > > log the parameters from any non-normal reset that occurs."
> > > > >
> > > > > So, in these cases the UEFI implementation can fallback to normal reset
> > > > > optionally logging the reset data being passed. Does that sounds
> > > > > reasonable to you?
> > > > >
> > > >
> > > > What the UEFI spec says might deviate from how real platforms in the
> > > > field will behave when being passed a reset type that nobody ever
> > > > tried passing before.
> >
> > I suppose from OS point of view, we need to follow the UEFI
> > specification. However, there will be scope for quirks later if the real
> > world problems occur. Currently, in case of EFI reboot we are just
> > ignoring the reboot cmd parameter.
> >
> > If you have in mind any sanity checks we should do here then feel free
> > to propose and I can try to implement them.
> >
> > >
> > > Also, the GUID is expected to follow an unbounded NULL terminated
> > > UTF-16 string in memory, so we could easily cause a crash by doing
> > > this if \0\0 doesn't appear in the memory following the string.
> >
> > Okay I see, would following change on top of this patchset address this
> > concern?
> >
> > --- a/drivers/firmware/efi/reboot.c
> > +++ b/drivers/firmware/efi/reboot.c
> > @@ -5,6 +5,7 @@
> >   */
> >  #include <linux/efi.h>
> >  #include <linux/reboot.h>
> > +#include <linux/ucs2_string.h>
> >
> >  static struct sys_off_handler *efi_sys_off_handler;
> >
> > @@ -14,11 +15,18 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *data)
> >  {
> >         const char *str[] = { "cold", "warm", "shutdown", "platform" };
> >         int efi_mode, cap_reset_mode;
> > +       unsigned long reset_data_sz = 0;
> > +       efi_char16_t *reset_data = NULL;
> >
> >         if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
> >                 return;
> >
> >         if (data) {
> > +               reset_data_sz = ucs2_strlen(data) * sizeof(efi_char16_t);
> 
> You can't just run ucs2_strlen() on an arbitrary buffer.
> 
> > +               reset_data = kzalloc(reset_data_sz + 2, GFP_KERNEL);
> > +               memcpy(reset_data, data, reset_data_sz);
> > +               reset_data_sz += 2;
> > +
> 
> What happened to the GUID? It comes after the UTF-16 string, no?

Ah, I missed putting the GUID here.

> 
> >                 efi_mode = EFI_RESET_PLATFORM_SPECIFIC;
> >         } else {
> >                 switch (reboot_mode) {
> > @@ -47,8 +55,7 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *data)
> >                 efi_mode = cap_reset_mode;
> >         }
> >
> > -       efi.reset_system(efi_mode, EFI_SUCCESS, sizeof(data),
> > -                        (efi_char16_t *)data);
> > +       efi.reset_system(efi_mode, EFI_SUCCESS, reset_data_sz, reset_data);
> >  }
> >
> 
> I think the main issue here is tying machine_restart(), which takes a
> u8[] argument, to efi_reboot(), which takes a (u16[]) + L"\0" + GUID
> buffer. So the change to efi_reboot() looks fine to me, we just cannot
> call it directly from machine_restart() as you are suggesting.

It mostly looks like the concerns you are highlighing are related to
random commands being passed to UEFI platform specific reset API. I
suppose this can be addressed using following allow list (based on
analysis done in patch-set [1]) for platform specific reset types. Your
views?

static const efi_platform_reset_type_t platform_reset_types[] = {
        {EFI_RESET_BOOTLOADER_GUID,                     L"bootloader"           },
        {EFI_RESET_DM_VERITY_GUID,                      L"dm-verity-device-corrupted"   },
        {EFI_RESET_EDL_GUID,                            L"edl"                  },
        {EFI_RESET_FASTBOOT_GUID,                       L"fastboot"             },
        {EFI_RESET_LOADER_GUID,                         L"loader"               },
        {EFI_RESET_REBOOT_AB_UPDATE_GUID,               L"reboot-ab-update"     },
        {EFI_RESET_RECOVERY_GUID,                       L"recovery"             },
        {EFI_RESET_RESCUE_GUID,                         L"rescue"               },
        {EFI_RESET_SHUTDOWN_THERMAL_GUID,               L"shutdown-thermal"     },
        {EFI_RESET_SHUTDOWN_THERMAL_BATTERY_GUID,       L"shutdown-thermal-battery"     },
}

[1] https://lore.kernel.org/all/20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com/

-Sumit

