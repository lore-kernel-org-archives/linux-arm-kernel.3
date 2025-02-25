Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EB2C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfzXyH7NZ0CXwUyIU7zqxa+qi2bPj6GEOWtmkR9Kazg=; b=1zqyzH8d18y4fyUqtSA+jjJRgm
	WiQ7xB9C+JEUGw3UdHedMKRbVOL8Ck+LflfmZqoJ0/Hoi4PJRxionIMXyLSAKbHmoZt2XftFxXZl2
	mSDr5N0bHcDBZtgVF0TZwDmJbeCjqM++jWOnKtwvRzcAsxCMu6wjA8LWW2lK6lT7pjO0jJm3XOFav
	F5KDcb6uMeNXB/QOJ6l46JdNBq+j4eMzslebFftZ5/Qefa4UYtw5wrom22h0p41kpHYl41TLRbUMe
	Ih2sw5AD6uIw+58ftzdjKw/hnYwHEwCyX2/+BnpOF7XPkeal3uT2qvGZC5pMSloEyFi1QOfkzeKQ8
	8PWzfWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2Hg-00000001VeR-0ltI;
	Tue, 25 Feb 2025 21:16:08 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1cB-00000001NhX-3HGo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:33:16 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4399ca9d338so37484985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515594; x=1741120394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mfzXyH7NZ0CXwUyIU7zqxa+qi2bPj6GEOWtmkR9Kazg=;
        b=Dcvi3zKTpvuJDeAZE3GNl7cEWmOuMo7tzYCnTJIwxVrwaKgQZL1sMPYG0PlnN5WPed
         9xf2sZm9RxfwZHN8TJCtFHeCEVfNkytIOIxALXM8oDusWzV+II96oxHrJ5Mc66mTkXph
         UvSSrlW6jgFeRw4nhfdrbdpoBgNOH/c/EsTamhbPp2EXKTbBrlR2avYo1EOBq2QSlGAR
         w3al2UqbULcmpwSKIoUggdmnER98jIqgs3D927oZu5x09bxKje+Eoe1Qmxe8P6Qt3Lar
         7dcEjzB2zXCpaXU8h87WORewoTZ0+tg1ymdLl/g9KzdGMb7Q0l23m1AoCEVtWEVfkQIj
         hQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515594; x=1741120394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfzXyH7NZ0CXwUyIU7zqxa+qi2bPj6GEOWtmkR9Kazg=;
        b=qQmWA2YGnJdQzLi6H6TjNhod7EWLvctSYcqUbSfMspjFK5AoGKmKiH5a4QRSKpDwlI
         HsIA+yvv35/Cy4DnVvpewJxzD/qtqbdX9ZUOSduE+n3zQvkXb88uyVp7oOJn0suV4XhA
         WWqHYiBJ8nfZRwFMdYDDLkBY+3oEMYZrfonRe91FJemYlwgY1AKFv6mdWf1V/3tx2sQT
         uysGN4U7bti2TAiYKTNprBGBFXdORtC+0P8AGox+npgLUggl66ojRYHreAGNI0RPO2dH
         bZVJpFiUY9QlGy+7tUWGzGYvLW/O3pBSPDS1OzT0cCBSsydsuPjAqKjTru9yZICLW1Zb
         Ujug==
X-Forwarded-Encrypted: i=1; AJvYcCVgSZzg/FEI4HWLhN5QBImWeWaCjHXNFJAkyZYLJhr6+GgPErSVhcQp0bXR4is7piRbtXFKLPyl5EBewgZZQW1d@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6bOY0OYOV1DK1iYhdxIT06LQhlkX0klzB9QsVbBH7ofNeNiR8
	2gSrWqjz8d5LJHkIyZL1kbiovJ6pUmf3DUOtuGe9iSbft+dZ6x4r
X-Gm-Gg: ASbGncvsyTA4f+Rs3lGqJYiXFobe/SKQdxY85fh9eXwk5I86Qe6Kad0KEgZf4Wo3RDf
	fSFXovjfg0U3hVwanNZDAFS10kg0bpbgeyn+b8gJVSHvORG7h636IWwZMW3Vy+KhK2B1NHaa7AT
	GOtHOxjKsjyv5dTL++/NoBKFM22EfwZqOUMxf0xRD6iiwJViKI1NrFcAc2HkJ7doAB+O9wkx6PQ
	hkGP5JqDDmIqZFV4Dce/AIzY331mNvIYbuf8PGbNbBBKVSMaeIn5d0F8VuSUgJAfYADnIKtIqlN
	y7C19UQF3FYgZfQwjg7I1kr7gEttyecxMmJ/7yXkLxL0m3yhv0fznr86tBj+NoK1hAODdH76V7x
	YpxZ96y0o6OCR
