Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0060FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QF34UIm/mDVHphQGWjdR/1AzekgNrOu9yMsFMVisYs=; b=Hg+wzLxpuMs31OI+WzbMbtuoc4
	YM9PO5W504Ods9CaocK+gzsyWBAMMcTSUJffyaGAt542/Kia9aieHgT5T1t5/wqHOvpawedYnQ6Pa
	lBajcycz/E4AXuIHM4elwnYoZmsXrXW3XMYVbyGNXmHSoJFuzJIOWG8OTiQpKbO9eeOxyVB8ugWDM
	W60IHxXcnNqX5tQwNPVb9/H93VazOha+WBivpreh1bJo4doIp+YkW2L+ihvTkuGTn85xCL360yKpu
	PWICVcMVrskVvjuNNrh19IDh+2/wXw1OuR4IVV7oVGEYr6Y3QmKA9huC+4SOaaXWsMgdY3ADPqf5U
	vv8GfVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcDR-0000000FBe3-3XFC;
	Fri, 07 Mar 2025 18:14:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbp0-0000000F6yF-1RS7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:49:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3910e101d0fso1207808f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741369756; x=1741974556; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8QF34UIm/mDVHphQGWjdR/1AzekgNrOu9yMsFMVisYs=;
        b=LW7L1aucG81sM5jhyuO/un8ho3na25+EWIC60+kEMlZiQGSmt2RBOXy3cQhXN+WzyI
         vKOVoBRzborpJMB4nRzyh/6bpnaDFDeZ8mXVugdbPC6lx4BO+O5OyofIt2CNen1pTE/W
         4am9PpjDWvvZS3l70qii7mrGOBRTiSAO27Bh9tDSAotaHVqUsRL7PD9gcJALOvELOgfB
         b/etR91LmQcr83ibBF9rY378fv8jLkAFx0DlZTytM0DVmcZFFuPTFYpx1a4VfSGIhD9D
         cNpXGY4dD+nIzwN3bIb+Lg/EpVHtL42rkZA72Iqf8TjSQ6QNojhAqqWGAKGhzIdSCmw7
         LQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369756; x=1741974556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QF34UIm/mDVHphQGWjdR/1AzekgNrOu9yMsFMVisYs=;
        b=TDW1F9krgtDhS8Z7K5sKr7rJBdXDHevcEOAITwRNGi0rpeXrJWMZ10jtP/alA6tUh0
         Nl+abK0aMExbpRSJ4C0P34BlCPgO03lxaVjQ+0P117xyl6xTuGS88Pvo1CEFf9DNNhv7
         lJ32MzM9C6E3/BtnSTdhebJbRo7hCkRRP4uY9YpEtU9P0XhDCciwWgIlSe7KzPlx1Cml
         7jUSr6C9ZAi5sFdjfANh0nPSTI5hNtjUvDe2vmqocDYEb6LU9dhGrO8aDbCAXqHvgkNv
         YMKGfTtuwX8nKzGast4YCIKuAWu2Rri4YMGGkc4EfLHk1LMkYoBp6NepKCT3j3t6B5QX
         rWhg==
X-Forwarded-Encrypted: i=1; AJvYcCVjrwyKBZaT8SxJLoB12j0d6xYXAnpaf+ipgyBH3jhrplVrz231/pYDdbFT2l/7W825zZd3kG5et17UVzDzs/PS@lists.infradead.org
X-Gm-Message-State: AOJu0YwvTqz6vO0/VWwHhZVLXIIA3p6e/ycdF8xU6uAQbDryMYYnf/E5
	Gt59wz9XCAZInc1afFq5Iws3uERGNmPMnrBw8xYwecSToOwrJvTw
X-Gm-Gg: ASbGncu3ff0DALSPgZdGXI+2Zl9rXeh9a+SObFfq/QzIt1AYf2BIKQftk7/b/XDUAsY
	x2dJYPY0FuylrIGJGnSTVqAjxSKgY1MRVmIksnIXJefZpMccxziuYYftzgBaQ8MR+JH/FEcIU5n
	O2IdnS5Sszagwy28rq+XnhYzT7ZhhTSukF2PKWV8l2v6v3RaYlLYn0GkZ8jVBeVxLiihzT17mjQ
	I75xHuuMNikH3ffH9bzi2RNtICwa1Qz4kGIvNo8tnP0J2onL0jHazQ8J27k8PqZCd6z6LSSGZAT
	axtMOgO5U0qkfO4Xi5eyxMXJElut9bzz/9ZF3lbP/F55NbTzmrvxINPFQJV/nIhEdocU0d6hwum
	Jd6Z4VojM/zcvQ49tZQUFyUigZb/uv9A=
