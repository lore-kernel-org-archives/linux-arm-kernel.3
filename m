Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709F4C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52PPbYsBn/2scyWL5/FOy0dBfUO9QtQgEvQaLwgW0/Q=; b=kSYdPnxn4R0KOgwR8AVvUDmPtG
	QBObVFfeIH/af+aXzwG4iN8Zhrw3Q/F1uvdcwbuggIaIRb1aBUom+tw0Zx7u5+PL6GglZxJ2RcIhV
	kQB78pP0G13hLWMX0BQyuDj05nAh7KtRqVE2nzT5/LfbqGZH3gxJQOtp9dwW/rh+RISThK/fopYao
	K16R+hdFlWCcQRPGR54LABiaCh2NFCfjhTKwjJztU2D6VDTaHwwN75SB8zFHZtg2d4uhY511UXecH
	ZW4iA+Ce1LYwuRXcUad/iv/rWI6r8rkK30dk9xDKHEvZUiOfpoQEH3SgdJNOhA6yrHekgayE+X0kd
	dV2em15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tduGE-0000000B2vs-2iRQ;
	Fri, 31 Jan 2025 16:52:54 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tduBb-0000000B2KM-19SY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:48:09 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1950585f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738342085; x=1738946885; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=52PPbYsBn/2scyWL5/FOy0dBfUO9QtQgEvQaLwgW0/Q=;
        b=YX7GCDV++i6/xvGgovJWFzJsfRG/6azM/DYMjq0ejkM/F0/RobyzL4DFI+kxEQHL/e
         4nd5eU/mYsMkoi23Nqm+SGeOwlyULbAJGMCOaOtuAH2wLC2AWDFWsCCrLGh4waDRrB0O
         FrRFXnacRl5whuqy8BnETwe+gijthLHu7ogkQbTx7uQh3dFDQ4On2TimdCBcqJlN6jAu
         SiY8cY77ZgbfMtH+KinnvU+DYidt5tQ0O9taoh0QhTtvBG6+cN7XhWOtNpmwJoxW8IiP
         Ybw/IJry9wLwO2L6IvmQkZfn7YkWjyxEc0tvMx7w9AvClzraHGk8BeNZS2kcXb/+LiLN
         sSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342085; x=1738946885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52PPbYsBn/2scyWL5/FOy0dBfUO9QtQgEvQaLwgW0/Q=;
        b=H+oK/DL0LkRcnZxGMItFi+p2VYJEksQAPRCO+H70mkbuiLJiqSew4Bp7M1c1s3ibiY
         nIhPvfdUXvoXMtLyeflXwxKLtiEBOVcnp0Z610SY0ggEUYmf+JlOzBDIFpH12vTe0+/a
         ThUm3toTMmfwWxT9OD88s9EvD1zV8+P5pQ99IHKSFd4Kgf7mPIakVam1XV1gOFIYQyfV
         3bdm1Omi3sBsdTXffQ6KE/fcJ1jLk52uq07VR+cnGguGlqScfNj/eSfoFAtCykC/xkQv
         pPm5C3QTWoqB3YvVx6+yMr9EmKv37uPgfpnWJ0KkiCggKEOb6Hz23LAXq8l4JMZLLYSK
         FwiA==
X-Forwarded-Encrypted: i=1; AJvYcCWqR/32YE5rt0UOXoPadm2BwkgKdyW7TUJRVIotoRwMwvAB0+ZlhxYVC2TeDtDlID+uy2wCmqxAYNdzV6uxOjRt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw42Xu0WcU78fn57OipDSkhfvqXfP+sN1JidR9zSmG+O9X0Vr8V
	QT/TbUGGwbuHxmuZIjtR4x6eAhV+GzOLtOtOIISIDlQ4IQ69i1QlDdZZcO3sLlTCgpjmD1w4rhB
	lFCB1xzcLi8Y=
X-Gm-Gg: ASbGnctUTZN6+bBS6dAskEqcbUkClM1plqUsZveWqXYMNRhtuEOAPFeSluSZgFcfXjG
	5xwCWDe1YVrLSg/kSSDZMk30hd5rZ92DzlPHktzgU/3Y2VWJY/QZVlXzt+W1sABmVKjJR5zrXyH
	ilKEnPjKi2ZLQvczrVFjj1bsnlakNWgLzGVMss7I/G4q+kBeJU0ckjEdxSAfMJT5StY/UdGdySH
	hEuSPYnDB/VGdo3moMkn0Tz2/PvCiLKB6F93Px2+LN5HiDkLfL9DftWsEZeOWNxXrH9yT3U4NLH
	kta935+WJxQ2kweY7ONxyNl8Q5PmhI3AnzKrJ1lEOJaMP5o=
