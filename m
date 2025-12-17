Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E9FD64088
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+Q8ghXVyCQDXjBoffiftwRpwO3ivtFGMCLgHbR9KKc=; b=hCUvC3YWCSaEAtBePhMhLri1H9
	KhrLyihwmAwvrMed+/sJUeQ60A0DTF0oN5jxxQpGxiwbp6Gr73y+pgR3WYtgnW1/OUMRi7dhdBmfc
	zaN7SO2jAZtl9xj4tt0oM4rm+hA54/S/wFg2PLHO6XOoP3farHui9xq1EZY56cqbMUnm0Lav+QAra
	rkYyBAi3dF+FLWfjvd1ngO3JBi2vv29Xmg1rbU7aFzjFOicYZVZlt6XEcsnNOz+04FaxQ66bUXU5N
	Tr2LBF3D6e5X3+KfRJSXzsn1qLC6cRrRyvjulOWANehHAuuCdLtHAdaJxOoZtgXqrO7O2iaIqL23v
	1DqLTJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmn9-00000006Kyi-27KL;
	Wed, 17 Dec 2025 08:21:51 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVmn3-00000006KxU-2640
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:21:47 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b79e7112398so1074750166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765959703; x=1766564503; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+Q8ghXVyCQDXjBoffiftwRpwO3ivtFGMCLgHbR9KKc=;
        b=NrFAHpRnCYpCeAKF/BxEcoY7D1f/UKv5VzMEIAncN4aBVb6TpIQ0JV2H3JUdKb/sHX
         fRsSjNL3Dir4CkeYLK4RPJzfn6NGN/narBhO4KHjEjAcr8wIKU1ZBNdifbW6GEWpexUD
         y8lV1po/dC4asMmSG4Ui1xAwpN4PRw1lrZjBM9NpUQCC9lc20gOqSgXLGMZfmKfVF8CT
         OoovvOqXDbjOsS1FDAaH1GtlEjEz9YhYggR/eJKQbGHobyDBTQMdQKQkOqT/UjoGtrJu
         1pvgzIkGWOTHK7zTSgoOj3c7+DmnY5tjvC6HyKtJhmO4zyUC4vZOSp2tRCXjM+M0Abo/
         hc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765959703; x=1766564503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+Q8ghXVyCQDXjBoffiftwRpwO3ivtFGMCLgHbR9KKc=;
        b=J/jBEbdlikkvUgpiTgMTWrPqjusfSXlMEmYpS8expb3XTGJIi7Bg42YaxOD0rV7YJ1
         9A317Ia+WC/4Wp5JqqWRV7gH6Md9q4iroWnwo4XqzFrm+slHbpfnvydAJ0ixenQOQ/c0
         vuca13AXkI3HnAId6RvUlYdQqc1k1jrk4nAStBzuNjSmGj7kYTLh9KF0ARhXlzRIe7cm
         mWrtWCZXcXdLIUSGF0KY9GPcieWvM/afKkyIjWoqTFnX2Po4h9St0f7CxXPJOWaZlBTs
         yJh9EsEk0MYw9fGdKGxwaBeI8q+heO2LMZlmlood59v0EXug29w2yq8sIZ8xfjTs4gFC
         7G7A==
X-Forwarded-Encrypted: i=1; AJvYcCWIqFqDDesYId4K/I/MyWcA89zLZeSqqugPo49/qKZoNZ1FMSBXTrwjgBwTT1yWWEp5QPw+BxbSxsieV0KyHMwY@lists.infradead.org
X-Gm-Message-State: AOJu0YwMx4buqJYD1ujeUwWeGSvqLVrLaDDKhYzgHbPbmVa1GYQijaxG
	Y84pACtymNduIyoxAF30A4TAncQ+Yl3k1iRa//T1nqyGeVj8as+Ez0c2iJwlIJBb9h4=
