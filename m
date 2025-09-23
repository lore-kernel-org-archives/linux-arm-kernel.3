Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75019CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 20:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdlu20rBCmLHD/cmCz6jZNQZ7hsZ/+Qk91a/GIE2IBQ=; b=o8OmqalEQRwfr2UGHrnEp+1Lca
	sAxndHigFIp6ubQnt/tHiIr1gijHpIJ55GbNLjs/vZrhhMJlqEpo/dMrDwVWhPhgDWjrh+YGrXHEj
	CmkEwnybZ3ryCc45D75Oy3Qd6BStCdRE3Xg5qrRMTCI3nGeBKtL5O4NNEreoce9FI3Wa9WkwCFGzP
	2Scj20yR5XV/Jp2lWSK6tAbn6Ooyq7+SCp9O/EsqxlArI9cY652Q/Cp2aAFanP0/sPL0IuYdREOA4
	A244KrwurnHD8GgcmZJeax8z8PFU/w5DYKLSB1tcOonXAi7DMJS+/OFBVj5/wTTW1L+/fqyHm8Lub
	4qhtcFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19lG-0000000En9D-0gCP;
	Tue, 23 Sep 2025 20:37:18 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19lE-0000000En8i-0mmQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 20:37:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-363f137bbf8so44093351fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758659834; x=1759264634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sdlu20rBCmLHD/cmCz6jZNQZ7hsZ/+Qk91a/GIE2IBQ=;
        b=FjjFzTKgbckB4INo4b3Ke5x9xthNbBxNuk3y4vDlhiOuQTSUy8y1m+LouqZttjiSeF
         j+IUGkQcIgnsgiQ4DWULz5k2huqdmipmrzXqIk1L8kj/rsMp9DvH9SwBCgrZrV8OHqOa
         kkRMFLyyx4/N8hx72smyQC5674lXkdYQ1V0cuNGhV/h+r4mHO9JY124VIjOr8hYMDhBq
         bg4gHpCSsiZbMTCOW9ndcgT9fxE5bEscAWLkU15kBUmIVZKEiK+a/vUxmOqPnNo3S6Ug
         kaI2kH7YS9Bh0MSxq7xSzA4ipWSB1EcoYcYwWfnxyPJkvIcmxYzmU+6i8lvfLudAhmOK
         Fv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758659834; x=1759264634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdlu20rBCmLHD/cmCz6jZNQZ7hsZ/+Qk91a/GIE2IBQ=;
        b=Wu7Uwjsn+QInipZFXsfIHKr+1GAgQpGHvqjLm0Ad0m2WXN7jBTj0wIv5o3XxjWYkC9
         IaofsCx309F27mMa61vh1zZeWOydzl+qsgI22H9usnWDk/5DwMqrTjuQgNHfHLXjR7aw
         J/Gva3dekR915rkCBStbaWdXVpoGfOK8znilyzrQM7c186xhEHC2Miq4SkNQXmmMr+DR
         V1cT8lvp8E4IWAuupHrl4cyjhQBIWKpVCHy6p/7YNWbfYVErgRQwuriuUvMcL4zgSgQA
         xAJBWFg28LuROlPfHa5ESANSiQqlzEDu4pNm0X2uJJRATMDvjr+J1olfA40TrDMFIoWA
         +new==
X-Forwarded-Encrypted: i=1; AJvYcCW2F0MvDktz0C2vSYmuG8/jPPxFfY5nBWQhLJ/n7/dYI1B/7NXoQ1cUiEtk00Dn6brs10PzmPIrKQwc5zmjGjhs@lists.infradead.org
X-Gm-Message-State: AOJu0YxcZBhjkuBbLayBcPpgGIaPbFjHygueazd2psWYVRWSHAUL94Ab
	1ZW5gVb/Rwuz2cIa8xPJhGNywApmWBaLJwBXcMeMzXPmVTvWpGXCd4Ue
X-Gm-Gg: ASbGnctB5ENUqnvHIFlW3sVvJ94oGEIGQjjH0q8gkDFi2aKJ+IPV7v4VeUNYZjDiyKt
	rV3+MVloPp30Ykyg8p8UqPRGlL5a8LfvX1c5Yh0jZUCVpv/Q9atW9u7yBd3Ksw0ezJjs3Upjug3
	v2uItiUln2sZKhqsNVEwsOjTk6Ocu/fNvAAu5Ao1ciMbCAUQ80rV8cv6ERfvFSVFd/fRgaezkJG
	fzKle7a/0xHwpnZ6FUqx9leRjlLuwjAQkx6bPz+WiAkffE1rU0x6GeWpWp8sAkG1NhUjwNjaizn
	gtaF1A2huuKkmrUGsZwtGV7lk+TM1+uDdD2xE64s5q8cRBx9TU0XloDgrlMVDrlDtf/gtozRZvM
	z9N+8BKQndrKX1CTi9qsxb+IQXu27xtN2udQ/hsiWiIcRvH6Ht32LNU0XN1M=
