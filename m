Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C178AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iaVHc4/XfXA2DF9jl+povuubBeCM8bFfr3Gc9B5VcM=; b=ey06bm3kqdSJsDTCnMJPNzUCdB
	4I10wKL1OSip/z3Pny+pkeXM1ydnFhHnKxnTBWg1AQhZ2JRtoCGriCPV0Ap2N6vgQDgIrop+woilX
	BrmpeGyCTQGdFVsO17p0CF+rA/Ng6Muyacq4SH9lbLqMQL5gVFb/myIu+2m407dtwGH2ZbaSYVkT4
	EhOc+tzhkCWE+I93905b24FV+u+KmPPGUhuldW/WXgq7eMHT2O5AYWzEfi6JCgfOWpGFFFDZYPrEc
	cEjT5NPrWLiLLTu2OLWafyT+65i99zwRXNLu+KHpig9SbgHhyCyw4O1c8wjPxnhcL7v6jGQSpIBKd
	nAuK/TiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn03S-000000012qp-2cxg;
	Tue, 25 Feb 2025 18:53:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzoU-00000000yYT-2W6L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:37:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4398e3dfc66so52425485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740508669; x=1741113469; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3iaVHc4/XfXA2DF9jl+povuubBeCM8bFfr3Gc9B5VcM=;
        b=LytqM7JblS7FiftRHz1oN1mCBJJ4k+l6vo7+4NqaSEnD1BFMlk7732oUibgS3oux3t
         30jN2Y1/iuDWMQdNeJLceLAKH25oIE/lLohwUm7HCK9kmzPsiitj28pGx6hNh0BMTVHC
         32wUYGLTr5uYyvC0hSJfeKsNPavftRpBJgOofVsktFwxAaPlwlzBirl3Gb+Q/4pcrkOl
         uune2EzAisvl//EDdk5x363qPT5RDnzGBW/JEz+7sznZkJR56uOehQY8FELPCFLOBr38
         jJjn73GjLKwT8yqO/R2iS+XDVmYHj4xYVcuJTRYfCHfsJ5t5ANUGO/sd3EXixyKmSA0d
         V/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740508669; x=1741113469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iaVHc4/XfXA2DF9jl+povuubBeCM8bFfr3Gc9B5VcM=;
        b=bjvxwgXjKbN/XEICaZUnKCr6Y+CCuABEr0sA0al1Eh76dHCG9y6lxv7ZJtREuv7TfI
         35i+2lr4y/p9abmlcrHjdQQTy/F4h1XCHPOjtput/G3YowVZ2aIHDV7p4ksLqCstAxYH
         E9IzPQwQyDmTaqOPF9I6xZqMiawrWSG2jjU75BDlQ/gzFCvGF4G6mdrh6Bka/Ia0Dc4j
         IRnKrrF3b7X65fvhGvFqVsfyWq23zJtmzddgIsHC+9Ve9L6QL0y5IylG43gsEW3daNQe
         /kinsuSZiUMT9VX7Cg/6QSJOMB716cBnY43ShfkffN6qElxqOOEhuE/oQ4M99HdNLg6w
         MZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZbSQ6fY8VIstmgxlWE6GdiQE1BkgrM/YRCSyKWlOWO6QRezDAwq6BoO02sSwWC8Qg6tFm40dlXAMkNueJx4PW@lists.infradead.org
X-Gm-Message-State: AOJu0YzoPBNU4iHkETJwpvgTatKcsaubHvSNgJhOdSx/q+qL/rN3xnb0
	Spt8+0I0OGsW0FJFYCXZbW42F0gAAeN92I1R7TYSTsJ+Hf7Bac3t
X-Gm-Gg: ASbGnctRm3V1+DQ+eelgtiHyQkCgYjbHTLgbQ4KI0xEzWp788eW8FQfBiZ2OFdWfJm+
	AsiwkQ1q7rs0XmnhNYl3I/tAwKMN2slZ0+6EIGGpYTxsSUd5NCdCJOxuxfpIYJ1YNt0RNEhyB1j
	pGEYfINKFAAAdaV+0mMNU5f1m7b8UELQUNet3vZsqCQbFnqmKhQHgsy+qQ8JRUdUHrVOEXPKRsh
	M4Hj5LcfUraivnWHki+oajWuPFAJCWLiAQif/z7zLz/5uD+LOM7S/XppjoJ8FMYHX6RDPQQaMAh
	L9++Y5MP53Z/SAiAbgBThC0m+r3anpVVHBSvTOsgm3zJYA+VdLOcw/WW5Xv8+Xa7XMH4zsKUXtL
	xNZ3hsY07VEMH
