Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4406E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 07:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXXoBmrj44IUOz5Es2ozBzd5fhqRhhv5SZZDcT1xe2c=; b=H4qEOvVz3GI+yoGvYS9WK8WZB3
	FAfWUrK2JGTmMijKY0K08uHIKCToG4UXltz7Gs7qwVc+8x4IRAHWqEMgV8U1FOiFdNAdS9dT3At5S
	gX0yf4d3ks0XBUJwBM7ii/ejOGel0FKiG0VCPYMRB9sOHU0gXU+BeojZl+jNwRblSUwWJTeCZtfTe
	4ckAG/tRy4dvwnpgqvu64oDJDQsLM/MS284fEHfQDJV021oOR2vwmbwkJo96lofxN/VTa86ZHUeye
	0cVoaiAfgTLJ6yZRrlslaOgvuFnOxtRwTgFGajFcQJLX9Isq08hKUzAjnjkyD7iFFsDSaI7CZGvbX
	PcHcSyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsbaR-00000009Nwc-27eH;
	Wed, 18 Feb 2026 07:03:03 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsbaP-00000009NwG-1bVS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 07:03:02 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59e6253b16bso5363137e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 23:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771398179; x=1772002979; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXXoBmrj44IUOz5Es2ozBzd5fhqRhhv5SZZDcT1xe2c=;
        b=j81Au0SXXH94Eet3fh+7VTDOiqhQ1NKBQKoYtNPgYoSFuur9iQTj+YxGCelwbw3RCE
         SD0Mvk3Dn5fKUqBfigkcDbjxjU3PvfSwBENU5sAaV1QcsJftxT7Up/0So9EAnh3FFZJa
         wQ4EOu5t0h67D8fFcQ4VQ4HpM/CQ00sax2rPYxz8x/QCfXHX1pW3CuQaJIqCD/cCKh+d
         obRLu1P8g8Rryk5UGwoNIWqv7B0b6hUJq8S8laM7P7t77jCOEkiH/p5VLYAg4XHWLddR
         /bIIN2IvST0CIv5YNxNkePYvXUgNGwqHp9c253i9CI10AWvWVjhgf0YLsZCJFmboweS9
         KcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771398179; x=1772002979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXXoBmrj44IUOz5Es2ozBzd5fhqRhhv5SZZDcT1xe2c=;
        b=fBQJReBpbQ1zlJzYQaB4c9h4SnGNuP7PLjR1ehqfS65HA75ev8OY6NYtn3LDubQLOc
         wJT3pr2m2d7JdP7F1ySBM2C3alkIssv9/YvGiuIGLvERLxzYmXXjgtf7xQnd7PV+9xKD
         Vw04XpmOtGYRiXYobSRhNfCcQNBDJzAeRyW4VQhX7bqO9jp2+7fmoW3rOme1W0tmBFf8
         wlhfJ4lHY8+GCckxvjZ0pkCbp+l7DTXPpva+3qXQSy8EQgfHaMA+vpdPQXXuNhIQ+9MD
         5uCu5BNHPx6GJ6dRChpBwsuu7hmEKww96UWY3FTwYNgHgsK0FA1cQoo/ikDZ+KSn99DY
         fVDA==
X-Forwarded-Encrypted: i=1; AJvYcCWbTasFEX2ZDQkB7UUJwN64B7JC28ZvsGaple0wpzMhPTZ6lWI4q8HJwvoiLYpHhwoZIwwsJ0RXSdjJo2qY+V+4@lists.infradead.org
X-Gm-Message-State: AOJu0YwnmUUi30s+pAV2PqGr2ptW2rg7udVlWtd5BRg7yJR44b+1wiMu
	+dxwdpGr0R/p/dblPLHD1o9m/FScrqI8HI3l+v7bQ8LmzyTYv14GFY2V
X-Gm-Gg: AZuq6aJY6Zv2bHTYhE3gO302xszGWvpT9itS7bWbAK4fmQ4t3fJiq8IBY35F7YBhZZ0
	ov1ycurA25xqPUQKzS4Tv1doSAuawuFv6B3RklXuRvY4bBbt3O4jON/ILU/1tL9sTHlFQ/zN2Bm
	u/H1WAZVNVZLkGxZntp9Qk40o9NtpywYp5ZLvDiZ52BOnJ1NzuC1WCt6q48u2K9Xtq+Z6OU0vxV
	6FvSNlgiIB7WNq+GgTxv82HqEznP/2mphTtqPZT2OY6vuRx4yTt+XyS9uWSC2b90gtIYlQOqImV
	ql+33Q7ciPe9huSt6xaSOqwXMiYAoqWUdjf9HdsKwK1/+M+nEije4q7GdHfc0YXMAQAwW96vMO7
	NWSakighnodWtlQ0DmethUvVtM6dH9RSmuydTjd+Mxt88ub3VxGRe9w6enMiQsFYMB/ou34DKc/
	F70KrWx4vV8C2q5MJBBznXj5q1TYM89moucgkGEQNOqZ9RXtOBgmCDM0UQbBAYXyjg0000yEA=
X-Received: by 2002:a05:6512:686:b0:59d:f71b:3608 with SMTP id 2adb3069b0e04-59f02632deamr5652870e87.31.1771398178667;
        Tue, 17 Feb 2026 23:02:58 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5acb0esm4280001e87.67.2026.02.17.23.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 23:02:57 -0800 (PST)
