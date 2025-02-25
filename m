Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81489C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4QFWKkvK1MfnhL/90Bgctff+RTyO4G/8PgMsyHu6Bc=; b=rzZ3hqtFz007jL/XgP7SNSe5K6
	8yJYreQyCMDBfHVemlkpTLX2iF8BT68fWC75cKD6phgazqROAf/SjfnH4Jlcshvm6pFBIEaqXJXCC
	GG/RxVAq+VRZwuiNUXbW0jAQs7JIgvIU7i1pWAvbNHiTcXUlCyxVOEaqMHE053U+TRa+iiL4F78Zz
	fS+Z7JuwbJ70c2OP52K1zt6iWpj5wl36vAJdJ/bDqC+cqJBa529bic2rttROTOQLaHnOgze1xLGTd
	PaYyFnffN/r+DUxiEevlSgcptJc7bS1llZIlnjBfzVYguXUGGJDC2Y7fXS8mnKxX7j2FCIxJhTi4T
	nDaBP0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2MC-00000001WPN-21oi;
	Tue, 25 Feb 2025 21:20:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1fg-00000001OZf-0168
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 20:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=e4QFWKkvK1MfnhL/90Bgctff+RTyO4G/8PgMsyHu6Bc=; b=H+1kt5O2Xn8r+ncIbq/JMewHnH
	QiCz++BdLCaimdzpOz5G6/EFPreDMicgM7Nigqm35fFDnA2j0E7tV4jYLUcjZ2V0Ps+D4/GoC3CHu
	ZyIroHJjgBGuUWaZuwk4F/H23Pv7CZlyvcROoSyhX3GzzW2Wm4ug2/C7XlH24LL4H97L3wzLuBdHm
	KtdI7/CVd4XFgYCQGvSFPz/DG0kTPwGUHR4/+toBzobAb+XgytISjsyew9NzyknLjfAVtRBT81eG1
	eNr7B81HTvH0LrrP75qEVSoson0I3pqTb950IL9GZaeRhfWXbcF548Ryegm5jL+ex0wLLY+4k5Xzc
	HR4fyUaw==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1fc-00000003Qox-3qgQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:36:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abb892fe379so914785266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515806; x=1741120606; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4QFWKkvK1MfnhL/90Bgctff+RTyO4G/8PgMsyHu6Bc=;
        b=bS7R/ju9gzfd3yQ07rfnEZiAPeEiGauAQTgESEBv4ejsPOhuYVXLUXwsm4kZYB3mCn
         buoyy+jPoDxqmBrTfLs50hs952c7KF+KzZumcekzxtdChQSKNvGZKyiZfUlbe8A3b1Tq
         B1p9FvAXj1+uNxaL+lLfhC5KGYcVF3jzD2Dom0UPZfae3Zu6iZuJfq1OBdQeGiU6yUo3
         p5wGy5vZ6DX/CBUpFBeTecRjqM1TPXOARpNiLhDBH2Uh26ywyRvq5yi6yUTJ3IOKukrl
         4473eNekSWB9iRsJWk4zMWdtAweNBhJTQ18Tuas0fiGcmZ+TdcacFkmpAebXsAxknFnX
         ZvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515806; x=1741120606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4QFWKkvK1MfnhL/90Bgctff+RTyO4G/8PgMsyHu6Bc=;
        b=dZOi8Nu/c4Nlm7RYxyeJP+w3dDUIrJqWzTSFlQYARZIsirQD/KmaHVfTp3TyeBTn5w
         zi+LD2MvXp9/eju5jCzEkWi+Rrw5Agz9comBJvLjW0ohs9PjA8bsMWuLeJ/O3cgbkIpC
         UZAkOnkr+piUR0Zk1USKbg7oMjlJx2YEnNZ1kpvQz+nf7l7GbjAAcECYBZNAQK1m7m+m
         3993A02ltzrogbauMMxkoQgio8CXdK/DNEFlTXdr9brLvo4oEclvLp1n6mxm/iiNHnuh
         MtUaJ+n3NSwC/+edYj1E5CXZq5v3ujiHa19fki2II9KfkXYu3EEe3vPLkKTJNIIGD5q9
         89zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYbytrZDS5Lw1dRmjP+v/JS52l3wjsbArm7TFUi2/U0eEVPXVN5wJqsfRys6xMraz6bonep6GeQrYVNk1RkCRu@lists.infradead.org
