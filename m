Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561ACF3ED7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAz8Z4Vd4S+N7HdZJMZc4HMb1LyZQJySdWx6FshsIBM=; b=aG6QBZKfQIXhP4FbsIybmK5HnY
	5893TPvB8PLPRM7okeCbPkvCcO9FKj80+aRYXtTBsGvWV8L+UmvmzqrclQfO9aId6JnlTL+LmYXtK
	w6iZyUEF9M3k0xmZkD3f9MGMYRCjOdkcuWjc1TiraLEJRUrfnRqfIPLmVAWq9DEMVk+5WR48yaisH
	JURPT6M3yPtc3eEfpn6hBcIvXiI7sCR7Y5MSo8fNB0rxdi5X15px2MyVWpYmad9EH6pMjYbRx8O0h
	dxhfqiuzjY7G8WzFyrfuRESq7cYOlrxI380GLAOyIJBTsaqQkTYsYda8RZww+0Y0ytxyl4jevwh0H
	TN2N/Mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqNm-0000000EA3p-0twA;
	Sun, 12 Apr 2026 08:41:30 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBqNj-0000000EA35-0odR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 08:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=nAz8Z4Vd4S+N7HdZJMZc4HMb1LyZQJySdWx6FshsIBM=; 
	b=SE09pf7/HX05JKPsXaHx2yBsUsfdXVNpi72qWGwLOh89cv3xZaiYcnay6h6YSwMUGTrwgla19zf
	DoxBOupL7Bqq8i9lSWwBRxZMfDTFJVIj5chjwNmiJ3+lzdUYDzVHUXAlO8KwfkbiOA81nS+GrNAoK
	yj8PrBG6zo5VaDJlH3/UMqGts6q00yAtTTWRKmWUOjrk/Ig/V+YUwZ7pJhPVjxeBfzpiiZQ12gcLt
	EsXISu41skE+C8GwIVfbgxZGvl9rW1wnw7AUKA8kuE04Dlo7czGTJ1vcrboQHcAX61KTdEoqcVMz7
	omcI2RSEodaqPnN5QAnwdE733un5T/FrW/fQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wBpxv-005UCq-2q;
	Sun, 12 Apr 2026 16:41:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 12 Apr 2026 16:41:06 +0800
Date: Sun, 12 Apr 2026 16:41:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - fix potential use-after-free in
 remove path
Message-ID: <adtaojnrwm9Bclln@gondor.apana.org.au>
References: <20260402130536.892838-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402130536.892838-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_014127_237702_37D924B8 
X-CRM114-Status: GOOD (  26.28  )
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

On Thu, Apr 02, 2026 at 03:05:38PM +0200, Thorsten Blum wrote:
> Flush the Atmel I2C workqueue before teardown to prevent a potential
> use-after-free if a queued callback runs while the device is being
> removed.
> 
> Drop the early return to ensure the driver always unregisters the KPP
> algorithm and removes the client from the global list instead of
> aborting teardown when the device is busy.
> 
> Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index b6a77c8d439c..6dbd0f70dd84 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -346,21 +346,8 @@ static void atmel_ecc_remove(struct i2c_client *client)
>  {
>  	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
>  
> -	/* Return EBUSY if i2c client already allocated. */
> -	if (atomic_read(&i2c_priv->tfm_count)) {
> -		/*
> -		 * After we return here, the memory backing the device is freed.
> -		 * That happens no matter what the return value of this function
> -		 * is because in the Linux device model there is no error
> -		 * handling for unbinding a driver.
> -		 * If there is still some action pending, it probably involves
> -		 * accessing the freed memory.
> -		 */
> -		dev_emerg(&client->dev, "Device is busy, expect memory corruption.\n");
> -		return;
> -	}
> -
>  	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
> +	atmel_i2c_flush_queue();

I don't think this works.  Even if you unregister the algorithm,
existing tfm's can still access the driver.

You'll need something a bit fancier than this to deal with it by
failing any calls to existing tfm's gracefully.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

