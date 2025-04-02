Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04989C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 17:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh1X3A2xd34PD+lt5dj4bh/JB7f/CkRHbxL8lur8Lu8=; b=l81aNZIQ/jDfqTNigVa+7BfQpP
	AeOsW4oCzBY664TTmWkj3I/+0w+51zdoAjckn84fF456qP5GI+Ho2xl0AVN3AGIhko9PodqaAlozf
	K8xL8ieK4HmMZf+unjKsSvW0rjrFmCIM8GVUunWL5NDopOSkFxjNAcAHgRWgwozv/2GfdvUA2yk3m
	1MKPDFeX0icDXnm2utYvk3PdCCVe3psPF21pi7nOUHTj4jL0tJvUlOL1YVbzZT3iFKmpNpQbXoSFH
	BsXJvc1TmlZb3idk2B3phFNMwJSrLyyjCY6+S6mwd0CC7/6Jd1IN8Z2fx6KsSC25L1I04RytPbchU
	I3oT6BKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01wm-00000006luG-2oag;
	Wed, 02 Apr 2025 17:32:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01v1-00000006lTP-2fdg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 17:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B51E643635;
	Wed,  2 Apr 2025 17:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3923C4CEDD;
	Wed,  2 Apr 2025 17:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743615027;
	bh=E+fPsADjzWGHXU7LsqGEmS5ToStoyx9zhJyWoJ9AdO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=or6p85ZFbq9MCmpsAI4BNWvFZkM1bkvThZhRcNOXLEvOMlkKa5oSzGGhiyiiv3ZYL
	 tNihs3ZVlh4K1mEfiZ27uoBkH7Fab9qcyWFHZ5K/L42WJnE/W42KbEJW2ykKUhW/xW
	 vDlOioFWkWrLMUC4u/EEMEumujuBmm/f9Yxcca7dZCm97eyK4IeNWswNKLmxE7Lwm8
	 N43JFQpdFei0FqpJFtKIw9LA71pTWNIlMjIAJ9jkmAY7Jonwn/hQxTbYkNe3hGcEDx
	 jhkVvEzH6fhU52Z+EvcYjtm+zyWsAzQrozqDRvJOHR+WH842CraO8S11sjnNe4AGhq
	 y6+FxxzZ5qh7g==
Date: Wed, 2 Apr 2025 10:30:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 2/2] crypto: arm/aes-neonbs - stop using the SIMD helper
Message-ID: <20250402173025.GE1235@sol.localdomain>
References: <20250402070251.1762692-3-ardb+git@google.com>
 <20250402070251.1762692-4-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402070251.1762692-4-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_103027_694309_867A20A4 
X-CRM114-Status: GOOD (  17.22  )
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

On Wed, Apr 02, 2025 at 09:02:53AM +0200, Ard Biesheuvel wrote:
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
>  arch/arm/crypto/Kconfig           |   1 -
>  arch/arm/crypto/aes-neonbs-glue.c | 114 +++---------------------------
>  2 files changed, 9 insertions(+), 106 deletions(-)
> 
> diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
> index 2fa8aba8dc12..ba1d1b67c727 100644
> --- a/arch/arm/crypto/Kconfig
> +++ b/arch/arm/crypto/Kconfig
> @@ -169,7 +169,6 @@ config CRYPTO_AES_ARM_BS
>  	select CRYPTO_AES_ARM
>  	select CRYPTO_SKCIPHER
>  	select CRYPTO_LIB_AES
> -	select CRYPTO_SIMD
>  	help
>  	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
>  	  with block cipher modes:
> diff --git a/arch/arm/crypto/aes-neonbs-glue.c b/arch/arm/crypto/aes-neonbs-glue.c
> index f6be80b5938b..63800257a7ea 100644
> --- a/arch/arm/crypto/aes-neonbs-glue.c
> +++ b/arch/arm/crypto/aes-neonbs-glue.c

The following includes can now be removed from this file:

    #include <crypto/ctr.h>
    #include <crypto/internal/simd.h>

Otherwise this patch looks good.  Thanks!

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