X-Google-Smtp-Source: AGHT+IHX4k9h2dUIfbIghSN4dswH6DxltJKXaksN3tcy+Fhl/9UKW5pGEUDWt7ze0avENn0h6Vn5sw==
X-Received: by 2002:a05:6000:18ae:b0:390:f394:6271 with SMTP id ffacd0b85a97d-39132da96b3mr3169491f8f.43.1741369756267;
        Fri, 07 Mar 2025 09:49:16 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm6174821f8f.13.2025.03.07.09.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:49:14 -0800 (PST)
Date: Fri, 7 Mar 2025 18:49:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
Message-ID: <ei5lzgdpckb23la7xdsyyaeru32whrgyb6zdzzp6srawfi7obc@4mb35lgik26a>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
 <20250307162332.3451523-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bhwaqg7unpd2doim"
Content-Disposition: inline
In-Reply-To: <20250307162332.3451523-5-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_094918_382528_316BC798 
X-CRM114-Status: GOOD (  17.61  )
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


--bhwaqg7unpd2doim
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
MIME-Version: 1.0

On Fri, Mar 07, 2025 at 05:23:31PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.15-arm64-dt
>=20
> for you to fetch changes up to c33a71fd0e3644520af7b5926926c06597d6d355:
>=20
>   arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-06 20:=
35:53 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v6.15-rc1
>=20
> This contains some cleanup patches that remove unused properties and an
> unusable key that was erroneously exposed. A fix to support GPUs with a
> large amount of video memory on IGX Orin is also included.
>=20
> Finally, some additional devices, such as a temperature sensor, are
> enabled on Jetson TX1, and the output voltage of some pins is adjusted.
> A fix for the VDD_LCD_1V8_DIS power supply is also included.
>=20
> ----------------------------------------------------------------
> Diogo Ivo (4):
>       arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
>       arm64: tegra: Define pinmuxing for gpio pads on Tegra210
>       arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
>       arm64: tegra: p2180: Add TMP451 temperature sensor node
>=20
> Jon Hunter (1):
>       arm64: tegra: Resize aperture for the IGX PCIe C5 slot
>=20
> Ninad Malwade (1):
>       arm64: tegra: Remove the Orin NX/Nano suspend key
>=20
> Rob Herring (Arm) (1):
>       arm64: tegra: Remove unused and undocumented "regulator-ramp-delay-=
scale" property

Sorry, I missed that you already pulled this into the ARM SoC tree. I've
dropped it from the Tegra tree and I've sent out an updated pull
request.

Thierry

--bhwaqg7unpd2doim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfLMZgACgkQ3SOs138+
s6HJDhAAvkmWYhwK6ieB05CXS9ujeUbGdmfhD/JFL/eZy53b99HyVWdulPnnFHMQ
SWpEGGKPAHAWVijcJTlWY1flPd8vRcuzI+lDo+3rUIOpTkcZcCNvlNxi4sTY3ee1
uUN+YMlDPYKVMOsAoyTHt0k4l7GvbTaGpCx0dHuIi/qhaEWkn9t4ny0Sq56hVpAF
C3fk9rr3mAY5uZQcCpqAn2uyzMVPt/KTkiz+qDgm/3UW+zRiIHomihf3ijQVmY/a
yUoqpKzFzT+Q1aJUvn2qumkgvfgqYtvm8bL+ML6eDGvIHUQVXDbjDlbY3FKKRh/0
zWZZBYBPSi8iq6nYBUpB4JHNpALUue0lh65VvXFeIPDtMLk7gRbG7hmS/Lt1kOPl
ILz73L54sdZo0HcWMD6C0WlQlCu6HrEFLchpDx8t5fHN+bBrtuNY/XiPZAMZFmM1
xL3HqLX2cxRAlavE7aiCgXiRtmQ+Jbxk7YbD79UQSA3DtOwa3rYfOMu1gCISweGX
TcrcM0wp6g1DbFtiZloKJC7ZEUDhk41nf+wKikDtl4nPq/w3KWgy1fURfvN1+/6a
rhrPwKVStMp2yunrmY1/UeMIUekgI+bTs/M3rhx93Z8L0wyk3dh+zbPwWawc+WaT
wdX5DSqXPKQ4tX4wWCmcGU6gwbXRnEv9tSJDbNP1ameR23QH4Yc=
=v5V6
-----END PGP SIGNATURE-----

--bhwaqg7unpd2doim--

