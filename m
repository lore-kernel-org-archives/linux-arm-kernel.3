Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF2DEF48C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rU8KsLHRo5ZlxNTKDAHqj+wy/9XSKwf/xleKqlzrXX4=; b=DxT1CFG08u34P0Nn60ED+Dd4gL
	O8uQRzKz/jdvHBrXt9IO8Dvco1da6e33QlcN/kDT/7YdgPh1AiK6atBuJMoQ/TakFFZyeEqkOsbqz
	Iz31D947IfGJLWMBGbcDEHfxzM5M5VG42qTxSOXZEZDKQYs7k0v3yMH3XdWm52SYe6ylW0U3Vk4jD
	TH+mIjGbjTggE42RA/7R5LmaKV30YGNz/gAtpnSuGHchCx460bA7LuF5fWbBpZV2s4OW0aGXw4JQd
	4T7JH62+UNqcU5YqN4tTrGG6Hc0V7KL0vTaJSwuugoIx9+8msRTGVCKMId6XNthvmDQQNveY82tSr
	mLWXim7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEnL-00000004XHU-3N8I;
	Sat, 14 Feb 2026 12:30:43 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEnC-00000004XEa-1Op4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 12:30:42 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-59e4989dacdso1856546e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 04:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771072232; x=1771677032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rU8KsLHRo5ZlxNTKDAHqj+wy/9XSKwf/xleKqlzrXX4=;
        b=RBTqSwqeY+XD6CgPDdKld0YQvjpp/PvGR1nd/juyvF0y4jkwYCzBJ1vmXYj0qZm5vV
         JbyQwgzAM9u5tFNYSRIq3u9FL3NUY57QFkPGZTJ7r4zFRP94rpQlaLnW3TzOO69QO0t9
         5HPyBjID++JkAnPGMHLJ14YoJsWyigHzh6GT/M19TbIB8olOQEEsuIl6nxxd40QX2XXn
         Ci133nxZse4Fz9V1Fby5o8Qs9tYiOPSNhKVb+CecoxR0Eid5eNEHYblgs+uRCio3e+hX
         KEhj87T5CBYGPfDsMGcN+NwYv34RfU5bLDRTJMAEjiqWpvGBelTcmqPKsXwr9VNsvkL6
         BZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072232; x=1771677032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rU8KsLHRo5ZlxNTKDAHqj+wy/9XSKwf/xleKqlzrXX4=;
        b=vRl4X+Cw/slujUurOSCvmQe7rBOSElexSpt0XCcCwTGL9NkW0YniZknw5GEAHgQ9U8
         5T9jQ77BFfYFqO3OF+PBZNUGFuZpkMPUr5yJt0Nbgtvtuip9BUanGr2+GPQFfvTnzAR/
         xhVC6fk/zPplLuJBnWxMDHjyLn1wv9JW6vWMZXwmJkvj1sDsdQO+5/cbuAMaJp9DJD3v
         eJ7QO+irSqOycX0/GZI7n4zekyyO3XGVyzOXASnx2USO4rzW7e/6fW/BU/GX/noD+uzp
         s2aAJsNC61AlEipHB6y+uk4+IDTq34OAvrT4n7EqEcheywlaq/te9Xl2JcJuI4QOa9cI
         C3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Sj7fPx6pOuQyDG9a6gmVnq48W0cEdvfDnV42kcQLoO/db+bhi52+BCkUl4WgvC43eHMX+ualnq6Oo34A/+eH@lists.infradead.org
X-Gm-Message-State: AOJu0YzfYxy6ORDFgZuAHPUoM1mmjLC14ilREAMuqVd5nnebzq3ZhDfr
	QOHJLTrNuM9W/UgLoS5Gyz5xJfKAEEMg/JcMwQ3xGYsh3l1kL6+jNGeT
X-Gm-Gg: AZuq6aIvcZy65D+OW2u/tK8s+KJQuOD01i1qcdgmI28vll39YI7ekaodNgQa/yIgEJ+
	I8EqgVpK/BZPav229yVLnPFD02qQ/Ts1lWUdwUC7SKj/N2bQoAq3Dg6VE7xJTdH77AQy9Hs5dBv
	vARG24NMhr7daye9QbQn1fV2mPAzfr7WpH3A7WwKwvVfV+M4hxfFFW6Yh4zx7Cm2zXs4L4s5vZC
	Ycff4g6JXSfECgqga1O11J/xoNZ0Jok0KD0QX8o6StKalONrcxA03Nn2KQxg+5MxYkCvSDqouAq
	+TDcBQR5AURipY02gSVokIK5JpFVU51d0LxPMflz7mmzbYkLc3nz3BXre5hDMYJB/CoiQZGg/IV
	FLEGAGAMHP+vLCZD1YMQeMzsgDT1PFlBTNlRhHD4h4/I9+16hhOWIUiPl3kYLgmN6JpclGY1Jbf
	+af+OxIg9rtibTDkzsOazp9O5cmXZ5SO5B6D8aA6niydk8WQtHmBJ8oCGgu96u
