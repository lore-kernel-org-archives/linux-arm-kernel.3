Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A27C43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncYdBTDKwnyVdvlOqydNM/W0W9BJ6MKobd1nuSlkn1U=; b=GtJHRm1o8+WTBgT3lV9xpQVQ+u
	uCiX/txLxJ8sf4Cyo2IZlkdNva+5uMvwwOGasqHrI5t3n6EyFhGU97SC9tQPV+7qQWhHC714kqgdn
	/TTvUF6VmhWSjtta9CNE4wFO2gNYu2hZtxMPHmfd0Vzxxx0srH7B07m9DmECK/F6MAQjNg1ApBIFh
	PIupdFr+QECXOYu1V6/9v9/vfLupnr67CKBIRF51uluKTa+Fx8nxO3HmhUWKMbvOwOw6do+ED6DZw
	SWOoH2xprA6pEcTKowz6u3/L9oxtjSxCYSnkvQ/zB3CAcCkR8ASHigZoSX47h2R/lQVrGygYUdPFP
	uquhRT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIFG-000000098UY-2pWE;
	Sun, 05 Jul 2026 08:30:34 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIFD-000000098T0-3F2d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=ncYdBTDKwnyVdvlOqydNM/W0W9BJ6MKobd1nuSlkn1U=; 
	b=aKGFPoFWCA0370pN0vS51SOgTImWfEyUY/bk4kuDMWlbEMjxpn9eC715rfipK2b6RF75obz8EN6
	aDxHa9KosC5+Ee0EByTVqHpQWt0P5YXYNkwxD6mmaQlGXaN1Kif3t9IQjzrBlj6KwtLZ1TeXfMy0s
	kYSeGi6izxkAV9m3W5Ikn8GtIG3sD4hemTo0RpfEklqgYh8B1LNs7t0Ry/RpdPUzGw+6O5r6V0QLl
	QI9IVWhFmN4ZmKPM1YnJxJBrqBD9MK36CgJgacDMNPILHDBC/YzC1BG4pq1gatnwGwSFR9nZQHNlc
	HtLzk43m6HGFaS+fDV3IWrRUgZE5RbitrlJg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgIF6-0000000Akxs-2I9Q;
	Sun, 05 Jul 2026 16:30:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:30:24 +0800
Date: Sun, 5 Jul 2026 16:30:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: thorsten.blum@linux.dev, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, krzk+dt@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] crypto: atmel-sha204a - fix heap info leak on I2C
 transfer failure
Message-ID: <akoWIPq1p0YUIdyF@gondor.apana.org.au>
References: <20260613202037.47744-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613202037.47744-1-l.rubusch@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_013031_814473_3F4E7AB1 
X-CRM114-Status: GOOD (  16.58  )
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

On Sat, Jun 13, 2026 at 08:20:37PM +0000, Lothar Rubusch wrote:
> The nonblocking RNG path allocates a work_data structure to track the
> state of an in-flight asynchronous I2C request. This pointer is stored
> in rng->priv and later consumed by the read path once the transaction
> completes.
> 
> If the underlying I2C transfer fails, the completion callback is invoked
> with a non-zero status. In this case, the allocated work_data is not
> usable for producing RNG output and must not remain associated with the
> hwrng state.
> 
> Previously, the failure path only logged a warning but left the pointer
> state uncleared, which can result in subsequent read attempts observing
> stale state and interpreting it as valid completion data.
> 
> Fix this by freeing the pending work_data. The I2C transaction reports
> an error. This ensures that failed requests do not leave residual state
> behind that could be interpreted as valid RNG data on later reads.
> Clearing rng->priv is done at the subsequent call to nonblocking read.
> 
> Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A random number generator")
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> Assisted-by: Gemini:1.5 Pro [google]
> Reviewed-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> v2 -> v3:
> - remove existing error-path cleanup behavior [`rng->priv = 0;`],
>   update commit msg
> - rebased
> 
> v1 -> v2:
> - reword commit message for clarity and precision
> - keep existing error-path cleanup behavior unchanged, update commit msg
> 
>  drivers/crypto/atmel-sha204a.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

