Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAFDD58B08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 04:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0a05xrtiPpxE3Z9dHfRgJgsJ67Benwi/QX1wvO2tNlM=; b=ZVfZqngXlL287y+AjB9dVnzvSl
	JzMVNMvG3akS/3uHyYC1rrSL1YUQad9SuglRkfkAUWB4ozm3mUh2DcXMMB+Ehq5j4VG5BaYsyQEul
	vBamjgzMeaPcwCl5jHJheYLNC7knOpbH1X56/l9YGzqeV1Inol2OTDaLqp2ralhoViSLgLnQTsSgh
	QxI29zn9YK6kijn9xrBIB3GSyylO82yilTowkyXhURRNeQ4hpZiQPLNhjiIj/iykM7Ygk/6A40rlb
	EiQNGKBl6nsgF5Dbh/AjyFqAI9F/+5TP+pogeZ00Mc8DFe/iIVVX1zN9ws2C2Yvz244fvgMUiKi9B
	zw3cw1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1d92-00000002NRj-2EaB;
	Sun, 15 Mar 2026 04:32:05 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1d8x-00000002NRM-2K1i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 04:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=0a05xrtiPpxE3Z9dHfRgJgsJ67Benwi/QX1wvO2tNlM=; 
	b=bSWKC9mSKhFgB8Q6XBtwZybMpo/+6FxioY0v9UkSoWJ+EgcUC9qXR3EEioMSdIHffhEKHlnCi/T
	r6spL5KL1XNHSHl+AqMlN12IU98rQh4oxuyeih2Qq5aOusdn40KxzQkWHIEZUUeKinPmFSrSn5sG6
	H2kQwiiSgxUcXQ18otE0x4a0YNfpYJSjbzKGlEpUOYd7YREnSvLkFkDYTMrir6WqiqoKksdVD5h+v
	vF0WcfsiW45T6yx5kfwwG+UVpTfKm/36upzRn5xHXuWH/iuj0c4L9NbQWufFX0lw/oM+0LSkOn0s8
	lf5RolU1Zrwg2B48IpJ5QySxIkBBQZ9ST5zA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1d8P-00EXUJ-32;
	Sun, 15 Mar 2026 12:31:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 15 Mar 2026 13:31:25 +0900
Date: Sun, 15 Mar 2026 13:31:25 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-sha204a - Fix potential UAF and memory
 leak in remove path
Message-ID: <abY2HdOs0768G8G3@gondor.apana.org.au>
References: <20260314193627.728469-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314193627.728469-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_213200_345103_EBCA4B7B 
X-CRM114-Status: GOOD (  12.84  )
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

On Sat, Mar 14, 2026 at 08:36:29PM +0100, Thorsten Blum wrote:
>
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> index 98d1023007e3..aeadbc9a2759 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -191,10 +191,8 @@ static void atmel_sha204a_remove(struct i2c_client *client)
>  {
>  	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
>  
> -	if (atomic_read(&i2c_priv->tfm_count)) {
> -		dev_emerg(&client->dev, "Device is busy, will remove it anyhow\n");
> -		return;
> -	}
> +	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);

Is it OK to explicitly call devm_hwrng_unregister?

Perhaps it's best to remove the devm management?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

