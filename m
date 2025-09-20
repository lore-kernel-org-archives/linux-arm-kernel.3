Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71969CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LN8tQZpOXEb1sSStnrdSUO0qgJK3wf5NOdo3YmsH1w=; b=U0tjGeur302eMdI5biS7UYm5be
	XRwTLVB0JLtoAVrenM1VuFysiuhE2HUmDtEX3s3g2f9Ew/1m0m3Duvi1CMjPs3LDMgj84uZzmkhYA
	TU7sz30Naao8+ZO4LRIuMV1YMuDW+wnpmLWgaNS8M7EMSdwrzApKzgaQPppBwd1OQLVN/Q0xOcl7C
	Z7KxIDLQ+0Ym5SzTijE6B0lZ6IOKMO5qlg2V3TYBVe3iFVWg4mkBDCA5AGiyrTQe/uk1q+Ge3vOxg
	aXuBt6kKxdWlVxfOp0VMvrZ39jXH8abBmaqY3SyD6As209I1Cf3WDmls+boGWasz7GD+l4u9qaFfx
	zoCnbaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzxWD-00000005OQ3-1d5L;
	Sat, 20 Sep 2025 13:20:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzxWB-00000005OPu-3MHv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 13:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B5666014D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 13:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AB5C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758374446;
	bh=TVKtdkDW5Bx9jo1qL5cjANuXuZINMtgj+qFgRNRgkrA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wq5e436H04RL6eIWDHxcufFHAJuaWfqpAzlKmc3eqM6yC/AlbnYkfdrkCmBYZeLI6
	 /QjLa0xTf88xp/wzEbevNrpcpiCOeMAfu7f8c+y5Ak3Azd3R26r445RTyu95eygZoE
	 R7ODanSAjN0ywnYFE6F/DctWH0HPHCKht8suixoxdf31bCLdVrvnvV9ON5EC5GMEed
	 RZWC4hP4muHVN2sJzQeG7wbs0Nho8nucBHdpC/nA4xOQI9Cpjrc8zDkttV237h2LpV
	 8i/ZzvvnKpce06XtzkhJVDM13FkNCKmFhZTRVT+5HRspuJdbaFXzaxAOU2Gu4k1P0k
	 RdZ0IyGaiL3jg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-578ecc56235so2331352e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Sep 2025 06:20:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiSsLTmjHWVSrUatwAevD9loVDX0RuwEQVCqbRzFd57DViEzEEmRprvNQMGmoWce9a90RjI8h5XUIFpDZcI8Us@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi7HYetHzaIcepbminA1HI2GT6NQcPuSlVIM/+IawnAkv4BkYJ
	FBLCzRSp1HMgJSqGudQJ0xvOxbp+AkBzbMs1n7woR6+e14+mbaT1Bb+43T77I5Hz2A+JqogiyEw
	nsAAJyHmIMBuj+Dvmp4cClLd6D+0hK+Y=
X-Google-Smtp-Source: AGHT+IG1LfUXkrYBNfv5ScoJ3gEzekTWk3ybLBFirhAG7Q4onP+VqcdCQaeYnlnFTAzL/cIlQNiaBfKJ1gXwB5SZmOk=
X-Received: by 2002:a05:6512:6189:b0:571:369a:68bd with SMTP id
 2adb3069b0e04-579e0cb7047mr2382978e87.3.1758374444801; Sat, 20 Sep 2025
 06:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250918063539.2640512-7-ardb+git@google.com> <20250919193221.GB2249@quark>
 <202509192219.E69A1FDA5@keescook>
In-Reply-To: <202509192219.E69A1FDA5@keescook>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 20 Sep 2025 15:20:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFtnDj-kDMPKfbj2hJ9FqVt17EstNSHbzfcmAAYZneS6g@mail.gmail.com>
X-Gm-Features: AS18NWAFCY8dWxTtxlBneqEoZTFZeASnTt4i57qY4hP6cK5XTVyGvIZt8tkXyfU
Message-ID: <CAMj1kXFtnDj-kDMPKfbj2hJ9FqVt17EstNSHbzfcmAAYZneS6g@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: Move kernel mode FPSIMD buffer to the stack
To: Kees Cook <kees@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
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

