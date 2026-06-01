Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE3CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbRRQ6UrReGZ9CEz+b0Ya6nhw8Mi+MGNVxgZl4wtQvY=; b=P/LyqC4EXRzd28q6Bq2Tmwu8st
	+jFqMixLyOdakPaLTAiUBFauP4Sk98y/+DU/aCeKgFWx5s/D6NCROCvvOB9Z6CKrkm741M08cep9y
	UDOdgWtIjt1VonqWXvE/IqQpdqbFLHDxgZ7lDE0sqbljfY4Org4ybkYKcdOIR0epA67miozmc9Aov
	+O5amIcGHk5xWKKu90aARqjspIMVTuKbKiTKOfcWk2mvgVxXGm7DCt5mr2UeHSX9LguL5dBd2FvGK
	DgarJOcYAMNncrg9veTkWo9TKilayQUoAk/4DchJBu3ZPhS4wLHgNVYkJRGi2Y7Vnn+LfiiHqbRcq
	2tLGA6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAPR-0000000Bs98-2UuT;
	Mon, 01 Jun 2026 21:42:57 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAPP-0000000Bs8k-1RHN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:42:56 +0000
Date: Mon, 1 Jun 2026 23:42:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780350171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KbRRQ6UrReGZ9CEz+b0Ya6nhw8Mi+MGNVxgZl4wtQvY=;
	b=pwWujJDscJ+QSlmOJpum5zso1mLfyH+KmNwql+rQJRpqJ+35ngOvk3Z9RaSaTH29CHYxOU
	MA4dHIg6zZdSRpHbEL+igqopQNyip9C4dFzFG0n1W+NtymSYJ9T5RQg9ZNPlmonJpG7DRT
	OhK+uv3GXcUOg4zzh8fpbOTkLU0T6mE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	krzk+dt@kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] crypto: atmel-ecc - fix use after free situation
Message-ID: <ah381bcuVfN8PQr0@linux.dev>
References: <20260529092703.33086-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529092703.33086-1-l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_144255_600553_935E4C5A 
X-CRM114-Status: GOOD (  25.82  )
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

On Fri, May 29, 2026 at 09:27:03AM +0000, Lothar Rubusch wrote:
> Fixes a possible race condition, when having multiple of such devices
> attached (identified by sashiko feedback).
> 
> The Scenario:
>     Thread A (Device 1 Probe): Successfully adds i2c_priv to the global
>              list (Line 324). The lock is released.
>     Thread B (An active crypto request): Concurrently calls
>               atmel_ecc_i2c_client_alloc(). It scans the global list, sees
>               Device 1, and assigns a crypto job to it.
>     Thread A: Moves to line 332. crypto_register_kpp() fails (e.g., out of
>               memory or name clash).
>     Thread A: Enters the error path. It removes Device 1 from the list and
>               frees the i2c_priv memory.
>     Thread B: Is still actively trying to talk to the I2C hardware using
>               the i2c_priv pointer it grabbed in Step 2. The memory is now
>               gone. Result: Kernel crash (Use-After-Free).
> 
> Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/crypto/atmel-ecc.c | 10 ++++++++++
>  drivers/crypto/atmel-i2c.h |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index 0ca02995a1de..d391fe1462f6 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -218,6 +218,8 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
>  
>  	list_for_each_entry(i2c_priv, &driver_data.i2c_client_list,
>  			    i2c_client_list_node) {
> +		if (!i2c_priv->ready)
> +			continue;
>  		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
>  		if (tfm_cnt < min_tfm_cnt) {
>  			min_tfm_cnt = tfm_cnt;
> @@ -322,20 +324,24 @@ static int atmel_ecc_probe(struct i2c_client *client)
>  		return ret;
>  
>  	i2c_priv = i2c_get_clientdata(client);
> +	i2c_priv->ready = false;
>  
>  	spin_lock(&driver_data.i2c_list_lock);
>  	list_add_tail(&i2c_priv->i2c_client_list_node,
>  		      &driver_data.i2c_client_list);
> +	i2c_priv->ready = true;
>  	spin_unlock(&driver_data.i2c_list_lock);
>  
>  	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
>  	if (ret) {
>  		spin_lock(&driver_data.i2c_list_lock);
> +		i2c_priv->ready = false;
>  		list_del(&i2c_priv->i2c_client_list_node);
>  		spin_unlock(&driver_data.i2c_list_lock);
>  
>  		dev_err(&client->dev, "%s alg registration failed\n",
>  			atmel_ecdh_nist_p256.base.cra_driver_name);
> +		return ret;
>  	} else {
>  		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
>  	}
> @@ -347,6 +353,10 @@ static void atmel_ecc_remove(struct i2c_client *client)
>  {
>  	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
>  
> +	spin_lock(&driver_data.i2c_list_lock);
> +	i2c_priv->ready = false;
> +	spin_unlock(&driver_data.i2c_list_lock);
> +
>  	/* Return EBUSY if i2c client already allocated. */
>  	if (atomic_read(&i2c_priv->tfm_count)) {
>  		/*
> diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
> index 72f04c15682f..e3b12030f9c4 100644
> --- a/drivers/crypto/atmel-i2c.h
> +++ b/drivers/crypto/atmel-i2c.h
> @@ -129,6 +129,7 @@ struct atmel_ecc_driver_data {
>   * @wake_token_sz       : size in bytes of the wake_token
>   * @tfm_count           : number of active crypto transformations on i2c client
>   * @hwrng               : hold the hardware generated rng
> + * @ready               : hw client is ready to use
>   *
>   * Reads and writes from/to the i2c client are sequential. The first byte
>   * transmitted to the device is treated as the byte size. Any attempt to send
> @@ -145,6 +146,7 @@ struct atmel_i2c_client_priv {
>  	size_t wake_token_sz;
>  	atomic_t tfm_count ____cacheline_aligned;
>  	struct hwrng hwrng;
> +	bool ready;
>  };

I don't think the ready flag fixes the race. A concurrent tfm can still
bind to the shared I2C client after atmel_ecc_probe() adds it to the
global list and marks it as ready, but before crypto_register_kpp()
fails.

Thanks,
Thorsten

