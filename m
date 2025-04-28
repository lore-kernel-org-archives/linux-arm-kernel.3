Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18B3C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8T1VCs93WeCfIwMLTXrgNJ1jyLMDpCR3K8Uym9nsnV4=; b=O3GjMbqhtjASWZ
	vkjIVCmMvMZadXHJKHzCQTjRjP1HpsTUNNn1q35CugoCw75ZWgzfgYIl5P8uTdjQCkDMhVJcU+Y43
	8sOVhV/91aDFNps9UyDDrTJijJFKr96DX7m1zwIWb4dqeCFL3zyFF8wq2rp0k7JNvM+yCGs3+GPzT
	WjluhwwfzWtnWrUR6U+1+WLbuK6UGR71/hbhN6eaajRyUIheWH+vHFHz8PgmhDtUTWFCrAafh/3uc
	Yljs04QmIPOu6qeGUPQ1B0R5W5lq/OL7u4qJns6SDpeitA5B7PBYZ4GmZ7hDzdXBF4+vpep6qtoYc
	K4DQFOy+35P/ds6pt3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NUe-000000069v6-0nWH;
	Mon, 28 Apr 2025 12:21:52 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9N2u-000000062s4-3Omx;
	Mon, 28 Apr 2025 11:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8T1VCs93WeCfIwMLTXrgNJ1jyLMDpCR3K8Uym9nsnV4=; b=F9HnbTnW/poPgQVr/cZWd+pwSz
	2p1UYqYxeKKqwA8eoU4d9x1FUmWqDFUKj4m1rUYjb/NZ9L/ay2spOHSOBLPXjjOkgGBjoE2P9jaY0
	SO6fLRcrPnA4AqqV6iTh6DthFMKWQ5y+2BNRYeq6kcb0mNigo2TQnP1X+8q2t4Cf/E71Dp+6Lc2iG
	rTQFgMhEtDcoE4KDOvGEy2T8moHCtm+9KViSFwmLwa/1cvp4ub/24zEUUuztEGO5LleSISGHI99Tf
	g1Z9Vys8EoAA69OOsZwOKwArWjMhPqhm7YMnEeA5etXfn6zfP8eJ1HnmeULhjUSmQB4vIUfCLIheP
	SY6L1ryw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9N2q-001bJS-2Z;
	Mon, 28 Apr 2025 19:53:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 19:53:08 +0800
Date: Mon, 28 Apr 2025 19:53:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH v3 00/13] Finish disentangling ChaCha, Poly1305, and
 BLAKE2s from CRYPTO
