Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD60ECAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RELT8cm+CTOMxSgsE561hEFSBzHsg30PDo1zF6NnyI=; b=pAIrapNycXAtHTqwOfdn/1FUWY
	UL+PZAcQIB16ZdzFBjofqGO7y9hMaPlBI7kLtRNYmcmRwbAzVulEu7+vXP5TK00Vv8aQKdZth/2ha
	Q/B4XipgoPgHzF6G8CRCou7IWP91Zx0AGrx7yHmdAIFyAoAT/5yNt/s98YGWJGKSpB0CVtBfIVekc
	tauD/K6ybr3D6OaMPwBUyRb2AaFO5c8HCbm8A5MXQupANUiioc1KFQ/LqYmk84EFg0vt0t0L9ohcu
	NjkKpO5cCiUWHsVQ5dWSzrG61YnY2umF8B638FZa0FT2WYaCG+o4z18co0dhP3LkS7yoG8oN4WsbW
	hbBS/WJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD7g-0000000HGFi-2Sik;
	Thu, 18 Sep 2025 11:48:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzD7g-0000000HGFY-0XPN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B33D6024C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A746C113D0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196103;
	bh=RTUNOwYnHz3bm7fXFE054iF4e70EGE1OcyC40tA5Vwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pyWGX9ekGA9wIniFXQFYd36XcgJrRczjKNwyyMmfLI/zXQSn8AXuByyOulFWaWWa2
	 LKmbRBlz9rxzv8mhwGUh0Mqe44q4Ha6FbcXwkorZ3ncub5G7hydpe4seTfEwTCRR5t
	 Sj7d58ma4J+FK1bCM1gyZqhuO3DapMdAf2R6NJr18ZEOnqzlQZLF3OHE9TeqmjCbT5
	 qHZZiSuWt2HlAytQp4BUyj4myxGi8iOiJAK+JZyOMTUTxBcruVVG8/4dnalThfVYTU
	 sxWpsK5jv0mdpbL8CcOxTCA/2g39qD5dUaTvIeML6yHlLkGWLElq32qlyWnFfRELjK
	 mNzxy0PWmhiyg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-579363a4602so513761e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 04:48:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+CVih48LbYtJGnTwgasg3QKtLppzCNG4e5bVp8twVc3nMmdZwNYrby2PVrJuU8dM6HKxFW3G9p48zzCeeHNzT@lists.infradead.org
X-Gm-Message-State: AOJu0YzxD2rxvXNKALJbgUCzTKuGjaWJSn+HZpFb1yfBM7Aa643x5SpF
	3XbULJbw/WhPNQ7Q3b7DFM1b2/IoeTwch3oxjhekPXrDcoq20gijmHU4vtt8qmMO6dMGw8zSkmW
	/BPJW6mwrZsiqIHJukjnJajAL/DNNCcc=
X-Google-Smtp-Source: AGHT+IGF0M6CdiMEFapSpsuAEcu8LEGsyj1+Ha6uD9bZ+JbV0vSO/y4+K4BYQUjIeTJU4lG+5fWipTeDfHAPo6wMBJM=
X-Received: by 2002:a05:6512:32c6:b0:55f:601d:a819 with SMTP id
 2adb3069b0e04-5779a6604d4mr1758174e87.33.1758196101313; Thu, 18 Sep 2025
 04:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
 <CAMj1kXGndZxxe+u3st6FCebrdutUibspA7tJUpqGMgpj9UTFnA@mail.gmail.com> <aMvwstR28CDphk4J@willie-the-truck>
In-Reply-To: <aMvwstR28CDphk4J@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 18 Sep 2025 13:48:10 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF1AAE9sLvDR0YwjZ0pDcnGG4cwqcy6VadUF-jOa7GkJw@mail.gmail.com>
X-Gm-Features: AS18NWCkpq6FAgVrtvz42UXpOw-zfg2xngxs2fJpZJ76gvKhtfUyxwhkKEjs2jU
Message-ID: <CAMj1kXF1AAE9sLvDR0YwjZ0pDcnGG4cwqcy6VadUF-jOa7GkJw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] arm64: Make EFI calls preemptible
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>
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

