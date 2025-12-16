Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ADDD5E130
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzbZNSoR9XV7c/fw2WEyAJLfwBQw/kZL/Ydt6MIWYlk=; b=jsAqg8mY1tLJzqqF7/d0xSQEg5
	7tkV8yb9OnbwYZh4u8ruqH3DmkOLpIZ1rz83NvN/OFDdX3DdpaG2tDBmbCDWFvNB551lRYYDyrPuT
	+fXRSQhAxnDhyKdtlW0nLshBiAkkByuiW145Z2o6ywxxh+vKIpUhnD2hV6IotJktb3X8oIk2xfGHK
	ag6KqjfP1b9SrXmnOaUJaT5ui12Uk+7wh7D1a5MjA2Jm2bVA01UTy1JWfSwSP51h06XH5kH+cnwgK
	SIEvfNn0+2k4/JBfUQE9NvOFnSn4h40GUU8N955MoO13/YE96nrNhkwGaP2AaQGCjA8sAeUISZ8yp
	h0i+KalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSv9-0000000560F-2Xkr;
	Tue, 16 Dec 2025 11:08:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSv5-000000055zp-1Cyn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:08:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477aa218f20so29544005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 03:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765883321; x=1766488121; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzbZNSoR9XV7c/fw2WEyAJLfwBQw/kZL/Ydt6MIWYlk=;
        b=DJUKBEwtg4ehk/4LgtJPpMvQJOQeq01bEn7NGvVJeIor6AA7Q+oCHp0VIerowPoRKX
         o61GrxGXCNMp5rBMgVBfk3jmg8BW7lPkp5yi5uC0fEZ/ZeCnX6mCcJPb68WmSGTB9Wmc
         B0WyJ+14apmtL4CQDebYEMQ1pMMjYTm+Zrsa8vHsGd77u/FRvOY1T1tPO5x+GOsAeoFW
         QHxkI/mBK+1mPY0kgfjv80VBY54ZMFruRNluQ3fP5qGlKBDsZZczNLx9KbdjIMdSHQLO
         d63jlj1Md96iza6MErKjUcQZPOYXn/nZFGbLgm7PbLSZon5ddD8ZvVDFsRaNyyqaEmtq
         5jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765883321; x=1766488121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzbZNSoR9XV7c/fw2WEyAJLfwBQw/kZL/Ydt6MIWYlk=;
        b=X4TaKFctZ9pfn01b6gCjgPOVqWkNdPncze4Il+XIATualCAuf5OjLvkoUx2mzmeFaC
         JLow+B0IOfOzUcPpDvCcXmbkoCoN8ZVN5fQwPcy4nTYTxPrSZz+B9EaSpl7TqZZu+2+y
         F6ybtuVf1hqN3RflQptDLECwCrH8M8rD6fKOJudiBykWcLgJc1ctINIPFzOXbq5VBk6X
         dhYSVSY9fyUj42viyoPBZIUXfv6jr5/e9TuApu15rWuSlMUCzjbr2Grl6WN3IxCzvF2q
         E5k3umvy7GJNSk3CJeZH7M4PU/J/Y/CLliZRl7tAgiEW0FSNGjTr3vZtZ+KFn2GTz98r
         022w==
X-Forwarded-Encrypted: i=1; AJvYcCUO9CvuYs/o9/pLPxgie1d4yDy79Rpi6lLrt+Vn7Uf9FxRwhVpYgXLzzHxNKxhoyOWtKISVK2pQBrvp9rE2OU3g@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQ9KJoS79+fiVCyF74pqQbvERBdDhFYQT6vZEZEbodnLPYbiD
	tLb6rufG4cnq5BA+lcr6ULv7YxX1J8Ke9z48A52IHvhD22NQRgeJ/SeOwSx0hV6MvSc=
X-Gm-Gg: AY/fxX5gZfaoCGYwfuVEzDA4R5WKA4o8LYM0GjPQzC72PGTDzsTS5LN46imPfFBpt5Z
	/7i5n48kgW5eUAkelQ3UpJPULtCxp6PlbERNtMruDDuxL0hZA9h2afyo387u6ST1JmGnOF4BHmF
	q0Bw9aPNUqLEHWDKjNfhp8OVSnWC8hbppDPh7jHEgr+HOjD7Z5L5N5jpLPpTmae2HODlUx2a561
	pwTklzr8etQdRWo4PH3GeDEzny2iPVbL5T6HUjyMlM8RaJa1YKFDUhCXEweN09M9BgJQ5mFAiWn
	xYfw77RW8rnOdSJ4Osm8zdOcuuWuM8CGx4a1peAO+i/aqIZs5yMv9g6dn+IB9DGb0muIfMrKFyF
	xHPVoZ69322FsUyqGru6fvIdBfhrSudPLQ93qtRXt9FVlgOKVUD/jCgFR5AmXDCclyi/x2IPPWz
	i7LzW5b9yclgv3lel8ed9+80mbVXsifjt1N8LOmwnegklmPS5vtC8lBwMpFUrnsXuQ7xg9zL0jP
	1A=