X-Google-Smtp-Source: AGHT+IFicYme3LZwXtohMbA3eIbgEmfoDSG155U21ZKpA+tc0C9mcCc8RrNh//OZFOv0YqvPg2xe4A==
X-Received: by 2002:a05:6000:1565:b0:385:f220:f779 with SMTP id ffacd0b85a97d-38c52095991mr10689812f8f.49.1738342085148;
        Fri, 31 Jan 2025 08:48:05 -0800 (PST)
Received: from localhost (ip-193-121-87-13.dsl.scarlet.be. [193.121.87.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa2fsm5196070f8f.91.2025.01.31.08.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:48:04 -0800 (PST)
Date: Fri, 31 Jan 2025 17:47:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Dinh Nguyen <dinguyen@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's
 de10-nano
Message-ID: <qkruehkvdduotjzhut3w2fpbr364dtd2vztpewoy3h3j55bqxt@e5niklwtpuue>
References: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
 <173828013131.1872475.6879199940703724951.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i27xtr65u4mwcg7i"
Content-Disposition: inline
In-Reply-To: <173828013131.1872475.6879199940703724951.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_084807_316566_62A828ED 
X-CRM114-Status: GOOD (  28.33  )
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


--i27xtr65u4mwcg7i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's
 de10-nano
MIME-Version: 1.0

On Thu, Jan 30, 2025 at 05:38:08PM -0600, Rob Herring (Arm) wrote:
>=20
> On Thu, 30 Jan 2025 08:45:53 +0100, Uwe Kleine-K=F6nig wrote:
> > This dts is enough to make the board boot to Linux with the rootfs on
> > a micro SD card.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > changes since (implicit) v1 available at
> > https://lore.kernel.org/linux-arm-kernel/20250128172917.4565-2-u.kleine=
-koenig@baylibre.com/:
> >=20
> >  - Use rgmii-id for ethernet/mdio. (Andrew Lunn)
> >  - Add a compatible entry for the machine (only had the SoC before),
> >    fix compatible for accelerometer and various other small
> >    improvements, most of them pointed out by the dt checker.
> >    (Krzysztof Kozlowski)
> >=20
> > There are still warnings when the dtb is built, but they all originate
> > from the SoC dtsi.
>=20
> Except for the ones with the board compatible...

Yeah, understood that now. (My reference was a nearly empty dts file
with just the includes and the compatible. I checked that the full dts
doesn't create more warnings. That worked fine, but with that approach I
missed the compatible warning.) v3 will contain another patch adding
"terasic,de10-nano" to
Documentation/devicetree/bindings/arm/altera.yaml.=20
=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/intel/' f=
or 20250130074553.92023-2-u.kleine-koenig@baylibre.com:

Maybe I can learn something here: Is there a command that only checks
this single dtb file?

> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: /: compati=
ble: 'oneOf' conditional failed, one must be fixed:
> 	['terasic,de10-nano', 'altr,socfpga-cyclone5', 'altr,socfpga'] is too sh=
ort
> 	['terasic,de10-nano', 'altr,socfpga-cyclone5', 'altr,socfpga'] is too lo=
ng

I couldn't suppress a smile when reading the above two lines :-)

Best regards
Uwe

--i27xtr65u4mwcg7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmec/roACgkQj4D7WH0S
/k7XcAf+McmSrjqPldUUgwg9iMbi64MUaN1HDEQ50fhhewslrN0rh8wUiNt+yPRT
kTEoy/DgFFWCIeb1013BNgYeQrEyAKrIsKaOHf+BB0Fdxm7NWZb4lyN2PeWviU8b
Kd7SK6/j5TDx21fWVPXb00Ge3zXfOh5lgqDezZx9jF6wF5Cq/M9694G34FI/h2ho
03gdlRuEoPSXcILgmf+fG36U/0HJXHjYf2YUdNMmMYUZ5c2A5F9nvHt9FZgApkLs
vU6z9pYksuY9NwU+FCjAPsbUUU+o/bOOGJ63BlF5FW2GqJ/a5AUoYUayHMperKNf
gG+FzaP/ac7e28rFY4A042kIBrOSLA==
=q36O
-----END PGP SIGNATURE-----

--i27xtr65u4mwcg7i--

