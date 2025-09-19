Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69572CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iwq8CufqGGzYByUQpGwVb8BDEdC4M7DdgjmJpFRas+E=; b=IydTTgFaKBEDk9wZ2m+k6Vr6/q
	kASTBTMHjxUw8A5D8W1GXjD6Vbx3O065xPa8b5IW93pqGfeGfz1VncGxcTwGwf3JL+9LKM1GuGPrY
	fed7HC8uLesnDRg7y+ctp/fMmYUI4QwU6JVLb4ulVnLldxrGyIP5dgJkRgBk7K19aXRdCuRanoWwt
	sEwUfwiYqaStqpeqDuQUgv2eD2HVFYcBiLuIC0xMABGLr5EBj1CoTSBM3Ee2XT+YJ6p1EyLZJJzdV
	mz8Ow0VoI77iOYAR40PPLstbcohFvFk1p8k59eEPLimm3BkDeopns+lV8zvpcPZdgCoI1o3mtton0
	95Ece1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZRa-00000002itY-2nqL;
	Fri, 19 Sep 2025 11:38:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZRY-00000002isp-18aX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9E4D442AD;
	Fri, 19 Sep 2025 11:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1168C4CEF0;
	Fri, 19 Sep 2025 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758281903;
	bh=vidOkY7U3aiEQG+l70hGzhfUzsMhfAF1dJHgRebiUMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCwf0nIJ2NO0jzAzO+tjoHLC4pkI79O4txtEutDJD9H2tq0ue553u1NLK/+A8vg+4
	 1Ta+BjvEMnzptkOy52E7ECxAXzxxA1OwtNBnzPaupKpynRp7lcStlZtwT0lOqrcDVh
	 G2/RuxROojKq4iU0mE9Ahggzk1IOt3siUdkaPgRSezTueqbPdAnarIIHa5hRkHz8yf
	 ltVlDqcR5Sh4apOY0wFBtZwQ9JMXyH3qBTLwt3X+7T3TUpue/oBWe7qp3AyM/D/yKS
	 HnTNyDC/jN/ZK2mTNp+bTsxsLXdiTYbsiQnxAZtyCXBdv7S04DWfSGlyznCTmvIYnu
	 16s1S6eEiS+iA==
Date: Fri, 19 Sep 2025 12:38:18 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] arm64: Make EFI calls preemptible
Message-ID: <aM1AqmHc7boSipIl@willie-the-truck>
References: <20250918103010.2973462-10-ardb+git@google.com>
 <CAMj1kXGndZxxe+u3st6FCebrdutUibspA7tJUpqGMgpj9UTFnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGndZxxe+u3st6FCebrdutUibspA7tJUpqGMgpj9UTFnA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_043824_358736_1C59784E 
X-CRM114-Status: GOOD (  32.27  )
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

On Thu, Sep 18, 2025 at 01:33:48PM +0200, Ard Biesheuvel wrote:
> On Thu, 18 Sept 2025 at 12:30, Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The arm64 port permits the use of the baseline FP/SIMD register file in
> > kernel mode, and no longer requires preemption to be disabled. Now that
> > the EFI spec is being clarified to state that EFI runtime services may
> > only use baseline FP/SIMD, the fact that EFI may code may use FP/SIMD
> > registers (while executing at the same privilege level as the kernel) is
> > no longer a reason to disable preemption when invoking them.
> >
> > This means that the only remaining reason for disabling preemption is
> > the fact that the active mm is swapped out and replaced with efi_mm in a
> > way that is hidden from the scheduler, and so scheduling is not
> > supported currently. However, given that virtually all (*) EFI runtime
> > calls are made from the efi_rts_wq workqueue, the efi_mm can simply be
> > loaded into the workqueue worker kthread while the call is in progress,
> > and this does not require preemption to be disabled.
> >
> > Note that this is only a partial solution in terms of RT guarantees,
> > given that the runtime services execute at the same privilege level as
> > the kernel, and can therefore disable interrupts (and therefore
> > preemption) directly. But it should prevent scheduling latency spikes
> > for EFI calls that simply take a long time to run to completion.
> >
> > Changes since v2:
> > - Permit ordinary kernel mode FP/SIMD with IRQs disabled, so that the
> >   special EFI case only deals with invocations in hardirq or NMI context
> > - Disallow EFI runtime calls in hardirq or NMI context, so that the
> >   special FP/SIMD handling for EFI can be dropped entirely
> > - Use a mutex rather than a semaphore for the arm64 EFI runtime lock,
> >   now that it is never trylock()ed in IRQ or NMI context.
> >
> > Changes since v1/RFC:
> > - Disable uaccess for SWPAN before updating the preserved TTBR0 value
> > - Document why disabling migration is needed
> > - Rebase onto v6.17-rc1
> >
> > (*) only efi_reset_system() and EFI pstore invoke EFI runtime services
> >     without going through the workqueue, and the latter only when saving
> >     a kernel oops log to the EFI varstore
> >
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Mark Brown <broonie@kernel.org>
> >
> > Ard Biesheuvel (8):
> >   efi: Add missing static initializer for efi_mm::cpus_allowed_lock
> >   efi/runtime: Return success/failure from arch_efi_call_virt_setup()
> >   efi/runtime: Deal with arch_efi_call_virt_setup() returning failure
> 
> Unless anyone objects, I am going to queue up these 3 patches ^^^ via
> the EFI tree.
> 
> >   arm64/fpsimd: Permit kernel mode NEON with IRQs off
> >   arm64/fpsimd: Drop special handling for EFI runtime services
> >   arm64/efi: Use a mutex to protect the EFI stack and FP/SIMD state
> >   arm64/efi: Move uaccess en/disable out of efi_set_pgd()
> >   arm64/efi: Call EFI runtime services without disabling preemption
> >
> 
> ... so the rest can go in via the arm64 tree in the next cycle.

As discussed off-list, that's probably the best plan for now. I've left
a few small comments on some of the arm64 bits and it would be good to
give them some soak time in -next.

Cheers,

Will

