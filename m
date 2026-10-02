Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD97CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PWBOAxh6pB7yhyuxCFuZWO6P8AnQ9qs3MPE/RqHYsc=; b=toxTq0rbWHLI2EGhKH5JkLRxLk
	1q8gKiskRpVscp2gS9kYrMBEwRrgzdr+RSKTuskEMz85PB9xl/uA3DvSzCFXXBaPLP5bKsJArQ9oK
	ZP9JQY+7ElDHqOfUGA7X8a6wBjDTjv6xbqsOeSIrU/wa2USha8HIWaHbl7yBEWgNekL+Cf8W0r++N
	NMUS/rRbk1ySHWGqlj+xsxZJFXbZcmjcyeNTUpQMrS7PLavGs3NEcFn57oZyfivGYWesrRP2ZqNdd
	ztgz4ZBij672r7xKog/BbYffUFpXNb97mobx3uF8hl69YOeZAjvxGVKj2Cnn/rtrOSVlYUH/WnvCp
	NLKPMjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYXc-0000000AyRh-3qyW;
	Fri, 02 Oct 2026 08:22:52 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYXZ-0000000AyR0-3mZc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=0PWBOAxh6pB7yhyuxCFuZWO6P8AnQ9qs3MPE/RqHYsc=; 
	b=WY+d0LJZDoCgQ3bUFxOJ7aME+oR4uwFqTy1VSx8d1HhSHu0OXzaaQdIRDTnJ/8sOkFD4tSI4RD/
	HfjcuxcfrPKV5E6QAXLkCvQGDlNM1EbdXQFqnC1Ds1jSOU1A7UPlVQ8ezAKSAbf4sf9C3cqvn7kZh
	ljA/d5MmOsysbttYJ/+9nNxnC3Oce+wgCc51jck5+QuTwIZbARxHx4+Cu2dEhdUUzQBtb6yBhWKc7
	M87cVBz4eAQd0muXmsZNiO8Uf4ouXfV5Ay30tucjv5eaOM0GmYESAgty0BjP334L+YC6uXebaA073
	jXueFzfHiYiBhQq8aCN5SYbyuXnh9JsDk6TQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xCYXR-00000002mcO-45Rh;
	Fri, 02 Oct 2026 16:22:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 02 Oct 2026 18:22:41 +1000
Date: Fri, 2 Oct 2026 18:22:41 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel: handle authenc requests without plaintext
Message-ID: <ar9p0Z7wA-5TDQA7@gondor.apana.org.au>
References: <20260922051705.15329-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922051705.15329-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_012249_941437_11EFD190 
X-CRM114-Status: GOOD (  15.72  )
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

On Tue, Sep 22, 2026 at 07:17:04AM +0200, Karl Mehltretter wrote:
> Authenc permits a nonempty associated-data string with no plaintext.  The
> Atmel driver accepts such a request, has SHA process the associated data,
> and then unconditionally asks AES DMA to transfer zero bytes.  The Atmel
> DMA engines reject the zero-length descriptor, so the valid request fails,
> normally with -ENOMEM.
> 
> Skip the AES transfer when textlen is zero and proceed directly to SHA
> finalization.
> 
> Once an HMAC transform has cached its inner and outer states, SHA can
> complete this path synchronously.  The forced ahash completion callback
> then invokes the AES finalizer through a void function and discards its
> return value.  This loses -EBADMSG for a mismatched tag and reports
> successful decryption.
> 
> For synchronous SHA completion, release the SHA device without invoking
> the ahash callback and call the AES finalizer directly.  Its result then
> propagates through the synchronous call chain.  Keep the existing callback
> path for asynchronous completion.
> 
> On a SAM9X75, the unpatched driver failed valid AAD-only requests and
> returned success for a bad tag after the transform had been used once. With
> this change, bad tags return -EBADMSG for both fresh and reused transforms.
> 
> Fixes: 89a82ef87e01 ("crypto: atmel-authenc - add support to authenc(hmac(shaX), Y(aes)) modes")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/crypto/atmel-aes.c |  2 ++
>  drivers/crypto/atmel-sha.c | 14 ++++++++++++++
>  2 files changed, 16 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

