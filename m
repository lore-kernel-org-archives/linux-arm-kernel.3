Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35B1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a26LDP23I0jAoaKTwCFAOnHcyE8CbjAuBb0B0Ovkal8=; b=XqO3yyxcrbBR3RBzhvdxjSCPHK
	vkApgLmmwY5xAhxdEJxYSqDEYjUbc2N9UJOf6luTdN7K6Yoctj0oa2wdL156GvZ5Pr1lQ1HOe2S3s
	Cfwavslg1xueatv2vBnsxTZ1xYjF4E4lXastHdFi1ravfBh1V+8fQjJ053c4lKXIpK5757ZPi5LzJ
	B83TdOr4qvEVxW0+VejtnBWkX4ljNst19NqWBaYrZqYtXXp51dGW/3JyVwtshfG/ZIGEUYnV7Av76
	H0ZpezXpqCq6k93IGVVrF6VwP0Ufqd3XtwaoDEb/XbDtHWGFYu1PViT6F9NmUHzpwA+vl/E+zoQSH
	qXMtvhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIDp-00000009896-23vB;
	Sun, 05 Jul 2026 08:29:05 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIDn-0000000988W-1K7x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=a26LDP23I0jAoaKTwCFAOnHcyE8CbjAuBb0B0Ovkal8=; 
	b=aC3S1SPFzzKDTfa/zPCawY64qY7G05Vgi64Zsz1BgZy8dpTThAH0oWSztCRFqm/dW2GNDea08PT
	DvYTyNyMH/uxsr6pcLV44JyUfDTEfxXgdrOmOI9xtApnj7xtrlCbMyFIP2N7ZIOsfKmw7e0orK1Xl
	V9RYLGlRXRTa+qQBq3z00zeX6+F7poQxEFoyzB04XUoe/j8r8Xq3pfnL0Mlx8GaiVXVhQXwyCnJnr
	RnlO4iwEJUgK84jhUDs/QNJdEjtTsTZMv9ifl32Sh/aXam1c5XbN2EQLu5lcbSwZUEWoxRn59lCmo
	YwcoTwgtlLlJwuLgVC3VQau4CKBlfX5XVHFw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgIDe-0000000AkwR-3oy5;
	Sun, 05 Jul 2026 16:28:55 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:28:54 +0800
Date: Sun, 5 Jul 2026 16:28:54 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Royer <nicolas@eukrea.com>,
	Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-tdes - use scatterlist length before
 DMA mapping
Message-ID: <akoVxtnZkHP-Le_0@gondor.apana.org.au>
References: <20260611103633.458381-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611103633.458381-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_012903_372995_D29642A2 
X-CRM114-Status: GOOD (  14.40  )
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

On Thu, Jun 11, 2026 at 12:36:35PM +0200, Thorsten Blum wrote:
> Using sg_dma_len() is only valid after mapping the scatterlist with
> dma_map_sg(). However, atmel_tdes_crypt_start() uses it before mapping
> to compare input/output lengths and to compute the transfer count.
> 
> Use the original scatterlist lengths before DMA mapping to avoid reading
> stale or uninitialized DMA lengths when CONFIG_NEED_SG_DMA_LENGTH=y.
> 
> Drop the output scatterlist length in the fast path since it is equal to
> ->in_sg->length and does not change the transfer count.
> 
> Fixes: 13802005d8f2 ("crypto: atmel - add Atmel DES/TDES driver")
> Fixes: 1f858040c2f7 ("crypto: atmel-tdes - add support for latest release of the IP (0x700)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Drop ->out_sg->length in the fast path (Herbert)
> - v1: https://lore.kernel.org/lkml/20260531204115.689052-3-thorsten.blum@linux.dev/
> ---
>  drivers/crypto/atmel-tdes.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

