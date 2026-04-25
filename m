Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB85FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 13:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0hqEuCjufidz3WpMiDJQn1B0N1f62LrlXp0GvFTQv8=; b=it4Jj1eN4sKbuzipbXFNwq7mI4
	7fFvV5CdQnv+pkx9TGlh0hGE9hrTJ0jHQ1WPhFbjPwG74Utf2RlC/fxn+tGRflwKeadGVr7Gx1wg+
	VIN16eIS4QjJJddJtRBkn7pUnuPHWjsy1Fd4JcjuSJst3SayP3E15l4MCvznVtOzfiHBWZWX64XPC
	2o9FncTkRJlHulLRTnjSeFQvNCCfvZqX4CuaDZHVeaMAzK5oJ5p1shXpjnRufXycIdqk5s60H4D8v
	K4rRjdreb5meW4BjQONc0IOb6KX1V6sWNu+Req2JS1uBlJQNZrHsoVH70vEbneYhI2Jf2tSEskX8Y
	upJUDLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdLM-0000000EUCp-2yCC;
	Sat, 25 Apr 2026 13:46:48 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdLJ-0000000EUCI-1xtc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 13:46:47 +0000
Date: Sat, 25 Apr 2026 15:46:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777124790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H0hqEuCjufidz3WpMiDJQn1B0N1f62LrlXp0GvFTQv8=;
	b=rFpU0CSL8Civ9upF9vM7HOZJ37ehLH88cCWIyTFhdB6cJXPgIGkUAGyM1/1ZydD+9MRhJG
	qTvDAo+RhgCQXLjBi3zqNDAf3NPzoNTr1NTzYLwefauyngMAJH3qIlkDCeH8db0oHNAuuu
	c07hVKzE7pLBiwnOz9k8HASdCKYPlTQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, linusw@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] crypto: atmel-sha204a - fix truncated 32-byte
 blocking read
Message-ID: <aezFsF8gLkABZZ1O@linux.dev>
References: <20260422210936.20095-1-l.rubusch@gmail.com>
 <20260422210936.20095-3-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422210936.20095-3-l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_064646_046751_05232A45 
X-CRM114-Status: GOOD (  24.55  )
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

Hi Lothar,

On Wed, Apr 22, 2026 at 09:09:35PM +0000, Lothar Rubusch wrote:
> The ATSHA204A returns a 35-byte packet consisting of a 1-byte count,
> 32 bytes of entropy, and a 2-byte CRC. The current blocking read
> implementation was incorrectly copying data starting from the
> count byte, leading to offset data and truncated entropy.
> 
> Additionally, the chip requires significant execution time to
> generate random numbers, going by the datasheet. Reading the I2C bus
> too early results in the chip NACK-ing or returning a partial buffer
> followed by zeros.
> 
> Verification:
> Tests before showed repeadetly reading only 8 bytes of entropy:
> $ head -c 32 /dev/hwrng | hexdump -C
> 00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@..........|
> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000020
> 
> After this patch applied, the result will be as follows:
> $ head -c 32 /dev/hwrng | hexdump -C
> 00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h....n.i|
> 00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;.....ESL.|
> 00000020
> 
> Fix these issues by:
> Increase cmd.msecs to 30ms to provide sufficient execution time. Then
> set cmd.rxsize to RANDOM_RSP_SIZE (35 bytes) to capture the entire
> hardware response. Eventually, correct the memcpy() offset to index 1 of
> the data buffer to skip the count byte and retrieve exactly 32 bytes of
> entropy.
> 
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

Thank you for your patches. I tested patch 2/3 on real hardware and it
fixes rngtest for me. However, I have a few comments below.

> ---
>  drivers/crypto/atmel-sha204a.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> index 19720bdd446d..f7dc00d0f4cd 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -19,6 +19,9 @@
>  #include <linux/workqueue.h>
>  #include "atmel-i2c.h"
>  
> +#define ATMEL_RNG_BLOCK_SIZE 32
> +#define ATMEL_RNG_EXEC_TIME 30
> +
>  static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
>  				   void *areq, int status)
>  {
> @@ -91,13 +94,15 @@ static int atmel_sha204a_rng_read(struct hwrng *rng, void *data, size_t max,
>  	i2c_priv = container_of(rng, struct atmel_i2c_client_priv, hwrng);
>  
>  	atmel_i2c_init_random_cmd(&cmd);
> +	cmd.msecs = ATMEL_RNG_EXEC_TIME;
> +	cmd.rxsize = RANDOM_RSP_SIZE;

atmel_i2c_init_random_cmd() already sets cmd.rxsize to RANDOM_RSP_SIZE.

Changing cmd.msecs does not appear to be strictly necessary for the fix.
The only difference I observe is that rngtest runs faster with the new
value.

Here are my test results without changing cmd.msecs:

$ sudo head -c 300000 /dev/hwrng | rngtest -c 100
[...]
rngtest: starting FIPS tests...
rngtest: bits received from input: 2000032
rngtest: FIPS 140-2 successes: 100
rngtest: FIPS 140-2 failures: 0
[...]
rngtest: input channel speed: (min=1.118; avg=3.746; max=6510416.667)Kibits/s
rngtest: FIPS tests speed: (min=26.272; avg=27.471; max=32.829)Mibits/s
rngtest: Program run time: 538942640 microseconds

and with 'cmd.msecs = ATMEL_RNG_EXEC_TIME':

$ sudo head -c 300000 /dev/hwrng | rngtest -c 100
[...]
rngtest: starting FIPS tests...
rngtest: bits received from input: 2000032
rngtest: FIPS 140-2 successes: 100
rngtest: FIPS 140-2 failures: 0
[...]
rngtest: input channel speed: (min=1.584; avg=5.295; max=6510416.667)Kibits/s
rngtest: FIPS tests speed: (min=26.602; avg=27.321; max=28.257)Mibits/s
rngtest: Program run time: 381309284 microseconds

>  	ret = atmel_i2c_send_receive(i2c_priv->client, &cmd);
>  	if (ret)
>  		return ret;
>  
> -	max = min(sizeof(cmd.data), max);
> -	memcpy(data, cmd.data, max);
> +	max = min_t(size_t, ATMEL_RNG_BLOCK_SIZE, max);
> +	memcpy(data, &cmd.data[1], max);

This works and fixes rngtest for me on real hardware.

min_t() is not strictly necessary here, since the types are compatible
and min() is sufficient.

I agree with Ard that patch 2/3 should be a separate patch for easier
stable backporting.

Thanks,
Thorsten

