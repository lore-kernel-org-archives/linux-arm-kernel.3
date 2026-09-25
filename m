Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E816C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 04:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNCXrCGsdTEIc304eZ6sG3kavghRL8koSeqoFiVhQaw=; b=dHm26OMTMqC7tvT590Bdze7P4x
	6ABHLl75F/xJn7mcWG18sp3p2I1BXFbbrc9AIxYCahntCaEyNrBjNhoOL5lhSJFR3fuGQk9963Ga2
	HM0AAFWe1sywTBpMya/7DwkSQdYPE2raPn7d8lsN1M78N7vEqS81hxoTkEUmKALNSbdjrIab0GH8U
	hyNV3+Ti+WU+ymkxDqI0G5+qUB9NAzQ6pr3UUl5KHfQsU1xZbKb+fMJ0k0Dp6SStYpvfh8ogPBwO1
	VVwC+7W6J1F3U05O2FYxG0XndFaP/fUyXejHuAhZkT/gJjM12jQq322wJtiEnAfLn/FKbUkZN3iIs
	H//2+4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xbJ-0000000Cc5H-2vGt;
	Fri, 25 Sep 2026 04:31:57 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xbG-0000000Cc46-2Ufu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 04:31:56 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c294938a983so17204766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 21:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790310712; cv=none;
        d=google.com; s=arc-20260327;
        b=oVuDr39CDRJsykPnJNshEz0m8LW2hyBbiCI67yrQ2Z/6Wn5/oxVRaKQH/f8lplTqGt
         2CU5kGpZPQetlgV1/EPsVymdoVJ/a7ir4cEqPRW4ksdPoBY/AyEktIOZlBz0gyRFQhiO
         nn4xCb3CIGwrdPXAwwEkrWpGmU7p9GXpPcP9gf3PgVQ9ANSf9lOFi2T5uRU6G4Z5biWg
         tLQWSFoqkxdmaLCnUA73g2EqGwl+hNFGOQNxy4LpWDagM45g2PKkRLKOVOgSE7LZZiFq
         ynWdpq6+V/AuzTixJXBdKOxO+2R3D101gBXT8evhUL1Q4BQ8JipIuocZovSeHaN/Ntbe
         UjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TNCXrCGsdTEIc304eZ6sG3kavghRL8koSeqoFiVhQaw=;
        fh=My6Y/L/QpZ0j/vc+l57/xN8eEuPgCUSA5h/qG+eORA0=;
        b=LHV9hjnL7UD+CuHOK/ORl6EFVJr6DIDHvgNQcqIE8D+1Quteft1vrl8a5iwfYPsdkZ
         bk3uaxv3ItZ5o/4+zPy5/NF6dJ+OX6uh76QsEQaa3WIPBfphFNKDINE7cqBpm5fE/Vdb
         J5vcOZiSxYDq27wjf+PPh1iBmbS64GG0OnIr5ywpdBpllA+cAl320TRKYWhMruuw1hV6
         KtB6/7o91a7fu94qt2/aNvliY87yoQYcfM5XZeiHeseAZIbxgcS0lU+P4XAN5UCm+ljG
         bk+inmR8fEv9hD79QBCzqkfpE3dIX2Sv8fd0PRnX6TZFlt5VfW9iAbZef4Ph3ueEJyVn
         MnAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790310712; x=1790915512; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNCXrCGsdTEIc304eZ6sG3kavghRL8koSeqoFiVhQaw=;
        b=APPBLoRRGdjeILWa8ZHHRKQWmJCmRhaxTY0OOrRf1DLGAPufuEw2sq9RVV+lWf+XwK
         vJdRlGpTwaiQq+QfNUrvMJWcAktKfVdUQftcN01BGOGVxEJjFpYKqGnl+EnH8XuoQezR
         KWmx1GevxDApsfcbtdkrVdqAuxVx1159L8IzfAk1OhEZuxkbO4y3ml2bXolsteJx7sZI
         cS1NGI6iy8e4qT4/h/rRO0gBa0L/GNiE4NGuQrncFuqRSGzibdjmFp8BPKWpxNk1HyjH
         6d1t/FaX89jPj9JNtwuPM2pYDZlXKwpkYdD55N7OXxCQ7BmqhctucX/T8lE4meNB55MX
         8HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790310712; x=1790915512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNCXrCGsdTEIc304eZ6sG3kavghRL8koSeqoFiVhQaw=;
        b=Q/D4ZUxCcRgmSFgaBHDWsY85MmHtvt/LfZXZUg0pyZIeFnq3rB80tthkEjhoZGotM2
         rN0frLQKF8z36HL7LOxMuIrypjK2fZpT1dVChgcSbiadQwFiEpaoxflXmfnsUHDUI0em
         8ZcbBqTL7j7wUo8jGzyeY0ZZxlpIe/3RlRkgFF7wI5qIgKlhaBa1Ops35hgh3GYqqnf6
         OSWXJLdXDTf1SpFr50R+C1sXSFgUZS8pJr68KMcCizGSUMjxF4A1lhFRRg+ArmUNcyiX
         tRC2ZIXLGyIM9lUuFJWkkObDWi6GN9r72Hq8jdHnYEqrx/Yx8ctEWjGaO/xHITSY7Z9G
         zrhg==
