Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C5CCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZvGsfpraU6oBDZ4RPThDPrlUZXNyfD9kScODFAv9r8=; b=1ePjrXlJYL21uYMCH2EXjEoypP
	vrt40VrpS8SlzHohfRw6X72fxG6besfFI/58ujEY5FcXmCitloApQZwrgUS8ATMNUn7wpA9ad+ZCR
	f3zyoTtrc2I4DOOleMz2ueuQHpd3IIIf9dClOcjPCh+5Kp2x/4+c1jqDJfhtSAk0TaKysT8gdhG0L
	p98XkUUVDHkTuykiv8hCmd4njFXEKs6KZUzeerNabkg1AByyeZDKXEz9WHSrwqFePB8K215CaAwZR
	Q4e1pM5Q8We36dpW+vFT6FVO4hLLNWeQocs3v6jTlzSi+QA3xm/pdquv+SyWhLCyvh6gQklrptdU5
	4Vpj1mXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYPFM-0000000CLoa-01sF;
	Sat, 13 Jun 2026 14:22:04 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYPFJ-0000000CLnr-0tsh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 14:22:02 +0000
Date: Sat, 13 Jun 2026 16:21:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781360515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eZvGsfpraU6oBDZ4RPThDPrlUZXNyfD9kScODFAv9r8=;
	b=DVVb9Ck2muSHWK5iJBtFSxAwQKlH91rRhb4Hp8Bp2DQ2/AK172e1Vccow58W0s3PZ3fbnO
	mXVqRI5DNhTYy+g08XLUi0WETYe8OcJJyTeu0KjW08Ck8Xfn60eDaYutmUh6yIqQP8t5Bx
	WNBVOYf8keiSUZgkV8nqZIZoz/DaBDI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - reject hardware ECDH without a
 public key
Message-ID: <ai1neXGLIQqSjlWl@linux.dev>
References: <20260611213617.463552-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611213617.463552-2-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_072201_398726_8576CFEE 
X-CRM114-Status: GOOD (  19.60  )
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
> 
> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index 93f219558c2f..542c8cc13a0f 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -173,6 +173,9 @@ static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
>  		return crypto_kpp_compute_shared_secret(req);
>  	}
>  
> +	if (!ctx->public_key)
> +		return -EINVAL;
> +
>  	/* must have exactly two points to be on the curve */
>  	if (req->src_len != ATMEL_ECC_PUBKEY_SIZE)
>  		return -EINVAL;

I'll need to rebase and resend this assuming [1] is applied first, as it
currently doesn't apply cleanly.

[1] https://lore.kernel.org/lkml/20260609100552.233494-3-thorsten.blum@linux.dev/

