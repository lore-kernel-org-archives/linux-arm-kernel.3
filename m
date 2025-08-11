Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113C7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 19:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvUh5KjbPYqTTPY5zOWGYqXAkITl46hLm6LHWho0akU=; b=Eg0PwQ04kCb4qxKDT8Oe9f1Z8l
	6fxaSV7B3UUjaqBS4JkptGNg78aK4jFwv9iRKJpFPtb7/HRwaA9dOjf+Zjaukz3lYoyDaxLJ++T0n
	/nzHr8naaiw6p00hB3bF2DwF67oxjGlAi9s5O/uIEhBx9wvQdYX3QjpD1dDnyPhLdAC1R1i+wryTe
	myxr0dUS2mWdFlUbALywqY/xHvj1K9nfNm3z6GNi1SB0tcc9d1reYxoq+7msXFQRUfa/qBLnZS8NI
	7gecwwRozZVbNC4sCwH/EMyQSdJcMr4UUbiD3oerkm6bd4xieMf345PDjo2PlNpMnXuo8fK/mChH2
	xJaXYeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYLk-00000008wSg-3gRA;
	Mon, 11 Aug 2025 19:38:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWo3-00000008cJo-1T8b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 17:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AADBD439A2;
	Mon, 11 Aug 2025 17:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE44C4CEED;
	Mon, 11 Aug 2025 17:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754935173;
	bh=O36XC/9T/0nUNSaZaQSg5co3SZptxIWDslq4s9Yy6Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpgsL80zfAWC9Q7wUtwGVXWf09/smmj5mEe8GWsf5YTbUjAqb1H2Wt4HFoZfAv5NO
	 BDRJ3wO6hMDWThearbyS+BG8a7kFVP78/2v3qzXdmwZSIYBbMIYm8Dhx5KfivtSGMg
	 ofWLMknobkQhjHnkbQDNGbT2DDchlQrlk+pkX/i76pGVRdWzEGl2VXYg4eaXwNApne
	 hTMZu21BjoE+QTwUrlt2fA58YHLa8iO3NyjHoxZ5r6NWfPNMGK/VPJNICKSbJ5d4YT
	 NCHufIgUaAApdjN+052AiTTqpMtKOJjT1CfRsiYTxunavNqRjE728WYAoBJ+WhDKE2
	 kDx6D3kbHABiA==
Date: Mon, 11 Aug 2025 10:58:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH] lib/crypto: sha512: Use underlying functions instead of
 crypto_simd_usable()
Message-ID: <20250811175832.GE1268@sol>
References: <20250731223651.136939-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731223651.136939-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_105935_407468_A7DD7785 
X-CRM114-Status: GOOD (  11.04  )
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

On Thu, Jul 31, 2025 at 03:36:51PM -0700, Eric Biggers wrote:
> Since sha512_kunit tests the fallback code paths without using
> crypto_simd_disabled_for_test, make the SHA-512 code just use the
> underlying may_use_simd() and irq_fpu_usable() functions directly
> instead of crypto_simd_usable().  This eliminates an unnecessary layer.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  lib/crypto/arm/sha512.h   | 5 ++---
>  lib/crypto/arm64/sha512.h | 5 ++---
>  lib/crypto/riscv/sha512.h | 4 +---
>  lib/crypto/x86/sha512.h   | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

