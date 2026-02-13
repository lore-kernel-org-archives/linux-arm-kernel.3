Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8817FEDF17C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smt2I3TIoGWQUiQ+jL/+iEqgzDTzVh0P/C3zq5KAyl0=; b=o4yGxqB6RpOBhjANUwMeY2PGBI
	7v8lz/GV/DputmbBsd+ANWqW/P4MXs9qeq8QUeK8zWzNcSiL526GsiDhBSJ+EsmPT9EiAkv8SG2le
	4IVv9ilAZ9BU7HXC4njgEmB2HncCpKkVWpaqZJvCL51IkHFZ591TJ9GcsRXHc9ZgltPxEMQokJukO
	9nh7E1L/o+yiCRN2MMcCjWR0hMKSVbIGNanGTbhrxzSIrJm8QO8uJmLFkwJ8n+2wgphQgDQ+6o+9E
	h6YuIpaNuDG0zpKPhLMD7+mzDfRT1p20vXAAbX9XwpZcxCENR2kRiCVu2qkh/D1fCCR51u0DAjFlv
	hzYElGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvfc-00000003eEI-21m1;
	Fri, 13 Feb 2026 16:05:28 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvfa-00000003eDT-11qi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 16:05:27 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-385d9fb297dso9839191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 08:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770998724; x=1771603524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=smt2I3TIoGWQUiQ+jL/+iEqgzDTzVh0P/C3zq5KAyl0=;
        b=YPN3I3diwSD4XELhhqGERQLR0H9EHLe6nNFPD3hLoTM366oGuG62AQ3Vq5Dqqm1zFO
         CPdNl/1q8C/969vkc9QZkZ1kSkXPElTtqvj++EY2Dsz8Fx6eMRxRNnHHOj0Y4DyjE0Z4
         graDulKNuqZ0H0dJMnff/OD1vN/xAkCYnZsZUD16ntNGIs2UUe1a/1bZAY4yUfjLCnhm
         JqOaVxtU5VrRJ+RYzLzQ8ay1PDlYsuUJV8XOArKCcmfrbTJHwPdaL+5A8XnutGF/4Njb
         nogzJFiqIzgGiTkvKtrMfRYrwsu1UyU6FhQDrMnPJwcUxNAHHS8UGIC/1mDEeVLj9bYy
         GUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770998724; x=1771603524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smt2I3TIoGWQUiQ+jL/+iEqgzDTzVh0P/C3zq5KAyl0=;
        b=shHC7n2qFFBxOAsFDtFLRzUNkwvbKr8StgLk2qlNSRDoF9d3Y72OiQZZZ1zpALdgdS
         gRHJsHANCHKwvbq3kY525xPm4bXN+/dFStdVELaMs0NZhmG/SimLCrBUj29Q7CIQa+ON
         3QliHPl5QiiQOFANDkABK/IF4qYmUCdyUapJK3U9XuXvrQ5rvjuSe27BG2xxJKR/8IOq
         +P/iTVu+LaoQ/n14YFHb9PUKZs7tkMXUF/eaPUDrBgg2bZ9+rBxbUOtoXMEatzQAs8gK
         EL0ImDWdeomjpRzkfWSNgVfm1GtJCDrNjgiyii8ceEGMRrO3B4uSNmG6084tOH76PfYs
         P1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+GE3JRgmhgFqnoglJC03K5NltlWSdnCBEO9F0t5vwxTNYI8IdULILAAOfmTbFXRtss+tANed8y1x7V7l+dSIR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8mWIPzKduGJpu7MqZAQUKCjGCogVI1hqTkpOenfxH8H0ZYrIQ
	ZSVhVFKCebvzAXbs/KFqCIpF/k3ZiBWgX+1vg4THs4c9QvGVCMVSJ/rb
X-Gm-Gg: AZuq6aLjj9VqYuIeQctstI5J8pCloJ4IpcKA6DUTn4f/uKMyzUEzieMuVCYI8HHYEoo
	JliVG+D7s0FOFsfWfW2cRhw5ACx+hbmjER5TMPjA6caFrIyyHt2HrUVBufIKVUQNcda+f3ZoL9g
	gUjY9P9PZtKA1kouCNawpO8WyPSH54FRzG4FTUvZA+mKIuUYsfZXS05zjOP396I4YeofxtvzyQj
	XVr/mxFQq+VC+3zp/HaTxSzVGyXd1K3+YRqacvsfq0zRrN50qMCUewxkNLuSTQndZD/BlXfx7lA
	6RLBBNeqfNy4Zq2BZz6xGAWGoLcMcTD/HI9GXA5AJZyS0PZAEH+kkLRqziSVhZgSBpSS50VWJc8
	fyw2fKnMY8mcccBYeJ9aty5Sv4iq1mLkhwN2DYzTqpKxwmbSWMXZBEnb/FQxF0CH/v4BdN9mRaR
	Z8QnvrCuBod3EtZy/7VX1vDJLqXoPwauvMCBcBxxloeq2bjNhdL06wdQtUNI9G
