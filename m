Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F9CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFK98zJBVlExZPZ7BYPDcuAkfMaYtqhrE5uX7SuoqxU=; b=3PQl1qUS4W+TyoXEwOV2/Q8iHx
	vGFIJbzwJ7qJYoN+YfNDZHKoX2uMAmuMn4vIh9lm1pAoDPQyEwquUMH/KbDGGWWMyAyRskbs9Y+lx
	OWnhhT1E5Jvg1gLFDL6JfXSDYqNdBErKHIzGxv70kW0ckOYmkf10bwVu2jkiVQs2OGEAZZlGTKloI
	xKjO/uAsr2Sb2ZGlh/99fkutmhB3z7e0R2QLdA7MduzMkQpKsdFcVXodYIH7e6uVffSxNbw1TZyQc
	MNCbiTu5vefApJLRj0A+Quy8jAlSDPCRexJYFGbrtmf23/mcxVyD8eBrvS4nlhUEnp1xqPpitmKxo
	YtZSq3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4xu-0000000BQ0v-3S5q;
	Mon, 01 Jun 2026 15:54:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4xs-0000000BQ0E-0LWa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:54:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ECCD40B4B;
	Mon,  1 Jun 2026 15:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9EB1F00898;
	Mon,  1 Jun 2026 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780329245;
	bh=eFK98zJBVlExZPZ7BYPDcuAkfMaYtqhrE5uX7SuoqxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2Z6eq++QWvIC1YxNs1Ew6Po6agmLyUDGb0pdVyijseE+LFJWf4Jcm43ScTjaNq/M
	 NSVeA9ZrKi4Xo7Hvb64/jo0zR6k9r9XkStJzqGe1oWzmLcaUbIAyDdQDzLChJScbI8
	 0qqIf7ZD6VcXIhAu3hhIj18lmdUPnFfgmdQNnLafgloWR/ZvBjl/4Twuy3l56d/ksV
	 KOQ60LzUlo/sW9HGYxF5wT/K5zuPA8/Xj8V9+ehZigk+w/DvShiqRCjSkXuM0QBFiY
	 CuZmWRRkEtTisN25GtmADlxBeH1KMy6KoxO3sTSzim7h05Nh0X4QdcZUN4MJHVARo2
	 7e5YA/4o7gA8Q==
Date: Mon, 1 Jun 2026 15:54:03 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Tianchu Chen <tianchu.chen@linux.dev>
Cc: clabbe.montjoie@gmail.com, herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, samuel@sholland.org,
	stable@vger.kernel.org, wens@kernel.org
Subject: Re: [PATCH] crypto: sun4i-ss - Remove insecure and unused rng_alg
Message-ID: <20260601155403.GB17375@google.com>
References: <d52449abfd8e1e46c8bfe9ebdc00d931fc0e4147@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d52449abfd8e1e46c8bfe9ebdc00d931fc0e4147@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_085408_143746_1D681641 
X-CRM114-Status: GOOD (  19.72  )
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

On Mon, Jun 01, 2026 at 09:19:23AM +0000, Tianchu Chen wrote:
> From: Tianchu Chen <flynnnchen@tencent.com>
> In-Reply-To: <20260529193648.18172-1-ebiggers@kernel.org>
> References: <20260529193648.18172-1-ebiggers@kernel.org>
> 
> On Fri, May 29, 2026 at 12:36:48PM -0700, Eric Biggers wrote:
> > Remove sun4i_ss_rng, as it is insecure and unused:
> >
> > - It has multiple vulnerabilities.  sun4i_ss_prng_seed() is missing
> >   locking and has a buffer overflow.
> 
> Thanks for cleaning this up.
> 
> For the record, the sun4i_ss_prng_seed() buffer overflow you mention here
> is the same issue we reported earlier with a targeted fix:
>   https://lore.kernel.org/linux-crypto/20260529194152.GA3628@quark/
> 
> It is an unauthenticated, unbounded memcpy() into the 24-byte ss->seed[]
> buffer, reachable from any user via AF_ALG ALG_SET_KEY with no privileges
> on affected Allwinner sun4i hardware.
> 
> Please note that this should be treated as a security fix. For the earlier
> stable releases, keeping the rng_alg but adding a proper bounds check in
> sun4i_ss_prng_seed() might still be a preferable option to consider.
> 
> Given the above, would you mind adding the following trailers to the commit
> message?  Besides crediting the discovery and report, they would also make
> this security issue easier to track and reference across the stable trees:
> 
>   Discovered by Atuin - Automated Vulnerability Discovery Engine
>   Reported-by: Tianchu Chen <flynnnchen@tencent.com>

Yes I'll add those, sorry for forgetting them.

I do think we should proceed with removal, seeing as this driver is
unused, and I found three additional vulnerabilities in it.  So four
security fixes would be needed.  But then we'd be removing the driver
anyway due to it being pointless, so it would just be busy work.

- Eric