X-Received: by 2002:a05:6512:234c:b0:59e:2242:fb9 with SMTP id 2adb3069b0e04-59f69c27962mr1550480e87.16.1771072231684;
        Sat, 14 Feb 2026 04:30:31 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f8dsm2150105e87.49.2026.02.14.04.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 04:30:30 -0800 (PST)
Date: Sat, 14 Feb 2026 13:30:29 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aZBq5QGHFcQYAONv@gmail.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
 <20260213-i2c-mux-v5-2-fb2cbf9979b3@gmail.com>
 <aY8JRikJpM4v5BcM@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l+WwOMVdoDQxRCoU"
Content-Disposition: inline
In-Reply-To: <aY8JRikJpM4v5BcM@black.igk.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_043037_374176_D38C8606 
X-CRM114-Status: GOOD (  23.04  )
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


--l+WwOMVdoDQxRCoU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy!

Thank you for your comments, good and observant as usual :-)

On Fri, Feb 13, 2026 at 12:21:42PM +0100, Andy Shevchenko wrote:

[...]

> > +static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id)
> > +{
> > +	struct i2c_mux_priv *priv =3D adap->algo_data;
> > +	struct i2c_mux_core *muxc =3D priv->muxc;
> > +	struct i2c_adapter *parent =3D muxc->parent;
> > +	struct i2c_mux_core *mux_locked_ancestor =3D NULL;
> > +	struct i2c_adapter *root;
> > +	int ret;
> > +
> > +	if (priv->adap.clock_hz && priv->adap.clock_hz !=3D parent->clock_hz)=
 {
> > +		mux_locked_ancestor =3D i2c_mux_topmost_mux_locked(adap);
> > +		root =3D i2c_root_adapter(&adap->dev);
> > +
> > +		/*
> > +		 * If there's a mux-locked mux in our ancestry, lock the parent
> > +		 * of the topmost one. Mux-locked muxes don't propagate locking
> > +		 * to their parents, so we must explicitly acquire the lock above
> > +		 * the highest mux-locked ancestor to reach the root adapter.
> > +		 */
> > +		if (mux_locked_ancestor)
> > +			i2c_lock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
> > +
> > +		ret =3D i2c_adapter_set_clk_freq(root, priv->adap.clock_hz);
> > +
> > +		if (mux_locked_ancestor)
> > +			i2c_unlock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
>=20
> > +		if (ret < 0) {
>=20
> Would it (ever) have any positive returned values?
> Ditto for other similar cases.

Nope, I will change to if (ret).
>=20
> > +			dev_err(&adap->dev,
> > +				"Failed to set clock frequency %dHz on root adapter %s: %d\n",
> > +				priv->adap.clock_hz, root->name, ret);
> > +
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return muxc->select(muxc, priv->chan_id);
> > +}
>=20
> ...
>=20
> > @@ -223,6 +317,7 @@ struct i2c_adapter *i2c_root_adapter(struct device =
*dev)
> >  }
> >  EXPORT_SYMBOL_GPL(i2c_root_adapter);
> > =20
> > +
> >  struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>=20
> Stray and unneeded change.

I will remove it.

>=20
> >  				   struct device *dev, int max_adapters,
> >  				   int sizeof_priv, u32 flags,
>=20
> ...
>=20
> > +		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
>=20
> Why OF-centric APIs? Muxes may and do appear on other systems as well.
> Okay, this function seems fully OF-centric :-(

:-/


>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20

Best regards,
Marcus Folkesson

--l+WwOMVdoDQxRCoU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmQauAACgkQiIBOb1ld
UjKjRw//TDudQNFb5scI70oKQYlNoQXhaWf3LGN9vJybxeuMDXu5vWYqZWSLx1BP
j7DsY/cHQFVA1E02tPCQfrhrhiezIkKd+Q/7PpjkW/0g0XxySG9wfdHpijZvbTz0
K/ROFizS2DsSuh74HdSUG2qWYyXVlNriZgR7JDJAmZarSTgRuKZ9q2I+uxIe73Ip
eZrwGMM3eCZtMPOUKBa3WNRD4VH01+0x70t3LGWpdQMrlhQHdOYmGQ+/7UqJOee9
srjUXjXTMvstZvb30FSCr1qC6faTcKrbzpZU/9fJ8TgzgAU1K7SzKUBbt541babV
okDQBZbtm//FRlLWP6WsX2Cjo8AKZ1aKURnXJBmJCW4FgYX6U0ZEuhBS7/uHqJwd
N69T35fj2LbvF+sXjIcAeT8pDUx02lWwdfOu8xGt5X/ARPkFUWhpFo7YtreyK8Yn
6ER/LepKtCQ2jC3JF4I+zoDz+uJPz3S4SU7rhyV0ELPer+z1FljRIGQaGnfh0jzb
OfVMPJxIBmxm7I6Ip7mnh9Ey20En+PjuyD1Hyv0rmh9FgSVhSDya4AyUP6VEmEw8
TLRKRH9F3Fo9hHUP+ilaMsABQAnpfUuduqof3Xy2rD9UgsMjS2xDrTe4oULvdaz9
mgDXYDPH99ttNZcCnFrsbz6x4TWawfTIcmfrLYhZmjVw0VIClfA=
=vsIN
-----END PGP SIGNATURE-----

--l+WwOMVdoDQxRCoU--

