Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1868C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgYQMTATtyJWpk9CvcV0pYNidzQnxU/fkxOhjlNLIRE=; b=2Bsuq5Yjk0pprRiXAgmkYVqx0m
	ixY0jKGgz9783P3TDPcCGaqWoAx/hAD8Z7q6ph1kn6pb/ESqO5jimaNbB/PrYEnfnk92rD2SzHokM
	kkKzwgieBh9SsLhkonY4oVfRBffY97hY9sNKqPgFY3tByWaxHHTwAdm6BwR/2lELA3oQbLdYogYyw
	8Unu1xsTIvvq7Ohpa/R0f/NY8b7BmG4Y0ShCWUe/tTJiV/Jv4U4pX/b30VNXKxTqmU6/Qh+c7D41P
	KAUqgDSXQBZ7eNDxUTXuaK4tZD5SScXjJeTFpsXwrICjBYMPJcRXtRvs+HOeCqP8ViU5n+TW9ta3c
	JhQ28Ytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xXP-00000009QSn-100J;
	Tue, 08 Sep 2026 15:15:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xXN-00000009QS3-2BlY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CgYQMTATtyJWpk9CvcV0pYNidzQnxU/fkxOhjlNLIRE=; b=Lxizd2RPehdpL6KX7zrtGIv9cL
	5ZFkvQWq6h90j1BVBeuZMiFghu2CxlMYHouXNre9uU5ecgKqJFIwhHHb7Sdr6FkhsUXDWGHh5OLQO
	VWyIKk2qitRbFME5l3NwyueQZDzFugXbTyZHZAZWn2z90u2DJ1QKTccWES88BzoXRd/XQrmvSeBl5
	IVCcuPzrxW5HtuBG9zsf7VWvHOEQSldVJB7FO296255RXtCqtiYgWMFnk7GplehLh2cf6TOdR01//
	48y4rCymKVs2dqPqpcq0JNkSRboliExPHBB/449gw6a4Ejuz6A56k2P4+ogixFQk0jKzoJ4mqFIEJ
	i2252Nng==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xXJ-0000000Hb4z-353y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:15:04 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so5537579a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788880499; cv=none;
        d=google.com; s=arc-20260327;
        b=NPj0oSsqOaYxXvTWZLzyy3yeL+O38mbgbTzxSRcYMRbGSIrx0u+au9iWN76Pqe1hTD
         7kNGaqwLaah1hLzDUTObzlrZWBpXI7+yFqIaLf3Srs2y2ZXJV8BxcagEeNSAc2oNGakJ
         qhOEQ75gFXe+eJdpDC08eS5Bnt8kafpaCHXGqncvN8tujqsTC41PV1ukC0H6Hl84k9nZ
         I1pOiJhQSsuX5UR5NXaWlrZ1iP1wXDcjR5OcMtslwPx6z244E64gokLDGmbA3wny65c2
         nFxTB1DMnLWfxHBd8PRwbvvrj6AoPuiqDv1Q4Qyeh3RJ5bmNv19GhbG5kZhIHdzS8lwa
         iE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgYQMTATtyJWpk9CvcV0pYNidzQnxU/fkxOhjlNLIRE=;
        fh=5Edpmo183uOGLmzj1w+EXNI/76ykppMXQUMD0zdActo=;
        b=rzygcYAZ0ivc/2EefZV1l21hWqLT2aeImNhEPq6l0x97LbCwQyVPCE7ypTES1trZUK
         gn3MjTJhEe7OzNYoKWMFVBK+GSY80bcQCEdC6OzNLe0KGh8JoihLJsWhq7/0g7cOH8zg
         HcOlHQRJou67+jmDQqqw19dlBRkXSVnhy3aKx7t0W8PdijpYkuT0I5NZ+WUv46xc5hCx
         QPtnr+9ZRibqjbUk++uSdYiPSmvYhFrtjRgUcajyHqimCW8GTKxtRrqyb/TdQ9zU2hcy
         Q+mZyiNqSE3aWUncnuokSVd0b6vOvx50kNflagf0M+YsynY04gZHTvOXzQ17uankVXDS
         ZoHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880499; x=1789485299; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgYQMTATtyJWpk9CvcV0pYNidzQnxU/fkxOhjlNLIRE=;
        b=IPi6KoHu6OWi8FaWbSldqHmZ3gmcKnXmBL8PzhXEFOEh4q34t8kJxgqK8kNA8Smnfm
         YvHm7oId+AvkDnWgh2XXa8QTtONbxbA2HhHdWwyf8ftVZa68uPtoFMRGoSMNgE9Zxkme
         YpTYJHVdRdVfYy0O/fAexjMopDm3i+UnKEzqoImvTR0qTC87QYCrgEYOvUsRR6LOsNQR
         uvEf+VQKOT3KUMEhenrrc97SAqx3BE4aWXdC3u3b+dRN2vbpffS7i7RjRJS59dPfVO47
         J5tlArtQaX9LQ8zBYDhWbdS3sAfYbcsOPhMg71TjsmsA7zx1arxdpsPxKldkwOxOzukC
         1mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880499; x=1789485299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgYQMTATtyJWpk9CvcV0pYNidzQnxU/fkxOhjlNLIRE=;
        b=ZMQa6a7zmN+tNaAOCMLdl34Remq/nC4l7/n73mqaumhW35c28+XWj9YsqBNBEksdi5
         1knrXs2WY/98Y/aL/5W0Z0jG7G8qAP+XN9Ab7gL/A1ajCpHN5xLZmtPhDhnYqbviPdPE
         v0ou+o5czvyZ/Y1zoGGwY2+nY92BxyJRJAPK7vsl58oEx3Xc8Ss/Pz2kvIkLgsF0EMD9
         J2hV0qqmLN5OEX2+SwoJM0/FvKIDB625gFW4h1Oy0rK89awDdfga1FPgZGNBU5dYMUvl
         grsKAbn+EVBDBzt5e/3c35YzLLX5Fls0kO3GVwaGTD/TYoW6Om052J9H9njjGpe8VU/Q
         RN5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFYsMmuKboeBC07TYfV/VcyMzSWc8UIEmCKDHlI2BqDxwcMNt0r2nimXsGlumOrq6tUW6Lp6tlftVPjr47H2jn@lists.infradead.org
