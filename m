Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28860E98DF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbZ5b7ao+DiagEDcdfKn3Bm3NVsuaQOHTS0dAlMskSs=; b=rfNx22L5SAGnRlAmj2qTltgqAT
	eRUg/7hr8eG5ggF8DY3wL2srmdzu9/KQjAR9GkAYGla9KlBV3zUmvIExfImMbFpjWPl3KsUlnxsli
	izX/+hRmYcqUOxs9+8wlPCyaePW0zG7P48II+lHnAszpakgXQgNjMDC7ZDY+OVM73bHThghpYcylE
	s4zuMeZb4TA2mQSjRErA8XXy4jqn0odO/1P49Lqp4YiuK1hsnzE4X7kaEEFHk3EeWWi6eR66oEEUX
	ATXr8wFHGodU3z0RyvPeLcrx633/kyjgyqEb+HQTZhkgumuU+4mnHzrCVxuh7zehf1Vr9kQIaW2Z3
	SdgEQGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQNa-0000000HNhy-3MNN;
	Mon, 23 Feb 2026 07:29:18 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQNX-0000000HNgF-1o6H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 07:29:16 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3870902760cso35007741fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 23:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771831753; x=1772436553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hbZ5b7ao+DiagEDcdfKn3Bm3NVsuaQOHTS0dAlMskSs=;
        b=Mlx5APr4mA12FSp9MUzXQrSZCouIkK1Oa6vGV6LWzVMpjql3dK0U/2XdLkdHUymw0J
         +Euw9cnDTUjel7zhN+YVeKIdD5fECNy8fNzJwUcgPndawNVI8JvZmYKcALgQ5QkHmsV0
         IWDh4wp0fAyFniFpzJhJVv55tydilrO/c9N50dfhCMZ8OriCZhDDUShSKOPTnbNlf9X5
         gvAjFdYDtmtvNzIZeVrejGWeVmySfT5TrL5agUgtoxhcEK0pQ8pkdIbnO6ftp/q+Xg1l
         jd3E2zkBnwDotlrsOtCFmKnkJbx2s8fLD9BYxVeWEof48K2sONL+n7TcQDBAm1A7u8DH
         A/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831753; x=1772436553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbZ5b7ao+DiagEDcdfKn3Bm3NVsuaQOHTS0dAlMskSs=;
        b=Rb6D9/ofvkph//I26kh7Iko2ayi7j69mn1dC3mEKD3nKvTLP0Ok7rYwVSRPX0OHPk6
         u8R/bjPRqrJKkXbGGohmYExdaJshdeYkosHyemfqEPELOc4hmfFtrCQZ2eNvmIwQmzsb
         IHt7yVomzObCkuXzFA97Z2Chiaqr9Ik75OSvRuRaMV93oZ67BuckUKdofwmP07WuUOK1
         TUymfdZ1KkW3Nghzg4sKj2ujSSwAs1cgOu4vPbvkPbcxfkWVeN0TxPTvfbK/IdhgHay/
         ZhI/7fkodacJQaliaKmPW7XNtHIdsO3i6eAfxNCg/Q1OW7GCpQFkbfItoFp/B1Dv2a7v
         1B6g==
X-Forwarded-Encrypted: i=1; AJvYcCXkjmsq+2IB2FmYPjOL30iPvR0UMHhotlUja2sjZRaS9mc+6LP9aRP0QpTrjgG8kbLtPW7vDEMRwm9ydjLZmmV3@lists.infradead.org
X-Gm-Message-State: AOJu0YyM7hn1aekNr0LlyYJIsZh3PREtYGDEgjMvkoRBCfE+iF44+MRT
	qFC9+4JkQNp0Prz1FW4XoAllwE7qV2l1pAE3qUxmOCuryoziFlkyEG+f
X-Gm-Gg: AZuq6aJAsDwEpVeph5W4pcbp5K1FRtnYiah1iAxcTeyZpjbOnzqIBGNfF4jfJfbvNip
	cvJLpVxC+FzCTUrF9dUjxmYB8n/pShJ2rnA1h+d+km5+fKjt5wmKQsIZr2lGlAn6FmTzdRotGNN
	iRx1icPng3DdIp4SO1duuUpyWLQKbZEkuO8uwqdB7fQhPBz+vpFN15tx5i32spkBjbnwBIyZrGx
	Y40sVPDr3DyeXFwXq8/uaspUvPC90esEcNBRgFHJb+MVKGR0MC8iRahDnZTEpBdiQVDrP9DMkSe
	RyGwAeoy7TYEOciRHhNcsWBNFujyZWFGt/q5Lq5ophHTedAX7sAshK/J3qNbnijFrgfLOIyIOM/
	oiUczryKd1d9GlyZkUrPsBqK5OEEHPfP4JkvhKdow5oONMCHy8htftFqK5K337mjx4itRcdVqOd
	ZBVQP8ikNg1x6PNOjSGBEi8tmyLUYqGDFHHJWUfOG9Q4JIQGu3HYXuHbdsKaOV
X-Received: by 2002:a05:6512:1599:b0:59e:645d:192c with SMTP id 2adb3069b0e04-5a0ed99c6admr2114208e87.24.1771831752661;
        Sun, 22 Feb 2026 23:29:12 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45813sm1367725e87.64.2026.02.22.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:29:10 -0800 (PST)
Date: Mon, 23 Feb 2026 08:29:07 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aZwBw4vSNO5YNQ1d@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
 <20260216-i2c-mux-v6-2-9be28ecfd7e3@gmail.com>
 <ab7090f3-4c03-098b-b118-4cd7a68af8f0@axentia.se>
 <aZNm6LSK9C8DHC8U@gmail.com>
 <e21781e7-0ba2-19ce-3c0c-bd198e73c03c@axentia.se>
 <aZVkHoDsJc6CPszz@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MoMPLdIF9j3bHqVN"
