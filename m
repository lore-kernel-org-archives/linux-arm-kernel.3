Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50303107BCEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUXcLKoc7COE0wu6kd451RLHftXbNwdcrBZLRXaHvGs=; b=H6gpjlFLryfTTncx3ioaTTTV94
	HNGL94jbWr4Xjt/F1BfCEMjdEpUt2MNdtRBymX+fQjBic6FraKAD5ycdLWEq1h1/cdDRfJ8eJsn4D
	DUueYzmaEUBsspvVQ+lzNgPURvwt6y2komFDUeChP0nJqrJi+CovejNVi9uSE2Cv5K1JoibTtOwOF
	Bbmb+Tb01f95RXEwbnRV1B5IFJonc5Dzk4h3co02/RwY4oZZIHWJJhW8m9O/DdxNoI2OXKrHm96nw
	RWTLac9m+JMcMwjc35kOTFuN6tP5OnfsPn0VT95n1r3ZjZRIq5B3ou4gE98z8dofHczXSJi3SCLK0
	TBO5+6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HNx-00000001Wiq-1dQj;
	Sat, 14 Mar 2026 05:18:01 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HNo-00000001WhD-2Kl8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 05:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=lUXcLKoc7COE0wu6kd451RLHftXbNwdcrBZLRXaHvGs=; 
	b=Z/3trxozemy/z5PUEmrC+qNC9yLQSXe4Sj0YO0EgKgOhRdfnn85GdntZzcsxBmG+1VLI9IjEj2a
	MYNdXARcq3CgoC+cPwY5TB+Pf0O0ul5YiOcRu1nuYDef5pYeAijUy4dG3Yuzlvjeusj85i+sRmWVk
	vYtvbtt7KTqb2JDyjiXc+oz7HH5AbmBCLqPZAgGvyiAI3dUTQ4i/tj6+JjxQJmrJk5tKZnSScWQ4g
	VB9tLEivSKz/xdzNsGJvRQHm1JXMAytef+JrESV0LsefeznGJK8AMK0wQas0PJfjzuRhVImTFw3kw
	HDBrN8B9hvl0uN3QyOjDzYYAvChbG6OGotBA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1HNb-00ELCa-1U;
	Sat, 14 Mar 2026 13:17:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 14:17:39 +0900
Date: Sat, 14 Mar 2026 14:17:39 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>,
	Nicolas Royer <nicolas@eukrea.com>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-tdes - fix DMA sync direction
Message-ID: <abTvc58wltmQNOe_@gondor.apana.org.au>
References: <20260307153109.321147-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307153109.321147-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_221758_957403_25B8D73F 
X-CRM114-Status: GOOD (  12.00  )
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

On Sat, Mar 07, 2026 at 04:31:10PM +0100, Thorsten Blum wrote:
> Before DMA output is consumed by the CPU, ->dma_addr_out must be synced
> with dma_sync_single_for_cpu() instead of dma_sync_single_for_device().
> Using the wrong direction can return stale cache data on non-coherent
> platforms.
> 
> Fixes: 13802005d8f2 ("crypto: atmel - add Atmel DES/TDES driver")
> Fixes: 1f858040c2f7 ("crypto: atmel-tdes - add support for latest release of the IP (0x700)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-tdes.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

