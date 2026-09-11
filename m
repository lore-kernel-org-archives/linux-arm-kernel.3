Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9220C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Qc9W48ajHUaDYex3wbtF0VK8EtF1Jd5f/13/VkTqAA=; b=xJWj09BBE0KjH1uNpT3nBDG+u6
	FTrN8ml4bigt/TxbyS4QkD9lN0npiNF4gFfZKWiSL38bAxR8bI+5N6LfbkFwcZw0i8x5rJsicPPrY
	6CQRi3wOE5LE/QjIrVsrj+VLQb3Q3sHeDIlUI78gXL3dZ2dF676WbQg3QcXIWsyEisynl+JwTwRYH
	MigK9PBBmsU6VJ2T9X9VYKwcJj9e7fVB4GSS2S+b3ABCpg4FXsWqA3JenY5jk/7lecxOH6TnoJPRM
	72nIrGjiAg6KmP4QViaz8a3h7eBi+7qwLCXTx6YwpzuZW2wX2QM9wmF269PwkLg4OtOt4RTMd5ERI
	KnXLHE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tqL-0000000FsRU-2QWh;
	Fri, 11 Sep 2026 05:30:33 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tqI-0000000FsQm-34Gt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=/Qc9W48ajHUaDYex3wbtF0VK8EtF1Jd5f/13/VkTqAA=; 
	b=cbYbsAR6kv84UBtTq+RC8A1nKGRqQXr3bttPltSs11P3qyepcWm96t2DY9GvFryQF8kFlNHWC41
	1eefaUrHh02APbnfPehyEsbvdgJdu32nu8k2XedKJS8wszjTjmXaJ6Whep6wQ+aeZbrxmHa55Sy88
	wQ/4zu7JtEKJjbwLFZonjlRy+C+bYUZo4wlOJ1+FQm1lAwprnn8Ry7cYL7oyiB+22aEikanTWyKY0
	qlo48b9+yKvOACcafN6iNV2scykk0czzMyk9mCHO6N70to+xzyGzFLWWlVksISrhkD65jk7Bmrfw/
	ByGYDCfsoytOzXHhw1ON3l5haFFN1gKXxUaw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x4tqA-0000000CuAl-0cKb;
	Fri, 11 Sep 2026 13:30:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Sep 2026 15:30:22 +1000
Date: Fri, 11 Sep 2026 15:30:22 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pramod Gurav <pramod.gurav@smartplayin.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-tdes - zero-initialize device state
Message-ID: <aqOR7pH5LB5b0Rjn@gondor.apana.org.au>
References: <20260829035821.67220-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829035821.67220-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_223030_779907_09328D97 
X-CRM114-Status: GOOD (  16.17  )
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

On Sat, Aug 29, 2026 at 05:58:21AM +0200, Karl Mehltretter wrote:
> Commit c659d07f11a3 ("crypto: atmel-tdes - Switch to managed version of
> kzalloc") accidentally replaced kzalloc() with devm_kmalloc(), so the
> device state is no longer zeroed.
> 
> atmel_tdes_hw_init() tests dd->flags during probe: a stale TDES_FLAGS_INIT
> skips the hardware reset, and a stale TDES_FLAGS_BUSY makes
> atmel_tdes_handle_queue() treat the engine as permanently busy, leaving
> every request queued and never dispatched.
> 
> Seen on a SAM9X75 Curiosity: the first TDES request after boot never
> completes and the TDES interrupt count stays at zero, while the AES and
> SHA engines on the same SoC work normally.
> 
> Switch to devm_kzalloc(), matching the Atmel AES and SHA drivers.
> 
> Fixes: c659d07f11a3 ("crypto: atmel-tdes - Switch to managed version of kzalloc")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/crypto/atmel-tdes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