X-Forwarded-Encrypted: i=1; AKwUvBzmCsL1lru/E4CVR1MZIqAkxvGF8evSPj9yiEgveliSTLQhNIKTBtNp4OuAp+aQ63EoHxb42wfTpo3eYUwZcnkB@lists.infradead.org
X-Gm-Message-State: AFuF++mxQDmZkjOoUUnwHEfRSBLlIX4moC6WhbRbnhrAmjx3VVK/bFp1
	SQlKJpDkz1S4tizeFeuvI22LRGe9LgITNNxqSg8XgGupSGddFedtCPXNxwPy2E8gci4O4KoTY2e
	ZCxgbJb/IV3j0TvpeCqKRSX0Lli6ugTY=
X-Gm-Gg: AYBFou1aDGwx785Y3ERU5BLeZGj4lPTy/Un/NFacXni0X7jDY7vEo6Znn95w6C5/PC9
	rO1nNhqrfpIerigyyvBZ7tEynu/EUXmH6K+J0aHGiaeg4iQn2vC8bx9rYV3cNXEBydxvqrImlzU
	ioQ7cBngLDAiWH4ZQ7KvA8/svvUbUe+kZ6KuCrS2pXSEZcI2tqROUSN2A8rUFRsuw9eNQAAuZQN
	ukW1d6fsZ3OtBi+u94j/SaTkN6w2EC6NSb2b4yBJDfnexButiaX/4ZbajDTQbqeZ8umL043pR3S
	WIDSIfSpYdZjYjH0YtlLtRBLOuHIGbSeA9Vnh1NHuLo79z3tQfuoKls6x1nvfxIWuUURIg==
X-Received: by 2002:a17:907:3f89:b0:c15:e8c8:340 with SMTP id
 a640c23a62f3a-c2ac23eb793mr381414366b.23.1790310712139; Thu, 24 Sep 2026
 21:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260922200336.2201212-10-coiaprant@gmail.com> <179030182602.2160803.7636364487893366164@kernel.org>
In-Reply-To: <179030182602.2160803.7636364487893366164@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 25 Sep 2026 12:31:40 +0800
X-Gm-Features: AclHuK-geYaCrQiIqbsqm9RqVt7-leTLevfj4XZTsxhgOEb2JIertLp2aoE5xzw
Message-ID: <CALj3r0hF_fwnA7Psp8kc8EqthS9FZr4LUkqGXDLtVHesw7tUvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 09/11] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org, 
	linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_213154_717067_DF9BB8EB 
