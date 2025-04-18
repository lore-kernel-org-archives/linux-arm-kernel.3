Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D815C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cBam+4bEBq9fnDxk0jHRH2r9C5SS6Xd/ZiWHED3RBr8=; b=dVDC6ode7rxXzd
	taoyX7dNj/iu8mvqb5nBiykDoUu4gd+mRdXH4tdXxhpsrYJwG6wilfIAa+ag5HptQeUY/j/pD766I
	70javj9vB0VlO3kpohP4A86gBhmAt2uireZcU98FVD7Jeo/69K5pS+PbO8Ae4h5vDcjJg8ASLA4EM
	C4kncqt6cqw6PD8rN71sVgKClIy17neDPH6TgbiuPy1jx3K+uRY5bSdPtJy4Kq0TNQS5CUGyv+S0x
	gwLhh3AvaIIyd7j34iIeMWIYipy7p5VEcAfNdEp3J2HxcZ1RzPlhr18mFqCdbRZZVIbsG8vs08ZuU
	sDUAeix7Y2ohKwOkDNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5c7d-0000000Ex46-0MCm;
	Fri, 18 Apr 2025 03:10:33 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5c5h-0000000Ewuj-2zV4;
	Fri, 18 Apr 2025 03:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cBam+4bEBq9fnDxk0jHRH2r9C5SS6Xd/ZiWHED3RBr8=; b=Ad2r1puGLU+Y1rwUeDUqRhU0qO
	F7pjd6bV7RlyG39Dh5jEkE+5Cipv8h36HNwxkd/OFyixIJ6MxLwR9Lt/xnU3YlHz/ccXTGPXLJ11z
	kX3xxqCi5uGmCYV3AHyIGc+2fpgfU0xkYxttXTLSSQsa6Jc5ReCdOCQ9EshaKh69QTcEXZ2QH0dKa
	OCpbpHKL9L5fZR/YOyt7Z/zLu4/L+bkrOc8irkMvNXS8hOyxoLHQDiLQZthliGKqYzCqrgP19jXwn
	M9Ki5L0y6D3/MVduXxafDI2dZEU2TwnJJVwxN+sGp+xGVKV7/8ahMXvoJGkt55Cxb+uJ6YEljyPno
	EUy5oI0Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5c5Q-00GeUL-2y;
	Fri, 18 Apr 2025 11:08:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:08:16 +0800
Date: Fri, 18 Apr 2025 11:08:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAHCIL_sYIS_1JQH@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417182623.67808-2-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_200833_748074_2E655640 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Eric Biggers <ebiggers@kernel.org> wrote:
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 25ed6f1a7c7a..86fcce738887 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1753,5 +1753,7 @@ config ARCH_HIBERNATION_POSSIBLE
>        bool
>        depends on MMU
>        default y if ARCH_SUSPEND_POSSIBLE
> 
> endmenu
> +
> +source "arch/arm/crypto/Kconfig"

...

> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 9322e42e562d..cad71f32e1e3 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1424,13 +1424,10 @@ endmenu
> 
> config CRYPTO_HASH_INFO
>        bool
> 
> if !KMSAN # avoid false positives from assembly
> -if ARM
> -source "arch/arm/crypto/Kconfig"
> -endif

So this removes the KMSAN check.  Is it still needed or not?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

