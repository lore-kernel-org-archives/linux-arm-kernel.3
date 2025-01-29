Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060E6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuYqXLN9pWWEEMuag1Wep+j9GMbtuULX7qFuR3zF6Qo=; b=ZfVMitCOWS4zuOBz2EPCd0Sj9f
	JKZ0eOEOUF3YBOS65f3Ak8EByrL+NndFPbxBk2EVYljZCorvf0jhqOnlXXyW9yMVtm3Y9gIuXbY9T
	iVGiojIQWB7JNn6YiK60nrwAkoLmPk1slT4OhEDtfjvHmyVObpKjIOZep/5N+5ZiUfqBbTwr7DE93
	1F/2JJY8NYlCvRqiY4VcARKm60fULegVhP/wfRfGoiwSlvrcsuZBFr1ihxF0IZMRfo3kpTv297hKv
	fBujH4dv33VHJrFzelCXpMonJvXNyQsj1VIn9lPkwyYW9PewSyQireYw32ZvbiiIsQIxgGS543szI
	rQEtWT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td3Z2-00000006ZQj-1PeM;
	Wed, 29 Jan 2025 08:36:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td3Xg-00000006ZMN-422R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 08:35:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3863703258fso242711f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 00:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738139723; x=1738744523; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zuYqXLN9pWWEEMuag1Wep+j9GMbtuULX7qFuR3zF6Qo=;
        b=GiLi5DVZiVkHKkSsLVZE7OWrUKs2CtlKb1iV1ev5/oi0U6M13XaFNLuT6uZ9RbQ4Ta
         FjugDZCdEaEMDLn1V18AkPkp86ZhjcxkvwTYkmnyBZvY8ZTRGdF8PmZmb5EsxNA+hDX3
         TBevMcDKTjE4AzngwziRY14Fa03rddalLoIKV3LI+o4l5kqAD0kgOg85/qr+NHhJyXxv
         YH8jXnCwyZ5DEPa31vdFkT5zxOTJq2JIV2lNsf6DdHZZaaN63W7teQpUnN4kEq+njF3b
         nzD8WqNQfWKG285AqOe3rk/yO25o+xWfGBLW3tOqBpzAddeKNX300FPiiifcW0fwCe1w
         i+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738139723; x=1738744523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuYqXLN9pWWEEMuag1Wep+j9GMbtuULX7qFuR3zF6Qo=;
        b=okVQJd84cZPWasMEnahsbLYgEdTkYqoggX+Yl+TjwTnOgBmL7/W13frgHpY7DmbfaT
         CS8iGzaaec5DozM5N/eIm00HnITQMqvhKulH8pQMwPHpAUHlsvOfF7+bYq3K1vs94lvo
         zkZ3vP5rpzAT7VJ1bAO66/TTXbJ6R3v0cBUmFF1pS04ayE0WVzmjeCbwOZJM1GtEJZ/t
         tuIBtkRT3gVDR3swGEtp0gmbkl4/JYHIRIr+Mo/HFD15r4PX+sHTiikQ/jMRHWlZRX3N
         J2vwR1cMTlKsiMleFgjyqXp7TjBPMjJ3HTLCEtiXkffIq1oSoTGvZTqZt9dLKSlSEXFS
         48vw==
X-Forwarded-Encrypted: i=1; AJvYcCV6yV3JBXP2IXaFE9imfDKFJAMFiaRaZySlNS68/L+JXjQBS5zUn2cE0Ps1iNbDpxrg+9VXeyydnIfwsFU5N0Bq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz63TTN4f9SxJHw7g1Alz3VLFNGS+5UfkvqgNzcVLddS0jHI9r2
	XRyYASq0nV+y65wcZihkmiplYjOi33q+u+mOcoVPAguSzARBmKBei4pLJYVgdSY=
X-Gm-Gg: ASbGncvY1GjuSc5df0SW3hWrBXCQ52K95afhoNaFonvEDOXJ9u6xaZrpWVtxhZJdBlc
	d4IOJx3FnxmmVSenrWOsOWPe61uJ/s2unKu2cF3bgLV5PJkYF4g2tyHLfxVtyvGjrYbbxxUKoQ+
	hwJFeR0c8gPHwlUcewvxjgOkQKYdaiOyyX/w9iTneWEAdJwiSlQnHglSlmaWjMZ06nc2WrXl4he
	w9e4DLAz1gbSLYKlLpIRkEjM9fdRzHRq7wGc2miRPr4DOwQDsHZotq8+kNhlA99oXv6Kj9MIxzt
	5JXfH3blZ2vMJQ/UnGM77kur+dNU/6kAdG2PRqtX3kDPRwn2l0hY4tsSWw==
