Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEAFCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 07:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNsi1N8ANWHoR2Q6Eu2ZFoyXqqxCVpVHzpLmykJN6Ec=; b=ducpqEqh/5ef3ErCukhAgGyE2W
	11XitNAaCY1ggkz6uv8h63WOVVvy6BTZjKWsAt2jb3p4us2B8qW928AtAsffxbeKxAaP/ZWqu3zt0
	/2JeQtzpv1nydzI2IL/gv9g+2zT5mt0cdOUAo4dTEPT2aH4hHb62TxylhhPfvols2gWCE38XV5qIb
	DuOHXD3Vm5EGqWHO19NEG0Q7rb/13mUTbnaZwQhki5qQuMu/Xmvs9AB9nxu6tX3Pl3dSZeEwsAu54
	XtKB+gCzUBgC2wk96Tx+6RCcujTHkO3764iz430jXabGhhz0Yomg0MH4lAAHr5hHnQxjGqMrfqCkS
	C1NnXxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu40H-00000009jLn-3aEn;
	Thu, 04 Sep 2025 07:03:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3xZ-00000009iEa-0wvM;
	Thu, 04 Sep 2025 07:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DNsi1N8ANWHoR2Q6Eu2ZFoyXqqxCVpVHzpLmykJN6Ec=; b=W7NMLZeIKCTe5tsHWthhHxHA7Z
	1CM5FkomVoWsu0gk9+juyLSnrVjOoPAU0I0OsiTlP32/Ytk7Rm2QF4vQb0/8XRghZEDASC+UTwEge
	AwbQR1Hct+5rTN4ThUNZawy29bZdgLFwo+hEI4yq6NMW+R476V5NQ6lv3DP8sMdt66OYvI9IUUtbV
	CoepnEKHlSfy5PdAQ6vfG3fDIhYYA+b+iUXnGCuC9zWvJvLSsxab0YKumo5WtA2prviAgm1DEqotZ
	VHW8Gh0E7ycyGsX4mLMekcbei1w6XLwxJi0aiABtpTcpVT3AKkqqnTWgIJOzE7aytSc1hYQQ4veoS
	M0LIJhxg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3xT-0000000EVBI-1pV1;
	Thu, 04 Sep 2025 07:00:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C15C30034B; Thu, 04 Sep 2025 09:00:35 +0200 (CEST)
Date: Thu, 4 Sep 2025 09:00:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 5/9] x86/cfi: Add "debug" option to "cfi=" bootparam
Message-ID: <20250904070035.GW4067720@noisy.programming.kicks-ass.net>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-5-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904034656.3670313-5-kees@kernel.org>
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

On Wed, Sep 03, 2025 at 08:46:44PM -0700, Kees Cook wrote:

> @@ -1734,6 +1737,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  	 * rewrite them. This disables all CFI. If this succeeds but any of the
>  	 * later stages fails, we're without CFI.
>  	 */
> +	if (cfi_debug)
> +		pr_info("CFI: disabling all indirect call checking\n");
>  	ret = cfi_disable_callers(start_retpoline, end_retpoline);
>  	if (ret)
>  		goto err;
> @@ -1744,14 +1749,23 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  			cfi_bpf_hash = cfi_rehash(cfi_bpf_hash);
>  			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
>  		}
> +		if (cfi_debug)
> +			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
>  
> +		if (cfi_debug)
> +			pr_info("CFI: rehashing all preambles\n");

So this repeated if() bugs the heck out of me ... :-)

What would you prefer, this:

		if (cfi_debug) {
			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
			pr_info("CFI: rehashing all preambles\n");
		}

or something like:

#define pr_cfi_debug(X...) if (cfi_debug) pr_info(X)

		pr_cfi_debug("CFI: cfi_seed: 0x%08x\n", cfi_seed);
		pr_cfi_debug("CFI: rehashing all preambles\n");

?

>  		ret = cfi_rand_preamble(start_cfi, end_cfi);
>  		if (ret)
>  			goto err;
>  
> +		if (cfi_debug)
> +			pr_info("CFI: rehashing all indirect calls\n");
>  		ret = cfi_rand_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
> +	} else {
> +		if (cfi_debug)
> +			pr_info("CFI: rehashing disabled\n");
>  	}
>  
>  	switch (cfi_mode) {
> @@ -1761,6 +1775,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  		return;
>  
>  	case CFI_KCFI:
> +		if (cfi_debug)
> +			pr_info("CFI: enabling all indirect call checking\n");

This should be "CFI: re-enabling all..." I suppose, to better match the
earlier "CFI: disabling all ..." message.

>  		ret = cfi_enable_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
> @@ -1771,17 +1787,23 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  		return;
>  
>  	case CFI_FINEIBT:
> +		if (cfi_debug)
> +			pr_info("CFI: adding FineIBT to all preambles\n");
>  		/* place the FineIBT preamble at func()-16 */
>  		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
>  		if (ret)
>  			goto err;
>  
>  		/* rewrite the callers to target func()-16 */
> +		if (cfi_debug)
> +			pr_info("CFI: rewriting indirect call sites to use FineIBT\n");
>  		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
>  
>  		/* now that nobody targets func()+0, remove ENDBR there */
> +		if (cfi_debug)
> +			pr_info("CFI: removing old endbr insns\n");
>  		cfi_rewrite_endbr(start_cfi, end_cfi);
>  
>  		if (builtin) {
> @@ -2324,6 +2346,7 @@ void __init alternative_instructions(void)
>  
>  	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
>  			__cfi_sites, __cfi_sites_end, true);
> +	cfi_debug = false;
>  
>  	/*
>  	 * Rewrite the retpolines, must be done before alternatives since

