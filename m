Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816F6C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XABCwRH1cz9pvG8xb1/rc/NU2wG7piHZfQQ4/81JX2E=; b=H6NBLSZpmSwZONYXd0QKhKZrMl
	AuDO9hkLQm5qdBta0YVDCyjX8Y5UU+M3j3OMkqvby6f/MB6jtqg3HpSqfyKZyVIJHEoLyWnNi0nqW
	Z6/Mg5I9NZSyF1Krj0zrBZ1vsxEcHUTMFkr4BYfeB+lq1rDJ1iFwhfHFHBQRHMu9H1xs5IE/TD70D
	Tafnm8DvQIvqtjTIxRJA/HeGJoGZFPwvAQfpVWV6XE6GGfIezQrv9fZoahOMYjNvwjAn92C9Shidr
	5VPcGnU6cn6T1Va7iYMpOZ7CQkZICabagIIVEm82xm1N6BFVD63+ZZkG9PHxeIXnhlMk2JpHUNkY0
	upV0MC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QHz-00000005tcl-3daS;
	Tue, 15 Sep 2026 10:21:23 +0000
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QHx-00000005tbd-1H1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:21:22 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c28e3998eb7so254227366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467678; cv=none;
        d=google.com; s=arc-20260327;
        b=JolPgdOVS3gV7KeHM3HIAcCdcwCiK7ydjuRCVm+V0LBiQJBdkZQtSP2tqSmU2/O88E
         v6HO78bEAvXzF0j2ek6qXK4wZqSyc4UWUcetMJEukBDBrMXspqYDNNSRmww5c9rh2Uqp
         h7hszR+zoRsLc/G/htAXDxjFxWEXkzRI/Eoo2c0IoeZRPeZnlXapIKhqUibMOLO2gMF4
         NvtDez79/BzCA1jDqDGp4vydV1CZs3iZWWGOdWTDM0dsZF2oouyImDZ7qkHOl72QdwA/
         5S1uhNfUL7BCsjIRJYCybY5yxNbfkJXa6DbRl/axA8lVUvVrnQTBcxeB5gjumkZtFlSR
         FcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XABCwRH1cz9pvG8xb1/rc/NU2wG7piHZfQQ4/81JX2E=;
        fh=X2WQylvisEDhiCClUEEbQFkA/dAJD50rBRKuauAJlY0=;
        b=IcMa1yG1sCfAXfcXum1fXatbj4M5/FgmVQghwkZsJm5B8s0Xf+KtOqqPqNh9DFt+hy
         OMCuMYghvyXNb256aHeS+tMMSn7oNjMvzfjxkQ9/sXx+5/FMTHSb8TvEu3gCDgvHIB9U
         LWuD4vq3/iU4KGypCpjpk0ZwntAlzKXHyUHzmeOmk/02CXIwvOCa2dNgRD6jij9JZnqD
         FIm/DHG7eMSVzDLnt9tUGfY5wPNrz3jwYsf5vW/qSoDxx2bXHN8u1K0hxblceZyPlR3u
         Y4SsZ850bLfjVhDIIws+3LkEMPFANhMYaA/w4x/Ra6GSpaZtIN6ACm7/Er6HxpeK3FZH
         BUtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467678; x=1790072478; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XABCwRH1cz9pvG8xb1/rc/NU2wG7piHZfQQ4/81JX2E=;
        b=O6mzftbYdw3DGTPM2HnGamIlIGTvqhlNvo5tHkx5ILFdu9h7jdbrHKRWGgbHPKgCca
         forQS/7RT90KCRPTO8tEMzWZiNxBg10fyYAgwLHiFQ8Bk+NOnNBrvc3d4t55NjNQLYwN
         kMSiIiX+2fYf3cVsoUNLFprCzIAJ6aii8AdE0vhI/+ZbxP3V1/ULimBTP0MMOf8Ws8sp
         9qBGZo6bBtLvep/FgCblLA8AMQLotY+nEtqKTW0s5phERwcWXPn+UHsrZ39uQ02dvbo+
         arC5oq2TJr+AlF2xoxaCc6QJW1KXzLfeWs/ZoQ5WTRTx4J19mhFNhShXxFdIsJY4eU1q
         KA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467678; x=1790072478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XABCwRH1cz9pvG8xb1/rc/NU2wG7piHZfQQ4/81JX2E=;
        b=06EmNNWRjUbnUgO/XmPFQb7NUhNzUH2PVb6rlhIihdbk3Y+1SvqUYGspbEFGvwXtef
         Ila+jl5SwOAegsE9lKh8fRxwZIMlIzEfu3JgVEC5eLB8ZGHYx4pxZYQXCuxR+dP6W0qp
         qdfj29dR/aUBhom8YGgNXEQze9D1Q1zsDzaYfjwKHaRxwmLkibfIgv/LBSGPwl/Ndl32
         WD8BdM9qMECU+iqGTW7HZVLiaNhJo+xNRFWrv5JYpEWSxLN17r8SxGfBHzjNnuCn5yEN
         570b65wZtFXQZQQOEDHvACbiIgyHYCDZSY7uLwfKlX1JiMh8c7oWMS9MAOkc/8qH+RYb
         Eudw==