On Thu, 18 Sept 2025 at 13:44, Will Deacon <will@kernel.org> wrote:
>
> On Thu, Sep 18, 2025 at 01:33:48PM +0200, Ard Biesheuvel wrote:
> > On Thu, 18 Sept 2025 at 12:30, Ard Biesheuvel <ardb+git@google.com> wrote:
> > >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > The arm64 port permits the use of the baseline FP/SIMD register file in
> > > kernel mode, and no longer requires preemption to be disabled. Now that
> > > the EFI spec is being clarified to state that EFI runtime services may
> > > only use baseline FP/SIMD, the fact that EFI may code may use FP/SIMD
> > > registers (while executing at the same privilege level as the kernel) is
> > > no longer a reason to disable preemption when invoking them.
> > >
> > > This means that the only remaining reason for disabling preemption is
> > > the fact that the active mm is swapped out and replaced with efi_mm in a
> > > way that is hidden from the scheduler, and so scheduling is not
> > > supported currently. However, given that virtually all (*) EFI runtime
> > > calls are made from the efi_rts_wq workqueue, the efi_mm can simply be
> > > loaded into the workqueue worker kthread while the call is in progress,
> > > and this does not require preemption to be disabled.
> > >
> > > Note that this is only a partial solution in terms of RT guarantees,
> > > given that the runtime services execute at the same privilege level as
> > > the kernel, and can therefore disable interrupts (and therefore
> > > preemption) directly. But it should prevent scheduling latency spikes
> > > for EFI calls that simply take a long time to run to completion.
> > >
> > > Changes since v2:
> > > - Permit ordinary kernel mode FP/SIMD with IRQs disabled, so that the
> > >   special EFI case only deals with invocations in hardirq or NMI context
> > > - Disallow EFI runtime calls in hardirq or NMI context, so that the
> > >   special FP/SIMD handling for EFI can be dropped entirely
> > > - Use a mutex rather than a semaphore for the arm64 EFI runtime lock,
> > >   now that it is never trylock()ed in IRQ or NMI context.
> > >
> > > Changes since v1/RFC:
> > > - Disable uaccess for SWPAN before updating the preserved TTBR0 value
> > > - Document why disabling migration is needed
> > > - Rebase onto v6.17-rc1
> > >
> > > (*) only efi_reset_system() and EFI pstore invoke EFI runtime services
> > >     without going through the workqueue, and the latter only when saving
> > >     a kernel oops log to the EFI varstore
> > >
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Mark Brown <broonie@kernel.org>
> > >
> > > Ard Biesheuvel (8):
> > >   efi: Add missing static initializer for efi_mm::cpus_allowed_lock
> > >   efi/runtime: Return success/failure from arch_efi_call_virt_setup()
> > >   efi/runtime: Deal with arch_efi_call_virt_setup() returning failure
> >
> > Unless anyone objects, I am going to queue up these 3 patches ^^^ via
> > the EFI tree.
> >
> > >   arm64/fpsimd: Permit kernel mode NEON with IRQs off
> > >   arm64/fpsimd: Drop special handling for EFI runtime services
> > >   arm64/efi: Use a mutex to protect the EFI stack and FP/SIMD state
> > >   arm64/efi: Move uaccess en/disable out of efi_set_pgd()
> > >   arm64/efi: Call EFI runtime services without disabling preemption
> > >
> >
> > ... so the rest can go in via the arm64 tree in the next cycle.
>
> I'm also happy to take the whole lot via arm64 this cycle, if you like?
> I reviewed it a while ago and was happy with it then.
>

I've made some major changes this time, so please double check that
you're still ok with it.

In particular, I've ripped out all of the special EFI handling in fpsimd.c

