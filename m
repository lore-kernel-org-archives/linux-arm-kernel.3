Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15626D4979A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PWEsu+fpHnvhGCoqgtGpn1xa8q98K4tuJDqTm0nOwI=; b=JF+Q7BEbVI5u826zuajzKq8s1f
	Ldim2BiP6HHC1KnqqTFZQGRNSpOnIB/BFTwLTDf6+f0RKoDZJ9OOYWrawEWmuUVr/cO5IiiZ6k57r
	4Ov+jVeo1wmQFlnX1eNrxEy68C4PKFmCAryQN97M8jWCt2BWa2K/aZG1Guh5+AvZV1JwbTUatLWh4
	BFeW2dZ0Aa609txAqfIh2iI+5yBk1xECy9iOAo6wielKiN2CHTlospczAM+J4J1x96+w0haBe0cKs
	EPoN6RO2kTfrx3+bBBl3veNit/rS+ChHM/AL1s7tyYWXMa5IVd1AIyiYWMdAeOmAPJ++BQOjEuOw2
	Idc6Tmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPi3-000000090NS-2wkx;
	Tue, 03 Dec 2024 10:00:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPSs-00000008x7m-006F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:45:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso48634505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 01:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733219104; x=1733823904; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5PWEsu+fpHnvhGCoqgtGpn1xa8q98K4tuJDqTm0nOwI=;
        b=s0vym2mdXKZygMbgix0KOMBWHqKd82qN22XNvTPPiNME3ENtNNmg0J1P2NASx+J4Za
         Tnl/l1CZjO1d838O/e9bMSK+YFKrKxJMQwTF0kQq/u/JZqMMuLBjDt3+covahB936il8
         qJ7lboG+cnTiE3qM4qGV4uxYa1miKoL4g0zrJ/0eMxoZEx2FZCxU8q4CoicdU7n+x1mq
         RJkntbjY5dX6tMeYzywOnmR1kFsLd6RI9gCAY44G+EQlw7z60t4JgeyCbIbF0EuB9N0z
         lBPzWJ0NHIzXi8Um62XUNzh9eio2hBdCv9lTx8i4Y65fXBq8wF4/sECZcmLC8xBWWelE
         gH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219104; x=1733823904;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PWEsu+fpHnvhGCoqgtGpn1xa8q98K4tuJDqTm0nOwI=;
        b=UoLNvkkn+gPoFrwCVDM2XdRwNLBbe2yM93AIV+Dx52TDi4B7kmETzW5fnczajv+Dli
         rLhLsIyAgPBbloMPORUOe1qzf6Sh9MT4JHyx+N1dQfAmS8gAUvq8fr9CDAx6XlcMIfYp
         8kE0zEkjwvjbK3Ab3X/NGAYXF4XlH4Rz9sfrKI3FvvCLuhu7engV4YRyibqvVfwrF75Y
         /22isFdoK7+YDXl+9nwJZR/vEO9PzMV5iYjjeF0335ocASMGc5GESTAJ67UFswwfwQ8Z
         O6/Hms1Bhpc/mxF1AHd9hfZ9MQYTyom7gc1Y3AjQYsdmU53FIRvK5aUmLG+oN1i/r5Mw
         ubYg==
X-Forwarded-Encrypted: i=1; AJvYcCVntUfTWZ35MpXMPiHwdO04X4Id0W7rBJqI3TFIY43VYPWf553wqc1DQAxVka/TmxFMKnHUZ5mqDNgrJsNwxRzr@lists.infradead.org
X-Gm-Message-State: AOJu0YzbQcxCfHGRzbsDSbz+LMF4lrkvfunuDgj/5nlY66NLbV5pNNGj
	GBBFV6BBB3wBcDL1rKuqaPLDb38mzucKGmdrAVdsPfz0grVuadY+dZfTl6ovd5I=
