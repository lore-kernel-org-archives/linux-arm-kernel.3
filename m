Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6129ED3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 23:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY9nkVa89OOZQwOmpnFC/38XuP13fwqB6+4JsiPdqRg=; b=Q4o8zJ2EHBrFHKG4U1GK3OmveY
	PMk4JpAcPGCvdNDCWr5/5Gu/AnUH3g0qQkYLv4inDzwYeV51qDOuT9NL4pIRuSbsg95iD/fP9B9AM
	Lbg8TGsF+wI35sd/ZEKd00O0jrhAi43nXPGvskoVFeq8GxfzgeonGRBHixHaNAu16AUw02Cg72Rss
	y2stqwK+IiX7+GT2kdBzPJSVreIXZlbQRTzt1zmHLUJmMnmRO4IEhY5BaHwj8VPz5VcDvLRVnfU58
	D4GEPZWZMRz34PxdlZobGu8j+N88y61y8z7W7+CozjWh+RJvj9oW5i27KnOOZPnjuPdnJjpZH1GAm
	16lIl/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSkai-0000000DcfM-0QRg;
	Mon, 08 Dec 2025 23:24:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSkaf-0000000Dcev-1x6V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 23:24:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27BC542DDE;
	Mon,  8 Dec 2025 23:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2066C4CEF1;
	Mon,  8 Dec 2025 23:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765236264;
	bh=daj4a+uPh2c3Xc1peJSyoolEr/C456XKe1rbcDZ5X1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXVkIrQDnUiIaSTr2epUv+ZU7vnvWAdFM2RqZEJBw/22zwN+jZrKlW0fFRPxXpJra
	 RiDd5jxWnpd+3M3yIegWiH1x++iYyzhIpLb9ZYyzIMp00ppL9+RsJX/8WLncIBkNmp
	 eJxlvyaH1MFTqnrgFy1L4jXlWdTG97zRN5vAZPzHMIA5ZDalB8EG3FtzCL4lv/bqeV
	 fG+3fUC4hnptJDxbrKj5rmcUiAm7mHazHoyoYhTK3wTsNTXa8FIf4UopZzX0YltFYA
	 IDUxdUuS9w8CgxPf/rh/CpwaTyxdaOa843UlrF54U70PPAqACa/1Eg/pyuasA1Q/eo
	 kh6xgeuY2zi9A==
Date: Mon, 8 Dec 2025 15:24:22 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] arm64/simd: Avoid pointless clearing of FP/SIMD buffer
Message-ID: <20251208232422.GD1853@quark>
References: <20251204162815.522879-2-ardb@kernel.org>
 <20251205064809.GA26371@sol>
 <CAMj1kXE8qn7MSY1A31CrHRSxw+NXqNGLo=FLo4D-COMhxPAMiw@mail.gmail.com>
 <20251207013004.GA143349@sol>
 <CAMj1kXEWYQYW92=yRG6sJmmrjc8MBz-fdauxX2pq+P2rKhcxmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEWYQYW92=yRG6sJmmrjc8MBz-fdauxX2pq+P2rKhcxmg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_152425_551381_5B2AD805 
X-CRM114-Status: GOOD (  44.97  )
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

