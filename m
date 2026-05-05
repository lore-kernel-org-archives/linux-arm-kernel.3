Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AACCD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNLOEXFxq4uiqG2FBjx7y5UulD3vGj5gX9vl2RjNT68=; b=SLYMrle259oJrmLmNA67SDEmKM
	CQPsWhT347JcDJOhlwSVbIfUDcZ8/VzsqmHbSq53QZSxhWw28gbXVA89tsXgvrEcjs4MQ4fagOA8B
	XcyJVbbqFJJxdQb6kw1lcacSKd1Fp6TFii+s3q7Pzo4dHL8dO4hw5JjOVQhin5o91nb77EfHnt+mO
	o67YmjFj6O2AgglE/KKEgvYC3XBSzqDtymLkLAAwqwmO+zQhIc3upTHri5D3NGawsrO84JuAp2AtT
	BHutQ67q2B+aCBO4OwWk9xlBxkmcaDV9sGJzubmCKjq0FG/lxfFatbaxoWO9piEigKs6QeSHJLenE
	72qk2rSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC6k-0000000Ffje-1yYp;
	Tue, 05 May 2026 09:30:26 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC6h-0000000FfjF-1srw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=QNLOEXFxq4uiqG2FBjx7y5UulD3vGj5gX9vl2RjNT68=; 
	b=naIMprh7/p53cXXpze96WKbbfz5st0pY2gSh3UBEuXWwRMTvsODxYYgE4mttHmOIXJYeC7e5oMk
	+Qn/dklp9eY9xsclyGS4j15Q3w8sL7BZxSbIWpLlB0/oYXutLdR3tVuE0mj0LBdBBCg4U3l6t09GW
	IDI57buDhZ0bwS8rhoSDIp16VNmD/UNAg/75DG854TJNEzch4PNzzR1Di4aRDhSxNjEBIqNW4guWX
	NepUxGYJG2p6KaadCrgzDqWQ7E+MqTVJPkoyDt+QEsI+B1cwpMbU/gbu9A6EWJQ97vGzkWqFV9ekg
	wpNjkeck6ZbNAjUf8kj9S4f+jvgOgmMTnnmA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wKC6U-00BNzu-0K;
	Tue, 05 May 2026 17:30:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 05 May 2026 17:30:10 +0800
Date: Tue, 5 May 2026 17:30:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-sha204a - drop hwrng quality reduction
 for ATSHA204A
Message-ID: <afm4osSDHTltfoIJ@gondor.apana.org.au>
References: <20260428101430.514838-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428101430.514838-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_023023_560622_EB69F3AE 
X-CRM114-Status: GOOD (  16.36  )
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

On Tue, Apr 28, 2026 at 12:14:32PM +0200, Thorsten Blum wrote:
> Commit 8006aff15516 ("crypto: atmel-sha204a - Set hwrng quality to
> lowest possible") reduced the hwrng quality to 1 based on a review by
> Bill Cox [1]. However, despite its title, the review only tested the
> ATSHA204, not the ATSHA204A.
> 
> In the same thread, Atmel engineer Landon Cox wrote "this behavior has
> been eliminated entirely"[2] in the ATSHA204A and "this problem does not
> affect the ATECC108 or the ATECC108A (or the ATSHA204A)"[3].
> 
> According to the official ATSHA204A datasheet [4], the device contains a
> high-quality hardware RNG that combines its output with an internal seed
> value stored in EEPROM or SRAM to generate random numbers. The device
> also implements all security functions using SHA-256, and the driver
> uses the chip's Random command in seed-update mode.
> 
> Keep 'quality = 1' for ATSHA204, but drop the explicit hwrng quality
> reduction for ATSHA204A and fall back to the hwrng core default.
> 
> [1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
> [2] https://www.metzdowd.com/pipermail/cryptography/2014-December/023852.html
> [3] https://www.metzdowd.com/pipermail/cryptography/2014-December/023886.html
> [4] https://ww1.microchip.com/downloads/en/DeviceDoc/ATSHA204A-Data-Sheet-40002025A.pdf
> 
> Fixes: 8006aff15516 ("crypto: atmel-sha204a - Set hwrng quality to lowest possible")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Drop the enum and dereference match data if needed as suggested by Ard
> - Keep the review comment
> - v1: https://lore.kernel.org/lkml/20260427124030.315590-3-thorsten.blum@linux.dev/
> ---
>  drivers/crypto/atmel-sha204a.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

