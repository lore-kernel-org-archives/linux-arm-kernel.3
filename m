Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0077C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sISzfPmgoaQUIHyBbaL9mtqCySms90Uh3lkhXDJB000=; b=SeBelQdcHltEqtnsMwDsMoGnwn
	Z0+pwNOWRFKmTNBKDzRIp+82pW8GgIXlb9PDJtGTQlGCkTkOYwzvwRcmwm1rLJV0zf/M1mrtwcas3
	kAJlYPaM1tNvMVErOMtm6vaxtX0ORbdnJAyOwPTIbvn7X1mGQLei72v79wX9dIc+iYI68hKxm48zt
	kqU6Nd2c1AEWtoKz+n7zNsIYNNroGZXETBd0/MyZe3ccvou1zTA2ldOVvV1Fx44SBjhQMd/hhGvS6
	Xe0/ZLRsAGh0EFWELXncvoXM2AqBfsFsYQJ3sSQNdrY/GSpp42b1oTUMEn3N4TeoUvr2qlYrqWWz8
	XfcQUpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RYy-00000006GjQ-3hTs;
	Tue, 15 Sep 2026 11:43:01 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RYv-00000006GhA-09es
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:42:59 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c294938a983so233087166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789472575; cv=none;
        d=google.com; s=arc-20260327;
        b=DztF8lsf2f90iBNjPh0rRbMS0fXfbW2bLbumNnsF1FimLrCQhpMgLjvAZYSl3bE0Xd
         AP+U1VH9t3C/icSTPJZJLicNbNGXIHhgPLIEl1LV5sLidxW89lH9a+uisESWJWk0i7ym
         vhSRHYtig0WkYNkAkY/b6kVctrUdrzWtdJeWbt5l7VgbrLntS2mRgurMp1hwr1PDNeds
         AHojjfLi5sA4EVZu0GvIbkoJduN9a9xgTQ31Xo5ZwGHHcfyWzuRcy2jGsy7dJZ5w4Wn0
         h0BH//lqddYbZ+600oBIXJdaWXNbP9KmV77tsY5fS0jf+Dzk2sg2zadHNVqGT3r3j8gX
         Oq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sISzfPmgoaQUIHyBbaL9mtqCySms90Uh3lkhXDJB000=;
        fh=bcpfKFjVqzGjb3Gx/KESkIDd/6OHQKA6w0cjtyneGdo=;
        b=XSAEoWma+zhdxYNqKzXClDf/8GIgaQ2Cb2VzvI9MnuxhC1KGk/sBWoeCygqwEJWMlS
         zZlm/RqqB5ILDRMxuxEBcQV295TxYlhGS1ICGoCYWB3A0W05fIVKIr0PhKY6hoNVoVWk
         Cxc71bw1JZfUdhah8Kfp5QwPoHvX5spDQL88nd/2+MHCcm9w6SiJ7AEiyq0SOTgCk7Wr
         q+pBdVyJCg9vS1107XqGd6EMHiWFos4XijzSElcOzfP2Hg+J6XwnReclyHR2Kc5Dp6z1
         aRl5ilpexOA8PBlXR8V0W0lkdTnLYiQFCjLo4axh44ZX7n8QdrlaW9DT0WAPBT3dUhBC
         TJLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789472575; x=1790077375; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sISzfPmgoaQUIHyBbaL9mtqCySms90Uh3lkhXDJB000=;
        b=Ri8JIHoDh+IGd7jb6LzNkWdfzZH+KPbInfsQcvmjmiK8Whs4va9CENX1C49+kAH2hj
         rKWDJXB2UnJr2OPh3/c6XwA+4jp9OL9gJXfhmDK7Sc5wyJzKfqtsx8VcWWVX5n2XkAYz
         CfCjIEw+LyUs5JjI78T1vC7i1IOuA8bE0Xflmb179sdh20IHECEOwzABAIy1gwS52WoA
         jKj8zvf35a8wwAIKLN888Y/bx+tjXtq1mKJTSa7HFwFHF37hV0HNYLzSt52VIfnpaEgH
         oPHzrP3PwEsd8fx0ZC7wRRLXsKUuoIzBFDshNY7dF1yYq1F4KOX4SEqIYL/zbDRbDY5i
         BYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472575; x=1790077375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sISzfPmgoaQUIHyBbaL9mtqCySms90Uh3lkhXDJB000=;
        b=2Gy1QVlOHXrydVcBuEFvghSBVAJlIUoYmlF24by3xrqVyZwXYonkhEfRt4n9tLhiFj
         vpdB+zvydrlTNPzx1/BE5tFlKjjSiBr2IDHddMhtDUu+Mt3tVsdTUOV20lD5n2Ut74Ed
         ohlVcupDFi68H3uUgstrPMWn9BDmbZgYZtyuwp2sRgyLYzsK2hqol8KvFFDx0iti1W9c
         2CIdrdRg/AJuUq3zJQmoxTr10yZfDEEjrpCXRG6MegAnfgy+Li96aIBxy36tMNJwbu5u
         uwyK3Hc0ZA3s8vPQKgx0x9dLim7g1Jefi5eYwN1btrbdS3rN2+jzW5EJj98KK2uD2f26
         HAaA==