Content-Disposition: inline
In-Reply-To: <aZVkHoDsJc6CPszz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232915_544542_A733889D 
X-CRM114-Status: GOOD (  33.12  )
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


--MoMPLdIF9j3bHqVN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, Feb 18, 2026 at 08:02:54AM +0100, Marcus Folkesson wrote:
> Hi Peter!
>=20
> On Tue, Feb 17, 2026 at 10:37:39AM +0100, Peter Rosin wrote:
> > Hi!
> >=20
> > 2026-02-16 at 19:50, Marcus Folkesson wrote:
> > > Hi Peter!
> > >=20
> > > On Mon, Feb 16, 2026 at 05:40:37PM +0100, Peter Rosin wrote:
> > >> Hi!
> > >>
> > >>> +static struct i2c_mux_core *i2c_mux_first_mux_locked(struct i2c_ad=
apter *adap)
> > >>> +{
> > >>> +	struct i2c_adapter *parent;
> > >>> +
> > >>> +	while ((parent =3D i2c_parent_is_i2c_adapter(adap)) !=3D NULL) {
> > >>> +		struct i2c_mux_priv *priv =3D adap->algo_data;
> > >>
> > >> This assumption does not hold, making the cast pretty wild indeed. T=
here
> > >> are other i2c_adapters with a parent besides muxes. See e.g. i2c_atr=
=2Ec
> > >=20
> > > I see. Hrm, not sure how to decide if it is a mux or not. The best I
> > > could come up with is to look at the i2c_adapter.lock_ops. E.g.
> > >=20
> > >=20
> > > 	while ((parent =3D i2c_parent_is_i2c_adapter(adap)) !=3D NULL) {
> > > 		/*
> > > 		 * Check if this adapter is a mux channel by verifying its
> > > 		 * lock_ops. Only mux channels use these specific lock operations.
> > > 		 */
> > > 		if (adap->lock_ops =3D=3D &i2c_mux_lock_ops ||
> > > 		    adap->lock_ops =3D=3D &i2c_parent_lock_ops) {
> > > 			struct i2c_mux_priv *priv =3D adap->algo_data;
> > >=20
> > > 			if (priv->muxc->mux_locked)
> > > 				return priv->muxc;
> > > 		}
> > > 		adap =3D parent;
> > > 	}
> > >=20
> > > Or do you have a better idea?
> >=20
> > That looks fragile. My recommendation would be to avoid trying to
> > guess how a potentially diverse adapter tree should be handled
> > locally in the mux code. To me, it would feel better to introduce
> > locking/recursion in i2c_adapter_set_clk_freq() for muxes (and
> > address translators), i.e. take inspiration from i2c_transfer()
> > and i2c_smbus_xfer().
>=20
> That would be a more robust solution indeed.
>=20
> >=20
> > I guess an unlocked __i2c_adapter_set_clk_freq() is needed.
> >=20
>=20
> Rethinking the whole locking approach;
> If I follow the same locking logic as in i2c_transfer/__i2c_transfer, do I
> really need do take any more locks than the root adapter with
> I2C_LOCK_ROOT_ADAPTER?
> As the frequency can only be lowered, an intermediate i2c message will
> not mess anything up?
>=20
> If so, do you think  i2c_root_adapter() should be moved to i2c-core-base.=
c?
> Then i2c_adapter_set(_root?)_clk_freq() could lookup the root adapter
> and take the lock there.

I've reworked this during the weekend and think I've got some my
answers. I will send out a new version later today.

Thanks!

Best regards,
Marcus Folkesson

--MoMPLdIF9j3bHqVN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmcAb4ACgkQiIBOb1ld
UjKEDg/+IBFMAKiHUARtHOWdNvNXagaezYzxvlG9U7d8nSHCg+2eZpqJYyjyBb1j
WGlrRz1xUjCVcP46qy0OOMof5l0tyra6E2+bVwBJ2V8Rg4msHLQ6Fq4mQZ0H2bKG
sGQyy0YOVzi3OppgDVthHyEbYB6h1PPKpGzyzHfdCoAbU2vlbhoK5ta/SNu49Hsj
RG7XoX66PCKEi8VIMmb+RbUHgzOVVmBe6Ycv7IvvDjMze92oudNu3BhUJugi6y7A
45WsilJKAC2SR6Wc6lWQPSZ/JH6bii9vCCealITbv1xdOGRWG7AJtnGXB0T86jPP
JyB0wguefWE8O1WmR+wZ+MFBdUQZyQ54fr3LNBcX3gkze82Yay3zhMCNbDToqYHl
o2aWR2LjMW0skWna3a6FlhEDh/reoNavq7ARKv+ANEP7VrZYEXZgrAfMSQZ0iy0p
AVZOEPVPilfnoaGo7DD40v6Gd41yHqjLuabIEfvb/A6VdTq/MZcV30eBeV/EyqVe
wdGTLFY+Ivm/GNJ2MMak/ju6zmfWzzVRj1ibZjEq5KtWaxiPSCY/ewxNWXXh+yQu
XQRqo643UB3plS3w4oTWGO4JtKDZ3B6vJKPKLlT4D4nUjOCCO70mxENNnfoSGOwn
DjPonu0VeDuVcASuSOJQ4/9bJaQ6sBWCtqn/EHWfKzi0mcfx2e8=
=514b
-----END PGP SIGNATURE-----

--MoMPLdIF9j3bHqVN--

