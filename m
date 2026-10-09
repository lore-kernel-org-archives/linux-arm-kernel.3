Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C74FCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvI9tDv2VrX3PC6OABPcy9GmQItWOuVjtiop8uMTxkI=; b=jbqpVxcjBFyZd0uIqWeTDgdWxI
	RQ/4BUL5MbW/yM1UUOzPZv6xjyD2xsvA3rpSn/tKG6PyvcIrO3MjI0qwo6bUbzK8DI/A4UZtuRamm
	h60lBxWPMDk0t7mo+11B+aDRFhHGhv15MWpFlPw6KdAGyuK3Nqv4M8bF8fS9NkeHcF6J+hR2COCBt
	TllVHuwzxOB46TWIGtGoe1LzVw7YzNflE87NInZvgmp9tQZf5fayB36XVeuRQOfdqgib0aR2Zq85+
	WfIhiQ6eCXh+BTahEpKVwzRnPDwSHPRaeVpjfH1qPMbwt+H65PN7Dt7Kwr5pDocxh1L2hX5uTQbmE
	4EmcIXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFELl-00000006nVk-25mc;
	Fri, 09 Oct 2026 17:25:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFELk-00000006nVN-32lK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 17:25:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B96E7409FE;
	Fri,  9 Oct 2026 17:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643341F000FF;
	Fri,  9 Oct 2026 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791566738;
	bh=qvI9tDv2VrX3PC6OABPcy9GmQItWOuVjtiop8uMTxkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=heladDnchcAwRKKZ1qYtfePX4wk5hID8xBy1iFdA27yyQ2C55ddTGNt3ulBh9HlGs
	 V8zWbV/AQP4mgRQluZsDzTibUHmH1zFXrxmu6ZqHLxRuspImRIy9xfEXCZ4UnXnvZe
	 4gQPhjDWx0+c6E1Vf03NobWU3ULh7ic7ckDhiuk2rXztgz2w72XSoLMNYQ/UBDMOGx
	 JZnTaKgLHzalTjCzc+7fJXO5Jj4MBG06T0/N46F0l6HhdK9RfsTfkeS3Ax7wojsxh+
	 biFztogUMDeR5VycplX2rFJwQ3Til8P/pDzZZzLHDf7jn8qXMklzJfYFUmYOuE/zeB
	 JIZ3A5768t2FQ==
Date: Fri, 9 Oct 2026 19:25:34 +0200
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] lib/crypto: arm64: Fix Poly1305 NEON resume carry
 loss
Message-ID: <20261009172534.GB73965@quark>
References: <20261009125354.315476-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009125354.315476-1-ebiggers@kernel.org>
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

On Fri, Oct 09, 2026 at 02:53:52PM +0200, Eric Biggers wrote:
> This series fixes a lost carry bit in the arm64 Poly1305 implementation,
> then adds a regression test for it.
> 
> Compared to v2 sent by Jérémy Jean, I cleaned up the verbose
> LLM-generated text in the commit message of the fix commit, and I
> replaced the LLM-generated minimal test case with a more comprehensive
> one similar to the existing test cases in the file.
> 
> Note: the second commit has references to the commit ID of the first,
> which I'll fix up when applying.
> 
> Eric Biggers (1):
>   lib/crypto: tests: Add Poly1305 split-update carry regression test
> 
> Jérémy Jean (1):
>   lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state
> 
>  lib/crypto/arm64/poly1305-armv8.pl |  2 +-
>  lib/crypto/tests/poly1305_kunit.c  | 97 +++++++++++++++++++++++++++---
>  2 files changed, 89 insertions(+), 10 deletions(-)
> 
> 
> base-commit: 572af6872e520c7102e58362ef7cd7c2ed4342be

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

- Eric