X-Gm-Message-State: AOJu0YxvdGC4NqCvamFu/8hPgkjeEZ7kjNfagWdwyClBXYMIawYWgPhO
	ObY71fAKBWDjE8Lq+Xavq6aOaHyOMIz5aye9mYPaiHuBkIUfpvSf
X-Gm-Gg: ASbGncuSemFC7mmlHXjBiSF3XDSLrvisIWuDI8oamK+Q8ZJbiH0Q1s3W9JuGkokkxH+
	ELugk55t0+Qc8ucK/4DeJYZ9jwZnESKZJlhr9V4nphSodj7oZ6Mjm501W9mLmjKqdZr3sufiUXy
	EqlnnTjxr47lhWF1KygHkuSaL7JXx9YeZq3AVH1NjazKzz8BaXCbbRWrOKCqjEMrsX5gqcBJbxH
	oLS0urf/1BwnRBDqYtvOalNdU3DHYgbMTj7yKB/9oTnkRbDzf96G77kT/p7kNQqmojbvHBa34Ww
	rcilGunKXSBRzivpDrbMe1IJMXlww2NrHPPvXW9C3/WW/+plMMxGBjjPQ63cZrkiCd5eZoPcMc4
	WQUEvUaWpAAMI
X-Google-Smtp-Source: AGHT+IFncxJntu78FR7b4qYIZj+yv/K48D2ocZTvPMdxZVQ+iCvW4E3ccfSm9iifNVJPhsHG3qsgrQ==
X-Received: by 2002:a05:6402:3512:b0:5dc:ea7e:8c56 with SMTP id 4fb4d7f45d1cf-5e44a256cc9mr9383487a12.22.1740515806327;
        Tue, 25 Feb 2025 12:36:46 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205c7efsm199478066b.149.2025.02.25.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:36:45 -0800 (PST)
Date: Tue, 25 Feb 2025 21:36:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 4/7] net: stmmac: starfive: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <auqbgnqka3hdrwbxoaa3so6caju6jzzpsbr5yufaqgbqmhjmap@nbawhyq3nz6q>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ0-004RZH-SL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="npnnru3ejcetrulh"
Content-Disposition: inline
In-Reply-To: <E1tkLZ0-004RZH-SL@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_203649_060770_C1417181 
X-CRM114-Status: GOOD (  12.72  )
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


--npnnru3ejcetrulh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 4/7] net: stmmac: starfive: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:54AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 26 +++----------------
>  1 file changed, 4 insertions(+), 22 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--npnnru3ejcetrulh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KdoACgkQ3SOs138+
s6E3eA//VXPPJ389lkM7hL4gCsrCvhxDMVKpYPMFI55f6tZgLN36yUUjjp/67nLz
TWhWj74unoSnThtfJlOzxs/l/n6/XM23PEtj+TVrBk507ao3hEWLWY0KPW7fHU0/
kb7Jfe85CfqmkzrtLINfqpxvbb7bgSxP5yALfculXlykp61GY0aPIHUAXXWWUn2u
SdgqTvYdA3oTDBJ2Cc+unBpVTSuH84RpMvnPLvtLu2+0t0ppjAf4MYJG09t3f/jr
Ku7m1c9zlNWDrv1fSsIJ4kd8YakZsB9aDGxcP4rQhr/73uBetaUFfz92tTvMPAvn
/vTqP75LzOPXu88BGK7ZV6SvdOBstrxxMOTM2/7/DSyCHv2V1Yt3xvplbP5YCble
ORxVJNlzH0JweLWggg9xcvDlwas+jagLOYYp5If3cqsae9CFLxJr7zywxu+UaVT1
DIpGMI0dnVaJcwOc01nlEWCzeOy0oe0lG9UZkUPKWbxoBB9Eit4ZibSmoTCf3l3q
fjPgZBKRJa1hHMBEecD7gQja1zqMg0ZOcdXowP67ZIF9AkfCQHZNorMqQwicvA69
w8x2PvFSXgexu6zDEAZ/5SMc7+iLQQ8gTR1SZHpna+9pl5S2X/CiYK4Ihvzs4EPY
uXWe3lJzBecVr9TdDq5tgbk7cTqduZOS4Yvc1XkGEGgKA/JT4c8=
=slen
-----END PGP SIGNATURE-----

--npnnru3ejcetrulh--

