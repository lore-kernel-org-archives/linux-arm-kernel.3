Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DE5C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 21:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jH89/eRi22ETk60jcZZWWsxXWB9XkoRdP5UQ7ZiQNJs=; b=Wv6jB4+GJLBsyDDe2e0Kbk6tYF
	OjZNN4gi5NTt6GAcs5+F55zdcirrGc68IJwYefioYaIL2M60V3IT3k6X89ZslcfQqUkJKcXJ+Lfr0
	Yc1fvI2TO3rMvvVrmnvwLuIxUX7Rv38N5MynsGT2pI350CQW8sUBtwjDtoW9b/Y5nN5f6+YSHWK7P
	cNztrv+jTdujD1kCWGnagL+CxY2usaiJ/OEE52lpMGaA3ZL7Rv5Ianpmv4ydM5Am/ekj+REFRQ8i6
	U3RNsHBtCoQMWy+NTp6Ga79nLoR5sacCHT+yo4JQn92soBdFfUN2GzSraNJbsqUW7X6k2BaNzXKI3
	p3RzPYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8PZ2-00000000Ulw-0yQC;
	Sun, 20 Sep 2026 21:59:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8PYx-00000000Ul5-36Ee;
	Sun, 20 Sep 2026 21:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jH89/eRi22ETk60jcZZWWsxXWB9XkoRdP5UQ7ZiQNJs=; b=eUYQMERMUGvmRYPWE9MG/fAeiZ
	5Hl3Nu2wuESMYC0X1UD3fj10sMty5If4a2lM6qA2MmqGUXllc0JQHAAa4MwyEGZZl1kpJClvLUDVh
	S7BetuprJn8+VQGwvRHM1OiYFiEpZFI5nTblGCtUU7hasHw8pB6gHaIluYQ+7dRMUmhM5+YIilNhH
	HNIiyIgS32IU0ndzCf43RbL8FM3WzLSpVoz7+mKMG3ivnBJwa/vRdm6Ofl7Plby+SG+DCsPdT8tQl
	El3CLNPJPrPs/iMHS8NpS1BTyUNLbYZ6inJLGQSwnU3MiOD7nnT4wYoXED4Mp1Yd6SfTHxh4qNY4C
	QN0t+haw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Coia Prant <coiaprant@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH net] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the
 PHY clock fails
Date: Sun, 20 Sep 2026 23:58:45 +0200
Message-ID: <4340525.usfYGdeWWP@diego>
In-Reply-To: <20260919174223.2356964-1-coiaprant@gmail.com>
References: <20260919174223.2356964-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_145907_794000_6221424A 
X-CRM114-Status: GOOD (  12.93  )
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

Am Samstag, 19. September 2026, 19:42:23 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Coia Prant:
> gmac_clk_enable() enables the bulk clocks first and then the optional
> PHY clock. If clk_prepare_enable() on the PHY clock fails, the function
> returns without rolling back the bulk clocks, and bsp_priv->clk_enabled
> stays false, so the later gmac_clk_enable(bsp_priv, false) becomes a
> no-op and the bulk clock references are leaked.
>=20
> Add the missing clk_bulk_disable_unprepare() on that failure path.
>=20
> Fixes: ea449f7fa0bf ("net: ethernet: stmmac: dwmac-rk: rework optional cl=
ock handling")
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Thanks for catching this

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 8d7042e689261..f3a98bd9d6ead 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1163,7 +1163,10 @@ static int gmac_clk_enable(struct rk_priv_data *bs=
p_priv, bool enable)
> =20
>  			ret =3D clk_prepare_enable(bsp_priv->clk_phy);
>  			if (ret)
> +				clk_bulk_disable_unprepare(bsp_priv->num_clks,
> +							   bsp_priv->clks);
>  				return ret;
> +			}
> =20
>  			rk_configure_io_clksel(bsp_priv);
>  			rk_ungate_rmii_clock(bsp_priv);
>=20





