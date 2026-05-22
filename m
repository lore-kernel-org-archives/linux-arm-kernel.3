Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD86ACD5BB7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=logEAC/y6L8OMdAdQxzGzvXVtC+AZZLeeQZx7UaemU0=; b=l08nixkRQT6SSC+wUK9VyXyhMU
	xX8HPwOOcwVEP4OkvydXGIBt6JCiZSr/TQHTmjFl4Bvkh2blJJC1E/QgajftbcRlmevUtcvm7jgRA
	Uj+OUV4X7DRQ7DiNEEsdiJVgle/6vNGY3uG2hiTeXaWwW47Jrch2JVLpqPZ6ejbP92vsBgjNP5Mpg
	YNGi+/9m2J12UovQR/wBAhrW8YpqQHBBHci42yK+rdk8YwIL6oyoE8avgGA7+lYnQrFGFklkpHgbr
	tlBDK/wmrdIOe8LyFBX2zD/m43Sy5sdBEE7kCo+xwO8X3Hc9MSe3VnFoZ0d+ePk7PKpALDkbBHFCf
	hVpLQJvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP5s-0000000AoCA-2eYj;
	Fri, 22 May 2026 12:35:12 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP5p-0000000Ao5W-1moZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=logEAC/y6L8OMdAdQxzGzvXVtC+AZZLeeQZx7UaemU0=; 
	b=o2FhxGqzI7ZpPAcZevMwy7MeFY2tXAs4aF4OwdQXTc7oH824ip9P1JMid0mdIRnGni7Mk7O6v7Y
	ng8Qo/pQS9QRy00lInKho97NCd0tk8nwWxaaIFXvf/Jmv4UKUCZGlZSP84Y4jU/dEZWj8dDcltNbL
	xKoTG0Yeyc1/URKNcym0qLhmVpKLzcOuOsycsl+yi+xWK2cmmuEmoJWRRMgw8dczRSdWYzUQthPZ8
	9u8wTOZnIjJUYEfdfJvZmid6H8GIlLp12ox6M5PzQX2EirDab/RDI98nV0Q2euZrLyVF4S6rTIkXj
	CPPR/XwOc+nmMBnR5po6Zqzg4WC0BXxReHBA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wQP5e-00GSTG-09;
	Fri, 22 May 2026 20:34:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 May 2026 20:34:58 +0800
Date: Fri, 22 May 2026 20:34:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha - use memcpy_and_pad to simplify
 hmac_setup
Message-ID: <ahBNcrfyKD5mwQ0Q@gondor.apana.org.au>
References: <20260516234211.1131137-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516234211.1131137-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_053509_475311_B32BD95F 
X-CRM114-Status: GOOD (  10.85  )
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

On Sun, May 17, 2026 at 01:42:12AM +0200, Thorsten Blum wrote:
> Use memcpy_and_pad() instead of memcpy() followed by memset() to
> simplify atmel_sha_hmac_setup().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