On Sat, 20 Sept 2025 at 08:42, Kees Cook <kees@kernel.org> wrote:
>
> On Fri, Sep 19, 2025 at 02:32:21PM -0500, Eric Biggers wrote:
> > On Thu, Sep 18, 2025 at 08:35:40AM +0200, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
> > > context switch out of struct thread_struct, and onto the stack, so that
> > > the memory cost is not imposed needlessly on all tasks in the system.
> > >
> > > Patches #1 - #3 contains some prepwork so that patch #4 can tighten the
> > > rules around permitted usage patterns of kernel_neon_begin() and
> > > kernel_neon_end(). This permits #5 to provide a stack buffer to
> > > kernel_neon_begin() transparently, in a manner that ensures that it will
> > > remain available until after the associated call to kernel_neon_end()
> > > returns.
> > >
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Kees Cook <keescook@chromium.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Mark Brown <broonie@kernel.org>
> > >
> > > Ard Biesheuvel (5):
> > >   crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
> > >   crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
> > >   crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
> > >   arm64/fpsimd: Require kernel NEON begin/end calls from the same scope
> > >   arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack
> > >
> > >  arch/arm64/crypto/aes-ce-ccm-glue.c |  5 +--
> > >  arch/arm64/crypto/sm4-ce-ccm-glue.c | 10 ++----
> > >  arch/arm64/crypto/sm4-ce-gcm-glue.c | 10 ++----
> > >  arch/arm64/include/asm/neon.h       |  7 ++--
> > >  arch/arm64/include/asm/processor.h  |  2 +-
> > >  arch/arm64/kernel/fpsimd.c          | 34 +++++++++++++-------
> > >  6 files changed, 34 insertions(+), 34 deletions(-)
> >
> > This looks like the right decision: saving 528 bytes per task is
> > significant.  528 bytes is a lot to allocate on the stack too, but
> > functions that use the NEON registers are either leaf functions or very
> > close to being leaf functions, so it should be okay.
> >
> > The implementation is a bit unusual, though:
> >
> >    #define kernel_neon_begin()        do { __kernel_neon_begin(&(struct user_fpsimd_state){})
> >    #define kernel_neon_end()  __kernel_neon_end(); } while (0)
> >
> > It works, but normally macros don't start or end code blocks behind the
> > scenes like this.  Perhaps it should be more like s390's
> > kernel_fpu_begin(), where the caller provides the buffer that the
> > registers are stored in?
>
> We've done stuff like this in the past, but I did wonder if we could use
> any of the cleanup.h style logic to do this instead of the split
> do/while? I think this would work, totally untested:
>
> DEFINE_LOCK_GUARD_0(neon,
>                     __kernel_neon_begin(&(struct user_fpsimd_state){}),
>                     __kernel_neon_end())
> ...
> scoped_guard(neon) {
>         do neon things
> }
>
> It would require a fair bit of refactoring to replace the existing
> begin/end code, though...
>

Yeah, but I think it's worth it. And let's call it simd and reuse that
on other architectures as well.

The problem with the above, though, is that the temporary stack
variable goes out of scope when the constructor function returns. So
probably better to do something like

DEFINE_LOCK_GUARD_1(simd,
                    struct user_fpsimd_state,
                    __kernel_neon_begin(_T->lock),
                    __kernel_neon_end(_T->lock));

#define scoped_simd() scoped_guard(simd, &(struct user_fpsimd_state){})

leaving the possibility for callers to use scoped_guard() directly and
pass their own user_fpsimd_state pointer.

We'd need to add some debug checks in __kernel_neon_end() to ensure
that the provided pointer matches the one that was passed to
__kernel_neon_begin().

