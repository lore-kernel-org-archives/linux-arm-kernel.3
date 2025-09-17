Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379E7CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1a76mUPcO8ns9YF9A2LMR/FDKI2TrOPgSqlo6j1FBU=; b=TBBKsdyHJQIesc2GwXr9Pqp18n
	5L5qBbacZqLHU8NCTtS4/QehdtLeISpcCD0nHlY6JMFMDB6yxAtncyzt0X7dM7i/x802b6mIw8/wS
	12A1K+aM22Bt9e69bNtkL8C94uGM/lbG3Np12Kbw2vN3JZFglQp+O0iGmZSHKiMqxQv6Wd7SfBDAh
	JIalRiesnMBTyUMlYk7YWPK/FCti0EZV9WupWy03XRq5wcRgU6R+1v+lsa7vEnFs4YuCup2f6LTSn
	HI6jiYXqO9g9zAQEgGgMdrHKgd88tERsvL4T4zNPtwX63eE1w3S1aiu8OtcKMCzuEFZQ80VqbXn+Z
	rhFzxDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuC0-0000000CkfR-0q0A;
	Wed, 17 Sep 2025 15:35:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuBx-0000000Ckci-2w2H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE34D44F9B;
	Wed, 17 Sep 2025 15:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8896DC4CEFB;
	Wed, 17 Sep 2025 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123332;
	bh=nZQmPYQCP3V4ITomeSxoV+uy8f0B16OIffQH9A20qOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mcMv7Zz6T6tGTriSDVWaKbFL6i2iWb3ourTAd4+bYfjU2Rexh0wG0hggzCTZG30cI
	 YFYE9m65FmPgEBFhgNuUMwxPFkgkINiIf/1akmcMsjS60AlxQxun1i4uAWfO7JWGGf
	 AJJXnIPxtDE6nCwIsK938pLgPaV0ob7Y0J105rmhUOMR6WzqtlXniKSUVHBaH69QaY
	 B0vFcXp2RUtB4awYOsUkXqRxbQc3zSMKWRlH249br1ifFKx5091v8D/PK4gsdzXrku
	 plfwG5WXHierR2Xvm/pWkEVUIxjfV8q8fp6PMObe0EQr9jI8RTbKwu/LEcjYZH9dzy
	 cf1XDAMp4lE8Q==
Date: Wed, 17 Sep 2025 10:35:29 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org, fsverity@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, x86@kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/6] Optimize fsverity using 2-way interleaved SHA-256
 hashing
Message-ID: <20250917153529.GA45754@quark>
References: <20250915160819.140019-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915160819.140019-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_083533_801632_0567A667 
X-CRM114-Status: GOOD (  19.92  )
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

On Mon, Sep 15, 2025 at 11:08:13AM -0500, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256_finup_2x-v2
> 
> This series adds support for 2-way interleaved SHA-256 hashing to
> lib/crypto/, implements it for arm64 and x86_64, and makes fsverity use
> it.  This significantly improves fsverity performance on many CPUs.
> 
> Later patches will make dm-verity use this optimization as well.
> 
> Changed in v2:
> - Made the new arm64 assembly compatible with CONFIG_CPU_BIG_ENDIAN=y.
> - Omitted sha256_finup_2x() from pre-boot environments.
> - Made alloc_guarded_buf() assert that the allocation succeeded.
> - Minor tweaks to comments and whitespace.
> 
> Eric Biggers (6):
>   lib/crypto: sha256: Add support for 2-way interleaved hashing
>   lib/crypto: arm64/sha256: Add support for 2-way interleaved hashing
>   lib/crypto: x86/sha256: Add support for 2-way interleaved hashing
>   lib/crypto: tests: Add tests and benchmark for sha256_finup_2x()
>   fsverity: Remove inode parameter from fsverity_hash_block()
>   fsverity: Use 2-way interleaved SHA-256 hashing when supported
> 
>  fs/verity/enable.c              |  12 +-
>  fs/verity/fsverity_private.h    |   2 +-
>  fs/verity/hash_algs.c           |   3 +-
>  fs/verity/verify.c              | 175 ++++++++++++---
>  include/crypto/sha2.h           |  28 +++
>  lib/crypto/arm64/sha256-ce.S    | 284 +++++++++++++++++++++++-
>  lib/crypto/arm64/sha256.h       |  37 ++++
>  lib/crypto/sha256.c             |  71 +++++-
>  lib/crypto/tests/sha256_kunit.c | 184 ++++++++++++++++
>  lib/crypto/x86/sha256-ni-asm.S  | 368 ++++++++++++++++++++++++++++++++
>  lib/crypto/x86/sha256.h         |  39 ++++
>  11 files changed, 1147 insertions(+), 56 deletions(-)

FYI, applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next

I decided to use the fsverity tree instead of the libcrypto one.  There
are no dependencies on other libcrypto changes for 6.18, and this makes
it easier to do a separate pull request.

Also, as always, reviews and acks would be appreciated!  Note that I
dropped the reviews and acks that were on the original crypto_shash
version from earlier this year, due to changes in the patches.  The
high-level idea is still the same, though.  If people could
re-review/ack this latest version, that would be great.  Thanks,

- Eric

