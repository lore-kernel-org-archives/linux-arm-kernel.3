Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E908DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h802mIkXadPL8h5kJf2NzfoZ7DRWSCCV9EHtJsZgnII=; b=m8miJcysLeYWg5r36iiY0W5FuG
	Wm7S6x/7qeKOHYh3LmTr+RY0tMkYi3gGzHWbf9iP++Mw4sFyl/EuLeIFrN9/7MoloxMbmGAV2Eclt
	yziGT3LixRi05b/sfV08W2MLei6l077wTXlmROjweUMHjxDLgKTLt9EoZhWm0LxyBlU8El+fu9xoj
	B42s4IcOV2ZhKuKzmkgaE4FGKeCx0WkAgrQIEjGz+LkQh9+CpkPGwK8MCkwPm7S6etXeg42FknWkP
	rP104N15wUS6aWc48M/LtCUAX3UdTnS+8zqBYpOEqZ8ier4d7IZqVDeMN7RPDfB3hWYaybLCYFkOv
	iiM91N3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdjV-00000001b5b-0zv9;
	Fri, 17 Jul 2026 08:15:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdjS-00000001b4a-3H7v
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h802mIkXadPL8h5kJf2NzfoZ7DRWSCCV9EHtJsZgnII=; b=Iw9W7wkM/3Yuz4IT8vMa8AzZy9
	Vk0fg+QomOEgFsUIunoKzzJYZQSYM4dUjXSLxRpNq7oc0nZNPIYUbCqLblc+jJq5c5IhTQ2eCw/J7
	azUX380bWKj2q2hNPSI2UDfni2zrq3SfdL4BF6M1kffq0M/WYC1/iBbbkIT6BzDfYpTVuiTxyPlfY
	1bggE4QAm8bjWIDMJ9Q3CS2hWR+BdOe8yNdQhD0bU+wZZl/65M1tQTjTLcMfFpT+28SuVZIjJHD0o
	tCirdMoAj7/aj37SQi5ra4X7MgpiWWUXAduHK2XI1ETyaxO1z1lUqlqDKlrtYQjp7mko/62lu8skH
	aReShJMQ==;
Received: from abb.hmeau.com ([180.181.231.80])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdjP-0000000EegJ-3MV0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=h802mIkXadPL8h5kJf2NzfoZ7DRWSCCV9EHtJsZgnII=; 
	b=SSfj455B+j3RDqYl1JB0EnsLF0YfW9+5flLDp7oIr/iZ7mYJMykG47h3U2EpVCGo04fzH9snVTy
	myQrbHNGhg6s4TYKq0n/hew8cvlDti6hVvRqAzVzqXfrfmcKkyD9MvKJwnkmXs1OOoQkO2xdH+eVx
	P0Jj/utSfbfNp/VLWS333M4rGhcVcWnJiyjqHG1Be5g83njcoofjg9sZwsfvh4HDDVzO5Z9WHxKC5
	Ldg4+cO+W9/LnqynJZRliTYFog9zLXAqYbAxcCzcZAEqEr8F1r8zSJZp4BjoJGW1rTv7MRm4YSgT8
	7vZpJBaH8j1SZ0OHcn6ykKluOzVaDU9/Njpw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wkdjG-0000000EO8E-3qHx;
	Fri, 17 Jul 2026 16:15:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Jul 2026 18:15:30 +1000
Date: Fri, 17 Jul 2026 18:15:30 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - avoid stale fallback key after
 set_secret failure
Message-ID: <alnkovFqUjXzGmxy@gondor.apana.org.au>
References: <20260708204246.618591-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708204246.618591-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_091540_025491_0A21102F 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed, Jul 08, 2026 at 10:42:48PM +0200, Thorsten Blum wrote:
> Clear ->do_fallback before decoding a new ECDH secret and enable it only
> after the software fallback accepts a caller-provided private key. This
> avoids using a stale fallback key should crypto_kpp_set_secret() fail.
> 
> Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

