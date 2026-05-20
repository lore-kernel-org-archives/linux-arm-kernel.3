Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFA1CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFavJwHYbSM6FE0lfLUET7tWipL+OnMgDcLdxX5CbdE=; b=GzGxyL8LeIKqwTwygAnLUxzd5M
	/pUiaLLNakwVIdhoTj3iDFHH2XvqvQgWGcKCn0pEL7cbpodB/zXudxDbjCP8JelMDr5cvcv8RlGHa
	y4Ly0mKLsCIBOx7qOB6P27dj/l4XYFZ9cpruQH2K4mTr1kEUIiTjbb1UD0a0FRErXnF4dcQPASVLR
	Z8YOb99l1WsGMGzgOsZ4O1f4q8MZNxFypRoKdODJ61nhEh36yO3VDjFmVTMkO8EojhBH00qD2v9Pq
	pSRUUauTxcoV+4AaXCCE1roCDhJqVsa4gJ1HDT3pZ7J/jM+hBqMK42vybjDQ10+hXsBjcv1pf5Bob
	U1F0HItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPinm-00000004ygT-14cD;
	Wed, 20 May 2026 15:25:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPinj-00000004yfn-1KCE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:25:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488ad135063so40900275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779290737; x=1779895537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFavJwHYbSM6FE0lfLUET7tWipL+OnMgDcLdxX5CbdE=;
        b=IVTwGk7pmHXykzzWBbQ6+8oT8eIOalGKec+pNZUAybz5JlPR70ni3hQZX2e7iqRfR/
         LPPEI6dCP76xFbNV19AI0LK522jqKA4D6LbtYlfEb2ewbEbR673tyDvu+liQqxuUhaP2
         od1lYpjC26VgY796P9BIBQ4qJVoVfe7GHWPiGNBziSC171dZIS9sH6ZZ+cbOjKECO2cC
         m0Nag9EWolTBobgeaCCx1oyb1dGoThRDQtD28PIy134kScjobbOpsKnVsIH5W+jxdZE1
         FIq4ZZ0WLY92+ybXrbhO8Pnl+c0l3AApYJ3QOeKH6pW0/yFty8VswQBI4do/kU8GlpSA
         jE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290737; x=1779895537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFavJwHYbSM6FE0lfLUET7tWipL+OnMgDcLdxX5CbdE=;
        b=NLpIrOzTsp6PSjSY7PIqn49aUjMK7OUCuFdmKd6NYc2xrawbgri4oXU/szM73WYpK9
         YuR6vwmfpaZLCBwmoKx5TlojBjxPf5aJpKFaU5PpSEC4lrsLB+kM7Ob4rwpeZbpU1MnX
         6j5DCd5J3KkhEJ5c2Lys22wcfKMDN+GubjbtvIWvSn9CwELaoHFMThUPeOY21y5SshfD
         D8GFzDw5j9u61IU8NsoqSkugDGggTqYfQ1viD04hzm//CW/DhJezXh4cl9oGwW9up9MI
         P2bNQE3FBwRa+MaJUn8xzFiRO5MeIh39K5SoFQUV//mSmo9t0XTbX+wQpTvrUnuEgwBX
         jAjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nU7befVhjtJlQSepsjiAwyGMMB6N66iMbpqyZH/D06UuaUMB2FpvPZpqwJXVbKfqhM0MLJb83XeuUwLVYk3NF@lists.infradead.org
X-Gm-Message-State: AOJu0YyOWkKLIKHECrQqgsaLGD1cO9GhpRRp+JwzCzNr3qMUBcvMtI49
	yTuu6Dr29nnspM6ci7zbcCuiN+r3QI0hl4a5P1fzE6ZEFz3ytU9JcUJl3iOYBLO+4JY=
X-Gm-Gg: Acq92OH/B5IqFRi9v/lxbmjnYXUifpAVUuWfihFSLUUnUM/V30o0fjSeapXN0rNPlqT
	3QndJ2rZwYU2qWO95q6+B9FAcAk1SPu6p4i4dg/yzZl6ALS0zDWAeRM1OuwdTJB2LWwKOed5wnT
	dTCoA5GAHoGJ8Wf09y5TrZM0nxVdFEVMAdDZyfOUVAeRxDw8Lzr19AuEjN1xda7hd7PyzjoDA0J
	y62T0eAZ2tRYmjJGG0Oyzo+yoJBs2MHfjCTasx7ooaHiF5sx3qS42duoPZc4fcuzzTWDzK4avE8
	QPqCt7iZ7S0rq0LTcpcpMYIOx53fM05Y82kHrdigoFdkTMzqAucDsZ9lB5w8rsc2od2iqSGuROg
	kjJDKmRvVORo4IjXdqZmC9CUWHQw9ehHQQhilEo/b/DWkoLHqX0Gk0eLssn6sLmzmn/OtBZBQer
	fPr3DHDtcM+T0Xu8hFH9QaGCdCN2Lnm82+MQ8hTEAfu9iXbbQ4EdymvVN+5lvUtl63gRzuzMfru
	jMmwWWlkZxBv/PvoscLv39/SA==
