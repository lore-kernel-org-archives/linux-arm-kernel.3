Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B57C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6FKqhHGMKbN+g1kF5qjdCbk6ZlE4yPuWZmPTrF4npY=; b=cpxVkCXYPzYsiiShH00cCdxKLd
	asXgntCwvTzahIiucnxN4bF0VjORwiwUPKJMdYrRa8VhgUgiMG6yqEBA1UWO3fzXqLx7MV4x2UsGX
	tLhXB2TXUTsXBTg3zV0XAQOv2YsWFORjk5FJG5RhkaRtnAxiYsRE37WX89XC9Ch7BJmdy0M4KWqh3
	pLcVLLA959OZX6qTGg16yrsY8JEl1WhIRTkgs6BRNhBYDaqk1+q7ZTe1JvuupNQEWq9zar3tGgr8O
	VwKDPp51s8bodSIUiV5DI3iqYslnQW35A/oaNva2LJ9ZetnrI0oQo5h+03IF9Feg3h1CXWpyDdPqA
	zxgSXqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lsI-00000001ldg-0O5x;
	Sun, 13 Sep 2026 15:12:10 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lsE-00000001lcX-3IzO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:12:08 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c29440ee0e7so98638266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789312325; cv=none;
        d=google.com; s=arc-20260327;
        b=o58C2Bj77BsmJ7BtziU4KfYVE72PlpiF9bs23j5qgOzD3bdhbxny/uau0wGlA7e/ok
         HHtz7+oz5Z6BT/cVqXGaJoDfHOhXwa5wbLj0pokB69ttS5qxPvP4Oj/pnVlN2pVwJgcA
         5kJtMtiwUSWB8yjLHEZjJmTUxApStSfaQ6TV7C79avYeb0sTxHDDP9z1/mHDzUeWxQp7
         TDGhmUak3Vxkk0QzEBB6QS3ywekCb51zT+GNAlHeWVKo1cXp6yixso0QOBYCsQn2Mfnq
         iHkjqZ+bTbGJygcoWJyigiYE1RweJCug1BmBYYnJuNYJ/ayScPYPaKVsqQbUvJTIsO8f
         WySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i6FKqhHGMKbN+g1kF5qjdCbk6ZlE4yPuWZmPTrF4npY=;
        fh=vOiPeDI5GMdlDVyXRD7DPyyU2ZkpkaTHCgEXg6CBwxs=;
        b=mF1ppuL4O1+gr+V8zv687ODvkWLg30J0YaXXeURvi1CypKARWjFhKngoXaGokL0UaL
         dRddKEcwuyBqAUm7SZcNOr1fK4oMLiKX2RgjKrcvGDOX4y2x1lk9F4PFxh+BnsolMaOV
         6LGYNSw8us8o7JA0UIMnvUHu9xhfYN/7r4yFuo8Q8UDdgqy238SFh801qm28RT0fOs6H
         Syr1VH3WE2Fh8KZ7/sCHd5p0U7QmQEiEq72lGm8jsXcC3ALILX0o9RrBS8JMHF05y7iG
         kgcWQYWM7+3E+LFJFEUEfeB9oId90O+XshksQ3cYEx6tFwW7lFyocB4+uvwxNDUBNrSS
         ZgyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789312325; x=1789917125; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6FKqhHGMKbN+g1kF5qjdCbk6ZlE4yPuWZmPTrF4npY=;
        b=dpcKrjkdMNNvLT3rrWxIBGBb4kh7r6V+X2U/C+PYxyzxNbp3D3udRFAO7y1iD0epwu
         taPhsLW1fwMFqB94rKACZBwA+yxaYGsGX/0F/QHa+IlMdyVII0m3AlnFUDy7R3LqRLxv
         QUkxxl8u9VSKly6dZavTeARZp8AC0m70ku416Ir6WubTmWL81Ns9waVjb2jT1DUYklXW
         JsyIk6RPMyhMxrqhe4ve3kemlBbEME8DFL/ULnKQNs0qmMniDkkhqUrlIMjLVtInt77d
         bRYGuFJCF9+pPAe2sG4WVZhNgZi/463nvip+qwPbD798WBhzayh0qEW3vKtNqGJb1IZm
         c5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789312325; x=1789917125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6FKqhHGMKbN+g1kF5qjdCbk6ZlE4yPuWZmPTrF4npY=;
        b=mQFbl7/bPIz5CupyPZp07iebsep5S4Id6BEGlMP2QwbcTow/kIlV0o+e+LNkgnPllt
         QcJJ0YGJmuSk6DfEaNeNeJP18aUrC+fAdETBkHPW+ak0fAzgRKXPK+cJhvKYAMFMJZcP
         /XDDvyqFKuPLYrNQj87Z5lBSJ0m9p6jCEvDCCjS8ww8xHvHTZxaZA727wLmRFdZ/WGr7
         0KkvVQP/btIolc5NRl4m6e+ELf4CtMzL1j5IQTiitB4YUYyKWLVMeGrnAuRujk6h6GwP
         WyZLaRT1RDiKR/Ltz0kLnpYQ3mssDBM1sOtv396UGJ3u7niJcu24uiu6cdvaYMjIQtSg
         I00Q==
