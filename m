Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7A9D3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 09:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PklN9qjVdwXRT0hpbQhT8EuFAzT1yIiMNZYzqBnPsj4=; b=q8W/sRzKONnJlniEKUrqZjhYYk
	1Q9uAL0WF0pQ4qQX0JUK5mSioYIENGeCjDj33YJ1aEnnYFz7xyskbHzb/efA83EK+yOjVR/a9FCcT
	eTi5br5mCCm13Q/ZiR0dM1TUV86TJ1UfUUfbYi4hBbkHJ8FZlIpeUx9w+2FrR6fa9nT5IC1TEi6gt
	rVanFGwk/IJN5QbR/bARu6b3X7VnnlNmx27sMI8w6FPRbZYsn95Ayx+XnYowNAI72c9M1tav/ogUC
	4PXvwz1w/gHuhVJEiLNiG3WL36Nzvtmm8nqqJnJveSMSOZ0zMOERKjJ69Y7Tp9Q0S/cGVl1f29aZZ
	Qkj2yEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGP0-0000000FHOP-2ryd;
	Wed, 10 Dec 2025 09:22:30 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGOx-0000000FHNY-0AB4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 09:22:29 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1765358541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PklN9qjVdwXRT0hpbQhT8EuFAzT1yIiMNZYzqBnPsj4=;
	b=WRWSPyLejzpcnsjbUS08zjmJcLC7hMYcMhs/SL9T6pBBLDpre9306yWY4ZjEpr9h/NvvSR
	R8lfjIeYm5jwRb+9NMQqme1ADcMJ14BBnEXRTSCA8WUD3g20jXDNuS8TYQW8+WMYrl0XSN
	rGw6LAcn0QbZQPjeW9wUmrBDEX9gBEDCx2diLWpqH12+PuKUYQmrWNdRUeD1L5x4LG3WZS
	xIVvfOicoUi7UXQn1EW2NL58PN9XRSthDATP82JQtOodLZjootXhCdaHr7GAvNuZ9A8d4w
	TysBhi/Rk4lS6OlUG2WCKMTD2hU6Nn37kW5aYYHLqE8XnxKYM05y8lYrvS9hOQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 10:22:19 +0100
Message-Id: <DEUFDH7FJURL.3J0FN5I19VV8F@cknow-tech.com>
Subject: Re: [PATCH] crypto: arm64/ghash - Fix incorrect output from
 ghash-neon
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Eric Biggers" <ebiggers@kernel.org>, <linux-crypto@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, <linux-arm-kernel@lists.infradead.org>,
 <stable@vger.kernel.org>, "Diederik de Haas" <diederik@cknow-tech.com>
References: <DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com>
 <20251209223417.112294-1-ebiggers@kernel.org>
In-Reply-To: <20251209223417.112294-1-ebiggers@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_012227_700916_5E8C34C0 
X-CRM114-Status: GOOD (  19.80  )
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

On Tue Dec 9, 2025 at 11:34 PM CET, Eric Biggers wrote:
> Commit 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block
> handling") made ghash_finup() pass the wrong buffer to
> ghash_do_simd_update().  As a result, ghash-neon now produces incorrect
> outputs when the message length isn't divisible by 16 bytes.  Fix this.

I was hoping to not have to do a 'git bisect', but this is much better
:-D I can confirm that this patch fixes the error I was seeing, so

Tested-by: Diederik de Haas <diederik@cknow-tech.com>

> (I didn't notice this earlier because this code is reached only on CPUs
> that support NEON but not PMULL.  I haven't yet found a way to get
> qemu-system-aarch64 to emulate that configuration.)

https://www.qemu.org/docs/master/system/arm/raspi.html indicates it can
emulate various Raspberry Pi models. I've only tested it with RPi 3B+
(bc of its wifi+bt chip), but I wouldn't be surprised if all RPi models
would have this problem? Dunno if QEMU emulates that though.

Thanks for the quick fix!

Cheers,
  Diederik

> Fixes: 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block handlin=
g")
> Cc: stable@vger.kernel.org
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Closes: https://lore.kernel.org/linux-crypto/DETXT7QI62KE.F3CGH2VWX1SC@ck=
now-tech.com/
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> If it's okay, I'd like to just take this via libcrypto-fixes.
>
>  arch/arm64/crypto/ghash-ce-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-=
ce-glue.c
> index 7951557a285a..ef249d06c92c 100644
> --- a/arch/arm64/crypto/ghash-ce-glue.c
> +++ b/arch/arm64/crypto/ghash-ce-glue.c
> @@ -131,11 +131,11 @@ static int ghash_finup(struct shash_desc *desc, con=
st u8 *src,
> =20
>  	if (len) {
>  		u8 buf[GHASH_BLOCK_SIZE] =3D {};
> =20
>  		memcpy(buf, src, len);
> -		ghash_do_simd_update(1, ctx->digest, src, key, NULL,
> +		ghash_do_simd_update(1, ctx->digest, buf, key, NULL,
>  				     pmull_ghash_update_p8);
>  		memzero_explicit(buf, sizeof(buf));
>  	}
>  	return ghash_export(desc, dst);
>  }
>
> base-commit: 7a3984bbd69055898add0fe22445f99435f33450


