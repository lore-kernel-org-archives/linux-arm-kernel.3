Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A5C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvHSMteT/z+D5EU6UdnH2mhprHjlF/y16XFkvC86WFc=; b=zSe6EtnBiPnjRekpSQFRRsjPMr
	DzXo4MEtoND+1bFZepbKzC4/hzCXX2QY6dAWkaEyG3OmA5olIwky+o6J0g8NMDvLMv+mCcGvwj9AW
	msSR9sTZnUiSaUrhBP9SB/PwyMTJkshKWcD/sK8Pomw0fi+4qntiPEaIAKA50xTnhyIId6SC/ZKK1
	Ce0aQYFin7IS+glTehMYRTEQZlMHgo2++NJZbiF/znzatG5KsNeZ3A1jrvKTNAg1DUMhCWqBmBWI2
	hH1ZYW7Hkqpo53dYuO8U20VhHtsjcOkEl9JVHBBppJ8r1NyRCWGdBsrLtKltLh4etJMtziTzNl9yu
	Bm8xSiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFBq-00000007WN9-3gVW;
	Tue, 18 Aug 2026 08:28:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFBp-00000007WMx-2a5a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 08:28:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C6EB40707;
	Tue, 18 Aug 2026 08:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A8C1F00A3A;
	Tue, 18 Aug 2026 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787041737;
	bh=EvHSMteT/z+D5EU6UdnH2mhprHjlF/y16XFkvC86WFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q6uZsUrCrf8IbeQZ9eCWEXA8Wyv0njLBnbPv42pc0SjcZ2keCvMEbthUwUvr81BFu
	 Wmxr8ohGCkIuJY5HwtcYxzjeiGo9vXwjqHfo8/Akp45kp0MdfHdet7QRc1pe5I8hpr
	 J63gdbISM+tdqC6cBg2vHDfEAYOzF5yB4w75/lnJwyxH7m6lh9r1GFLJ9IcVUnNUnB
	 ETd7gy3bSGEhYzZNFw49ZFoxooa1SxvcRwXixfORSgIfmKW+bypFo8EvCLrah9AKEN
	 E9epXYK8KsRxLnBxiLl6Ya7QJxGOoLNQkGo6a8xxmv3UizYajQnZryw4lqbEZQ0ld8
	 KH3LKxgy2yMCA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wwFBm-00000000nOA-2Twz;
	Tue, 18 Aug 2026 10:28:54 +0200
Date: Tue, 18 Aug 2026 10:28:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwrng: atmel: fix usage_count leak when
 autosuspend_delay is negative
Message-ID: <aoQXxhJGFdCjrljz@hovoldconsulting.com>
References: <20260808063458.2609136-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808063458.2609136-1-lgs201920130244@gmail.com>
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

On Sat, Aug 08, 2026 at 02:34:58PM +0800, Guangshuo Li wrote:
> atmel_trng_probe() calls pm_runtime_use_autosuspend(), but neither the
> probe failure path nor atmel_trng_remove() calls the matching
> pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> 
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during teardown, this reference is not dropped and usage_count remains
> unbalanced.

As I've explained elsewhere, this is just misleading. There is no usage
count leak here as the count is balanced whenever the user re-enables
autosuspend through sysfs (by writing a non-negative timeout).

Drivers should clean up after themselves and disable autosuspend, but
this is more of a clean up than a fix and should not be backported.

You've sent upwards of 60 of these in the matter of a just a few days,
some which have even been picked up. Please send follow-ups (replies or
v2s) as soon as possible to prevent further of these from getting
merged.

> Add the missing pm_runtime_dont_use_autosuspend() calls to both the
> probe failure and remove paths before disabling runtime PM.
> 
> This issue was found by manual code inspection.
> 
> Fixes: c4f51eab6ce0 ("hwrng: atmel - add runtime pm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Johan

