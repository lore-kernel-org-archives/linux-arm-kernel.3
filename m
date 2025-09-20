Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26639CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5++l3YAvcc0X0AXa0X72ypgYghNHrfn5Pb4eEDJB2w=; b=3MXhQQ0XbCYqzMISKWoB3XZPGL
	4w9124YmIJ9L0ykDBL7OAYUpvRj8K2US36OCSWKI56VoZd5gQ2wKfXskyBsKgBs21hJYW2DRtNSex
	ZS8U+w1KDW2pS1vZvM8E0IQ2z21VUX7a3uInVor+8hU6yfoDHxAcB6jeVtJLHDpcwlMAviys3MYvb
	JbAXGqWKqYjg+ENZUxcHd7qc4besVdE/YQW0aE2q6Moxhf9EQzM/wvzSGJJfEdvkGU8ZstMmvSHm6
	S55Zy769436Rh40z+26og7rn6kBdKb1K1CgZYihhkh2Z8hylVskx9Vwd2t8hNAMDgVFmv01VlDcKO
	pX9jjO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzrIr-00000004u0O-3PHl;
	Sat, 20 Sep 2025 06:42:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzrIq-00000004u0G-0Nnk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 06:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CBC260194;
	Sat, 20 Sep 2025 06:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0AAC4CEEB;
	Sat, 20 Sep 2025 06:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758350554;
	bh=5e3PO9sm0kwZZFFmVI0IYn8SvQHCwKEdjnXvKF3BC1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eiOL+rYtzseHizgBdLkpV2WcDHnv5fPjcfRCjLBfHzSWkBN2a3KsMopc9Fd3QCDyS
	 hyC2JVsFh17sKWtgyDvpZilU1KS5EoWJWJjBh/m0H3YNZcNN+7JTqO8doM3uZY1sGF
	 jtvXkUyHtqjGr6GycW2lX6PRYTtfh+UlTo0sAxQeTdhwXbUJZOY/DeScAgZjvg73Fp
	 6GUx0bpmnmzhEFVOWVZY5BOsXxnjhBYIVbucc46xNnKMimf3wovh53geDfnK4Le472
	 tWR0FsvSzrcktUaOuDdqBrho02HmoWK5pvp8Fzn4zntrrZJ/GV7y68PKj6X+LWkZCf
	 yZz/w3g0W0egg==
Date: Fri, 19 Sep 2025 23:42:34 -0700
From: Kees Cook <kees@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/5] arm64: Move kernel mode FPSIMD buffer to the stack
Message-ID: <202509192219.E69A1FDA5@keescook>
References: <20250918063539.2640512-7-ardb+git@google.com>
 <20250919193221.GB2249@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919193221.GB2249@quark>
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

On Fri, Sep 19, 2025 at 02:32:21PM -0500, Eric Biggers wrote:
> On Thu, Sep 18, 2025 at 08:35:40AM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
> > context switch out of struct thread_struct, and onto the stack, so that
> > the memory cost is not imposed needlessly on all tasks in the system.
> > 
> > Patches #1 - #3 contains some prepwork so that patch #4 can tighten the
> > rules around permitted usage patterns of kernel_neon_begin() and
> > kernel_neon_end(). This permits #5 to provide a stack buffer to
> > kernel_neon_begin() transparently, in a manner that ensures that it will
> > remain available until after the associated call to kernel_neon_end()
> > returns.
> > 
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > 
> > Ard Biesheuvel (5):
> >   crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
> >   crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
> >   crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
> >   arm64/fpsimd: Require kernel NEON begin/end calls from the same scope
> >   arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack
> > 
> >  arch/arm64/crypto/aes-ce-ccm-glue.c |  5 +--
> >  arch/arm64/crypto/sm4-ce-ccm-glue.c | 10 ++----
> >  arch/arm64/crypto/sm4-ce-gcm-glue.c | 10 ++----
> >  arch/arm64/include/asm/neon.h       |  7 ++--
> >  arch/arm64/include/asm/processor.h  |  2 +-
> >  arch/arm64/kernel/fpsimd.c          | 34 +++++++++++++-------
> >  6 files changed, 34 insertions(+), 34 deletions(-)
> 
> This looks like the right decision: saving 528 bytes per task is
> significant.  528 bytes is a lot to allocate on the stack too, but
> functions that use the NEON registers are either leaf functions or very
> close to being leaf functions, so it should be okay.
> 
> The implementation is a bit unusual, though:
> 
>    #define kernel_neon_begin()	do { __kernel_neon_begin(&(struct user_fpsimd_state){})
>    #define kernel_neon_end()	__kernel_neon_end(); } while (0)
> 
> It works, but normally macros don't start or end code blocks behind the
> scenes like this.  Perhaps it should be more like s390's
> kernel_fpu_begin(), where the caller provides the buffer that the
> registers are stored in?  

We've done stuff like this in the past, but I did wonder if we could use
any of the cleanup.h style logic to do this instead of the split
do/while? I think this would work, totally untested:

DEFINE_LOCK_GUARD_0(neon,
		    __kernel_neon_begin(&(struct user_fpsimd_state){}),
		    __kernel_neon_end())
...
scoped_guard(neon) {
	do neon things
}

It would require a fair bit of refactoring to replace the existing
begin/end code, though...

-- 
Kees Cook

