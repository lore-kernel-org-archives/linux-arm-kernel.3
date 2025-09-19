Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CF8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZq8YghnMNCaJj1peqI6w/TfkIuWlr4vfvIWt6jVyAI=; b=cPZelAV33qcP1lB3LefHro+9ng
	EjLH/bzpdE9QKudMcRlfG9BLj1ga6BnA6CHRrPVg37sfJMbEIFpHQsDSo5PcPMz/GBPTt+FfMi+5u
	jbs1+DCdjmWpHkmk3SwLOjC+eh43XRm5tO19r1wVs8zm7PyhBoixasxvSql8bExTACidOaVbV92xr
	oSarTpXs2QoNgazf3txu/QCp3cGcA9gDbDjkpMzeAYSADDoyXNWsxNh4ClF//oHZul6Urda+xm1w6
	pfdZ+rDkv53tqGBZlB1In4QfkNRIFIozAYqHBEFI5Cq/l010Fh8q7RIPKXrcN9xWTe93HrLNTXCF+
	sFdhBo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbNe-000000031co-1t6d;
	Fri, 19 Sep 2025 13:42:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbNc-000000031cQ-2Tki
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B743644A61
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 13:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9622DC4CEFC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758289347;
	bh=VD9twcb7S80CWtXroi12j7zJyLQewjL/Uh8dbBcqjKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YbW7a68aWSJxQEfmTEPnCmr11Z2hvNwSBS/1T508pGv4HRlYeL+Y+U5Sf8u2O0BtO
	 kWFuvqOA59UsVdf9bwfNLIl70YHRbaNNLV8KQGDoZwY+Z+DVrGlGttxJKCgvuN8P0T
	 17NpHMU9XFYMkAVJQzrKsif4n/e5004EriNYjkF+6qv6yLCJojhNCt9JovMI42Se9X
	 GWUOmwScY43XVBStyjc/QlurNEI+ii+hQpykMoVxihY+LObjXy9e9BVlyWVDrIwmfY
	 WZ0Su7L0QT0mff4d8Qp8jerN/mNPxZfchVsYdnaiMMqEEIvTyvFUO+pMomfBh9Yleq
	 8cTevw6nkr85g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-577232b26a6so2108600e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:42:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvbnHQeURvu9KSNcPwP33VMd4xvo3d5GIj6EZqlQk4Nk2k7sJHkw6Nq4xB+ySe4BPY1EG3kGqUKb8mOeJCEC/e@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Yz2/Or9VVQQBS/RGUzHvRwarlPHW4k5jMEWXJ9bheyMlJSK3
	JIoUKlbx/sXjLCjvxd2sU7QKikgCLtSbYIRBfs3mkr+N2tscEuOf27Z+FSUbUsL2su0Jd1RGG85
	k6r/cGK3E4zbooQ8K6FZiYR5qINF/6XQ=
X-Google-Smtp-Source: AGHT+IEVHQt1+umL/shZjWxswdEHXPWfiF7ZzA5sdLmn3VX8+SoqCosMzyNK1tpKJwOoXR+4DBwNsPqC86+/RqtDsIE=
X-Received: by 2002:a05:6512:20da:b0:55f:6c08:a15a with SMTP id
 2adb3069b0e04-579e213146cmr1070509e87.32.1758289345910; Fri, 19 Sep 2025
 06:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
 <20250918103010.2973462-16-ardb+git@google.com> <aM0_96QvR-hlYMJJ@willie-the-truck>
In-Reply-To: <aM0_96QvR-hlYMJJ@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 19 Sep 2025 15:42:12 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHDtTNMzih7OoTYU0vN4M3mOmFL3YOfaPUKReyJQA6uAQ@mail.gmail.com>
X-Gm-Features: AS18NWAfcXjUAqbspxju1lDMLZ8UsXKdDJ3RZBNTTMabN4mFPEeu8uYKA9lxEsc
Message-ID: <CAMj1kXHDtTNMzih7OoTYU0vN4M3mOmFL3YOfaPUKReyJQA6uAQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] arm64/efi: Use a mutex to protect the EFI stack
 and FP/SIMD state
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_064228_671996_596B2010 
X-CRM114-Status: GOOD (  26.19  )
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

On Fri, 19 Sept 2025 at 13:35, Will Deacon <will@kernel.org> wrote:
>
> On Thu, Sep 18, 2025 at 12:30:17PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Replace the spinlock in the arm64 glue code with a mutex, so that
> > the CPU can preempted while running the EFI runtime service.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/efi.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> > index 0d52414415f3..4372fafde8e9 100644
> > --- a/arch/arm64/kernel/efi.c
> > +++ b/arch/arm64/kernel/efi.c
> > @@ -166,15 +166,22 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
> >       return s;
> >  }
> >
> > -static DEFINE_RAW_SPINLOCK(efi_rt_lock);
> > +static DEFINE_MUTEX(efi_rt_lock);
> >
> >  bool arch_efi_call_virt_setup(void)
> >  {
> >       if (!may_use_simd())
> >               return false;
> >
> > +     /*
> > +      * This might be called from a non-sleepable context so try to take the
> > +      * lock but don't block on it. This should never fail in practice, as
> > +      * all EFI runtime calls are serialized under the efi_runtime_lock.
> > +      */
> > +     if (WARN_ON(!mutex_trylock(&efi_rt_lock)))
> > +             return false;
>
> If it will never fail in practice, why do we need the lock at all? Can we
> just assert that the efi_runtime_lock is held instead and rely on that?
>

Excellent point.

Do you mean a lockdep assert? efi_runtime_lock is a semaphore, so
there is no is_locked() API that we can BUG() on here.

