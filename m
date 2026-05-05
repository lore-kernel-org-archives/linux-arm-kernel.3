Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E9EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQeNCS6wC+YzY1oGOiHUG65CiDfkMKsi4NUVtsUQM9s=; b=sFWrGO0PfUkUktZHopaSrRmvK0
	DyS/tauzXtOh5HiF5OGn/XaK3X1B5ebkj+gtY1DsHUN6X417UQJL3+UWnI2H6sR/mLmPCDyLQaSmx
	tuiNB3iRVPeI6/x1K9QHVXnyN1D8vEFpOQXoO9fIwXzaAHb5DuWODuVzM0dZDmjH25FvlD9NXhFHa
	wPFbJFlWPII6b7GlAh3fL+yBS5ORHJNQk9l4jxp/mwhFhn3CglYLY9PVowcOXqXthyHSQPJUhKFDG
	5Ws+SyYPv07EZDgb/d3JJ07hdMiec2eEB9LCgBbp8e7nHwkYnNXevlt/B7m5haCrdHOrD5SrFWkM3
	o8kO9wUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC0y-0000000FecE-3BLx;
	Tue, 05 May 2026 09:24:28 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC0w-0000000Feaw-0Agf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=AQeNCS6wC+YzY1oGOiHUG65CiDfkMKsi4NUVtsUQM9s=; 
	b=ZEd7Q3th2nNYd9oYnLUbOlLJb0QKCue74llDuhg/nGK+sqQU+8Aa6nrHysw4CfVhpovnCCllMYX
	6171488JItu/NZjHPZ8SaY4gIrAnwAR0OG575lJH5J3VFLYGpAUHgWncp/SdCfGuYCp8yn2NQw1YK
	yPYDbu5H/SUexra8AaqesTsS8L0g4ui8zo57tVyAcfhDlTAn2Iq0ePe0vR4wvYp5dWrQv0R7N25XS
	P0zkjBZCBItkyNoMyA3fQbKn0Mwm7/lq7TdaWJhnGTV2nAA+Q3sjGeyCd70p5pVsVLvAn1USlgoGC
	vouNU9SOsaHskQ6pO5j4NE4llgpC/9CnKf3A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wKC0l-00BNpG-1p;
	Tue, 05 May 2026 17:24:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 05 May 2026 17:24:15 +0800
Date: Tue, 5 May 2026 17:24:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, linux-crypto@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	"David S . Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: ixp4xx - fix buffer chain unwind on
 allocation failure
Message-ID: <afm3P2vtZAPdIK0x@gondor.apana.org.au>
References: <20260423111956.185761-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423111956.185761-1-ruoyuw560@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_022426_079160_909DE938 
X-CRM114-Status: GOOD (  17.59  )
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

On Thu, Apr 23, 2026 at 07:19:56PM +0800, Ruoyu Wang wrote:
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
> Fix this by terminating the partially constructed chain on allocation
> failure and letting the callers unwind it via their existing cleanup
> paths. Also fix ablk_perform() to preserve the hook pointers before
> checking for failure, so partially built chains can be freed correctly.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> v2:
> - Keep the unwind path in the callers, per Herbert Xu's feedback.
> - Terminate the partial chain before returning NULL on allocation failure.
> - Save the hook pointers in ablk_perform() before checking the return value.
> - Thanks to Herbert Xu for the review.
> 
>  drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 25 ++++++++++++---------
>  1 file changed, 14 insertions(+), 11 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

