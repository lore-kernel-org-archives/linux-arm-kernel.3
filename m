Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E82C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=dB9keRMOwVIcNoNRSHHCD2QKgPNuoGWRXYd2uwzW990=; b=dEfNX+Y5jUsQTA
	cIUfN0GEv02B5RtU2ovNGBp7Po3oSKNK2VHulBO/kZFDOmMDufmdbxLpbDfPASmmF+4pdvV89itVS
	KzwNviER4/gZpBqGrJNTb6txAcKTy93cjWjCDKJdHNJ+fMngnDjDMbg25YTrmJi/sDHVU1zINM8XU
	51pVcBZfMUZLt+LAfYDv1z+ntYZZswCPjY6yYpp+hBtMbpfzzd+7aqGiQAtWC5dD8Gt2g3Z8yiVi2
	2UwbUVFAXgYkItBpG0O80z7Bx8z+1fWEsP7mK3diGfkdSg9q5T+LI+tQBpI1unvY9mS8rVlYhgwAU
	0Ssp2ZoX8Sg13cDDOuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f7p-0000000GSyP-09UC;
	Mon, 07 Apr 2025 05:34:25 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f2c-0000000GSD0-2W2h;
	Mon, 07 Apr 2025 05:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dB9keRMOwVIcNoNRSHHCD2QKgPNuoGWRXYd2uwzW990=; b=UHwODn/VjKqS1kbYWo32znTwIw
	MpG+JrhQnruzYLJX7YQgJWvbKzQEVRLBvy+UtAHi+prcy5LeUWFzHeyu50iWv7ZK2ZXKEI411HdBa
	INdLSkaiUMFA7St1XvHZCW6gpjZ/2fBNspqrUn4sydcldmLTQK3JipGLUX6JBpyhtaGFyUko+gNb9
	ahhkIXuXKtsuWfFxIr07DIWSvlFWv9XCC35yW/hlTv6DR0CyIboNnoXiPAZlcUDhopzdffRNRbUsV
	bbEO4jeMKg2+Ye/30S7ktszHbEo4g+SHTyevuL6IO8GGowfjSH7PNtJ1Mzj5vhPd3xQZHT7RapLsr
	wT/2Mn5g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1f2Y-00DNNS-2U;
	Mon, 07 Apr 2025 13:28:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 13:28:58 +0800
Date: Mon, 7 Apr 2025 13:28:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 0/9] Remove per-architecture ChaCha skcipher glue code
Message-ID: <Z_Nimiv1Wkfo3gBd@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_222902_638512_1561FCE8 
X-CRM114-Status: GOOD (  28.14  )
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
> Currently each architecture exposes ChaCha not only through the library
> API, but also through the crypto_skcipher API.  That requires each
> architecture to implement essentially the same skcipher glue code.
> 
> Following the example of what's been done for crc32 and crc32c,
> eliminate this redundancy by making crypto/chacha.c register both the
> generic and architecture-optimized skcipher algorithms, implemented on
> top of the appropriate library functions.  This removes almost 800 lines
> of code and disentangles the library code from the skcipher API.
> 
> From what I remember, the following are the reasons why it wasn't just
> done this way originally.  But none of these really hold water:
> 
> - The skcipher code was there first, so it may have seemed more natural
>  to add onto it rather than replace it.
> 
> - Architectures could register multiple skcipher algorithms using
>  different CPU features and have them all be tested in a single boot.
>  This was convenient in theory, but it never really worked properly.
>  It didn't apply to the library code, the x86 ChaCha code wasn't
>  actually doing this (it used static keys instead), and this cannot
>  catch bugs like accidentally using an AVX instruction in SSE code.
>  Instead, a correct solution, which also doesn't require any special
>  kernel support, is to just boot the kernel in QEMU using different
>  -cpu arguments as needed to test all the code.
> 
> - There was a concern about changing cra_driver_names potentially
>  breaking users.  But in practice users rely on cra_name, not
>  cra_driver_name.  We already change, add, and remove cra_driver_names
>  occasionally for various reasons.  And even if someone was relying on
>  a specific cra_driver_name, there are some more lightweight
>  compatibility tricks that could be used.
> 
> - There was a desire for users to be able to override the kernel's
>  choice of ChaCha implementation by blacklisting the arch-optimized
>  ChaCha module.  But that already became mostly impossible when the
>  library functions were added to the same module.  And in practice
>  users don't do this anyway.  Even if, hypothetically, someone really
>  needed to do this and for some reason the kernel couldn't be fixed to
>  make the right choice in their case automatically, there are other
>  ways this could be implemented such as a module parameter.
> 
> Eric Biggers (9):
>  crypto: riscv/chacha - implement library instead of skcipher
>  crypto: chacha - centralize the skcipher wrappers for arch code
>  crypto: arm/chacha - remove the redundant skcipher algorithms
>  crypto: arm64/chacha - remove the skcipher algorithms
>  crypto: mips/chacha - remove the skcipher algorithms
>  crypto: powerpc/chacha - remove the skcipher algorithms
>  crypto: s390/chacha - remove the skcipher algorithms
>  crypto: x86/chacha - remove the skcipher algorithms
>  crypto: chacha - remove <crypto/internal/chacha.h>
> 
> arch/arm/crypto/Kconfig                 |   7 -
> arch/arm/crypto/chacha-glue.c           | 243 +---------------------
> arch/arm/crypto/chacha-neon-core.S      |   2 +-
> arch/arm64/crypto/Kconfig               |   7 -
> arch/arm64/crypto/chacha-neon-core.S    |   2 +-
> arch/arm64/crypto/chacha-neon-glue.c    | 146 +------------
> arch/mips/crypto/Kconfig                |   6 -
> arch/mips/crypto/chacha-glue.c          | 131 +-----------
> arch/powerpc/crypto/Kconfig             |   8 -
> arch/powerpc/crypto/chacha-p10-glue.c   | 147 +-------------
> arch/riscv/crypto/Kconfig               |  11 +-
> arch/riscv/crypto/chacha-riscv64-glue.c | 112 ++++------
> arch/riscv/crypto/chacha-riscv64-zvkb.S |  71 +++----
> arch/s390/crypto/Kconfig                |   7 -
> arch/s390/crypto/chacha-glue.c          |  99 ++-------
> arch/x86/crypto/Kconfig                 |   9 -
> arch/x86/crypto/chacha_glue.c           | 144 +------------
> crypto/Makefile                         |   3 +-
> crypto/chacha.c                         | 260 ++++++++++++++++++++++++
> crypto/chacha_generic.c                 | 139 -------------
> include/crypto/chacha.h                 |   9 +
> include/crypto/internal/chacha.h        |  43 ----
> 22 files changed, 413 insertions(+), 1193 deletions(-)
> create mode 100644 crypto/chacha.c
> delete mode 100644 crypto/chacha_generic.c
> delete mode 100644 include/crypto/internal/chacha.h
> 
> base-commit: 56f944529ec2292cbe63377a76df3759d702dd39

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

