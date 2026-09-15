Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417F6C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDmTn3anCnjZEAou9hrMuvIHzai6E6SOKUBtirHS8WY=; b=oRsUazAI9JGPyu0AVX6LSFeyKO
	9s142AeRzr7RPfTR5E1ulnBMriLOFEH1qQv/bdt+ML01V+wF96AU6VRykaUSW/XhbGATJkWyTc/Mu
	h7gD8ZsKAOkWN6z8nCbvc8CuOyaB38VhxS0Ccj1juFYVlqVkGpPWmiHUu/WSE2F+Z43RHXX2vZyL6
	JsgvBR5gZEAPNEUwRm0LuouFY9TyYE8NEvdmRn2qp2lnuxO7tOEWwjmDNFuMvK2RKN31/cpgsSayb
	2YilVnWycXPQRAUTiukPe7VuM8tt5foGZLn7XlJ4pVx2LrvUU3NFtmMShUY1pLKNDnDh/xNNAybnx
	aHGHTImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QMp-00000005uX1-1f6A;
	Tue, 15 Sep 2026 10:26:23 +0000
Received: from mail-ed2-x01.google.com ([2a00:1450:4864:33::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QMl-00000005uVr-1n7g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:26:21 +0000
Received: by mail-ed2-x01.google.com with SMTP id 4fb4d7f45d1cf-6a5d2b3fbe8so1951750a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467977; cv=none;
        d=google.com; s=arc-20260327;
        b=IQ4uaN67/7UR0QPtoDmVtVxN4nf2JRQqDWInLoDs1C8cXZOVsF6tqpTNQN7meLIKqu
         SNU228PW8RKdgZ0UEHTSiR11MjqXm1qMvMuSDXiAqYc3mYB+QuodQtEth+ePfTWv2gos
         arx8YtezdCktz61pnrrHYRXv7TCbTk66OsqG7QBDBCbU4kYxzMAOY+t8mxUajAZICCEa
         Z0tVJiL8x5oiaH71/zyqH+DHa+0gWunV2RUM8NVNDv3Sd2VLlkQpSZ17X9UHxJR78u6H
         bhbGpYtJz/LrarI2VwLZg7l8XGVNKg5u9UiMp8JI/6jhRgihsBFYY3Lqa+QCJd+VLmTL
         UOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PDmTn3anCnjZEAou9hrMuvIHzai6E6SOKUBtirHS8WY=;
        fh=J+WXbwBX07tARYT5HzUq0FT9ncpcBw6tgQ/qRFUzqLw=;
        b=STsZras08Mo6rIJ5VQKYARrPCNZwrvQ9qXhRStF7anmYPKdGeKlll1axIaOo3Apn3Y
         d38kP2A/CitvOi3nmRBjFGPLDi5zLFA58QGRGocO0OYs/rCeGl0igF/q0x/DthsgpoPs
         PcdUkjHUkWZn3bIc497wzvuDr8EliTJqXHmJvcpTQgIclmhcKOEhPK5LeKrm0g/9Za01
         WFh2tQExv74DZFm07cksdDIVJiASnuwOUpi7gWSd3jbH2BreY2ak3teEQaQb8BlJWovn
         VOmu4MaS9RLb2FAqlruL2ctoZPA8D9jMs+ksTYKy00+RHEx44c4Hv68lRMWPS8NfnXgQ
         jYkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467977; x=1790072777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PDmTn3anCnjZEAou9hrMuvIHzai6E6SOKUBtirHS8WY=;
        b=EIAVhLgMrdW6qsTb395//4+3yPeCybPnJC1sDOJtxJYUqqd67kn9TzLPjvk9VXW5SY
         iLYlQ6lvdIuOB42iwsSUzZtdAYLx4bkJOAQGfk1+V3MmQqcopeNK0E9bTX31pt0P3IzW
         XAxdortJyb2qYDgq22h4ZBFPLT1vhi+Unv2nO6CKOt+2t72QtO6ku+VLsyJTR0KFv7NO
         vfpo7GQnb54ryo1lg1E7l7sIKhpmOyzEYMaQM1t0PmwypsUJAm+novbEx9dIVeBhqg05
         FxjKGKK0VYbGxtii1IM6s1lHExBDi4rMrSuyLm8qN6zkbHP1AnlwyztbDlaB94snsWc5
         htaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467977; x=1790072777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDmTn3anCnjZEAou9hrMuvIHzai6E6SOKUBtirHS8WY=;
        b=u52G/GOv8rhzHogYnFOBPUDI9beoPm3ns9pW89Mgsrr4+hdoaHlg+WFzl/R3YW66lu
         tPKP/njUAgB1DrZpWThUMITtfVYLauW8LZDETiUh2g03ZHOjzai2vK0qLP/uSEHtXk8i
         vK5QCAiLCd45hdRluOkAVe9HECiLde/C3mixK0ByrfSBiGykU6/Hvob/MwBVtbzsbLf1
         PBZedu4FwE/VbmmszbujNlT+v5S/fagOpMsCJay9zrxyHILVSupfkz0c2fbtm4VDbnfu
         nu3EJVFnozA0U64MAcl/Y0NxCyimMnuhKz9IC2oVMk+h+NEIswGQ8U0LwCl7EKbd51FY
         NTew==
X-Forwarded-Encrypted: i=1; AKwUvBw5OGlVVPS6theJb7vVCnycAUaS8TX+WHEZQCF5T7iNKcW9t7pE2GXMOZTCMdzbHsDgocUMLaU0cso5M3S4CVoB@lists.infradead.org
X-Gm-Message-State: AFuF++l8Q4IwYlJKkDrFgvgFe/0tQ7g2frnQoRGfcobofOuE6LIvaIAB
	3ZsiU0k3NK9pdARCeUl4fpAOlH8BevAMkfzPWrV1HKDLvF80u0BJZV0OETD7XfhnYhVuaFzJI7E
	hopW+YgmmsP3taw11kGjGvxybrR2QQvk=
X-Gm-Gg: AYBFou09gbjChCWTK2BUzcQUYvXSxN3rbXzHzRMPqXJv22iuCZAFH657lAXyYkk0ybR
	mEMGToDgHVlEsjRoDglwPKaOsh2+Nv6AERc6i8GDHscY32TfomVsxeSj8ZRW65Xo66OmS190JiL
	bjaRDZ2s+5T36ePn/gEZOyzGkbIoJFQUr+WTUPV7qIGAKDS2o8zJmW91jIVld5V85c73WH2M48v
	JGY2szVK+VzU9XrK64eoNK0XcaM1f8uwnyeOkWNU5OccQg4mTYtX25vZp0pfQmmFt9BzgJATwKy
	GStOAPeRU60uBlUy2cFALeVPu73iH71d1VPhhrPaPbkcAUg2PSBs0DNjhA==
X-Received: by 2002:a17:906:6a01:b0:c26:2205:3df8 with SMTP id
 a640c23a62f3a-c29d7717424mr36060866b.9.1789467977119; Tue, 15 Sep 2026
 03:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260913185849.907479-4-coiaprant@gmail.com> <178941747926.22033.15174869537556409251@kernel.org>
In-Reply-To: <178941747926.22033.15174869537556409251@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:26:04 +0800
X-Gm-Features: AcwNN1ULwDCN22NcSTGJGIqUo7wEAVDbHGW4RjkupXf6vRbCRoH1F1Vq6Gp7hg4
Message-ID: <CALj3r0hg6kchV72wSv0ybPVqG93D4_QnB-diFmW45jLZwoP_cA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
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
X-CRM114-CacheID: sfid-20260915_032619_533970_A6B93161 
X-CRM114-Status: GOOD (  38.11  )
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> - [Low] In rk3568_combphy_cfg() (drivers/phy/rockchip/phy-rockchip-
>   naneng-combphy.c:881-882) the newly added write of pipe_sgmii_mac_sel=
=E2=80=A6
>
> --
>
> phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
>
> This adds a "rockchip,sgmii-mac-sel" DT property to pick whether the RK35=
68
> SGMII interface is routed to GMAC0 or GMAC1 via PIPE_GRF_XPCS_CON0 bit 1.
> The value is read in rockchip_combphy_parse_dt() and programmed from the
> PHY_TYPE_SGMII branch of rk3568_combphy_cfg().
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 229)
>
> One question about the commit message wording:
>
>     The hardware reset value is 1 (GMAC1). If the property is set to 0,
>     the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
>     remains at GMAC1.
>
> Does "or omitted ... it remains at GMAC1" match the code?  The write in
> rk3568_combphy_cfg() is unconditional, so in the omitted case the driver
> does not leave the bit alone, it actively programs it to 1.  See the
> inline comment below.
>
> > diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drive=
rs/phy/rockchip/phy-rockchip-naneng-combphy.c
> > index 7843356a4dd47..7b867e7520064 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>
> [ ... ]
>
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
> [Severity: Low]
> Since device_property_read_u32() leaves the output untouched on failure,
> rockchip_combphy_parse_dt() ends up with priv->sgmii_mac_sel =3D=3D 1 bot=
h when
> the property says 1 and when the property is absent.  Is there a way for =
the
> driver to express "leave the bit as firmware left it"?
>
> Before this patch the kernel never touched PIPE_GRF_XPCS_CON0 bit 1, so a
> board whose bootloader routed SGMII to GMAC0 kept that routing.  With thi=
s
> change, a DT that instantiates the combphy as PHY_TYPE_SGMII but does not
> carry the new property has the bit re-programmed to GMAC1 on every
> phy_init().  Can that break such a board's SGMII link?
>
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
> > +                                          priv->sgmii_mac_sel > 0);

