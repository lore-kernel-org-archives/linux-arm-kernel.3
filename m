Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1967A1125821
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeNXMDsnLCsfb/ggcSYfMHVBDtE5HCipWU9ndEZGSf8=; b=XUyRx35sAhSd8oqZhsUkyXem9+
	Ox9dwKpZGVDGA2tkzsbZRSzR2JWIullCbAfNbc8X7YRTr6bbl/P413dyyBsyFLE18NzOiDDUvtRmg
	r6AfJ4W+XgEg4Tvj/CovAPHhuOE7pED3b6B+N5+hwTjeBa/pJP4JVBTFbiMggEk3bRZBeqixsBfPX
	AbRkW4AQpQW9HmfXmhNeTZkHAjPWUqSlOb9kBv/+xi3kRs7Gw9mQQxjUKwkrxpY1i/r23oDZB5sXr
	d222doZm7o2fIlnmOEUU6qkJKRBVyLhHNKb6ytEvPJwg3QM41XQJ9FsUJ+CGiVPG/Cs1qLwHXUoye
	VhNPpx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0JrD-0000000Bex8-08oj;
	Wed, 11 Mar 2026 13:44:15 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Jr9-0000000Bevb-3jBU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 13:44:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b9434f706a2so621810266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 06:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773236650; cv=none;
        d=google.com; s=arc-20240605;
        b=lOMnF4N2wPoZyvJC943ql+TM6jBqjV2ai0bk1rJHwmfKEuNXrYC0OW218ECLPxFO4S
         HtCj2fAUOqKSvQIRKj1SDA3hwGSTg5YOTm8/nLV6YKYWCXQ5uskOw2r+2pcHrwFF6ak6
         l43puwEuIehDxlwwJvRl6vasxVjpg+Y9F2FLB8/9L8mBUBZSkU75/MW9W39DycDsURJt
         95mA3NffeHxJvX33yeAyenzQYA306S9mPFgDxo0YWdH2gkz3XsVUgyuHi1t0D8p0m+1H
         N/szpkzFGrRWmJFH27DoxsRuXp1LGR/cJkGuxrnKNScSxGRW9+CYlVSn5F9ChZf4kSpf
         OgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SeNXMDsnLCsfb/ggcSYfMHVBDtE5HCipWU9ndEZGSf8=;
        fh=yl851SqY8dLtIxogItMmoh52NYrMOBtId8PI3iKPKKQ=;
        b=RfjpA4tQ4cm0dijj3LxZOzCaEQlsWRhMF5ElVRZTfJwpxuY8mYbQNZyDsY2XXiipYL
         Cv7k6/JzaZwmUSAYsejb661mgMs1I9KyIU+6Rhh9XBSj+lfiPhZKorEobxlbuzr1COZ6
         GvWs2zI1LyfZ4S+M+coS/9rvw0RbcAtCTz+iCltnoXw06fx7Aguw1fiHceLAN4jRA6Px
         6xBnlQVx4nOGE12wYHzEH3D5PgyzmxnWrjNi4Am3BcU7MSIK099wTgVuBkcdDtg6t7eF
         s0nMq/37DSuEUMncxs5wxgLuSb3E41zpI1+0C2srRbU3D3zhxrKpMQjvDyl4XDz92wg0
         dOzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773236650; x=1773841450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeNXMDsnLCsfb/ggcSYfMHVBDtE5HCipWU9ndEZGSf8=;
        b=DgMUqVLzGvFVzHkcMbf3y8jr1A9WWhP534s3MEGKCiLJ1jGbKJFEYub+BHo5UtvNgC
         ylFJAgHEv9gL7gAmHDO6zYzNJwpe2dqaVod/hV4TIhNVTli50U7pn4YLehL3hyzSmEQm
         6QziRJXl57Yd7Z2hKkJ2aMIk/NchP00Ut3zBeWglkTOtuDV0esDZ2qYQRoDcfjjfYCNA
         Uqw66wunbaEbGwiOSlhWHUybrOiECuwl1+vsWz1CXOMUurjHWSjCwFhiP1+WZOytMOhd
         yAnDd5HkYeGiVu9w1hX7kpZC06yqZFf8wJ3O8a8CkEzwCFxhlHYdoTmCunL8luYzT7bV
         wggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236650; x=1773841450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SeNXMDsnLCsfb/ggcSYfMHVBDtE5HCipWU9ndEZGSf8=;
        b=p5kXPT+MpDsk3r6lfWegv3bpQiIOlPBMsSJtwn9iqz90ak4oYQXButYE5Ic+vepxQ+
         RSchSFHH4IsJRCWcrfhKxcQzEphvwPWVgBBnI0ln3Kc4uV6gCxl5nsXohIxsJtL4HmAP
         V5WdUJ4eUWhcrFB0iaYFhTnhOaDBgHFmLLhrtHOovwyfO6xcsbytZ+5QW210QwxTGLHG
         XMTvT0DvGk3IWz9ariHnWComMTnmr9dIcrwNOku2+sVlWw0aSPmmgcrw+TQWsBI1GEwL
         SgLzP+hGHoGB1cBEnx2eXvLOjADUhjyXnrqYAmuMO4TnpMHxFzpLBFs4E3V6bEFZDn0X
         ZCiA==
X-Forwarded-Encrypted: i=1; AJvYcCXzxS3TULQrk4lFxwUZQnLR4lJcawvL52nKnvugD62+zqlG9TVj0obVJKxeBvXTFhjUnP4G/kEJxi5L0JW+b8c/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp/eRezp8pxKA2NSWtmXeQ3sWaeQZGKh6/PqRlbzAX5LoZEFfj
	uEN3v9cN8AdmTJuV1/4nnqPjPMHvryHU1k/IokEX8tzB7wQ1dgdw1kF8CLUrcjkkKajh+7fWfbV
	8RXvi7MacpKgiB43Ja7kLSc+wqcJkClI=