X-Forwarded-Encrypted: i=1; AKwUvBygpflJ+hLTtBCdQh6kcMB5SaBE/F4su+MHCRSev4NomK9bovNfibobte6GyCoK8XB+GL4yIhXNF1/UqrjhDqj2@lists.infradead.org
X-Gm-Message-State: AFuF++mgfYVt93BSamfYpSPKDR5unSyZ1vp0y81Y6hcoYOzSBS8H2ZZs
	TTbq9XCVY25wKrLULEWLoAuBqEoBLz599+gKsRURfGDIHLbXUeL8sEeMxy6OTIshlDti02lcpbG
	7jtvpU6cAjvxOhx52h0CnAK7T7kAD/8s=
X-Gm-Gg: AYBFou0D4wc7lizEZ+KMi5kGE3UGCJMvrGBsPH3pZ1ru0wuJWJxmdvNXx5JV+MPM5hR
	d6NAKiUXP/+cAiG6j4J+F9aRFG3EUsaF2kPTRdQqjtqAwbDlRwvmJqWbK51XUFcUrE14TeuHtzq
	XI6tUEStJ3tva55rQbvWXRfTcE4QgQoQ3SdP1L6Mi33a6zMarkJK+EiexOpZg+zcV6E2OW04czz
	wWs/OojetKFGr+zfDnDNMTVc7wDdBtMCjLa63DJPgNwIAPqbwHwwW2sbvXk/AtLKZgQf78RbhhW
	Jo11GhCih1NgB5nrN1mxPBUKnmQupu+Z2nRM+Qv3oHWJ6RPYYnXDEFFbfw==
X-Received: by 2002:a17:907:c48d:b0:c25:8eb7:f388 with SMTP id
 a640c23a62f3a-c2966732b44mr1279507266b.17.1789312324376; Sun, 13 Sep 2026
 08:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260907153713.2572547-5-coiaprant@gmail.com> <20260912201322.126940-1-kuba@kernel.org>
In-Reply-To: <20260912201322.126940-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:11:52 +0800
X-Gm-Features: AcwNN1XiM26q-ovJF_4CrXhU4nIDQ7WEDIwpgpUZziGAyddbfl9wQtAk49btimU
Message-ID: <CALj3r0jVNnwhT1odBn_7Fg4hqC5covyQTsw0B3wiNQhiciFTEg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 03/10] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, vkoul@kernel.org, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com, 
	hkallweit1@gmail.com, neil.armstrong@linaro.org, linux@armlinux.org.uk, 
	shawn.lin@rock-chips.com, david@ixit.cz, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_081206_922508_4F4CF838 
