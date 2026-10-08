Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6445ECA6011
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 17:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0EBynkMV9re2bWQbZpZelU+r1oieiYYosFapqOHGVk=; b=cPyjmxZy+9t36ce2IBVETn/wGD
	iY+Uit9sdye3eVpb0Ldrie2nYDkjC9iPOHA9f/KJ70F0/TJUEf7SYrhKhxAVJ2KrHJ5JMXpOr5HKP
	9S47Jl2mLdhTFzZ04D8BoNUX5frnsGKl/KRBkODTqhwkYCq2B9u50KRLOj9IEm/cnbXrGw4DWKDB2
	5P2sgQJVgR+Cwt7NWV1Oc1M5AFfPuIiTH/dYZh3RKRmy16G7YEUzWq8mYuI+XLiguvMo/8rxFLRC4
	Pn9HPsu09fgz40FLfVX8H1UgF3/mr4fMjImlGIN5oCIR25ELa505mCu9id7PcPDWIft1H8liUFo20
	vQbYhz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErpc-00000004m4e-0U1P;
	Thu, 08 Oct 2026 17:23:00 +0000
Received: from mail-ej2-x0b.google.com ([2a00:1450:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErpZ-00000004m3P-0NKe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 17:22:58 +0000
Received: by mail-ej2-x0b.google.com with SMTP id a640c23a62f3a-c2e25574351so326308866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 10:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791480175; cv=none;
        d=google.com; s=arc-20260327;
        b=b3tkoS0R6Omr3/Yo+MgOKnQBx+JBalaHlgLxvZsyZIXno3MEqhJdr495UPmhNDJ63d
         GhMLY6C7Qgu6XfoL83Qas5kWRcAuPwpS3PvqlE/HnJUnw7ksFgXp5HROARyY+BaX50UZ
         Wm/sgsXGAMBk/YM/pdSOC+mc36qLPLJ16cy55eeej+USJxICzESyCph9/KMWvSxcrLiS
         9Mh4/mNfOKuOLLB2XHsDBOaHsncHlnDPsivo2uNJdFAP8akBCtAl45TKGeNK3VUdOHgt
         S4qXF6/bp/2KI1Q3SKu79pATrPPd3YiGw+w4GAgqJlJS6SdS1izLsikmLQwS4FLlL3ai
         Nkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p0EBynkMV9re2bWQbZpZelU+r1oieiYYosFapqOHGVk=;
        fh=OvVkelq9dF1HtfplQjKW6fxzuzUisRx7B7tjVi6R+sQ=;
        b=DniJW5nrpo71fJxk+n6IsxZ1EnRlYI919v0sMHOx6IP6h+mQyxYr/joWWkMhTu+N61
         LALxLrJ2jUyKE0+m41/eJLOKg5P32DI4v7uuSC0u7sVtc9Em9nf0h/rcufgAp4T0zE3k
         vx1wrjsPR6PMudNOi40eai8n/ae0w2SGHt+W93K3xDf+Ljqg9fxSNkTUdjTtejnMR+eD
         BfJxpd0d2RshY0J5u2kcnusA7m4zMp9gAipy5f3w1jH+RgtyKSxzNWlZDUf1iMOg78Et
         cg9Kf22jp1SNxcYAXn5OuHoNOi7kXqG2hzvR8jJ5fGUg2SfXj91GJxKIovEl36bYJTru
         Ss/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791480175; x=1792084975; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0EBynkMV9re2bWQbZpZelU+r1oieiYYosFapqOHGVk=;
        b=PS/uAZoQESDpJhlJK4sqgjXx/YtrrI2emlXIXPcFHa4pNXCd99sSh9vjYzCUagm1G0
         fLBEWC3rHLUkgKHlphjPceJye4gTVDdvWYwmZLmm8GS06NLAPd833IwouTE3H9mnaoUQ
         ANBnBi8NK9moYP+rnNPXQA00FZOTnIOCWW5CKfcgBCRyboJNlkrHcflsfLs/gSaEpu5p
         ZCtp1CnSqt1jZ3uMT+7Y1UCHSTLEcmLKp86DeypZxXmj5wnIS4/vtLuV3rOfJ8Z3dARO
         WNfnr6+UXwP2R7/NShwPH3l0HWVIjKDC+I68JFWvUmJ7fZPOil88wPJ3r3WxWQqBpJe5
         ehlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480175; x=1792084975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0EBynkMV9re2bWQbZpZelU+r1oieiYYosFapqOHGVk=;
        b=WBGEYQ0avg4+bMZVSuZwqDTlL7oa6wO4aQGHg6J+1lrU3mZmUcw248PrDPevoZUH2l
         65oi2wIl4TKPZRwa29gHq8nxsvAPwa25DhzdDUOTBJN3j/fmAilTsE5jH11Ig0MGGJ0x
         At/b4eKYOcdtbVeZRsAKB0A67DIoIvZehtU53WQzYkUTV95I0pI7pnW2nQPoeVKsFR8i
         M0J2dfUxi3V34odauPwZUDchlucjE4a7LZpg4plNBYsAbXB1pLg9nR1P87Hdp63QNtjh
         fA/lQtx/NTRxudQ7Uan/NU2o0rvKX4A0iD55ThAnBYudWb5RSQZuj7pJATz00V/lCpAZ
         G0Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwmEjWh8bP6TweKt7XJwBXroF09p7SGZ6NhulQFtHF5ZKQBOyy3OnRum8S9aEqavda9QYn7NuHwIb0as8R4maG1@lists.infradead.org
X-Gm-Message-State: AFuF++meKls2tgngdFfDqi2xNek1yNASzek195rp3l7FJCETGo4YLUIC
	NySHHwii78M2xNAMvhM5B6e+SWmPaKjTJM8gNo9roheqUOgZQAF2YTJJOwlmv0KtYICp7l9xzvX
	MoFHmUzugV6BD5QcISM1C69ROezp5pks=
X-Gm-Gg: AYBFou1UlL/uIZ+ZtjcGFx/Ib9Q3mwSt6OiMwuWgxY1yApTdKK/Bw/NfzNHWX9Eu6Dt
	32j3Yj9AOmr6MdovvZDpqcc9gF/wZsbrWbCpinDnKhnIothglm+Q8SQKFHl+7CLA3cLB9JIrCto
	f7bd5unwa+szPvL36Eg6AvIudhUUSA3DGRs99CurzF+cyQmKsbkG+KHIAg/hPtOEFBrdccKBeNw
	lnH3AVN5Y3t9kOUh/O7aSaP9AIKSvozlXsMP+e7SEG2PaMozYLWcdOw6fyp+OvbEW7Vk+KzWbWA
	xsIYv5FLCDKPj2cYLbOF0BKWGU+BwF+Mp9YZc2uUPPmqMKKw/qyqQPcmmg==
X-Received: by 2002:a17:907:6eab:b0:c2a:fcb7:62f2 with SMTP id
 a640c23a62f3a-c317bdee527mr644738666b.19.1791480174426; Thu, 08 Oct 2026
 10:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261005223011.1124347-6-coiaprant@gmail.com> <179147717619.434549.6837184634225737346@kernel.org>
In-Reply-To: <179147717619.434549.6837184634225737346@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 9 Oct 2026 01:22:41 +0800
X-Gm-Features: AclHuK_-hedDg8zCqAPrYyf_XLOD6FRv2_L3UganQGVdJ3Cn6nu0L2YERFkLqUA
Message-ID: <CALj3r0hnXMqLihuZ5fe65Z=g_jz5FHVf_GMhRGpTfSWYW7JoYA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 5/6] net: stmmac: dwmac-rk: add SGMII support
 for RK3568
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, maxime.chevallier@bootlin.com, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, david.wu@rock-chips.com, 
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_102257_182695_B7AA9D35 
X-CRM114-Status: GOOD (  47.95  )
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

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=889=E6=97=A5=
=E5=91=A8=E4=BA=94 00:32=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 3 (2) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] SGMII cannot work at all, and the XPCS leaks on every probe.
> - [Medium] With phy-mode=3D"sgmii", rk_gmac_probe() clears
>   plat_dat->set_clk_tx_rate and sets default_an_inband=3Dtrue, but that=
=E2=80=A6
> - [Medium] The commit message's account of in-band vs out-of-band SGMII
>   is wrong in three ways.
> - [Medium] xpcs_rk_create(), which the new rk_pcs_init() calls, assumes
>   that 'supplier->links.status =3D=3D DL_DEV_DRIVER_BOUND' right after=E2=
=80=A6
>
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but
>   rk_gmac_exit() assumes driver data already exists.
> - [Medium] This problem wasn't introduced by this patch, but
>   rk_gmac_resume() ignores the return value of rk_gmac_powerup() and=E2=
=80=A6
>
> --
>
> net: stmmac: dwmac-rk: add SGMII support for RK3568
>
> This patch adds RK3568 SGMII support to dwmac-rk. It adds a set_to_sgmii(=
)
> GRF callback, plus pcs_init/pcs_exit/select_pcs callbacks that create the
> XPCS with xpcs_rk_create(). For SGMII it also enables clocks earlier in
> rk_gmac_powerup(), sets default_an_inband and clears set_clk_tx_rate.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 386)
>
> > On RK3568, the MAC clock is fixed at 125 MHz and cannot be dynamically
> > changed by the stmmac core's set_clk_tx_rate callback.  In-band mode
> > works because the PCS handles rate adaptation internally.  Out-of-band
> > mode does not work because the MAC would need to change the clock rate
> > to 125/12.5/1.25 MHz for 1000/100/10 Mbps respectively, and the clock
> > is fixed.
>
> [Severity: Medium]
> Are these rates correct? The clk_tx_i kernel-doc in include/linux/stmmac.=
h
> says "SGMII 125MHz SerDes clock divided by 1, 5, or 50". Also,
> rgmii_clock(), which rk_set_clk_mac_speed() uses, returns
> 125/25/2.5 MHz.
>
> The reason given for in-band working and out-of-band failing also doesn't
> seem to match the code:
>
> - rk_gmac_probe() sets set_clk_tx_rate to NULL for every SGMII
>   configuration, so the MAC clock is handled the same way in both modes.
> - The XPCS is told the speed in both modes: through MAC_AUTO_SW in
>   xpcs_config_aneg_c37_sgmii() for in-band, and through a BMCR write in
>   xpcs_link_up_sgmii_1000basex() for out-of-band.
>
> > Enable default_an_inband for SGMII and disable the generic stmmac
> > set_clk_tx_rate callback.
>
> The callback that gets cleared is rk_set_clk_tx_rate(). That is the
> Rockchip-specific one, which ends up in rk_set_clk_mac_speed() on rk3568,
> not a generic stmmac callback.
>
> Could the commit message be updated on these points?

