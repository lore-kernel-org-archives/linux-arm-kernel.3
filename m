Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC2DCE7A8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MU21L3gBUGQJD8eaYPTKos1WCSr+QmWnzQ1qqzwY4v0=; b=KKEDB/BzXNk2CCaHqbH0FgJZ2k
	ytHD5BczbEWPhCmX11hXsBi3zPDDBDTXYhCJLqOGyLpaJ2lc+AenFADYI3eAQ7q0XubZ37CvmXd2/
	4Mhine+ZChmAPH+rE/VJtlA0jm3fd4rUKvPHI+0RKT+GPLgOB94vQiESAmJnQBXCmyLWCuIJ8ocKS
	GTTlC5IZLApQ9e93AVLPyYvcGeYhR099AUjTlfMdcMyIhX+e6yesxlEBVM8Yp+QGoeyvWSjyKwNeV
	wW63A0n61gwdPILCfZucYM4f42S8e0nfyg/fOmcPFOeGS1f3k1VezNjaAK6HdKc+5S5AirgH5FNpl
	1S/cNf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq9m-0000000BvAn-3IFc;
	Fri, 14 Nov 2025 09:31:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq9l-0000000BvAf-2UZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA5976016E;
	Fri, 14 Nov 2025 09:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5523C4CEF8;
	Fri, 14 Nov 2025 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763112708;
	bh=9SLKXDXDcKYx8CAlptpWCul6CGP4978X3L5355PI5M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ag4GOtcboNo4bILaEKrxayTQPTvsdBl5wBVf5GkH3q6dlPXzueh6y5fNuZDVLUtht
	 QtJWuQ1HG06LJdQpeKercDqWSF5njGVKcd8umY/ScnGZJM97OmJQaXPGumDUbUsCiT
	 ks9H42BaoMevwsNdi+oOpT7TiWXrJp7pQW9X5BfmRL36TJz67Q64gTlysM1mfNEN2l
	 KW1Scdj9EpB7dkj7/5iq+q3hjSFKkOzw64SGHsMVmPC1bUPcy+GHlii8XE46fZEIju
	 c2FKPYLO0yM4JKjDUiMAWGxDdBBFE4vJWEkcJxn0nlBZeELM6ocqpWL7txsfp/NFei
	 exSzj8u/CkyYA==
Date: Fri, 14 Nov 2025 15:01:40 +0530
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
Message-ID: <aRb2_OmkRTD46vnx@sumit-X1>
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-3-sumit.garg@kernel.org>
 <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
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

On Fri, Nov 14, 2025 at 10:26:03AM +0100, Ard Biesheuvel wrote:
> On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > EFI ResetSystem runtime service allows for platform specific reset type
> > allowing the OS to pass reset data for the UEFI implementation to take
> > corresponding action. So lets pass the reboot cmd parameter for the EFI
> > driver to determine whether it's a platform specific reset requested or
> > not.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  arch/arm64/kernel/process.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > index fba7ca102a8c..51784986c568 100644
> > --- a/arch/arm64/kernel/process.c
> > +++ b/arch/arm64/kernel/process.c
> > @@ -136,7 +136,7 @@ void machine_restart(char *cmd)
> >          * ResetSystem().
> >          */
> >         if (efi_enabled(EFI_RUNTIME_SERVICES))
> > -               efi_reboot(reboot_mode, NULL);
> > +               efi_reboot(reboot_mode, cmd);
> >
> 
> I agree with the general principle. However, there are already
> existing callers of kernel_restart() that would end up passing a
> random string to efi_reboot(), resulting in platform specific reset
> with undefined result.

Yeah true but the UEFI spec says:

"If the platform does not recognize the EFI_GUID in ResetData the platform
must pick a supported reset type to perform. The platform may optionally
log the parameters from any non-normal reset that occurs."

So, in these cases the UEFI implementation can fallback to normal reset
optionally logging the reset data being passed. Does that sounds
reasonable to you?

-Sumit

> 
> E.g.,
> 
> $ git grep kernel_restart\(\"
> drivers/md/dm-verity-target.c:          kernel_restart("dm-verity
> device corrupted");
> drivers/md/dm-verity-target.c:  kernel_restart("dm-verity device has
> I/O error");
> drivers/memory/emif.c:                  kernel_restart("SDRAM
> Over-temp Emergency restart");
> 
> 
> >         /* Now call the architecture specific reboot code. */
> >         do_kernel_restart(cmd);
> > --
> > 2.48.1
> >

