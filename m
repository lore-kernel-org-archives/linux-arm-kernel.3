Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43741C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCQm3Q/ph03r/XdeQCWy2Yw7OKUkw0PP1SQeQ3TZ+Pw=; b=j5gSmDgla/TFctApF50KP6UL0E
	qjJVyIqjjs7WH7A2ksbJEIlMoKgxhHQarwQoPzjxk5gu2j5+OmfppFMCN60f5oYqwLEyPffrCz1pi
	gZyPsUUigUChKf+MVbKvoMAAcmLDmfcAB+hoxU7XUjVQQbZnQFGqKfvv/QxqvaCUyQMwiW2eGEA+Z
	I/tTHa32YNzhx6xRQuDGXyRIheVe72f1F+vChji/Lqs6/3lFPtja9bg6XKhnay4NDtXqmKi/53P9i
	W8rpxGsDVHVJsR3DU6tei7GUutyOv0E+4RC+cCRbLSVz+Xt1oWUjKNpAP83L96HIm9zj8PvVlshG3
	DwYusnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFFN-0000000Ezlv-41MS;
	Sat, 01 Aug 2026 19:19:49 +0000
Received: from mail-ed2-x0b.google.com ([2a00:1450:4864:33::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqFFK-0000000Ezkr-33Je
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 19:19:47 +0000
Received: by mail-ed2-x0b.google.com with SMTP id 4fb4d7f45d1cf-69e9826d38aso838606a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 12:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785611985; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcgT5lMV3hN/7sLZ1qrQRgdDr1k1aJ4/qTRWAmJr1Tk70DdAeJ1LOxocZfMjRV04UF
         2XJ/qLYz2q4tW7ndjvtvLtVj52vzWglUb88p98ZCwy7ZM9LkwpB3nQA77sGyh4UvvTGM
         xP80JLBmN1J/U6Th7/1MrvImHdN+2Lvn9ZvBSyF+SXuZPhlJg6rqtszrXER6tsGKGUPg
         Qzu3ATffOxY6nYYAZjdWzuoLftL/WGY8AKEg58+JXti8R3MaNPBtIYplDQFJheWmNVyO
         EskocEtEQmsYXL7VomgZmbt6nYMHOuz4sKF7/B4Kh4VWRfkzt8AFE3w+AQbTxjY2ew+d
         3A0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SCQm3Q/ph03r/XdeQCWy2Yw7OKUkw0PP1SQeQ3TZ+Pw=;
        fh=O1zlBcPJJaFb5hc6mVBVvCisSJ38HhuG57k9MhKRsIA=;
        b=L1bIgOTvfhIo4SuB006Lt8dzuKIKBsvNTsUZRuqW6Y27kVmAFrqnLvAnkCyItQY6UM
         IfoPlzgVd/4xoIgzjS9g5GSY+qqf5KVCQPS18j1+L8VRI0Iout9EU5Ip1xBJe3y6hLtf
         hFgyBzVoI/wbD9/oN6dWZCvftrPK1MN+q1mNvOpr/OxwClvtK1nFsTN7yiNm4AmJui4a
         mF+2dJ03nWjcPerTh0Ef+iQ1OkQ/AZd6K/dE09FBxVS3AUGCkNdsmHiPB731wFnGm93e
         ByJoi31QcJ6g9BHIAk35y9gJKK0y4Kzdrmx6hJ5f/5QoEevqyzC3r+PNxz1/P/P8HGpe
         IEcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785611985; x=1786216785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCQm3Q/ph03r/XdeQCWy2Yw7OKUkw0PP1SQeQ3TZ+Pw=;
        b=XMj92Rhr0HqHJ8atpvIpy5IToaXu1p8WVJTxR3+cJnQUb3WaPimiEgjOhzydNdE+dV
         yJu9gT2NDH0WEMig7EGjsBKdAVeIYsijh/r30hCQAQ8PleiagfTPiN1Vgrsl0uE8k1wh
         5JI0ZiFe+1cKydphez8smvNid/Za1fsQRAWn59KqhA9TsV6tR1ies6+NZb0iUhmsW4uO
         xs69j65GyTVMangMna1PQbvxPYS/1xTledZOg4mDU92gU825cWZwvWbM32OZQhdOMTRZ
         Q8ZHSLsNelFZle53E8mZ2Y2b0djgMsRaDK7b/xu323Im2MIjHaw8YH7Ri08upUn4/GNj
         U8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785611985; x=1786216785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCQm3Q/ph03r/XdeQCWy2Yw7OKUkw0PP1SQeQ3TZ+Pw=;
        b=AHp5i4oKEuH3EjI6eYGAqy7BLsZ4//gTE6sxiHoPQYSnzA8Oyq+n7nVis0FbAJWaDW
         MYCpmqXR9js08/xyTqx5cptNkEazeXCQA4nId18rpGKmVDUbFv25LPkMP8MBk1XcBXgT
         G+KLbElLwQCWt4SR5k8tSdmsnjck+X9YMcDHZBFfcaf/ClF38urVaNT5WloDJtZFFexk
         YuETCj7za9yajBTw1KF6eeSXgEEYk3ox3dLplY9quGY3/FYkDAKabAIhyHh6JjjXia1A
         XEwVsN0s5IYrjaHiCJNYbcf5pYM2fGwR0EYMQFZqLxiI7tiZSnEk+VxETd3ZTRobr07k
         IjTA==
X-Forwarded-Encrypted: i=1; AHgh+RqFcrAchZ4YyGA/E8/2MGQwtDW2FEBzOO/OuFpDFCQKV9/1W0wnuCC0k8PIqE1bUPTzvpBbct5tnhwwfBYnujZF@lists.infradead.org
X-Gm-Message-State: AOJu0YwPV4r95axXlau25i9Ep9VBI0QZyacuNVtIXLXrANBzn/Le1szx
	c+geU5+aBzezzJt155PfYzoawzj9/w8EyvXxIptlBvNNGw7B+eUp1WlvBDVY/U6BucxeblWCKgz
	9zlZmuRwy9VmgKgW23C5PWKmMcGzQrHI=
X-Gm-Gg: AR+sD10tM6gZXTOL9NABv8LBc31K4Y8zV+x79Qcw0jP20U0veIvZwWnYiTIUCJoajPt
	9J4OO5UFPHsf92behhINWx4duLg1HCQdSMRTD19PGgec0ypFdM+++DTQ2zmmIkLwuKDQ9EA8omw
	Ecd0SXZdrJmWvr+i7z/A6rCSUbYGISkSAorlxn9l+tA2sQtUor6NbqpI99zNAHd1qnArHMJZn12
	TT0jJwknwTvNCBGkdWcviNG1hOfyZkpK2xeCbWgtTr4koW8M3TuHrdI7MQzNLRVOcTxLJlSGDBG
	hKT1LwNGn8N5KtNebx+T5dG5A09mnaP7hLNBGRUY3kJ+t85rwfOYoLqQbEmL
X-Received: by 2002:a05:6402:440e:b0:697:f70f:8238 with SMTP id
 4fb4d7f45d1cf-6a0a7c6b76amr3103144a12.4.1785611984460; Sat, 01 Aug 2026
 12:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-7-coiaprant@gmail.com>
 <2847036.GUH7pLUipS@diego>
In-Reply-To: <2847036.GUH7pLUipS@diego>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 2 Aug 2026 03:19:37 +0800
X-Gm-Features: AUfX_mxTVYa8KO_KHMFv70Oru7_6E2Erl1Ah7ifU-aGIuPNS6S04bHqAgUqfw5o
Message-ID: <CALj3r0gqvFZPb2SKRMPwf9chCx076rwCnXEoOMFch_V-fOKV6w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_121946_832089_A407CF6D 
X-CRM114-Status: GOOD (  28.67  )
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

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2026=E5=B9=B48=E6=9C=882=E6=
=97=A5=E5=91=A8=E6=97=A5 00:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Am Samstag, 1. August 2026, 16:22:29 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Coia Prant:
> > The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
> > the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
> > interfaces via its four MII ports.  Add the XPCS device node and
> > its pcs-mii sub-nodes to the SoC device tree.
> >
> > The XPCS device is accessed via the APB3 bus at 0xfda00000 and
> > requires the CSR clock (PCLK_XPCS) for register access and the EEE
> > clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
> > PD_PIPE power domain must be enabled before any register access.
> >
> > Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
> > providing the 125 MHz reference clock for the GMACs when operating
> > with XPCS.  These clocks are used as the assigned-clock-parents
> > for the respective GMAC nodes in board-level device trees.
> >
> > The XPCS node and its pcs-mii sub-nodes are disabled by default and
> > must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
> > in use.  The fixed-clock nodes are always present and do not have a
> > status property, as they are static clock sources.
> >
> > The XPCS node also requires a reference to the appropriate Naneng
> > Combo PHY via the phys property at the board level.
> >
> > Signed-off-by: Coia Prant <coiaprant@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..989e164c0eb39 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
> >               status =3D "disabled";
> >       };
> >
> > +     xpcs: pcs@fda00000 {
> > +             compatible =3D "rockchip,rk3568-xpcs";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +             reg =3D <0x0 0xfda00000 0x0 0x200000>;
> > +             clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> > +             clock-names =3D "csr", "eee";
> > +             power-domains =3D <&power RK3568_PD_PIPE>;
> > +             status =3D "disabled";
> > +
> > +             xpcs_mii0: pcs-mii@0 {
> > +                     reg =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             xpcs_mii1: pcs-mii@1 {
> > +                     reg =3D <1>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             xpcs_mii2: pcs-mii@2 {
> > +                     reg =3D <2>;
> > +                     status =3D "disabled";
> > +             };
> > +
> > +             xpcs_mii3: pcs-mii@3 {
> > +                     reg =3D <3>;
> > +                     status =3D "disabled";
> > +             };
> > +     };
> > +
> > +     xpcs_gmac0_clk: xpcs-gmac0-clock {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     xpcs_gmac1_clk: xpcs-gmac1-clock {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> I don't fully believe those clocks are "just there" inside the SoC.
> Instead I _assume_ they are generated by some oscillator on the
> individual boards?
>
> Because as described there, they would be just magically be there.
>
> So please aim for a real clock description (likely on a board-level)
>
>
> Heiko

Hi Heiko,

Thanks for the review.

During my tests, I found that the 125 MHz clocks (`xpcs_gmac0_clk` /
`xpcs_gmac1_clk`) are actually outputs of the Naneng Combo PHY
(SerDes) when it's initialized for SGMII/QSGMII mode, rather than
independent board-level oscillators.

Since these clocks are part of the SoC's internal design and
consistent across all RK3568 boards, I think keeping them in the SoC
dtsi makes sense to avoid unnecessary duplication. However, I also
understand your concern that they might appear to be "magically there"
without any explicit dependency.

To address this, I'm considering adding `status =3D "disabled"` to both
clock nodes in the dtsi, so boards that actually use SGMII/QSGMII can
explicitly enable them together with the XPCS node and the
corresponding Combo PHY reference. This would make the dependency and
activation requirements clearer.

What's your thought on this? Would you prefer adding `status =3D
"disabled"` to clarify the dependency, or do you think the nodes
should be moved to board-level dts entirely? I'm open to either
direction.

Thanks,
Coia

