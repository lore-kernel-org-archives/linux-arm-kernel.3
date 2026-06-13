Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A22FCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lzsqau39bl9Mc/gHA7TczwgrY1vpC1GBu2mXHBebm7Q=; b=dNSA+emtbTZquo60BhI188ByFk
	173YEBh3xFpCCOFjfRag/G7iiiDehx2pAez2kq9btEA4pPsC4Tn0W8qoMQAtU/pJ/wLvGTZxcR378
	cuS2j5LG/8GgGWVlWLnOdbHtIePPhNB83/RgUHSDKu7uRNXlaNAQ8JYos6dsb6vc8ZcIccZqkzuOY
	4qTw9Q58lb/vBD2ZYvDT7uj4waKqd0m6y2JzGMVAiGQxlYjAQB2T4AGBYzGd5WwGr5CqscnhjOfrc
	14TKr+gKF6N97XFhyvmxJAjQjcKs/YBva+JyPjXDbotUua1MhC0Pv104Dk/kjy2m7y7IK5/FdVieo
	5W7jkJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYK72-0000000C6Q9-2vih;
	Sat, 13 Jun 2026 08:53:08 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYK6y-0000000C6PV-2Qt1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 08:53:06 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66042b348a8so125940d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 01:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781340783; cv=none;
        d=google.com; s=arc-20240605;
        b=LFQu/kOnU1o9vzfh+aN7GvTs5HZDNogJBO5oqs10TZoi9eHOHJ4f4S8tx468O7/WVr
         uQTE2lbFgERi9XAeNzwIrr2gam8B26frDP/UYdne+ucA1zrZQUoi3HFdM4QpvcCmrQHw
         DwcBQF0t2eAm/R31AN1zDinOPiRrKZ4/ChkE8yxcR+JdMCB9fc7PL+TAIqIEOKHyOA4R
         cgaOMMwNomYBsNniTB6Y80a6kvSw5bCSIOQcuxYpk6S7TCE4+aqzFLTTvXiml8TB08Gt
         s05vzedHYj0fMW8iTX7Q0aci4usdFoxrypcI7/xgiNdtNxmmcFBC6fezY5BodD5tcTtV
         RTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lzsqau39bl9Mc/gHA7TczwgrY1vpC1GBu2mXHBebm7Q=;
        fh=/MWoNF1hWfMZAPwH6/OOt8/Jtt+pMZwHEEp/sXybJzs=;
        b=cZxUk9Hgiy3IbJprKvQMxpFveXuT484NlKhYzL50HTzx5OlFM6z2+BLiu1mjfmJE8m
         RKHNI/dBcmYmeBllZHiO/AwqtHWK4qaZW37qSFMkvtBDLLEe75i6PdD88t8y5hGS6gBi
         Po/hyL+llCaXxsloZyjWO6KSSeRoqR414tX7iSUPyIp2dkxbRwwHweo1v2DbZBgi6vu6
         cqEli5rWWVcvMrjTVpWUeAZzaZcQOEdlF1RhfOOz0ODkk9zAZ4l2VN/DnHaxRHxJJsjc
         AnjiyiTuBjB8EIVTebW93osbat4Wx5T9e3xiCz9IJYME2l0fftxxq4szQnPQm/VSBPZo
         E5oQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781340783; x=1781945583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzsqau39bl9Mc/gHA7TczwgrY1vpC1GBu2mXHBebm7Q=;
        b=qGs9oa6qwdDTlgO40hbLUruLAmU2ykcBNx/KpRh03PhONCegVMt45upOMEDZV4/siO
         Uc0sJi9lnWyTNgnu92/O31FVH79Ahd1CUIdqVEJAN+uFMe2llHEjcqCanYPDEH/li0FL
         wRQxBOmnbspBff+kzKJUSf5lQiq6H+EY5Dut+saPSAaZhl4QNHAFZcARwKrkbps43k8Y
         MY2ZuFEpVgFB/08zOZWGwUjS4bpT13qVm9wy0Qw3erhnuN/+guZGcbKwIAg0z1ZhMK0+
         nVf9/WY3PCockJe0YAioDFxtTTV7Bug+P/K0rvseHQFrPHJpqFPOh0fgd476ilRVwlEn
         TvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781340783; x=1781945583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lzsqau39bl9Mc/gHA7TczwgrY1vpC1GBu2mXHBebm7Q=;
        b=M3sdD7o5CnRBuakoa9TiaAS1ee6/4+Z8TIa+JTu1AmFmt1ZcTey3QeegoDjd/ODguQ
         q02BH55wYwi6ns9hspkgsYJVqKPg5FrtyBLXUi4u0WdLfRkjZjevDLMxWsHUaOxpfCw+
         9mvQbyK9UJlkYuC+eL/RjaFfscCZ4B0IDPytbWwTKs3Ix1nsEFS6MY3mOnioe9OBmJh8
         O9R8t6U3A4ejSkjBH5PvT7UtSskMR1dWTavtFl7nEMpxCGfMSaV6zfkj3bnITt9nZnH6
         IVt8Z88pDUAeG7xMBqTTd0MfAggIrl0aPmi3cQOFf4cm5plXUbTTM2PtdxxnxlRqVCPl
         iiVg==
