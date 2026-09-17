Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A653C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5WNGNe1lhNBokZFGMokFyVzO+LFHTSqDV1bGq+2Clo=; b=y39+ZjQC06K/w5EE5fJSQoCyzF
	IKGI9DVuEAmi04Nzhl7GA1CRdpRaPevnMGuWjjqItpl8P5iQ1Eo5z9bug7pcQVNYqfWvLIkz1+m/d
	zaoMdAWySyEOQqFnhlNKAVncO6N4iCPR44hbdqAM31IHHeUwoiNO5RDwrmf+fVfF9uzOHYcN4uwYB
	EtbBRDO73t8f5f7+NX7rz+QOwCquEbJlfn4UjSBYpPTSJEttUCQcRlBVmDihClkjzBUcW4pVJQEUI
	qThHr3gcrO+iy4VrvVcAJU/E7TcL+sYiw1HUai5UKCCHfdIBW6aXcbGC79O6OIKyxoOBN/wIZU8Ys
	VSzjs63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IID-0000000CO5Z-2Esi;
	Thu, 17 Sep 2026 20:01:13 +0000
Received: from mail-ej2-x02.google.com ([2a00:1450:4864:34::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IIB-0000000CO3x-1G6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:01:12 +0000
Received: by mail-ej2-x02.google.com with SMTP id a640c23a62f3a-c29d14021b9so258466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789675269; cv=none;
        d=google.com; s=arc-20260327;
        b=NOFIY/zqB8xo9OtUZ4B8h5LYeeYH18AHrkWTV9nhQlEusyqtzZrS53oD1rPQMWof5K
         kqfByW6ChnV0wa8FwIsqj/pY/DwaQyDIjCFc0UiAQO6abg2POkA94bbHPfVOckY0FZZy
         j+Ktv36I+C38okrW3HjROnrAMk/g7hMIxXJVkOCFvO/7UKmH6KEZcsYf4bHkeoVyhhhX
         edC2RlTUKo4RZrJIGF2i0zBYP7WatgcBqYljQn+CYpgjKLtG6Q51rM+D6sB4nwjNT4xD
         Y4KC8IKMlKH4UD1tJry/yfta8zZOCWBlqXlUHeq+UFcHRp6dDU4vx+//JeF3KVHdAs3M
         1U4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X5WNGNe1lhNBokZFGMokFyVzO+LFHTSqDV1bGq+2Clo=;
        fh=WoW4S2DlVP0Vlb4ka0NOW0m15ZHEUtUaEj/F1ffzjDk=;
        b=LZiwEQkDaQKW63QUSn9v4cTuGmf4ApVUOm2L7oD5qJywb4DPqD+/zvJK3F8LyVvPP6
         PqZkhZgByDpeWQ0up+P7OdxUP3WZJhbeqjxfQMJ2n9o8NIRGRho90c4jhMt/nFqxqpq+
         kDN+b+5W/AUHYQMh1Ss7FHegSp2nPvf3zX8cI/Hh2axr2z0D5MN7TYur1nW7E6eY82z0
         5WVSK8/UMdc7SCDZMfubfelwQD1TG0GYBOxaEgTtTb1/NooFzxYQvzsEdjYAwgdkA/XM
         aYFr/sV/mgomClmv3FSO4xxKqn4pyZad/n0BLkPHCLE4ERd6Vide6XVjkO5qW+QEEuSm
         1mVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675269; x=1790280069; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5WNGNe1lhNBokZFGMokFyVzO+LFHTSqDV1bGq+2Clo=;
        b=bnvWsVVZMwp7L9Y+IeHU78rWfYVKVDuauyygnU49tiqwvX7VQOQA4gOXsydDlEKeK1
         eGX8kgPIur+MZajupo7uWcwE8Pd8lpUaV9GK9GR+6EIJxuQorxRy3ZFMsy8a66bYuF2q
         OhCK1c2jzl7nH8f/HapRlSlTp7cw+A5M2HMFAFpHFBLGJQjWXeoMy4Qw/8oLoHE4F/wR
         RYJUlMvUtqwspSEyBU6R+lmHSE4MB1bpTsvCfeo0pqZfHTp5H4j38h5VfYXxLLi4U4M7
         ZEJMfmvWWLwLO+82omJ8pGBLJq1UNHHjpxDK1RfsqOmBFpzh05LAPsEbwXoA/BH25Zkl
         Zq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675269; x=1790280069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5WNGNe1lhNBokZFGMokFyVzO+LFHTSqDV1bGq+2Clo=;
        b=xNQv5716esc359cXIsbLy3woS1IM2FJHY9RupyIckYiugh5lnjAhuRDXhPs9SykRJX
         fPm2qw0DaKdpfekov0UF6B66/Gwm6XdY2yXsGPDOW+/bRXI1+amurA89LF7Th2wekvU9
         q/UXVj1liQYkbnTf5PHos8VvoaJmztB5w1RbQyGcZsWqpLGOZXEMHLctMVvPu+6o8mJ9
         UZVShbLuyKjLc18D8Ne9vr4l/ZlUf1qqeO0bO2brKssanmvb9udPEnLVmxnvlTcFv7Z7
         UhRWvAaGUrNPlz9J9j59+QcXbs19YtA9Kj9dATYpk8rjvFaTAxxMQWe3MqnLbKCpbAqz
         g6bA==
X-Forwarded-Encrypted: i=1; AKwUvBxQnSbjO6vj/rd3Og/IarS+JI0I/h+6PROSq/OOjjwG/ne1Sg+A46ATCQNe29Wn3mu6kCscTdNnXD1AzKobPazq@lists.infradead.org
X-Gm-Message-State: AFuF++l0U++77sHrSdN4kCosf1ULeDD0VheM/qYaUjT5xH8ZL6/JsxV0
	kVzNRH0O6+UH2mu6WRkTWPPqfo9holU8PBBSJ9JP7bDmrFSQAAHnv/4ztIivPQ8Q9d3jpjkqpyA
	8tfBBkHPh5lip22JMDVNui/CqvB0Az3I=
X-Gm-Gg: AYBFou0P5NcU3bCpstbqG3/vdRGaiQxlxjiUnkhG/e8d4239tOpdBF2N8Hll1dDfaKT
	UF89puatIIZdNL/NJUk+oT6yyaVKzfIMOicRIzBWAARamF4etoMY7sS4+mu4DHqc+Pg5H/mY+Dn
	/n7ch4yaauQXvqI32O7zDkE8F1AxA6HKI2tQGoompq1KE3o982aCXWY9WWvJwfZz0DRwxN3SD+K
	IAMPhKJBUtoQAvvGN/hCqSfmfTQr7tr+trFU+eW04Jd5MUOyg82DhymMbsXmpx2BbRru9uAmBEn
	II2ZwdN7A9H5XzK9B5/v+cx4awfqNEsopgygtnrzqvZBhTLcN0dHGze7+g==
X-Received: by 2002:a17:906:9fcc:b0:c25:4ba1:594f with SMTP id
 a640c23a62f3a-c2a15f67cf6mr21382466b.0.1789675268485; Thu, 17 Sep 2026
 13:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260915123802.1561724-2-coiaprant@gmail.com> <178967028545.22033.5966180145855511133@kernel.org>
In-Reply-To: <178967028545.22033.5966180145855511133@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 18 Sep 2026 04:00:57 +0800
X-Gm-Features: AcwNN1W0xTkmloUsW1i5szl1NVx3ZPQaoGTeeiTrBr7OCO9p4oUaPDdA4g8lK3Q
Message-ID: <CALj3r0iGMEbOwFZV8U0k_Ok7+QAdRdR-Y2B=8RjjLYTADU5opg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 01/11] net: stmmac: move XPCS lifetime
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
X-CRM114-CacheID: sfid-20260917_130111_407622_BC268663 
X-CRM114-Status: GOOD (  39.93  )
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
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 (1) =C2=B7 Low: 0
>
> - [Medium] stmmac_pcs_setup()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:426) loses the only=
=E2=80=A6
>
> Pre-existing issues:
> - [Medium] Clock reference leak in the XPCS constructor now invoked from
>   intel_mgbe_pcs_init(): xpcs_init_clks() (drivers/net/pcs/pcs-=E2=80=A6
>
> --
>
> net: stmmac: move XPCS lifetime management to platform drivers
>
> This moves XPCS creation and destruction out of the common
> stmmac_pcs_setup()/stmmac_pcs_clean() and into plat->pcs_init()/
> plat->pcs_exit(), converts the Intel mGbE glue to create its own XPCS,
> and makes the renesas-gbeth, rzn1 and socfpga pcs_exit() callbacks clear
> priv->hw->phylink_pcs after destroying the PCS.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > index f5f9fa67ecd77..4308dccbf2570 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> > @@ -603,13 +603,47 @@ static void common_default_data(struct plat_stmma=
cenet_data *plat)
> >       plat->mdio_bus_data->needs_reset =3D true;
> >  }
> >
> > +static int intel_mgbe_pcs_init(struct stmmac_priv *priv)
> > +{
> > +     struct fwnode_handle *devnode, *pcsnode;
> > +     struct dw_xpcs *xpcs;
> > +     int addr;
> > +
> > +     devnode =3D dev_fwnode(priv->device);
> > +
> > +     if (fwnode_property_present(devnode, "pcs-handle")) {
> > +             pcsnode =3D fwnode_find_reference(devnode, "pcs-handle", =
0);
> > +             xpcs =3D xpcs_create_fwnode(pcsnode);
> > +             fwnode_handle_put(pcsnode);
> > +     } else {
> > +             addr =3D ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
> > +             xpcs =3D xpcs_create_mdiodev(priv->mii, addr);
> > +     }
> > +
> > +     if (IS_ERR(xpcs))
> > +             return PTR_ERR(xpcs);
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but since the XPCS constructor
> call now lives here, it may be worth noting: can the failure path inside
> xpcs_init_clks() in drivers/net/pcs/pcs-xpcs.c leak the clk references?
>
> xpcs_init_clks() takes the references and, if enabling fails, returns
> without putting them back:
>
>         ret =3D clk_bulk_get_optional(dev, DW_XPCS_NUM_CLKS, xpcs->clks);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to get clocks\n");
>
>         ret =3D clk_bulk_prepare_enable(DW_XPCS_NUM_CLKS, xpcs->clks);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to enable clocks\n=
");
>
> xpcs_create() then takes the error path:
>
>         ret =3D xpcs_init_clks(xpcs);
>         if (ret)
>                 goto out_free_data;
>
> out_free_data calls xpcs_free_data() (mdio_device_put() plus kfree(xpcs))=
,
> so xpcs_clear_clks() - the only caller of clk_bulk_put() - never runs and
> the xpcs->clks array is freed with the references still held.
>
> intel_mgbe_pcs_init() only receives an ERR_PTR here, so it has no way to
> release them. Would adding clk_bulk_put() on the failed
> clk_bulk_prepare_enable() path in xpcs_init_clks() be the right fix?

This is a pre-existing bug in pcs-xpcs.c and is not introduced by this
series. It belongs to the XPCS core driver and should be fixed
separately.

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
> This removes the only generic reader of the documented "pcs-handle"
> property (and of mdio_bus_data->pcs_mask). For a glue driver that does no=
t
> install plat->pcs_init, stmmac_pcs_setup() now returns 0 before looking a=
t
> the firmware node at all.
>
> Does that make "pcs-handle" a silent no-op for the plain Synopsys
> compatibles handled by dwmac-generic.c?
>
>         static const struct of_device_id dwmac_generic_match[] =3D {
>                 { .compatible =3D "snps,dwmac-4.10a"},
>                 { .compatible =3D "snps,dwmac"},
>                 { .compatible =3D "snps,dwxgmac-2.10"},
>
> dwmac_generic_probe() sets no pcs_init, while "pcs-handle" is defined
> generically in Documentation/devicetree/bindings/net/ethernet-controller.=
yaml
> and imported unrestricted by snps,dwmac.yaml. Previously such a node got =
an
> XPCS via xpcs_create_fwnode(); now priv->hw->xpcs stays NULL and the
> former probe diagnostic ("No xPCS found" on -EPROBE_DEFER/-ENODEV) is gon=
e
> with nothing in its place. Should the bindings be updated, or should a
> generic pcs_init helper keep honouring the property?
>
> The commit message says:
>
>     First, if a device tree specifies a "pcs-handle" but no select_pcs()
>     callback is provided by the platform driver, the created XPCS is neve=
r
>     used.
>
> Is that accurate? priv->hw->xpcs has two consumers besides select_pcs().
> stmmac_phylink_setup() uses it to widen the interface masks:
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
> and stmmac_init_phy() uses it to skip PHY attachment:
>
>         if (priv->hw->xpcs &&
>             xpcs_get_an_mode(priv->hw->xpcs, mode) =3D=3D DW_AN_C73)
>                 return 0;
>
> The commit message also says:
>
>     Platforms that do not need an XPCS simply leave the callbacks as NULL
>     and no change in behavior occurs.
>
> For a platform that relied on the generic "pcs-handle" path, does behavio=
r
> change - narrowed config->supported_interfaces (and config->lpi_interface=
s
> when priv->dma_cap.eee is set), plus an unconditional PHY attach where th=
e
> DW_AN_C73 bypass used to apply?
>
> There appear to be no in-tree DTS files pairing "snps,dwmac" with an
> "snps,dw-xpcs" node today (RZ/N1, RZ/T2H, SoCFPGA and Rockchip all go
> through glue that sets pcs_init, and pcs_mask is set only by dwmac-intel,
> which this patch converts), and the gap is not filled later in the series=
 -
> at the end of the series stmmac_mdio.c still only dispatches to
> plat->pcs_init and "pcs-handle" is parsed only by dwmac-intel,
> dwmac-renesas-gbeth, dwmac-rzn1 and the new dwmac-rk. Could the commit
> message state plainly that generic device tree XPCS attachment is being
> removed?

You're right that this removes the only generic reader of the
"pcs-handle" property, and that dwmac-generic.c no longer gets an XPCS
from it. This is intentional: PCS handling is now the responsibility of
each platform's glue driver via pcs_init(). No in-tree platform relies
on the generic path. I'll state this explicitly in the commit message.

I'll also reword the "created XPCS is never used" sentence to
acknowledge that priv->hw->xpcs is still consulted by
stmmac_phylink_setup() and stmmac_init_phy(), even without select_pcs().

