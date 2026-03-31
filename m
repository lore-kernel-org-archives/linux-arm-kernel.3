Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A3D10F9302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 22:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C+/wWU1UaeRij4GshH92j601u74eU2k9j4h7bdT23g=; b=vxXv7UnMfWLHXpy7FoqYCm2ccH
	onRCLRr868YkoYZknh+NTtQsGNAzspjb+vYsxEN6rE/6AuyOQA9VT9FKTw8stbRqRimSStYw2bxwH
	jBWcCZg7viCNpwz0zZRqorrVVWRt5s5Wig1rvI2rr0tMDDu4jt6rgojynBVexHg1wCWD0XdQ8lGkB
	o4kdREU4NsQ3VT1c7P/rrxzKZyW/3bvzjZfu9IGC9FcdBgpOl1oFKu3ypPZ1+FqZF74SWMRPhEXQT
	uL+FD+H509U9HWPmjdu2VjlYo7vYBQL1CT14yZ0+g7m9OdgWOXKyV4OFJjo5HmHi3Vmkrlyo8t7kR
	dJZNL4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7hdx-0000000DdaD-1ftg;
	Tue, 31 Mar 2026 22:33:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7hdv-0000000Dda1-26ph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 22:33:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F312600CB;
	Tue, 31 Mar 2026 22:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2879BC2BC9E;
	Tue, 31 Mar 2026 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774996382;
	bh=RJQkS8bUU8ttoMMCwjfNIsTwajwii9xgzqJ9jw17VAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbHRqBeSoYgfTE3DFt478XB2sAGrHwnP3pluE0g7KfKYO5IyjPKzQKNda8WfNYPdP
	 T74vQZvwx/hci0GdiDSYVGQymjvfK7uYKFnMwhgoXGdG6Spc6TRT1wTRuk/iGUsjvp
	 6EV+s9GR0S4JBMhefTroJ3sQtMZWBRlTurBSwI9WMsnYvcPoUuFlsBkye/a2184IYF
	 p/hB8wfG7lNzS/bZ2nSURnlrRK7Z/5M7nX6xBoZ37fuenrMGxRqLJG0MbKNGQcLWlW
	 fmoXHS1x03HVb7OYB49waYYKROPVWmDvPovBlXEV86XsxnN8kK54+C9GMaj1vHLJeU
	 ka5cwaAPBkakw==
Date: Tue, 31 Mar 2026 15:33:00 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH 1/5] lib/crc: arm64: Drop unnecessary chunking logic from
 crc64
Message-ID: <20260331223300.GA45047@quark>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260330144630.33026-8-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330144630.33026-8-ardb@kernel.org>
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

On Mon, Mar 30, 2026 at 04:46:32PM +0200, Ard Biesheuvel wrote:
> On arm64, kernel mode NEON executes with preemption enabled, so there is
> no need to chunk the input by hand.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

There's still similar "chunking" in other arm64 code:

    $ git grep -E 'SZ_4K|cond_yield' lib/crypto/arm64
    lib/crypto/arm64/chacha.h:              unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
    lib/crypto/arm64/poly1305.h:                    unsigned int todo = min_t(unsigned int, len, SZ_4K);
    lib/crypto/arm64/sha1-ce-core.S:        cond_yield      1f, x5, x6
    lib/crypto/arm64/sha256-ce.S:   cond_yield      1f, x5, x6
    lib/crypto/arm64/sha3-ce-core.S:        cond_yield 4f, x8, x9
    lib/crypto/arm64/sha512-ce-core.S:      cond_yield      3f, x4, x5

I thought it was still sticking around, despite kernel-mode NEON now
being preemptible on arm64, because of CONFIG_PREEMPT_VOLUNTARY.

However, I see that support for CONFIG_PREEMPT_VOLUNTARY was recently
removed on arm64.  So that's what finally makes this no longer needed,
and we can now clean up these other cases too, right?

(Though, I can't find where the voluntary preemption points actually
were.  So maybe they weren't actually there anyway.)

- Eric