On Sun, Dec 07, 2025 at 10:59:29AM +0100, Ard Biesheuvel wrote:
> On Sun, 7 Dec 2025 at 02:30, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Fri, Dec 05, 2025 at 09:13:46AM +0100, Ard Biesheuvel wrote:
> > > On Fri, 5 Dec 2025 at 07:50, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > On Thu, Dec 04, 2025 at 05:28:15PM +0100, Ard Biesheuvel wrote:
> > > > > The buffer provided to kernel_neon_begin() is only used if the task is
> > > > > scheduled out while the FP/SIMD is in use by the kernel, or when such a
> > > > > section is interrupted by a softirq that also uses the FP/SIMD.
> > > > >
> > > > > IOW, this happens rarely, and even if it happened often, there is still
> > > > > no reason for this buffer to be cleared beforehand, which happens by
> > > > > default when using a compiler that supports -ftrivial-auto-var-init.
> > > > >
> > > > > So mark the buffer as __uninitialized. Given that this is a variable
> > > > > attribute not a type attribute, this requires that the expression is
> > > > > tweaked a bit.
> > > > >
> > > > > Cc: Will Deacon <will@kernel.org>,
> > > > > Cc: Catalin Marinas <catalin.marinas@arm.com>,
> > > > > Cc: Kees Cook <keescook@chromium.org>
> > > > > Cc: Eric Biggers <ebiggers@kernel.org>
> > > > > Cc: Justin Stitt <justinstitt@google.com>
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > ---
> > > > >  arch/arm64/include/asm/simd.h | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > The issue here is that returning a pointer to an automatic variable as
> > > > > it goes out of scope is slightly dodgy, especially in the context of
> > > > > __attribute__((cleanup())), on which the scoped guard API relies
> > > > > heavily. However, in this case it should be safe, given that this
> > > > > expression is the input to the guarded variable type's constructor.
> > > > >
> > > > > It is definitely not pretty, though, so hopefully here is a better way
> > > > > to attach this.
> > > > >
> > > > > diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> > > > > index 0941f6f58a14..825b7fe94003 100644
> > > > > --- a/arch/arm64/include/asm/simd.h
> > > > > +++ b/arch/arm64/include/asm/simd.h
> > > > > @@ -48,6 +48,7 @@ DEFINE_LOCK_GUARD_1(ksimd,
> > > > >                   kernel_neon_begin(_T->lock),
> > > > >                   kernel_neon_end(_T->lock))
> > > > >
> > > > > -#define scoped_ksimd()       scoped_guard(ksimd, &(struct user_fpsimd_state){})
> > > > > +#define scoped_ksimd()       \
> > > > > +     scoped_guard(ksimd, ({ struct user_fpsimd_state __uninitialized s; &s; }))
> > > >
> > > > Ick.  I should have looked at the generated code more closely.
> > > >
> > > > It's actually worse than you describe, because the zeroing is there even
> > > > without CONFIG_INIT_STACK_ALL_ZERO=y, simply because the
> > > > user_fpsimd_state struct is declared using a compound literal.
> > > >
> > > > I'm afraid that this patch probably isn't a good idea, as it relies on
> > > > undefined behavior.  Before this patch, the user_fpsimd_state is
> > > > declared using a compound literal, which takes on its enclosing scope,
> > > > i.e. the 'for' statement generated by scoped_guard().  After this patch,
> > > > it's in a new inner scope, and the pointer to it escapes from it.
> > > >
> > > > Unfortunately I don't think there's any way to solve this while keeping
> > > > the scoped_ksimd() API as-is.
> > > >
> > >
> > > How about
> > >
> > > --- a/arch/arm64/include/asm/simd.h
> > > +++ b/arch/arm64/include/asm/simd.h
> > > @@ -48,6 +48,8 @@ DEFINE_LOCK_GUARD_1(ksimd,
> > >                     kernel_neon_begin(_T->lock),
> > >                     kernel_neon_end(_T->lock))
> > >
> > > -#define scoped_ksimd() scoped_guard(ksimd, &(struct user_fpsimd_state){})
> > > +#define scoped_ksimd()         __scoped_ksimd(__UNIQUE_ID(fpsimd_state))
> > > +#define __scoped_ksimd(id)     struct user_fpsimd_state __uninitialized id; \
> > > +                               scoped_guard(ksimd, &id)
> >
> > I guess that will work.  It's not great that it will make scoped_ksimd()
> > expand into more than one statement, which is error-prone and not
> > normally allowed in macros.  But it looks okay for all the current users
> > of it.
> >
> 
> We could always repeat the 'for()' trick that the cleanup helpers use, e.g.,
> 
> for (struct user_fpsimd_state __uninitialized __st; true; ({ goto label; }))
>     if (0) {
> label:    break;
>     } else scoped_guard(ksimd, &__st)
> 
> Would you prefer that?

Hmm, I didn't consider using nested 'for' statements.  It looks like
that should solve the problem.  It makes the implementation a bit harder
to understand, but at least the 'for' statement trick isn't new...
Could you send a patch?  Preferably with a clear comment that documents
why it's done this way.

- Eric

