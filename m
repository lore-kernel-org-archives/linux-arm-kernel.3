Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E770BCD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 04:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=546shhB/KH5+15tWAdPoz4gIivACldY67y4LOMfUQeY=; b=NZau4K12/7IrZrYiDgXWpzAKzJ
	Fsxh2xq5HKCfw1Ak+akMyI7gYOHSV1M1WRDf43tHEgoaHeihttw9EJtrhdsKVbGApXYFiNWP5gMfL
	Vk+5W8+Kga+s93S11p16zuXbzCaTC3VN6hv1F8ZfkTbeAjyKa7hEJTfT6RG0/6g2KQtrYpOz0kS7m
	iFgsq6cA0BG7g3iEc6OGxuatDmRw8lr18V4UBJ3nh8o3wPf4QwSx7+lQklDRc40XNYA/VDiGIK2tC
	+qGmREBpq5ESKxzaoI9fHSjcqq32rBalvlOVO7yy82CEP9IdHbMzIGoFSdJ+cVAvOI/Zj/5aOhMfN
	vunmtKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXVU-00000008haY-2UmT;
	Thu, 11 Jun 2026 04:59:08 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXVR-00000008hYs-0x59
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 04:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=546shhB/KH5+15tWAdPoz4gIivACldY67y4LOMfUQeY=; 
	b=MlX1DafeCyKYYEqc2jJ06gdJe49IOkcz0wjLYKEijY5r/LZOufEDMtOWiJVXVTEsF+nRtnmVTnp
	DPKpT5+IHOX8QGc5zdsppH2dkFBzWaZQi4OkUyoKE8mhTX1uDyRZCtsjPHDrEUK5PMC0J0ktS9xbD
	HVrllEb+R68tI/Akgo9VNCPR6yRuAQfsv2QpND37NlzLNR4GuMaPrP3wWTXn8YBAxrixO5TH35aS4
	Otjnowfks6R8xvfCqaDg53lqtuwoLh43ccpguYI+RM0l+aAu8bKuF1U/1CxMy8b2gNv4ubkkczz00
	D0GN7F+eoL8sdn1cNz4KYORCZTNy6YwoOjDg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXXV1-00000004TeB-1eqX;
	Thu, 11 Jun 2026 12:58:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Jun 2026 12:58:39 +0800
Date: Thu, 11 Jun 2026 12:58:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: thorsten.blum@linux.dev, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, krzk+dt@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/1] crypto: atmel-sha204a - fix heap info leak
 on I2C transfer failure
Message-ID: <aipAf_uZnX_gwZnl@gondor.apana.org.au>
References: <20260609094723.47237-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609094723.47237-1-l.rubusch@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_215905_266821_D592EA7B 
X-CRM114-Status: GOOD (  12.29  )
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

On Tue, Jun 09, 2026 at 09:47:23AM +0000, Lothar Rubusch wrote:
>
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> index 4c9af737b33a..20cd915ea8a3 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -31,10 +31,15 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
>  	struct atmel_i2c_client_priv *i2c_priv = work_data->ctx;
>  	struct hwrng *rng = areq;
>  
> -	if (status)
> +	if (status) {
>  		dev_warn_ratelimited(&i2c_priv->client->dev,
>  				     "i2c transaction failed (%d)\n",
>  				     status);
> +		kfree(work_data);
> +		rng->priv = 0;

Why is this necessary? It appears that rng_read_nonblocking already
zeroes rng->priv.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

