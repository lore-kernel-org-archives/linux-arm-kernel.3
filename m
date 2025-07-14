Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D21DC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+78ZYrii6dH4FjUeAIQvcB56ujFmXwxi0fOf8JOKrQ=; b=SYCG2BlIWKfkfkXj9X2bUuxJLC
	QkUx/I6ebcuPApM2OC0ZH7PVBG/qyYETSz9UEjz3DKw5RuMYi0FI6EDHCSZhRBsGCIgZAhlqbTG4F
	CL7FKudeR1ukxz3EVayjts12aB0JqGyUg2GDce2l3lyFthcgNKMt/he2Qx3dl/4uBPJnU3c2bAxYJ
	iZftdx8oViPxKGH9l+6sY4QPxDtifU//s+D2L27XP/pYthvcjN7lT+ZVY5RM8j2HjVzni9F0Lf8Dj
	djuaOKUN33PB+cbizBg6VJmJWxwHwTJyo/3PbwH5YP2ts/+dpR/md3vjuqoXgmCnmvbh8vj1btq0r
	3/CSaTsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDUx-00000001SDS-1JaQ;
	Mon, 14 Jul 2025 07:21:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCqH-00000001NWc-2NFj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AD2043DC1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6E3C4CEED
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752475151;
	bh=FoVaztxrgRjP723XEHoNpTeXrGoae6UBLEUANs0Qpaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E0BzFd2tMpHuzCAGj0Ha0CVohGxMveMx8per5k7RAhR7NUoko0ZizjF4aMru7nVx+
	 f6DO/K6pD5VjJXRceEphe82jro7Utmnm0HWgud6W2bQfDWJEB/hzU9evMVlCu6LbBk
	 mxkRJe0YzBHASOoAsnfuoyRjYAV/uc1qwbynoV9IIyEhIeSvKS1WZrCspje8ajHZKQ
	 8aCQzFkaP01xv9sFO1evfdyraLMjqgEeh1qCX6moUT5F7RHLN88XbjHpoDDG1eyxdt
	 KSVirQoQ+SBohXHHQHsKQ/1kKzFgE6mRmw4CZTRewqndUcmr3KYh+6S7nmFwo1ToU5
	 azFAeYfAEIU3g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-558fc8f0750so4706527e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:39:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZ3xRYz74J4Fxzb60fCbr7gsZbp+hBN0KI5veUnEmtD7T4k7tgAGERvMjiFehl2KvOWgGtHWttaYpH8JmVISOM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0uh/bsnXS6A6NOgougpNMtjK0DiMf6z5h8oUnUEWfTOGIMYJv
	Lx9RHuecBLr7w10UVFBSqZ9nAjdoYPlfTYVH3b6udYwddGHQT7tcxj7KsmewcGS6xhj8rqFhDa/
	0vOV8FQUbXoRkfYP93yjtwWT8jP0zw/U=
X-Google-Smtp-Source: AGHT+IFxzHHsHKYeCt0f+cMy1PRcE2Hm8loCADPyjxk8BTSemM4PgfyJ8BFt5KB/oTN+yNGLKV77gfsAksW2t1ap+Ik=
X-Received: by 2002:a05:6512:398c:b0:553:2bb2:7890 with SMTP id
 2adb3069b0e04-55a044ee7c4mr2693238e87.25.1752475149885; Sun, 13 Jul 2025
 23:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com> <20250514174339.1834871-15-ardb+git@google.com>
 <aHEUpiXt-pW7DBAN@willie-the-truck>
In-Reply-To: <aHEUpiXt-pW7DBAN@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 16:38:57 +1000
X-Gmail-Original-Message-ID: <CAMj1kXFLZWvEBTX__P6B+3nMn-HZpKaVRkiUmfj35xiG8LH0bQ@mail.gmail.com>
X-Gm-Features: Ac12FXyjnBSSZ8dr1S-plRyUJrxrxaJsBWEcfmexP3uC92-azvZJoR8dJ8zqYvk
Message-ID: <CAMj1kXFLZWvEBTX__P6B+3nMn-HZpKaVRkiUmfj35xiG8LH0bQ@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] arm64/efi: Move uaccess en/disable out of efi_set_pgd()
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233913_715380_8800AE12 
X-CRM114-Status: GOOD (  25.24  )
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

On Fri, 11 Jul 2025 at 23:42, Will Deacon <will@kernel.org> wrote:
>
> On Wed, May 14, 2025 at 07:43:46PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > efi_set_pgd() will no longer be called when invoking EFI runtime
> > services via the efi_rts_wq work queue, but the uaccess en/disable are
> > still needed when using PAN emulation using TTBR0 switching. So move
> > these into the callers.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/include/asm/efi.h | 3 ---
> >  arch/arm64/kernel/efi.c      | 3 +++
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
> > index decf87777f57..abe9176a3a23 100644
> > --- a/arch/arm64/include/asm/efi.h
> > +++ b/arch/arm64/include/asm/efi.h
> > @@ -132,15 +132,12 @@ static inline void efi_set_pgd(struct mm_struct *mm)
> >                        * exception when invoking the EFI run-time services.
> >                        */
> >                       update_saved_ttbr0(current, mm);
> > -                     uaccess_ttbr0_enable();
> > -                     post_ttbr_update_workaround();
> >               } else {
> >                       /*
> >                        * Defer the switch to the current thread's TTBR0_EL1
> >                        * until uaccess_enable(). Restore the current
> >                        * thread's saved ttbr0 corresponding to its active_mm
> >                        */
> > -                     uaccess_ttbr0_disable();
> >                       update_saved_ttbr0(current, current->active_mm);
> >               }
> >       }
> > diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> > index d01ae156bb63..5d188c6c44d7 100644
> > --- a/arch/arm64/kernel/efi.c
> > +++ b/arch/arm64/kernel/efi.c
> > @@ -177,6 +177,8 @@ bool arch_efi_call_virt_setup(void)
> >               return false;
> >
> >       efi_virtmap_load();
> > +     uaccess_ttbr0_enable();
> > +     post_ttbr_update_workaround();
> >       __efi_fpsimd_begin();
> >       return true;
> >  }
> > @@ -185,6 +187,7 @@ void arch_efi_call_virt_teardown(void)
> >  {
> >       __efi_fpsimd_end();
> >       efi_virtmap_unload();
> > +     uaccess_ttbr0_disable();
>
> Moving this after updating the saved TTBR0 isn't great for SWPAN, as it
> means that if we take an exception (e.g. an IRQ) before calling
> uaccess_ttbr0_disable() then I think we'll end up running with the user
> page-table installed briefly in TTBR0 which SWPAN is supposed to prevent
> outside of genuine uaccess sections.
>

OK, I'll respin this to take that into account.

