Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFB6CE7AFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWfxlovtlHWLkMCBmtTkCS4/9QLpS74pQWB4HrtZZts=; b=dTbayTkYOVwRlewqVak+PNgRDl
	gC6RnltZXlIR85OUl8XjfoFX4da7LAbXsrZxMYFmHEXfYal60fAQwDDiBv0lPo9w0SD5zZPvBLqUr
	qb/PEO0rMkZPEKRxad3stoa6zq03byGvTga2hPQjZ5p4shTtooGm/NVYWuoZ2vqiBoxb+Y2wPYOZM
	4Rl1Ni/jzyJuTisM5rHH+rLhARW5zUsl86DaYiI2GdM5GOmCgv0hZxzKed4WMwiCBayUNEzyA8uZu
	XU30wh2GuP8UfwSwCYmiehs9ip3ikS4tplCC0Doug49uXlW+8E2z0rzVZKlnkxtG1q4BQqXSY2vfm
	vU78Ms6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsiz-0000000CBPG-2IJH;
	Fri, 14 Nov 2025 12:16:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsix-0000000CBP8-3U99
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8D136016F;
	Fri, 14 Nov 2025 12:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C813C4CEF1;
	Fri, 14 Nov 2025 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763122578;
	bh=5RqXHqHz4UU/Pqj/bZXRU6L0/3Ft4c4j+w400Ub4OMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etOD6sJe6gVAOIzkTbbf5u51+gHFETMrpPt26qH77RYIyd9FEeBZshZ9sTzFabFgw
	 Vls5lMsnSXt5n0pUbBKvyaxRM5vYXYKFXZ8dKhrVeWi7WlyKOQvdqBGPybtOZu3vt/
	 K6XGCajFHSpDGMdbVoyS9UzhAc8iSQ2a6TKEssdmOSnZxLZcrOTZ1q81XLiHkjdzYR
	 j0BFXq1SHuT/g5/iccpgag9XV3SUibryAL5sj96NpPwa8gd7gkH0+OCTwSZlstd3im
	 c7+QRSjgPhIrB/dgJb6All7DJB8x/otBsSEs44cC3+iNc9x1VMBLy1J3NuuQu728NS
	 7Q5CtnAj8vQeA==
Date: Fri, 14 Nov 2025 17:46:11 +0530
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
Message-ID: <aRcdiwgM9h_S7rP-@sumit-X1>
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-3-sumit.garg@kernel.org>
 <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
 <aRb2_OmkRTD46vnx@sumit-X1>
 <CAMj1kXFpi1fMuAhuaBbMSd57F79E7Z0u4okzkKL+_6eKfGUKXA@mail.gmail.com>
 <CAMj1kXE60LrWi8Au6qQ4EMQDFxQCJt5h6hBLuQHCz3HEp=2o3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXE60LrWi8Au6qQ4EMQDFxQCJt5h6hBLuQHCz3HEp=2o3w@mail.gmail.com>
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

On Fri, Nov 14, 2025 at 10:35:33AM +0100, Ard Biesheuvel wrote:
> On Fri, 14 Nov 2025 at 10:33, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Fri, 14 Nov 2025 at 10:31, Sumit Garg <sumit.garg@kernel.org> wrote:
> > >
> > > On Fri, Nov 14, 2025 at 10:26:03AM +0100, Ard Biesheuvel wrote:
> > > > On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
> > > > >
> > > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > >
> > > > > EFI ResetSystem runtime service allows for platform specific reset type
> > > > > allowing the OS to pass reset data for the UEFI implementation to take
> > > > > corresponding action. So lets pass the reboot cmd parameter for the EFI
> > > > > driver to determine whether it's a platform specific reset requested or
> > > > > not.
> > > > >
> > > > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/kernel/process.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > > > index fba7ca102a8c..51784986c568 100644
> > > > > --- a/arch/arm64/kernel/process.c
> > > > > +++ b/arch/arm64/kernel/process.c
> > > > > @@ -136,7 +136,7 @@ void machine_restart(char *cmd)
> > > > >          * ResetSystem().
> > > > >          */
> > > > >         if (efi_enabled(EFI_RUNTIME_SERVICES))
> > > > > -               efi_reboot(reboot_mode, NULL);
> > > > > +               efi_reboot(reboot_mode, cmd);
> > > > >
> > > >
> > > > I agree with the general principle. However, there are already
> > > > existing callers of kernel_restart() that would end up passing a
> > > > random string to efi_reboot(), resulting in platform specific reset
> > > > with undefined result.
> > >
> > > Yeah true but the UEFI spec says:
> > >
> > > "If the platform does not recognize the EFI_GUID in ResetData the platform
> > > must pick a supported reset type to perform. The platform may optionally
> > > log the parameters from any non-normal reset that occurs."
> > >
> > > So, in these cases the UEFI implementation can fallback to normal reset
> > > optionally logging the reset data being passed. Does that sounds
> > > reasonable to you?
> > >
> >
> > What the UEFI spec says might deviate from how real platforms in the
> > field will behave when being passed a reset type that nobody ever
> > tried passing before.

I suppose from OS point of view, we need to follow the UEFI
specification. However, there will be scope for quirks later if the real
world problems occur. Currently, in case of EFI reboot we are just
ignoring the reboot cmd parameter.

If you have in mind any sanity checks we should do here then feel free
to propose and I can try to implement them.

> 
> Also, the GUID is expected to follow an unbounded NULL terminated
> UTF-16 string in memory, so we could easily cause a crash by doing
> this if \0\0 doesn't appear in the memory following the string.

Okay I see, would following change on top of this patchset address this
concern?

--- a/drivers/firmware/efi/reboot.c
+++ b/drivers/firmware/efi/reboot.c
@@ -5,6 +5,7 @@
  */
 #include <linux/efi.h>
 #include <linux/reboot.h>
+#include <linux/ucs2_string.h>

 static struct sys_off_handler *efi_sys_off_handler;

@@ -14,11 +15,18 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *data)
 {
        const char *str[] = { "cold", "warm", "shutdown", "platform" };
        int efi_mode, cap_reset_mode;
+       unsigned long reset_data_sz = 0;
+       efi_char16_t *reset_data = NULL;

        if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
                return;

        if (data) {
+               reset_data_sz = ucs2_strlen(data) * sizeof(efi_char16_t);
+               reset_data = kzalloc(reset_data_sz + 2, GFP_KERNEL);
+               memcpy(reset_data, data, reset_data_sz);
+               reset_data_sz += 2;
+
                efi_mode = EFI_RESET_PLATFORM_SPECIFIC;
        } else {
                switch (reboot_mode) {
@@ -47,8 +55,7 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *data)
                efi_mode = cap_reset_mode;
        }

-       efi.reset_system(efi_mode, EFI_SUCCESS, sizeof(data),
-                        (efi_char16_t *)data);
+       efi.reset_system(efi_mode, EFI_SUCCESS, reset_data_sz, reset_data);
 }

 bool __weak efi_poweroff_required(void)

-Sumit

