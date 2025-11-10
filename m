Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43E6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIes4Aod3PBDuirwZc4mI3qdRVMdCx6zPHUTFLOLVzA=; b=CJUHqmn4b6CARVbwJvru8CtNLN
	vkw1n0M+2KSPiWPbfHu50GMbayABi4TYHK4tgdZeqVjBGLLbWh/q0uz1bJ/j6wDcOvn9FfU9STKvc
	Vrg4/4tN3j/IUOLOdEOa897eAziMteiIESkRzkiSIAUsCEPBseVS2+PC5tY5n4h26KXDXs5ur/Smo
	sHBBHXsdUiTHAUoV/2sW8+GVvIGzpe+bIkdmIFVJ1GtLKpwhcpV4qOr5g5WBPAx/e859rc2ClOBjK
	2dZdYN5CjFDK8paBmO2zW6ECk9+LPjbhwa97+PFApR+0kDrtKNhtZER2fTLn607oCVCo4AC/87O4O
	8MtO4M/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITiM-00000005gBX-4AFI;
	Mon, 10 Nov 2025 15:21:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITiL-00000005gBE-2rzQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:21:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18A7C60145
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9A4C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762788112;
	bh=JCUtzRvmbkdCmVZ4fqZm8IrCTYBd3uWoIG0IglRdUsY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uauCMFz6HGK3ax2RmhVM9h/Lbdgdl875vLiOiE69hahfy88eNCL9x0Dj/Hk+c7Xzf
	 y/9MqkS2XHfQCL8PfrVVajeydTyoSa981F9operMLeKaxdADS8zoTs7owZ/Qd070M0
	 Xq5UOO7cPgieqH6Bh0gQI30qLNgx8aDzUYiMY0ZostdzOhFavVdR2ml0LefbQtfthr
	 8LiAoRLnJ7Y6X39SzeZgzMwK9PBTM7Zlm8FPMcY8FSfGYLC2K2AM8/AjCUD1r1LBlK
	 yVsi/+hx6XLKrnqRV1Hpk24FVEXZBGaU+LiqXE2CzM+2yLQFBXORqdFq2QFHdJ6DiI
	 hy295t9chD66A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37a2dced861so29433111fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 07:21:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUV6F/g+fBIbvadtgVrIzVS7FrqGnoNikIV2+qdMyCJN13zB4SBKi6ebBMyyMzLlE9GFOYuWkflbSNNnuf66w+O@lists.infradead.org
X-Gm-Message-State: AOJu0YzfOCe6v4zvCPJXvRh3HKT6uERypn4s1nk8beSooDUzBIqqOp1y
	WhPP4Awv3H8yFjxhBGpuiqXqEXB/RiUvLhKHqlMt8VHz1SmtZ99qvMk35501LfzdCdInp5npGEt
	FF8xmk1d84NO8yioDkkpbwlzbvIuKudE=
X-Google-Smtp-Source: AGHT+IGA90qxUCgKbawTrvLQnKXihsfBR+wfYBPMapG2e93eFykZVqcR0ieSigBnjpQApyyYsedHo78n7CIpHnxQ0aw=
X-Received: by 2002:a05:6512:61b1:b0:579:bb21:a47b with SMTP id
 2adb3069b0e04-5945ef3a2f4mr2137577e87.28.1762788111220; Mon, 10 Nov 2025
 07:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20251109234726.638437-1-ebiggers@kernel.org> <20251109234726.638437-3-ebiggers@kernel.org>
In-Reply-To: <20251109234726.638437-3-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 10 Nov 2025 16:21:39 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE1mhu7u5RwhCBA_RUGV6JSDV-GQPpq+thE-0-oVxrmfw@mail.gmail.com>
X-Gm-Features: AWmQ_bniVZjRCPURX1xgSvugOeF2j7sagTMJnLfQBS0PgZ_MmRwapD4fdhXdrv8
Message-ID: <CAMj1kXE1mhu7u5RwhCBA_RUGV6JSDV-GQPpq+thE-0-oVxrmfw@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/crypto: polyval: Add POLYVAL library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi,

On Mon, 10 Nov 2025 at 00:49, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Add support for POLYVAL to lib/crypto/.
>
> This will replace the polyval crypto_shash algorithm and its use in the
> hctr2 template, simplifying the code and reducing overhead.
>
> Specifically, this commit introduces the POLYVAL library API and a
> generic implementation of it.  Later commits will migrate the existing
> architecture-optimized implementations of POLYVAL into lib/crypto/ and
> add a KUnit test suite.
>
> I've also rewritten the generic implementation completely, using a more
> modern approach instead of the traditional table-based approach.  It's
> now constant-time, requires no precomputation or dynamic memory
> allocations, decreases the per-key memory usage from 4096 bytes to 16
> bytes, and is faster than the old polyval-generic even on bulk data
> reusing the same key (at least on x86_64, where I measured 15% faster).
> We should do this for GHASH too, but for now just do it for POLYVAL.
>

Very nice.

GHASH might suffer on 32-bit, I suppose, but taking this approach at
least on 64-bit also for GHASH would be a huge improvement.

I had a stab at replacing the int128 arithmetic with
__builtin_bitreverse64(), but it seems to make little difference (and
GCC does not support it [yet]). I've tried both arm64 and x86, and the
perf delta (using your kunit benchmark) is negligible in either case.
(FYI)



> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  include/crypto/polyval.h | 171 +++++++++++++++++++++-
>  lib/crypto/Kconfig       |  10 ++
>  lib/crypto/Makefile      |   8 +
>  lib/crypto/polyval.c     | 307 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 493 insertions(+), 3 deletions(-)
>  create mode 100644 lib/crypto/polyval.c
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Ard Biesheuvel <ardb@kernel.org>

