Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4D5E69E99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEBOguTLHIH6xcHwcvmBhhg77nQarXu6nn+BUTvZLUs=; b=XNTWqrEtCdduiZPLSHErvhhFSg
	c2NYYA0lW06Ec+jP2fBF2y4hEOTouZFByU/lV0OWcoKCWcbvheykWF4MwG8JFpzrZf+Y095ekSiKg
	bArS688I+k90nPLtUP/G2muj5VCcb16h2/5v6SB3WsOyXZqZXsIthNHuX6WnnKKiD8aLfbt6suJjq
	R+7qWmDwU0jM/2QZylvhG3qzgD5plVJCBYySqfO38VTRWuKdUkkKpjc7Drkc+E5QzO4i5F0uerPGw
	AnmPKfGEewroGa44XC9S50QGgBDxJ1zSItiTK+DYwrg6eIPXsk7jUVdXyobIHojy/lJQIqPOre8sP
	ErZSWrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIEoV-00000007d6P-38XI;
	Mon, 02 Dec 2024 22:22:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIEgk-00000007bqg-3eIC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 22:14:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434aafd68e9so40969225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 14:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733177680; x=1733782480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zEBOguTLHIH6xcHwcvmBhhg77nQarXu6nn+BUTvZLUs=;
        b=djsE00XLZCRnPHC2vrF9ulFARTMZ0oiKmSdtsEd4RafdwYdd1I+nX1AZOLSzueY/qT
         6eJavPV8r6fYTHVB1ua8Nmht7q6O2lrHnfdV6TZJ+J/ohy5dl/7A2C/6q6BIwmHJ2Mq/
         NKRFN/ruWJJ+f5H6q/AwvAJswv9j21qs66Ysa8oBk+wW/OqGVB35Yj7lejHMnpD/g/FJ
         YmLtBtQDPZwnACr13I2o637DNCzqbMxw8KIhxu1Ss0HsJ2c6lKyL4hmAnfMA4T87bmJO
         WY7JsbxH/5ZJrAbD74PiOmwUq9bIB2bpTwFPnrsKW/WFrhd8LEr3rKwfZ/EAOXEFuKrk
         aosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733177680; x=1733782480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEBOguTLHIH6xcHwcvmBhhg77nQarXu6nn+BUTvZLUs=;
        b=ajL8up78QEmQp1OLWES6XyMaGxnoQ3j5awMl9Da/RU0gxZH55saoRH/lpHpZ0hsDCA
         vTYQyWpWqXKUiuY+rzTcLrZmbyGS3Y6DNRbPdIxqOp4stLrFBKGVwhh6fssZQTpLt8Gy
         ctVUY6ib5/MrLYz/253mZyn4mQU+s169mtjSeXdGk6mLMLvtHywCyDA/HNXLARHJbfk6
         WVuFBOtphpc9JgzTkBdVNFV1HANKvXMgtKy7fvd9+Ra2gqYivOLzYfomSA9rxVbYlogu
         Eg7ShN0Ye+QV9P9WHa44xRFofkKmTk5lC/ETztmVuaXbXq50jVLQRxPrWGs5d5cN2Dad
         HXXA==
X-Forwarded-Encrypted: i=1; AJvYcCUfK5pAcyz1Gsv54ytkrR1Imlg4IrzymwnrFe8E1vReGDnsLA5LuiV/eOYR3tGLCkB682tmjcaV7Wy+8QsU4KlQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyW67TOpPaR2sRpSilUROKJHjgQEQFuiaxPLJNvwpRaTRMI8eY5
	aRsV/0xNM0y7pTAnBV1qfJoaxBPB7yyH1sppm9yMoiRtxzKgydr9BDPyZ3rsr00=
X-Gm-Gg: ASbGncs1zSlCPsE1WOcMYXBzSGeFv3NiVRtGuOpEiiluLicBRgLcvp9QSzlxLjpFP7m
	iotKuQsPEpe2sN7Xh7CFRhriETtSki9d+ksZZzFJnXLd5wYSfOv55gPRv/cb3BPLrUuQJSdUmAK
	KV5KouXNcA9MVSf4kLXhScopVbOshlPlOqqZwzCHxRJRIuygc4YHGhVXA9MPaBU6mm6KVbXadfX
	zcDOyH4MGQaZqIlK7s4XZuUDgPJK8FTWVDZN6euhKIi2NHPT73iYpY=
X-Google-Smtp-Source: AGHT+IE6wkpzszXeh8QXwJktXSSGMnpnxPCLO1BCEILblGYzEG/8lqGUupwDDJqT4OyienDrFeEliA==
X-Received: by 2002:a05:600c:458b:b0:434:a8d8:760e with SMTP id 5b1f17b1804b1-434d09ce3c5mr970095e9.19.1733177680463;
        Mon, 02 Dec 2024 14:14:40 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:17db:769b:1fd5:7a62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc63b6sm166225345e9.22.2024.12.02.14.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 14:14:39 -0800 (PST)
Date: Mon, 2 Dec 2024 23:14:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Cc: Alistar Popple <alistair@popple.id.au>, 
	Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-fsi@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] fsc: Switch back to struct platform_driver::remove()
Message-ID: <qey6imfeo3ntk45lbpadi2yo5gucgtllkgbymy6vmejin7pvye@oetb44ax2ynn>
References: <20241130150530.901263-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnpjwpbkqa7snswj"
Content-Disposition: inline
In-Reply-To: <20241130150530.901263-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_141442_907792_4196D5C4 
X-CRM114-Status: GOOD (  15.10  )
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


--xnpjwpbkqa7snswj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fsc: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello,

On Sat, Nov 30, 2024 at 04:05:30PM +0100, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/fsi to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> While touching these drivers, make the alignment of the touched
> initializers consistent.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
Note that with e70140ba0d2b ("Get rid of 'remove_new' relic from
platform driver struct") (in Linus Torvald's tree) this patch isn't
needed any more.

Best regards
Uwe

--xnpjwpbkqa7snswj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdOMUgACgkQj4D7WH0S
/k57xggAlwbUYwXtBd3CmO29X1f21wgrXACLUAPKl6JbBSm4P8QmKW6wn3NLAwPH
yxbwWp1H2Zs3D++eYyGvbVS7FZSRdmE1u9gRQsGSBSIyrnMNEAgcKzJ1YuIfLITM
eNwU6VmnpjZmu/9g4Uh+WUWixaHXzyewXp7J/OXCZGUu5ytAMJGc/duWiNpiNwQX
2HhqLqLEakVjd6qE5B8ajLajmjp19eRIHqxWFgZzcimfn+luC+Ps5Ktuc10hgqKa
1jAtfAnOinwQBMzvrwLwo+oCIfsgiZBGzeEfJOS4lgJw3nRS4XWPlmCcAbWMcLKY
6trx81sEhQwXqDVI2QZ2Y7W0SoMtWw==
=7PAX
-----END PGP SIGNATURE-----

--xnpjwpbkqa7snswj--

