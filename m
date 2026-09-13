Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2471C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VcRS1K9zpuLLsLouHP0jen4im6vQDO3XTpDbYYnzBY=; b=Bx09WWOYUEPLhYyILhHJc+/Rd1
	vnKlgeQmDU4A/P5waB0RCwVzzZgy6dQ1Wo86wzbqKWYDwqdt8jqg6/hIll+TrNgml1/QQr5xreP8T
	F9gHkfzOG4uOraL6l8F4Scbqg++xQAzzdfCxJ4zfarDR6gx6wjgZrajleNrbiFtKW7KQioA44rlIj
	8FRG5xUQS3b/kdNtcZBq3tttoOjaVwzVRSlRRgzJM7JU27wQmkuQBi9ilFieXPPYzWg58Xep03bmm
	AXkYSqoypydtGuQRlJEQ8+PE4Ajj+YKOLokwxmRKXbJYBk7XkiUlrnKvBZZZT52GHehFffayuBDFT
	qyc9t1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5oPH-00000001ssj-0Q9Q;
	Sun, 13 Sep 2026 17:54:23 +0000
Received: from mail-ej2-x0a.google.com ([2a00:1450:4864:34::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5oPD-00000001srj-3Qpg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 17:54:21 +0000
Received: by mail-ej2-x0a.google.com with SMTP id a640c23a62f3a-c25b4493edfso114881966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 10:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789322058; cv=none;
        d=google.com; s=arc-20260327;
        b=FqyEF5pH5EVsbHROv/oGKpj0OSZMFIL4ptZkroDEEeVFb/uU9TAspffEfNHXazoC91
         f1O+iSuXzuH86/OcxBFkhAmqIPr0zJKWGVPNqwke9b37WPuS700QtYe4Bx9h6123ERrC
         4hr9GVFhZLgdwhNiWo3foch5LekATgjbfhU/QBsZMIgaV+rptt1Y2LfPeydYxx1B6WUt
         LK3E0QV4mItuTnBv70GV4VkxlWGHobx2ahIYMqAzYnVsu/+whdu/FFyLDBGi9N9rzhLj
         iT+IXGFay7nG4A0/TsLb1xJ86/R+tBWUUsN6IaF9RkI6XjWaLZZZDJ6tkFsjasjItYOj
         vQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2VcRS1K9zpuLLsLouHP0jen4im6vQDO3XTpDbYYnzBY=;
        fh=5yQdgxnrbS8+XVB0eW9a/ECS/5FU/EgOD216rnui3yw=;
        b=K33F9Bhg+pIDm4Lx49A6DLK2Rh3dtOAqQxuOl3hZVishspNlgSKEvirMOJQvj/gSqz
         p8/rI1gsVWc0pjibadSpcHJhu8o85IURBuS8RPSyk5nkMqyBSLtqtP3pzEAdSJSRFjDL
         x4D7dyaJrB4q/qC7ExD8FBFanhxqKAGiOe2mPEAWeG8eWVjpjU0u7arducO6ayN9EUI2
         Ih2nfVelnnlgYmemu+xsycsRSQJojeqka7qmFvAcd/Nya3xkd0bzRhFvmfLEJ+mzJKPu
         MmTBvqd841JSwKUNa7/pPNbqHOKr84Dhk1A1NQsWBb9zlNRHM+v+XjCINQN+7dU322iA
         Z7Ww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789322058; x=1789926858; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2VcRS1K9zpuLLsLouHP0jen4im6vQDO3XTpDbYYnzBY=;
        b=b/lhgbXyq8aroq16seoO3Sf+f+uRrdwJMSx1w+rqjxP5xEBTBD+6L1OnSDuxL+u0sc
         SuhVXT9oiCVt4qPIjyXhRGCZybii3JGDw8tMaGNwYbJGtdbiPbcN7UlN0jb1AIFNdFRB
         PoUM1aRY9EH8730qu84JB9eB/wDfbjzT+ZquJD9Mg0BkAdtZkpwHJ9DTaXSpKuurc2KA
         3Sfybo3G8Wa8XaSQbWBaDdk0vKr4eUHrANorlksDqyHmPl5ZMCjOq+kMYXVTS1jx1HXi
         VIHSNZUj68L2uOiIu/0/OoxneB/SyUkV0wDQFzkCAPAeulpeku5lqTfZFOJvGPKOzaT9
         PeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789322058; x=1789926858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2VcRS1K9zpuLLsLouHP0jen4im6vQDO3XTpDbYYnzBY=;
        b=G7CsFXx5IbwCVU3UVerS6dGRlUTZLFtvWWlvyakwhJl5hDC6kMy57v7Oo4r1Mod3TY
         dSm7itorAhY73+wOT/2WtCchhkQ2j7nqa/D5mpXZgtsP6wPKad+bsLFmeEb1wRnpQFd8
         1dYgh1qJPOKA3inVFlQ/qk3xuKln01RKuMGDxjlEkOgbhf9ApDurrN1Nhh1TBkaS8xPa
         rG5s7M7mVtI0GhlkZG1D+ojWZyHNOfXIeYWzMXlhW/Hs8qaplxDzC0fm1tC6zIANZj7F
         2MjGn7BQcUF1zhjnxzlHMSjRahvj4dkp6eAy4+WanRUh9xQ3wlAK1p8OrgJiFuo9T7qM
         h1UA==
X-Forwarded-Encrypted: i=1; AKwUvBzxR20kraCDFPB3Qlq+MQt3OWFzh3gtSxTu2l+rui1Fhp7tchWy9KdptIZYpgszwS/ff7g3N0u50JiSLjrYf0jG@lists.infradead.org
X-Gm-Message-State: AFuF++lNd0dKPnfzVzKtLwj5f5LSnSw/4dPCqM9RixhfNZ3TZAmtF9vC
	f1KPqkensMYCAOuJD+zpKasPV0mnGrRe1b9Bf8xRSfbpn0ohLFGc/wm4y2/iARccb/BwzIlTcZv
	/QqDAO4zgQwuUbntTn9jx3k6o1Ih96iI=
X-Gm-Gg: AYBFou3mAkidUdpVeNJ5+0f7rRl/5Oimml4+cqxK2x3jWKFrcDa5fKK5gE6MA9P28TY
	JJ2QhNfucMgcRL1fVZ/eGZp9R1+lDWEYeEDK2AKoVMrvFc2a0vnj5N87U698DKw4esgDtKwBVws
	MKMeD2bC5X8P6a3fdGTska07HosCdaz2NgyZzvnwjqnWyi4zfyQVM99ia/q8ekXtejI8FkoL9Mm
	TXuFOYOuv2hlkTOnqHkHRrBYEAyVp0NvOmdQQ6VT9X5hblfHCHIZsAAWDfAISs8unBjQMyVsDU0
	aRACvZBgbW9ELyq+xovR9Ouk2MTVm+ALhN4IqjErucKC2fVzoofiEwkvdA==
X-Received: by 2002:a17:907:9619:b0:c26:207d:8a8f with SMTP id
 a640c23a62f3a-c296668c70amr682570866b.27.1789322057580; Sun, 13 Sep 2026
 10:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260907153713.2572547-10-coiaprant@gmail.com> <20260912201330.127164-1-kuba@kernel.org>
In-Reply-To: <20260912201330.127164-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 14 Sep 2026 01:54:06 +0800
X-Gm-Features: AcwNN1Ucyb3gV5K7ZLOVIG2XPGoU4DT98Q4QVU-FLrVaSsRTeWCQtGOJbGry1ZQ
Message-ID: <CALj3r0j8hLRfvhtJZ19XYu0+EMYKRkV9KTy2us_z7896egZ-kw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 08/10] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
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
X-CRM114-CacheID: sfid-20260913_105420_075621_22BD8F01 
X-CRM114-Status: GOOD (  43.94  )
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
> net: stmmac: dwmac-rk: add SGMII support for RK3568
>
> This adds SGMII glue for RK3568: a set_to_sgmii() callback that programs
> GMAC CON1 bit 7, pcs_init/pcs_exit/select_pcs callbacks that create the
> Rockchip XPCS from the "pcs-handle" phandle, and a rework of the
> rk_gmac_powerup() error unwinding into a single clk_disable label.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 386)
>
> A few questions below.
>
> > While at it, fix the clock enable ordering in rk_gmac_powerup():
> > gmac_clk_enable() is now called before any register access, including
> > the SGMII mode setup path.  Previously SGMII mode would bypass the
> > clock enable via a goto, which could cause synchronous external abort
> > when accessing MAC registers with the clock domain disabled.
>
> [Severity: Low]
> Does this paragraph describe the baseline?  At 879e280b8486 there is no
> SGMII case and no goto in rk_gmac_powerup(), and the order is already:
>
>         ret =3D rk_get_phy_intf_sel(bsp_priv->phy_iface);
>         if (ret < 0)
>                 return ret;
>         intf =3D ret;
>
>         ret =3D gmac_clk_enable(bsp_priv, true);
>         if (ret)
>                 return ret;
>         ...
>                 ret =3D rk_write_gmac_grf_reg(bsp_priv, val);
>
> so gmac_clk_enable() already preceded every register access and there was
> nothing that could bypass it.  The change here is a pure reorder ahead of
> rk_get_phy_intf_sel(), which touches no registers, plus the new unified
> unwind label.
>
> Would it be more accurate to describe this as preparing the ordering for
> the new SGMII path rather than as a fix for a synchronous external abort?

