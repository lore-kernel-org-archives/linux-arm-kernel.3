Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444A0CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUQ1Hc+I/Aj1c96UteOUubDPVimXUERGAR0RBwprXqQ=; b=lMW7K/2KKziPCgNg5dbbRaifpR
	XiBsAAoc1Qvto6WhrhlMldDfq5+fgmwDD0LB9nlm3kYHpR+DsGB0refcHt9O5jXCCm+Yg7fD2Wf2i
	WgIW5I9ME/1mxO3XoLo5xROGr9qtMs4tz1SoW/QUu5Npm561jD7D98Cwk7H1px6vAXtl46x+Ut8aL
	bkMLb5SRlBkzWGhe+Htn/52ROYhCpBl+kgH8JZhiCT3F/0sM6Nck/37DFPgKExX041J64f0gSoTe+
	H3Uoj+IQUYMiK0klDfhYchqu3zm+bTCXY3qy5HJWa/rU5mD7v4I6efW/TpabomkKlhkb6kCeBJHOS
	G2wOorSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU85X-0000000BhfJ-35Uu;
	Mon, 01 Jun 2026 19:14:15 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU85V-0000000Bhea-0ise
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:14:15 +0000
Date: Mon, 1 Jun 2026 21:13:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780341234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUQ1Hc+I/Aj1c96UteOUubDPVimXUERGAR0RBwprXqQ=;
	b=TCr0M55f+cj+zWkW4XfeG+iVrtQgcElmfxJcHPG6EuXGJ5WkOgA0QaNKeFlHzvWRPQ5n/I
	q4OeObswfaAesrI3w77ZkRXoDC2fM9Naa8JlDRTPW0VtmfK3qoo9JCvmuT7Tx5UW9sWVkI
	lGvHf6qF/7IUEoYnZ1qaAhtfEzhyZzM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-tdes - use min3 to simplify sg_copy and
 crypt_start
Message-ID: <ah3Z7bFWz512AgTU@linux.dev>
References: <20260525092927.818586-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525092927.818586-2-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_121413_503187_AD723D0F 
X-CRM114-Status: GOOD (  17.41  )
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

On Mon, May 25, 2026 at 11:29:27AM +0200, Thorsten Blum wrote:
> Replace multiple min() and min_t() calls with min3() to simplify the
> code. Using min3() instead of min_t() in atmel_tdes_crypt_start() is
> safe since the values are all unsigned and compatible.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-tdes.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
> index 643e507f9c02..834c6d3e1b06 100644
> --- a/drivers/crypto/atmel-tdes.c
> +++ b/drivers/crypto/atmel-tdes.c
> @@ -143,8 +143,7 @@ static int atmel_tdes_sg_copy(struct scatterlist **sg, size_t *offset,
>  	size_t count, off = 0;
>  
>  	while (buflen && total) {
> -		count = min((*sg)->length - *offset, total);
> -		count = min(count, buflen);
> +		count = min3((*sg)->length - *offset, total, buflen);
>  
>  		if (!count)
>  			return off;
> @@ -469,8 +468,8 @@ static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
>  
>  
>  	if (fast)  {
> -		count = min_t(size_t, dd->total, sg_dma_len(dd->in_sg));
> -		count = min_t(size_t, count, sg_dma_len(dd->out_sg));
> +		count = min3(sg_dma_len(dd->in_sg), sg_dma_len(dd->out_sg),
> +			     dd->total);
>  
>  		err = dma_map_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
>  		if (!err) {

This should probably be dropped for now because of this fix:
https://lore.kernel.org/lkml/20260531204115.689052-3-thorsten.blum@linux.dev/

Thanks,
Thorsten

