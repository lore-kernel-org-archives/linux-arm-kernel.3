Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F04CC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voliItkzs3OtrnJtmbhCv1xhQ+FU+qBLL3OO/h9nssc=; b=3F3UUKtBR/F1mn+KREcnNtTRJ1
	UeUGxaiB4s/xjL2uY4kJj9iEVxPvBwog8DlzfXi4pQOs57vI8f8AkTd0TavkezJl8hH5cK2+VId7e
	ATA/zAbaYNFu1g+qy5dcr47RI28UBlU12vV1wGBF59LBQqwzyXJcKU4tXofhJ4WAZfqEpNt83W+fB
	Dbn1xIa/mFxxFhwAmzOVE51euu1RL6oJ0E8Y1pkSKGX2AYcjgqY29Vom65RnbG/WrrAnmloaKw2Tn
	QYY6foGz/Gmi/ol9cnA4H6rAgIEl6P7h6cCwhxGqWnHW29JYeKCKTN8fdAK3zGQIuUd9M9OWj+TWh
	Fwij0IAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5oa6-00000001tSA-2W7P;
	Sun, 13 Sep 2026 18:05:34 +0000
Received: from mail-ed2-x08.google.com ([2a00:1450:4864:33::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5oa3-00000001tQr-0EIE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 18:05:33 +0000
Received: by mail-ed2-x08.google.com with SMTP id 4fb4d7f45d1cf-6a99cd510ecso1269839a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 11:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789322729; cv=none;
        d=google.com; s=arc-20260327;
        b=qXZgx6zUbtDnHj7AqFJ6kx5Q5I9L5LK1380ogoAgPfuQ9WD4yy+dfVbCfAc9mqJ79f
         zXpW7pX13Z1TC0u2fAr1ohTpuhE/TymXxo4JILdUhpbbM0okQ1V8awlyPiESlsRJ6gjl
         rF+KyZRbtL8A2rIrRhgvF1njmHP0+VMR7euedb/myqwv77H7udiSk4zcJhAcg2AwmM9m
         Et9n+befNv6od5CQ/B0AfpNzmF642tm8tpNLf2TKdbWWbFNh29KGIv0KuX5wZlgyovfi
         0fIbq1oP1W1AO5dJxWm48R91bzgPznVaCWqND5Cw08/+FnX+ji9kc14gpoNt32FUH1NQ
         /U2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=voliItkzs3OtrnJtmbhCv1xhQ+FU+qBLL3OO/h9nssc=;
        fh=hTBPDWyTQdMlBNtEMhEbNyUjQH06f0HyYdOm8I3VwPg=;
        b=s/ipCj9YMBP1ARDfhCbJitI97wbyvsxXCgZOh9KsTo5v5kaOao1BckGOYw3K7Kt018
         foqleAD1vBnHiSjE+BgM6hsNOf0McYqyC+65JKlJrDflMQdbtglk1VA0+qj3Q08oyUv4
         EOKfc3xCkxUYceoNhExa1AUXMZewgpIl28BONjtBlmPR3spaNDBRJKWs0Lbl/iLgD+R+
         b9BXtrXqxFWUfTcJdAzhg2/QvPLQl16ufKtYozxNs35g9tzf2JZKOobvzcPsZSfRv5lF
         nPHNxqD3PF4rNupsZhYyRmVnQSGJ51cmxk14aDlUWVAnF4EPY7Rf+jkDMQgImhcGbvhS
         GufA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789322729; x=1789927529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=voliItkzs3OtrnJtmbhCv1xhQ+FU+qBLL3OO/h9nssc=;
        b=SIZ71KzQRzit+hr5DOeE7KzNKUzQi3Z7BiicIJwXcjVcN/mDAGJaT1+iSpf8LmydaP
         5a3dVM9KaRmGw4w4M7iQINQlTXoaJo7P2GOLdqr9oBNbxUERpkPDZGc6TsVRq4wuV72b
         GE/JublYiZdP+3mZH2fR2kOWdhAxQJvI/u02tES89fAZ3hzXLQCZYoV24SPvyOKH6joX
         GH9wwOLx5w8KVx6jrCeux4Wprxr1RGR84Ypzwlz+Nr7ljJJY37LnleJMOToyWLX6niXF
         EiwIcQcd8GdbCBSIEe72qhzErbD6I2NgTUrCOeZfgLTrNPGbAAsq6uuyZA562fz9pNpO
         CEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789322729; x=1789927529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voliItkzs3OtrnJtmbhCv1xhQ+FU+qBLL3OO/h9nssc=;
        b=cEGBoPRM2FwCnaF9G05Y4wU4MZgqJTmMehwQOEOTJEtnkxztlKgpxfvSbhYcXPhXEH
         VeDpTUpzYDNxexXAc53TYT4f+WlSSVRxBnghTZfdrmh/LRHMCDpcCvO5Xdn59hEd/GUA
         AUpu5cixjfuYEtV7O7VMTColHeFiTzK78dF8Es9SudAVNZE3VsN7W03AkB5RGR+mRheW
         C4ohqojOj2uxyCcATMGRhxzRKV5DIn0p/+MvC7lzWl6qJ1z1LAuRBWNjV49J8LjZKweu
         yyTEAk8alC/a5IV8PNI6So46yx4izATA0rRRc5s42W41U6AR+9IVt4SdFN1Lr5846ECy
         RAnw==
X-Forwarded-Encrypted: i=1; AKwUvBxiZ2G3lMlbvrIPdkqaKgbfzZw3ZAdH/4gxhBEQFLBNGYDr9kthiZp6lrHtk9S80YQuo8xj5/FqgOZuOK8mmrHF@lists.infradead.org
X-Gm-Message-State: AFuF++mghGURDCCAkvZsvQ1b5xufRRky5Xt5Q3+c/z0vHUJqw7SL/CNw
	oXlE84WxNk5BttoxFtkgFpkufCpn9/YGASorWx+sqadteUiB3hu2qaHwZEQbvhtsy/qNac9IBzv
	beQ4Nof8NSPfwEVDKZEccupg1LzO6LUg=
X-Gm-Gg: AYBFou2C1yx6bRNSyjACHvSz9YoTZBBjFoMFYzW5YakNoDgyMgoSvN+ddbzrVrNKQ2p
	GKjs/SiZdinDeuIFoiWBMffshKvmf4BM3hkHasf8oXYHIzixL2F6u5hP9qbhGBpPVnKZxpwXTJa
	gAp0XZGQ1T3P1ut16EXXKTofgSHXSpzG/3V6zDmkJNd6XqMW6Ws5uqrvZyUV/s0pgY8/shIDU+i
	F39uXZnZXpGP3iUgCR2Xz9wfGVEN8YON26SRMT77jzg0v2+8ivXYRdhwjKebtoI/EhtMqrMZXGH
	pkAcc8GLlpfGSFu7UfXY2nc5A414LT00jvporD7C784/TE++SbOBS2PCnw==
X-Received: by 2002:a17:907:d109:b0:c29:3e59:fd03 with SMTP id
 a640c23a62f3a-c2966732c9cmr1353966666b.18.1789322728959; Sun, 13 Sep 2026
 11:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260907153713.2572547-11-coiaprant@gmail.com> <20260912201332.127297-1-kuba@kernel.org>
In-Reply-To: <20260912201332.127297-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 14 Sep 2026 02:05:16 +0800
X-Gm-Features: AcwNN1XgxVngHvtMFNhv7y3qMtC3nxI3TV6XULwbytRJ0h4SCX-LBQfd6V3fGRY
Message-ID: <CALj3r0jBCoX=GRTrshY7QJO3Vykrbx+1NgE=zOV3S+WLLBNM2w@mail.gmail.com>
Subject: Re: [PATCH net-next v4 09/10] arm64: dts: rockchip:
 rk3568-photonicat: enable SGMII LAN port
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
X-CRM114-CacheID: sfid-20260913_110531_453663_C4E1241A 
X-CRM114-Status: GOOD (  26.90  )
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
> > @@ -242,6 +243,7 @@ &combphy1 {
> >
> >  &combphy2 {
> >       status =3D "okay";
> > +     rockchip,sgmii-mac-sel =3D <0>;
> >  };
>
> [Severity: Low]
> The changelog says:
>
>   "Enable combphy2 with rockchip,sgmii-mac-sel =3D <0> to route the SGMII
>    interface to GMAC0."
>
> Is that description accurate?  In the baseline the node already reads:
>
>   &combphy2 {
>           status =3D "okay";
>   };
>
> so the only new thing here is the rockchip,sgmii-mac-sel property.  Could
> the wording be adjusted to say the property is added to an already enable=
d
> combphy2?

You're right. combphy2 is already status =3D "okay" in the baseline; this
patch only adds the rockchip,sgmii-mac-sel property to it. I'll fix the
wording to say the property is added to an already-enabled combphy2.

> [Severity: Low]
> This isn't a bug, but the new properties do not follow the ordering used =
by
> the rest of this file, where properties come roughly alphabetically and
> status is last.  Here rockchip,sgmii-mac-sel lands after status, in &gmac=
0
> below pcs-handle comes before managed, and in the new &xpcs override stat=
us
> is first with phys/phy-names after it.  Compare the existing &gmac1
> override, which ends with status =3D "okay";.  Could these be reordered?

I'll reorder the properties to follow the file's convention (roughly
alphabetical, with status last)

> > @@ -350,6 +391,25 @@ rgmii_phy: ethernet-phy@3 {
> >               reset-gpios =3D <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
> >               rx-internal-delay-ps =3D <1500>;
> >               tx-internal-delay-ps =3D <1500>;
> > +
> > +             leds {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     led@1 {
> > +                             reg =3D <1>;
> > +                             color =3D <LED_COLOR_ID_AMBER>;
> > +                             function =3D LED_FUNCTION_WAN;
> > +                             default-state =3D "keep";
> > +                     };
> > +
> > +                     led@2 {
> > +                             reg =3D <2>;
> > +                             color =3D <LED_COLOR_ID_GREEN>;
> > +                             function =3D LED_FUNCTION_WAN;
> > +                             default-state =3D "keep";
> > +                     };
> > +             };
> >       };
> >  };
>
> [Severity: Low]
> This hunk describes the LEDs of the pre-existing RGMII WAN PHY on &mdio1,
> which is already functional and unaffected by the SGMII enablement.  The
> changelog justifies it only with:
>
>   "Also add LED configuration for the existing RGMII PHY on mdio1 for
>    consistency."
>
> Would it be preferable to split this into its own patch, so this commit
> contains only the SGMII LAN port enablement?

The LED configuration for both PHYs is kept in this patch because the
two PHYs are the same Motorcomm family wired identically on this board,
and describing them together keeps the two mdio nodes consistent. The
change is purely descriptive and does not affect the SGMII enablement.

That said, if you prefer it split out, I can move the mdio1 LED
description into a separate patch in v4.

> > @@ -586,3 +646,13 @@ &xin32k {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&clk32k_out1>;
> >  };
> > +
> > +&xpcs {
> > +     status =3D "okay";
> > +     phys =3D <&combphy2 PHY_TYPE_SGMII>;
> > +     phy-names =3D "serdes";
> > +};
>
> [Severity: Medium]
> Should phys/phy-names live in rk3568.dtsi rather than in each board file?
>
> The binding lists them as required properties of the XPCS node:
>
>   Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
>   required:
>     - compatible
>     - reg
>     - "#address-cells"
>     - "#size-cells"
>     - clocks
>     - clock-names
>     - phys
>     - phy-names
>     - power-domains
>
> but the SoC node in arch/arm64/boot/dts/rockchip/rk3568.dtsi has neither:
>
>   xpcs: pcs@fda00000 {
>           compatible =3D "rockchip,rk3568-xpcs";
>           #address-cells =3D <1>;
>           #size-cells =3D <0>;
>           reg =3D <0x0 0xfda00000 0x0 0x200000>;
>           clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
>           clock-names =3D "csr", "eee";
>           power-domains =3D <&power RK3568_PD_PIPE>;
>           status =3D "disabled";
>
> Does this mean every rk3568 dtb reports pcs@fda00000 as missing the requi=
red
> phys and phy-names under make CHECK_DTBS=3Dy, including boards that do no=
t
> enable the XPCS?
>
> The XPCS to combphy2 connection is internal to the SoC, so each board tha=
t
> enables it will have to repeat the same phandle, as this patch does.  Cou=
ld
> phys =3D <&combphy2 PHY_TYPE_SGMII>; and phy-names =3D "serdes"; be moved=
 into
> the dtsi node instead?

As replied in the earlier patch, the SerDes connection is board-specific
(some boards use combphy1 for SGMII, others use combphy2), so it cannot
be moved into rk3568.dtsi.

Best,
Coia

