Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3ACC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8cC7hZ6uzXANNqymrxNxizKVo2FCcoOnerezExOsqY=; b=Xa6dSxIkD5xD4bQ1gEDd9Vb7+Q
	BqvHItAcU9MtzMdCUs4eqNIaApFQKcBPebhLJMYmdnY8KwW18QlCIk0roxDd6qGDof8EmiqznpZvM
	pQKW2zdQ1e8G4h9d4P69GzS4x0qowVNmLoBPv7NFhajJvzJO3MjW8nzVzICj+t20V8QG8qUpyX74w
	KNq00PEa9DCr1CTzQgRzWHsdKf5tH2/MDoQYI+u/9z6PlHTP9psdnjVau9A3WoeAskY/knVBFKxrD
	ZrLzJi9pPUkCBszeSh31X/VXawPcjOajTnFhQD9zFBwlqCnAmvcWf/1Jo8uelmrLn5VFRwgTQkFlw
	G96C+uqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNxm-00000009aYo-0bkA;
	Fri, 07 Feb 2025 13:00:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNwO-00000009aLl-3GdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 12:58:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso377752f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 04:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738933119; x=1739537919; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i8cC7hZ6uzXANNqymrxNxizKVo2FCcoOnerezExOsqY=;
        b=Np12fWwFswwZw5GpvnDg4nDvudHM4ATre5uEkeW6eVt2QYcTbFLdnnD1XlXf0iiIUg
         sdaGQl0y5RJbRj44GpKaTrBM5CmLPnVZO+c2i/EISet93adIhOKAgl/sBovzYK8xshY9
         YIkQzAukxbbPwl52Acaljb2r3zyuYGNOqAmlsBcAZW+gkF+TDxONeX8OAe8DYxRx0wqF
         qsm145LrK+sl/+nDKgKg4uPTkRtFkxArbrVWuUYSBjCjHDFMDjw48Px4/78NV2EZktyC
         5GVw1qAmPM/h+Vtous+NagBXH4U0Tbazgw4xPSd7UWwXKTxAv6BLuLJosAheqbY9Rst5
         J0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738933119; x=1739537919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8cC7hZ6uzXANNqymrxNxizKVo2FCcoOnerezExOsqY=;
        b=PgFkFazbtOAXuevj3p3Q14Z8X5wreJP9KHgEZuGSYWqkEQrSPZBQFm0qJO+ZPL4CU+
         K+THtUWEZ9XJof5Bu9jD4MCIN2hGaGm5f1Qy7gpbsaI839UYqCQbiNAATd9V9DyBZ8zg
         AR5uHijaghZS0eJ74Nywv/jyfl99pa94kL/0xoL+oLxSdsAYgbZSrlDPprS69XzMLRNh
         RNST6xuo+XsbqzGRg9dGlbJeLr5rjTK+Rn6b1Wqdvlh0l0f7FIAkff3oMUdXNstU8Dz6
         x5++7eUiCquS5eCR/6GjEVoupf9OJiVD9QW2+sol15y0/jEU9kRLmBsxqU+hcr91hLAA
         aPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4wDwJTukaihc8q01hpxsURJ5lAMVb4IrfM1ZnSwY+fiDods9rsBPp2tKa9yMFKdaFghIy4PZKoyxvbHqKTz8K@lists.infradead.org
X-Gm-Message-State: AOJu0YzRCmH2Fp2ImIe+ZV7aGhB+o62GnUyeNfZnowu7YaTYF/cPK4iK
	RTCoCgnilAnpETlFR6ig7icrSlDOiP7bYejS4f4EM+n1eX2Oz/oV/ckA6TYq8C4=
X-Gm-Gg: ASbGnctGyKA9inTs1dpYoqRYrU+JdnkCwgNUam8FjC0MNiwJsKdbtwVFkrUwgXHAanx
	ARtpPTKFJ9q7IOsw0NyZdUN3auI3O3f/9lVAwiCrhe04cXoLwoZpR9gijNiZ5GWMnMcc+rw52ED
	QGUy2bF96CpyV3ktW0Rtfucw63UI2FR06W27w75W8iaWB6Ul4xEwwjv5al2nTXEW0WtZdS+la5H
	U6UobibyWgYiumZ+nGVUQVuobaS81xhYcMNuVu84Gidk2PIC6AKKa1mBR2rQzfBQrlSuxXhnpYe
	IRuUqCwsRyQ=
X-Google-Smtp-Source: AGHT+IFpU8AdoWbYYXJlvM/MfFLSme8UqHGmJ/5bUzZ7c50zlMkStKZjdwZcUymCsIcM48r7kspDFg==
X-Received: by 2002:a05:6000:1ace:b0:38a:87cd:6d67 with SMTP id ffacd0b85a97d-38dbb11f0ccmr5697324f8f.0.1738933118601;
        Fri, 07 Feb 2025 04:58:38 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:3b5a:db2d:b2b7:c8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f1b570sm85882655e9.1.2025.02.07.04.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 04:58:37 -0800 (PST)
Date: Fri, 7 Feb 2025 13:58:35 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vishal Mahaveer <vishalm@ti.com>, 
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
	Sebin Francis <sebin.francis@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Add serial
 aliases
Message-ID: <voapiqjxe7vbavy463pjz3kjboc7pjciesqts3wbc2zueckpav@fuela22hbuwq>
References: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
 <20250203-topic-am62-serial-aliases-v6-14-v1-1-f26d4124a9f1@baylibre.com>
 <20250204035329.jzss2ar3t5arpgwt@reoccur>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zb4o5bgchnlxnt4t"
Content-Disposition: inline
In-Reply-To: <20250204035329.jzss2ar3t5arpgwt@reoccur>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_045840_818452_F73390F0 
X-CRM114-Status: GOOD (  19.93  )
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


--zb4o5bgchnlxnt4t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Add serial
 aliases
MIME-Version: 1.0

On Mon, Feb 03, 2025 at 09:53:29PM -0600, Nishanth Menon wrote:
> On 10:34-20250203, Markus Schneider-Pargmann wrote:
> > Add aliases for mcu_uart0 and wkup_uart0.
> >=20
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm6=
4/boot/dts/ti/k3-am62x-sk-common.dtsi
> > index 2f129e8cd5b9f127b1d1baab17be868938fae013..d52cb2a5a589a8e5eb325fd=
90324d57ec1e3783b 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> > @@ -12,6 +12,8 @@
> > =20
> >  / {
> >  	aliases {
> > +		serial0 =3D &wkup_uart0;
> > +		serial1 =3D &mcu_uart0;
> >  		serial2 =3D &main_uart0;
> >  		mmc0 =3D &sdhci0;
> >  		mmc1 =3D &sdhci1;
> >=20
> > --=20
> > 2.47.2
> >=20
> Are'nt these reserved nodes for DM/TIFS and MCU? What purpose does it
> serve for us to have an alias in Linux?

For IO+DDR mcu_uart0 can be a wakeup-source and pinctrl needs to be
described for that at some point. So I thought it would be helpful to
have these aliases added already.

Best
Markus

> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D

--zb4o5bgchnlxnt4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ6YDdwAKCRAkjLTi1BWu
P0UAAQDUgpQnZ/6RTBTDAwSqmUrzspde+nHHN5BMHTYX301IsAEAjwlTmV2ouLgL
yJ3xNNhONU5ZnXKeC/iTWYpwZ6CmaAU=
=+yFw
-----END PGP SIGNATURE-----

--zb4o5bgchnlxnt4t--

