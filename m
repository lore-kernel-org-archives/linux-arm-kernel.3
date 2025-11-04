Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224BDCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xYqpK7gk35tODd0h5yiaeI/qICBJPOlqhRGit3KyAY=; b=gC4okyw0E2SxiSbMosZlhnLYh+
	Mc4XxwdWmH6M1DIfriHI65F/glTxKwONJmLrowGolT5wAXT2+hFSmuorfsLtTxbkw6DfDRuQCvfZR
	2Xdve3y7h/6WwhogRd950YhZB8LaGxcCIyqdejCUWt9G3cIk1A9sEfDn5hzb2Jg23M6NKvwbhcKKJ
	39ZGHlNL76VYxMt/mg7Ev/Ufx9/fteMlIVyPKmWgSbPSeaD1aN2j0dNoxr43Muw4+li45xdSK8ebT
	9oEdI79ilpCt3P5s4ziU0Gua5jOYCt0Liu8idZwv3Sa52A9+9M7KWEqHLipfzf+GCNx2ZlHO5N53O
	0+SjtCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGL0G-0000000CI0A-32Qp;
	Tue, 04 Nov 2025 17:39:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGL0F-0000000CI01-0w4h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C8B9601EC;
	Tue,  4 Nov 2025 17:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14414C4CEF7;
	Tue,  4 Nov 2025 17:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762277970;
	bh=dFzXmIcBVlOGJZ/dA9ocxVm/GMTXIf6nZ4evM0sDxuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=os7nvEy1/d3dzd2cJwR05Bti4sEOxgANxbGmOd9Yx2rsUDSsFAQ+qsZjTzAhbTaVP
	 nY1NXejKptIuqUc0mdWD68OjE667k55JI0s83nphDygfBrlUb8P93QJ8LOMK6HyCCh
	 xnLS0q2bEMpVIQFRWhlTkmJ9q0YCySOsLr/I3frvkerAp0h12MzExYtQoIGtUVzzHX
	 3HPpNjZSua69NZswC6eUjOTFDkoNSmPceETGRkgZECW0U0p+AMGXiDahJBQgsB68IO
	 FY9g1Uj2zVJyh4CrdkPrG7hzEEmzVdLfUHB/ELA7QHN1IMvDfNr3+CPiauXanXFasN
	 2fAdfYr/a97XQ==
Date: Tue, 4 Nov 2025 09:37:49 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Message-ID: <20251104173749.GA1780@sol>
References: <20251104054906.716914-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104054906.716914-1-ebiggers@kernel.org>
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

On Mon, Nov 03, 2025 at 09:49:06PM -0800, Eric Biggers wrote:
> On big endian arm kernels, the arm optimized Curve25519 code produces
> incorrect outputs and fails the Curve25519 test.  This has been true
> ever since this code was added.
> 
> It seems that hardly anyone (or even no one?) actually uses big endian
> arm kernels.  But as long as they're ostensibly supported, we should
> disable this code on them so that it's not accidentally used.
> 
> Note: for future-proofing, use !CPU_BIG_ENDIAN instead of
> CPU_LITTLE_ENDIAN.  Both of these are arch-specific options that could
> get removed in the future if big endian support gets dropped.
> 
> Fixes: d8f1308a025f ("crypto: arm/curve25519 - wire up NEON implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is targeting libcrypto-fixes
> 
>  lib/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
> index 8886055e938f..16859c6226dd 100644
> --- a/lib/crypto/Kconfig
> +++ b/lib/crypto/Kconfig
> @@ -62,11 +62,11 @@ config CRYPTO_LIB_CURVE25519
>  	  of the functions from <crypto/curve25519.h>.
>  
>  config CRYPTO_LIB_CURVE25519_ARCH
>  	bool
>  	depends on CRYPTO_LIB_CURVE25519 && !UML && !KMSAN
> -	default y if ARM && KERNEL_MODE_NEON
> +	default y if ARM && KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
>  	default y if PPC64 && CPU_LITTLE_ENDIAN
>  	default y if X86_64
>  
>  config CRYPTO_LIB_CURVE25519_GENERIC
>  	bool
> 
> base-commit: 1af424b15401d2be789c4dc2279889514e7c5c94
> -- 
> 2.51.2
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

- Eric