X-Forwarded-Encrypted: i=1; AKwUvByWX3XP5hcVuEn8747+C9Zm4yxykn5glxKNcN5nbr+0xmL51Z5xgHoub9djzF7EH0qcm7IlOh3lbyoNYVTqEq5B@lists.infradead.org
X-Gm-Message-State: AFuF++nX5xhnRXcmv2MVm8en4O13GG97QZgBRU57HP+FGiDYcuXK3F2i
	rS/MSrWyfv8zYFRCy7qbYO7AP/6cIrHj7IbromaZLNzBKRxxGUtPOekvFSP28aPj/A4mUwDLXsr
	RctVWIf1x8eu55oUkBeX5Atuy/V2ngTY=
X-Gm-Gg: AYBFou1s0VZmF9xf6DnoBhQ6SAIl6bN0RoxkLE5Sc73iHM2rH1lEZZqXumGdks87LA4
	2hG5LpDq3CVZlwHwu8PMlEyIqTuHkl3B/U5Kye4dir6UugYU0V4/8OL6AuWz5wY4Q9lQ7dPzD7r
	o9fkplxbQDef7c1loqt4dErvlWeQNmY8tF3Qvz9axGMb3oml/soRUYTLfT80j6uocB1QTLTcXjz
	tdDn+/ebNHZ3iPTe5Pzu3GNmsIae9e1P9u6XEEg924cGJLX+H3wy+LFm9gta6B4xygsamkFUBSg
	CyPxn5vLdz7X4UaQs1w6zcR7iLzDBTW9X5djwTK+DX86gdPxEwiGh7jWbQ==
X-Received: by 2002:a17:906:7954:b0:c24:b11a:470f with SMTP id
 a640c23a62f3a-c29b7ff89aemr908365266b.0.1789472574755; Tue, 15 Sep 2026
 04:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260913185849.907479-10-coiaprant@gmail.com> <178941749179.22033.3182687831989800376@kernel.org>
In-Reply-To: <178941749179.22033.3182687831989800376@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 19:42:42 +0800
X-Gm-Features: AcwNN1XJ2v3mnflu7VzToAP_PI-o155G_VpQm1Am3WUv52DDebpEcVrTsTiWOeY
Message-ID: <CALj3r0giNFp6CLWW0dAXu=iSkNm2rYZb4=KUfnAbPaFDeYSUPw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 09/11] net: stmmac: dwmac-rk: add SGMII
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
	linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_044257_244395_23A7B05E 