X-Forwarded-Encrypted: i=1; AKwUvBz1JRXGocbvgd/ObfaTQSfQ0vMi9Z7KYwkB1yFGj41NEmgGMs1JVKq+/qDdLPPdXQdjZXG6ZkmxEUg7hdXZjwK8@lists.infradead.org
X-Gm-Message-State: AFuF++npnxzIfvLQA9Nuxw7XtIXYe0FzyCM/Fa2A76gH0ZK8KY+y4Oup
	3cjrETVEfFjKNmbJneFzyKbVTavzWphmF+pj5asxm3Q4TelpZVbio2YwDp9avm4L6tME9+eWB5E
	5w7q0vNQOiw0tIPJajNAfgQ7+RZFyBCQ=
X-Gm-Gg: AYBFou2mLXA7aAlaN0zAczq1p0GrHBzjgvVE5zynllNesyDY6fUx0/4gq1VTkIMfZN6
	rhf9L6dL4edTBw00tRJBd4AZGf70WDKvetkyX/0eKz0IIGqbEgqBdzlZ9FwotVLNQQz9SB8c8h0
	X1ycVcn1mc4H8T+JVtyZlZBODM7Z0j6QEg520DyLvteUqpswBDQOznmg2oUfnSLeWb2uG7Maie8
	5OOmj4HaZ+qIUT/CzAIZCE+LQOijBZkpr6KkhwHjJq0pCbRBj+n8OOLGiZ2SYDi9fAsX/Eq8MVI
	rFaeTaO/O95obu5H8xZxEi0ta2j+0UW90tSankeODO/G0NEKkgnSIZILLullc0gwDHsbsQ==
X-Received: by 2002:a17:907:7241:b0:c20:3402:bd35 with SMTP id
 a640c23a62f3a-c29b86141d8mr457395166b.12.1789467677591; Tue, 15 Sep 2026
 03:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260913185849.907479-2-coiaprant@gmail.com> <178941747507.22033.8211069120708719813@kernel.org>
