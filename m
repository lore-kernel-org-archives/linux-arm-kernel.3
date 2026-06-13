Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866ACCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 12:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxijQ4qpfDULLQ1Xsrny5C+qoSql1IUBsYrdNOivA8E=; b=JCFoKh8KRD020gT+x1Dls3mR/P
	ntY4LwL+YQgfoPj9ZKzWSdNbjukyH5mjbjnPAyxuUym2Y6xr0YqdJSNlmP5l3zdz9gnDH0LCzluGC
	YDXkwvB7x0seUlndduNm1Nwnoo0TBId3qD5XK5Z4vhkrv1QJ0B/nHHt5QUBapHVyspuSo4AyaiOEM
	ykJpll88FG0M0NvdqBY5sJGA+PrzWaZk1iwoVPZgT3f2thNi0RkGHqmEf5hMX5LxePoj/e+cqGxqG
	kM9cDCow7e4s5QmOV0Q/V4flnw27sFJHTSH8/YsmxuVthZzU1a4mFrre+64RVwbhiKh/qTfZYe9x4
	Fez3H7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNUB-0000000CH8z-1S1t;
	Sat, 13 Jun 2026 12:29:15 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNU7-0000000CH8C-0YZs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 12:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=GxijQ4qpfDULLQ1Xsrny5C+qoSql1IUBsYrdNOivA8E=; 
	b=che4SGPaJaiilM1J5bMsq8iWAhQO7OqxES4kOevvP9bh5FVFLtsp907ihv/m0tEpv/MjckGcnc6
	9uSqtDXTtQtNDzMopuKetrn5Ms5kfSLBOcvg0QXmlT07JdggbS6yBTU4UZS4vVimbwpr+yahdPAxX
	xnZv1433Jm+RABhs8u/FEKVy5r2umxHdjS8Nf0HUIx5SjnGhq2XrIOVQnNhAwDUqQyYiNirNs0GQX
	jcmn2B6hQM07EI/RMAhIFbrvhhecsP3eA8dJ6O/8ntSnLtyWolT3S1dS/iVtyjsZewcJ2kbvqQIEi
	ihtyNtjkGeNKrSl13aMSWidvW6SEN3rFXKeg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wYNTg-0000000595r-3sio;
	Sat, 13 Jun 2026 20:28:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 13 Jun 2026 20:28:44 +0800
Date: Sat, 13 Jun 2026 20:28:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: thorsten.blum@linux.dev, davem@davemloft.net,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, ardb@kernel.org, krzk+dt@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/1] crypto: atmel-sha204a - fix heap info leak
 on I2C transfer failure
Message-ID: <ai1M_OqDfwMRlcyU@gondor.apana.org.au>
References: <20260609094723.47237-1-l.rubusch@gmail.com>
 <aipAf_uZnX_gwZnl@gondor.apana.org.au>
 <CAFXKEHYcp-0+uCA47mtDe_+LUAZucEPbDJzoh5+e3Q3R20mN9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFXKEHYcp-0+uCA47mtDe_+LUAZucEPbDJzoh5+e3Q3R20mN9Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_052911_799830_3B9E7407 
X-CRM114-Status: GOOD (  17.80  )
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

On Sat, Jun 13, 2026 at 10:52:25AM +0200, Lothar Rubusch wrote:
> On Thu, Jun 11, 2026 at 6:59 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > On Tue, Jun 09, 2026 at 09:47:23AM +0000, Lothar Rubusch wrote:
> > >
> > > diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> > > index 4c9af737b33a..20cd915ea8a3 100644
> > > --- a/drivers/crypto/atmel-sha204a.c
> > > +++ b/drivers/crypto/atmel-sha204a.c
> > > @@ -31,10 +31,15 @@ static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_data,
> > >       struct atmel_i2c_client_priv *i2c_priv = work_data->ctx;
> > >       struct hwrng *rng = areq;
> > >
> > > -     if (status)
> > > +     if (status) {
> > >               dev_warn_ratelimited(&i2c_priv->client->dev,
> > >                                    "i2c transaction failed (%d)\n",
> > >                                    status);
> > > +             kfree(work_data);
> > > +             rng->priv = 0;
> >
> > Why is this necessary? It appears that rng_read_nonblocking already
> > zeroes rng->priv.
> >
> 
> IMHO this is not the same. The patch targets the error path. If the
> `status` in `atmel_sha204a_rng_done()` is failed, then failed `work_data` is
> still assigned and `rng->priv` is not zeroed at the moment. Only a
> subsequent call to `rng_read_nonblocking()` will set `rng->priv = 0;`

Right, the rng->priv gets set on the error path prior to your patch.
But with your patch, there is no need to clear rng->priv because it
never gets set on the error path.

All I'm asking for is to remove the rng->priv = 0 because it only
causes confusion.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

