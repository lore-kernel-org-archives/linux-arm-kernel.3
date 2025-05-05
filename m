Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0849DC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F4wsw1NZfHzd76CCShnKalzM/B3bViD+s8nNqyL9k0=; b=fzpf+XdqGdWtBIvF7thrr0fQP1
	/2YGGtucgaDCmWxnPqSDXpI5B7sZbBcGu1P6rIuhPdzbgGhEZEG24O6SC3KJ5weWsuQvFsz69Fpa9
	WNVC2y6NSgijcNF0ZmraEA5CjVhBrZa+4nPQLlBiUFris4RYWcamPwn485JcTcbT5lYHUX07asezD
	dD75hhY926BsvkFnz2vqAO7FRUnlu8y5vadvNJFgzGEUvKlWtnnjw47+XOXIXpFmAjp+xrvI4iMqp
	HpUVbB62F1NoJcQMDFOu8zfMVYppH2aRhdLBXLTBkmnXfmTXAIOPml34jf1nGw9wnASL0pPza0hAY
	5bFR4zxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv36-00000007Kmm-3HT5;
	Mon, 05 May 2025 12:35:56 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuvh-00000007JSl-1O87
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2F4wsw1NZfHzd76CCShnKalzM/B3bViD+s8nNqyL9k0=; b=MOVlBDjmqKH4z8SI35gB1h9NBo
	MEq1Ih6dcpid5VW+fASCsOExnu1vbOL93VQK6Ga418/U/2MgxIT7wkGPqMk/uLygfH+OLvr0/TSo5
	+wz8FIHovJov39bReQhU6DPnTLOhP7hOC3gmYSxuYmJBpXBg/0CExEJ+8pnagkr7+1F9iEXrbuKpI
	/mSXnaRO9IS6lA4NzINeHE+bpf32OAMIOcyjzdqcrab1IWbOkzOzBMCY0hAFdwniK/vJbYSl55+va
	CeS4FoMtNKqTzmBUH8jrNw2nQ/k6hO9ec+wjqJUu0664F6gEEXg6pUzveV/se1n2jN2neYZnSRBhd
	evAioJIg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uBuvW-003YIA-0M;
	Mon, 05 May 2025 20:28:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 05 May 2025 20:28:06 +0800
Date: Mon, 5 May 2025 20:28:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: sun8i-ce: undo runtime PM changes during
 driver removal
Message-ID: <aBiu1idwaftlynji@gondor.apana.org.au>
References: <20250501190651.3863582-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501190651.3863582-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_052817_366857_8A2C73CD 
X-CRM114-Status: GOOD (  12.37  )
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

On Thu, May 01, 2025 at 10:06:50PM +0300, Ovidiu Panait wrote:
> The pm_runtime_use_autosuspend() call must be undone with
> pm_runtime_dont_use_autosuspend() at driver exit, but this is not
> currently handled in the driver.
> 
> To fix this issue and at the same time simplify error handling, switch
> to devm_pm_runtime_enable(). It will call both pm_runtime_disable() and
> pm_runtime_dont_use_autosuspend() during driver removal.
> 
> Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