X-Gm-Message-State: AFuF++mbJwcJnyEb3VQZ1ul11jRve86YaIFZ0TkFTJ58V2NWuiSNbHWO
	JHU2FvffrCZPnErgHD4c4CTiFtobTCnxpJhgmzighpdg57X8cjBtuHwbUo87J9n/LilhT1haBaE
	T1O718PHkgzdaTHlERd9dFivWQn5huQ==
X-Gm-Gg: AYBFou24kByG4dfE4a+0ujB0OXRhonEF2sCyJNVh74+QjHIf30pksZGGOqJr/weVNUY
	ATmb8nNVkSKJxu07SZZyNIbOG25+hmV6D8eaQpGy5d4S4/h52iho0Ymurf4EsAHST7XblBTkKUw
	udrLACL+WTgiW82G/UGKwfuG15e7+dr8O//OZ2J6H5Y4bW9daaaWc5I/vYWJJ/bpDOBOJ7rTv6Y
	K+i3pdpdvQjLy4N0JFIare5WuBVOPJ46M7Dkw8wKmTlMW6qNEMvxzUmF4Jan3KAdvuapw/gSanT
	hvRNy0WkXaBX7IwdEUyAl8+nx4VxXofyoabxGivY8iQ=
X-Received: by 2002:a17:903:26cc:b0:2db:56da:6a0b with SMTP id
 d9443c01a7336-2db56da6ebbmr216182465ad.13.1788880499195; Tue, 08 Sep 2026
 08:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260904202800.3410838-1-vladislav.karmanov.dev@gmail.com> <178885625700.219967.7168072838761125406@kernel.org>
