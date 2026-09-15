Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BADFC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=; b=MyrFJdxPjpksGll1kDBupoRY9Z
	GnVR1m475d2LYukr0KOjb2StlF+fvjtgK+ksA7aAxSrYP/C1xLUSqzlrrnalfyqSniuha8ZhqhsbO
	PN9pMTos+qQeMmmXxOyWmm9FRDqIp/GKS72bwx8iadMG+ingeK/QGJ/Ab+JbDuZ7dTJw1YGuR8Yae
	mjq3aFfUVsyulFMuzno6vw+cRugPoKDds7u6uQtcMMN4/aGgcrLY6riag4VflKfW3mhB8CDJB/JEd
	Etgltr+DWQyJawTwq9DtQ89qOwROin+uyCI2Qt6stoApuRA+bqr0VwrgHisgA/DkeJXTIIlz2BGdg
	Hh9s0RNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QJo-00000005tyM-1Vdb;
	Tue, 15 Sep 2026 10:23:16 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QJl-00000005txA-1LPI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:23:14 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c2950c25486so236813266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 03:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467791; cv=none;
        d=google.com; s=arc-20260327;
        b=EXQT15azCrjHGE+PVsF+T32i15PjG83P6FldyIijpEx/vvsLkOrpfpcfWD7/k9nLPm
         HTcttw5WZCF3dFQhmkBYU+KVOQeO9lZ7thcOPcq3WkaE1Oy8D/k6BKCr8FIKbwpdxTiq
         rT6souRAwpO4A+GyOpmh1bhn77IkDwm4eSbDeHtsRK8KmxIrpTSd6g7qn2WhpoTTQNtZ
         IOprHsfyrdgJXRjsfALI3x+GHuO+2B1XiW8G5A9LR2u8qDYYa+qsyd8ZI95riXDnkqK8
         w/YwWOiw6ZVg2h4I9kxKDbqFYAmsEx7topQo0jinWHr1rm9OfG3TdYBBO2NYiZNaezrm
         7RUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        fh=SPyxPdqCtxQtHVvLhdlZxAyXRm4e8SWWKVwhJ+4Ja8E=;
        b=j5HKqg26EbVTX3K+knSiB3O12iIdYRXpUT+q8w9I0t1TyzWOqt81abSrPegfCebvi9
         s0f7z7p/TkGqgEeRX/2d18O039Ff+f183ZKjOydoXD5MZUAEXGbwSd+C5aoO8a8aFrJ/
         IS/AmQvaP2pneXyYorDJQC16sPQle5pxIS19jZtrsmuatgbL9arZKhgSw7vUJqSntN15
         rZ1N0D4nbVLyhmWuPSQ1grinPqaaulnz344lGRr9fhzCxSscVn+/UaiJ99oz7Kc+v2xZ
         wVz7+OXJKjjuTeK6uDY4cAwSTqVx0bkDfOm4De5RTSJrvJ1WfY+OYyhhZlypX7FsBVcC
         9Tig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467791; x=1790072591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        b=A3HNq0ZV3W/rTicHrs4nlJfKEZ1wVI02+xDmg17XfMW4xI9o9C5P1Vw/mwpNHtZK5y
         YXKk12QvCwA8OERQOeCtnIRxFWq/xbtSwOoKyHOoB8xCdR4IjBJNjHBE985TWQG2qby2
         cOWUs7v0VTlhH6heXzSHNDj1uL0yqMpouwkSxqG3tBaxFCJwsDMKRG5gDIarFGFLP28s
         zCDpRaPVSwVSDQjIj7BjfDJQ4X3EV+etFv4MIzOEnIdatyudK7XhmiLeRjqiOlWACrLS
         egNnB6g50YMzeFp+YmoJg++AraIzCtV3e25jECNYDMDZSGTFgF3tRoC6JssARQ7r9izP
         R0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467791; x=1790072591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYoTXRWm9dXxQab97Avfkm/YI6364EPnV/puvJGLZtc=;
        b=cBgYSX9AODK4e+sWJHR1Iiq81VKZIg86M5fTTA6eTNgsMZbPeXtiv7Yvtpo4nIS5Bt
         62SfW4feeGT63ffoP2N91jmpXTJk2W+vQKgU0xAM9IL3S4z5SqYWQcX7mMWOmxFRO/JY
         9+Bct41aBpARReraGJ2LmUMhTPNA/oK+Slj3fpby+2qdZHV9qZo+VHM0H0H3dE2b02XP
         Bu0Gl75uoJF/eH1jHMLlpjPhHB+2fsFM9d8oZWIyrmhwCoKOvHlnT+CcXKPFLtYsiNW7
         ZzpRbZsIUyl6kwe+vVvqkTw5c2rBvnYmHoL+TGhznyIkAV8i97ACp3/skfa8FAatzS/v
         2Jjw==
