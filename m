Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C728FEE4D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 08:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsXOzrHHZ0tUT/4bwgWhtkJZOaxenpihvowg1HuQPg4=; b=lg/NfLR5RY2jIrJlmNipX6f91T
	Ju9/lgih9rtHhftq3xpT6EvSNJJOAaZZVyDKhvBrTugv2+4fXyPz1VuQZYzmJzXe/bO1PQpfiYjud
	oAEZllKlkNt4dLfkamn0zkvcM2/nVvfl9n7LQTVOqZ2zMx2JpSGX2f45qKZ6zESZ25fqnG2lLZMTZ
	TnbQC4ixvSq7+meKo/q/y2mHuz2TkLWf5YP2YKFrsMLUIjgNqi3o19my4zMu+MbOstUvJr5iruea7
	+ORCdQiOJmIEXXf+Ty3S7NxK5a25YY7kT9aj7Apl/jt4Q1zhgFi1DvxZZ5Be4EcfJpHmklyEwnjBd
	GAtywxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwG07-00000009fHq-0fac;
	Sat, 28 Feb 2026 08:48:39 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwG04-00000009fHT-40ZK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 08:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=tsXOzrHHZ0tUT/4bwgWhtkJZOaxenpihvowg1HuQPg4=; 
	b=i27Fe8IDV/Zy0Tvn6brDAjzU7vGppITK+vxsmf4+E2xBrKpkzAmyhXlpCuv+LwyAISi6uan16Vx
	dDpcryPOfoE5of3FSDOKYxuntvK/zWcc7ZneYTE8DgE3xcCf0mwEEK5rauobjg8Ej6N2pUHf3H4zn
	q9y9VHdCjrX5MB/6DOa4dsNf1NF8oMrP7tg09X32FWpDWkdFwyEFdfxdpY36TogG0E01cBmIJsan0
	Vrw/bhNC67A4nc8rJWrE0nsrnvuTjI9UZ+hnn8M9/ixqBQEWDZKChG3X+6uNCHMtfZgMmwFHieNzH
	zmW6soVvMpRYC1SQZFIfiluH5iE78lT0tJVA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vwFzo-00ADsA-24;
	Sat, 28 Feb 2026 16:48:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 28 Feb 2026 17:48:20 +0900
Date: Sat, 28 Feb 2026 17:48:20 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lothar Rubusch <l.rubusch@gmail.com>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix error codes in OTP reads
Message-ID: <aaKr1E1mPOgxo0JL@gondor.apana.org.au>
References: <20260215205152.518472-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215205152.518472-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_004837_018306_B00CF3B1 
X-CRM114-Status: GOOD (  14.80  )
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

On Sun, Feb 15, 2026 at 09:51:53PM +0100, Thorsten Blum wrote:
> Return -EINVAL from atmel_i2c_init_read_otp_cmd() on invalid addresses
> instead of -1. Since the OTP zone is accessed in 4-byte blocks, valid
> addresses range from 0 to OTP_ZONE_SIZE / 4 - 1. Fix the bounds check
> accordingly.
> 
> In atmel_sha204a_otp_read(), propagate the actual error code from
> atmel_i2c_init_read_otp_cmd() instead of -1. Also, return -EIO instead
> of -EINVAL when the device is not ready.
> 
> Cc: stable@vger.kernel.org
> Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp zone")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only.
> ---
>  drivers/crypto/atmel-i2c.c     | 4 ++--
>  drivers/crypto/atmel-sha204a.c | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

