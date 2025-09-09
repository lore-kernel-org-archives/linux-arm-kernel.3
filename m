Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113D5CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xa/sWJ3+sYlQ69Mrer6agiOorC008o3RFoU6757EbEk=; b=GjcoiUOEkP8GIhil7Yj23wkmP+
	ck/VfukKr1KgHHrwOy9qJUlekd4w5CYMus5N2oamfTUMe38c9SKrOGuD3gmu6fr/9A6v4frILJ/74
	uMRdDgpTJevb2LLgkEhVZI0Uq39RA8nwE+Wy2c5CP4q9sHltyrLDwDXDDQwGGDGboFqnQxDUZqlWP
	QFMBzr3F4fIN4VLkNbfUGWEQFnYo/2Q2bTjBZiP6b/jgTGE5INBZRBXPFDIj5jGL7S9rgGPGtDXEN
	NcM7gmP+xw7jKC49MpbC7HIsQvWlLpXhuE1PHlcZzXHINmkQ1LN23Kh1zwT0P0JF4H/sfDYTBvCyY
	XQW+rSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Oj-000000087Pk-3i1B;
	Tue, 09 Sep 2025 15:36:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtwn-00000005eYE-0mnB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 08:43:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso4082989f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 01:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757407407; x=1758012207; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xa/sWJ3+sYlQ69Mrer6agiOorC008o3RFoU6757EbEk=;
        b=zRrfVvxswSWSc/iaJ5eeGhrCppGneHgs/k3rrnHWi5s7pR5tGYb7DA88rnP5grK55h
         P8g+5KzB3ChpD0wLlgNMJY7idADo7gAtf7ZTD/+g0pTRnz9gj4vjcXY6dixMqep3Zt6X
         UKzGYTRuYWSOcBfewA3aX8329vZiaCGvx/oWrOSpwti/XcunoDpxB/kmt7s2bJ0QTKWe
         22K59I/6Q3d0ABFaVEUnArStD6aDU5PTJDUstmIoScb9jCcLDbhu00OkfBaeYt5KvAeU
         PaES8m7dHfauOykr3ErjaNziKcAsHl1WrE1lTnu+H8v7IB6hrAq/m5NhoCIfk8g8mg0W
         A1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407407; x=1758012207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xa/sWJ3+sYlQ69Mrer6agiOorC008o3RFoU6757EbEk=;
        b=wIwzOsinMxvZ4dLK8Fqmongklkn1iu8E/fak6OAPswBGb+PI/w2cLJi7AhX8Nv2G0k
         qb51WLQXh3zRAQthH2UYvdJUddPgJRwM1Yq2Vk8J0k+gHoGhV4VKRj+LWyNNFga+2gEG
         m18tVMLGgAfUcvG5J5aZj/XwGaEL/lYlboUOGJj9EUvupgPDQssBkrUvbW3cFCuHEQRh
         G81HqGrE5BRoVBl7SU6fqmewo668mkidy1ImsLhv5Q3r6sr/UuhsA3ahtIlsQicuD7OP
         2t9vAgUM8/kThPfep8E6JRQdCdcLUXzeaomr6TjM1Z4Zg9mfiy70VNk8K5jP+I3aQg8l
         zdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIoS+5hRJvcxVN7lukT89WqfRETX1V76LEUq4ciO5Ygha6wvQYRoc6f7IK5lPEEtYBnRCS9OOzvC2olw1irBEw@lists.infradead.org
X-Gm-Message-State: AOJu0YylMNASwV64/e2Z+kXOz6sQZvdChkInUcmNUEN8jh8mp8B7SD4p
	6yw3a6TwfXKWGBufBrEcQ46xUV6QXPcrRACl39Lchy+/LY4Bx06uhnqIfrriGf25k00=