X-Google-Smtp-Source: AGHT+IGd2UpE4x7adX1HKMcNLR5Di8u1V53T20UlS2WB4LkUGl/DfaURLgDVMysvwbgsJdQBfoiELQ==
X-Received: by 2002:a05:6000:1847:b0:385:e328:8908 with SMTP id ffacd0b85a97d-38c51079cacmr1719764f8f.29.1738139723079;
        Wed, 29 Jan 2025 00:35:23 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1baf65sm16624223f8f.64.2025.01.29.00.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:35:22 -0800 (PST)
Date: Wed, 29 Jan 2025 09:35:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
Message-ID: <tjkdekrcxoot3inwcboqc76iljbkjgjaamo55u2k2glr7aubjh@y3465k547zwz>
References: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
 <f9aad21c-64f9-413b-a3ea-18825515944c@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvjgmcreqtqyinlr"
Content-Disposition: inline
In-Reply-To: <f9aad21c-64f9-413b-a3ea-18825515944c@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_003525_205759_FAB36850 
X-CRM114-Status: GOOD (  17.25  )
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


--lvjgmcreqtqyinlr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
MIME-Version: 1.0

Hello Andrew,

On Tue, Jan 28, 2025 at 06:44:26PM +0100, Andrew Lunn wrote:
> > +&gmac1 {
> > +	/* Uses a KSZ9031RNX phy */
> > +	status =3D "okay";
> > +	phy-mode =3D "rgmii";
> > +
> > +	rxd0-skew-ps =3D <420>;
> > +	rxd1-skew-ps =3D <420>;
> > +	rxd2-skew-ps =3D <420>;
> > +	rxd3-skew-ps =3D <420>;
> > +	txen-skew-ps =3D <0>;
> > +	txc-skew-ps =3D <1860>;
> > +	rxdv-skew-ps =3D <420>;
> > +	rxc-skew-ps =3D <1680>;
> > +};
>=20
> The convectional meaning of phy-mode 'rgmii' is that the PCB provides
> the 2ns delay. Here you are abusing the
>=20
> > +	txc-skew-ps =3D <1860>;
> > +	rxc-skew-ps =3D <1680>;
>=20
> To add these delays.

Ah, at some point I already knew that. Thanks for repeating that hint.
(Back then it was for
arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts.)

> Please test without these two lines, and change phy-mode to
> 'rgmii-id'. 1680 is rather low, so it might not work. Look for CRC
> errors for received packets.

I did an apt upgrade involving > 100 MB downloads with rgmii-id and
afterwards I had:

	# ip -stats link show dev eth0
	2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode=
 DEFAU
	LT group default qlen 1000
	    link/ether ee:5f:09:22:72:da brd ff:ff:ff:ff:ff:ff
	    RX:  bytes packets errors dropped  missed   mcast
	     158336739  113000      0       0       0       0
	    TX:  bytes packets errors dropped carrier collsns
		482481    5094      0       0       0       0

so that seems to be fine, right?

Best regards
Uwe

--lvjgmcreqtqyinlr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeZ6EYACgkQj4D7WH0S
/k4qaQgAlRiE8Bu3Vj9y++KvX2u4tfM6GeiZTH5zpWwNoS+LaTs+1R9Nn+pfAgYC
txyvZp0iygZc6e3IMmciuXbeZ1eFV8s8FMpBdzIGI/gQZWiItQdPkOFa4NJy1dlV
fKn45byHBTuPOdGKEWXYzTR0U5SWWdQcqojaokPf91uxOn3x6ypHdRapdI4pF6OR
2sYFRDOQD0BSQUHCL55rAGW2/ccy+R1MdASugqtsrXknqGDe1TpHbDFn7oSveIjd
JcNH2fw9zSTAR4xihf8jRyWymy5UQ9K4nB3MlFnx7qrXXrrnrp5QcphVs8vWdT6C
EhE1mwk5br+ntDGTD1+ubCNAM/mQ0g==
=mF3H
-----END PGP SIGNATURE-----

--lvjgmcreqtqyinlr--