X-CRM114-Status: GOOD (  49.51  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:13=E5=86=99=E9=81=93=EF=BC=9A
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
>
> This adds a "rockchip,sgmii-mac-sel" DT property to the RK3568 combphy
> driver so the SGMII interface can be routed to GMAC0 or GMAC1 through the
> pipe GRF pipe_sgmii_mac_sel bit. The value defaults to 1 (GMAC1) when the
> property is absent, and is written during PHY_TYPE_SGMII configuration.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 229)
>
> A few questions below.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drive=
rs/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 7843356a4dd47..919bb97a4b182 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>
> [ ... ]
>
> > @@ -212,6 +213,7 @@ struct rockchip_combphy_priv {
> >       bool enable_ssc;
> >       bool ext_refclk;
> >       struct clk *refclk;
> > +     u32 sgmii_mac_sel;
> >  };
> >
> >  static void rockchip_combphy_updatel(struct rockchip_combphy_priv *pri=
v,
> > @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device =
*dev, struct rockchip_combphy
> >
> >       priv->ext_refclk =3D device_property_present(dev, "rockchip,ext-r=
efclk");
> >
> > +     priv->sgmii_mac_sel =3D 1;
> > +     device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sg=
mii_mac_sel);
> > +
>
> [Severity: Medium]
> Since the return value of device_property_read_u32() is discarded here,
> rockchip_combphy_parse_dt() cannot distinguish "the DT asked for GMAC1"
> from "the DT said nothing about the mux".
>
> The result is that rk3568_combphy_cfg() writes PIPE_GRF 0x0040 bit 1 on
> every PHY_TYPE_SGMII bring-up, including for device trees that do not hav=
e
> the new property. Before this patch that bit was never touched, so whatev=
er
> routing the SoC reset or the boot firmware established was left alone.
>
> The commit message states:
>
>   "The hardware reset value is GMAC1 (1). If the property is set to 0,
>   the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
>   remains at GMAC1."
>
> The "or omitted" case now depends entirely on that reset value being 1. I=
f
> the reset value is actually 0, or if firmware routed SGMII to GMAC0 on a
> board wired that way and its DT lacks the property, does phy_init() still
> return success while the XPCS ends up attached to the wrong MAC, giving a
> link that never comes up and no message explaining why?
>
> Would it make sense to only write the bit when the property is actually
> present, for example:
>
>         if (!device_property_read_u32(dev, "rockchip,sgmii-mac-sel",
>                                       &priv->sgmii_mac_sel))
>                 priv->sgmii_mac_sel_valid =3D true;
>
> so that omitting the property leaves the mux untouched?

SGMII has never been functional on RK3568 in mainline before this
series. There is no existing user that relies on the old behaviour,
and no in-tree device tree enables SGMII. Boards that have the SGMII
routing configured in their bootloader were never able to use it with
a mainline kernel, because the driver did not support it.

Given that, unconditionally writing the MAC-select bit (with a default
of GMAC1, which matches the hardware reset value) is reasonable. It
makes the driver's behaviour explicit and deterministic rather than
depending on whatever the bootloader happened to leave behind.

I'll keep the current logic, but I'll make the commit message clearer
about the hardware reset value and the fact that SGMII is new in
mainline.

> >       priv->phy_rst =3D devm_reset_control_get_exclusive(dev, "phy");
> >       /* fallback to old behaviour */
> >       if (PTR_ERR(priv->phy_rst) =3D=3D -ENOENT)
> > @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
> >               break;
> >
> >       case PHY_TYPE_SGMII:
> > +             rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_s=
gmii_mac_sel,
> > +                                     priv->sgmii_mac_sel > 0);
>
> [Severity: Low]
> The binding added in the preceding patch of this series declares the
> property as:
>
>   rockchip,sgmii-mac-sel:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     enum: [0, 1]
>     default: 1
>
> but "priv->sgmii_mac_sel > 0" collapses the value to a boolean, and
> rockchip_combphy_parse_dt() does no range check.
>
> Does that mean a device tree setting the property to 2 or 0xffffffff is
> silently treated as GMAC1 rather than rejected? Similarly, a
> present-but-malformed property (wrong length or type) makes
> device_property_read_u32() fail, and the pre-seeded default of 1 is used
> with no diagnostic.
>
> dtschema only validates in-tree device trees, so for bootloader-supplied
> DTs or overlays the driver is the only place the enum can be enforced.
> Would checking the value against {0, 1} and returning an error, or
> alternatively documenting the property as a plain flag, close that gap?

