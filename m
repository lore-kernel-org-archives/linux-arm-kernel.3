Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3020FFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObaiCAI4T+PEU1s+O8KM5vkukZXBFwC8gCTPrznuofU=; b=ZBFWjHSe7+L0LCC85VfQIKd4gK
	m8dzg1aJ7A7fizFR9r9qfLXvkgiU8k2UL59btSXognWX451BOmWuhLjIxoqG8wLhfKJXqVI5YGcR4
	khGcVOatFrayreD1eRLwcJKq9FZ1mFqNJlLhiLN5c/VDIsIpViw8+6v69ZCk2x3XWl8Tt8ybyXuHF
	OC8G6xgY0cRzlXPyhR7mPbTCCcSx8gtHY88j6mtBFRk7Avx2fT6Wxy7zI5vv4FFyM8JnC+ykLjE+m
	MGCojVnCdXj2waTfBQ9ewtVeLyvgAyuEhxRsn3Hzw3qc5H/U3ZgqHA8Mw57eGqGBUiRLjHIwoV28D
	StJ3GNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH2Zi-0000000Fi7n-0HF6;
	Sun, 26 Apr 2026 16:43:18 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH2Ze-0000000Fi7D-0GD2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 16:43:16 +0000
Date: Sun, 26 Apr 2026 18:43:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777221787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ObaiCAI4T+PEU1s+O8KM5vkukZXBFwC8gCTPrznuofU=;
	b=L8h3twjJ6tUkR6vF4n5uyVtZhtRZ+BxXpb/mpeLTCB5U+seZQCWKxwHONIPj+04lAxsG8B
	d1/iN1GL1jZcZ+iGy3L6W1ZJMk/VsMkbnsIlXyp+LgWolm5t948KS5OmAUzIcPfWW/A+DK
	ojusRegmltAmkc8xDc9FmwBeNtNywWs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, linusw@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] crypto: atmel-sha204a - fix non-blocking read
 logic
Message-ID: <ae5AlBP3EvS-Fe6w@linux.dev>
References: <20260426154940.24375-1-l.rubusch@gmail.com>
 <20260426154940.24375-2-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426154940.24375-2-l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_094315_215039_433A2EA7 
X-CRM114-Status: GOOD (  18.89  )
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

On Sun, Apr 26, 2026 at 03:49:40PM +0000, Lothar Rubusch wrote:
> The blocking and non-blocking paths were failing to provide valid entropy
> due to improper buffer management. Read the buffer starting from bit 1,
> only fetch the 32 bytes of random data of the return message.
> 
> Tested on a Atmel SHA204a device.
> 
> Before (here for blocking) tests showed repeadetly reading reduced bytes of

s/repeadetly/repeatedly/

> entropy:
> $ head -c 32 /dev/hwrng | hexdump -C
> 00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000020
> 
> After, the result will be similar to the following:
> $ head -c 32 /dev/hwrng | hexdump -C
> 00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
> 00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
> 00000020
> 
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
>  drivers/crypto/atmel-sha204a.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> index dbb39ed0cea1..39a229086a84 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -48,8 +48,8 @@ static int atmel_sha204a_rng_read_nonblocking(struct hwrng *rng, void *data,
>  
>  	if (rng->priv) {
>  		work_data = (struct atmel_i2c_work_data *)rng->priv;
> -		max = min(sizeof(work_data->cmd.data), max);
> -		memcpy(data, &work_data->cmd.data, max);
> +		max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
> +		memcpy(data, &work_data->cmd.data[1], max);

Please use RSP_DATA_IDX instead of 1 as the index.

>  		rng->priv = 0;
>  	} else {
>  		work_data = kmalloc_obj(*work_data, GFP_ATOMIC);
> @@ -87,8 +87,8 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
>  	if (ret)
>  		return ret;
>  
> -	max = min(sizeof(cmd.data), max);
> -	memcpy(data, cmd.data, max);
> +	max = min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
> +	memcpy(data, &cmd.data[1], max);

Same here.

Thanks,
Thorsten

