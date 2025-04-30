Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5B1C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LIy8RjJcHA6kmS230+26y/VusUu4oONIC/b+zJtksg=; b=FG6JxfeYjSyRJqKOIh0ct0xkuP
	+SAhgtcaW7hBFn/USIp1nl8oDMHqAL65cMFtT6UVPba6sBLhaRxb+K5ehEwmj/ApGUzVvUtPF5aWx
	jOBLiIfqxE3SHwX/0NEAQpZfOwiwsLdjwmV/fa5+AY6rBOmhp2osYXNCDh4Uy9SmG6JqVZloVuc02
	HYk+DF+96p40LauUaAsrxOn3tR/FMMcZc4BSzvF63Na8e5DElIL2zjKr5RvNWUYStEXy2klRCk3rT
	CA4EfuXwwKgqHZAjVGmitHuuZDRl979s4xHBE8JjB/yQViCR3KrQo31bgCtoqFwxrB/KjTenZNyeW
	JCW/8HoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uABX7-0000000DZxG-0R4A;
	Wed, 30 Apr 2025 17:47:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uABVC-0000000DZnF-3gYB;
	Wed, 30 Apr 2025 17:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39BE86842A;
	Wed, 30 Apr 2025 17:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7027EC4CEE7;
	Wed, 30 Apr 2025 17:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746035146;
	bh=KRq3ObS+7bPSh5npZvFvh2C1vvjoanHB8ALoJ0Lw5oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5Ki7ZeoUb9ZN4LPaDEoM1o1bvfVz7fD1oztts7rOpVhwqg4oS5OvcmfJCGu3gxUH
	 fT26UoXeSWagXlFQb3TkXpFnlFx9pI6CdXses/373TH68nkQ5m1XnkeCZyjTB3pjL8
	 hB2unDN1O+ZToSdOpBH6aVt6DnPXIiit23u0m97zhbqweH/oPbGvmEvxIZXP3/PGuI
	 fXfOoMh+QT2xdYboklbx8EcmahcftGMdK+N5ysjtRDWRo5qH2CA9yak25NsdYdhKlS
	 5Unk+mvpoO/hy1QMjlUYCjybEmTkDQ2xbgxYdXD5WmCQ7eiojk/2fQ1VOdLNWLhrd4
	 FfCKW0EMC7VFg==
Date: Wed, 30 Apr 2025 10:45:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 00/12] crypto: sha256 - Use partial block API
Message-ID: <20250430174543.GB1958@sol.localdomain>
References: <cover.1745992998.git.herbert@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1745992998.git.herbert@gondor.apana.org.au>
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

[Added back Cc's that were dropped]

On Wed, Apr 30, 2025 at 02:06:15PM +0800, Herbert Xu wrote:
> This is based on
> 
> 	https://patchwork.kernel.org/project/linux-crypto/list/?series=957785

I'm assuming that you mean that with your diff
https://lore.kernel.org/r/aBGdiv17ztQnhAps@gondor.apana.org.au folded into my
first patch, since otherwise your patch series doesn't apply.  But even with
that done, your patch series doesn't build:

    In file included from ./include/crypto/hash_info.h:12,
                     from crypto/hash_info.c:9:
    ./include/crypto/sha2.h: In function ‘sha256_init’:
    ./include/crypto/sha2.h:101:32: error: ‘struct sha256_state’ has no member named ‘ctx’
      101 |         sha256_block_init(&sctx->ctx);
          |                                ^~

> Rather than going through the lib/sha256 partial block handling,
> use the native shash partial block API.  Add two extra shash
> algorithms to provide testing coverage for lib/sha256.
> 
> Herbert Xu (12):
>   crypto: lib/sha256 - Restore lib_sha256 finup code
>   crypto: sha256 - Use the partial block API for generic
>   crypto: arm/sha256 - Add simd block function
>   crypto: arm64/sha256 - Add simd block function
>   crypto: mips/sha256 - Export block functions as GPL only
>   crypto: powerpc/sha256 - Export block functions as GPL only
>   crypto: riscv/sha256 - Add simd block function
>   crypto: s390/sha256 - Export block functions as GPL only
>   crypto: sparc/sha256 - Export block functions as GPL only
>   crypto: x86/sha256 - Add simd block function
>   crypto: lib/sha256 - Use generic block helper
>   crypto: sha256 - Use the partial block API
>
>  arch/arm/lib/crypto/Kconfig                   |   1 +
>  arch/arm/lib/crypto/sha256-armv4.pl           |  20 +--
>  arch/arm/lib/crypto/sha256.c                  |  16 +--
>  arch/arm64/crypto/sha512-glue.c               |   6 +-
>  arch/arm64/lib/crypto/Kconfig                 |   1 +
>  arch/arm64/lib/crypto/sha2-armv8.pl           |   2 +-
>  arch/arm64/lib/crypto/sha256.c                |  16 +--
>  .../mips/cavium-octeon/crypto/octeon-sha256.c |   4 +-
>  arch/powerpc/lib/crypto/sha256.c              |   4 +-
>  arch/riscv/lib/crypto/Kconfig                 |   1 +
>  arch/riscv/lib/crypto/sha256.c                |  17 ++-
>  arch/s390/lib/crypto/sha256.c                 |   4 +-
>  arch/sparc/lib/crypto/sha256.c                |   4 +-
>  arch/x86/lib/crypto/Kconfig                   |   1 +
>  arch/x86/lib/crypto/sha256.c                  |  16 ++-
>  crypto/sha256.c                               | 134 +++++++++++-------
>  include/crypto/internal/sha2.h                |  46 ++++++
>  include/crypto/sha2.h                         |  14 +-
>  lib/crypto/Kconfig                            |   8 ++
>  lib/crypto/sha256.c                           | 100 +++----------
>  20 files changed, 232 insertions(+), 183 deletions(-)

The EXPORT_SYMBOL => EXPORT_SYMBOL_GPL changes are fine and should just be one
patch.  I was just trying to be consistent with lib/crypto/sha256.c which uses
EXPORT_SYMBOL, but EXPORT_SYMBOL_GPL is fine too.

Everything else in this series is harmful, IMO.

I already covered why crypto_shash should simply use the library and not do
anything special.

As for your sha256_finup "optimization", it's an interesting idea, but
unfortunately it slightly slows down the common case which is count % 64 < 56,
due to the unnecessary copy to the stack and the following zeroization.  In the
uncommon case where count % 64 >= 56 you do get to pass nblocks=2 to
sha256_blocks_*(), but ultimately SHA-256 is serialized block-by-block anyway,
so it ends up being only slightly faster in that case, which again is the
uncommon case.  So while it's an interesting idea, it doesn't seem to actually
be better.  And the fact that that patch is also being used to submit unrelated,
more dubious changes isn't very helpful, of course.

- Eric