X-Google-Smtp-Source: AGHT+IFp5IncMGvMC+pwiacOOoEIbditx6SKu86limMmxyrWyAZX1pq9RrgklnX8yEKbt8tmwVfkyQ==
X-Received: by 2002:a05:600c:8288:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-47a8f8c0caamr134941025e9.13.1765883320955;
        Tue, 16 Dec 2025 03:08:40 -0800 (PST)
Received: from localhost (p200300f65f00660852dfbbf029d2e03c.dip0.t-ipconnect.de. [2003:f6:5f00:6608:52df:bbf0:29d2:e03c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47a8f4ace61sm233401395e9.7.2025.12.16.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:08:40 -0800 (PST)
Date: Tue, 16 Dec 2025 12:08:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, 
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
Message-ID: <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="judjbtjlccebrcda"
Content-Disposition: inline
In-Reply-To: <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_030843_639129_46A1AAD2 
X-CRM114-Status: GOOD (  37.36  )
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


--judjbtjlccebrcda
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
MIME-Version: 1.0

Hello,

On Tue, Dec 16, 2025 at 01:08:38PM +0530, Sumit Garg wrote:
> On Mon, Dec 15, 2025 at 3:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > On Mon, Dec 15, 2025 at 04:54:11PM +0900, Sumit Garg wrote:
> > > Feel free to make the tee_bus_type private as the last patch in the s=
eries
> > > such that any followup driver follows this clean approach.
> >
> > There is a bit more to do for that than I'm willing to invest. With my
> > patch series applied `tee_bus_type` is still used in
> > drivers/tee/optee/device.c and drivers/tee/tee_core.c.
>=20
> Oh I see, I guess we need to come with some helpers around device
> register/unregister from TEE subsystem as well. Let's plan that for a
> followup patch-set, I don't want this patch-set to be bloated more.

Don't consider me in for that. But it sounds like a nice addition.

> > Maybe it's
> > sensible to merge these two files into a single one.
>=20
> It's not possible as the design for TEE bus is to have TEE
> implementation drivers like OP-TEE, AMD-TEE, TS-TEE, QTEE and so on to
> register devices on the bus.

So only OP-TEE uses the bus for devices and the other *-TEE don't. Also
sounds like something worth to be fixed.

> > The things I wonder about additionally are:
> >
> >  - if CONFIG_OPTEE=3Dn and CONFIG_TEE=3Dy|m the tee bus is only used for
> >    drivers but not devices.
>=20
> Yeah since the devices are rather added by the TEE implementation driver.
>=20
> >
> >  - optee_register_device() calls device_create_file() on
> >    &optee_device->dev after device_register(&optee_device->dev).
> >    (Attention half-knowledge!) I think device_create_file() should not
> >    be called on an already registered device (or you have to send a
> >    uevent afterwards). This should probably use type attribute groups.
> >    (Or the need_supplicant attribute should be dropped as it isn't very
> >    useful. This would maybe be considered an ABI change however.)
>=20
> The reasoning for this attribute should be explained by commit:
> 7269cba53d90 ("tee: optee: Fix supplicant based device enumeration").
> In summary it's due to a weird dependency for devices we have with the
> user-space daemon: tee-supplicant.

=46rom reading that once I don't understand it. (But no need to explain
:-)

Still the file should better be added before device_add() is called.

> >  - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister all
> >    optee devices in its error path (optee_unregister_devices())?
>=20
> This is mostly to take care of if any device got registered before the
> failure occured. Let me know if you have a better way to address that.

Without understanding the tee stuff, I'd say: Don't bother and only undo
the things that probe did before the failure.

Best regards
Uwe

--judjbtjlccebrcda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlBPbMACgkQj4D7WH0S
/k50zggAsVQDsAnPdX//uyplsEvssm5818ssVGID4+9TjkXIhLGs1HOk+Aj1Obfh
3kp723jXSfcxla/GVnutv+SGgjCbWQLat1zF3XNhzFZBDegNnPHffiYotY4NYV+x
z+cBC6Mgx1s9c5xNg134fGOJ+TxBlfUxarnCrkXKqWF+dVSwTe5Cv3f0SXlVU/7L
l/3T0OflRgILL2Y6wod6E9ydmYfiSapc79eKAzVY5jnUx1sGt7oLNYrjpHmJklBF
J4I7ToK96aPowluUQqNPzlS13OTb/sx00zg5CnrrGchqVR6i1kK71xhoszfQPcx5
IOs/eRzJsAmcF/JiN04ZsRRMrAvppA==
=QAXr
-----END PGP SIGNATURE-----

--judjbtjlccebrcda--

