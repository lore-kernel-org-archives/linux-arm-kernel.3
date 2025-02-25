Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2DAC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqTyJfrpmh9OoHhGhSLNFtCY+nJglgvLIHJFw60aWtk=; b=2hZBJdVA0UbFeU6SiMIh4pmwFr
	2nZxKkcZ/+RbMEtMuEDgi1Agb9BMNL70z2zqPl4zXeVLyLzzay1sxAjF4l7jeO3R2pKwrugVHx/y1
	Tj3tjLB+FuzgvC2eLnGR2kduxfE7ir2lEo/aOpcsj/RYws+7ELn7SM8vUKhf2GeDPvsNNO5NffCGM
	mvjy+h2uGfby94Ai5p/17IIN9jVKJuBxIfth99r99N4r0jSmcYS+ISkia2n2I+MRTZugQRjof5gq3
	mcZtl8ynsw3rEUNm8KNwx+y/A1RsRT7Cij94H0PSnpskRDY5qHR72NAKG+DzAExwVSHQ4qLp8+PzO
	jO6Y8m+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2Eg-00000001VE9-1Ytx;
	Tue, 25 Feb 2025 21:13:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1ar-00000001NUJ-2Q43
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:31:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abb75200275so964879966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 12:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515512; x=1741120312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqTyJfrpmh9OoHhGhSLNFtCY+nJglgvLIHJFw60aWtk=;
        b=X3ltkKdmSf8pAWRxJ+T6UajFsZIMvfkf0hf01A7pam0C0si24gktL6r4xnzI32TnfH
         ANq9U0MdJj3PA2NThMK+hlNsge1Bai24SBXD+8hRD72tuG7ro2GOPLr1mxAET3k5sT0U
         c5vy9qnoDcZesARI5e3ZNRRd8IZR/cm5vKQkG/ZytN3E4oDxoNeae2yS7dq84IsC1oSJ
         Rck/qVXB4HSNkuLHz0TOC4th8zbQNzb0+8ZTHN9Y/6jw4YgXaV4VbVL2/xuGxjLqHLsj
         wJM6Ebkqj1PLnAUk1icspvp5Jn9M5nVk2I+3NhjpJwhY0aQ4TcC8SyjBQAcUuDdFBg4b
         TKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515512; x=1741120312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqTyJfrpmh9OoHhGhSLNFtCY+nJglgvLIHJFw60aWtk=;
        b=VcQp9/qEW592ufuq6AMJDwZ0oae0HmAtxxQ98/vNdsLQ7jLquVVc6C4aWWx+WadFdU
         kIoUYQCYBB1GEluVheMT7PlzulaVG+7bPO8XZD3de+HS0VYvE9eThwhEGcrr+mwELam1
         6ET0Dp2oNkkDhok5gaqzTdNinN8FO9qyF5aUHAR2Fd0iQGAIzJomtEhjAigRV/2epUJc
         i6CJT3xiLPx9wPGYcoJSSUeyBPA1XCsauk0Z8w/MHQg/1gH/TN6cU4TG6Yev6NCH6zVN
         +CIfRYXadlGghFGnIT8E33hCis6IlY2kPL2GO1OMDd47y8BGi1SAq7Y4F+jwakF10yNw
         cO7g==
X-Forwarded-Encrypted: i=1; AJvYcCXoaDuHnu/RguIWLM8/7O2MaRFf7WPEyYlpf2FfzfRvA5etvFwKfK1Ram7c52qHvemrpWIyclM6G7XgpbXqg+42@lists.infradead.org
X-Gm-Message-State: AOJu0YxzvhRQ0Ssp1Yd4kixXXPPDQDp+hB7quc1PWqBQN9Su0PUYX/s5
	CSqQRXMxRgJFHabezriwCJKDrpNx4/OCF24XtA3B0zERgxFBNGHi
X-Gm-Gg: ASbGnct9cYbJrb1G//iO/B8xAetyh8yb+5ZmMlczMAIB7CaOVs0rFfO+0TLpYFRrTeW
	wjI6Q3Yf36FfdNtjZFvXpShCQVCUAYTgb16adEYLR71gN1BmTrxczKSbjiFYC93QYiTRmDDdhOu
	KfmUJnFK9xQlYZTqeAbwdLoUZv61srCWMCnSSuzeMatZ4Qu+gmA6DV/gbbZ9FxotWsrw1bBsxpl
	Hvqles6DWLm4f21Iw1mfEPNbFSpw503b2YgcxefLThVaY8D8ULVpLeaMWJkQkAW9x2+22XcRtHR
	kRtuiWfbJbhgxrH3sIPl3owWzXviGp4XVjgaelXg75c1GeG7+0wwZt0MmdvhqeraMFsUvjKDiSs
	pK6yrliyhDuhF