X-CRM114-Status: GOOD (  40.24  )
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

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8815=E6=97=A5=
=E5=91=A8=E4=BA=8C 04:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 (1) =C2=B7 Low: 3
>
> - [Medium] DWMAC_ROCKCHIP gains an unconditional `select
>   PCS_XPCS_ROCKCHIP` without inheriting the selected symbol's=E2=80=A6
> - [Medium] For SGMII the driver removes every speed-dependent clock
>   programming path (rk_gmac_probe() sets plat_dat->set_clk_tx_rate =3D=E2=
=80=A6
> - [Low] rk_get_interfaces() (dwmac-rk.c:1570-1571) now sets
>   PHY_INTERFACE_MODE_SGMII in phylink's supported_interfaces for every=E2=
=80=A6
> - [Low] The RK3568 XPCS SoC node added by the series ('arm64: dts:
>   rockchip: rk3568: add XPCS and fixed-clock nodes') omits properties=E2=
=80=A6
> - [Low] rk_select_pcs() (dwmac-rk.c:1268-1275) ignores its `interface`
>   argument and returns the SGMII XPCS for every interface mode,=E2=80=A6
>
> Pre-existing issues:
> - [Medium] DISCARDED (valid but pre-existing and below the reporting
>   threshold for pre-existing defects).
>
> --
>
> net: stmmac: dwmac-rk: add SGMII support for RK3568
>
> Adds a set_to_sgmii()/set_to_rmii() pair for rk3568 to program GRF bit 7,
> wires up pcs_init/pcs_exit/select_pcs so the Rockchip XPCS is used as the
> PCS, and reorders rk_gmac_powerup() so the clocks are enabled before the
> interface-specific configuration.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 386)
>
> A few questions below.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/=
ethernet/stmicro/stmmac/Kconfig
> > index ab3c4cf964239..c6559e749c0ce 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -170,6 +170,7 @@ config DWMAC_ROCKCHIP
> >       default ARCH_ROCKCHIP
> >       depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> >       select MFD_SYSCON
> > +     select PCS_XPCS_ROCKCHIP
>
> [Severity: Medium]
> Does this select produce unmet dependency warnings?  PCS_XPCS_ROCKCHIP in
> drivers/net/pcs/Kconfig carries three dependency lines:
>
>   config PCS_XPCS_ROCKCHIP
>         tristate "Rockchip XPCS controller support"
>         default ARCH_ROCKCHIP
>         depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>         depends on GENERIC_PHY || COMPILE_TEST
>         depends on PM_GENERIC_DOMAINS || COMPILE_TEST
>
> while DWMAC_ROCKCHIP only has "depends on OF && (ARCH_ROCKCHIP ||
> COMPILE_TEST)".  ARCH_ROCKCHIP in arch/arm64/Kconfig.platforms selects PM
> but neither GENERIC_PHY nor PM_GENERIC_DOMAINS, so a config with
> ARCH_ROCKCHIP=3Dy, COMPILE_TEST=3Dn and GENERIC_PHY=3Dn (or PM_GENERIC_DO=
MAINS=3Dn)
> force-enables PCS_XPCS_ROCKCHIP with its own depends unsatisfied:
>
>   WARNING: unmet direct dependencies detected for PCS_XPCS_ROCKCHIP
>
> pcs-xpcs-rk.o is then built against the phy stubs where devm_phy_get()
> returns ERR_PTR(-ENOSYS), so the probe cannot succeed.
>
> The select is also unconditional, so every Rockchip dwmac build
> (RK3288/RK3328/RK3399/RK3588 ...) force-enables the RK356x-only XPCS
> driver.  Would inheriting the constraints, or making the selection
> conditional, be preferable here?  Note that simply adding the two depends
> lines to DWMAC_ROCKCHIP would turn off Ethernet on existing RK3288/RK3399
> configurations, so the choice probably needs to be explicit.
>
> The Kconfig change is also not mentioned anywhere in the commit message.

You're right. I'll move the dependencies into PCS_XPCS_ROCKCHIP as
selects instead of depends on:

    config PCS_XPCS_ROCKCHIP
        tristate "Rockchip XPCS controller support"
        default ARCH_ROCKCHIP
        depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
        select GENERIC_PHY
        select PM_GENERIC_DOMAINS

This way the symbol pulls in its own dependencies when it is selected
by DWMAC_ROCKCHIP, so the unconditional select in dwmac-rk does not
produce an unmet-dependency warning.

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 8d7042e689261..5d501ed8d1429 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>
> [ ... ]
>
> > @@ -1208,6 +1237,43 @@ static void rk_phy_powerdown(struct rk_priv_data=
 *bsp_priv)