In-Reply-To: <178941747507.22033.8211069120708719813@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:21:05 +0800
X-Gm-Features: AcwNN1U3Qit6ntXQAFPttYjh805h_onbrrSTpOF8OG9JEjoB8ua8kiIB7eBD0O4
Message-ID: <CALj3r0gwMFRg7GADhOThGWbpJ=9CGGQYUb=xYtsDV8kLAHkMuQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 01/11] net: stmmac: move XPCS lifetime
 management to platform drivers
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
X-CRM114-CacheID: sfid-20260915_032121_386644_CCC0CC7B 
X-CRM114-Status: GOOD (  40.90  )
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
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 1
>
> - [Medium] Commit message mischaracterizes the removal of the generic
>   XPCS creation as removing dead code.
> - [Medium] DT binding vs implementation mismatch: after this patch
>   nothing in the stmmac core reads the generic 'pcs-handle' property,=E2=
=80=A6
> - [Low] The commit message describes two defects, one framed as "more
>   critically" (the common code overwriting priv->hw->xpcs after a=E2=80=
=A6
>
> --
>
> net: stmmac: move XPCS lifetime management to platform drivers
>
> The generic XPCS creation in stmmac_pcs_setup() (pcs-handle lookup and
> mdio_bus_data->pcs_mask based xpcs_create_mdiodev()) is removed, leaving
> only the plat->pcs_init() / plat->pcs_exit() dispatch. The Intel mGbE glu=
e
> grows its own pcs_init()/pcs_exit() that create and destroy the XPCS, and
> the renesas-gbeth, rzn1 and socfpga pcs_exit() callbacks now clear
> priv->hw->phylink_pcs after destroying the PCS.
>
> A few questions on the commit message and on the removal of the generic
> path.
>
> >     First, if a device tree specifies a "pcs-handle" but no select_pcs(=
)
> >     callback is provided by the platform driver, the created XPCS is ne=
ver
> >     used. The phylink framework requires select_pcs() to actually retur=
n
> >     the PCS to the core, so the pcs-handle property becomes effectively
> >     useless without the matching callback.
>
> [Severity: Medium]
> Is "the created XPCS is never used" accurate?  An XPCS stored in
> priv->hw->xpcs has two consumers that do not go through select_pcs().
>
> stmmac_phylink_setup() in stmmac_main.c uses it to widen the phylink
> interface sets:
>
>         /* If we have an xpcs, it defines which PHY interfaces are suppor=
ted. */
>         if (priv->hw->xpcs)
>                 pcs =3D xpcs_to_phylink_pcs(priv->hw->xpcs);
>         else
>                 pcs =3D priv->hw->phylink_pcs;
>
>         if (pcs)
>                 phy_interface_or(config->supported_interfaces, ...
>
> and stmmac_init_phy() uses it to decide whether to attach a PHY at all:
>
>         if (priv->hw->xpcs &&
>             xpcs_get_an_mode(priv->hw->xpcs, mode) =3D=3D DW_AN_C73)
>                 return 0;
>
> So for a dwmac instance with a pcs-handle but no plat->pcs_init, does thi=
s
> change narrow config->supported_interfaces (and config->lpi_interfaces) a=
nd
> alter the PHY-attach decision, rather than just dropping something unused=
?
> Would it be worth spelling that behavioural change out in the commit
> message?

The XPCS's runtime functionality is entirely driven by phylink through
pcs_config() / pcs_get_state() / pcs_link_up(), all of which require
the pl->pcs pointer returned by mac_select_pcs(). Without that callback,
pl->pcs stays NULL and none of them are ever called.

The two reads in stmmac_main.c are one-shot setup-time side effects.
They do not exercise the PCS, so I consider the statement accurate in
the sense that matters here.

> [Severity: Low]
> This isn't a bug, but could this paragraph say that no in-tree platform i=
s
> affected today?
>
> All three pre-existing pcs_init() implementations store their PCS in
> priv->hw->phylink_pcs, not priv->hw->xpcs:
>
>   renesas_gmac_pcs_init()  -> priv->hw->phylink_pcs =3D miic_create(...)
>   rzn1_dwmac_pcs_init()    -> priv->hw->phylink_pcs =3D miic_create(...)
>   socfpga_dwmac_pcs_init() -> priv->hw->phylink_pcs =3D pcs
>
> so the old "priv->hw->xpcs =3D xpcs;" on the pcs_init branch overwrote NU=
LL
> with NULL.  intel_mgbe_pcs_init() added here is the first in-tree pcs_ini=
t()
> that stores an XPCS, which makes this a refactor that removes a latent tr=
ap
> rather than a fix for observable breakage.

The wording is intentional. All in-tree pcs_init() implementations
except Intel store their PCS in priv->hw->phylink_pcs, so the old
assignment was a latent trap rather than observable breakage. Calling
it out as critical reflects the risk it would have posed for the first
driver that stored an XPCS there.

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > index afe98ff5bdcb0..7396b68899c66 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > @@ -426,35 +426,14 @@ int stmmac_mdio_reset(struct mii_bus *bus)
> >  int stmmac_pcs_setup(struct net_device *ndev)
> >  {
> >       struct stmmac_priv *priv =3D netdev_priv(ndev);
> > -     struct fwnode_handle *devnode, *pcsnode;
> > -     struct dw_xpcs *xpcs =3D NULL;
> > -     int addr, ret;
> > -
> > -     devnode =3D dev_fwnode(priv->device);
> > -
> > -     if (priv->plat->pcs_init) {
> > -             ret =3D priv->plat->pcs_init(priv);
> > -     } else if (fwnode_property_present(devnode, "pcs-handle")) {
> > -             pcsnode =3D fwnode_find_reference(devnode, "pcs-handle", =
0);
> > -             xpcs =3D xpcs_create_fwnode(pcsnode);
> > -             fwnode_handle_put(pcsnode);
> > -             ret =3D PTR_ERR_OR_ZERO(xpcs);
> > -     } else if (priv->plat->mdio_bus_data &&
> > -                priv->plat->mdio_bus_data->pcs_mask) {
> > -             addr =3D ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
> > -             xpcs =3D xpcs_create_mdiodev(priv->mii, addr);
> > -             ret =3D PTR_ERR_OR_ZERO(xpcs);
> > -     } else {
> > +     int ret;
> > +
> > +     if (!priv->plat->pcs_init)
> >               return 0;
> > -     }
> >
> > +     ret =3D priv->plat->pcs_init(priv);
> >       if (ret)
> > -             return dev_err_probe(priv->device, ret, "No xPCS found\n"=
);
> > -
> > -     if (xpcs)
> > -             xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100=
ns);
> > -
> > -     priv->hw->xpcs =3D xpcs;
> > +             return dev_err_probe(priv->device, ret, "Failed to initia=
lize PCS\n");
> >
> >       return 0;
> >  }
>
> [Severity: Medium]
> After this change, does anything in the stmmac core still read the generi=
c
> "pcs-handle" property?
>
> The property is still documented generically in
> Documentation/devicetree/bindings/net/ethernet-controller.yaml:
>
>   pcs-handle:
>     $ref: /schemas/types.yaml#/definitions/phandle-array
>     items:
>       maxItems: 1
>     description:
>       Specifies a reference to a node representing a PCS PHY device on a =
MDIO
>       bus to link with an external PHY (phy-handle) if exists.
>
> and snps,dwmac.yaml $refs ethernet-controller.yaml and ends with
> "additionalProperties: true", so pcs-handle stays schema-valid on every
> dwmac node regardless of which glue is bound.
>
> On a glue that does not set plat->pcs_init, stmmac_pcs_setup() now return=
s 0
> without looking at the property, priv->hw->xpcs stays NULL, and nothing i=
s
> logged - whereas the removed code would at least fail probe with
> "No xPCS found" for a bad phandle.  Should the binding be updated to say
> pcs-handle is only honoured by specific glue drivers, or should the core
> keep a generic path (or emit a warning) so the two agree?
>
> The same question applies to struct stmmac_mdio_bus_data.pcs_mask.
> stmmac_mdio_register() still treats it as "a PCS lives at these MDIO
> addresses" and masks them out of the bus scan:
>
>         new_bus->phy_mask =3D mdio_bus_data->phy_mask | mdio_bus_data->pc=
s_mask;
>
> but no core code creates a PCS for those addresses any more, only
> dwmac-intel's private intel_mgbe_pcs_init().  Does a glue that sets
> pcs_mask without pcs_init now end up with that address neither scanned as=
 a
> PHY nor instantiated as a PCS?

This is intentional. Only platforms that set pcs_init() are considered
to support a PCS. A glue that sets pcs-handle or pcs_mask without
pcs_init() is misconfigured, and the new behaviour makes that explicit
by not creating anything.

