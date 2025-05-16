Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA3CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T9dXX4j3/xNPrysk0i+Gd7aVj9eRvCOhtMXwW578kM=; b=C6q2LetYZxGoapCMjuRAQ68iiP
	kJShQtj7HG7dfriegATST3nsejSzDDKwgGM3Y/erm0ngL7zoSRPO32UdOVbZLX14C4KgVwS80Q8u9
	6EzzcpOVSWrHrDykx9yGamceR/c9WL553HA0lGNMeik95VJIihlBaHCGfWugMXjvZhTfw0kyxUOgq
	i1i9uyIrjSamCVQval3aFY98jXdRsLnMSPR0cvuXWA2toIQYzwASX1pnRy1KwGIkRQeAmj/gwtq5E
	DU983sFGhWqFV/lKQOtsdMR1vgdMM+dEdAT3nmw5/Y1XHwabcEeJlpCp/nC8LDfCJUiB8DyJzNpoG
	L1Nc6zlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrpr-000000034HO-0FB3;
	Fri, 16 May 2025 09:58:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrlH-000000033NP-1Z3n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 09:53:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf848528aso15598185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747389230; x=1747994030; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0T9dXX4j3/xNPrysk0i+Gd7aVj9eRvCOhtMXwW578kM=;
        b=N1cmVqeALGbk0HKJGTcJk0kJ3+oliQMx7PRHQ30mCZkKWDvwAmW0PzzDuwqAAPiVQT
         yUv5lAjKRb6AfbRN7XBMYNDCiiWklsVwhcYFCANMrcMST3RNeYWVdRyUC1y6Pke8vw+7
         TsKAD5NMxJbmBJ26/xohLt1sOj6BoJbGc2nlFmo321pme6Up/87wr3JVYgZ5/lOkxXX0
         dDTsrhvqv8pGURR1tHDRD0Gdl94YmQ7aiVUTmN7DtcSQ668RSDDHT6AgCBfTs6mAvJS0
         nMZBKAYPqEPDE5Qu+68kH2n6zm9+pjkQcIqLzg3vLvnJ+R6qA2if2DDfiS6sAwffvePv
         dbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389230; x=1747994030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0T9dXX4j3/xNPrysk0i+Gd7aVj9eRvCOhtMXwW578kM=;
        b=qKW5vzhp+7+xh2pOx3Amw/bbNlKfTdjtmpMwuOROcMP7IPxF1YCJL4EnlyKwx3e+U/
         DGzgt+DXSMt8j1asEiMO6PZE65vxMoEQ5JZsbNMBeQVrmbopbb1nz9jTOfA8WiFVO55d
         YekpSUXh3GR2pzQiaxUoYR4z5ihRY17AiEX6cz5b2FSKQw8ygIQ6x7Dn1b3rL5FvHt41
         XJgyt8NMyhGhyoCYpvZ18KWc2L2kAlEULcADU6le94h7KTtg8O4ARA5x5W2P1yMi7o1D
         kw9ZKIqYArGdm3uKSWLzNBT/qlAMAW5LTenUeD2ZvhLFVrswABCDQoG8Xj2enY+1rJ4o
         Kxww==
X-Forwarded-Encrypted: i=1; AJvYcCVcJvFxXehbykZNWZUft4OGuZfr/KuwJrEmspPRpSrLZ8DLcXRkYXzhBmzKxPGEMf63ofLNjGVrq+nFqNep/GNJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm68PP5xRUXFCcvSp+UuEt9GrrnTKWsnkH6MzFclyACDaN7PfE
	WF06b/RtkJRc6LHcGzIuFxNubO2o59tYWkfCgsZtuREzvWtJ+nH6yH5FeBeN2u4kobzGQKkbE15
	Qbog7
