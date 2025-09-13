Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3864CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 04:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHbu/VpA1M6tYXJjA1n95RXGK7JDygip5jRKebV1vEs=; b=sD5ACe7AJJ+r3JNlG/Z0s0xNZE
	b7hVlURkoGqlLCi4Pes8LBOIxbb8OsmRR5OdNpwfUXAzhF75GBv/gPqqN+ruJA4sN92KhApo4jXv5
	HKd6lbuXz/6tA84r0eQjqZhGX2uJ/6VZKfU7n8K3J+v+lq0lQBJ4WXh0J9zvz2G+PCLexvpfl+nqq
	pFJTj1hTLoPyLvea2r1IkEN9/k9uTWOl776Mx2Qj0yWw507l8sVkI03lPZoG+SsnLb0H2GUxmQlaD
	/Qh5fAicueDIux5gwUR1cC/hb8zh/HEWDIUfFd3+onf6fIfGFoxWU5s8Th/v2zM+QAkf/tKYe/RFQ
	rU5No5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxHqP-0000000D97V-1ckm;
	Sat, 13 Sep 2025 04:26:37 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxHqM-0000000D95k-0dec
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 04:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yHbu/VpA1M6tYXJjA1n95RXGK7JDygip5jRKebV1vEs=; b=YoBNIwpwcb/iN3H15zASzEM8pK
	CEuLIKj3lHP4uwq3usELwRnIFPlBxKM/aOTzZfIh7x/so+Ur1TyMXsgzvDx2kCALvEOkzcEs6mJaB
	na1KHjdOTa8hd3iY6PrXvhyWSF5uFlcDgA463oJj5+B25JwMsQqCvONiHdwiAGHF3Xj+lG42qaq0a
	j+biXWJbes+wy4kTYIPMxcb8QjHS+94J51CQ3elmxWhsQp/izA+C9HHAPFk+iGh3AObYF85KDqWHt
	epGw7t9fccySNHenfNH2DhcrjFZZcBR/ghkwdWKdqxE3213NSKApJaPjHX2qLDVszbEWzIPjUhqkH
	fY7LsphA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uxHad-0053nK-08;
	Sat, 13 Sep 2025 12:26:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 13 Sep 2025 12:26:15 +0800
Date: Sat, 13 Sep 2025 12:26:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] sun8i-ce: small cleanups/refactoring
Message-ID: <aMTyZz_keDm_WOoR@gondor.apana.org.au>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_212634_222057_EFE9130C 
X-CRM114-Status: GOOD (  16.83  )
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

On Tue, Sep 02, 2025 at 04:21:25PM +0300, Ovidiu Panait wrote:
> This series includes only the refactoring commits from [1]. The batching
> related changes were dropped since they are no longer relevant (batching
> support in crypto_engine was retired in [2]).
> 
> This series includes various small cleanups and refactoring:
> - move request-specific skcipher and hash data to request context,
>   eliminating the need to allocate extra memory in the digest path
> - make the hashing code more clear and modular
> - reduce a bit of boilerplate/duplicated code
> 
> Changes in v3:
>    - dropped ____cacheline_aligned attributes from buffers used for
>      to-device DMA only
>    - set up proper alignment for ahash reqctx, in order to allow from-device DMA
>      into reqctx buffer:
>       * increased ahash reqsize by CRYPTO_DMA_PADDING
>       * added __aligned(CRYPTO_DMA_ALIGN) attribute for the 'result' buffer
>       * converted all ahash_request_ctx_dma() calls to ahash_request_ctx_dma()
> 
> Changes in v2:
>    - fixed [-Wunused-but-set-variable] warning reported by kernel test robot
> 
> [1] https://lore.kernel.org/linux-crypto/20250626095813.83963-1-ovidiu.panait.oss@gmail.com/
> [2] c470ffa6f486 ("crypto: engine - remove request batching support")
> 
> Ovidiu Panait (9):
>   crypto: sun8i-ce - remove channel timeout field
>   crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
>   crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
>   crypto: sun8i-ce - add a new function for dumping task descriptors
>   crypto: sun8i-ce - move bounce_iv and backup_iv to request context
>   crypto: sun8i-ce - fold sun8i_ce_cipher_run() into
>     sun8i_ce_cipher_do_one()
>   crypto: sun8i-ce - pass task descriptor to cipher prepare/unprepare
>   crypto: sun8i-ce - save hash buffers and dma info to request context
>   crytpo: sun8i-ce - factor out prepare/unprepare from
>     sun8i_ce_hash_run()
> 
>  .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  85 +++++-----
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  35 ++---
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 145 ++++++++++--------
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-prng.c |   1 -
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-trng.c |   1 -
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  27 +++-
>  6 files changed, 147 insertions(+), 147 deletions(-)
> 
> -- 
> 2.50.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

