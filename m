Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD09CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Xoi5s7zM3J/i7juLKTftrdavKchTmeL9jNAPencGgU=; b=iVO50gFq8H8hD9c5gc/JboqLtu
	ZRW1yjKNYFPdMbYtIwbjVzKT9XBeFBPSJ06SkCE0d3KXoRfVm+xn4XG6ZIwCUKK5csFD6vIbu8RTC
	ofOh64r1xJkvtgJfrhj1C14x9GyHl+4TI5n7hrrYvIeRvANhy7lRLBAQntq5XkoQLl8uoVn59ZP/c
	jz7kYjiQ6kmneOyuwBKClrm28w+PCHLQzUTDl+eAKCcCmDcd7ilf88Gc27VcmD5TsN397D56YblF3
	P8i2VeoSVfGeIYkW0d5ofjxsZibngshpM/QVcQ5ZzCjmWsXHEaxw0ICLWjc8lHczQImMYP1v248FL
	tfL4xuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGpl-0000000EMX0-3WcQ;
	Thu, 04 Sep 2025 20:45:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEhK-0000000DZ7B-2DHb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B66D443401;
	Thu,  4 Sep 2025 18:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053CDC4CEF1;
	Thu,  4 Sep 2025 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757010517;
	bh=+XQg5Gr7AwL8fTXdZyl2qxqsdyHuqVxLGzPFbhKUbHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNb2zDM1DtPkwJjb2Km/2/fT+7BssKm2TAp9GcwMc2kwey4bKvumwTBZC8XjicAgC
	 O8vKxGEQ6ZrnbzNzRsgKdmln5fi1QVQ+ggBSNnCmXRh2F8TKHBagjC/7JuI0gjZ7a0
	 eQeXW07loWW1uGspxhWsQshfExAjBMJoe10aDY1wE58xKccTgdaulrjO8VykzTyEWg
	 Ax0/oRKgjIAljA0ajad4796myhhQBKaRVODi31HN6fiOYLHb/KzOb4vpTxPYRFYA+E
	 rlfsr63uFdOgrmw0DWihkM2EWyMEbqUss3dI0PwAziP2dKS58ObkfVS0tvszvFgLRH
	 hoMvTNN+MFWew==
Date: Thu, 4 Sep 2025 11:28:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>, llvm@lists.linux.dev,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/9] compiler_types.h: Move __nocfi out of
 compiler-specific header
Message-ID: <20250904182829.GA2110053@ax162>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-1-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904034656.3670313-1-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_112838_604768_DFE34FBE 
X-CRM114-Status: GOOD (  18.90  )
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

On Wed, Sep 03, 2025 at 08:46:40PM -0700, Kees Cook wrote:
> Prepare for GCC KCFI support and move the __nocfi attribute from
> compiler-clang.h to compiler_types.h. This was already gated by
> CONFIG_CFI_CLANG, so this remains safe for non-KCFI GCC builds.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

I reviewed this on v1:

https://lore.kernel.org/20250827194657.GA3572128@ax162/

but just to make sure it sticks :)

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
> +# define __nocfi		__attribute__((__no_sanitize__("kcfi")))
> +#else
>  # define __nocfi
>  #endif
>  
> -- 
> 2.34.1
> 