X-Google-Smtp-Source: AGHT+IFuA8I9VNhcD2Q41OOz3JJ/4CvcKHsvlANmcOu/VUqlfohOjCTLqnQUny7hlksdlQImrup3GA==
X-Received: by 2002:a05:651c:4395:10b0:338:735:8a79 with SMTP id 38308e7fff4ca-36d150a49ecmr11764551fa.1.1758659833515;
        Tue, 23 Sep 2025 13:37:13 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36c7a76d202sm10325501fa.19.2025.09.23.13.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:37:12 -0700 (PDT)
Date: Tue, 23 Sep 2025 22:37:10 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 0/7] I2C Mux per channel bus speed
Message-ID: <aNME9gWzazXTWtzw@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
 <0186ebba-958b-8076-3706-1edc75b6c6d3@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="otWbKmgQiAM7SsCc"
Content-Disposition: inline
In-Reply-To: <0186ebba-958b-8076-3706-1edc75b6c6d3@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_133716_259082_E159848C 
X-CRM114-Status: GOOD (  30.52  )
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


--otWbKmgQiAM7SsCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Peter,

Thanks for your input!

On Tue, Sep 23, 2025 at 05:10:16PM +0200, Peter Rosin wrote:
> Hi!
>=20
> 2025-09-22 at 08:20, Marcus Folkesson wrote:
> > This is an RFC on how to implement a feature to have different bus
> > speeds on different channels with an I2C multiplexer/switch.
> >=20

[...]

> > Patch #1 Introduce a callback for the i2c controller to set bus speed
> > Patch #2 Introduce idle state to the mux core.
> > Patch #3 Introduce functionality to adjust bus speed depending on mux
> >          channel.
> > Patch #4 Set idle state for an example mux driver
> > Patch #5 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> > Parch #6 Implement set_clk_freq for the i2c-davinci driver
> > Parch #7 Update documentation with this feature
> It seems excessive to add idle_state to struct i2c_mux_core for the sole
> purpose of providing a warning in case the idle state runs on lower speed.
> Especially so since the default idle behavior is so dependent on the mux.
>=20
> E.g. the idle state is completely opaque to the driver of the pinctrl mux.
> It simply has no way of knowing what the idle pinctrl state actually mean=
s,
> and can therefore not report back a valid idle state to the i2c-mux core.
>=20
> The general purpose mux is also problematic. There is currently no API
> for the gpmux to dig out the idle state from the mux subsystem. That
> can be fixed, of course, but the mux susbsystem might also grow a way
> to change the idle state at runtime. Or some other consumer of the "mux
> control" used by the I2C gpmux might set it to a new state without the
> I2C gpmux having a chance to prevent it (or even know about it).
>=20
> You can have a gpio mux that only muxes SDA while SCL is always forwarded
> to all children. That might not be healthy for devices not expecting
> overly high frequencies on the SCL pin. It's probably safe, but who knows?
>=20
> The above are examples that make the warning inexact.
>=20
> I'd prefer to just kill this idle state hand-holding from the code and
> rely on documentation of the rules instead. Whoever sets this up must
> understand I2C anyway; there are plenty of foot guns, so avoiding this
> particular one (in a half-baked way) is no big help, methinks.
>=20
> This has the added benefit of not muddying the waters for the idle state
> defines owned by the mux subsystem.

I pretty much buy everything you say here.=20

I later saw that, as you pointed out, e.g. pca954x let you set the idle
state at runtime which would have increased the complexity a bit.

So, I think it is better to do as you suggest; remove idle_state and
keep the rules in the documentation.

>=20
> Cheers,
> Peter

Best regards,
Marcus Folkesson

--otWbKmgQiAM7SsCc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmjTBO8ACgkQiIBOb1ld
UjIwfA//Rz23XygcpF0dwlGWKA/FBtIORJthioBHmNmVWREax7GLJ/h8ziRohWL3
kTW9O/vVbYdJe3LhvBazB9KL2JjRh1A0p5ijLiuI0Gw6WYy9sqroZV7SzmP3P8WE
PzLR41O9IVVEVvBcWSmh/0Rcm+cYAeLwZ2F1O4yiplpiP+Id7f378pCPPxaFtN2g
Ea9J0o09LccZC4nERdvrI9QUrfxxiPUBF71+VMrX/Wlc1gUI6JsmGgqpIiz97kiC
IibpcKgNocQgA7YWCbL16EvFkX4k+HF2L7UQqGtijV0OSNxFtsC2woavw2qJFBjl
IZtS8aLXdx9DevdcUuYXscf6mwGVFZQDNahDS2KGknsHj3DMvEFO9AMEcIb7995j
j6SPF6l9/23SqC5mYxQ8t2PSnbgTvfZN8HqycI8oiV0y4QHNrJ1dK6S/BaHcInRw
C4IKNyMZGclPFreGDD7JdxRu/XgQb3ZfJi156LEfuMSMXQkUPCLWbGjT6DOcy+Pw
tHAiEr50HWxVwpt/TUfualMNd2ldXQQDTW7Iyz2tTlQn78BZU/Ku37YXKg9vPe2r
wURBzM/VUk+ToGhH4lI14vqTVlOFi1keu6dnae7Bb7yAf9W372JnVhwwNiU3HXbf
FXnOTa4MlQjThE+eerYrSTnDu0bViq4w8wsg9hlSXp7w0+A+4Ec=
=av5T
-----END PGP SIGNATURE-----

--otWbKmgQiAM7SsCc--

