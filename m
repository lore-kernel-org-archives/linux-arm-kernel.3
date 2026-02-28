Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53FBFEE4D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0OLv0rMh/lHV5pn6AIxNiBVM0NjCrHfD01jvogvUwY=; b=ZiZ3jTer64x4W/lcelaC8Rgt4I
	29OOeqPvc88IStsYX67r6iK329QDhz44S6Az1fZvzeRi7eUDAebkR8EDz8t1KVpev5gSxFpfm3328
	7aCQoxBg2IE9lUu13GED+ygwF1OkYSYSgqaPgr/0RmtONciRiSCvp6glAQHDOqpHrFQ/6PFeRCwXx
	R6XNsLN1EabEOlJtru7vdfdKVmJ1xqKWzDGZ7g78QZWd2XYx05S1GjfyCZoQpRV/0BK/yBSuKZyl5
	gz24jVeP/hPQZhBWdtET+G7k/MXKsVKj+tUbmZ8rGMCI2/ZzMLwzqR8fpofAJwIT5OmWfZJ0rdgOZ
	USFmaVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwG8M-00000009fgF-37aB;
	Sat, 28 Feb 2026 08:57:10 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwG8K-00000009ffu-0Iwm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 08:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=D0OLv0rMh/lHV5pn6AIxNiBVM0NjCrHfD01jvogvUwY=; 
	b=f+ETSCiPld6uMKVotwPuHd5HuG8X8vemB4uiuxvA0eL6rA/vcdOeDnKA6uN0j0rUl1eMz+8sAzw
	J3HksdvnA9PGQs+p+wMvIc44uYTkhXV0MFZl8o8TH/E93PIuSKDedgo9jjzGwBCQDPkTX38X9+0+A
	uqNkYLzLElsjCE87xrIS7uFSKRiqKij2z70Gp6duWZtSTa4dafWSjpMGrrlroBfIAl09YTiLxRNfT
	ApCx6rqY0c9RW11Iw8DQEXQ9iwp79HRFlWkg9gnu0NNmqYUMvPq/sA5E16kFf+0wZjVvwEctmMssg
	ZxRGJDyz8diYx0Q2TycQC4OdkP03Efk2ZVhQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vwG86-00ADwk-3A;
	Sat, 28 Feb 2026 16:56:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 28 Feb 2026 17:56:54 +0900
Date: Sat, 28 Feb 2026 17:56:54 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix OOM ->tfm_count leak
Message-ID: <aaKt1lTAwjsOMzz6@gondor.apana.org.au>
References: <20260218235358.973341-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218235358.973341-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_005708_387354_C3942F94 
X-CRM114-Status: GOOD (  11.30  )
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

On Thu, Feb 19, 2026 at 12:54:00AM +0100, Thorsten Blum wrote:
> If memory allocation fails, decrement ->tfm_count to avoid blocking
> future reads.
> 
> Cc: stable@vger.kernel.org
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