X-Gm-Gg: ASbGncsbz3/QOXhEeWUFeCRQl9KlCmxgxSpJmFYSjMGVgz/EcTcaxsrAJJ4tVMMDSWx
	HfqkFKRNeLXRRBTosBvkW1v/oTB0eXNS/OBFp+0aR1SuvORm5X06eSk9fuUmO+CJYVAc6KLywU7
	uS0kVa9FWNKSpsJWiEgmULBqjH4xOnDyRl3PmuZDG8/sVNhN4sO9n173epzeGWbVQB2M3TSZbGk
	rzC+LHnOF8YcxKc840GwDw+lYVTv60zAsLFCubVoOSRr2vlHUhHmuoxT1+exuvd4kqMdCxffoRP
	oIU9t+tAHni+8780DWdltib0pcnjLXxqOuMRgXiPnRRFd/wshVtbHSGVBprG8xlgqE/Pg1TbDkW
	l3eJZrMVXaXKrj8AgPYSl9mm+0DHO29s/YVtV87yQ9w5eDyjjqQOYMHELIvjOZR3I
X-Google-Smtp-Source: AGHT+IFwviVv9E6G+QlETszLxP1bxPGt6GB3+PenTuHVlAmd1yq3YJNDwylJsDXseMVJsR2twUXkxA==
X-Received: by 2002:adf:a384:0:b0:3e6:e931:b41a with SMTP id ffacd0b85a97d-3e6e931f965mr6178328f8f.33.1757407407356;
        Tue, 09 Sep 2025 01:43:27 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e75223ea47sm1663307f8f.46.2025.09.09.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 01:43:26 -0700 (PDT)
Date: Tue, 9 Sep 2025 10:43:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] ARM: dts: lpc32xx: Set motor PWM #pwm-cells property
 value to 3 cells
Message-ID: <uaisa3ejgtww2lyzwwze6pumvr2ztuwwlgaaqrt3lw63l33ack@atipbrmy3cjl>
References: <20250904184647.397104-1-vz@mleia.com>
 <20250904184647.397104-3-vz@mleia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6mchymnprx32ocnr"
Content-Disposition: inline
In-Reply-To: <20250904184647.397104-3-vz@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_014329_710392_B9F719B3 
X-CRM114-Status: GOOD (  11.88  )
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


--6mchymnprx32ocnr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/7] ARM: dts: lpc32xx: Set motor PWM #pwm-cells property
 value to 3 cells
MIME-Version: 1.0

Hello,

On Thu, Sep 04, 2025 at 09:46:42PM +0300, Vladimir Zapolskiy wrote:
> Since commit 4cd2f417a0ac ("dt-bindings: pwm: Convert lpc32xx-pwm.txt
> to yaml format") both types of PWM controlles on NXP LPC32xx SoC
> fairly gained 3 cells, reflect it in the platform dtsi file.
>=20
> The change removes a dt binding checker warning:
>=20
>     mpwm@400e8000: #pwm-cells:0:0: 3 was expected
>=20
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--6mchymnprx32ocnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmi/6KoACgkQj4D7WH0S
/k6L3QgAmis+DmabnC85Qg82WyzPFg6kUeIQ/NgsR+zqbr9yCJgmcKkZpCKRNptq
bT9J+2+Hl7mJZRD9A9B11IjUiySx93T1H8FPR7hUEZsdfblASxdr/jfz6b4FIk5N
P23GCE92eUyBK7UgM9FXEiAAr+m0V8DSgOn7weBTjQNBRzfi0vVmZYa74mZq9BK0
lItvRfVz5bf3fij5HGYSHmR9AUqNei8y21sYMKT0BuBjJAoP0kzL+cD3Mz9K44Wn
yct+9Eu32ISvIpPrbrCpxFo2ceaEts4x2a4wyTTX8hWmaIaKx/CnqU9xA0vG64ci
DwCVXiEETgnC/LjwkvZndWLE21bx4g==
=+Yf5
-----END PGP SIGNATURE-----

--6mchymnprx32ocnr--