X-Gm-Gg: ASbGncs6NAqy9rywTTA3QI2Lbb6SyD21aLP0an6cHXbi5xIRY0jiFqCo/WJ2qKez8tB
	Srf/+hjQdAPwx9Jvxw9GECjuRJU5t7OIgSm2d3myQwztxEayHYQsq9AyPCf2uCGb3m/mLR+nE1/
	P/aKLqjfecTaPhBz60U+eMSNuutnPBjYRU3tZ4emzonUAGChhnmlcJ5cHy8lZhlucPkZdhCyU6o
	Kkt793Pq86EUGcqtP9XDLWN75vBPmarIbRWLH94corXhnX4o57NqGY=
X-Google-Smtp-Source: AGHT+IEwrGlccw2Q5NJeLCrjOJfzlF1e1ATvEELN9LKQRaP3CAlsVnOMmTkjoN9Q1iKRn0Rh/ruRRA==
X-Received: by 2002:a05:600c:46d0:b0:434:a160:3647 with SMTP id 5b1f17b1804b1-434d09c0babmr15386255e9.12.1733219104223;
        Tue, 03 Dec 2024 01:45:04 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78c202sm213466555e9.26.2024.12.03.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:45:03 -0800 (PST)
Message-ID: <18629c9edd295a524a1c9764f013a0e97e0b275f.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 09:45:02 +0000
In-Reply-To: <8f585460a1bc52f78a6d0867aed87398bde30152.camel@linaro.org>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
	 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
	 <8f585460a1bc52f78a6d0867aed87398bde30152.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014506_037083_7225C1F5 
X-CRM114-Status: GOOD (  18.13  )
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

On Tue, 2024-12-03 at 07:23 +0000, Andr=C3=A9 Draszik wrote:
> On Tue, 2024-12-03 at 06:47 +0000, Andr=C3=A9 Draszik wrote:
> > Hi Thomas,
> >=20
> > Thanks for looking into this!
> >=20
> > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > >=20
> > > The Maxim max77759 fuel gauge has the same interface as the Maxim max=
1720x
> > > except for the non-volatile memory slave address which is not availab=
le.
> >=20
> > It is not fully compatible, and it also has a lot more registers.
> >=20
> > For example, the voltage now is not in register 0xda as this driver ass=
umes.
> > With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0xda
> > doesn't exist in max77759
> >=20
> > I haven't compared in depth yet, though.
>=20
> Regarding the regmap in this driver, please see below comparison I had
> collected some time ago:
>=20
> 	regmap_reg_range(0x24, 0x26), // exists
> 	regmap_reg_range(0x30, 0x31), // exists
> 	regmap_reg_range(0x33, 0x34), // exists
> 	regmap_reg_range(0x37, 0x37), // exists
> 	regmap_reg_range(0x3B, 0x3C), // exists
> 	regmap_reg_range(0x40, 0x41), // exists
> 	regmap_reg_range(0x43, 0x44), // exists
> 	regmap_reg_range(0x47, 0x49), // exists
> 	regmap_reg_range(0x4B, 0x4C), // exists
> 	regmap_reg_range(0x4E, 0xAF), // 0x4e 0x4f exists
> 	regmap_reg_range(0xB1, 0xB3), // exists
> 	regmap_reg_range(0xB5, 0xB7), // exists
> 	regmap_reg_range(0xBF, 0xD0), // 0xd0 exists
> 	0xd1 .. 0xdb don't exist
> 	regmap_reg_range(0xDB, 0xDB),
> 	regmap_reg_range(0xE0, 0xFF), // 0xfb 0xff exist
>=20
> the comments refer to whether or not the register exists in max77759

I think this should make it more clear:
allow:
	regmap_reg_range(0x00, 0xff),
deny:
	regmap_reg_range(0x50, 0xaf),
	regmap_reg_range(0xc0, 0xcf),
	regmap_reg_range(0xd1, 0xdb),
	regmap_reg_range(0xe0, 0xfa),
	regmap_reg_range(0xfc, 0xfe),

Cheers,
Andre'