In-Reply-To: <178885625700.219967.7168072838761125406@kernel.org>
From: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Date: Tue, 8 Sep 2026 18:14:46 +0300
X-Gm-Features: AcwNN1XB_kJovrt7RM82lErwqtpd0arCb5Y1gSidn9sAEhYEVo0spZm52sfv7_Y
Message-ID: <CADDoYm6gVeXpEdQJNzqBfBXXGSqg7TTZeyyqka7nShE=Aw6Rcw@mail.gmail.com>
Subject: Re: [PATCH net v3] net: phy: mediatek-ge: disable EEE on the MT7530 PHY
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, daniel@makrotopia.org, 
	dqfext@gmail.com, SkyLake.Huang@mediatek.com, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com, 
	sean.wang@mediatek.com, olteanv@gmail.com, yangshiji66@outlook.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161502_055157_FE9879A1 
X-CRM114-Status: GOOD (  35.07  )
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

Both findings confirmed against current sources -- thank you, the
analysis is spot on.

v4 keeps the probe()-time advertisement clear, which also feeds an
empty advertisement back into genphy_c45_read_eee_adv() during
phy_probe(), and moves the durable disable to config_init(), the
dp83867 placement: config_init() runs after of_set_phy_eee_broken() in
phy_probe(), so the eee_disabled_modes fill is not undone, and it is
the callback phy_init_hw() replays after a PHY reset, so the register
clear is restored as well. The register is also written again there
for the reset path.

v4 follows as a fresh thread.
https://lore.kernel.org/netdev/20260908145213.3976508-1-vladislav.karmanov.=
dev@gmail.com/

Tested on the affected hardware (ASUS RT-AX53U, MT7621): single clean
100 Mbps WAN link + DHCP lease over a 2-pair cable, no flapping. The
ethtool re-enable path is not reachable on this board (phylink rejects
EEE ops at the MAC layer), so that part is verified at the code level
for standalone use of the PHY.

