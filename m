Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DF6D2E00C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da4bpf4Ok7phStKTzyDizM3H9xmZqm3+oD65eWUwzwM=; b=mh3cVyE6SDI1G0quUHMe6B/RRL
	Eb7BQvNuqLXOhyqWNvMP2oSa6w0eD95pEpObYGW4lK32mh/4UfmnEM0vfM/a/rBX34+A/WmnxOqxB
	IfByDtxyQN85aXfpu1iGRB6Pgfp6SqpKowDbOd7JC+Fs2krngThurh+HWeiLp58HEnfDvXGHxLQC+
	0KoN+5zGOEgzFzV/ScxaV4lER7madA2w+SwHxROO2yT31GJ1MRmJQc0Qpl074UZJjVNrQZXKbk5B/
	fQt7PXguOAe1vblK4GmPDl4+tlQ8qQO2Ups5ud8J7fq/tVzROSrzqswjRyMpWK37AQYX4e8KYTeG+
	9n4w/aDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPdm-0000000970u-0ez8;
	Fri, 05 Dec 2025 06:50:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRPdk-0000000970o-2D1P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D6546000A;
	Fri,  5 Dec 2025 06:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D9BC4CEF1;
	Fri,  5 Dec 2025 06:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764917403;
	bh=8aDf/vibDSHxCUkdQ9C98faaNXbC8BlaxlUd+loxUFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1wlC/C/r2z4XDKAk81naayn2F7xuj+JAxD8IRNaFn916/aFnI1qxuqaQ6sbo9gi0
	 N1Wb4WpgfTAVfGa0AKq4NqnPr33yB29WPlHRJaYngUt3Q6VBLHq5XiZhebKtqS78Nk
	 9VgeStuzidbhdTtMfX5rUjPXnwOv93GTZnnG941nI3zAMjNe0h8TJSuxCK2OlHV0ES
	 3hYydzxTPNSzTjMfoAQ5TAtCddqrFR/0BBOX2O4mM4hk9ZIoH9g6r/bFERktqi4lLf
	 k78xt0DLmvZDGxHvdngMHSdbFc7ZrNIqrHUrUgVZtgbGlYDlB80NByz1yhux3qFqD+
	 g1KyhyuozXUGg==
Date: Thu, 4 Dec 2025 22:48:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] arm64/simd: Avoid pointless clearing of FP/SIMD buffer
Message-ID: <20251205064809.GA26371@sol>
References: <20251204162815.522879-2-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204162815.522879-2-ardb@kernel.org>
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

On Thu, Dec 04, 2025 at 05:28:15PM +0100, Ard Biesheuvel wrote:
> The buffer provided to kernel_neon_begin() is only used if the task is
> scheduled out while the FP/SIMD is in use by the kernel, or when such a
> section is interrupted by a softirq that also uses the FP/SIMD.
> 
> IOW, this happens rarely, and even if it happened often, there is still
> no reason for this buffer to be cleared beforehand, which happens by
> default when using a compiler that supports -ftrivial-auto-var-init.
> 
> So mark the buffer as __uninitialized. Given that this is a variable
> attribute not a type attribute, this requires that the expression is
> tweaked a bit.
> 
> Cc: Will Deacon <will@kernel.org>,
> Cc: Catalin Marinas <catalin.marinas@arm.com>,
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Justin Stitt <justinstitt@google.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/simd.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> The issue here is that returning a pointer to an automatic variable as
> it goes out of scope is slightly dodgy, especially in the context of
> __attribute__((cleanup())), on which the scoped guard API relies
> heavily. However, in this case it should be safe, given that this
> expression is the input to the guarded variable type's constructor.
> 
> It is definitely not pretty, though, so hopefully here is a better way
> to attach this.
> 
> diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> index 0941f6f58a14..825b7fe94003 100644
> --- a/arch/arm64/include/asm/simd.h
> +++ b/arch/arm64/include/asm/simd.h
> @@ -48,6 +48,7 @@ DEFINE_LOCK_GUARD_1(ksimd,
>  		    kernel_neon_begin(_T->lock),
>  		    kernel_neon_end(_T->lock))
>  
> -#define scoped_ksimd()	scoped_guard(ksimd, &(struct user_fpsimd_state){})
> +#define scoped_ksimd()	\
> +	scoped_guard(ksimd, ({ struct user_fpsimd_state __uninitialized s; &s; }))

Ick.  I should have looked at the generated code more closely.

It's actually worse than you describe, because the zeroing is there even
without CONFIG_INIT_STACK_ALL_ZERO=y, simply because the
user_fpsimd_state struct is declared using a compound literal.

I'm afraid that this patch probably isn't a good idea, as it relies on
undefined behavior.  Before this patch, the user_fpsimd_state is
declared using a compound literal, which takes on its enclosing scope,
i.e. the 'for' statement generated by scoped_guard().  After this patch,
it's in a new inner scope, and the pointer to it escapes from it.

Unfortunately I don't think there's any way to solve this while keeping
the scoped_ksimd() API as-is.

Best I can come up with is to leave it to the callers to allocate the
state, and then use scoped_guard() similar to a regular lock:

        struct user_fpsimd_state __uninitialized fpsimd_state;                   
                                                                                 
        scoped_guard(ksimd, &fpsimd_state)                                       
                foo_neon(...)

Maybe wrap the state declaration with a macro:
DECLARE_FPSIMD_STATE_ONSTACK(fpsimd_state);

- Eric