X-CRM114-Status: GOOD (  51.28  )
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

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8825=E6=97=A5=
=E5=91=A8=E4=BA=94 10:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 (3) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In SGMII mode, the RK3568 glue tells phylink it supports
>   interface modes that the hardware cannot run and that the glue never=E2=
=80=A6
> - [Medium] The commit's explanation of the SGMII in-band vs out-of-band
>   problem does not match the code, and the driver does nothing to reject=
=E2=80=A6
>
> Pre-existing issues:
> - [Medium] rk_gmac_resume() (dwmac-rk.c:1618-1627) calls
>   rk_gmac_powerup() and throws away its return value, then always=E2=80=
=A6
> - [Medium] gmac_clk_enable(bsp_priv, true) (dwmac-rk.c:1181-1200) first
>   enables the bulk clocks with clk_bulk_prepare_enable() (line 1187).
> - [Medium] __stmmac_dvr_probe() calls pm_runtime_get_noresume(device) and
>   enables runtime PM (stmmac_main.c:8112-8115) before calling=E2=80=A6
>
> --
>
> net: stmmac: dwmac-rk: add SGMII support for RK3568
>
> This adds SGMII support for the RK3568 GMACs. It sets GRF bit 7 and
> hooks up the Rockchip XPCS through the pcs_init, pcs_exit and select_pcs
> callbacks. It also moves the clock enable in rk_gmac_powerup() earlier,
> unifies its error unwinding, and for SGMII clears set_clk_tx_rate and
> sets default_an_inband.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 386)
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 8d7042e689261..88f09014e3a69 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>
> [ ... ]
>
> > @@ -1208,6 +1236,43 @@ static void rk_phy_powerdown(struct rk_priv_data=
 *bsp_priv)
> >               dev_err(bsp_priv->dev, "fail to disable phy-supply\n");
> >  }
> >
> > +static int rk_pcs_init(struct stmmac_priv *priv)
> > +{
> > +     struct device_node *np =3D priv->device->of_node;
> > +     struct device_node *pcs_node;
> > +     struct dw_xpcs *xpcs;
> > +
> > +     pcs_node =3D of_parse_phandle(np, "pcs-handle", 0);
> > +     if (!pcs_node)
> > +             return -ENODEV;
> > +
> > +     xpcs =3D xpcs_rk_create(priv->device, pcs_node);
> > +     of_node_put(pcs_node);
> > +     if (IS_ERR(xpcs))
> > +             return PTR_ERR(xpcs);
>
> [Severity: Medium]
> This is a pre-existing issue in the stmmac core, but this patch makes it
> much easier to hit. rk_pcs_init() returns -EPROBE_DEFER from
> xpcs_rk_create() whenever the XPCS device isn't bound yet. Does each of
> those deferrals leak a runtime PM usage count?
>
> __stmmac_dvr_probe() takes the reference before PCS setup:
>
>     pm_runtime_get_noresume(device);
>     pm_runtime_set_active(device);
>     if (!pm_runtime_enabled(device))
>         pm_runtime_enable(device);
>     ...
> error_pcs_setup:
>     stmmac_mdio_unregister(ndev);
> error_mdio_register:
>     stmmac_napi_del(ndev);
>
> None of the error labels drop that count or disable runtime PM.
> pm_runtime_reinit() returns early while runtime PM is enabled, so
> usage_count is never reset.
>
> fw_devlink doesn't parse pcs-handle, so the GMAC can probe before the
> XPCS. After the probe finally succeeds, the count can't reach zero, so
> the MAC would never runtime suspend.
>
> Deferral from stmmac_mdio_register() already hit this path before the
> patch, but deferral is now likely on RK3568 SGMII boards.

Agreed that this is a real problem, but it's in __stmmac_dvr_probe(),
not in dwmac-rk. The error labels in the core don't drop the count that
pm_runtime_get_noresume() took, and pcs-handle is not a fw_devlink
dependency so the deferral is now easier to hit. That should be fixed
in the stmmac core in a separate series. I'm not going to restructure
the core probe error paths as part of a platform glue patch.

> > +
> > +     priv->hw->xpcs =3D xpcs;
> > +     return 0;
> > +}
> > +
>
> [ ... ]
>
> > +static struct phylink_pcs *rk_select_pcs(struct stmmac_priv *priv,
> > +                                      phy_interface_t interface)
> > +{
> > +     if (!priv->hw->xpcs)
> > +             return NULL;
> > +
> > +     return xpcs_to_phylink_pcs(priv->hw->xpcs);
> > +}
>
> [Severity: Medium]
> Does this give phylink interface modes that the RK3568 hardware can't
> run?
>
> rk_get_interfaces() still sets RGMII and RMII, because rk3568_ops now
> has both set_to_rgmii and set_to_rmii. SGMII comes from the XPCS through
> stmmac_phylink_setup():
>
>     if (pcs)
>         phy_interface_or(config->supported_interfaces,
>                          config->supported_interfaces,
>                          pcs->supported_interfaces);
>
> xpcs_rk_create() uses the plain xpcs_create_mdiodev() and never narrows
> pcs.supported_interfaces. The set is therefore filled from the generic
> synopsys_xpcs_compat[] table: USXGMII, 10GKR, 25GBASER, XLGMII,
> 50GBASER, LAUI, 100GBASEP, 10GBASER, SGMII, 1000BASEX and 2500BASEX.
>
> The rockchip,rk3568-xpcs.yaml binding in this series says the hardware
> supports only 1000BASE-X, SGMII and QSGMII. The dwmac4 MAC caps include
> MAC_2500FD, so phylink keeps 2500BASE-X and USXGMII as valid choices.
>
> rk_select_pcs() also ignores its interface argument and returns the XPCS
> for every mode. Neither the GRF nor the combphy is reprogrammed when the
> interface changes: set_to_sgmii() runs once from the DT phy-mode, and
> the combphy is fixed to PHY_TYPE_SGMII.
>
> Now take an SFP cage, or a PHY that switches host interface, such as a
> 2.5G PHY moving between SGMII and 2500BASE-X. Could phylink pick
> 2500BASE-X or USXGMII, and xpcs_config() then program a mode the SerDes
> and MAC clocking can't carry?
>
> The same set is also copied into lpi_interfaces for EEE.
>
> The in-tree Photonicat board uses a 1G PHY with a fixed SGMII interface,
> so it isn't affected.
>
> Could the RK3568 XPCS supported_interfaces be restricted, and
> rk_select_pcs() return the PCS only for SGMII?