X-Gm-Gg: AY/fxX4Ut1WQdALorP6sqTr2+RoCTO87ikDDM+j7aRTCV/vFvP3SGlzgUAnETJG+oFh
	LW4P4TvSf1tkRZRPmQi+U/lkbcT1AHrwyCOAaQd5oOF0/eY3kTC7pGQ6KKhOVfJpyYorlWDH4F+
	ZYm4TdfB2jBFtD8VMj4WHFmv8hLNzQ6G5n8ucwD5JFVw56o2xBH1IHdx+wvMXCJso7CkovoZcMp
	dJ34LBVuAnKcL8u3Joe3kiYeRM3uB6l6j0JegfUx8/gxNuyfXSDUDkD8GXZbHSRjE6cljxC80cU
	5NXU7ObpcFRRUZJfdaCzhQPtU1HhKg/ukC0Yws6lAYqy0TyERQxd+RM0YwD6vdX2iXlHWwTRV5D
	bIpL8vJsbNLr7Oez0eeDALX3zXjuG3AG/Ri0Tb+ZKJRdmtR/QtFvS9XmEPfwi4G4o1CbttnU59O
	IB4hL2VplfouBI0apb
X-Google-Smtp-Source: AGHT+IFCoak6awfsvNzuanPNEFvtnm4npy82/7GDiD4hlE+WRwlv0VOch5efQB3V/p3Rq/g2NEI9Nw==
X-Received: by 2002:a17:907:d94:b0:b73:5f5e:574d with SMTP id a640c23a62f3a-b7d23a89c52mr1790501866b.59.1765959703434;
        Wed, 17 Dec 2025 00:21:43 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7ffacd9192sm337793366b.70.2025.12.17.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 00:21:42 -0800 (PST)
Date: Wed, 17 Dec 2025 09:21:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
Message-ID: <max5wxkcjjvnftwfwgymybwbnvf5s3ytwpy4oo5i74kfvnav4m@m2wasqyxsf4h>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
 <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
 <aUJh--HGVeJWIilS@sumit-xelite>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6kfp3quyfb6lwgz"
Content-Disposition: inline
In-Reply-To: <aUJh--HGVeJWIilS@sumit-xelite>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_002145_849469_0A2CD23F 
X-CRM114-Status: GOOD (  21.74  )
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


--p6kfp3quyfb6lwgz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
MIME-Version: 1.0

Hello Sumit,

On Wed, Dec 17, 2025 at 01:25:39PM +0530, Sumit Garg wrote:
> On Tue, Dec 16, 2025 at 12:08:38PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Dec 16, 2025 at 01:08:38PM +0530, Sumit Garg wrote:
> > > On Mon, Dec 15, 2025 at 3:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@baylibre.com> wrote:
> > > >  - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister=
 all
> > > >    optee devices in its error path (optee_unregister_devices())?
> > >=20
> > > This is mostly to take care of if any device got registered before the
> > > failure occured. Let me know if you have a better way to address that.
> >=20
> > Without understanding the tee stuff, I'd say: Don't bother and only undo
> > the things that probe did before the failure.
>=20
> True, but this is special case where if there is any leftover device
> registered from the TEE implementation then it is likely going to cause
> the corresponding kernel client driver crash.

You are aware that this is racy? So if a driver crashes e.g. after
teedev_close_context() it might happen that it is registered just after
optee_unregister_devices() returns.

Best regards
Uwe

--p6kfp3quyfb6lwgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlCaBIACgkQj4D7WH0S
/k7jZwf/S32gHxmpuL9ts6Dq9pI9CDW9KNDwfTzIptzaNQEofHnz2Ph9Ejs/bZAl
1skNWxxt2vGIVP016BxUqi9V0RyKNUV0GCk23ZMdeGE09A47y9N0bT00HDJrrZYp
FYCoNNwL8vICQzfAti/0+DHGI1uHwrXCwQWf/VaNggCAhb3eTCfcmUtogT7hhbtH
+6bLk0/LEYmrIg1pkq6m4Y4vxBOEwnSZVDa4/15mxJ7jExJeoQmha2Y2whq5WZtY
TEMgHL6KNg7ifbee+/Y0HUJizQ45rf4pJo2bvrbwXc+3KaEqfzNpD3jKVcKJSNBx
jL7uprws5c1kFtHG4vp8QjaZRNJtpw==
=trcC
-----END PGP SIGNATURE-----

--p6kfp3quyfb6lwgz--