X-Gm-Gg: ASbGncuFaGzGcha7t3+Rhm9C2o2ihOYiM858S0Zq9b8zOq2oPa8GtY77VnYsrHDb0HH
	lmm88yzKmKJDxwSlbtB1bS9R6OYLmTVHSxErhVF2+Kg+UajSuWkHjkaa9L0mHokfl7YO2sCSvLJ
	G/F8C6zkWiCMwpfp+YvB7s/sqS0SqkAywrJaZ+kWoQfBqV8hGNXictdUIIKkgsJiUUiqTQQC+oi
	jecOO8wortT0Ei19IpZbNZP5EplILa/MybLFOjWUhkzittHCpSyowsV6GKBPrt2aYGa2SosdPxs
	2O6hWtAlZJoMbIy5x+FaLGAHabPclU1SaR8aDe+dLiIxauNB+IlB83fW6iYhFGO6WhYnBmtW7Pm
	ymq9XsKMDmsoX8mB1BDRmG20YYxdo
X-Google-Smtp-Source: AGHT+IGWMqbdmzot88BwoyJkKVlik7hJWWIpAdv/u8TjYPa8JtimIILaeyozEucB70fzns1tTqycTw==
X-Received: by 2002:a5d:51cd:0:b0:3a3:5cca:a539 with SMTP id ffacd0b85a97d-3a35ccaa7c1mr1995111f8f.20.1747389229889;
        Fri, 16 May 2025 02:53:49 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca5a87fsm2274308f8f.29.2025.05.16.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:53:49 -0700 (PDT)
Date: Fri, 16 May 2025 11:53:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Purva Yeshi <purvayeshi550@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two
 SoC PWMs
Message-ID: <ss6jqmpz55wz3sb27kg7mu555qowf5enu3fe32zlxgqeix7odi@zhs3ns4euljf>
References: <20250403104915.251303-2-u.kleine-koenig@baylibre.com>
 <hbz3gikjqwuqmexzrxis43gmxcviiryihi7pdp3btdb3sopqi4@mssyr62bunxk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5nkams7un7oxsws"
Content-Disposition: inline
In-Reply-To: <hbz3gikjqwuqmexzrxis43gmxcviiryihi7pdp3btdb3sopqi4@mssyr62bunxk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_025351_409607_1286A00B 
X-CRM114-Status: GOOD (  20.36  )
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


--z5nkams7un7oxsws
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: dts: lpc32xx: Add #pwm-cells property to the two
 SoC PWMs
MIME-Version: 1.0

Hello,

[adding Arnd to To:]

On Thu, Apr 24, 2025 at 05:05:29PM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Apr 03, 2025 at 12:49:14PM +0200, Uwe Kleine-K=F6nig wrote:
> > If these PWMs are to be used, a #pwm-cells property is necessary. The
> > right location for that is in the SoC's dtsi file to not make
> > machine.dts files repeat the value for each usage. Currently the
> > machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
> > there are no properties to drop there.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> I wonder if this patch is still on someone's radar. I didn't hear
> anything back and it's not in next.

This is still the status quo.=20

There is a patch in next touching arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
applied by Arnd. So maybe the problem that my patch wasn't picked up is
that Arnd wasn't aware?

Best regards
Uwe

--z5nkams7un7oxsws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgnCykACgkQj4D7WH0S
/k4gBQf+MMHEz38OrUBBBQ7bgEtkz9tyZsvJY8TyLqJF1RXpnPhz0boYcprA6rhL
H3fnPM32zczBLCqyIwIHE79WpttHwN5jm6UK1Gi9na7cF85zHfJnnJCKrb3IDoPP
Gqb1DTEGHchPSkVI8przpdi/19wzLRhKpNb9RU4ILGtzqhVGjeQYf5mI8P419/JC
s29FNZjX8+W2sZBsxfxioM6SHVgjpsRP1DfxPYkf/cMKWk6+fPIiYCS2UwGRUKmX
Utr9tdaw8HsNHBiXGudxAojQiH6HdpZp17ET7SYu7SqRkzhJw6q8pqRrerxJhx6o
IN6p6ADPdGVEPiG0kp4QiricGqtmnw==
=xD5v
-----END PGP SIGNATURE-----

--z5nkams7un7oxsws--