The property is validated by dtschema. For in-tree device trees, values
other than 0 or 1 are rejected at build time. I don't think the driver
needs to duplicate this check.

> [Severity: Low]
> The mux write is only added to the PHY_TYPE_SGMII case. The adjacent
> PHY_TYPE_QSGMII case in rk3568_combphy_cfg() programs the same pipe-grf
> register (pipe_xpcs_phy_ready at offset 0x0040 bit 2) but never touches
> the MAC-select bit:
>
>         case PHY_TYPE_QSGMII:
>                 rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_x=
pcs_phy_ready, true);
>                 ...
>
> The binding gates the property on the compatible only, not on the PHY
> type, and rockchip_combphy_parse_dt() runs at probe time before the PHY
> type is known from rockchip_combphy_xlate().
>
> If a device tree sets rockchip,sgmii-mac-sel on a combphy that a consumer
> later claims with PHY_TYPE_QSGMII, is the requested routing simply droppe=
d
> with no warning? If the property is meant to be SGMII-only, would
> rejecting or warning about it for other PHY types make that explicit?

You're right that the property is SGMII-only. For QSGMII, the hardware
routes to both MACs internally, so there is no MAC-selection bit to
program. We have not found any QSGMII device that exists outside of
OEM SDK EVB code, and mainline XPCS does not support QSGMII, so this
case is not currently reachable. I'll leave it as is.

> >               rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_x=
pcs_phy_ready, true);
> >               rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_ph=
ymode_sel, true);
> >               rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_se=
l_qsgmii, true);
> > @@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_=
combphy_grfcfgs =3D {
> >       .con3_for_sata          =3D { 0x000c, 15, 0, 0x00, 0x4407 },
> >       /* pipe-grf */
> >       .pipe_con0_for_sata     =3D { 0x0000, 15, 0, 0x00, 0x2220 },
> > +     .pipe_sgmii_mac_sel     =3D { 0x0040, 1, 1, 0x00, 0x01 },
> >       .pipe_xpcs_phy_ready    =3D { 0x0040, 2, 2, 0x00, 0x01 },
> >       .u3otg0_port_en         =3D { 0x0104, 15, 0, 0x0181, 0x1100 },
> >       .u3otg1_port_en         =3D { 0x0144, 15, 0, 0x0181, 0x1100 },
>
> For reference on the first two comments: this disable/enable encoding
> ({ 0x0040, 1, 1, 0x00, 0x01 }) is what maps the DT value onto GMAC0/GMAC1=
,
> and rockchip_combphy_param_write() always sets the write-enable mask:
>
>         tmp =3D en ? reg->enable : reg->disable;
>         mask =3D GENMASK(reg->bitend, reg->bitstart);
>         val =3D (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);
>
> so the bit is committed to hardware on every SGMII bring-up regardless of
> whether the device tree expressed a preference. Could the TRM bit polarit=
y
> and the claimed reset value of 1 be confirmed in the commit message?
>
> Note that no in-tree Rockchip device tree requests PHY_TYPE_SGMII before
> this series, and the only user (rk3568-photonicat.dts) is added later in
> the series, so nothing in-tree changes behaviour today.

You're right, the commit message should state this explicitly. I'll
update it to describe both the bit polarity and the hardware reset
value.

From the RK3568 TRM Part1 (Page 229), the PIPE_GRF_XPCS_CON0 register
bit 1 is pipe_sgmii_mac_sel:

    0: SGMII interface is routed to GMAC0
    1: SGMII interface is routed to GMAC1

The hardware reset value is 1 (GMAC1). This matches the default I use
when the property is absent.

I'll include this in the commit message and the binding description so
that reviewers can verify the behaviour against the TRM.

Regarding the unconditional write: as I mentioned, SGMII has never been
functional on RK3568 in mainline before this series, and no in-tree
device tree enables it. So writing the bit on every SGMII bring-up does
not change behaviour for any existing user.

Thanks,
Coia

