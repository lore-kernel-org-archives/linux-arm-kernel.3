Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE1AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 17:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfkQzBgv7pcenc9mewatkcnQtFmXIIhFzjr6uRVtUJg=; b=csqctex49W4H7Fj+2vEFkJFNPI
	aFr8Axn6sos2WJ3DH3O/UgIBo3BMQ11xvO3xBp+AeQiHumyNoLUy2+DP7gyGBNe90f9KRPPmjdOrg
	TbO+RRv5N22lEf6nKqOqefY0f/f+xDHzM0i/FL89FHjA08O1zcjogUtz8PKk4etSSZY6eWfMPfujc
	K0tMlNUXihSn0qZ4EUrALNBVYoX8HjFKzL/xKp88NOTTmenv/hHNa17Q9P4AtjIQhfHYiZpjLoG1A
	g64rPnVn7joCDUSeo3jkqTppO+V2IKlLursz0SFLz4U1Bi98gCFgmnFyWfF0S76gwbAVtJTC+JsjD
	e5lMnB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01zF-00000006mRI-1oKN;
	Wed, 02 Apr 2025 17:34:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01xU-00000006m4E-1JoA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 17:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A46075C693E;
	Wed,  2 Apr 2025 17:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257B8C4CEDD;
	Wed,  2 Apr 2025 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743615177;
	bh=PDBx9Mwlt0VuTbkCTuvBag9RIYTLpzY//Vox7KarUw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DB0fJMwpTUWTW1iCebVH6P0kAvwOA2No1jlc/2TFO+dCOoIp05YHe/raiBCYb0RgZ
	 kvmQ3YQHXfLlDj1TQ8KPtIuDEKTurkjTOoB3JMm9TB9U+hDIfTF2CWvwcmOFfFOwOI
	 rhUmUP5SFYqNwmXX/aKWZ8/laVB5U9sPAQH0A0/T7hCwpgFXUd961rGjWhAPDbzTQb
	 2T/eqNrEh1fJxi5Y5BELHOwdlroSpdupxfBd99VEfC/ons0lzKJQNdrBHcF/vocsFf
	 CcKALAhS+vIbvPb2gfJGxRjVOCYzjJUla9PA7o5oc0SE1j8NDLm+Uq7G32eTxxXyvX
	 +I1eK7jHyO6mw==
Date: Wed, 2 Apr 2025 10:32:55 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 1/2] crypto: arm/aes-ce - stop using the SIMD helper
Message-ID: <20250402173255.GF1235@sol.localdomain>
References: <20250402070251.1762692-3-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402070251.1762692-3-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_103300_396376_D5DFE3D0 
X-CRM114-Status: GOOD (  17.73  )
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

On Wed, Apr 02, 2025 at 09:02:52AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Now that ARM permits use of the NEON unit in softirq context as well as
> task context, there is no longer a need to rely on the SIMD helper
> module to construct async skciphers wrapping the sync ones, as the
> latter can always be called directly.
> 
> So remove these wrappers and the dependency on the SIMD helper. This
> permits the use of these algorithms by callers that only support
> synchronous use.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm/crypto/Kconfig       |   1 -
>  arch/arm/crypto/aes-ce-glue.c | 102 ++++------------------------------
>  2 files changed, 11 insertions(+), 92 deletions(-)
> 
> diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
> index 32650c8431d9..2fa8aba8dc12 100644
> --- a/arch/arm/crypto/Kconfig
> +++ b/arch/arm/crypto/Kconfig
> @@ -197,7 +197,6 @@ config CRYPTO_AES_ARM_CE
>  	depends on KERNEL_MODE_NEON
>  	select CRYPTO_SKCIPHER
>  	select CRYPTO_LIB_AES
> -	select CRYPTO_SIMD
>  	help
>  	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
>  	   with block cipher modes:
> diff --git a/arch/arm/crypto/aes-ce-glue.c b/arch/arm/crypto/aes-ce-glue.c
> index 21df5e7f51f9..c17d9e4ad8e6 100644
> --- a/arch/arm/crypto/aes-ce-glue.c
> +++ b/arch/arm/crypto/aes-ce-glue.c

The following includes can now be removed from this file:

    #include <crypto/ctr.h>
    #include <crypto/internal/simd.h>

Otherwise this patch looks good.  Thanks!

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

