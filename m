Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B04AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV7wOBCDxZKolRjf9GF1nGz4gKy85D71AXPs47WKJWg=; b=iBK0kGac/M9I1xFXhMrPKrk9FH
	lXP/O60OzdluwKlBg+NV1wsl46SM8+23sDLKqI6DgMHoYa0/Dc7ICwDArXb0U1hW4gG2ha0mucVyV
	97iC+Jujb4uecwUgbfZSe8hvHvwTV3t4tDjXqNyvLl9oSjoxEx7CaMPugkxfxLflvIvC7UmHoSlF/
	ozXwhTVVQQ4dB6VsQgxdn+WFXRNRonyRQ6/NIqQ7AfbRjeVd8lTBJxqCcOCqvS090jHGsiD3N8zTg
	rsHolompmcx0qb5IzpAGZtjJVwGtlR78R+ouYNGXtN5+Bi4mKJV9+2ekyzWJhOcpsyYOC5U/Zbydi
	+fQYni9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2DC-00000001V6Q-050P;
	Tue, 25 Feb 2025 21:11:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1a3-00000001NGS-1SJ4
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 20:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YV7wOBCDxZKolRjf9GF1nGz4gKy85D71AXPs47WKJWg=; b=SKysm5tbNadNmlUOMmSzdcf1vm
	8RQim628QAobNIDIg5NFZi7l11+okM2sqNBoUSFiIVqExZ7SpV3XsjDv1D6wbEcCzDR5H6R2FlgSh
	A96NQUEm442oOOYklDdS0bZMHd/0en/b745QlvFNX+R/JJ9GZk7A+3ot6F3lxe+PaGecdtldkvSE7
	uplEvsiJXDvpoqNl2d2WWKh3zCwpmQ+Ve38wB22Zs7HOX2CMjH/ukbaOvkkx4cDWC635N7jZ4DPlp
	paFq1ySX0LpBXEw4T3iFXBt6Z6BS7ak28UOpwqsCVe6KwNRCpoOpmBdKlt6tw6ROxK+/5+UpxzA8A
	SAR+tHDg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1a0-00000003Qa3-1o7h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:31:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-439a331d981so52872985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515458; x=1741120258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YV7wOBCDxZKolRjf9GF1nGz4gKy85D71AXPs47WKJWg=;
        b=SU8Wq0veCdVKZfr2qVtisEgjxXUsDJ3B9nJ4q/VnzPFcNJKW9rJkLPWLgaaK5ndjdT
         Mk5XiCailDZebrPjzK4MmEwGqe4SsulejwgkTairApFOLO7lkH4ATQaEiqsfXJK+Zlid
         6ZA08Rb11enJDmCyH64XidcVEiCCE6spJUy12Tfxr1BGn5GMMSE+T03RRm5+R6xqbzUG
         dW24UrsPuPDASpx8wuAQ/fAe65CCf0Ozo80TKBSOAhzy8I53eQTdvYhswd+E3PtHX6A4
         6PD3/gP8Riuzg6Hx51qeMsybTcRE5+XKCIfXnE8lFhWb+MefswkTjJ2b0JoGzQLPQ+iW
         rZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515458; x=1741120258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV7wOBCDxZKolRjf9GF1nGz4gKy85D71AXPs47WKJWg=;
        b=R57U55w8hPdQdd5WPZBpZ6XTE42hLGQkYKwgCTS0NmAGKckOueZ2wwAQGOn7Ov+pgM
         w8qnnXRGaos090xfnuH4wbiFb9lS9LgbO+p2/wSIKzZy3NQ4ojJPxu06/cULPacfq0Bv
         LzBtXWc95lv8yMJwpQwupXBBtTX2a3de5GwXqB60NZ3MgrTVxTgyOPVixPxcN+6eS3hq
         N76Yf/EJGNxWaFuSXQM7urffmE5bz/9HyDCc7lQG176LKiq+KloYa+5GO3hDjnbaJf6R
         bcqnaKNMvEBhgFnokb4FgD78e62obrFe0hauutSuHUtvI2eD5pSQUQhbtUWIw3X2a8Zv
         Wnyw==
X-Forwarded-Encrypted: i=1; AJvYcCWE/K8pVRwIVVFj1zD6JMNn2t8aJXbEPfIBp/8w4tNHHqlFtg2wGb0oDVTvrJSnmETiy7P+3P1AQNUtmuFUMJFX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa2eZGR4WPOMl2K9ax1KEdlQsPMbiM8F1qHqkoF2xofLOfehVR
	mqYO6+e5RJQ1wSIQA2/aWp+QDuBjqnofVHcLqDFFkuTnT5k49Gs3
