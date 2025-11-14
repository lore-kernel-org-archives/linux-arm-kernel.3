Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD3CE7A9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1tLX+xuKzmdyihsb1pCzqn0lz0XKWQVf8aouKadW5M=; b=UakETtEJJ6wxxlmrYVkbpIxN8V
	kvzMVg7K+CV7fTogWASPYR9gU4Zy0ggqZYA65otTOX7ZCDN83sEQ4DhS5foodY4RJ+EPFaT8P9nxk
	kOoKWzhWjC9EVrkniDJ9jwuL2dnuefoVTDqkkGO7u86CH7gVt4e82EwD1rwQElcS7WJ8dBebdfLik
	6eEOrhwowQrIiCSKiQkAUFa0MWe3MTAJoWbqJ1dvySOUUGJ9rJotOowKby3N0GH4PNnatTbbftAJp
	GT8mMvS7a2x3GzKXrL8OAu8heLPFYNdLdXj3O3SSGAphrsCP40Jmbw7dTxUsELlqiy7okJ37vfmVv
	r/1h78cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqDd-0000000BvUq-2riq;
	Fri, 14 Nov 2025 09:35:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqDd-0000000BvUh-0Rxc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D8AA6016F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 09:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A52C19425
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 09:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763112948;
	bh=IMgsq5NLDauGbubQ+vg0+EcdIkmlxJGaT+Z86MVPqmo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YSLVycc1S0+SdvWrf6SD7ReLZAfdPsQBV7s9i7tNf87Hi/G6ycX+QNOov7yclVaN4
	 SpZcukTTtBvNAx3ErZfltD5hyx1PiQ39eMGdaYorX8OdmyOBR6/TdRlmekzKYfKZwN
	 0+t2PA2QCbRRvBdZXGkudcKxyGUbZVymKvjwQnWMAi9uxzQmV7m+WKPHna3iaiY9Cv
	 LnbHjc/+RzWrVTxGwouoxmDr4gwugy1HyVytHjTIsG0wMCkk24OoOOFtkBi/us4Q52
	 jDGa4KduVPQ0QGiI8j85Mz04cv3Dffq++gtmfWYP8uEPM26GnNcBq/OApY2ypYjIRN
	 JadPvlQLYv9WQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5942b58ac81so1340058e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 01:35:47 -0800 (PST)
X-Gm-Message-State: AOJu0YyZXYag4R/52+Kxy+ZEeYa8ui1voZF0yS/x8dTg74+E6gk8OuID
	2iwMdEpkjACz7Io10f7o44z7CQSLwtNOzvtmlX+j2rlmhVWAk4O0Wk0MMMlKuVRHC0OixIBQway
	IeWFWT5yhibqpQfqRiGeYOeUmNRDlX1E=
X-Google-Smtp-Source: AGHT+IH3q+2BE/eD662R1z0CWOc6ecdAgWhnq7pJgLc5m17wfewBjL0ZutIWUMnpAZTqy6QF6uuUeiEciESCDMRcwY0=
X-Received: by 2002:a05:6512:3d25:b0:592:f5f9:f5a9 with SMTP id
 2adb3069b0e04-5958423edd9mr728749e87.36.1763112946284; Fri, 14 Nov 2025
 01:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-3-sumit.garg@kernel.org> <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
 <aRb2_OmkRTD46vnx@sumit-X1> <CAMj1kXFpi1fMuAhuaBbMSd57F79E7Z0u4okzkKL+_6eKfGUKXA@mail.gmail.com>
In-Reply-To: <CAMj1kXFpi1fMuAhuaBbMSd57F79E7Z0u4okzkKL+_6eKfGUKXA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Nov 2025 10:35:33 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE60LrWi8Au6qQ4EMQDFxQCJt5h6hBLuQHCz3HEp=2o3w@mail.gmail.com>
X-Gm-Features: AWmQ_blTsMQdIWNQKj48AZxStQ80RvARP2VHX6V8vSoaIBC-53yr7HTzC35uPM8
Message-ID: <CAMj1kXE60LrWi8Au6qQ4EMQDFxQCJt5h6hBLuQHCz3HEp=2o3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: efi: Pass reboot cmd parameter to efi_reboot()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, andersson@kernel.org, konradybcio@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, shivendra.pratap@oss.qualcomm.com, 
	leif.lindholm@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
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

On Fri, 14 Nov 2025 at 10:33, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 14 Nov 2025 at 10:31, Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Fri, Nov 14, 2025 at 10:26:03AM +0100, Ard Biesheuvel wrote:
> > > On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
> > > >
> > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > >
> > > > EFI ResetSystem runtime service allows for platform specific reset type
> > > > allowing the OS to pass reset data for the UEFI implementation to take
> > > > corresponding action. So lets pass the reboot cmd parameter for the EFI
> > > > driver to determine whether it's a platform specific reset requested or
> > > > not.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/kernel/process.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > > index fba7ca102a8c..51784986c568 100644
> > > > --- a/arch/arm64/kernel/process.c
> > > > +++ b/arch/arm64/kernel/process.c
> > > > @@ -136,7 +136,7 @@ void machine_restart(char *cmd)
> > > >          * ResetSystem().
> > > >          */
> > > >         if (efi_enabled(EFI_RUNTIME_SERVICES))
> > > > -               efi_reboot(reboot_mode, NULL);
> > > > +               efi_reboot(reboot_mode, cmd);
> > > >
> > >
> > > I agree with the general principle. However, there are already
> > > existing callers of kernel_restart() that would end up passing a
> > > random string to efi_reboot(), resulting in platform specific reset
> > > with undefined result.
> >
> > Yeah true but the UEFI spec says:
> >
> > "If the platform does not recognize the EFI_GUID in ResetData the platform
> > must pick a supported reset type to perform. The platform may optionally
> > log the parameters from any non-normal reset that occurs."
> >
> > So, in these cases the UEFI implementation can fallback to normal reset
> > optionally logging the reset data being passed. Does that sounds
> > reasonable to you?
> >
>
> What the UEFI spec says might deviate from how real platforms in the
> field will behave when being passed a reset type that nobody ever
> tried passing before.

Also, the GUID is expected to follow an unbounded NULL terminated
UTF-16 string in memory, so we could easily cause a crash by doing
this if \0\0 doesn't appear in the memory following the string.

