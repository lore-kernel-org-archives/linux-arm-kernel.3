Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98C9FD707B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oKhrIKU5D9SE+zPyA7350bfhPzLRQGgkbH3G8Eg+Gs=; b=ko5Mb3TYPJGiuBZdKlxhVpid8+
	nb+c9+JJzadeKCqI63l78AosDbduKi+HVfwPOoN1vQVmcKTcUj6QVaQ/7ck+TeIhwE7nYn1e+/joU
	IKZkMjXsr/I1aBUQZU+NYBGx1Jf6UAjnKqcT/e9L2vp3eitY5ZvQtn4YX37HhpeubnMQYY2t1mX/d
	23v3IrogSJPRVGTSqK26ZreCNAid6EHbCchlbzACK+MVE6ZuZf0dUGPdIEUTs7GZfDccbWU2kI+wC
	+D3fIWEvlXeAHcw33h/HleUjgXog3BXMgYqEUPOfDb2P/Un5bat7YTDwW83RRn6br7rXrxckXJO9u
	xQ1Tm0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SJD-000000065oP-3LjJ;
	Tue, 17 Mar 2026 11:09:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SJB-000000065nd-1vQ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 976CC401CD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BDEC4AF0B;
	Tue, 17 Mar 2026 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773745796;
	bh=+qqQskHxd2Ir6u497JK/n+4v7VBPyV/EnedgQr4zm+E=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LlJIRRMJV1UFBEU/vQMAGx3oLvs4PKSYKjkDg4tU0LkZ2crHsRgHSbDhr0arQ8BcJ
	 aYWP/jciA1J4sb3oo+iPF3CL9te+3PdfRUy4T9ONNGYOCV9HCc5IX/ULFJ/+sXZcTU
	 rLdWXSaf8t+X6fGC5MHlT+ENBqA2h//LBJTHS7vQkr2dRqtu1lGt+vf5AebxC9ACpZ
	 51ypH2y9n3ERm2dEHnFKRKddX1xavUBtHDKJEnSuiEVJsMi+g7A2ANGwOLKkhqGXVF
	 lyKvG67i3BUNSSS3BQUG0jjkLqpKKlgIIH0IPWhfclwZZLsVhKQFCRkvyJItvchJtw
	 2JWk6ct88npqA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 286B0F40069;
	Tue, 17 Mar 2026 07:09:55 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 17 Mar 2026 07:09:55 -0400
X-ME-Sender: <xms:gza5aV2EpSanM8JhpWDtLOG5pRs4CI9Zf-qqt7o-DAd6G5vHUb45iw>
    <xme:gza5aW69r7A6EkJJObzdg6BH3dhIPD0uXZxls44Vj-HGdeWUv7o2YTo3Lr57XNF5U
    PE9UIR18SP6tI1q4y76XKva0mJCZaq4UNHRq6UC5D8qBoDnS9qX3Ls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghp
    rghnrgdrohhrghdrrghupdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheplhhinhhugidqtghrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepjhgrshhonhesiiigvdgtgedrtghomh
X-ME-Proxy: <xmx:gza5aaHkGUjhaAr50GrqV7zKSgEarJjRVBqoBXOQVwTER4_4nDppvw>
    <xmx:gza5aby0fGrrwaCVv5Vw4ivctunLeHPXMqvUIPGsdKw54Rrr1zGryQ>
    <xmx:gza5aU3Y0M-sND_S5zRXbN_SIV6ftWjjfUTm4fxoKpRJRTzUZJCPrA>
    <xmx:gza5abotCcNiyMzP2eYK7USlG4mBBC19-zSV5nY0WOe29T9O59kdDg>
    <xmx:gza5aRXNGzFyIzd6RFZ045AUczCoD91Fd5eUZu7hG28GhpXgrEYMFuKW>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 014BA700065; Tue, 17 Mar 2026 07:09:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0MGIhlQvLYV
Date: Tue, 17 Mar 2026 12:09:34 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Message-Id: <38a37b02-602a-42a4-8974-b8a6cd750c3e@app.fastmail.com>
In-Reply-To: <20260314175049.26931-1-ebiggers@kernel.org>
References: <20260314175049.26931-1-ebiggers@kernel.org>
Subject: Re: [PATCH] lib/crypto: arm64: Drop checks for CONFIG_KERNEL_MODE_NEON
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_040957_544033_9A8B7907 
X-CRM114-Status: GOOD (  14.88  )
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



On Sat, 14 Mar 2026, at 18:50, Eric Biggers wrote:
> CONFIG_KERNEL_MODE_NEON is always enabled on arm64, and it always has
> been since its introduction in 2013.  Given that and the fact that the
> usefulness of kernel-mode NEON has only been increasing over time,
> checking for this option in arm64-specific code is unnecessary.  Remove
> these checks from lib/crypto/ to simplify the code and prevent any
> future bugs where e.g. code gets disabled due to a typo in this logic.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> This patch is targeting libcrypto-next
> (https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next)
>
>  lib/crypto/Kconfig        | 12 ++++++------
>  lib/crypto/Makefile       | 17 ++++++-----------
>  lib/crypto/arm64/aes.h    | 16 ++++------------
>  lib/crypto/arm64/sha256.h |  8 ++------
>  lib/crypto/arm64/sha512.h |  5 +----
>  5 files changed, 19 insertions(+), 39 deletions(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

Actually, we should just get rid of CONFIG_KERNEL_MODE_NEON entirely on arm64, although there is some code shared with ARM that would still need some checks. But anything that is arm64-only should never look at this at all.


