Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F3F9936C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXwNgY+WRRCQRx1M0mqaUAIHObx/PwdHncNqoa+Z/Qo=; b=dOYcYJ3QY08OIQ7XiR1Uu5nauW
	eK/AKM9VEiwV7fm1MLmE2c4W+AP7YzH+dnS9LysTZnHipFdLEIipOTuuOM6WCRkUMobCKNjdYn/uO
	LwQ/gVQ1jlHvMFEf2c1krbAtYAnyZoB1pnoHzIts8ToKE8CgSOh3G30A8cMPwk8+meC//rJJpxaKq
	vKPMxYWzaTPB+tItKep1U3ECOmHRFJ2fsOfsz5aJOxnruJuDIdBdRgS5DWJiOV96Wgwu9f0KZELUU
	P9AVYNYPOy1+u/PKkkPXheXSnh+3zO1Xn1agvq5I1jlzzNnFZ9G2BMderJfwQNXvsvXbC4mYWlpVo
	YDeTiqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrw0-0000000BWBc-0FpW;
	Thu, 23 Apr 2026 11:09:28 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrvt-0000000BWB7-2cRe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 11:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=xXwNgY+WRRCQRx1M0mqaUAIHObx/PwdHncNqoa+Z/Qo=; 
	b=YQXiwRPAdBDMK97uQ4DtCe8+qwsZ4W7mhOMNOYWqVs6kTyacEmaGoiWPhDiy2tB7Ho1RwIVPKIE
	w5m3txl34RAHy43RGnHnGNAq8fxAGTfJXT3QR5HAsgHI7y3LMlVN9XoCDn/YhjtjqMtDXOgLhNVZU
	Aws2E5Xa4Un0IyZHYurKG2PgHfnEZYjrJNFyDGFmRDLfaH+ogbwmV1KuzULz+jhfVjMvmbomEqLye
	Icxim6TGB0UXEeu0cg/Ag6snsSAXHKkbhuqdkKBfugz35MVHqBIa6yo1xhiW+10tLxD/VHdMA8iXj
	s6r6jJnB1dp70WOtt1TzsHMp1Alm7JtLstgQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wFrve-008DiK-2T;
	Thu, 23 Apr 2026 19:09:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 23 Apr 2026 19:09:06 +0800
Date: Thu, 23 Apr 2026 19:09:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss - avoid hash and rng references
Message-ID: <aen90oUsJwvamhzL@gondor.apana.org.au>
References: <20260423065600.2081989-1-arnd@kernel.org>
 <aenfmxOvtHaAODqH@gondor.apana.org.au>
 <1cd6ddc3-479c-4cbf-8315-78bc53ac3a54@app.fastmail.com>
 <aenmEQNhhw9bnxEa@gondor.apana.org.au>
 <3948e39f-dd20-44e2-b264-dc2a0a88f5b5@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3948e39f-dd20-44e2-b264-dc2a0a88f5b5@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_040921_687547_A397F947 
X-CRM114-Status: GOOD (  17.00  )
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

On Thu, Apr 23, 2026 at 12:26:23PM +0200, Arnd Bergmann wrote:
>
> Sure, but I'm not adding new code here, I only reported a regression
> from Eric's (otherwise very nice) cleanup and tried to come up
> with a better workaround than adding another 'select'.
> 
> I've tried to rework one driver to use IS_ENABLED() checks now
> instead of the #ifdef, and also replace the for()/switch()
> loop with three separate loops for simplicity. See below for
> what I ended up with compared with my first patch.
> 
> I'm still not entirely happy with that version either, especially
> since this is getting beyond a purely mechanical cleanup.
> If you think this is better, I can do it for all three drivers,
> otherwise I'd just send the oneline change to work around the
> third driver link failure the same way that Eric did for the
> other two, and let the sunxi maintainters worry about cleaning
> it up.

Sorry, I made my comment based on your original patch only which
simply added ifdefs.

Now that I see the wider context in the driver, I'm happy to take
your original patch as is.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

