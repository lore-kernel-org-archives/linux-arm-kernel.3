Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7564FCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YvzqMDI3nbkwkA5pMGiIeRglsYXX8ywE2cZbFG4rU8=; b=dmHYtgV7Wnt66r3yCVvzinRd7V
	9WwqkmFAsFvm1j2g2Jb/jQe0AxeDYZr8Yf3GeFUHBMztk7PPzm32s4eJHBxVuchDiIMuT/Pr8BG7p
	x4MatrAoXpzhOAy6x3dXI54iiB1ga9+8DZU5760j6hlQJtN1AengLPQFuJ9TXYpEcFa1jwD+zvN9o
	+hdk/3MY4LAgFnk+EtxbSHOgwX/KSsWZKovyTgoaCCb3UAf3FDkJDZ0TWJUmQwF/Ms/43KWxUYxf6
	KoY7JV9fImeshXyOFPCVE9kJ99x+Jiq50Gcaw1IsuH8zcabB9rn/EsSD3rdTClYHa5zONRc9iSYUR
	WKhSGU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXav-00000008hw8-0VlW;
	Thu, 11 Jun 2026 05:04:45 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXar-00000008hvl-3VbL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=/YvzqMDI3nbkwkA5pMGiIeRglsYXX8ywE2cZbFG4rU8=; 
	b=sa8XVQfHBThT8cDuG7BuRp8CBEjfeawbl2vlG6XfTIhjdaLqCbpsxSgga0OoaYU/NmYdlUE37UN
	ZfyzjhDsZKU72uF1PVTcpwtosklGYJCIfbU0bPebY0zGJuwJfMv8aTY8jjFK2UsXUHHc2mFDMUKkY
	E/3+22hcH+xyITALfnDVZtW4WVttpN1qXmhx/1HfGrzvaNqwEG3pKZxGPm2hgU3g/jvf4anx2wHwL
	eHHm8gzuK/LZfno2wCOhIdM03kt5jmdyZVLoqygPrUUpHBf7ZeZhoeyecK2W4PNMWEQHyFyUcgFCy
	og7b1lRiU8A4dZLRVnY2jPRF4XTlqX2N3VuQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXXaj-00000004Tmd-2lb3;
	Thu, 11 Jun 2026 13:04:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Jun 2026 13:04:33 +0800
Date: Thu, 11 Jun 2026 13:04:33 +0800
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
Subject: Re: [PATCH] crypto: atmel-tdes - use scatterlist length before DMA
 mapping
Message-ID: <aipB4S29ID_dQeLg@gondor.apana.org.au>
References: <20260531204115.689052-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531204115.689052-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_220441_878890_C6079BAC 
X-CRM114-Status: GOOD (  18.44  )
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

On Sun, May 31, 2026 at 10:41:17PM +0200, Thorsten Blum wrote:
> Using sg_dma_len() is only valid after mapping the scatterlist with
> dma_map_sg(). However, atmel_tdes_crypt_start() uses it before mapping
> to compare input/output lengths and to compute the transfer count.
> 
> Use the original scatterlist lengths before DMA mapping to avoid reading
> stale or uninitialized DMA lengths when CONFIG_NEED_SG_DMA_LENGTH=y.
> 
> Fixes: 13802005d8f2 ("crypto: atmel - add Atmel DES/TDES driver")
> Fixes: 1f858040c2f7 ("crypto: atmel-tdes - add support for latest release of the IP (0x700)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-tdes.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
> index 643e507f9c02..0d62b24e9fc7 100644
> --- a/drivers/crypto/atmel-tdes.c
> +++ b/drivers/crypto/atmel-tdes.c
> @@ -463,14 +463,14 @@ static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
>  			IS_ALIGNED(dd->out_sg->length, dd->ctx->block_size);
>  		fast = in && out;
>  
> -		if (sg_dma_len(dd->in_sg) != sg_dma_len(dd->out_sg))
> +		if (dd->in_sg->length != dd->out_sg->length)
>  			fast = 0;
>  	}
>  
>  
>  	if (fast)  {
> -		count = min_t(size_t, dd->total, sg_dma_len(dd->in_sg));
> -		count = min_t(size_t, count, sg_dma_len(dd->out_sg));
> +		count = min_t(size_t, dd->total, dd->in_sg->length);
> +		count = min_t(size_t, count, dd->out_sg->length);

If fast == 1, then dd->in_sg->length must be equal to dd->out_sg->length,
so the second line is redundant.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

