Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D2BC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7mBcc/zD+gqhLUWIiGJPhvEmDVUp2BOJbW6rUgXDAE=; b=F1DDchZZWp9g0R0D2JjI4F2HPP
	6BVnnRKOA5COPpfdiL8kC4sdy8LppxBmB24hqN/E8XLbJi0V6iezFo3N32VJDPCf0zhxd1z0GDtd7
	ugwzjxncH35da5+5QlN4y9wvc9M4OmXm0K6jzjaQIjIsFl/RaqjW0lpRMPtdFgq0g2S0cjBrKpZgB
	5rcKWWzgzMgSxeUe40qcDWacXYPdTekkwwOfL3K8T7PKdqbluq4N8kXKrPOXOT4wIvZztx/YcRDLw
	eSyLDZV4l0dXZJbPOfNBRccvK0HvDQ/up5iijLVv5rAZnh7IRxAs8zWo+qIBaOVimAKQGoZKi/kDM
	V1RIw9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IJj-0000000COQJ-21xB;
	Thu, 17 Sep 2026 20:02:47 +0000
Received: from mail-ej2-x0b.google.com ([2a00:1450:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IJg-0000000COPO-3XA0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:02:46 +0000
Received: by mail-ej2-x0b.google.com with SMTP id a640c23a62f3a-c25541acec6so649466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789675363; cv=none;
        d=google.com; s=arc-20260327;
        b=m+ZhRrYeP62akT23ThJvI19p2frlNvG+LfHAFHD+ZaZ6KHxWGwbVWRsFyK/A9aYjrx
         7Zqsmfq5BysRKnHCyiWxnLZBZzjDC+9lrw6d3yPrispUKaj2jwwkmkEOQHoHgd/P5eo8
         57O5BHs8AxAdQvLuuwuCC65h9HgeWffuDE9/30KtXByG8XP7whxzzpifzFUQwZ38Heng
         1I40ZfMYJvS0GtOz0zvkl2WbAiYxyOJxK5mVwx1kQOslQXhIeOTJ2q49p9K7Mw8ARNzW
         fM5BwbOOm2hsW+iQREWlGTpMM6alwr8xVNdK5VGu6lIInBmQwTTBsxesZ4FOL+CFrEWc
         ygqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7mBcc/zD+gqhLUWIiGJPhvEmDVUp2BOJbW6rUgXDAE=;
        fh=gmPu0Nm+T2qUguaVE2xQhn/sXCUXaHiPTtTFe7Kassk=;
        b=RzwTfRDEeU/4m9iMm5PWv+5HL3YWMZH0ItDtpUNJCVJFuFju9cgbK0TEQMOpYVAXNV
         U6WWU81KiN0nQ8j6bF2w+LviM41RTf1pNTzdeXRPb4dTq/ca3zjdloXtkkXAlpcyqzIk
         NXVhCzlvyt5PRhqEeqTTe5Gqn/TP+Cr5gu/EoPzXhUIMW2YNx8KW/3Tek1wLKQrTFHTm
         bTw+7XCqKqKSt1R0uJwyiXTzCOOm4G5z2W1rkLp/K6/x8veQTog53bdWMnkJZ4X7bMCK
         pBU7ZAqTW/bfmrQU7U7XTTZ6s610SQ24yWvQ3MLSEsUc/9cQDZBZSUSPRU0UFl3uxvfb
         U0zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675363; x=1790280163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7mBcc/zD+gqhLUWIiGJPhvEmDVUp2BOJbW6rUgXDAE=;
        b=gzDjG3Vo047VZMqW9aNBjedhF9qqqhVZ4wg8TWutMXiVaSrZZF3nEnncP9VgWpmpFE
         sYszfmG+MyTjb/lBTAWV2XtMYJ5TvYXOulh10hz0L9rcLyBmHkYhXnAaD49xFuiPfTcO
         j0nY30YVEnRO/PyhC9M1uQoyLzci2Yux2aMoVKlM6pDI1Cj2/dl37mmmLBj1k3EEdKA5
         +lCAHXyVNNfWHzcyQigX1aBCZ7uCa02vVFTAKA2mo8CSqzRukvf1sermKkAd60XkyE/F
         PTw8TpLF0kLfBSyCrMHROcyZCwmCaSIHBZ3cJgBeDymo7bpAsXAyQ0gK8uxRkDCnBh9j
         1Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675363; x=1790280163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7mBcc/zD+gqhLUWIiGJPhvEmDVUp2BOJbW6rUgXDAE=;
        b=yetJ92R2frQ6J81gfAE/mBY+ES+k4xB9O5ogmI1vU9R8x3gnOMIbVPbgztbl+zy6IJ
         Q7tBt2Gct7BsvcLtx6bOrkqoHUBGaRdRqBzSy5SRKNDjY3k9mD3x9wjrFKtRIrrB2emv
         VcoFnx18i5RQJKbXBcH9Y6Xl7Z7Hp4uZK/C/TCxywgxqEeIVG0pZXOTLyi5NDARwFZny
         4jIHf4G1nEkhKm/sKatVPQGb39PREwuqyufsgRw8RtB0CRsXkBe6ljUtnoQyc0BtWC0W
         zZEtDbksIwt6K9KCxjpXw4lGwi2N6qYLEBWUiu51TrcWFV/D40k8KebpUTy3krg6bbSA
         fpbg==
X-Forwarded-Encrypted: i=1; AKwUvByNkX6yFSxmlGlmJhwx16F3SF+2ybcBpRGUuttqGpRVIzquAxTDTmPkXWT/gczj8qS57Wm1ldn3tnwa8ksz69Ir@lists.infradead.org
X-Gm-Message-State: AFuF++kRWZ5cx9izOp62812hpAtFtnTA3KlUrw+wBpSH/D5pLNcHR0nZ
	bt0TkVQ5CR9T1RHNe3/kcbg6T27J8lUAf6ttLYCsILrgqpo+7yzCGd8m6pVVjGkWEFRqJWBVRTk
	jWFkKX4C/NeB7y+M4UaPvdrHR4kOo5io=
X-Gm-Gg: AYBFou0/ipcWw6Z6xOMJeIY8OUDUg0HuyKKr295uN5asPWpmx2e5SpEh3IlbnD0mQkk
	XOAehhU+yFbHW949igBP92Y91hFIYporBFFTHMWjwWdGLH64AckgoadPHHdshwTmM40mSD8u41V
	d/Vt7A1NhEp9LSK6IjU5uEidn0NbDAtSndHHdyLFEmcVm4RgjLsGqqLnhD2YhfQ10QsysNvBZfj
	iariL7Kc9Wta5jb9DOjGjfiJBGbvxMS3P0dP1Jg8IfluPHUpuJXS1m1fyZ/cQ7uex79IcxeiC4T
	uyTqxIWU6QIS9XnKnuHzD6cF5+QlVvJkt5WH1JOJqMt9RNvztGBIodHoxw==
X-Received: by 2002:a17:907:3ea5:b0:c29:4204:8dbf with SMTP id
 a640c23a62f3a-c2a157be91fmr24595366b.7.1789675362739; Thu, 17 Sep 2026
 13:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260915123802.1561724-4-coiaprant@gmail.com> <178967028966.22033.2377561177851606071@kernel.org>
In-Reply-To: <178967028966.22033.2377561177851606071@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 18 Sep 2026 04:02:31 +0800
X-Gm-Features: AcwNN1V0XFtsL3x8UawoWV106fmNQdao8d4jMazcuCe1sSda_ba5TrpA_lpwoh4
Message-ID: <CALj3r0jGVO_bDDkf1ts8ajtsRf8Tq--TG=Hfb4m8B5bbNLryqQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 03/11] phy: rockchip: naneng-combphy: add
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
X-CRM114-CacheID: sfid-20260917_130244_908359_DB02C4EE 
X-CRM114-Status: GOOD (  25.42  )
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

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8818=E6=97=A5=
=E5=91=A8=E4=BA=94 02:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> - [Low] drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:380-381 reads
>   'rockchip,sgmii-mac-sel' with device_property_read_u32() for every=E2=
=80=A6
>
> --
>
> phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
>
> This adds a "rockchip,sgmii-mac-sel" DT property so the RK3568 SGMII
> interface can be routed to GMAC0 or GMAC1 via the PIPE_GRF_XPCS_CON0
> pipe_sgmii_mac_sel bit, defaulting to GMAC1 to match the hardware reset
> value.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 229)
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
> This isn't a bug for any schema-checked device tree, but would it be wort=
h
> reacting to the return value here?
>
> The binding restricts the property to two values and to one compatible:
>
>   rockchip,sgmii-mac-sel:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     enum: [0, 1]
>     default: 1
>
>   ...
>         rockchip,sgmii-mac-sel: true
>     else:
>       properties:
>         rockchip,sgmii-mac-sel: false
>
> In rockchip_combphy_parse_dt() the result of device_property_read_u32() i=
s
> dropped, so a malformed property (for example a zero-length or wrong-size=
d
> cell, which returns -ENODATA/-EOVERFLOW and leaves the output untouched)
> ends up indistinguishable from an explicit request for GMAC1.
>
> The read also happens for every compatible, including rk3528/rk3562/rk357=
6/
> rk3588 where the binding declares the property invalid; there the value i=
s
> parsed and then never used, since only rk3568_combphy_cfg() consumes it.
>
> [ ... ]
>
> > @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combp=
hy_priv *priv)
> >               break;
> >
> >       case PHY_TYPE_SGMII:
> > +             rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_s=
gmii_mac_sel,
> > +                                          priv->sgmii_mac_sel > 0);
>
> [Severity: Low]
> Should out-of-range values be rejected rather than folded into GMAC1?
>
> The "priv->sgmii_mac_sel > 0" test collapses the u32 to a boolean, so a
> device tree with rockchip,sgmii-mac-sel =3D <2> (or 0xffffffff) that was =
never
> run through dtbs_check gets the GMAC1 routing and rk3568_combphy_cfg() st=
ill
> returns success, with nothing logged.
>
> A range check in rockchip_combphy_parse_dt() returning -EINVAL, or at lea=
st
> a dev_warn(), would make such a device tree visible instead of silently
> selecting the default route.

Thanks for the review.

The property is validated by dtbschema for all in-tree device trees,
which is where the enum and the compatible gating are enforced. A
malformed or out-of-range value can only come from a bootloader-supplied
DT or an overlay that bypassed dtbs_check, which is a user error rather
than something the driver needs to defend against.

The read result is intentionally ignored: the default of 1 matches the
hardware reset value, so a missing property and an explicit "1" are
semantically identical for this hardware.

Thanks,
Coia