=D0=B2=D1=82, 8 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 11:30=
, <netdev-bot+sashiko@kernel.org>:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> - [High] mt7530_phy_probe() (drivers/net/phy/mediatek/mtk-ge.c:65-84)
>   calls phy_disable_eee() from the driver's .probe callback, but phylib=
=E2=80=A6
> - [Medium] The hardware write that clears the EEE advertisement,
>   phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0) at=E2=80=A6
>
> --
>
> net: phy: mediatek-ge: disable EEE on the MT7530 PHY
>
> This adds an mt7530_phy_probe() callback to the mediatek-ge driver which
> clears MDIO_AN_EEE_ADV in hardware and then calls phy_disable_eee(), with
> the stated goal that neither phylib nor userspace can re-enable EEE on th=
e
> MT7530 internal GE PHY.
>
> > diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediat=
ek/mtk-ge.c
> > index 73d9b72f9d9e2..35600c70cab90 100644
> > --- a/drivers/net/phy/mediatek/mtk-ge.c
> > +++ b/drivers/net/phy/mediatek/mtk-ge.c
> > @@ -62,6 +62,27 @@ static void mtk_gephy_config_init(struct phy_device =
*phydev)
> >                      FIELD_PREP(MTK_MCC_NEARECHO_OFFSET_MASK, 0x3));
> >  }
> >
> > +static int mt7530_phy_probe(struct phy_device *phydev)
> > +{
> > +     int ret;
> > +
> > +     /* The MT7530 internal GE PHY has broken EEE: with EEE advertised=
,
> > +      * some link partners fail to establish a stable link (on a 2-pai=
r
> > +      * cable, 1000BASE-T training fails and the port loops instead of
> > +      * falling back). MediaTek recommends disabling EEE on this PHY.
> > +      * Clear the EEE advertisement early and mark EEE disabled, so
> > +      * that neither phylib nor userspace can re-enable it.
> > +      */
> > +
> > +     ret =3D phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Medium]
> Should this register write also live in mt7530_phy_config_init()?  This i=
s
> the only place where MDIO_AN_EEE_ADV is cleared in hardware, and ->probe =
is
> the one callback phylib never replays.  phy_init_hw() deasserts the reset
> line, optionally soft-resets, and then re-runs only ->config_init and
> ->config_intr:
>
> drivers/net/phy/phy_device.c:phy_init_hw() {
>         ...
>         if (phydev->drv->config_init) {
>                 ret =3D phydev->drv->config_init(phydev);
>                 if (ret < 0)
>                         return ret;
>         }
>         ...
> }
>
> mt7530_phy_config_init() does not touch MDIO_AN_EEE_ADV, so after a PHY
> register reset the register is back at its EEE-advertising hardware defau=
lt
> while phydev->advertising_eee stays empty and eee_cfg.eee_enabled stays
> false, i.e. software and hardware state disagree.
>
> Two paths that re-init without ->probe:
>
>   - phy_detach() asserts the PHY reset signal and a later
>     phy_attach_direct() -> phy_init_hw() only replays config_init.
>   - the SIOCSMIIREG BMCR_RESET case in phy_mii_ioctl():
>
> drivers/net/phy/phy.c:phy_mii_ioctl() {
>         ...
>                 if (prtad =3D=3D phydev->mdio.addr &&
>                     devad =3D=3D MII_BMCR &&
>                     val & BMCR_RESET)
>                         return phy_init_hw(phydev);
>         ...
> }
>
> which returns without any aneg reconfiguration, so nothing rewrites the
> advertisement to zero.  __genphy_config_aneg() ->
> genphy_c45_an_config_eee_aneg() covers the usual renegotiation case, but =
it
> returns early without writing when phydev->autoneg =3D=3D AUTONEG_DISABLE=
.  The
> equivalent in-tree quirk issues the disable from the replayed callback,
> dp83867_config_init() -> phy_disable_eee().
>
> > +
> > +     phy_disable_eee(phydev);
>
> [Severity: High]
> Does the phy_disable_eee() state survive the rest of phy_probe()?  The
> linkmode_fill(phydev->eee_disabled_modes) done inside phy_disable_eee() i=
s
> what makes the disable permanent, but phylib clears that set later in the
> same probe flow:
>
> drivers/net/phy/phy_device.c:phy_probe() {
>         ...
>         if (phydev->drv->probe) {
>                 err =3D phydev->drv->probe(phydev);
>         ...
>         /* Get the EEE modes we want to prohibit. */
>         of_set_phy_eee_broken(phydev);
>         ...
> }
>
> drivers/net/phy/phy-core.c:of_set_phy_eee_broken() {
>         struct device_node *node =3D phydev->mdio.dev.of_node;
>         unsigned long *modes =3D phydev->eee_disabled_modes;
>
>         if (!IS_ENABLED(CONFIG_OF_MDIO) || !node)
>                 return;
>
>         linkmode_zero(modes);
>         ...
> }
>
> So for any MT7530 PHY that has an of_node, eee_disabled_modes ends up emp=
ty
> again unless the DT carries eee-broken-* properties.  An of_node is prese=
nt
> in a documented configuration: mt7530_setup_mdio() registers the internal
> bus with the switch's "mdio" child node,
>
> drivers/net/dsa/mt7530.c:mt7530_setup_mdio() {
>         ...
>         mnp =3D of_get_child_by_name(np, "mdio");
>         ...
>         ret =3D devm_of_mdiobus_register(dev, bus, mnp);
>         ...
> }
>
> and mediatek,mt7530.yaml documents that node, so ethernet-phy children
> described there get an of_node.
>
> With eee_disabled_modes empty, can userspace re-enable EEE again through
> dsa_user_set_eee() -> phylink_ethtool_set_eee() -> phy_ethtool_set_eee() =
->
> genphy_c45_ethtool_set_eee()?
>
> drivers/net/phy/phy-c45.c:genphy_c45_ethtool_set_eee() {
>         ...
>                 } else if (linkmode_empty(phydev->advertising_eee)) {
>                         phy_advertise_eee_all(phydev);
>                 }
>         ...
> }
>
> That repopulates advertising_eee with supported_eee, then
> genphy_c45_an_config_eee_aneg() rewrites MDIO_AN_EEE_ADV and
> phy_restart_aneg() renegotiates, which looks like it brings back exactly =
the
> 1000BASE-T training loop described in the commit message.
>
> Would moving the disable into mt7530_phy_config_init(), which runs after
> of_set_phy_eee_broken(), address both this and the reset case above?  Tha=
t
> is the placement dp83867_config_init() uses for the same kind of quirk.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260904202800.3410838-1-vladislav.karmanov.dev%40gmail.com

