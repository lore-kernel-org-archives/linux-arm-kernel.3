Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EECCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZRXg+Sx/n9YyjIw5rG5VjKWzwm9Ii1l5XhjK29sv4s=; b=QWqxvLmd+VelsonDFtHC6XXdm7
	cefbT5FIW9uuOu7Kh1Om4ztZGXI7TR544J0rvk1dzIzl84lMxrf96lBN47umMnAiubh3RWZaPXDqV
	zhdjQ93MMsLhXk93/x3wgtuuUl7NQQ20hHmEvbYfhSbzxRXhyK3rQbGs4cPERacEL7Tt7Iaml3bi8
	7kaAc8Qv+2WivQX0javz8DPvE9ybGRPWsIe8pPpYYE78pm1QmbKC0UMhKZvrzmNBvzR4+uU7FdfgO
	UheMqxjK7O8MlEE2P0NkUBjn9izkXJ3sqSDMVhHALX15CM+dUr5kNuOZz26jVC/DAw8WxVZU3fCRR
	ArYjFLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M2P-0000000AoBk-2g7B;
	Thu, 02 Oct 2025 16:20:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M2N-0000000AoAZ-2TtS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4260845EA6;
	Thu,  2 Oct 2025 16:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18852C4CEF4;
	Thu,  2 Oct 2025 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759422011;
	bh=OxqQDGMDmx2w7gfRNWA+e+czIuGiEoxutb/vwzJrrRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tj/YiZ/TobyIeKv7q1W9iU8j8CxlU714gulY6x5ee8E99AufPrsZp8nuXuZ47+SAX
	 pUlG9R5AoknegrncPU9bU8JUAqovMuANAxMkLj8VUvQPubYAxyPdLiWPYrfktgn6rU
	 FBB7W1AIg++rkuDKZpLnQwMC+hM4JAAEEuTczdXCoBbi2dQ7T3/FtWakBvinDavAaE
	 IEXJSGDQL839fOuhb3Q0xrrmSQlPDpu3C815JeiU/kAKnMI9RKcXBpuIyLZVFDubWf
	 QpsnQNgcHb2YYP4UWm1cMo2JDpD7f/AxpVvfMGVmsaXRUqR7cLsN+5JkqqJ5AdjNeZ
	 mCZWGxx5tGfJQ==
Date: Thu, 2 Oct 2025 09:20:10 -0700
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	linux@armlinux.org.uk, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 04/20] crypto: aegis128-neon - Move to more abstract
 'ksimd' guard API
Message-ID: <202510020918.7E358227@keescook>
References: <20251001210201.838686-22-ardb+git@google.com>
 <20251001210201.838686-26-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001210201.838686-26-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_092011_669240_C04B8C15 
X-CRM114-Status: GOOD (  17.68  )
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

On Wed, Oct 01, 2025 at 11:02:06PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Move away from calling kernel_neon_begin() and kernel_neon_end()
> directly, and instead, use the newly introduced scoped_ksimd() API. This
> permits arm64 to modify the kernel mode NEON API without affecting code
> that is shared between ARM and arm64.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  crypto/aegis128-neon.c | 33 +++++++-------------
>  1 file changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/crypto/aegis128-neon.c b/crypto/aegis128-neon.c
> index 9ee50549e823..b41807e63bd3 100644
> --- a/crypto/aegis128-neon.c
> +++ b/crypto/aegis128-neon.c
> @@ -4,7 +4,7 @@
>   */
>  
>  #include <asm/cpufeature.h>
> -#include <asm/neon.h>
> +#include <asm/simd.h>
>  
>  #include "aegis.h"
>  #include "aegis-neon.h"
> @@ -24,32 +24,28 @@ void crypto_aegis128_init_simd(struct aegis_state *state,
>  			       const union aegis_block *key,
>  			       const u8 *iv)
>  {
> -	kernel_neon_begin();
> -	crypto_aegis128_init_neon(state, key, iv);
> -	kernel_neon_end();
> +	scoped_ksimd()
> +		crypto_aegis128_init_neon(state, key, iv);
>  }

For these cases (to avoid the indentation change), do you want to use
just "guard" instead of "scope_guard", or do you want to explicitly
require explicit scope context even when the scope ends at the function
return?

-- 
Kees Cook

