Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8BACD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y82rbZe1VujLaE6CZRtDpj4MfmTk0fKLiDjnfPvTGnU=; b=le1cJXg+10qlHiLsKDS1M80SWI
	WO83zpSb0A8/d7nkom2IEqkG7UUC8t+qnJlijR2JAfGcXM6+qmm/WZA0x1K6Q/VBYOozn+EdTxZNn
	Fc9BvdnnmwVjXUS1G0gfOagbPeboUEiIIom1QTl7ORISVHt7SdBczgoKDUfpyWyLPRECUZzYbepI4
	VTaYYfyrend4rxGgoGom0yPb6aXfggOgdnaYWwyhjB2sC2uHA6fiqauk9ZsRrf6gQYsx5BRbKc5Ry
	1DeovrScxDq4SWXIVSy+n/yFgcfQNrz9QLnzXgj8qVaFl3c0lQzvTMrWSA554kKxyOG2v41j+iwLx
	GXvJgnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTgkh-00000009dfW-2uaf;
	Sun, 31 May 2026 14:02:55 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTgkd-00000009df7-4B5A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 14:02:54 +0000
Date: Sun, 31 May 2026 16:02:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780236157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y82rbZe1VujLaE6CZRtDpj4MfmTk0fKLiDjnfPvTGnU=;
	b=nlF5srIYN0OpgAWi0UzF6jNR2GkjqvMg5wYsLz5KZ815XrvemkP6D7obso1gikYM8fYEQC
	rjVeJS+5CZdKnAMbztr4laJ1fpQUX4dAKkTrq1jgiCBlOrPSfwYf5Ci0QXChQbFB5cW5ZE
	pj3Qqs+uS8hzZeO5QKefF3ednkRF4po=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, krzk+dt@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] crypto: atmel-sha204a - fix heap info leak on I2C
 transfer failure
Message-ID: <ahw_ddfEdC742YRb@linux.dev>
References: <20260529094336.33809-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529094336.33809-1-l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_070252_741182_7997F43C 
X-CRM114-Status: GOOD (  27.39  )
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

On Fri, May 29, 2026 at 09:43:36AM +0000, Lothar Rubusch wrote:
> When a non-blocking read operation is requested, the driver dynamically
> allocates memory to track asynchronous transfer status. If the underlying
> I2C transmission fails, atmel_sha204a_rng_done() logs a rate-limited
> warning but incorrectly proceeds to cache the pointer to this uninitialized
> buffer inside the rng->priv data field anyway.

The buffer is not necessarily uninitialized. cmd.data could also contain
a device error/status response or stale data from a previous request. An
uninitialized buffer is only one possibility.

Also, "rng->priv data field" is a bit confusing; maybe say that the
callback caches the work_data pointer in rng->priv instead?

> On subsequent execution passes, atmel_sha204a_rng_read_nonblocking()
> detects the stale rng->priv value, skips executing a hardware data read,

The cache-hit path still queues a new async read request and copies
invalid/stale data, but "skips a hardware data read" is probably not
correct. Did you mean the returned bytes aren't from a successful read?

> and copies up to 32 bytes of uninitialized kernel heap data from this
> garbage memory pool straight back into the system's hwrng data stream.

Same as above: it's not necessarily garbage or uninitialized data.

> Fix this information disclosure vector by immediately releasing the
> allocated asynchronous work data buffer and explicitly clearing the
> tracking pointer context whenever an I2C transaction returns a non-zero
> error status.
> 
> Additionally, duplicate the tfm counter decrement within the new error
> path to ensure the reference counter is properly released before executing
> the early return, maintaining the driver's availability for subsequent
> requests.
> 
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/crypto/atmel-sha204a.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
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

Setting rng->priv = 0 is redundant here. rng_read_nonblocking() already
clears it before enqueuing new work, and the ->tfm_count gate prevents
others from setting it.

> +		atomic_dec(&i2c_priv->tfm_count);
> +		return;
> +	}
>  
>  	rng->priv = (unsigned long)work_data;
>  	atomic_dec(&i2c_priv->tfm_count);
> 
> base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e

The fix itself looks good to me.

For a v2, could you please reword the commit message to be more precise,
and ideally drop the redundant rng->priv assignment? And feel free to
add a stable tag, as this should probably be backported.

With the above addressed, feel free to add:

Reviewed-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks,
Thorsten

