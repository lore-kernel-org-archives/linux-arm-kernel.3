Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72E8CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAd1cMDJvMsbFK5H2ysEU/B05IIx2LajPRiMJRAYoMk=; b=HYhcI4KXxHQiKsQGa/PZsuBnFR
	R/yxfMDVe4OMF4gVBygCZKEAQRR4sq6Rl78b0NPVdgGatDAvOg1AoCq4kP5W4GKtMlT9K1HzZpxrq
	CSjWfycRj0uqtTBwHeaGaqCxdpdR6xcO4tk2InIgy06g9tW4KPmVVJtnuSRZQwJqHzRj0bb0pV9c4
	aGB61N5CAjvJzFDbt5GqfCI+UJumjZtejlVYPbNc26e7pvnd9FjG8lsFm+Unx1SChhC8r9MgMWImz
	Ea/lppyVE7+PjkUp+ksE6gWNKue+zyKQfGM61cnTBN3jgbD5n58uPWbmwmq8sFp02EI6h6VSjcdE6
	O0zjhUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulabm-00000009BCd-0q8L;
	Mon, 11 Aug 2025 22:03:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWoD-00000008cMj-12WV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 17:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5EF46113A;
	Mon, 11 Aug 2025 17:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D66C4CEF5;
	Mon, 11 Aug 2025 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754935154;
	bh=uqajirfVkosPqsyAnl2TQotZWsCGCpVhDDWKXxPHx5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2GY8ySa60AHv9ZWT5uKZeq6nwk6WvzbPDxjHNX9XIk2dFrzkqD0ghNuXxQPboKqL
	 k2vcW7Jzr+1z3plDkBpynUIsL4rx2IK+RI0D8ih+wTjktbHJZcSFkrTYUp7LzZ4pJl
	 UYVPJ8lvbp5g8H/Nr19JLXUsAfBCWdQ6RT9cn9KTqk44YMj20uMdpA3Nkg/J2YRX6m
	 XelId7JrxDwDMwXKGQkl0t3kCYQVPz6XYEAw7J3mab909H0x5vMEhdZ907dzS2tJxX
	 rbMv0zLkymEVyDgw8WdJr7DkWfHVvWceNtILJInGIjZ7Xd5+aplbYHhLK3HJokXS+c
	 bBXDmQNs4bAJg==
Date: Mon, 11 Aug 2025 10:58:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH] lib/crypto: sha256: Use underlying functions instead of
 crypto_simd_usable()
Message-ID: <20250811175812.GD1268@sol>
References: <20250731223510.136650-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731223510.136650-1-ebiggers@kernel.org>
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

On Thu, Jul 31, 2025 at 03:35:10PM -0700, Eric Biggers wrote:
> Since sha256_kunit tests the fallback code paths without using
> crypto_simd_disabled_for_test, make the SHA-256 code just use the
> underlying may_use_simd() and irq_fpu_usable() functions directly
> instead of crypto_simd_usable().  This eliminates an unnecessary layer.
> 
> While doing this, also add likely() annotations, and fix a minor
> inconsistency where the static keys in the sha256.h files were in a
> different place than in the corresponding sha1.h and sha512.h files.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  lib/crypto/arm/sha256.h   | 10 +++++-----
>  lib/crypto/arm64/sha256.h | 10 +++++-----
>  lib/crypto/riscv/sha256.h |  8 ++++----
>  lib/crypto/x86/sha256.h   |  3 +--
>  4 files changed, 15 insertions(+), 16 deletions(-)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