The glue passes pcs-handle to xpcs_rk_create(), which uses the plain
xpcs_create_mdiodev(). The XPCS core has no platform callback to narrow
supported_interfaces, so the glue cannot filter the list cleanly.

The only way I see to restrict it from the glue is to overwrite
pcs->supported_interfaces (and possibly compat) after
xpcs_create_mdiodev() returns. That reaches into the core's internal
structure and I'm not sure maintainers would accept it, so I've left it
out of this series for now. If there's a preferred way to express
"this platform only supports SGMII" from a glue driver, I'm happy to
use it.

In practice the phy-mode is fixed in DT and the combphy is configured
for PHY_TYPE_SGMII, so phylink will not negotiate into 2500BASE-X or
USXGMII on this platform. The wide set is harmless here.

> > @@ -1379,16 +1449,19 @@ static int rk_gmac_powerup(struct rk_priv_data =
*bsp_priv)
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D gmac_clk_enable(bsp_priv, true);
> > +     if (ret)
> > +             return ret;
> > +
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but the direct return here
> only works if gmac_clk_enable() cleans up after itself. Does it?
>
> gmac_clk_enable() {
>     ...
>         ret =3D clk_bulk_prepare_enable(bsp_priv->num_clks,
>                                       bsp_priv->clks);
>         if (ret)
>             return ret;
>
>         ret =3D clk_prepare_enable(bsp_priv->clk_phy);
>         if (ret)
>             return ret;
>     ...
> }
>
> If clk_prepare_enable(bsp_priv->clk_phy) fails, the bulk clocks stay
> enabled and clk_enabled stays false.
>
> Every later gmac_clk_enable(bsp_priv, false) then returns early on the
> clk_enabled check. That includes the new clk_disable label and
> rk_gmac_powerdown(). Does this leak the enable counts of the bulk
> clocks?
>
> This only applies with an integrated PHY, because clk_phy is NULL
> otherwise.

The clk_phy failure path was already fixed by a separate commit.

