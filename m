Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F75D59F60
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlDnU1b/3McRzDBaGZvuwGzzU3i5vOmIzUelLdW7xpU=; b=UA/Sx24erc1DL6x+ROgeqd5mXN
	AP15Noqt27nNu/8P11iAErG0r8glPwqm/nk1jpMGSzAwTJGuesYbi9jF3MvlGzz1v0nLixi7068AY
	s5of5Pj9JtDHucIkOD8WbWBNvoUtWMK9RnEx7fQIuhCC+bM4ixmsIeD5/VG6I0KD4qo+KtMeMorXn
	xNzPzqADaBrCEAQ6Gy5Og4uAW1/qIMiMoB/nDFsdC4rX4ZTZ/LyVRiYUAzrkz5WemsgFw+gV11Mx3
	dHw7Ox5xBkzTh8iEUdqypdMmQ1vKJKt772J/1i18+G9QhBUmoX9ghIX064tw8+gfN7LZXqeFAx3n4
	ZtFdvASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFO7-00000001J86-34kQ;
	Sat, 13 Dec 2025 02:29:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFO5-00000001J7j-0ZGK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 02:29:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 031DE40861;
	Sat, 13 Dec 2025 02:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A748BC4CEF1;
	Sat, 13 Dec 2025 02:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765592975;
	bh=hwrLD6/9aUW+AN+NMnTthyh3GBbNp6m5w0xUFtT5iN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dk3WPyQfFNYArSTDlkboK8jg23EenxvOPVLSRUoUNBBL/BaIflf8LkTIUhHRPKD+C
	 VUS/LwH9+UrTqgAozfKadLH1BnOVyM59M+XuZpq8nr0bQ6q4FPYvOFL6wmRXaG5PQ8
	 WH7d7F3gN3RIX/+g58VWMthAjx0QU5rl4v0hr3FIi/T/h26H5NWBnWLKUefO5MiKwg
	 t60lDNg45577jognGYyDXZPJx9ikYKc+y7q2ataxZrFO+A86Dc5UzQmY/5NekG86IN
	 JyiVSyuZH98oRT8XobOqKuLeGW1/7mSUFZlC2H6GxJcRz4SLWTdQA/Grj2snC/uYse
	 YwuGp0gocnSNQ==
Date: Fri, 12 Dec 2025 18:29:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] arm64/simd: Avoid pointless clearing of FP/SIMD buffer
Message-ID: <20251213022929.GA71695@sol>
References: <20251209054848.998878-2-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209054848.998878-2-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_182937_195507_5D39C3F6 
X-CRM114-Status: GOOD (  22.01  )
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

On Tue, Dec 09, 2025 at 06:48:49AM +0100, Ard Biesheuvel wrote:
> The buffer provided to kernel_neon_begin() is only used if the task is
> scheduled out while the FP/SIMD is in use by the kernel, or when such a
> section is interrupted by a softirq that also uses the FP/SIMD.
> 
> IOW, this happens rarely, and even if it happened often, there is still
> no reason for this buffer to be cleared beforehand, which happens
> unconditionally, due to the use of a compound literal expression.
> 
> So define that buffer variable explicitly, and mark it as
> __uninitialized so that it will not get cleared, even when
> -ftrivial-auto-var-init is in effect.
> 
> This requires some preprocessor gymnastics, due to the fact that the
> variable must be defined throughout the entire guarded scope, and the
> expression
> 
>   ({ struct user_fpsimd_state __uninitialized st; &st; })
> 
> is problematic in that regard, even though the compilers seem to
> permit it. So instead, repeat for 'for ()' trick that is also used in
> the implementation of the guarded scope helpers.
> 
> Cc: Will Deacon <will@kernel.org>,
> Cc: Catalin Marinas <catalin.marinas@arm.com>,
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/simd.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> index 0941f6f58a14..69ecbd69ca8c 100644
> --- a/arch/arm64/include/asm/simd.h
> +++ b/arch/arm64/include/asm/simd.h
> @@ -48,6 +48,13 @@ DEFINE_LOCK_GUARD_1(ksimd,
>  		    kernel_neon_begin(_T->lock),
>  		    kernel_neon_end(_T->lock))
>  
> -#define scoped_ksimd()	scoped_guard(ksimd, &(struct user_fpsimd_state){})
> +#define __scoped_ksimd(_label)					\
> +	for (struct user_fpsimd_state __uninitialized __st;	\
> +	     true; ({ goto _label; }))				\
> +		if (0) {					\
> +_label:			break;					\
> +		} else scoped_guard(ksimd, &__st)
> +
> +#define scoped_ksimd()	__scoped_ksimd(__UNIQUE_ID(label))
>  
>  #endif
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

I added:

    Fixes: 4fa617cc6851 ("arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack")

- Eric