X-Forwarded-Encrypted: i=1; AFNElJ/TS5Hmrxsh9cCwJWAMOBr9idiaHXcjjD7TRDlz55oJAGo9NKWUkSFwJ1HYZ9YkQ4yBgcn9HM7GNdQGogFgSAbU@lists.infradead.org
X-Gm-Message-State: AOJu0YyT8N5Oj5xQ6ffJ61vUHe1qDr60QIIKwN2ANoDeW0EOjqI1AIiK
	/86NVNNkQzwBmDyIlPGt7R6D72EUltcU51bk54bjFcyTH4jUNdZPOL43By6Cj/orkyWchEgbzC3
	UZMdWxd1uUCTbCRw5bfyQZlTjhryWeHo=
X-Gm-Gg: Acq92OGA7/M52PCg7t68ZffrpKMK/qYHHUBKTB6/MiIrw5yZliKjnMjY5/kcGMAvAjG
	DK3N2+wlKYKcm1mEe383TryKP7JRWYfNLTVwLXE4zWQg39iClEv2AwADcLUu+h30M51csK8KXPz
	spKmszy7B7uuZVxXdZ8GuwI/9SESwhtsgxTvWqEqCnXwRbCmd+gWSUcR9LoLc7D7K1QuaIye9Vn
	M4sHucFnR0KqMGJ6rsVr02KHc8GfLUP4cqHoEdrEe1NM2MPrnYHK3j2l7rAr9J/67qLr5WazMgk
	iMkM
X-Received: by 2002:a05:690e:190e:b0:660:3524:a765 with SMTP id
 956f58d0204a3-66277db878fmr3240708d50.0.1781340783060; Sat, 13 Jun 2026
 01:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260609094723.47237-1-l.rubusch@gmail.com> <aipAf_uZnX_gwZnl@gondor.apana.org.au>
In-Reply-To: <aipAf_uZnX_gwZnl@gondor.apana.org.au>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sat, 13 Jun 2026 10:52:25 +0200
X-Gm-Features: AVVi8Ccez8ahhZkqU3IHIA6bkI7wgzyq1z6y0SVWiqCmMhkHMjyS-J_FvYv_-S8
Message-ID: <CAFXKEHYcp-0+uCA47mtDe_+LUAZucEPbDJzoh5+e3Q3R20mN9Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/1] crypto: atmel-sha204a - fix heap info leak
 on I2C transfer failure
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: thorsten.blum@linux.dev, davem@davemloft.net, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, ardb@kernel.org, 
	krzk+dt@kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_015304_634685_020E9FC0 
