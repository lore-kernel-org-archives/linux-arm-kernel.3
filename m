Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W66ZR94wfwnjZOMAZQ6UhAWUSRUCpXS+5HHe+V44JoU=; b=truFzqeyHvWE+Z1gNsop+J8dUd
	Dsfz6OJtIXFoLDUV2ARGSCBfLQUvlZTv2Q6JGEiOmQsSuJvoRyc+kNkoJBGMVtq7ZUvZwDycGilWN
	3mQWqoviTwYGC2jTeeAe4MsM6rz93dDqTtnOXxAKS0DAfASHk3Ti7VJFp9wmw9H3SShYraJqgj18v
	P9teYIqKnjMHLWNjZqe5Eu270DvwXHjHO+fC7bLyGO/6wV0vMhqThegzB39Ope/RtZuYq8nItteln
	wrDVuHUMr43sPOYlzbeNxZTuBAsrBO70PblCWoxIL6rDPzHClPsGaWcclnMk1Ug68N168vdirZdK/
	UsvyC9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIEJ-000000098Hj-30b2;
	Sun, 05 Jul 2026 08:29:35 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIEF-000000098Ff-35eB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=W66ZR94wfwnjZOMAZQ6UhAWUSRUCpXS+5HHe+V44JoU=; 
	b=HYX4uJvEL5g9aj3dwRVmbffMVYpPEi/WgRhJEFzNOIJccBLYP0sjG4/uZgpLOmxfqiQXYFid5yp
	C7FYd+iGx24HA9VMfrIc4XqP/bKbvG6fg86FFKbo9or3Yq5yiVGdiONtKVdccrYN5UOu3JVo9Okcx
	nDvYtxWLmKO+fChlZU3+d9P8VJF3fF7DScqfePpdAbiv+4DrfSWYwU9oeBwKCmFZxwdC1uejW442T
	3UQHdOatNcj1jykIAZe8amgks6NXtIsPhvWgTEbZ9kdsB1HjWkIfSHV5LaYL4mIeUm2KBCpmUxStw
	v9kufvu8o/0bl0N1894dehfa9Xe5y4h1obMw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgIE8-0000000Akwo-2cJ3;
	Sun, 05 Jul 2026 16:29:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:29:24 +0800
Date: Sun, 5 Jul 2026 16:29:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - reject hardware ECDH without a
 public key
Message-ID: <akoV5M1sXgMoUuEV@gondor.apana.org.au>
References: <20260611213617.463552-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611213617.463552-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_012931_771914_6D45D289 
X-CRM114-Status: GOOD (  13.30  )
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

On Thu, Jun 11, 2026 at 11:36:17PM +0200, Thorsten Blum wrote:
> The hardware ECDH path in atmel_ecdh_compute_shared_secret() uses the
> private key stored in the device. However, the public key is cached only
> after atmel_ecdh_set_secret() successfully generated that private key
> for the current tfm.
> 
> atmel_ecdh_generate_public_key() already rejects requests when no public
> key is cached. Add the same check to atmel_ecdh_compute_shared_secret()
> to prevent the device from using a private key that was not generated
> for the current tfm.
> 
> Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 3 +++
>  1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