X-Google-Smtp-Source: AGHT+IH5jV0WLJwr4meYw5t5geNhiZJeRS99N5uTizzJ/xzS+uRzG3Le5O1v29l/A3y6EY3d135kgQ==
X-Received: by 2002:a05:600c:1d0e:b0:439:6712:643d with SMTP id 5b1f17b1804b1-43ab8fd8620mr5118395e9.9.1740508668374;
        Tue, 25 Feb 2025 10:37:48 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce735sm149842745e9.3.2025.02.25.10.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:37:46 -0800 (PST)
Date: Tue, 25 Feb 2025 19:37:44 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: dwc-qos: clean up clock
 initialisation
Message-ID: <5qx6hg33brb2zjjqzk3cr7dt56m5jxcwzioejtw5woweemskg5@suu43pp3nsg4>
References: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f3i4x2skmc3z4dxx"
Content-Disposition: inline
In-Reply-To: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_103750_641163_3F007620 
X-CRM114-Status: GOOD (  16.03  )
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


--f3i4x2skmc3z4dxx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: dwc-qos: clean up clock
 initialisation
MIME-Version: 1.0

On Mon, Feb 24, 2025 at 04:53:16PM +0000, Russell King (Oracle) wrote:
> Hi,
>=20
> My single v1 patch has become two patches as a result of the build
> error, as it appears this code uses "data" differently from others.
> v2 still produced build warnings despite local builds being clean,
> so v3 addresses those.
>=20
> The first patch brings some consistency with other drivers, naming
> local variables that refer to struct plat_stmmacenet_data as
> "plat_dat", as is used elsewhere in this driver.
>=20
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 53 ++++++++++++----=
------
>  1 file changed, 29 insertions(+), 24 deletions(-)

Tested and works fine on Jetson TX2:

Tested-by: Thierry Reding <treding@nvidia.com>

--f3i4x2skmc3z4dxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+DfgACgkQ3SOs138+
s6Hc5xAAns6YS5EqizTjVtcybrFLTInegeZ0X+D5ciydxOvm9iHAwZY2/4ywuY9e
gq6UePIgB51vAzfDfxy5R5X4GvK5+922IL841tyDAJejg54ylBHTFiDoWJVNXUll
QJbbhM+dL0vRRaxTqPzJfJzkIO7ZyU0BylQwr3GYka21DUkYK4J/LnTleP1b3LMu
1W0QlEMWq5DznlUJuQ8C9Tn1C4Pr4+ZRmDjSPF7t8coFAP5XNs9Db5KK0DWkTWto
P0HugDfCHPdDHodfPFzHnT9QxCESDiIHjX4P+PTcR9w4eqg+gjMkiXq1EDpTYu/O
ph05+xPdywaHeGftW0K2RAf3ZdSRep1YWI90autg4U/g0JTq/P9fCyOwR8p3WEen
AtGz3MvZmcGbe6FGY7ZjnY/tVKAwPVP07DVSJcD1DzTe+YusCryfWRUTIHfpe69L
Ric7GRdggYEOZL88Y/bpybtv6kb3baNOpUDwKHj8xDn72FA8coa6Xl8KYDhZvzQe
4jxMzrghudcWAQ8XKxgxB2q+lZ7B+ZFRt1xU6jc7x+KdMsAGI8XHXc1Y0LiiJMfs
xNyl8+5hHbissm7ie2JbC/UyuXB4pCtB51+qfRJrzdZs+DTHXbyZZT5TtUWbtHpB
AzcgVhxrv05jSv7AzsbQiFjNoCC9WZvdMfzZg3Ja2bAh62bFw+o=
=BS53
-----END PGP SIGNATURE-----

--f3i4x2skmc3z4dxx--