X-Google-Smtp-Source: AGHT+IEJuXnWIMGDBSBMqOav7bVwcobNvyp7gvPMLJMccBBO8pTepVY+1CQtODf0snXMlUdT+6giVQ==
X-Received: by 2002:a17:907:72d1:b0:abb:e7de:f2a6 with SMTP id a640c23a62f3a-abc09e35401mr2167544866b.53.1740515511788;
        Tue, 25 Feb 2025 12:31:51 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdc46bsm197935666b.20.2025.02.25.12.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:31:50 -0800 (PST)
Date: Tue, 25 Feb 2025 21:31:48 +0100
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
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <o5ww56n7e5sfck737uwasx7o4zlhog47abfvfptcegikyheegu@6gapje5hr56b>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o3ccr5lq2mt5twat"
Content-Disposition: inline
In-Reply-To: <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_123153_614020_F2C9354C 
X-CRM114-Status: GOOD (  19.83  )
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


--o3ccr5lq2mt5twat
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:15:00AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 22 +++----------------
>  1 file changed, 3 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-s32.c
> index 6a498833b8ed..b76bfa41af82 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -100,24 +100,6 @@ static void s32_gmac_exit(struct platform_device *pd=
ev, void *priv)
>  	clk_disable_unprepare(gmac->rx_clk);
>  }
> =20
> -static void s32_fix_mac_speed(void *priv, int speed, unsigned int mode)
> -{
> -	struct s32_priv_data *gmac =3D priv;
> -	long tx_clk_rate;
> -	int ret;
> -
> -	tx_clk_rate =3D rgmii_clock(speed);
> -	if (tx_clk_rate < 0) {
> -		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> -		return;
> -	}
> -
> -	dev_dbg(gmac->dev, "Set tx clock to %ld Hz\n", tx_clk_rate);
> -	ret =3D clk_set_rate(gmac->tx_clk, tx_clk_rate);
> -	if (ret)
> -		dev_err(gmac->dev, "Can't set tx clock\n");
> -}
> -
>  static int s32_dwmac_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat;
> @@ -172,7 +154,9 @@ static int s32_dwmac_probe(struct platform_device *pd=
ev)
> =20
>  	plat->init =3D s32_gmac_init;
>  	plat->exit =3D s32_gmac_exit;
> -	plat->fix_mac_speed =3D s32_fix_mac_speed;
> +
> +	plat->clk_tx_i =3D dmac->tx_clk;

I noticed this while building, the "dmac" above should be "gmac".

Thierry

--o3ccr5lq2mt5twat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KLQACgkQ3SOs138+
s6G2dg//XEAP/SNRmlbm/Whtc1ed1XDDGWzN1eqPHb22h85AkhBzo3dyiGlai3KM
acTcFFS5ngfi1FO+bSmjLeGRcAiGJimDRpNSomDWy7XFwDaA8oWg4bkWSk29PGom
kWOv51f5QlkqJYvK5iYCr37vIThe9KQwQXurR7TbcMZjXggL/paw0o8fbU23+I5A
KF0Y2OLjg4OGfAISzc3SN7B4DKa1uomft05iVkSWcougkQH7N6wmfLTQwfMvXG11
yfIZYOPVd99SiSYR7CT6HLO4JCFDdVYQdJS58v61VvRgyOZlPEG9hCPNNHT+uTeF
Ld4SXrtSywR5WuoJC+B5tJwZ28HNAleCf/5iBxCmxj6AMfftiTaA9LR9K1Myhn9P
4WEXnvBIhw44yyVy6lVbARgSycNXbXey1zdzsCHoOC7vDyxRAsY6eZqcU0Gsaxhp
ARAEdhyVHL8C22q1FsgLUa7pvqavet9mLUz/tKBhM1s7ryQdeS9qzqx3D7VhEY5o
kVJ0ivva6sHgzLK5DkXKN/Tr34R4iBclkR2GAIK4KCFJbnJBMPMf3zeMAJA7v3rD
u8KwPspfNZnP2P1+D26kVX+6oBTXpLFjtKc4vHs3fZcMQ4SrATeeBPD7hOxZOOfL
n20+ZxoKnMcnqlukoxG157V1kl9eNk4ROaDJ8dljbEctRWfbUJU=
=QnMs
-----END PGP SIGNATURE-----

--o3ccr5lq2mt5twat--

