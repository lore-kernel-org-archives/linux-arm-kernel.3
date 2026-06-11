Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37305CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjjBDYZgAOLy519yfjF2xCKXOfk72HnUEqbs8BnxJS0=; b=0GeRVhJs6mDq49b4v1Km1llMzC
	pJY5cNhG/kMpp5/VKJD50VTBB5iTgWEdDr7+VXNxYONXM8busV5fpdaMKR/tw7HHwfJpyLP8/b4lh
	sv9kFk6NN/jQK9A6whUbWdsn3izm8vCOZpYJNQbO9pC1kHZyq5Ey9fCSTO6j6HlzzfmQJF39AfbvK
	LtgjG9YncaWGij6KgESzqNxauUDC5vAgDe1/+l55cpyUwa3axKpv6CDPoekYOLlojawJKuVlhTYFO
	gVL6Nxwzlp9Us697qGQS1OGEDWGeEX1pN/txVPmAK9rizho9/1ZRJoUELhbjLHI0r4+ZAchosuis0
	bXCe9TVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb7I-000000093FG-3pdF;
	Thu, 11 Jun 2026 08:50:24 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb7G-000000093E6-0fg8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=PjjBDYZgAOLy519yfjF2xCKXOfk72HnUEqbs8BnxJS0=; 
	b=VIS8HaroQpuYLrtH87PuT4FHco2zbtekpp4kSzsrnfHYWyT8Ci9BSSgvxUxV/ALZIZKQq/cGOrY
	sSTTphh/Ck/N8Oh695PxTHGroaqJhPMn8an1Fg3AmJ1d8nO9Exm2CkBfaB0XIbA22ofKkE5mqD1XE
	uAz5JCouT/DU14Sj+wCCx++mPBQT8xfWBKzdG8+NEHaE/N85jLvYOQf+ZiCYBKOkecjG116F5Eb/h
	Mik51+FhdSbaBXAf6uso2ZQloU/vZl7cym4wXZBLCMn3zepmUdxd/pAmhlv4AioxKs/AsozX73o0Z
	P8lT52kZCWM02wnUhahWs20Ywrpd92dOLdgA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXb7B-00000004XW1-2BCk;
	Thu, 11 Jun 2026 16:50:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Jun 2026 16:50:17 +0800
Date: Thu, 11 Jun 2026 16:50:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>, stable@vger.kernel.org,
	Tianchu Chen <flynnnchen@tencent.com>
Subject: Re: [PATCH v2] crypto: sun4i-ss - Remove insecure and unused rng_alg
Message-ID: <aip2yUWWUlUbdi8w@gondor.apana.org.au>
References: <20260601160757.79645-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601160757.79645-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_015022_202579_C0AADA83 
X-CRM114-Status: GOOD (  17.61  )
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

On Mon, Jun 01, 2026 at 04:07:57PM +0000, Eric Biggers wrote:
> Remove sun4i_ss_rng, as it is insecure and unused:
> 
> - It has multiple vulnerabilities.  sun4i_ss_prng_seed() is missing
>   locking and has a buffer overflow.  sun4i_ss_prng_generate() fails to
>   fill the entire buffer with cryptographic random bytes, because it
>   rounds the destination length down and also doesn't actually wait for
>   the hardware to be ready before pulling bytes from it.
> 
> - No user of this code is known.  It's usable only theoretically via the
>   "rng" algorithm type of AF_ALG.  But userspace actually just uses the
>   actual Linux RNG (/dev/random etc) instead.  And rng_algs don't
>   contribute entropy to the actual Linux RNG either.  (This may have
>   been confused with hwrng, which does contribute entropy.)
> 
> The sun4i_ss_prng_seed() buffer overflow was reported by Tianchu Chen
> and discovered by Atuin - Automated Vulnerability Discovery Engine
> 
> There's no point in fixing all these vulnerabilities individually when
> this is unused code, so let's just remove it.
> 
> Fixes: b8ae5c7387ad ("crypto: sun4i-ss - support the Security System PRNG")
> Cc: stable@vger.kernel.org
> Reported-by: Tianchu Chen <flynnnchen@tencent.com>
> Closes: https://lore.kernel.org/r/af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev/
> Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is targeting crypto/master
> 
> v2: rebased onto crypto/master, and added Acked-by and Reported-by
> 
>  arch/arm/configs/sunxi_defconfig              |  1 -
>  drivers/crypto/allwinner/Kconfig              |  8 ---
>  drivers/crypto/allwinner/sun4i-ss/Makefile    |  1 -
>  .../crypto/allwinner/sun4i-ss/sun4i-ss-core.c | 36 ----------
>  .../crypto/allwinner/sun4i-ss/sun4i-ss-prng.c | 69 -------------------
>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h  | 20 ------
>  6 files changed, 135 deletions(-)
>  delete mode 100644 drivers/crypto/allwinner/sun4i-ss/sun4i-ss-prng.c

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