Ack, I'll fix the commit message: the rates are 125/25/2.5 MHz, and the
reason out-of-band does not work is that the driver disables
set_clk_tx_rate, so the MAC clock stays at 125 MHz. It's a driver
choice, not a hardware limitation.

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 72bdbcb5e863a..3b50ad3c600b9 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>
> [ ... ]
>
> > @@ -1211,6 +1239,43 @@ static void rk_phy_powerdown(struct rk_priv_data=
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
>
> [Severity: Medium]
> Can xpcs_rk_create() race with the XPCS driver binding? It does this:
>
> drivers/net/pcs/pcs-xpcs-rk.c:xpcs_rk_create() {
>     ...
>         link =3D device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONS=
UMER);
>     ...
>         if (READ_ONCE(link->supplier->links.status) !=3D DL_DEV_DRIVER_BO=
UND) {
>     ...
> }
>
> fw_devlink does not parse "pcs-handle", so nothing orders the supplier
> ahead of this probe. Suppose the XPCS device has no driver when
> device_link_add() runs:
>
> - The link starts in DL_STATE_DORMANT.
> - If the XPCS driver binds before the READ_ONCE() check,
>   device_links_driver_bound() moves the link to DL_STATE_AVAILABLE, not
>   DL_STATE_CONSUMER_PROBE.
> - The DL_DEV_DRIVER_BOUND check still passes.
>
> device_links_unbind_consumers() only waits for links in
> DL_STATE_CONSUMER_PROBE. Could a concurrent unbind of the XPCS driver the=
n
> free the devm-managed pxpcs and mii_bus while xpcs_create_mdiodev() is
> still using them?
>
> Also, if the stmmac probe then succeeds, wouldn't
> device_links_driver_bound() for the consumer hit
> WARN_ON(link->status !=3D DL_STATE_CONSUMER_PROBE)?
>
> > +     of_node_put(pcs_node);
> > +     if (IS_ERR(xpcs))
> > +             return PTR_ERR(xpcs);
> > +
> > +     priv->hw->xpcs =3D xpcs;
>
> [Severity: High]
> Does this XPCS pointer survive after the callback returns? On the pcs_ini=
t
> branch, stmmac_pcs_setup() never sets its local xpcs, and then writes it
> back unconditionally:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:stmmac_pcs_setup() {
>         struct dw_xpcs *xpcs =3D NULL;
>         ...
>         if (priv->plat->pcs_init) {
>                 ret =3D priv->plat->pcs_init(priv);
>         } else if (fwnode_property_present(devnode, "pcs-handle")) {
>         ...
>         priv->hw->xpcs =3D xpcs;
>
>         return 0;
> }
>
> So once rk_pcs_init() returns, priv->hw->xpcs is NULL again.
>
> In stmmac_phylink_setup(), priv->hw->xpcs and priv->hw->phylink_pcs are
> then both NULL, so the XPCS supported_interfaces are never merged.
> rk_get_interfaces() has already set the RGMII and RMII bits for rk3568,
> so PHY_INTERFACE_MODE_SGMII never ends up in supported_interfaces.
>
> With default_an_inband set, phylink_parse_mode() takes the in-band path
> and phylink_validate() fails. Doesn't that make phylink_create(), and so
> the whole probe, fail with -EINVAL on every phy-mode =3D "sgmii" board?
>
> Even if probe got past that, rk_select_pcs() would return NULL. Also,
> rk_pcs_exit() and stmmac_pcs_clean() both return early when
> priv->hw->xpcs is NULL, so xpcs_destroy() never runs. Is the dw_xpcs,
> together with its mdio_device reference and clocks, leaked on every probe
> attempt?
>
> The other pcs_init users (socfpga, rzn1, renesas) avoid this by storing
> their PCS in priv->hw->phylink_pcs.
>
> Because of this, the commit message statement that SGMII "comes from the
> XPCS's own supported_interfaces, merged by stmmac_phylink_setup()" does
> not currently hold.

Fixed by the stmmac XPCS lifetime patch in the same series, which
rewrites stmmac_pcs_setup() and no longer overwrites priv->hw->xpcs with
a local variable. Sashiko is looking at the pre-patch baseline.

> [Severity: Medium]
> default_an_inband only picks the default. Does anything stop phylink from
> running this link out-of-band?
>
> - A fixed-link node gives MLO_AN_FIXED.
> - If the PHY reports only LINK_INBAND_DISABLE: xpcs_inband_caps() returns
>   LINK_INBAND_DISABLE | LINK_INBAND_ENABLE for SGMII, so
>   phylink_pcs_neg_mode() selects PHYLINK_PCS_NEG_OUTBAND.
>
> rk_select_pcs() returns the XPCS whatever the neg_mode is. With
> set_clk_tx_rate cleared, the MAC clock stays at 125 MHz.
>
> According to the commit message, 10/100 Mbps would then have working TX
> and failing RX. The link would still be reported up, and nothing would be
> logged.
>
> Could the driver reject this or warn about it, for example by checking th=
e
> neg_mode or limiting the MAC capabilities? Right now it is only documente=
d
> in the commit message.
>
> > +             plat_dat->pcs_init =3D rk_pcs_init;
> > +             plat_dat->pcs_exit =3D rk_pcs_exit;
> > +             plat_dat->select_pcs =3D rk_select_pcs;
> > +     }
> > +
> >       plat_dat->bsp_priv =3D rk_gmac_setup(pdev, plat_dat, data);
> >       if (IS_ERR(plat_dat->bsp_priv))
> >               return PTR_ERR(plat_dat->bsp_priv);

There is no platform hook to reject a neg_mode at the MAC level today;
pcs_init/select_pcs only give us a phylink_pcs. Limiting this would
need a stmmac/phylink core change, out of scope for this series. I've
documented the limitation in the commit message.

