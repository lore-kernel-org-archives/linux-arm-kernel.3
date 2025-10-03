Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB239CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 20:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/v5JLs0icyPdAXheEOAI+UozLut//QDyAwNo/lBo6A=; b=Yg0m8EqFQbTT04nhdq+5KIDTqC
	oy+h2WtAKOeFxqt5HADjbyD1fHgnznnC5kWp2jnEB4Uvuvo4y0GIE5wJXFFMn8A/Ivuyuua32PEu1
	/IGoXErErB2Y3bOqjVlJo9vlhqxwM9Ij8DF2OYnyExMK7NHjTRzpWaUTJE0YhEA2P5RNe1CK8CRxg
	By5MI0JjeTDVTOITdRDsHrrrjAG6vJSQ3hnYPphYr77kLjuygmbvziNPP0fUuuUk7covbQrH+ONb2
	TRMUB3Hb+k5bvkMtc0rc+6MYmpkOutfUw64W2RsP8S7M17IJEbFPbZQJsE4+nQ91yVPhCDB9WpwZF
	ajhXscfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mER-0000000D4jb-26qx;
	Fri, 03 Oct 2025 20:18:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4mEP-0000000D4jQ-3lbw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 20:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55C6C61F22;
	Fri,  3 Oct 2025 20:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAA5C4CEF5;
	Fri,  3 Oct 2025 20:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759522701;
	bh=vQfJ1cZDAVEbVC1Gj3v8LCP7wE5pMK3AJKqOpsdTy9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rz8sa8+6J/I9EXLjRDy1o2LsaKwDCofOgjcRebSS+auwNyowpfAMNiCi82JYJgIrM
	 6EWPiAj4p6Q2rD8rNH6/ImQbKfceqIEYCvGNi+7PSxB4CrZNZZcM6olq8ovuvr30F4
	 lbmUeU5js9KpKdJqgT4omBMAJdw1lW4cjn4/FGownvHWaJsBguPmS/jnw+Ow+RsGkR
	 2G/aQCxNIFq8jdysVToiGLalItNvxSskDKFv7iHDH4JN46Nmigzs3NFP+ns/EaOU5O
	 SD54/Wd4pvbtOfFwGap2CEOzmvDPks3OPfuUEhCjr1WIxQt8MSlaRpaNJGt5wIm8YR
	 Oe05/nANNK/Ig==
Date: Fri, 3 Oct 2025 13:18:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	linux@armlinux.org.uk, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 20/20] arm64/fpsimd: Allocate kernel mode FP/SIMD
 buffers on the stack
Message-ID: <20251003201818.GA24598@quark>
References: <20251001210201.838686-22-ardb+git@google.com>
 <20251001210201.838686-42-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001210201.838686-42-ardb+git@google.com>
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

On Wed, Oct 01, 2025 at 11:02:22PM +0200, Ard Biesheuvel wrote:
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index 4f8d677b73ee..93bca4d454d7 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -172,7 +172,7 @@ struct thread_struct {
>  	unsigned long		fault_code;	/* ESR_EL1 value */
>  	struct debug_info	debug;		/* debugging */
>  
> -	struct user_fpsimd_state	kernel_fpsimd_state;
> +	struct user_fpsimd_state	*kernel_fpsimd_state;

Is TIF_KERNEL_FPSTATE redundant with kernel_fpsimd_state != NULL?  If
so, should we have both?

> +void kernel_neon_begin(struct user_fpsimd_state *s)
>  {
>  	if (WARN_ON(!system_supports_fpsimd()))
>  		return;
> @@ -1866,8 +1869,16 @@ void kernel_neon_begin(void)
>  		 * mode in task context. So in this case, setting the flag here
>  		 * is always appropriate.
>  		 */
> -		if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq())
> +		if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq()) {
> +			/*
> +			 * Record the caller provided buffer as the kernel mode
> +			 * FP/SIMD buffer for this task, so that the state can
> +			 * be preserved and restored on a context switch.
> +			 */
> +			if (cmpxchg(&current->thread.kernel_fpsimd_state, NULL, s))
> +				BUG();

Does this really need to be a cmpxchg, vs. a regular load and store?
It's just operating on current.

> +	else if (test_and_clear_thread_flag(TIF_KERNEL_FPSTATE))
> +		if (cmpxchg(&current->thread.kernel_fpsimd_state, s, NULL) != s)
> +			BUG();

Likewise.

- Eric

