Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D043D6E2DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwZpAxGSiQnH1T2tKO69p5u6r+dWAZ4qYmIHjIKAci4=; b=24uZocBetyAUU7PDW8QF+60IId
	FwvZaqXVZTuNEOe1Aha8DhnxwAqN4rUy3y2ewanqjmpxeP/j1aOtJ8gDEPXaIfsK7k+YwUL1LTQ4A
	Xnt+BKJzmIldBw/dy3DAPe2zhlmFg8dWbIKUHn/sabm9zBMkFLV9zPAyHIfKze9Ku9jdYzHEb8B/u
	dmpFdxwBIXeD2tg6TVe4j/1Bw2ZvTpJP4RX3sMU4xfywY6tvMC2sZGUJROhTe2xww4/mHV5pVziC9
	Cl80VsziUhSfIKift5wu50rJ9gVfLIaiGLQFd0NYahDw0BbjH42+bRM7x3X6Pe85QBcWjYS6GmCRM
	blX5wfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJdD-000000095Mb-0T7S;
	Thu, 18 Dec 2025 19:25:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJdA-000000095ME-2WfZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:25:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2635540310;
	Thu, 18 Dec 2025 19:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6899C4CEFB;
	Thu, 18 Dec 2025 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766085943;
	bh=EeA/uIIER8xGnPTtMGmDdUUAJB0XNIpA9vTz9cWG0lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDESX0/70smiWQZJNo5er4Hcg6E8Ub7P7/eE2AXCSnG7mkqP17s6MbNJS6xdbHZIP
	 GR9THrLrzXopP0pjC1K6RrzDAjziJia9C4O2cs5s9hMsq33vqy9FGRE3YW1TRMtqX2
	 vjvSF47likKoq1b98J/h4RlpIWW8YMrngqKhZBZ+amC9V5P2ZNnzR4U+m96zJ+LdEJ
	 BqH808XGTtSfUCANaiqHKSmAOjZV9kHaqc5pMJmOV+spAtJtOQrUYjumXoJ7QAdUuN
	 KX/y6tdbWU37PcVuCGPBEcYADbmP19lUP345fkJeOGF4C02/7ckTrB6qXgnGzQkwk0
	 6QX9Q34opRatw==
Date: Thu, 18 Dec 2025 11:25:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH 00/12] NH library and Adiantum cleanup
Message-ID: <20251218192534.GD21380@sol>
References: <20251211011846.8179-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211011846.8179-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_112544_668021_9DB33D95 
X-CRM114-Status: GOOD (  15.11  )
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

On Wed, Dec 10, 2025 at 05:18:32PM -0800, Eric Biggers wrote:
> This series can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git nh-lib-v1
> 
> This series removes the nhpoly1305 crypto_shash algorithm, which existed
> only to fit Adiantum hashing into the traditional Linux crypto API
> paradigm.  It replaces it with an nh() library function, combined with
> code in the "adiantum" template that handles the Poly1305 step.
> 
> The result is simpler code.  As usual, I've also fixed the issue where
> the architecture-optimized code was disabled by default.
> 
> I've also included some additional cleanups for the Adiantum code.
> 
> I'm planning to take this via libcrypto-next.
> 
> Eric Biggers (12):
>   lib/crypto: nh: Add NH library
>   lib/crypto: tests: Add KUnit tests for NH
>   lib/crypto: arm/nh: Migrate optimized code into library
>   lib/crypto: arm64/nh: Migrate optimized code into library
>   lib/crypto: x86/nh: Migrate optimized code into library
>   crypto: adiantum - Convert to use NH library
>   crypto: adiantum - Use scatter_walk API instead of sg_miter
>   crypto: adiantum - Use memcpy_{to,from}_sglist()
>   crypto: adiantum - Drop support for asynchronous xchacha ciphers
>   crypto: nhpoly1305 - Remove crypto_shash support
>   crypto: testmgr - Remove nhpoly1305 tests
>   fscrypt: Drop obsolete recommendation to enable optimized NHPoly1305

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

More reviews and acks would be appreciated!

- Eric