The hardware reset value of PIPE_GRF_XPCS_CON0 bit 1 is 1 (GMAC1),
so programming it to 1 when the property is absent produces the same
result as leaving it alone =E2=80=94 the bit is already 1 after reset. The
"remains at GMAC1" wording in the commit message reflects that.

SGMII has never been functional on RK3568 in mainline before this
series, so there is no existing in-tree or out-of-tree board whose
SGMII link could be broken by this. A board whose firmware happened to
route the bit to GMAC0 still cannot use SGMII with a mainline kernel
before this series, and will need the new property to describe that
routing once it can.

> [Severity: Low]
> This write always happens, including in the "property omitted" case, and
> rockchip_combphy_param_write() sets the write-enable mask along with the
> value:
>
>         tmp =3D en ? reg->enable : reg->disable;
>         mask =3D GENMASK(reg->bitend, reg->bitstart);
>         val =3D (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);
>
>         return regmap_write(base, reg->offset, val);
>
> so with priv->sgmii_mac_sel defaulting to 1 the register gets
> (0x1 << 1) | (GENMASK(1, 1) << 16), i.e. GMAC1 is forced.  Would it be
> better to only issue this write when the property is actually present?
>
> A second question: bit 1 of PIPE_GRF_XPCS_CON0 is a single SoC-wide mux,
> while the property sits on a per-PHY node.  If two combphy instances that
> share the same rockchip,pipe-grf syscon are both brought up as
> PHY_TYPE_SGMII with different property values, the last phy_init() wins a=
nd
> nothing is reported.  Should conflicting values be rejected or at least
> warned about?
>
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
>
> For what it is worth, the only in-tree SGMII consumer at the end of this
> series, rk3568-photonicat.dts, sets rockchip,sgmii-mac-sel =3D <0>
> explicitly, so no upstream DT changes behaviour today; the concern is abo=
ut
> out-of-tree or ported device trees and about the commit message wording.

There is no in-tree case where two combphy instances are both brought
up as PHY_TYPE_SGMII with different values. This is a single SoC-wide
mux and only one SGMII link exists on RK3568, so the situation cannot
arise on real hardware. I'll leave it as is.