> >       ret =3D rk_phy_powerup(bsp_priv);
> > -     if (ret) {
> > -             gmac_clk_enable(bsp_priv, false);
> > -             return ret;
> > -     }
> > +     if (ret)
> > +             goto clk_disable;
> >
> >       pm_runtime_get_sync(dev);
> >
> > @@ -1463,6 +1538,10 @@ static int rk_gmac_powerup(struct rk_priv_data *=
bsp_priv)
> >               bsp_priv->ops->integrated_phy_powerup(bsp_priv);
> >
> >       return 0;
> > +
> > +clk_disable:
> > +     gmac_clk_enable(bsp_priv, false);
> > +     return ret;
> >  }
>
> [Severity: Medium]
> This is a pre-existing issue, but rk_gmac_resume() throws away the error
> that this path returns:
>
>     if (!device_may_wakeup(dev))
>         rk_gmac_powerup(bsp_priv);
>
>     return 0;
>
> On the non-WoL resume path, a failure in rk_phy_powerup() takes the
> clk_disable label, gates the GMAC clocks and returns an error. Nothing
> sees that error.
>
> stmmac_resume() checks the plat->resume return value, but gets 0 here.
> Can it then go on to MDIO and MAC/DMA setup with pclk_mac and aclk_mac
> disabled?

Pre-existing. The path that returns an error from rk_gmac_powerup() is
the rk_phy_powerup() failure, which on RK3568 is the external PHY
regulator. It's not related to SGMII or XPCS. I'll leave it for a
separate fix.

> > @@ -1602,6 +1681,17 @@ static int rk_gmac_probe(struct platform_device =
*pdev)
> >       plat_dat->suspend =3D rk_gmac_suspend;
> >       plat_dat->resume =3D rk_gmac_resume;
> >
> > +     if (plat_dat->phy_interface =3D=3D PHY_INTERFACE_MODE_SGMII) {
> > +             /* SGMII clock always runs at 125 MHz */
> > +             plat_dat->set_clk_tx_rate =3D NULL;
> > +
> > +             /* SGMII requires a PCS */
> > +             plat_dat->default_an_inband =3D true;
>
> [Severity: Medium]
> Does the commit message's explanation of the in-band vs out-of-band
> problem match the code? It says:
>
>     Out-of-band mode does not work because the MAC would need to change
>     the clock rate to 125/12.5/1.25 MHz for 1000/100/10 Mbps
>     respectively, and the clock is fixed.
>
> The clk_tx_i comment in include/linux/stmmac.h and
> stmmac_set_clk_tx_rate() both give 125/25/2.5 MHz for 1000/100/10.
>
> In stmmac_mac_link_up(), the negotiation mode is passed only to
> plat->fix_mac_speed, which dwmac-rk doesn't set. The MAC speed
> programming and the now-NULL set_clk_tx_rate call are the same in both
> modes. The MAC therefore sees the same fixed 125 MHz clock whether
> in-band or out-of-band is used.
>
> The difference between the modes seems to be on the XPCS side: AN in
> xpcs_config_aneg_c37_sgmii(), versus the fixed BMCR write in
> xpcs_link_up_sgmii_1000basex():
>
>     if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED)
>         return;
>     ...
>     ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
>                      mii_bmcr_encode_fixed(speed, duplex));
>
> The commit message also says that fixed-link nodes, and PHYs without
> in-band support, can still end up in out-of-band SGMII. TX then works
> but RX fails at 10/100.
>
> xpcs_inband_caps() returns this for SGMII:
>
>     case DW_AN_C37_SGMII:
>     case DW_AN_C37_1000BASEX:
>         return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
>
> So phylink will accept out-of-band mode, and the glue neither rejects
> nor reports it. Should rk_gmac_probe() refuse, or at least warn about, a
> fixed-link or out-of-band SGMII setup, rather than bring the link up
> with RX not working?

The out-of-band SGMII rejection cannot be implemented here: the XPCS
core's xpcs_inband_caps() returns LINK_INBAND_DISABLE |
LINK_INBAND_ENABLE for SGMII, and there is no platform callback for the
glue to narrow that or to veto out-of-band mode. Phylink will therefore
accept out-of-band SGMII and the link will come up with RX broken at
10/100. That needs an XPCS core API, not a dwmac-rk change.

No respin planned for this series.

Coia