Date: Wed, 18 Feb 2026 08:02:54 +0100
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
Message-ID: <aZVkHoDsJc6CPszz@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
 <20260216-i2c-mux-v6-2-9be28ecfd7e3@gmail.com>
 <ab7090f3-4c03-098b-b118-4cd7a68af8f0@axentia.se>
 <aZNm6LSK9C8DHC8U@gmail.com>
 <e21781e7-0ba2-19ce-3c0c-bd198e73c03c@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BkvM8BP+41dGuZa7"
Content-Disposition: inline
In-Reply-To: <e21781e7-0ba2-19ce-3c0c-bd198e73c03c@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_230301_477156_2C84E6F2 
X-CRM114-Status: GOOD (  28.78  )
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


--BkvM8BP+41dGuZa7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter!

On Tue, Feb 17, 2026 at 10:37:39AM +0100, Peter Rosin wrote:
> Hi!
>=20
> 2026-02-16 at 19:50, Marcus Folkesson wrote:
> > Hi Peter!
> >=20
> > On Mon, Feb 16, 2026 at 05:40:37PM +0100, Peter Rosin wrote:
> >> Hi!
> >>
> >>> +static struct i2c_mux_core *i2c_mux_first_mux_locked(struct i2c_adap=
ter *adap)
> >>> +{
> >>> +	struct i2c_adapter *parent;
> >>> +
> >>> +	while ((parent =3D i2c_parent_is_i2c_adapter(adap)) !=3D NULL) {
> >>> +		struct i2c_mux_priv *priv =3D adap->algo_data;
> >>
> >> This assumption does not hold, making the cast pretty wild indeed. The=
re
> >> are other i2c_adapters with a parent besides muxes. See e.g. i2c_atr.c
> >=20
> > I see. Hrm, not sure how to decide if it is a mux or not. The best I
> > could come up with is to look at the i2c_adapter.lock_ops. E.g.
> >=20
> >=20
> > 	while ((parent =3D i2c_parent_is_i2c_adapter(adap)) !=3D NULL) {
> > 		/*
> > 		 * Check if this adapter is a mux channel by verifying its
> > 		 * lock_ops. Only mux channels use these specific lock operations.
> > 		 */
> > 		if (adap->lock_ops =3D=3D &i2c_mux_lock_ops ||
> > 		    adap->lock_ops =3D=3D &i2c_parent_lock_ops) {
> > 			struct i2c_mux_priv *priv =3D adap->algo_data;
> >=20
> > 			if (priv->muxc->mux_locked)
> > 				return priv->muxc;
> > 		}
> > 		adap =3D parent;
> > 	}
> >=20
> > Or do you have a better idea?
>=20
> That looks fragile. My recommendation would be to avoid trying to
> guess how a potentially diverse adapter tree should be handled
> locally in the mux code. To me, it would feel better to introduce
> locking/recursion in i2c_adapter_set_clk_freq() for muxes (and
> address translators), i.e. take inspiration from i2c_transfer()
> and i2c_smbus_xfer().

That would be a more robust solution indeed.

>=20
> I guess an unlocked __i2c_adapter_set_clk_freq() is needed.
>=20

Rethinking the whole locking approach;
If I follow the same locking logic as in i2c_transfer/__i2c_transfer, do I
really need do take any more locks than the root adapter with
I2C_LOCK_ROOT_ADAPTER?
As the frequency can only be lowered, an intermediate i2c message will
not mess anything up?

If so, do you think  i2c_root_adapter() should be moved to i2c-core-base.c?
Then i2c_adapter_set(_root?)_clk_freq() could lookup the root adapter
and take the lock there.


> Cheers,
> Peter

Best regards,
Marcus Folkesson

--BkvM8BP+41dGuZa7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmVZA4ACgkQiIBOb1ld
UjL5kQ/9FZG4RjJZzJAb9lOuafAbwZSG92RdAK7UgHrvI6dlRPsPquhlCA1ql78G
leKeilwgMiRZ4/eof6B+M89fvRgGzb+NKaJHb8epXz3BVDwdK0L3ovdj0xZntOfM
RrZVy1pfKosINPCZ3+VYX3x/8hy7FiK8zuoRCdRkQSZOsIiQA+swNHjtEUL16FTa
w4o5U+2zY0zBHuY0IBDPoFjzVgZa5bQHR4EtlBxV9rhj3rB9DgkLkO9olLt9LbUW
D/WVAaFxt05rK2GCneAde86ABxjZ8EVBujs5U/HTBMK9CtlOM2Q45Q7yMBztVqZ6
hRyU6eEbEZztPHbJlMMuLoHDM/FqgVWKvHuDMJ5zJf2VKGncewfBBNMKbgCFG2DQ
e8U8QiFyEikGoSOs7POF2V+Sg0PplbomLA7oIegxPcIrWXZVHWSUBI9tPTHNH7PO
zfASvV/LHYXIUzfIXtPvPRREkh5vrMu5eIfihIdAfgrgNY8p0SMwiOeYt2v//Bq2
5n9lc1O5xVGJEa6bTo/+2Yu8wY/HTI/WAFAY/gV1oZ2Zgn0kqYcEp57F5LgNafsj
Xc10LHEkl4tfuCz8FgxWUV3rMMwZhib7GEgvQaFl7fiMsnv0RJjyWcK74e/G6Z2S
s0+s3v8GHBqR/g4lsEJEIfbggh6GJTrdJ9MvEwOkTiymXF/1iXM=
=6mY5
-----END PGP SIGNATURE-----

--BkvM8BP+41dGuZa7--