X-Gm-Gg: ASbGncv8FFAQHYl+wshdXJWT5HaA3qsTLGP2vWjWIimm0kQ2P42IYtS93+98me1RFSF
	DCZgcY44XvlM8T7+E4p21XIcjaAf3DCW3RCZgI17JReqrFiv6d8mTRcrPEtLhV4zQYI1G3Z1NhC
	vKTY+aqzUNHl98vCvdCTpTVtDsas0IRPziKAFej0m9NP41sSYWJreG2riY8kOglnGn9vYiymQsT
	CgZ3IiSFhQHhgYPx9QOpKXckaYE73lQvVYPt+R2zY6/urSKgACQVYkYtJxWwNa3TmtpjG8ALz6V
	ciB5XD4ZfmAprJpP0vj1aYYpdLKtzA5f0WV2ZzQPWYNN3cP+BtGkW1lYPt7Q+LH1mKy4FLWr0of
	lcJkQCifeUkDJ
X-Google-Smtp-Source: AGHT+IGMx5pU7RRODJDtq0qCQl84I8Udv96NunCF2+SS/JZM7mWzu9hAPxehyg/ka5oYvjP72VnZ3Q==
X-Received: by 2002:a05:600c:4688:b0:439:63de:3611 with SMTP id 5b1f17b1804b1-43ab901d6b4mr6206895e9.24.1740515457376;
        Tue, 25 Feb 2025 12:30:57 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab156a136sm38626675e9.35.2025.02.25.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:30:55 -0800 (PST)
Date: Tue, 25 Feb 2025 21:30:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH RFC net-next 0/7] net: stmmac: cleanup transmit clock
 setting
Message-ID: <deshe54mqty6ozlcbncliwxfxtszubrn44onswjlmo62lltcvx@42piilxcqwba>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4erhebjcgk6jk4go"
Content-Disposition: inline
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_203100_577596_F0F6BA2B 
X-CRM114-Status: GOOD (  18.78  )
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


--4erhebjcgk6jk4go
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 0/7] net: stmmac: cleanup transmit clock
 setting
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:39AM +0000, Russell King (Oracle) wrote:
> Hi,
>=20
> A lot of stmmac platform code which sets the transmit clock is very
> similar - they decode the speed to the clock rate (125, 25 or 2.5 MHz)
> and then set a clock to that rate.
>=20
> The DWMAC core appears to have a clock input for the transmit section
> called clk_tx_i which requires this rate.
>=20
> This series moves the code which sets this clock into the core stmmac
> code.
>=20
> Patch 1 adds a hook that platforms can use to configure the clock rate.
> Patch 2 adds a generic implementation.
> Patches 3 through 7 convert the easy-to-convert platforms to use this
> new infrastructure.
>=20
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 +----
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  5 ++-
>  .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 24 ++----------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 22 ++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 26 ++-----------
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 43 ++++++++++++++++=
++++++
>  include/linux/stmmac.h                             |  4 ++
>  8 files changed, 65 insertions(+), 71 deletions(-)

Seems to work fine on Jetson TX2, so patches 1-3 are:

Tested-by: Thierry Reding <treding@nvidia.com>

--4erhebjcgk6jk4go
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KHgACgkQ3SOs138+
s6FT4w/9GoN6QrYW3VP35tGhx3VaNaXACzYRu4GB5krW+p4Ixhq8LfnSKek6/MHu
SkB1lalSpNyFg9ZHeBHeLUMG0bulJzaqUNj38OnTv2YFI+hGXs4rkoLWKf1L+T9k
5Ci+UCoA5wGzrt+eKHixzKsu9V9oVexQOq0gp8AW+4dO8SQxqRgkTL5meN+ArqLr
O1F9jGuCNvJSIOeI4wFQ97s18GRHYTIJeq832LftTqIcJlGGT0dn59tcbLBLm+2f
2vbEqND6mv4cSADvXn1VbUqvCPFO+8p/U75Edy2D9hkl7ZjEjLv31bNQusqiPLFX
gq+JtMbP82gkdQEUDM/K1Ld5CVG5tioTgxWkBBLgU6Ly9TJZBLhN8V+FKJwUhswr
bpBS+gia4bBuu+04aiqgt4Klwb3o4opietJt5ZtJy7r1THx3kGXC/xfl6LVPyLEK
Rbtfv8c61+QmD75lC4Ydatoam55Gu1wjcct4SeqDWO/OiyJRRduoJWvOfCl7h4AI
bDjKuBvoOOTaTOMV70s65FghmyDlNLSyuOGpTMGlTqXgSNYMMehxHPsdo46S2N/5
SYZPImYOXvYaja3UcCYl8mqZn2/yFYPaI0Y8B6v08nof4iYiKdlL+sS7cK1XAkeF
emLTs/BQbziyTrK2sMmeZsY/Yiyr2y53PIxFvgAfnxNEIyl9+ZQ=
=A0bt
-----END PGP SIGNATURE-----

--4erhebjcgk6jk4go--

