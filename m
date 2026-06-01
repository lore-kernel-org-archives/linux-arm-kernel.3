Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BADCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZaQZA/YkXwhmlYNR9C5TH/86ysytbwmJ3KoYCamO5U=; b=Eur2yS7PPVUHioi1EFm7muvD1/
	SHWhytG0k/nrdXIw85EEi/lpiwxpUAsJRb/Msoa4OrTlhfTDW3nAD88cD/jye6eYz/pib6ocuWQKV
	3MxYErTHmJpvXZZIWc94bSttU6W+k1thHtuMNDMOfEdZX7+OtX7/PDk8VE3/viOshR+laqt0A3Vz5
	2doPte//5asSaymLn8dziTCYw/p6KtGDCZ/SPJEgYomXUfVlZjGqmgr1Zsd5F6LQ7QFyB7oF66W9q
	nxLaMyo6RiypUaW30FFbOeEAWMVNUzj80VUfnYrOyyA1NvTP54HMl1++y0UbrZJmU9eqXqp/+isXe
	x6rVSaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4rh-0000000BPNX-2L7w;
	Mon, 01 Jun 2026 15:47:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4rg-0000000BPNM-0Mmv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:47:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28B34601E3;
	Mon,  1 Jun 2026 15:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701171F00893;
	Mon,  1 Jun 2026 15:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780328862;
	bh=UZaQZA/YkXwhmlYNR9C5TH/86ysytbwmJ3KoYCamO5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=REhd2V2yu6dndNqAWxs9F06Fld5Yu5uNtFEFSpX6COUw+oYOYdG8ik7nUDUY4IO2Y
	 RNp2O50il4BV9lVKLGtfPtcmdE4fBtlZ+Jk8BS0WzK3zdi3jILLlcTZLq8dxwBQ1rE
	 3hU0Szkaif/riuT80PGpsRvLOSd+fyZdWBkTph6oWds7FDm23FmJgYEXwZiMj3rVNf
	 WGay+zjVXH32/oXVoJ9vTEoavrNnto6ikOr9PGUjzSBqZb+sd7nJTkhITCJWOdWxVM
	 64o/jDDeuMo2rl1llgTpesKungho/t3Qgi8ASgTOPLoVuu9BXSRHKi3QFx79gGq9dZ
	 auKQasjFMiZmg==
Date: Mon, 1 Jun 2026 15:47:40 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Tianchu Chen <tianchu.chen@linux.dev>, herbert@gondor.apana.org.au,
	davem@davemloft.net, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: sun4i-ss - clamp PRNG seed length to prevent
 heap overflow
Message-ID: <20260601154740.GA17375@google.com>
References: <af749a8447bd7f0e9dd26ca6c87e9c6afecb09d9@linux.dev>
 <4d4407c05835a50413fa1e974e3aa3f4abfe2d5b@linux.dev>
 <20260529161057.GA2706@sol>
 <ahnIbpBLyn5z_siT@Red>
 <20260529173341.GA566433@google.com>
 <ah2d0RyZcVp614_k@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ah2d0RyZcVp614_k@Red>
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

On Mon, Jun 01, 2026 at 04:57:21PM +0200, Corentin Labbe wrote:
> Le Fri, May 29, 2026 at 05:33:41PM +0000, Eric Biggers a écrit :
> > On Fri, May 29, 2026 at 07:10:06PM +0200, Corentin Labbe wrote:
> > > Le Fri, May 29, 2026 at 09:10:57AM -0700, Eric Biggers a écrit :
> > > > On Fri, May 29, 2026 at 08:08:01AM +0000, Tianchu Chen wrote:
> > > > > From: Tianchu Chen <flynnnchen@tencent.com>
> > > > > 
> > > > > sun4i_ss_prng_seed() copies the user-supplied seed into ss->seed
> > > > > using the user-provided length with no bounds check. The crypto core
> > > > > does not enforce slen <= seedsize before calling into the driver, so a
> > > > > userspace caller via AF_ALG setsockopt(ALG_SET_KEY) can pass up to
> > > > > sysctl_optmem_max bytes, overflowing the fixed-size buffer and
> > > > > corrupting adjacent heap memory.
> > > > > 
> > > > > Clamp the copy length to the buffer size, matching the approach used by
> > > > > loongson-rng for oversized seeds.
> > > > > 
> > > > > Discovered by Atuin - Automated Vulnerability Discovery Engine.
> > > > > 
> > > > > Fixes: 6298e948215f ("crypto: sunxi-ss - Add Allwinner Security System crypto accelerator")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> > > > > ---
> > > > > v2: Silently clamp oversized seeds with min_t instead of returning
> > > > >     -EINVAL (Herbert Xu).
> > > > 
> > > > sun4i-ss-prng.c is useless, is still broken, and should just be deleted.
> > > 
> > > Hello
> > > 
> > > useless ? clearly no, it helped a lot on devices where it is.
> > 
> > The only way this code is reachable is via "rng" algorithm type in
> > AF_ALG, which is almost never used.  Everyone just uses the regular
> > Linux RNG (/dev/random etc) instead, as they should.
> > 
> > In fact, anyone were to accidentally use this it would be a security
> > vulnerability, seeing as sun4i_ss_prng_generate() doesn't actually fill
> > in all the bytes that were requested.  It also doesn't wait for the FIFO
> > to be ready when reading data from it.
> > 
> > Is it possible that there's a misunderstanding here and you think this
> > provides entropy to the regular Linux RNG?  It doesn't.  hwrng does
> > that, crypto_rng does not.
> > 
> 
> I believe to have used rngd for that. ( or something like that)
> 
> Anyway, I understand why want to remove it.

rngd doesn't use AF_ALG.  So no, it couldn't have used this driver.

- Eric