X-CRM114-Status: GOOD (  23.62  )
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

On Thu, Jun 11, 2026 at 6:59=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Tue, Jun 09, 2026 at 09:47:23AM +0000, Lothar Rubusch wrote:
> >
> > diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha2=
04a.c
> > index 4c9af737b33a..20cd915ea8a3 100644
> > --- a/drivers/crypto/atmel-sha204a.c
> > +++ b/drivers/crypto/atmel-sha204a.c
> > @@ -31,10 +31,15 @@ static void atmel_sha204a_rng_done(struct atmel_i2c=
_work_data *work_data,
> >       struct atmel_i2c_client_priv *i2c_priv =3D work_data->ctx;
> >       struct hwrng *rng =3D areq;
> >
> > -     if (status)
> > +     if (status) {
> >               dev_warn_ratelimited(&i2c_priv->client->dev,
> >                                    "i2c transaction failed (%d)\n",
> >                                    status);
> > +             kfree(work_data);
> > +             rng->priv =3D 0;
>
> Why is this necessary? It appears that rng_read_nonblocking already
> zeroes rng->priv.
>

IMHO this is not the same. The patch targets the error path. If the
`status` in `atmel_sha204a_rng_done()` is failed, then failed `work_data` i=
s
still assigned and `rng->priv` is not zeroed at the moment. Only a
subsequent call to `rng_read_nonblocking()` will set `rng->priv =3D 0;`


The call order is something like this:
1. atmel_sha204a_init // module setup
2. atmel_sha204a_rng_read_nonblocking // call 1
3. atmel_sha204a_rng_done             // if fail, still copies
work_data <-- patch clears here
...
4. atmel_sha204a_rng_read_nonblocking // call 2, clears rng->priv =3D 0

Originally this was a sashiko finding, when I move the RNG part into the
common driver. Reason: Actually all Atmel ECC and Atmel SHA204a devices
support the same RNG mech. Thus part of my refactoring is moving it to the
common core driver atmel_i2c. I was advised by the maintainer to use also
sashiko's feedback. So, I went on identifying sashiko issues and have a
look into it, if I can provide a fix for it. This is one of them.

Sashiko asked:
"If the I2C transaction fails here, we still assign the work_data to
rng->priv. Since kmalloc_obj() uses GFP_ATOMIC and does not zero memory,
does this risk leaking uninitialized slab memory or stale data from
previous reads when the next non-blocking read copies from
work_data->cmd.data?"

ref: https://sashiko.dev/#/patchset/20260512224349.64621-1-l.rubusch%40gmai=
l.com
[search for `atmel_i2c_rng_done` on that link]

I'm not sure about the risk or the (real) severity sashiko mentiones
here. But it seems to
be correct, when atmel_sha204a_rng_done() fails in the status, it
continues assigning the
failed result in the work_data:

    static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_dat=
a,
                       void *areq, int status)
    {
        struct atmel_i2c_client_priv *i2c_priv =3D work_data->ctx;
        struct hwrng *rng =3D areq;

        if (status)
            dev_warn_ratelimited(&i2c_priv->client->dev,
                         "i2c transaction failed (%d)\n",
                         status);

        rng->priv =3D (unsigned long)work_data;
        atomic_dec(&i2c_priv->tfm_count);
    }

Hence, my proposed patch will stop it passing work_data, if status is
failed. It will not
assign rng->priv anymore then containing old data, but clear it. It
will free the `work_data`
to provoke a new allocation happening in `atmel_sha204a_rng_read_nonblockin=
g()`.

The patch is sashiko and maintainer reviewed and solves sashikos complaints=
.
ref: https://sashiko.dev/#/patchset/20260609094723.47237-1-l.rubusch%40gmai=
l.com
Setting `rng->priv =3D 0;` is rather safety here.

Thank you for asking. Accept, drop or modification needed - please,
leave me a note,
I'd highly appreciate.

Best,
L

> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

