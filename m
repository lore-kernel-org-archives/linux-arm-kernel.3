Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3379C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 03:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5LtAP9dH0se3Aa+dj5UG/sESuo0SmU97FCP6hGcPME=; b=gGKW6Yx1PpFPofDAlf8ckdOnob
	kljWMpJ7BYeA76nSTrp2rsJb9y0/KOA/jPbptr/HHYAoOy7qumXNmqysefgYC7w/V1xm8MQjmBHNo
	P0eQagYIKKajAJegia5NZVLyklEGIsD2EAPCoFrKeslsTdvKo6G7EihDWnC2tzECdupVKbW51uuTw
	KY652CRRpsN4xcSXbUT63AyvJQNJdgsznlVJ14RapxnsUGylE8AJlKCeaURB2OrNOGrqn+yRDOKcm
	AHlg0k1IvC26UehaF6dzQT3FgVOAB9BPJ2xtg9a7jXvhZqj50ewnX/VLRPRGt7LmX+lP50ca12fVP
	MTiDALvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dKp-0000000GHjr-3634;
	Mon, 07 Apr 2025 03:39:43 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1dJ3-0000000GHJA-3LvR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 03:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=j5LtAP9dH0se3Aa+dj5UG/sESuo0SmU97FCP6hGcPME=; b=IsdxRras8/9Ro0ZiSNQ4QHrRBI
	lTpxyE5+DAGAeVziAF+y2ckcROmb7slyNm9SmC6bhaIx1lAMp45YpRHlODod6TmLrAJDNpKzwmU4b
	h56EaQ75YFS2cbHbMsDTxfAj+Y8+Blqy5ck2OGO08qO6UtQonZVP9cZR05k3OJQrl4Auyqk7XWXCN
	mA8tnqY7yyh1yZCvUvKges+sUq4lrsJ65l9hAJh0qAkKRvn8ZhUpcd+R31KjfUY5Rts4izoE72opK
	cYDaGv/5CL7gw71FGPphOepmPjY5QUZeuErWt+IDW+YMeQDGIfUqb9H1gw2v48zUVs32a8mAN9Ek/
	cfI7YOgw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1dIl-00DMJi-0A;
	Mon, 07 Apr 2025 11:37:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 11:37:35 +0800
Date: Mon, 7 Apr 2025 11:37:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zixun LI <admin@hifiphile.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel - add CRYPTO_ALG_KERN_DRIVER_ONLY flag to
 atmel-aes, atmel-sha, atmel-tdes drivers
Message-ID: <Z_NIf4EEeLRv4fFT@gondor.apana.org.au>
References: <20250319150657.2698916-1-zli@ogga.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319150657.2698916-1-zli@ogga.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_203753_905113_984B7958 
X-CRM114-Status: GOOD (  13.29  )
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

On Wed, Mar 19, 2025 at 04:06:56PM +0100, Zixun LI wrote:
> 
> diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
> index 90dcae7049b7..8a6ee5ac9956 100644
> --- a/drivers/crypto/atmel-aes.c
> +++ b/drivers/crypto/atmel-aes.c
> @@ -1948,7 +1948,8 @@ static struct skcipher_alg aes_xts_alg = {
>  	.base.cra_driver_name	= "atmel-xts-aes",
>  	.base.cra_blocksize	= AES_BLOCK_SIZE,
>  	.base.cra_ctxsize	= sizeof(struct atmel_aes_xts_ctx),
> -	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK,
> +	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK |
> +						  CRYPTO_ALG_KERN_DRIVER_ONLY,

This should be indented like this:

	.base.cra_flags		= CRYPTO_ALG_NEED_FALLBACK |
				  CRYPTO_ALG_KERN_DRIVER_ONLY,

> diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
> index 3622120add62..40f6ed5b20ee 100644
> --- a/drivers/crypto/atmel-sha.c
> +++ b/drivers/crypto/atmel-sha.c
> @@ -1254,7 +1254,8 @@ static int atmel_sha_cra_init(struct crypto_tfm *tfm)
>  static void atmel_sha_alg_init(struct ahash_alg *alg)
>  {
>  	alg->halg.base.cra_priority = ATMEL_SHA_PRIORITY;
> -	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC;
> +	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
> +							   CRYPTO_ALG_KERN_DRIVER_ONLY;

	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
				   CRYPTO_ALG_KERN_DRIVER_ONLY;

> @@ -2043,7 +2044,8 @@ static void atmel_sha_hmac_cra_exit(struct crypto_tfm *tfm)
>  static void atmel_sha_hmac_alg_init(struct ahash_alg *alg)
>  {
>  	alg->halg.base.cra_priority = ATMEL_SHA_PRIORITY;
> -	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC;
> +	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
> +							   CRYPTO_ALG_KERN_DRIVER_ONLY;

	alg->halg.base.cra_flags = CRYPTO_ALG_ASYNC |
				   CRYPTO_ALG_KERN_DRIVER_ONLY;

> diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
> index 099b32a10dd7..3a6a890172cd 100644
> --- a/drivers/crypto/atmel-tdes.c
> +++ b/drivers/crypto/atmel-tdes.c
> @@ -898,7 +898,8 @@ static int atmel_tdes_init_tfm(struct crypto_skcipher *tfm)
>  static void atmel_tdes_skcipher_alg_init(struct skcipher_alg *alg)
>  {
>  	alg->base.cra_priority = ATMEL_TDES_PRIORITY;
> -	alg->base.cra_flags = CRYPTO_ALG_ASYNC;
> +	alg->base.cra_flags = CRYPTO_ALG_ASYNC |
> +						  CRYPTO_ALG_KERN_DRIVER_ONLY;

This fits on one line, no need to split.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

