Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC20C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 05:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xxYezVCCW8thv+qLiUz6l9UAqKd/qP+JO8d98YSqd48=; b=jfEWSHJ9yAyYUx
	kFSi5yjYjL9Jy/a2b10yzMNt9IST8LGSK9IpLJk4WmXTy1m38jdGewmy2g5J2O/1jyavJEdngQddl
	7DytlXqT2NR9JFyVn5DG2cj81W9F5vFIiMOvT2HUgzS4cvLoeGb+efW4adAM4a1vxzE47uNtQsg6M
	BR6halOYK9uvLTGVo/aLBQ8MI0rssyKIsCc79o+grjvbJJVxftboPVj7rerdd/kPHduLNQD3tmFm6
	FCXROLwXLmUUV2UXYJuN/EA/jFE4jh/LYlTpi3puzQvoXvTFlnNYev08qTiowwsgcmRn7I9NgVYYS
	IAT+EOBCVRhZ3SvylrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEM1P-00000008RTE-1rQv;
	Mon, 12 May 2025 05:48:15 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELzJ-00000008RJZ-2FrS;
	Mon, 12 May 2025 05:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xxYezVCCW8thv+qLiUz6l9UAqKd/qP+JO8d98YSqd48=; b=S/s7t2pOkSMknAlt9Xo72xB+Xk
	2BeBKd0JobLfzVY1rfopu4wpLQVmbiyoIyrKWNfw7fJElr2DnZf+2tHomWPWndlZcrQd/HdtxrhMo
	tTihOowVp20dSE+SUvgkndWKyD9qKp1x0wWN4TQ/VwCRY6nFbhGy50FuzlO8OKpMeqYiggyoTmsLl
	jQkWg8LN7KnZjUelc9rjFiuoTc8BIYX9Cd3aVWjMbysGB/o95Lhq3vAWZktaVIkqPbsqxzOxFvI26
	OMBaBIB1PNbiIjiT0ucY5IFwu4MO/jlIIwZjeJxlcxvoVPc77KsOtexUw0YOl1fVZTXqXTY0jvh6h
	Lula7ezA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uELz5-005LnN-2T;
	Mon, 12 May 2025 13:45:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 12 May 2025 13:45:51 +0800
Date: Mon, 12 May 2025 13:45:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	Jason@zx2c4.com, tytso@mit.edu
Subject: Re: [PATCH 0/4] crypto: lib/chacha - improve type safety
Message-ID: <aCGLDzAkVn65P4n4@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_224606_511055_D7851C56 
X-CRM114-Status: GOOD (  10.63  )
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
> This series can also be retrieved from:
> 
>    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-prototypes-v1
> 
> This series improves type safety and clarity in the ChaCha functions by
> strongly typing the state array and adding explicit array bounds for
> other fixed-length arrays.  No functional changes.
> 
> Eric Biggers (4):
>  crypto: lib/chacha - strongly type the ChaCha state
>  crypto: lib/chacha - use struct assignment to copy state
>  crypto: lib/chacha - add strongly-typed state zeroization
>  crypto: lib/chacha - add array bounds to function prototypes
> 
> arch/arm/lib/crypto/chacha-glue.c             | 34 ++++----
> arch/arm/lib/crypto/chacha-scalar-core.S      |  5 +-
> arch/arm64/lib/crypto/chacha-neon-glue.c      | 27 ++++---
> arch/mips/lib/crypto/chacha-glue.c            |  6 +-
> arch/powerpc/lib/crypto/chacha-p10-glue.c     | 17 ++--
> arch/powerpc/lib/crypto/chacha-p10le-8x.S     |  6 +-
> arch/riscv/lib/crypto/chacha-riscv64-glue.c   |  9 ++-
> arch/riscv/lib/crypto/chacha-riscv64-zvkb.S   | 10 +--
> arch/s390/lib/crypto/chacha-glue.c            | 13 +--
> arch/x86/lib/crypto/chacha_glue.c             | 62 ++++++++------
> crypto/chacha.c                               | 20 ++---
> drivers/char/random.c                         | 41 +++++-----
> fs/bcachefs/checksum.c                        | 18 ++---
> include/crypto/chacha.h                       | 80 ++++++++++++-------
> lib/crypto/chacha.c                           | 40 +++++-----
> lib/crypto/chacha20poly1305-selftest.c        |  8 +-
> lib/crypto/chacha20poly1305.c                 | 53 ++++++------
> lib/crypto/libchacha.c                        |  2 +-
> .../crypto/chacha20-s390/test-cipher.c        | 10 +--
> 19 files changed, 253 insertions(+), 208 deletions(-)
> 
> 
> base-commit: 64745a9ca890ed60d78162ec511e1983e1946d73

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

