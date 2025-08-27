Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9246CCA0FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFBVsM4X5sMNrW655cEV6QpV8EUzMnSU4t0oX370fBg=; b=o89sznlRcnic8I3astmqp3Jt/n
	B4o+0WYTcZKrX7jO5ncb/Gaeh6GnWFLMtTg3h94j05TxUKj6zljS7IBvIf48lS0/EYG1UKgl3hDyb
	BRzOmvmXqvdLDnWKmf2X3qSJbz0pNck2Ap5OZVxigxScR8Sh4V37USJ3ASH+zGdT7xzz5H3ycG/eq
	yYatqIwnhcAybIwdAC1qB2ofg/LsSiEopl5x6o9D4N5kmU1vsDUPLHCNwuoAqNZP/Fp4hDRNftf06
	uEMJjoeLPuZ9vT8auMEKRqGCuYdPnnMcjloP0u7YRozoBotLSXW63uc1E3zsVoLSeaTe7f8/RiYGy
	1VBMFoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urN9b-0000000GoWf-1VNN;
	Wed, 27 Aug 2025 20:53:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urM6q-0000000Gf4F-3VWZ;
	Wed, 27 Aug 2025 19:47:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29BE1441C7;
	Wed, 27 Aug 2025 19:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2933C4CEEB;
	Wed, 27 Aug 2025 19:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756324024;
	bh=81/v8nWc8euoHfOV4Sjmxdu7D+OwRFilhJeDCR9aoI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTybwMbHizBbBlCHjbHP/jpIktQ/ZQYuzvV1Tnp3YyDotqDC81SzIyROZnM4yuBYP
	 G1Mk4y/PMZDns8MmWGWMAUj1e+KchkU/0F5x2SS4M1O/bGVM2s5dzaJNvl1JW+HDqH
	 jL+ptyEcHrr//HSSh4xi74Pm322Med55qEJfMDCu2zkv4rMXdPzA1gHPofldXLtFRI
	 /KqeGOWvWaUrDk4oGIXOkxz2ITxzITs8K6PClIDn95mtSWNUwCN/VJiiet0Pyp3+EE
	 cev3f58U6HuM8xgSHWTLjRDxgreGTPEbeJXbYmeIjUt/LGBoRJu+q3lfriZq6iwLgs
	 +h2byf++DGPuw==
Date: Wed, 27 Aug 2025 12:46:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/5] compiler_types.h: Move __nocfi out of
 compiler-specific header
Message-ID: <20250827194657.GA3572128@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-1-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825142603.1907143-1-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_124704_889019_5CFB4FC4 
X-CRM114-Status: GOOD (  17.87  )
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

On Mon, Aug 25, 2025 at 07:25:48AM -0700, Kees Cook wrote:
> From: Kees Cook <kees@outflux.net>
> 
> Prepare for GCC KCFI support and move the __nocfi attribute from
> compiler-clang.h to compiler_types.h. This was already effectively gated
> by CONFIG_CFI_CLANG, so this remains safe for non-KCFI GCC builds.
> 
> Signed-off-by: Kees Cook <kees@outflux.net>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  include/linux/compiler-clang.h | 5 -----
>  include/linux/compiler_types.h | 4 +++-
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index fa4ffe037bc7..7a4568e421dc 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -96,11 +96,6 @@
>  # define __noscs	__attribute__((__no_sanitize__("shadow-call-stack")))
>  #endif
>  
> -#if __has_feature(kcfi)
> -/* Disable CFI checking inside a function. */
> -#define __nocfi		__attribute__((__no_sanitize__("kcfi")))
> -#endif
> -
>  /*
>   * Turn individual warnings and errors on and off locally, depending
>   * on version.
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 16755431fc11..a910f9fa5341 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -432,7 +432,9 @@ struct ftrace_likely_data {
>  # define __noscs
>  #endif
>  
> -#ifndef __nocfi
> +#if defined(CONFIG_CFI_CLANG)

I tend to prefer '#ifdef' for single symbols.

> +# define __nocfi		__attribute__((__no_sanitize__("kcfi")))
> +#else
>  # define __nocfi
>  #endif
>  
> -- 
> 2.34.1
> 