X-Gm-Gg: ATEYQzylQfBnnIsW17DzFTaxBCDX60WMHh4puHAMsdkneedJ33VZCxKrRkFv5SlcgeF
	i8jqekv/JlZnALvm0YHbnDRnGia186b0EzG12T2Xh5pdfjOL8OnrrsxVdVuGfiW4tmkbyPS+xXJ
	qOxnzwQA/aNAUS0mNTw/o9WKh+xAFqRRjlAEvFpthG8uLbxHZWVx6UMcG8N71vN5E+lH7ENe+Tt
	jFqRwb6oNutFNGbxWZ047hx84C4d4CBmrCbTdyI87VkcqBNCqc7rvSQlwrsJLQIQWEyWGT9Lw35
	htDn+w==
X-Received: by 2002:a17:906:fd8c:b0:b90:8016:cfe4 with SMTP id
 a640c23a62f3a-b972e1b0254mr130356766b.10.1773236649325; Wed, 11 Mar 2026
 06:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260311115502.7353-1-linux.amoon@gmail.com> <cc922ebf-9221-00f8-e951-903c97d24f20@rock-chips.com>
In-Reply-To: <cc922ebf-9221-00f8-e951-903c97d24f20@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 11 Mar 2026 19:13:52 +0530
X-Gm-Features: AaiRm50TsCWew8aW0KhsUlFFh00uwvfJ5vuvS56VWFIF0mdSLhpfi6uwbavR56E
Message-ID: <CANAwSgT_Qb+Xoqg4ezZaYDBu81--=yhdvQ+cskumoMMh=J2ing@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588
 on Rock 5b-5bp-5t series
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Diederik de Haas <didi.debian@cknow.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_064411_991618_33B933E4 
X-CRM114-Status: GOOD (  27.42  )
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

Hi Shawn,

Thanks for your review comments.

On Wed, 11 Mar 2026 at 17:57, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> =E5=9C=A8 2026/03/11 =E6=98=9F=E6=9C=9F=E4=B8=89 19:54, Anand Moon =E5=86=
=99=E9=81=93:
> > Add supports-clkreq and the corresponding pinmux configurations for PCI=
e
> > ASPM L1 substates on the Rock 5B, 5B+, and 5T.
> > The supports-clkreq flag informs the PCIe controller that the hardware
> > routing for the CLKREQ# sideband signal is present. This enables suppor=
t
> > for PCIe ASPM (Active State Power Management) L1 substates, allowing fo=
r
> > better power efficiency.
> >
> > Cc: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
I verified the change by comparing the lspci -vvv output from before
and after the modification.
>
> It would be better if you could put the link to the schematic here(under
> "---") for folks easy to review. I paste it here for reference=EF=BC=9A
>
> https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf
Ok, I will follow this advice next time,
>
> >   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/=
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > index b3e76ad2d869..668b19c05f7e 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > @@ -468,7 +468,8 @@ map1 {
> >
> >   &pcie2x1l0 {
> >       pinctrl-names =3D "default";
> > -     pinctrl-0 =3D <&pcie2_0_rst>;
> > +     pinctrl-0 =3D <&pcie2_0_rst>, <&pcie30x1m1_0_clkreqn>;
> > +     supports-clkreq;
> >       reset-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> >       vpcie3v3-supply =3D <&vcc3v3_pcie2x1l0>;
> >       status =3D "okay";
> > @@ -476,7 +477,8 @@ &pcie2x1l0 {
> >
> >   &pcie2x1l2 {
> >       pinctrl-names =3D "default";
> > -     pinctrl-0 =3D <&pcie2_2_rst>;
> > +     pinctrl-0 =3D <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
>
> Isn't it m1(PCIE20_1_2_CLKREQn_M1_L in the schematic)?

I just used the pinctrl label GPIO3_C7_u as a reference to select this
one. see below.

[1] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/rockc=
hip/rk3588-base-pinctrl.dtsi#L1613-L1662

The RK3588 Technical Reference Manual (TRM) Part 2 provides the
following details regarding the clkreq# signal
pcie_clkreq_in/out_n    M0 PCIE20X1_2_CLKREQN_M0 GPIO3_C7_u
pcie_clkreq_in/out_n    M1 PCIE20X1_2_CLKREQN_M1 GPIO4_B7_u

>
> > +     supports-clkreq;
> >       reset-gpios =3D <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> >       vpcie3v3-supply =3D <&vcc3v3_pcie2x1l2>;
> >       status =3D "okay";
> > @@ -488,7 +490,8 @@ &pcie30phy {
> >
> >   &pcie3x4 {
> >       pinctrl-names =3D "default";
> > -     pinctrl-0 =3D <&pcie3_rst>;
> > +     pinctrl-0 =3D <&pcie3_rst>, <&pcie30x4m1_clkreqn>;
>
> The pin is correct but I don't think it would support
> L1 substates because the refclk is out of control. For
> any refclk coming from external clock generator, clkreq#
> should connect to the enable pin of the clock generator.
>
I did not find the external clkreq# signal for this #clkreq signal in
the schematics.

PCIE30X4_CLKREQn_M1_L  (GPIO4_B4_u) .

> > +     supports-clkreq;
> >       reset-gpios =3D <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> >       vpcie3v3-supply =3D <&vcc3v3_pcie30>;
> >       status =3D "okay";
> >
> > base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
> >

Thanks
-Anand