> > +static struct phylink_pcs *rk_select_pcs(struct stmmac_priv *priv,
> > +                                      phy_interface_t interface)
> > +{
> > +     if (!priv->hw->xpcs)
> > +             return NULL;
> > +
> > +     return xpcs_to_phylink_pcs(priv->hw->xpcs);
> > +}
>
> [Severity: Low]
> Should rk_select_pcs() look at its interface argument?  The mac_select_pc=
s
> contract in include/linux/phylink.h is to return the PCS for the specifie=
d
> interface, or NULL when none is required, but this returns the SGMII XPCS
> for any mode.
>
> On an RK3568 port probed as SGMII, rk_get_interfaces() also advertises th=
e
> RGMII variants and RMII, and xpcs->pcs.supported_interfaces is non-empty
> (filled in by xpcs_get_interfaces()).  When phylink validates one of thos=
e
> non-SGMII interfaces, phylink_validate_mac_and_pcs() hits:
>
>         if (!phy_interface_empty(pcs->supported_interfaces) &&
>             !test_bit(state->interface, pcs->supported_interfaces)) {
>                 phylink_err(pl, "MAC returned PCS which does not support =
%s\n",
>                             phy_modes(state->interface));
>                 return -EINVAL;
>         }
>
> Would returning the XPCS only for PHY_INTERFACE_MODE_SGMII and NULL
> otherwise avoid that error path?

plat_dat->select_pcs is only assigned inside the
if (phy_interface =3D=3D PHY_INTERFACE_MODE_SGMII) branch of
rk_gmac_probe(). For RGMII/RMII ports the callback is NULL, so
stmmac_mac_select_pcs() returns NULL before reaching rk_select_pcs().

On an SGMII port, phylink_validate() is called with
state->interface =3D PHY_INTERFACE_MODE_SGMII, so only SGMII is
validated against the PCS. The RGMII/RMII bits in supported_interfaces
are not iterated in this path.

> > @@ -1379,16 +1450,19 @@ static int rk_gmac_powerup(struct rk_priv_data =
*bsp_priv)
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D gmac_clk_enable(bsp_priv, true);
> > +     if (ret)
> > +             return ret;
> > +
> [Severity: Medium]
> This isn't a bug introduced by this patch, but now that gmac_clk_enable()
> is the first resource acquisition in rk_gmac_powerup(), its partial-failu=
re
> path becomes more visible.  Do the bulk clocks leak when the clk_phy enab=
le
> fails?
>
> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:gmac_clk_enable() {
>         ...
>                 ret =3D clk_bulk_prepare_enable(bsp_priv->num_clks,
>                                               bsp_priv->clks);
>                 if (ret)
>                         return ret;
>
>                 ret =3D clk_prepare_enable(bsp_priv->clk_phy);
>                 if (ret)
>                         return ret;
>         ...
> }
>
> The second failure returns without calling clk_bulk_disable_unprepare() a=
nd
> without setting bsp_priv->clk_enabled, so the later gmac_clk_enable(bsp_p=
riv,
> false) in rk_gmac_powerdown() and at the new clk_disable label is a no-op
> because it is gated on clk_enabled.  This only triggers for integrated-PH=
Y
> setups where clk_phy is non-NULL.

This is pre-existing and unrelated to SGMII.

> > +     if (bsp_priv->phy_iface =3D=3D PHY_INTERFACE_MODE_SGMII)
> > +             goto set_mode;
> > +
> >       ret =3D rk_get_phy_intf_sel(bsp_priv->phy_iface);
> >       if (ret < 0)
> > -             return ret;
> > +             goto clk_disable;
>
> [ ... ]
>
> > @@ -1486,6 +1566,9 @@ static void rk_get_interfaces(struct stmmac_priv =
*priv, void *bsp_priv,
> >
> >       if (rk->supports_rmii)
> >               __set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
> > +
> > +     if (rk->supports_sgmii)
> > +             __set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
> >  }
> [Severity: Low]
> Is SGMII safe to advertise on a port that was not probed as SGMII?
> rk3568_ops populates set_to_sgmii unconditionally, and rk_gmac_setup()
> derives supports_sgmii from it, so every RK3568 port now advertises SGMII
> in phylink's supported_interfaces (stmmac_phy_setup() copies the
> get_interfaces() output verbatim into config->supported_interfaces).
>
> All the SGMII setup, though, is keyed off the probe-time DT phy-mode:
>
>   - rk_gmac_powerup() writes RK3568_GMAC_MODE_SGMII_QSGMII only in the
>     "case PHY_INTERFACE_MODE_SGMII:" branch, which runs once at init
>   - rk_gmac_probe() installs pcs_init/pcs_exit/select_pcs,
>     default_an_inband and clears set_clk_tx_rate only under
>     "if (plat_dat->phy_interface =3D=3D PHY_INTERFACE_MODE_SGMII)"
>
> So on a port probed as rgmii*/rmii, if phylink later selects SGMII (SFP
> cage, or a PHY reporting SGMII as its host interface), GRF bit 7 stays
> cleared by rk3568_set_to_rgmii()/rk3568_set_to_rmii(), plat->select_pcs i=
s
> NULL so stmmac_mac_select_pcs() returns NULL and there is no PCS to run
> autonegotiation.  Before this patch SGMII was not in supported_interfaces
> and such a configuration was rejected during validation.  Would gating th=
e
> __set_bit() on the probe-time interface be closer to what the hardware ca=
n
> actually do?

