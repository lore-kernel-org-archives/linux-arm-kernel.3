Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DCA1094461
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wS0WrMzGhr3RYR4OPM+ppLpnyCgD9P7LcaGhCjyMees=; b=LJXN+Aa8youevX2o97PsmtwS/2
	CQEUhCNr35TyWTqLQLiDSYW2urlEbO6X3NytJvDM0MwuRgG9NoqoKu3LFrDiiso7wtZz8p3BiUgiG
	rU1IhxWTTsMnluWZEW4OGjNYL1AYCGDOmjuFgZUR1O10mjPLJk5mabiWZExNFHI1aSqW9QOHxPLiY
	G+Kw80uCd4Ft4f9FX4WZOY9A2mRuqgYEdL3jpYu7TvzxerfhilyhREFzlHZb51B5f6MzXAudSfqdd
	szqJRQJFXxqCJyCG3pCI+YUMtU2QdGdQfpZxIZMvlsFLEKsUe8lFkMOJKt7ItgJ2bRwOnyIj0eI3O
	dYJDWjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3s4C-0000000EHSL-1ckF;
	Sat, 21 Mar 2026 08:52:20 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3s4A-0000000EHRy-2Gsv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 08:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=wS0WrMzGhr3RYR4OPM+ppLpnyCgD9P7LcaGhCjyMees=; 
	b=OAxiyj3jP0r59U6yGGHBHijUW2OccXCA2Ra1Svn3utoe+XOpU4sOvtvVey6ChpRoFEwIFTL3eLv
	oU9gQhujGi8d0YgspStOY3ZPmsPoBaFgfi28YAgVq2NDhRMIsVat6DYssQaXNoXPAQFZtbzhz0VNw
	gP37hXCLxpTGqe6Ew0KfiR8ELmtHiZc0iibOr5Qr6i5rtcdDDKwykWP+AjwHoOUdWyDatDVphTcSs
	Nh4ePOzVQufUUbEd98zIlk1NBhYcGXRCrwgA8N3Y4YGlrOwDPKUGMb9ACv8dPGdpuKJ99JVuBb0H1
	QHwBOta5gc4GwOzuYD6nYDv9jn0NlzhbH5ng==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w3s3q-00GJFL-1z;
	Sat, 21 Mar 2026 16:51:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 21 Mar 2026 17:51:58 +0900
Date: Sat, 21 Mar 2026 17:51:58 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-sha204a - Fix potential UAF and memory
 leak in remove path
Message-ID: <ab5cLh8Dlorf8iPa@gondor.apana.org.au>
References: <20260314193627.728469-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314193627.728469-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_015218_602081_0ACA5A4D 
X-CRM114-Status: GOOD (  14.92  )
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

On Sat, Mar 14, 2026 at 08:36:29PM +0100, Thorsten Blum wrote:
> Unregister the hwrng to prevent new ->read() calls and flush the Atmel
> I2C workqueue before teardown to prevent a potential UAF if a queued
> callback runs while the device is being removed.
> 
> Drop the early return to ensure sysfs entries are removed and
> ->hwrng.priv is freed, preventing a memory leak.
> 
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Unregister hwrng to avoid new ->read() calls and then flush the queue
> - Drop the ->tfm_count check and error logging after flushing (Herbert)
> - Link to v1: https://lore.kernel.org/lkml/20260221190424.85984-2-thorsten.blum@linux.dev/
> ---
>  drivers/crypto/atmel-sha204a.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

