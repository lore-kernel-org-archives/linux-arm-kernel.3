Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45112FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6NiVM+FcqKtdb/sqcUTVrGuVbWGle0JubOydHUeo5o=; b=maYNXkrpS6iWwhutLt4/ZplQYc
	wI7CeyaCIzHAqcwB5v4J0MAQkNaUcRGhOVw+SGIfjdRr6qHtRYBnM1SjZmOtewRWKFY4+tJgLb93l
	yBW9qxO7p9q0PZo9K+6Tx4/kKleB37nn+QYTMnFzq0N9Op1jLlgBr+B+0yWvbja/tSIg8WvOAld2/
	agK5IHY6LpgTiLRAyptODk0c4jRhF6DuffJgYu3LFaO++i2yfIe0ZtrcSVJ4/XRbtuqs/GJ+F6mX8
	CFm4EjfF59UnqudWW1ruMqEXVCbASHIMuY5YHeHVMYpne70ASEKlPwAtY6eU6M56ZxudAagIo4hTq
	FaCEpmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfKK-000000018n9-1cYs;
	Tue, 28 Apr 2026 10:06:00 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfKG-000000018mc-3ZyO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:05:58 +0000
Date: Tue, 28 Apr 2026 12:05:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777370751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6NiVM+FcqKtdb/sqcUTVrGuVbWGle0JubOydHUeo5o=;
	b=C2tvSgRoc9Rwd5HDBOTSOX3/BUYtGIOIUbowRvaIbS1C/rncw+UmBZ1O5rRCo9xQk8rzxf
	z0bjNVDH+ioOZ42m0u/uPjHi9NKFCba9keqic7OenW9a1q/9+rsROB+Q3JLDTz3+2E+dQu
	iR9keTnJI7vDrTQSUISieZim/PAXgD8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Linus Walleij <linusw@kernel.org>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - drop hwrng quality reduction for
 ATSHA204A
Message-ID: <afCGefyZV_ujj41K@linux.dev>
References: <20260427124030.315590-3-thorsten.blum@linux.dev>
 <2d42b1fc-b5d5-4dcb-8dc8-62580502f586@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d42b1fc-b5d5-4dcb-8dc8-62580502f586@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_030557_060028_AA913A4D 
X-CRM114-Status: GOOD (  24.76  )
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

On Tue, Apr 28, 2026 at 07:58:39AM +0200, Ard Biesheuvel wrote:
> Hi Thorsten,
> 
> On Mon, 27 Apr 2026, at 14:40, Thorsten Blum wrote:
> > Commit 8006aff15516 ("crypto: atmel-sha204a - Set hwrng quality to
> > lowest possible") reduced the hwrng quality to 1 based on a review by
> > Bill Cox [1]. However, despite its title, the review only tested the
> > ATSHA204, not the ATSHA204A.
> >
> > In the same thread, Atmel engineer Landon Cox wrote "this behavior has
> > been eliminated entirely"[2] in the ATSHA204A and "this problem does not
> > affect the ATECC108 or the ATECC108A (or the ATSHA204A)"[3].
> >
> > According to the official ATSHA204A datasheet [4], the device contains a
> > high-quality hardware RNG that combines its output with an internal seed
> > value stored in EEPROM or SRAM to generate random numbers. The device
> > also implements all security functions using SHA-256, and the driver
> > uses the chip's Random command in seed-update mode.
> >
> > Keep 'quality = 1' for ATSHA204, but drop the explicit hwrng quality
> > reduction for ATSHA204A and fall back to the hwrng core default.
> >
> 
> Interesting! Thanks for digging this up.
> 
> > [1] 
> > https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
> > [2] 
> > https://www.metzdowd.com/pipermail/cryptography/2014-December/023852.html
> > [3] 
> > https://www.metzdowd.com/pipermail/cryptography/2014-December/023886.html
> > [4] 
> > https://ww1.microchip.com/downloads/en/DeviceDoc/ATSHA204A-Data-Sheet-40002025A.pdf
> >
> > Fixes: 8006aff15516 ("crypto: atmel-sha204a - Set hwrng quality to 
> > lowest possible")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  drivers/crypto/atmel-sha204a.c | 40 ++++++++++++++++++----------------
> >  1 file changed, 21 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> > index dbb39ed0cea1..df69fb190e52 100644
> > --- a/drivers/crypto/atmel-sha204a.c
> > +++ b/drivers/crypto/atmel-sha204a.c
> > @@ -19,6 +19,25 @@
> >  #include <linux/workqueue.h>
> >  #include "atmel-i2c.h"
> > 
> > +enum atmel_sha204a_variant {
> > +	ATSHA204 = 1,
> > +	ATSHA204A,
> > +};
> > +
> 
> I agree that setting quality to '1' is only appropriate for the ATSHA204
> but this looks a bit clunky to me.

Moving the declarations to the top was also a leftover from a previous
approach and not necessary anymore. I'll send a v2.

Thanks,
Thorsten

