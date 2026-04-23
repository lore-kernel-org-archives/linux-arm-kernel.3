Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76116F99351
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfCGKlwNf3gbn1SnAZgrVTttc3K70VeizSyG/plH/so=; b=ayanSgbLlK6P8ypENfBodZR7g6
	tSS7Lk7qGd8gvoQW7Rq9VbFg6PmCWZIogrOONXwzFLY3IMhy97emz6tjlVBjESiqgRQpXzeX/oO7J
	28pkr7RJ0df5JJtV7kYojlltpOiysCv4QD/90t3oq5UnbsrqxgCS+eKq+0Q7S7FXFKKu4kNxaSNMs
	atuegCr5CaUZzfdKGwNRpqqk3IijOjKKqVAsIr2BE+/YLHEKS090ulLa5L9yEFToNQNcStBJF4Eom
	jmsjunoxCqKT933UbDakEdmHH+s0/kTIjjoJC2bLpPwUoprroFThpYKBqXzNZWS02UBbwOjcbpsOa
	dzqedvOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFp9z-0000000BD0s-2fwE;
	Thu, 23 Apr 2026 08:11:43 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFp9u-0000000BD07-2OAD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 08:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=DfCGKlwNf3gbn1SnAZgrVTttc3K70VeizSyG/plH/so=; 
	b=UGcplMJWZzlfolzxJ5ffP5ehhBXz6CL8iK6PtFizeAFLhT1Vaglu3sbYnegHpWeXwVceMY9JoW4
	r9LRS/qKebdQl6q30riZBy0c/fl6TaGSUQHFYW8fMzI8mCP5DXAzeXqy9RqPBxGCQCp0/z/MquBh6
	4+6CmdI1RMKjQb0s7GCdz9+pwHrSUjJn+uBrtP53sbphcK6BqIGwQkKNeT1OJr99Uf8eLJKRGQ/DY
	oIlo8wLJ3Z0YnpD5MACDzVK0yPyWqUTo+i3f0gA3VrWBSXg4kw5doUDlRh/MKboXgg3+hp33KkEMu
	mrLdghgHKPKSqqeOfrOypmftbvr7g6+NbXUw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wFp9Y-008AvE-1I;
	Thu, 23 Apr 2026 16:11:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 23 Apr 2026 16:11:16 +0800
Date: Thu, 23 Apr 2026 16:11:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: clabbe@baylibre.com, linusw@kernel.org, kaloz@openwrt.org,
	davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: ixp4xx: Fix null-pointer dereference in
 chainup_buffers()
Message-ID: <aenUJLufZ5cK7DmQ@gondor.apana.org.au>
References: <20260421093917.1001688-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421093917.1001688-1-ruoyuw560@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_011138_623097_EBB22249 
X-CRM114-Status: GOOD (  23.69  )
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

On Tue, Apr 21, 2026 at 05:39:17PM +0800, Ruoyu Wang wrote:
> chainup_buffers() builds a linked list of buffer descriptors for a
> scatterlist. If dma_pool_alloc() fails while constructing the list, the
> current code sets buf to NULL and later dereferences it unconditionally
> at the end of the function:
> 
>   buf->next = NULL;
>   buf->phys_next = 0;
> 
> This can lead to a null-pointer dereference on allocation failure.
> 
> If the failure happens after part of the descriptor chain has already
> been allocated and DMA-mapped, the partially constructed chain also
> needs to be released.
> 
> Fix this by unwinding the partially constructed chain, resetting the
> caller-provided hook descriptor, and returning NULL on allocation
> failure.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 24 +++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
> index fcc0cf4df637..63ef28cd5766 100644
> --- a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
> +++ b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
> @@ -874,6 +874,11 @@ static struct buffer_desc *chainup_buffers(struct device *dev,
>  		struct buffer_desc *buf, gfp_t flags,
>  		enum dma_data_direction dir)
>  {
> +	struct buffer_desc *first = buf;
> +
> +	first->next = NULL;
> +	first->phys_next = 0;
> +
>  	for (; nbytes > 0; sg = sg_next(sg)) {
>  		unsigned int len = min(nbytes, sg->length);
>  		struct buffer_desc *next_buf;
> @@ -883,10 +888,15 @@ static struct buffer_desc *chainup_buffers(struct device *dev,
>  		nbytes -= len;
>  		ptr = sg_virt(sg);
>  		next_buf = dma_pool_alloc(buffer_pool, flags, &next_buf_phys);
> -		if (!next_buf) {
> -			buf = NULL;
> -			break;
> -		}
> +		if (!next_buf)
> +			goto err_unwind;
> +
> +		/*
> +		 * Keep the chain well-formed even on partial construction,
> +		 * so free_buf_chain() can safely unwind it on failure.
> +		 */
> +		next_buf->next = NULL;
> +		next_buf->phys_next = 0;
>  		sg_dma_address(sg) = dma_map_single(dev, ptr, len, dir);
>  		buf->next = next_buf;
>  		buf->phys_next = next_buf_phys;
> @@ -899,6 +909,12 @@ static struct buffer_desc *chainup_buffers(struct device *dev,
>  	buf->next = NULL;
>  	buf->phys_next = 0;
>  	return buf;
> +
> +err_unwind:
> +	free_buf_chain(dev, first->next, first->phys_next);
> +	first->next = NULL;
> +	first->phys_next = 0;
> +	return NULL;

All callers of chainup_buffers try to unwind by calling free_buf_chain
too, although a couple of them might do so incorrectly.

It looks like the callers need the unwind path anyway, so perhaps
just fix up the callers so that their unwind paths actually work?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

