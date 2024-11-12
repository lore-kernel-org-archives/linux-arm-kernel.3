Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE9BD32D8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obp8yGIldYDVzI0XN70dXZCO2SHc5IgrE0mc+D/CPjg=; b=keQ9hho+XYVgDI6VD56z2jipYj
	YII4GCJyXcMbE8kXF9Xg1IvFKRN6nTR2sDWrYjdVjS4ebcjokWz7hpbnyP/DJS4IPRaYPGrENNrJ4
	1797opdI/j9hRPyqQdMWAOSSh9TBB3b2xOZ3czBo2FKJdd4kzrI5NpRjyxbNAj6gaOIRc9hqsSg3R
	6gTpv2OeVwYayaGA8qtZiilYniALzAQJrJKgOK7GdgBNksyea1ohig5oDlJIlQlqYcERASgo2dHuX
	3aUzRtZ2SAoSx2OWjOtP/CDictQ5oEisXl1/gOEhKkwT4C0GdWlV2EbNNwICtvayHG8kMNgn0ZtKG
	DAGYdgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo62-000000032Qf-2xuy;
	Tue, 12 Nov 2024 10:26:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnwD-0000000304V-3Cmf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:15:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-431695fa98bso42982345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731406556; x=1732011356; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obp8yGIldYDVzI0XN70dXZCO2SHc5IgrE0mc+D/CPjg=;
        b=faIDi+yidCJRq/z21+Sp58bTj7UPba/+MgC5gQDubdfCTzRer8DHdZ7x8s4Ux6KX6u
         etAf8YHzQpEdlzmUVbouM7PZXaAp30Ozcu6xk4gF58G+1IUjHCh5ygbHMXGwg75nekBg
         mGq2QnNnnABb48KW2bO3VcmYXgN1aGlY0xF2U7EqdkToHhRo4DiaOHIiNlBMT7mrwYjF
         0TXPd+R/GDaLhltm90ZPakO2c9Zter4iFl2OnZ6pUeJZt5H0mLRLIWatNPNK+JlrRjRt
         RKA7eiBujL8CpS/lPhJyO9tQDvzMVWNa/d12IyCrxqkGfB6+HWcb/7Hm83UK/jEo1WD+
         Uuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731406556; x=1732011356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obp8yGIldYDVzI0XN70dXZCO2SHc5IgrE0mc+D/CPjg=;
        b=t6pRps1OxEQC49tpYEVfRqbTGjlfVJ6s42PlkyGzDRTRbG4IqOUSk8j3XzpNBhdOER
         xWMKaNX8bSW28HzI8NV1rbZe2uwZ6Uw47XJ31a8N1pEDj3AwiGe5XMBq9WqHQKH0wedd
         JU2srj2KbbzGUS5FDGmC1Ftm8u9Z7i+Ws+yWz5AkIORsKVw+Rjh+KoX0VQ5Vu3iJ9TFH
         PmTZM1kyHh+B8Z/bDQ0yktd5aZyf6DDavdgYBjQtkj7sk7W0A69YlJBjix1863QffO2r
         Kw3/uebxUpEVxLdiiXtZHq73LibR8opMqWAXWXLuNr22DXx2Pfcoz+f4MMLPLcP+hiz8
         kAiw==
X-Forwarded-Encrypted: i=1; AJvYcCUqks2NP3t1k3mpCL4pUeqxo6Hgv/VEwQD5O0P1mkz2+k0UgMepLbWlk3Ky02aV6HEvZAJOohCj/FtLll59c+gB@lists.infradead.org
X-Gm-Message-State: AOJu0YxClR3/wyl9V25yXq80CGwPwYUPciKQeZuC8nH+z23WqK6IFUDv
	Gdx4GthEHW+A7CS61N9dWMw3W98iyR5X991qLnVFpR3DRkspsGxLsLUDvrKi9ZM=