X-Received: by 2002:a05:600c:4e13:b0:490:31e:d6fd with SMTP id 5b1f17b1804b1-490031ed899mr279492645e9.25.1779290737373;
        Wed, 20 May 2026 08:25:37 -0700 (PDT)
Received: from localhost (p200300f65f47db04e561655f2aa05c7f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e561:655f:2aa0:5c7f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fffb9aac4sm544034675e9.9.2026.05.20.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:25:36 -0700 (PDT)
Date: Wed, 20 May 2026 17:25:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] crypto: atmel-sha204a - Drop of_device_id data
Message-ID: <ag3RTQEC_HyUM3K4@monoceros>
References: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
 <d0fc3069860f9e31122c1af635a1114dd2c443cf.1779260113.git.u.kleine-koenig@baylibre.com>
 <46130020-eaa5-44ad-9c6d-62ccb30c19d9@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lntws6wrfne5ipt2"
Content-Disposition: inline
In-Reply-To: <46130020-eaa5-44ad-9c6d-62ccb30c19d9@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082539_681622_DB283395 
X-CRM114-Status: GOOD (  27.68  )
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


--lntws6wrfne5ipt2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] crypto: atmel-sha204a - Drop of_device_id data
MIME-Version: 1.0

Hello Ard,

On Wed, May 20, 2026 at 09:49:49AM +0200, Ard Biesheuvel wrote:
> On Wed, 20 May 2026, at 09:01, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > The driver binds to i2c devices only and thus in the absence of an
> > assignment for .data in the of_device_id array i2c_get_match_data()
> > falls back to .driver_data from the i2c_device_id array. So only provide
> > &atsha204_quality once to reduce duplication.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
> > ---
> >  drivers/crypto/atmel-sha204a.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha2=
04a.c
> > index 6e6ac4770416..f17e1f6af1a3 100644
> > --- a/drivers/crypto/atmel-sha204a.c
> > +++ b/drivers/crypto/atmel-sha204a.c
> > @@ -208,8 +208,8 @@ static void atmel_sha204a_remove(struct i2c_client =
*client)
> >  }
> >=20
> >  static const struct of_device_id atmel_sha204a_dt_ids[] =3D {
> > -	{ .compatible =3D "atmel,atsha204", .data =3D &atsha204_quality },
> > -	{ .compatible =3D "atmel,atsha204a", },
> > +	{ .compatible =3D "atmel,atsha204" },
> > +	{ .compatible =3D "atmel,atsha204a" },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, atmel_sha204a_dt_ids);
>=20
> Just trying to figure out how this is supposed to work:
>=20
> i2c_get_match_data()
>   data =3D device_get_match_data(&client->dev);
>   ... returns NULL ...
>   if (!data) {
>     match =3D i2c_match_id(driver->id_table, client);
>     ... compares client->name with { "atsha204", "atsha204a" }
>=20
> So we will be relying on client->name having been set to either=20
> "atsha204" or "atsha204a" on the DT probe path before
> i2c_match_data() is called, but I am struggling to see where
> that might happen.

That happens when the client is created. Relevant are:

int of_i2c_get_board_info(struct device *dev, struct device_node *node,
	...
{
	...
	if (of_alias_from_compatible(node, info->type, sizeof(info->type)) < 0) {
		...
}

which sets info->type from .compatible with the vendor part skipped.
Then

static struct i2c_client *of_i2c_register_device(...)
{
	...
	ret =3D of_i2c_get_board_info(&adap->dev, node, &info);
	...
	client =3D i2c_new_client_device(adap, &info);
	...
}

where i2c_new_client_device() uses info->type to populate client->name.

Best regards
Uwe

--lntws6wrfne5ipt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoN0m0ACgkQj4D7WH0S
/k7WaQf9FYK31sTuNaQNBScs4kD7Q1pEw2ipCPpXIU2XiiieMxxHqSTb9UAHQPAU
R50AQz2QB1R+nHVvN1KhLjwmTNwShQpRY3YCZhTiWBiw4nq9o7dBh4vs7FTyAV4p
AuDChDsDeU7FKwOvZhmEu7eaUmp037fw3pA44EHyNn/jn75pP7842GFfVuZwvwtT
+IjPrcDiGej30I9uhligYc2ZkohnbHEVumD8KmMskUAJogOFajcKOpxiiAJoPfEy
v5thRa17jUPi04sePMKGcrEyzlOQwep37FP52bdP/cfOB8TJqMpA4uJTDR47YHAv
oUPaSopOv4qFqmH7fPfoI7FM64YYJA==
=vjzT
-----END PGP SIGNATURE-----

--lntws6wrfne5ipt2--