X-Forwarded-Encrypted: i=1; AKwUvBzTzkAHr+oKDHcElcyNLbAgm7PN3KGaqSI+8FmmhiSBUoROMQoNaEb7uOsULJF20x7SuAasJwYG+qpPVmQz5YbK@lists.infradead.org
X-Gm-Message-State: AFuF++lOCAbTcN7a0Z96fnN/zb1yzAprFd7AwiZ5uzgvwRg0CV907sNc
	UDlWXDEek/xspP5mEZp5EsClyF/+NXGENyrNKoqBLHtFKV1izU4BG3pQ2HFxLmcgVDMMFb3t5u7
	GjsTJy7t5ZtIJdKABdGHXLk8dpcRjubU=
X-Gm-Gg: AYBFou0wx8ZfabV4Oj1SDdfvE0FIc3cOsS/c86g769QXuwhD/bJvKbiafiDdHY/aaWT
	CwAW/UplXXWMdR+cG7mNC0dkGY9zD5lL6y8Rzrj+QTaClN+0GvHDPvefyUxMiLUQIuE4gXbinR3
	dw+HqGFaIc1lhinP2j1S6haJWdClhi/mprVLuiLq0LQqb+tJh1Kz1pr6nb+yZpdvAYbYDWnip3P
	pLZ7raagQ9FMCn7LrtdUaOT1xg97seo2oK6acmI+vhyhsGOgx8IOB8Te5tHTAAEMaIIZuxf4U6S
	4n+3TRi5MT0AtovCq9bqcYDC4DS4CFkOfYZ82hW1iUslXZ9eValBn3fwdw==
X-Received: by 2002:a17:907:3d56:b0:c25:6c9a:88bc with SMTP id
 a640c23a62f3a-c29b87339e8mr775899466b.19.1789467791028; Tue, 15 Sep 2026
 03:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260913185849.907479-3-coiaprant@gmail.com> <178941747711.22033.8495700704733189874@kernel.org>
In-Reply-To: <178941747711.22033.8495700704733189874@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:22:59 +0800
X-Gm-Features: AcwNN1XIwap_FwM1kV5GNhNfjY4yI0txPnJoW2RyomCTNzqIwhUfgmMQ2h9aiaE
Message-ID: <CALj3r0ge_AVi=jrUZh_T8cEt954S_Ah7Hi4QxkccjEm6zug_Ag@mail.gmail.com>
Subject: Re: [PATCH net-next v5 02/11] dt-bindings: phy: rockchip:
 naneng-combphy: add rockchip,sgmii-mac-sel property
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
X-CRM114-CacheID: sfid-20260915_032313_418057_AC6A8FBD 
X-CRM114-Status: GOOD (  18.66  )
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
> - [Low] Concern (validated as NOT a defect in the series context): the
>   binding adds `rockchip,sgmii-mac-sel` while, at this commit alone, no=
=E2=80=A6
>
> --
>
> dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel pr=
operty
>
> This adds an optional rockchip,sgmii-mac-sel property to the naneng-combp=
hy
> binding so a board can select whether the RK3568 SGMII interface is route=
d
> to GMAC0 or GMAC1.  The property is restricted to the RK3568 compatible v=
ia
> the existing allOf conditional and defaults to 1 (GMAC1).
>
> [Severity: Low]
> At this commit alone, is rockchip,sgmii-mac-sel read by anything?
>
> rockchip_combphy_parse_dt() in
> drivers/phy/rockchip/phy-rockchip-naneng-combphy.c does not look it up,
> struct rockchip_combphy_grfcfg has no pipe_sgmii_mac_sel descriptor, and
> no in-tree DTS sets it, so a kernel built from exactly this commit would
> silently ignore the property.
>
> This resolves itself later in the same series: "phy: rockchip:
> naneng-combphy: add SGMII MAC selection for RK3568" adds the parsing
>
>         priv->sgmii_mac_sel =3D 1;
>         device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sg=
mii_mac_sel);
>
> along with the RK3568 pipe-GRF descriptor
>
>         .pipe_sgmii_mac_sel     =3D { 0x0040, 1, 1, 0x00, 0x01 },
>
> and the write in the PHY_TYPE_SGMII path of rk3568_combphy_cfg(), and
> "arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port" adds the
> first user:
>
>         &combphy2 {
>                 rockchip,sgmii-mac-sel =3D <0>;
>                 status =3D "okay";
>         };
>
> So this is noted only for the record, since the binding and its consumer
> being split across consecutive patches is the normal series layout.
>
> The remaining point is a design question rather than a bug: is a raw
> uint32 MAC index the interface preferred here, or would a phandle to the
> GMAC controller node be a better fit for describing the routing?

The property maps directly onto a single bit in the combo PHY's own
GRF register (PIPE_GRF_XPCS_CON0 bit 1), which selects whether the
SGMII lane is routed to GMAC0 or GMAC1. It describes a mux setting
inside the PHY, not a relationship to the GMAC node. A phandle would
introduce an extra dependency edge between the combo PHY node and the
GMAC node for no benefit, and the raw value matches how the BSP and
the surrounding GRF properties describe similar muxes.

So I'll keep the uint32 form.