X-Received: by 2002:a05:651c:2210:b0:385:d162:bf3d with SMTP id 38308e7fff4ca-3881050bed6mr7426771fa.4.1770998722513;
        Fri, 13 Feb 2026 08:05:22 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068923aasm13048961fa.3.2026.02.13.08.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 08:05:21 -0800 (PST)
Date: Fri, 13 Feb 2026 17:05:19 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aY9LvwgTS50jLSCH@gmail.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
 <20260213-i2c-mux-v5-2-fb2cbf9979b3@gmail.com>
 <ccd960bb-9dec-3a1b-cf3a-d22b4ccf4df9@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6fcNXqbn+kKd91zT"
Content-Disposition: inline
In-Reply-To: <ccd960bb-9dec-3a1b-cf3a-d22b4ccf4df9@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_080526_312663_3FE88088 
X-CRM114-Status: GOOD (  22.71  )
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


--6fcNXqbn+kKd91zT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter!

On Fri, Feb 13, 2026 at 12:48:13PM +0100, Peter Rosin wrote:
> Hi!
>=20

[...]

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
>=20
> As may be more apparent from my recent v4 response(?), this is not
> what you want. You want mux_locked_ancestor to be the nearest
> mux-locked ancestor.

Hrm, I think we are pointing at the same thing but naming it differently; M=
1 in this chain:
Root - P1 - M1 - M2 - P2 - D1

I'm thinking 'topmost' means the one closest to the root (ancestor most
far away), but I don't stick to that naming and I am happy to change it.

>=20
>=20
> > +		if (mux_locked_ancestor)
> > +			i2c_lock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
> > +
> > +		ret =3D i2c_adapter_set_clk_freq(root, priv->adap.clock_hz);
> > +
> > +		if (mux_locked_ancestor)
> > +			i2c_unlock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
> > +
> > +		if (ret < 0) {
> > +			dev_err(&adap->dev,
> > +				"Failed to set clock frequency %dHz on root adapter %s: %d\n",
> > +				priv->adap.clock_hz, root->name, ret);
> > +
> > +			return ret;
> > +		}
> > +	}
> > +
>=20
> Here, you set the frequency /before/ ->select.
>=20
> > +	return muxc->select(muxc, priv->chan_id);
> > +}
> > +
> > +static void i2c_mux_deselect_chan(struct i2c_adapter *adap, u32 chan_i=
d)
> > +{
> > +	struct i2c_mux_priv *priv =3D adap->algo_data;
> > +	struct i2c_mux_core *muxc =3D priv->muxc;
> > +	struct i2c_adapter *parent =3D muxc->parent;
> > +	struct i2c_mux_core *mux_locked_ancestor =3D NULL;
> > +	struct i2c_adapter *root;
> > +	int ret;
>=20
> And here, you restore the frequency, but /before/ ->deselect.
>=20
> Thers's no symmetry in that...

Good point, I will change that.

>=20
> Cheers,
> Peter

Best regards,
Marcus Folkesson

--6fcNXqbn+kKd91zT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmPS7sACgkQiIBOb1ld
UjJCaA//X2a3lgD8Yp6cOmM9sQs3eZosPkXjeUxzy15UbQSZrNOGnU3D/Ujz2CSQ
QMwdD+KJKws3jTcawHXesvP8P5zePLAo+/Gj78jqJb9QWK6zEdTi4mJLKBDdaSG8
L9UzSJF17NuHfolZ/nAVo3s84jooY4ZE3PU22FPoJzmwtRU28pyl7JKUQLTz8UT8
25AtgTtO8OfYrYiNXcNilZ2ZqwEgamhE9q8U6GKjErrsDJFG97Pal795bis3fUVu
JChwmQ/HT2NZhK/aXBGxqVqEYIirQL/0MC7ZbN4wnEtK2MqNXkwKK5if2Or6pKbE
tP4Ijg5OXrtQsqUhsRbmfxH3Jb5MJsgvmxbde8NPAi0s4nc4IAicL2Ld1ZyaHSXF
pZ0LiekLFCN+BJH3adCaPWUmu6hIxK9oLqXkNTxtZVXEai2ealPBeq1v1F1QfBkx
XrJhb6NRFI82H20vZnAXJyN5z80fVeJHhv527zNwfFpvUIr5itDfB9uDBprDNFiI
jpqwdxILKG4eP6OglarXcBWrVLMrqx+1YsEhTQUOvSMlqa+P6JIDFDhYxR9B+sdM
lser0vwQyOBt3mrLkyJJCC/HDjZcdbZ2Q0WRRjiSyUlWoiaRD7wPNXpBHZLfyAqW
KdOHkIJOJa0QgDJ00I9RfuzhHi5Zv2JtHnzoOBNkpagfCbbh8hY=
=AYL/
-----END PGP SIGNATURE-----

--6fcNXqbn+kKd91zT--

