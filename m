Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582BA107BCEF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 04:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beBHipiBLGBskqYpaEQxbecGZ7A9t6EKqQ5iaWL8ofU=; b=wvntU09/6JaXfyhSJOxeuryqpu
	ThlNFYgfwBsviu87qlZqG+Gfx9k1PDJrZS78IbK8Vmc6gnfXGwYvSqXs9aId8Wlc4Omf6bxiQeVNw
	n5zsUXfTk7xLAfW0Cn/Lk68FUNv6kZgnMvFaclAeOfp42cbNHiAq9cMM2HZfWUJoI+21ihmn5WAgQ
	jzbUrTosJVEGd6KVuyAx1bNaOqjIA6KE7CUjxUFxY7FoD2o0K+vHNY6sZqgsU0jOGIUGMfLTRa5nP
	Pi+qHjInMlDZCg4Otib1WoKry123OgfhzfLjEfoWquNCPAsKyqTBRh5gXz8fli0P66TuDv8D9LZcg
	9HfUOiWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1GSG-00000001TfL-1Tva;
	Sat, 14 Mar 2026 04:18:24 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1GSD-00000001TeR-2yGq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 04:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=beBHipiBLGBskqYpaEQxbecGZ7A9t6EKqQ5iaWL8ofU=; 
	b=kBQINsA8Ayjj9cYKT7OiAyx9CBBWNi7DUBA0dz5L/kHhshEspBsJv7ftdL6MveE6ryVUjY94SoU
	Id3V4jPhqW+J3zIrW/Oh9McM3k7Vbt/4BDxYxAoDvystUYomd5JR7AvcqJS4FvRbz35ONIJlJb8BP
	XzoFev9ocAde2PJx7qWCKE5K/yjLC9VLk6Ue2/HUDJt5t+73wh6H4jS79dtjcKvxPtq7wQ2yiouD8
	R/QBpVUwA3+9WguecFNJcykTwV3qh3fxNYHAdk7OwRPwU+rdlN7IqNl/5bJO1vNSlO/E7Smmi95bH
	rpye9GO3sOE+3Jr+ctcPg+4/rCTJBYGcQO3w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1GRb-00EKe3-0x;
	Sat, 14 Mar 2026 12:17:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 13:17:43 +0900
Date: Sat, 14 Mar 2026 13:17:43 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Lothar Rubusch <l.rubusch@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix potential UAF and memory
 leak in remove path
Message-ID: <abThZ1cBEv8de9eA@gondor.apana.org.au>
References: <20260221190424.85984-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221190424.85984-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_211821_746413_56FE0054 
X-CRM114-Status: GOOD (  14.98  )
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

On Sat, Feb 21, 2026 at 08:04:25PM +0100, Thorsten Blum wrote:
>
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> index 0fcf4a39de27..3afad915aae3 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -190,10 +190,10 @@ static void atmel_sha204a_remove(struct i2c_client *client)
>  {
>  	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
>  
> -	if (atomic_read(&i2c_priv->tfm_count)) {
> -		dev_emerg(&client->dev, "Device is busy, will remove it anyhow\n");
> -		return;
> -	}
> +	if (atomic_read(&i2c_priv->tfm_count))
> +		dev_warn(&client->dev, "Device is busy, will remove it anyhow\n");
> +
> +	atmel_i2c_flush_queue();

How about only checking tfm_count after flushing the queue?

Removing a device that's in use isn't really something that should
trigger a kernel warning, unless it leads to an unrecovereable
problem.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