You're right. The baseline already had gmac_clk_enable() before any
register access. This change is a reorder to prepare for the new SGMII
path that skips rk_get_phy_intf_sel(), not a fix for a pre-existing
SError. I'll correct the wording.

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 8d7042e689261..e47ca1bec5b8b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>
> [ ... ]
>
> > @@ -809,6 +813,8 @@ static const struct rk_gmac_ops rk3528_ops =3D {
> >  #define RK3568_GRF_GMAC1_CON1                0x038c
> >
> >  /* RK3568_GRF_GMAC0_CON1 && RK3568_GRF_GMAC1_CON1 */
> > +#define RK3568_GMAC_MODE_RMII_RGMII          GRF_CLR_BIT(7)
> > +#define RK3568_GMAC_MODE_SGMII_QSGMII                GRF_BIT(7)
> >  #define RK3568_GMAC_FLOW_CTRL                        GRF_BIT(3)
> >  #define RK3568_GMAC_FLOW_CTRL_CLR            GRF_CLR_BIT(3)
> >  #define RK3568_GMAC_RXCLK_DLY_ENABLE         GRF_BIT(1)
> > @@ -851,18 +857,32 @@ static void rk3568_set_to_rgmii(struct rk_priv_da=
ta *bsp_priv,
> >                    RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
> >
> >       regmap_write(bsp_priv->grf, con1,
> > +                  RK3568_GMAC_MODE_RMII_RGMII |
> >                    RK3568_GMAC_RXCLK_DLY_ENABLE |
> >                    RK3568_GMAC_TXCLK_DLY_ENABLE);
> >  }
> >
> > +static void rk3568_set_to_sgmii(struct rk_priv_data *bsp_priv)
> > +{
> > +     u32 con1;
> > +
> > +     con1 =3D (bsp_priv->id =3D=3D 1) ? RK3568_GRF_GMAC1_CON1 :
> > +                                  RK3568_GRF_GMAC0_CON1;
> > +
> > +     regmap_write(bsp_priv->grf, con1, RK3568_GMAC_MODE_SGMII_QSGMII);
> > +}
> > +
> >  static const struct rk_gmac_ops rk3568_ops =3D {
> >       .init =3D rk3568_init,
> >       .set_to_rgmii =3D rk3568_set_to_rgmii,
> > +     .set_to_sgmii =3D rk3568_set_to_sgmii,
> > +
> >       .set_speed =3D rk_set_clk_mac_speed,
> >
> >       .gmac_phy_intf_sel_mask =3D GENMASK_U16(6, 4),
> >
> >       .supports_rmii =3D true,
> > +     .supports_sgmii =3D true,
>
> [Severity: Medium]
> Who clears CON1 bit 7 for RMII on rk3568?
>
> rk3568_set_to_rgmii() now explicitly writes RK3568_GMAC_MODE_RMII_RGMII,
> which shows bit 7 has to be programmed by the driver.  rk3568_ops declare=
s
> supports_rmii =3D true but has no .set_to_rmii, so the RMII branch of
> rk_gmac_powerup() is a no-op:
>
>         case PHY_INTERFACE_MODE_RMII:
>                 dev_info(dev, "init for RMII\n");
>                 if (bsp_priv->ops->set_to_rmii)
>                         bsp_priv->ops->set_to_rmii(bsp_priv);
>                 break;
>
> and the generic GRF write uses gmac_phy_intf_sel_mask =3D GENMASK_U16(6, =
4),
> whose write-enable half-word never covers bit 7.
>
> Since rk3568_set_to_sgmii() leaves bit 7 set persistently and nothing in
> rk_gmac_powerdown() restores it, can an RMII port come up muxed to the
> SerDes when bit 7 was left set by firmware or by a previous SGMII
> configuration of the same MAC (kexec, warm reboot)?  The probe would repo=
rt
> success while the link never works.

Good catch. rk3568_ops declares supports_rmii but has no .set_to_rmii,
so the RMII branch is a no-op. If bit 7 was left set by SGMII or
firmware, an RMII port would be muxed to the SerDes.

I'll add rk3568_set_to_rmii() that explicitly clears bit 7, and wire it
up in rk3568_ops.

Since we set set_to_rmii and set_to_sgmii, supports_rmii and supports_sgmii
will be omitted.

> > +static int rk_pcs_init(struct stmmac_priv *priv)
> > +{
> > +     struct device_node *np =3D priv->device->of_node;
> > +     struct device_node *pcs_node;
> > +     struct dw_xpcs *xpcs;
> > +
> > +     pcs_node =3D of_parse_phandle(np, "pcs-handle", 0);
> > +     if (!pcs_node)
> > +             return -ENODEV;
>
> [Severity: Low]
> Should "pcs-handle" be documented in the Rockchip MAC binding?
>
> This makes the property effectively mandatory for phy-mode =3D "sgmii" on
> RK3568: a missing phandle returns -ENODEV, and stmmac_pcs_setup() turns
> that into a probe failure:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:stmmac_pcs_setup() {
>         ret =3D priv->plat->pcs_init(priv);
>         if (ret)
>                 return dev_err_probe(priv->device, ret, "No xPCS found\n"=
);
> }
>
> Documentation/devicetree/bindings/net/rockchip-dwmac.yaml does not mentio=
n
> pcs-handle at all - it is neither described nor conditionally required fo=
r
> the SGMII-capable compatibles - while the new
> Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml says the
> port "is linked to an Ethernet MAC controller via the pcs-handle property
> in the MAC's device tree node".  Other stmmac glue bindings that parse th=
is
> property describe it (renesas,rzn1-gmac.yaml, renesas,rzv2h-gbeth.yaml).
> Could the MAC binding be updated to match?

You're right, rockchip-dwmac.yaml should describe pcs-handle, since the
driver now requires it for phy-mode =3D "sgmii". I'll add it to the MAC
binding.

> > @@ -1379,16 +1441,19 @@ static int rk_gmac_powerup(struct rk_priv_data =
*bsp_priv)
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D gmac_clk_enable(bsp_priv, true);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but the bare return here canno=
t
> unwind a partially enabled clock domain.  gmac_clk_enable() leaks the bul=
k
> clock references when the PHY clock fails:
>
> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:gmac_clk_enable() {
>                         ret =3D clk_bulk_prepare_enable(bsp_priv->num_clk=
s,
>                                                       bsp_priv->clks);
>                         if (ret)
>                                 return ret;
>
>                         ret =3D clk_prepare_enable(bsp_priv->clk_phy);
>                         if (ret)
>                                 return ret;
>         ...
>                         bsp_priv->clk_enabled =3D true;
> }
>
> The second failure path returns without clk_bulk_disable_unprepare() and
> without setting clk_enabled, so the new clk_disable label,
> rk_gmac_powerdown() and the suspend path are all no-ops afterwards becaus=
e
> the disable branch is gated on clk_enabled.  Does this leave the bulk
> clocks prepared and enabled for the lifetime of the system?

This is a pre-existing bug, not introduced by this patch. The second
failure path returns without clk_bulk_disable_unprepare() and without
setting clk_enabled, so the new clk_disable label cannot unwind it.
It should fix it as a separate small patch.

> > @@ -1486,6 +1557,9 @@ static void rk_get_interfaces(struct stmmac_priv =
*priv, void *bsp_priv,
> >
> >       if (rk->supports_rmii)
> >               __set_bit(PHY_INTERFACE_MODE_RMII, interfaces);
> > +
> > +     if (rk->supports_sgmii)
> > +             __set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
> >  }
>
> [Severity: Medium]
> Is the SGMII advertisement here consistent with where the PCS is installe=
d?
>
> supports_sgmii is true for every rk3568 instance regardless of DT, so SGM=
II
> always lands in phylink_config.supported_interfaces.  The PCS plumbing,
> however, is only installed when the DT phy-mode is exactly SGMII (see the
> rk_gmac_probe() hunk below).
>
> On an RK3568 board with phy-mode =3D "rgmii"/"rmii", phylink can still pi=
ck
> SGMII - phylink_validate_phy() intersects phy->possible_interfaces with
> config->supported_interfaces - and then:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_mac_select_pcs()=
 {
>         if (priv->plat->select_pcs) {
>                 pcs =3D priv->plat->select_pcs(priv, interface);
>                 if (!IS_ERR(pcs))
>                         return pcs;
>         }
> }
>
> returns NULL because select_pcs is unset, no XPCS was ever created
> (pcs_init is NULL), and rk_gmac_powerup() has already programmed the GRF
> once from the DT-derived bsp_priv->phy_iface, so rk3568_set_to_sgmii() ne=
ver
> ran.  Would gating the SGMII bit on the same condition that installs
> select_pcs/pcs_init keep the two in agreement?

The phy-mode is fixed by the device tree and does not change at runtime.

rk_gmac_powerup() programs the GRF according to bsp_priv->phy_iface, which
is derived from phy-mode, not from supported_interfaces. So advertising
SGMII in supported_interfaces does not cause the MAC to switch to SGMII on
an RGMII board.

This is the same as the existing handling for RGMII and RMII, which are
also advertised unconditionally when the SoC supports them. There is no
inconsistency introduced by this patch.

> >  static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
> > @@ -1602,6 +1676,17 @@ static int rk_gmac_probe(struct platform_device =
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
> Does default_an_inband guarantee in-band mode here?
>
> include/linux/phylink.h describes it as a default that "a fixed-link
> specification will override", and phylink has two ways out of in-band:
>
> drivers/net/phy/phylink.c:phylink_parse_mode() {
>         dn =3D fwnode_get_named_child_node(fwnode, "fixed-link");
>         if (dn || fwnode_property_present(fwnode, "fixed-link"))
>                 pl->cfg_link_an_mode =3D MLO_AN_FIXED;
> }
>
> drivers/net/phy/phylink.c:phylink_pcs_neg_mode() {
>                         neg_mode =3D PHYLINK_PCS_NEG_OUTBAND;
>                         if (pl->phydev)
>                                 mode =3D MLO_AN_PHY;
> }
>
> With set_clk_tx_rate cleared, stmmac_mac_link_up() then programs no rate =
at
> all:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_mac_link_up() {
>         if (priv->plat->set_clk_tx_rate) {
>                 ret =3D priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
>                                                 priv->plat->clk_tx_i,
>                                                 interface, speed);
> }
>
> So for phy-mode =3D "sgmii" with a fixed-link node, or with a PHY that ca=
nnot
> do in-band signalling, the fixed 125 MHz clock is used at 10/100 Mbps -
> which the commit message says gives working TX and failing RX.  Should th=
e
> driver reject out-of-band SGMII explicitly instead of relying on the
> default?

You're right. default_an_inband can be overridden by fixed-link, and
phylink can fall back to outband if the PHY cannot do in-band. With
set_clk_tx_rate =3D NULL, the MAC clock must stay at 125 MHz for 10/100
Mbps, otherwise the TX-works-RX-fails behaviour described in the
changelog occurs.

I will document the in-band-only limitation in the changelog.

Thanks,
Coia