X-Google-Smtp-Source: AGHT+IEOGawFqhgpNgYj/SR8/F9v9KrOsztMk0p6RFVqMJcMCZS2I8sfJ+MqQCPoKPwyjrwTYZAFuw==
X-Received: by 2002:a05:600c:4446:b0:439:9bed:9cfd with SMTP id 5b1f17b1804b1-43ab0f311f9mr49606745e9.11.1740515593421;
        Tue, 25 Feb 2025 12:33:13 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd882602sm3388780f8f.41.2025.02.25.12.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:33:12 -0800 (PST)
Date: Tue, 25 Feb 2025 21:33:10 +0100
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
Subject: Re: [PATCH RFC net-next 1/7] net: stmmac: provide generic transmit
 clock configuration hook
Message-ID: <qtxnw63qgwt4zbcwktooytp3uwg746gjqdhzqmszz6t2oma4ah@kzlytutixoky>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLYl-004RYv-Gz@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3tllvznwlcmcp5xs"
Content-Disposition: inline
In-Reply-To: <E1tkLYl-004RYv-Gz@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_123315_824585_F4C25AFB 
X-CRM114-Status: GOOD (  19.11  )
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


--3tllvznwlcmcp5xs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 1/7] net: stmmac: provide generic transmit
 clock configuration hook
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:39AM +0000, Russell King (Oracle) wrote:
> Several stmmac sub-drivers which support RGMII follow the same pattern.
> They calculate the transmit clock, and then call the clk API to set a
> clock to that rate.
>=20
> Analysis of documentation suggests that the platform is responsible for
> providing the transmit clock to the DWMAC core (clk_tx_i). The expected
> rates are:
>=20
> 	10Mbps	100Mbps	1Gbps
> MII	2.5MHz	25MHz
> GMII			125MHz
> RGMI	2.5MHz	25MHz	125MHz
> RMII	2.5MHz	25MHz
>=20
> It seems some platforms require this clock to be manually configured,
> but there are outputs from the MAC core that indicate the speed, so a
> platform may use these to automatically configure the clock. Thus, we
> can't just provide one solution to configuring the clock.
>=20
> Moreover, the clock may need to be derived from one of several sources
> depending on the interface mode.
>=20
> Provide a platform hook that is passed the interface mode, speed, and
> transmit clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++++
>  include/linux/stmmac.h                            |  4 ++++
>  2 files changed, 15 insertions(+)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--3tllvznwlcmcp5xs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KQYACgkQ3SOs138+
s6EOmw/+NeeoaUSqMoO7BHZUWvxr8/OKrzqzdp0HpmensxnadCO/WqOLakmT5co9
XTRZQVmvq+ZQC1nWfstqK4ND3ulPNRma9zkyTk++49QMi40BznccIGX/YcME3zlM
nGdEC5u9vH3xq1GBvsi0blaAouIy/8uqSnI0RXVj1RcJxWO+y99hBSKJnE0QpYzy
T19f4RuwyuQAXFkhjBoBrl8sOJ7mZObyvvZV7/DobMmmFcvWCc1ieompVEWCV9st
CJmAxheTHrPJ96/cWBPfaTLmntsZNV//h7tMjIV+vkBB1a4uVzcRELW5x5JDuC5O
XHtyvCV7Ve02iTxfPVAeK/glqo7CK6XkhK32Uhl+yKp3alu5sP50w9AMlB5LVw7o
zo3fyBvdK5+0L18tdb8fJdr36LQnYnq2Wnb3cT6DkjG/8CKMVocXMfQgfytk1FEp
sIsFNpEj72fQ7xFikWevv6FWfX+5+x3IkiWKGWc62rUBTLUeCbXV8YawYcco2Du2
RLw49bsH7J9GgTNL6ZrD0Q0owRqa0FibL3zMd+C3cl85qRq4jBmhXeluUoPi6Dkc
DI8RPv9C0noqkFN5QcoVeE8n/mTCKvzONdUL4irltre6N/iMSDMfbbxOsdnWHsGE
TWQbPh7S0dUQAbeKa1i8Y/9vALxV3CF6vOtAKvGkqhmgf18Ge3Y=
=BaLA
-----END PGP SIGNATURE-----

--3tllvznwlcmcp5xs--