X-Google-Smtp-Source: AGHT+IFUtKcOxI9iGKzatyRYf8XbPC5gcQcujb8cjUFmjs/ViAYZu4pW7ViB0cQLuE4H16EQLauy0w==
X-Received: by 2002:a05:600c:3c8f:b0:431:4e25:fe42 with SMTP id 5b1f17b1804b1-432b751e28fmr122955855e9.32.1731406555816;
        Tue, 12 Nov 2024 02:15:55 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05305a4sm205703715e9.5.2024.11.12.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:15:55 -0800 (PST)
Date: Tue, 12 Nov 2024 11:15:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aren <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org>
 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
 <ZzEPACoblmcQD9yu@surfacebook.localdomain>
 <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
 <ZzHSE9Nrf4YySJrq@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mx2qhhffnejmsbkn"
Content-Disposition: inline
In-Reply-To: <ZzHSE9Nrf4YySJrq@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_021557_845190_4187D616 
X-CRM114-Status: GOOD (  25.11  )
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


--mx2qhhffnejmsbkn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
MIME-Version: 1.0

Hello Andy, hello Aren,

On Mon, Nov 11, 2024 at 11:44:51AM +0200, Andy Shevchenko wrote:
> On Sun, Nov 10, 2024 at 04:34:30PM -0500, Aren wrote:
> > On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote:
> > > Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
>=20
> You can do it differently
>=20
> #define STK3310_REGFIELD(name)							\
> do {										\
> 	data->reg_##name =3D							\
> 		devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_##name);	\
> 	if (IS_ERR(data->reg_##name))						\
> 		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
> 				     "reg field alloc failed.\n");		\
> } while (0)
>=20
> > #define STK3310_REGFIELD(name) ({						\
> > 	data->reg_##name =3D devm_regmap_field_alloc(dev, regmap,			\
> > 						   stk3310_reg_field_##name);   \
> > 	if (IS_ERR(data->reg_##name))						\
> > 		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
> > 				     "reg field alloc failed\n");		\
> > })
>=20
> I am against unneeded use of GNU extensions.
>=20
> > > > replacing "do { } while (0)" with "({ })" and deindenting could make
> > > > enough room to clean this up the formatting of this macro though.
> > >=20
> > > do {} while (0) is C standard, ({}) is not.
> >=20
> > ({ }) is used throughout the kernel, and is documented as such[1]. I
> > don't see a reason to avoid it, if it helps readability.
>=20
> I don't see how it makes things better here, and not everybody is familia=
r with
> the concept even if it's used in the kernel here and there. Also if a too=
l is
> being used in one case it doesn't mean it's suitable for another.

Just to throw in my subjective view here: I don't expect anyone with
some base level knowledge of C will have doubts about the semantics of
({ ... }) and compared to that I find do { ... } while (0) less optimal,
because it's more verbose and when spotting the "do {" part, the
semantic only gets clear when you also see the "while (0)". Having said
that I also dislike the "do" starting on column 0, IMHO the RHS of the
#define should be intended.

So if you ask me, this is not an unneeded use of an extension. The
extension is used to improve readabilty and I blame the C standard to
not support this syntax.

While I'm in critics mode: I consider hiding a return in a macro bad
style.

Best regards
Uwe

--mx2qhhffnejmsbkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmczKtcACgkQj4D7WH0S
/k5IrAf9Egz14wVYaV3DKBPJo8fgsKBghLX7gexCzWL4+0rkjfgtP8gSFaK8OnVY
8howbIeCxwbCUSEZEtWJU36A5oaLI370Mb24KajDPQZyayedIXqF1UubYE3ZXcrA
gwbGyho7TkbsUnrXbMhkp5lr7aU6O8JdIedrSqv7FnMxfkVUVkU6Hrai52+r3b3t
k6uAvR1Yl+OD1XIq5FEeCW5tcoYEQ5rK6apeMXvdkPdg0o6ZKVjAt9vK9NVxPPpW
2CdM15ron07ikOYiBDin1ZaD3x7FdzVh8z9RiizG5q5a6fPjh5SELLbBMHeGtnaZ
5cCYi84a0NHhmndqIy6gZYPX4hhDXg==
=b8YO
-----END PGP SIGNATURE-----

--mx2qhhffnejmsbkn--

