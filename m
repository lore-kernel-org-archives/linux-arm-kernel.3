Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A49CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 22:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0loSirdJm0+UmbFWEnZy2DDOFCg9ZtH/cihZ/PGTtx4=; b=rs2PjtkKs/mfqpNJWSiFMweMeR
	Zxb92SwnFhhHMuvsOXX1K4fgViB9Z13XjH8inrMguSK9J4teNCfHzkwACtnp/jXqUXcUfUVaFg1j7
	4xuiFNl7LMZh5PaoHq/W/lNCIx0K1WuOLLG00JtnV48/5fFujzWZFmUlOCZmBQZlLEW9wAPHg7zPR
	c1QLJ4+Kt+bhA/sDHUM+pzWySlI7h7nbed5yVT8RQHOUVOcNLAahotcgUFDyFiuVygE/+70KAEuXD
	Go/KKNHEJMKhdSnDFtXXYdcnUy1OZ7th56k50o4UoHGUBrHcmNdoimBDIiYFJ1i8GehKzDjLU0iR9
	CFQOlnfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv1Ft-00000008ZsE-17IE;
	Sat, 06 Sep 2025 22:19:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0iA-00000008WT8-0EI4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE280416A0;
	Sat,  6 Sep 2025 21:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B986C4CEE7;
	Sat,  6 Sep 2025 21:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757195081;
	bh=gwfh68oMkRTSH1R3N9Af4GojEV1OW8M+fSIxaenodpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDvStL0MkcXoDiDngrcrLj3boAtY+1gBPvlYqJQ0Rn9NlZEIQs3ZZTSv6KOH8n/rU
	 PXYZd8KRklvq9m8m0v6RphoTy9CxCw4aBz1WAhnqzOvIIGiklHNxOqESf+AfuXvUQA
	 Rye3yextOdB7pwDioAIyTNWZoP8sIbJL2EY1G4Uzy6ayiopkGIm8typPw+k3aCCs2a
	 tyDNhKhPoZK3yoc8/fRg/usd8PtEPVCoMzocdBB4EL8PQroxJigerVE5QRwvNDW4rN
	 sqT57q5JDP0/ycdkeZb6ArspBA/lJJlDsiiMVEMkbFmwCJRH/Hgw52ApU3yI6jNLET
	 oAFi1XpStfsDg==
Date: Sat, 6 Sep 2025 14:44:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] ChaCha and BLAKE2s cleanups
Message-ID: <20250906214439.GA47837@quark>
References: <20250827151131.27733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827151131.27733-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_144442_117668_11D70CFF 
X-CRM114-Status: GOOD (  16.68  )
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

On Wed, Aug 27, 2025 at 08:11:19AM -0700, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-blake2s-v1
> 
> This series consolidates how the ChaCha and BLAKE2s code is organized.
> This is essentially the same change that I made to the other algorithms,
> so this should be fairly boring by now.
> 
> These algorithms were the last two users of
> lib/crypto/$(SRCARCH)/{Makefile,Kconfig}.  So this series removes all
> those files, finishing the transition to the centralized build process
> (at least for the algorithms supported by lib/crypto/ so far).
> 
> This series also makes the arch-optimized BLAKE2s code start being
> enabled by default, again following the pattern of the other algorithms.
> 
> Finally, it adds a KUnit test suite for BLAKE2s and deletes the older
> blake2s-selftest.
> 
> Eric Biggers (12):
>   arm: configs: Remove obsolete assignments to CRYPTO_CHACHA20_NEON
>   crypto: chacha - register only "-lib" drivers
>   lib/crypto: chacha: Remove unused function chacha_is_arch_optimized()
>   lib/crypto: chacha: Rename chacha.c to chacha-block-generic.c
>   lib/crypto: chacha: Rename libchacha.c to chacha.c
>   lib/crypto: chacha: Consolidate into single module
>   lib/crypto: x86/blake2s: Reduce size of BLAKE2S_SIGMA2
>   lib/crypto: blake2s: Remove obsolete self-test
>   lib/crypto: blake2s: Always enable arch-optimized BLAKE2s code
>   lib/crypto: blake2s: Move generic code into blake2s.c
>   lib/crypto: blake2s: Consolidate into single C translation unit
>   lib/crypto: tests: Add KUnit tests for BLAKE2s

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