phylink_create() receives the DT phy-mode as iface, and
phylink_validate() validates that fixed interface, not every bit in
supported_interfaces. The GRF is programmed from bsp_priv->phy_iface
in rk_gmac_powerup(), which is also the DT phy-mode. Advertising SGMII
in supported_interfaces does not change the interface mode at runtime.

> > @@ -1602,6 +1685,17 @@ static int rk_gmac_probe(struct platform_device =
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
> [Severity: Medium]
> The commit message says:
>
>   "Enable default_an_inband for SGMII and disable the generic stmmac
>    set_clk_tx_rate callback.  This forces phylink to use in-band mode,
>    where the PCS is responsible for speed/duplex negotiation."
>
> Is "forces" accurate?  default_an_inband is only a default, and the next
> paragraph of the message says so itself.  In phylink_parse_mode():
>
>         if (pl->config->default_an_inband)
>                 pl->cfg_link_an_mode =3D MLO_AN_INBAND;
>
>         dn =3D fwnode_get_named_child_node(fwnode, "fixed-link");
>         if (dn || fwnode_property_present(fwnode, "fixed-link"))
>                 pl->cfg_link_an_mode =3D MLO_AN_FIXED;
>
> and xpcs_inband_caps() advertises out-of-band as acceptable:
>
>         case DW_AN_C37_SGMII:
>         case DW_AN_C37_1000BASEX:
>                 return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
>
> so phylink_pcs_neg_mode() can settle on PHYLINK_PCS_NEG_OUTBAND for a
> fixed-link node or a PHY without in-band support.  With set_clk_tx_rate s=
et
> to NULL, rk3568_ops.set_speed =3D rk_set_clk_mac_speed also becomes
> unreachable, so a 10/100 Mbps link is brought up with the clocking left a=
t
> the 1 Gbps setting and nothing warns or fails.  Would rejecting a
> non-inband neg_mode (for example in mac_config or pcs_validate), or faili=
ng
> probe when a fixed-link node is present for SGMII, match what the message
> describes?

The v5 commit message already notes that default_an_inband can be
overridden by a fixed-link node, and that out-of-band SGMII is not
supported by this driver.

> One more observation on the series rather than on this patch: the new
> binding Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.ya=
ml
> lists phys and phy-names in its unconditional required list, but the
> ethernet-pcs@fda00000 node added to arch/arm64/boot/dts/rockchip/rk3568.d=
tsi
> supplies only reg, clocks, clock-names and power-domains.  Only
> rk3568-photonicat.dts adds them:
>
>   &xpcs {
>         phys =3D <&combphy2 PHY_TYPE_SGMII>;
>         phy-names =3D "serdes";
>         status =3D "okay";
>   };
>
> [Severity: Low]
> Does dtbs_check report "phys is a required property" for the other RK3568
> board DTBs?  dtschema validates nodes regardless of status =3D "disabled"=
.
> The neighbouring sata0 node in the same dtsi does carry phys/phy-names at
> SoC level, so would moving them into rk3568.dtsi be an option?

As replied earlier, the SerDes connection is board-specific and cannot
move into the SoC dtsi. dtbs_check skips required-property validation
for status =3D "disabled" nodes.