Message-ID: <aA9sJKUjfhRPMWSo@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_045313_142934_C73AA299 
X-CRM114-Status: GOOD (  17.85  )
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
> This series removes the unnecessary dependency of the ChaCha, Poly1305,
> and BLAKE2s library functions on the generic crypto infrastructure, i.e.
> CONFIG_CRYPTO.  To do this, it moves the architecture-optimized
> implementations of these functions into new directories
> arch/*/lib/crypto/ which do not depend on CRYPTO.  This mirrors the
> existing distinction between crypto/ and lib/crypto/.
> 
> The last two patches remove the selection of CRYPTO by CRYPTO_LIB_CHACHA
> and CRYPTO_LIB_POLY1305, and they remove the corresponding *_INTERNAL
> symbols which were needed only because of the entanglement with CRYPTO.
> 
> Note that Curve25519 is still entangled.  Later patches will fix that.
> 
> Changed in v3:
>   - Fixed build error on arm with CONFIG_CPU_THUMBONLY=y.
>   - Small whitespace and commit message fixes.
>   - Added Acked-by's.
> 
> Changed in v2:
>   - Introduced new directories arch/*/lib/crypto/ instead of keeping
>     the library functions in arch/*/crypto/.
> 
> Eric Biggers (13):
>  crypto: arm64 - drop redundant dependencies on ARM64
>  crypto: powerpc - drop redundant dependencies on PPC
>  crypto: s390 - drop redundant dependencies on S390
>  crypto: x86 - drop redundant dependencies on X86
>  crypto: arm - move library functions to arch/arm/lib/crypto/
>  crypto: arm64 - move library functions to arch/arm64/lib/crypto/
>  crypto: mips - move library functions to arch/mips/lib/crypto/
>  crypto: powerpc - move library functions to arch/powerpc/lib/crypto/
>  crypto: riscv - move library functions to arch/riscv/lib/crypto/
>  crypto: s390 - move library functions to arch/s390/lib/crypto/
>  crypto: x86 - move library functions to arch/x86/lib/crypto/
>  crypto: lib/chacha - remove INTERNAL symbol and selection of CRYPTO
>  crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO
> 
> MAINTAINERS                                   |  1 +
> arch/arm/crypto/Kconfig                       | 23 -----
> arch/arm/crypto/Makefile                      | 14 +--
> arch/arm/lib/Makefile                         |  2 +
> arch/arm/lib/crypto/.gitignore                |  2 +
> arch/arm/lib/crypto/Kconfig                   | 24 ++++++
> arch/arm/lib/crypto/Makefile                  | 26 ++++++
> arch/arm/{ => lib}/crypto/blake2s-core.S      |  0
> arch/arm/{ => lib}/crypto/blake2s-glue.c      |  0
> arch/arm/{ => lib}/crypto/chacha-glue.c       |  0
> arch/arm/{ => lib}/crypto/chacha-neon-core.S  |  0
> .../arm/{ => lib}/crypto/chacha-scalar-core.S |  0
> arch/arm/{ => lib}/crypto/poly1305-armv4.pl   |  0
> arch/arm/{ => lib}/crypto/poly1305-glue.c     |  0
> arch/arm64/crypto/Kconfig                     | 17 +---
> arch/arm64/crypto/Makefile                    |  9 +-
> arch/arm64/lib/Makefile                       |  3 +
> arch/arm64/lib/crypto/.gitignore              |  2 +
> arch/arm64/lib/crypto/Kconfig                 | 14 +++
> arch/arm64/lib/crypto/Makefile                | 16 ++++
> .../arm64/{ => lib}/crypto/chacha-neon-core.S |  0
> .../arm64/{ => lib}/crypto/chacha-neon-glue.c |  0
> arch/arm64/{ => lib}/crypto/poly1305-armv8.pl |  0
> arch/arm64/{ => lib}/crypto/poly1305-glue.c   |  0
> arch/mips/crypto/Kconfig                      | 11 ---
> arch/mips/crypto/Makefile                     | 17 ----
> arch/mips/lib/Makefile                        |  2 +
> arch/mips/lib/crypto/.gitignore               |  2 +
> arch/mips/lib/crypto/Kconfig                  | 12 +++
> arch/mips/lib/crypto/Makefile                 | 19 ++++
> arch/mips/{ => lib}/crypto/chacha-core.S      |  0
> arch/mips/{ => lib}/crypto/chacha-glue.c      |  0
> arch/mips/{ => lib}/crypto/poly1305-glue.c    |  0
> arch/mips/{ => lib}/crypto/poly1305-mips.pl   |  0
> arch/powerpc/crypto/Kconfig                   | 22 +----
> arch/powerpc/crypto/Makefile                  |  4 -
> arch/powerpc/lib/Makefile                     |  2 +
> arch/powerpc/lib/crypto/Kconfig               | 15 ++++
> arch/powerpc/lib/crypto/Makefile              |  7 ++
> .../{ => lib}/crypto/chacha-p10-glue.c        |  0
> .../{ => lib}/crypto/chacha-p10le-8x.S        |  0
> .../{ => lib}/crypto/poly1305-p10-glue.c      |  0
> .../{ => lib}/crypto/poly1305-p10le_64.S      |  0
> arch/riscv/crypto/Kconfig                     |  7 --
> arch/riscv/crypto/Makefile                    |  3 -
> arch/riscv/lib/Makefile                       |  1 +
> arch/riscv/lib/crypto/Kconfig                 |  8 ++
> arch/riscv/lib/crypto/Makefile                |  4 +
> .../{ => lib}/crypto/chacha-riscv64-glue.c    |  0
> .../{ => lib}/crypto/chacha-riscv64-zvkb.S    |  0
> arch/s390/crypto/Kconfig                      | 16 ----
> arch/s390/crypto/Makefile                     |  3 -
> arch/s390/lib/Makefile                        |  1 +
> arch/s390/lib/crypto/Kconfig                  |  7 ++
> arch/s390/lib/crypto/Makefile                 |  4 +
> arch/s390/{ => lib}/crypto/chacha-glue.c      |  0
> arch/s390/{ => lib}/crypto/chacha-s390.S      |  0
> arch/s390/{ => lib}/crypto/chacha-s390.h      |  0
> arch/x86/crypto/Kconfig                       | 86 +++++++------------
> arch/x86/crypto/Makefile                      | 15 ----
> arch/x86/lib/Makefile                         |  2 +
> arch/x86/lib/crypto/.gitignore                |  2 +
> arch/x86/lib/crypto/Kconfig                   | 26 ++++++
> arch/x86/lib/crypto/Makefile                  | 17 ++++
> arch/x86/{ => lib}/crypto/blake2s-core.S      |  0
> arch/x86/{ => lib}/crypto/blake2s-glue.c      |  0
> .../x86/{ => lib}/crypto/chacha-avx2-x86_64.S |  0
> .../{ => lib}/crypto/chacha-avx512vl-x86_64.S |  0
> .../{ => lib}/crypto/chacha-ssse3-x86_64.S    |  0
> arch/x86/{ => lib}/crypto/chacha_glue.c       |  0
> .../crypto/poly1305-x86_64-cryptogams.pl      |  0
> arch/x86/{ => lib}/crypto/poly1305_glue.c     |  0
> crypto/Kconfig                                |  4 +-
> lib/crypto/Kconfig                            | 56 +++++++-----
> 74 files changed, 294 insertions(+), 234 deletions(-)
> create mode 100644 arch/arm/lib/crypto/.gitignore
> create mode 100644 arch/arm/lib/crypto/Kconfig
> create mode 100644 arch/arm/lib/crypto/Makefile
> rename arch/arm/{ => lib}/crypto/blake2s-core.S (100%)
> rename arch/arm/{ => lib}/crypto/blake2s-glue.c (100%)
> rename arch/arm/{ => lib}/crypto/chacha-glue.c (100%)
> rename arch/arm/{ => lib}/crypto/chacha-neon-core.S (100%)
> rename arch/arm/{ => lib}/crypto/chacha-scalar-core.S (100%)
> rename arch/arm/{ => lib}/crypto/poly1305-armv4.pl (100%)
> rename arch/arm/{ => lib}/crypto/poly1305-glue.c (100%)
> create mode 100644 arch/arm64/lib/crypto/.gitignore
> create mode 100644 arch/arm64/lib/crypto/Kconfig
> create mode 100644 arch/arm64/lib/crypto/Makefile
> rename arch/arm64/{ => lib}/crypto/chacha-neon-core.S (100%)
> rename arch/arm64/{ => lib}/crypto/chacha-neon-glue.c (100%)
> rename arch/arm64/{ => lib}/crypto/poly1305-armv8.pl (100%)
> rename arch/arm64/{ => lib}/crypto/poly1305-glue.c (100%)
> create mode 100644 arch/mips/lib/crypto/.gitignore
> create mode 100644 arch/mips/lib/crypto/Kconfig
> create mode 100644 arch/mips/lib/crypto/Makefile
> rename arch/mips/{ => lib}/crypto/chacha-core.S (100%)
> rename arch/mips/{ => lib}/crypto/chacha-glue.c (100%)
> rename arch/mips/{ => lib}/crypto/poly1305-glue.c (100%)
> rename arch/mips/{ => lib}/crypto/poly1305-mips.pl (100%)
> create mode 100644 arch/powerpc/lib/crypto/Kconfig
> create mode 100644 arch/powerpc/lib/crypto/Makefile
> rename arch/powerpc/{ => lib}/crypto/chacha-p10-glue.c (100%)
> rename arch/powerpc/{ => lib}/crypto/chacha-p10le-8x.S (100%)
> rename arch/powerpc/{ => lib}/crypto/poly1305-p10-glue.c (100%)
> rename arch/powerpc/{ => lib}/crypto/poly1305-p10le_64.S (100%)
> create mode 100644 arch/riscv/lib/crypto/Kconfig
> create mode 100644 arch/riscv/lib/crypto/Makefile
> rename arch/riscv/{ => lib}/crypto/chacha-riscv64-glue.c (100%)
> rename arch/riscv/{ => lib}/crypto/chacha-riscv64-zvkb.S (100%)
> create mode 100644 arch/s390/lib/crypto/Kconfig
> create mode 100644 arch/s390/lib/crypto/Makefile
> rename arch/s390/{ => lib}/crypto/chacha-glue.c (100%)
> rename arch/s390/{ => lib}/crypto/chacha-s390.S (100%)
> rename arch/s390/{ => lib}/crypto/chacha-s390.h (100%)
> create mode 100644 arch/x86/lib/crypto/.gitignore
> create mode 100644 arch/x86/lib/crypto/Kconfig
> create mode 100644 arch/x86/lib/crypto/Makefile
> rename arch/x86/{ => lib}/crypto/blake2s-core.S (100%)
> rename arch/x86/{ => lib}/crypto/blake2s-glue.c (100%)
> rename arch/x86/{ => lib}/crypto/chacha-avx2-x86_64.S (100%)
> rename arch/x86/{ => lib}/crypto/chacha-avx512vl-x86_64.S (100%)
> rename arch/x86/{ => lib}/crypto/chacha-ssse3-x86_64.S (100%)
> rename arch/x86/{ => lib}/crypto/chacha_glue.c (100%)
> rename arch/x86/{ => lib}/crypto/poly1305-x86_64-cryptogams.pl (100%)
> rename arch/x86/{ => lib}/crypto/poly1305_glue.c (100%)
> 
> 
> base-commit: bb9c648b334be581a791c7669abaa594e4b5ebb7

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

