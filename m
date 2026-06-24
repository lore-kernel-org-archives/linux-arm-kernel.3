Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDD4CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 11:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js+56ANKxPxs/46/PFzp/qZpp2mD0OpgfX8pfIomZwQ=; b=HFPeJqZTZELBJw7lraUYctFRb4
	UbkisajJQKsxoXeDLG2p5rKsg/YGxiiBV5D2IRocBSGvQUz+t0onLZnf2GZf6piFOnyIfLn/5PaZF
	6JE2xKHRLW4td/KlgzgzhZy2sUXOYs22CAXBcKQ7qQBJUwjWjbxL3sY+97FlWsZdx3W7ZDRGJ0RpJ
	RcuEn2YtsZDnwOahCz+lllGqro2CZQdkSFpMx3hE74GdzGIxs/PXjGHgZsvFGOCYIRbLQq9IOLg4A
	I+JMAqQtv4xK2zAnbZRMqp8shie1fQB2tiLf/77OdKUPiLeNQ+mxQCCGWOq14FMJWdnNTtHvBVMbx
	EhJwbkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM6l-00000007hvo-2UFX;
	Wed, 24 Jun 2026 11:49:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM6i-00000007huw-1NkL;
	Wed, 24 Jun 2026 11:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Js+56ANKxPxs/46/PFzp/qZpp2mD0OpgfX8pfIomZwQ=; b=u+3l0513/jiVxcbyjkOiqN809G
	2FAxCcySH/27vGu51RIwGdzd7RdgsJzIElKLg5bvVdTYm5QR7ZuKjBe569yP2AMIi8NDorLSrXCjl
	+8EQngoG7F2CYbr6uBNs0PzsaEvGa9M3L/unrNeyXQxmck47zQB5//XBCQVNNSKWassX+h8GXcbom
	NU74uh7PQGCZvPUQD5k+n1KOp0Aho5ASE8t9dsdQQif1MKnvK5F70scLZSG1ntG+48DX0PbLuGVah
	7w2yjr982EGHwzmGmO/raYZ8htGjQmOSy4ovTLsfZepdyc6fOdag4SZtfNmsLJd5cYO1RBg8Il9Nr
	N4iyrrhQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Wu <david.wu@rock-chips.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yanan He <grumpycat921013@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Yanan He <grumpycat921013@gmail.com>
Subject: Re: [PATCH 4/7] net: stmmac: dwmac-rk: Enable refout clock for RGMII
Date: Wed, 24 Jun 2026 13:49:12 +0200
Message-ID: <4954560.rnE6jSC6OK@diego>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-4-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-4-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_044928_379051_C3844F99 
X-CRM114-Status: GOOD (  18.04  )
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

Hi,

Am Mittwoch, 24. Juni 2026, 10:44:41 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Yanan He:
> Some Rockchip GMAC integrations use clk_mac_refout as an external PHY
> reference clock even when the MAC is configured for RGMII.
>=20
> RV1126 boards can route CLK_GMAC_ETHERNET_OUT to the external PHY as a
> 25 MHz reference clock. If the driver does not acquire and enable this
> clock in RGMII mode, the common clock framework may disable it as unused
> and the PHY can lose its reference clock.
>=20
> Enable the refout clock handling for RGMII in addition to RMII.

the clock your referencing is not limited to your rv1126 but instead
present on most (all?) Rockchip SoCs.

And it is an input clock for the phy itself, so should be handled there.

See for example
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi#n313
as a reference.


Heiko

> Signed-off-by: Yanan He <grumpycat921013@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 8d7042e68926..f6fdc0c5b475 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1112,7 +1112,8 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_=
data *plat)
>  	bsp_priv->clk_enabled =3D false;
> =20
>  	bsp_priv->num_clks =3D ARRAY_SIZE(rk_clocks);
> -	if (phy_iface =3D=3D PHY_INTERFACE_MODE_RMII)
> +	if (phy_iface =3D=3D PHY_INTERFACE_MODE_RMII ||
> +	    phy_iface =3D=3D PHY_INTERFACE_MODE_RGMII)
>  		bsp_priv->num_clks +=3D ARRAY_SIZE(rk_rmii_clocks);
> =20
>  	bsp_priv->clks =3D devm_kcalloc(dev, bsp_priv->num_clks,
> @@ -1123,7 +1124,8 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_=
data *plat)
>  	for (i =3D 0; i < ARRAY_SIZE(rk_clocks); i++)
>  		bsp_priv->clks[i].id =3D rk_clocks[i];
> =20
> -	if (phy_iface =3D=3D PHY_INTERFACE_MODE_RMII) {
> +	if (phy_iface =3D=3D PHY_INTERFACE_MODE_RMII ||
> +	    phy_iface =3D=3D PHY_INTERFACE_MODE_RGMII) {
>  		for (j =3D 0; j < ARRAY_SIZE(rk_rmii_clocks); j++)
>  			bsp_priv->clks[i++].id =3D rk_rmii_clocks[j];
>  	}
>=20
>=20





