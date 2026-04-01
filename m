Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44E910F9310
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxE/uTHNggKqsVDRxd2Yl/Y20+mquer1aD/Tya2nh5Q=; b=HPIz/a6zbVub+jWIeseWDcAUr4
	T3kwUlT0UqSOggiE3yjYg9c/zvEgUxkkno4CdJE8rd67fVOu9cab2SbaF+6Gmyi8GBBFGUAxiwxbK
	OTWd2aJPjYROUnN6XWJDmof43wGRdR4aUscRrlSvbNSI4vDmXnDMuT9vn/8FWw9rS2yNGh+XO1iAX
	FnQ+YMIb0u5Ff6nKKMq9f3kANvddENlckWQIB2DMadzPnHjBUNESsSirZIGcmp1ehsNheivbOWQYr
	YX2XvmU2IscKpe03l712U3kY2AG/yyH72wUopDU0uIUkFz5viBR7v6yD2rgNEfBWRHwX5Gfopl4ds
	8m6/2eDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j9D-0000000Dj51-1xXo;
	Wed, 01 Apr 2026 00:09:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j9B-0000000Dj4V-2XOM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:09:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10530600AD;
	Wed,  1 Apr 2026 00:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BF9C19423;
	Wed,  1 Apr 2026 00:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002164;
	bh=GCE2Iy2Cf2s4vV7nVwqM/zJG/HopInTkOxOf/7UB944=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ApIPjtg5DEEu0NfbtsYKAtrvs0IK0oJ3NFlUTbX1V6fVpkKEZ3ikqxMG1pfuFh8Yu
	 MJ2e8KpRMARuZbuAd7AkP4GRvefP4uHxuC0MtETVGNg8nGEHIYQukFcF+G0SIbjAHI
	 RwR7VyqHlwHKybMNolxt0iXzaVhlgAQFcdIPyYX3lHFZ+OCcAudq12ykLG05KNi9ln
	 zg7TbhhSeBe+ujv3tCYyv2sMdgdWsXobA/xnyr8D6mOyH0qUQ4hp9eqKqxXgZtMkhD
	 ZIzZat+80ZK44ZOgjZoMDFPhdBlZHe2gaxRBN3t8AVwg6J1IEgs8vn7kYrAtiHvvpc
	 titUmUquNDnTQ==
Date: Tue, 31 Mar 2026 17:09:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH 1/5] lib/crc: arm64: Drop unnecessary chunking logic from
 crc64
Message-ID: <20260401000922.GC45047@quark>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260330144630.33026-8-ardb@kernel.org>
 <20260331223300.GA45047@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331223300.GA45047@quark>
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

On Tue, Mar 31, 2026 at 03:33:00PM -0700, Eric Biggers wrote:
> On Mon, Mar 30, 2026 at 04:46:32PM +0200, Ard Biesheuvel wrote:
> > On arm64, kernel mode NEON executes with preemption enabled, so there is
> > no need to chunk the input by hand.
> > 
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> 
> There's still similar "chunking" in other arm64 code:
> 
>     $ git grep -E 'SZ_4K|cond_yield' lib/crypto/arm64
>     lib/crypto/arm64/chacha.h:              unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
>     lib/crypto/arm64/poly1305.h:                    unsigned int todo = min_t(unsigned int, len, SZ_4K);
>     lib/crypto/arm64/sha1-ce-core.S:        cond_yield      1f, x5, x6
>     lib/crypto/arm64/sha256-ce.S:   cond_yield      1f, x5, x6
>     lib/crypto/arm64/sha3-ce-core.S:        cond_yield 4f, x8, x9
>     lib/crypto/arm64/sha512-ce-core.S:      cond_yield      3f, x4, x5
> 
> I thought it was still sticking around, despite kernel-mode NEON now
> being preemptible on arm64, because of CONFIG_PREEMPT_VOLUNTARY.
> 
> However, I see that support for CONFIG_PREEMPT_VOLUNTARY was recently
> removed on arm64.  So that's what finally makes this no longer needed,
> and we can now clean up these other cases too, right?
> 
> (Though, I can't find where the voluntary preemption points actually
> were.  So maybe they weren't actually there anyway.)

https://lore.kernel.org/linux-crypto/20260401000548.133151-1-ebiggers@kernel.org/
cleans up all the similar code in lib/crypto/arm64/.

- Eric

