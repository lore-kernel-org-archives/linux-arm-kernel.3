Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783C8C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xd4RtXYSQe4fX2yQzgQaQhaAGqt8/5t2s9pKA9e2Z/M=; b=qYfycycT+dES5fXmWkTfFpBnvl
	HKh0dOYKXfyPhmQI2PwLmUd34K0vMegBMFrkYmoL2HYnSkUtG4i1C37g6Zhkda6tZPN0A07n0goS7
	U8Pgv5SI6dN4AEI02fk+JGCQ+O1NYX2f7KdeTfgdkYhHjnXl/TbkPegPQKO6y6PfE05GH9i8OR5/r
	4QUX33z5Pb4YUkbX/6uGPUupAYwIXy3SLo0svhsFMXaNd3xn+I6V6wL+u+D2FVPesa/fPfcWzJNWc
	NwLEEQNyjAPECeiKteHrNB7w+3zxNS96U/Jo9NxUatrJu/A1rtSWsb39d40gLZvd4+HNgLd4EtioG
	1jVyXu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mQS-00000001nOv-43qE;
	Sun, 13 Sep 2026 15:47:28 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mQP-00000001nNa-3tOz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:47:28 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c294716dbf3so186856166b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789314444; cv=none;
        d=google.com; s=arc-20260327;
        b=F1MJRTOUE0Na2rJMJ7fGFA6KBmsYXKRo3QpJlElFTM5y9/z+dAq/hFpjnEPP1jcJpr
         DY0RkXOyb6mGc/4/qlrY7/lK7I0I8tBUO35L4DkMuBnT5Kch/X/9WIn7QAXrnUXrakAM
         yNry5Ku+wBmbU/6CP6bXsDpLBOsO8mMJjGTuB/kI3NJ07tRXLv+P/HcUkfMJ2nCPDXH9
         QYMcmWJhUKqK++2qXjhRQbPmqHafcGtAjUWyd06Y/zugUsRCoT1eK3Ls/+hV+OSPcbsp
         fV+YYu6mqcJQjJpw9PUJl6eOynl6fy+bOY89ofJctJf1XW+v1TPOVxeMZVrUUKiaoS3h
         OauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xd4RtXYSQe4fX2yQzgQaQhaAGqt8/5t2s9pKA9e2Z/M=;
        fh=nOO3/oFrruh2o3ikL6fisLWOeZW2deoen9mCfvqtlVU=;
        b=j1hgjGe1LtJRUbrHaFfCU5qKb+xKiExOFGQLZsA7QhWjKEpqAn3fyujfuO9gO/C+Cl
         GHi84MMHf6wPW+V1LSYaxtprYoJ0jolUsQ2jL1KqPP95mRGMcVM/6obmsTDpmHC2YdAf
         kihMbYjMM4T3hEUjO2+r+Ni6LuhIS/4cHTkYz3mJweIM7F2A2zwb0G43Xt9/chavM2OV
         647zR9LxH26Aq2s00F/yNvn17n/hsr397AubLyc15HKGZ5A9C14+wlF/AZCrZDx0bXHk
         3c0D18aacmlZleNhuyES876WbV7zaa/C6MjeTtAA4fY5Ef+HMruT1Ivt9MUDjcqsmOOZ
         xUDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789314444; x=1789919244; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xd4RtXYSQe4fX2yQzgQaQhaAGqt8/5t2s9pKA9e2Z/M=;
        b=jeH1xw/1hIjIYCXoK2I4CcR4x3LS+p4qpaBUn3IqW5jwC22yFPBAfdaNltTgGxusff
         R7qPXpsU5CsIs6EMI8R0ycMef8ElUre0henU/6rBGU/t1C7ggKSa8MY3VI0qstY4a/Ru
         OTjks994D8BjzDNiXsETXPPgbKmifC4AQgqqVBLfe0k1XVagshpbSiNE9E+dVEBJkPgQ
         K+4SZRgmuckEXHxS3Qp6YI0AMBnQdgQoMdIJWcHk/k1TLm927QsZ33yqArTzeyh5bWJL
         ALIrNkJ3gXw4E5c+0z038uRUNaqAtj9/lKFmhf81v/GYK0ZUwMbj/yJbJag9/nDIKH+B
         nLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789314444; x=1789919244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xd4RtXYSQe4fX2yQzgQaQhaAGqt8/5t2s9pKA9e2Z/M=;
        b=Cs4OQrtlc1MmOp+iWPM2ElI/O8gAkOqUdbDpZbz32gCY7Y4o1qtk4i4YrfqrWiJSq9
         2CGfCs7t4TJZkaCJJQj1t6Gg3ndwYaiozfGcIV3KP0UZLpDcJr89gnSeQuXL8peA7N9G
         1vpsnfl8hfjmDeGE24Bw0DlxoNrg3ssHdtmlDq0MysGGNyl2WLlXAiwZ2j+Vy3VZ+Ho4
         APaSCC8vYj3bhnb2RzR1Eg8RJy1A1WDVVk3IPs0xnpw9AnLuUfSn/l2Fb1G0OOGlUTAP
         7onyp2wBIKUBpUlRP3A6kQX0tciFYNofpZ1muQCKJj42ODLX1y2It6AIGk5kcCU2+1kk
         pnEA==
X-Forwarded-Encrypted: i=1; AKwUvBwKcwk6cEkgtMh4zNByTcIk4Hom7e16dYq4gJy1MTzsi3gp9hYqaC3OOVcmjtVz7FZDLFMDri57A2lj6LjazJd9@lists.infradead.org
X-Gm-Message-State: AFuF++n0ICdnH6moXyfsYiojY/dyuAPBV9MRpvRgrbcP3xzRSrOo8Cc6
	8A/m3JOx+vrKuOi2mQrJKzztNFxvPtrVu2TnlJDGtPVk3bxkdeEjPtFO18g4+ObxpaesOHKOi1b
	wMkuMn4YmeOBe0YbPG7vFk3kvozQZZGk=
X-Gm-Gg: AYBFou26PH1RhqrdNH0/DgYkKHrjpJhc2DZcgZti8BvvAn5FR+nuUmAg9H1tSJ9XCIl
	Zvvwc0r8kIlHmHOubJ8fTbBAtaxXdMPGBGLlyxvlPdGqAhuudLSCeZ1+remwOeJdApfsD+S8iA/
	8wlXOJdZUsv7fRCAzfG4tyNJhZFoa1b195vY4INav975oXT8MXXLPG8+gWXkSkSkMAKJHBng5WX
	l5gsnoSxh+6vRwovmtUIKFsXfiezDmZZ7kj99LHPad35I/q4O7Zr0Fqi+69VFUFm6ikdQnAeb5b
	Yu8n6W5hbl+LAgiMopEUaaE/rtmHQOmrTaULAkaHVz2fT4NBr/ronaPsCLfb+2nSAS89
X-Received: by 2002:a17:907:b049:20b0:c26:2f5e:29c7 with SMTP id
 a640c23a62f3a-c29856af6e3mr248244566b.7.1789314443704; Sun, 13 Sep 2026
 08:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260907153713.2572547-7-coiaprant@gmail.com> <20260912201325.127009-1-kuba@kernel.org>
In-Reply-To: <20260912201325.127009-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:47:12 +0800
X-Gm-Features: AcwNN1UukBh9R-kSgJT1DSG6HaucuFjaf0b71SnVjdkjmimZTMpjLzcMh3JEWAU
Message-ID: <CALj3r0h7ZQKPvMZbjpy0Cc=u0LvS+WAXUFNcsi+gWY9OxL+jfg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 05/10] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
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
X-CRM114-CacheID: sfid-20260913_084726_035262_5F7EF90A 
X-CRM114-Status: GOOD (  24.03  )
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
> arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
>
> This adds the RK3568 Synopsys DesignWare XPCS node (with four pcs-mii
> sub-nodes) plus two 125 MHz fixed-clock nodes used as GMAC reference
> clocks.  The XPCS node and its sub-nodes are disabled by default and are
> meant to be completed and enabled at the board level.
>
> A couple of questions about the new nodes below.
>
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
>
> [Severity: Medium]
> Does this node validate against the binding added earlier in the same
> series?  Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> lists phys and phy-names unconditionally:
>
> required:
>   - compatible
>   - reg
>   - "#address-cells"
>   - "#size-cells"
>   - clocks
>   - clock-names
>   - phys
>   - phy-names
>   - power-domains
>
> The node here supplies neither, and dt-validate does not skip nodes with
> status =3D "disabled", so dtbs_check should report "'phys' is a required
> property" and "'phy-names' is a required property" for every rk3568 dtb
> that includes this dtsi.
>
> At the tip of the series only rk3568-photonicat.dts fills them in:
>
> &xpcs {
>         status =3D "okay";
>         phys =3D <&combphy2 PHY_TYPE_SGMII>;
>         phy-names =3D "serdes";
> };
>
> so rk3568-evb, rk3568-rock-3a, rk3568-roc-pc, rk3568-radxa-cm3j,
> rk3568-wolfvision-pf5 and friends would still be missing them.
>
> If which combphy carries SGMII is genuinely a board-level choice, should
> phys/phy-names be moved out of the unconditional required: list in the
> binding instead, or should the dtsi provide a default?

As I replied in the earlier patch, dtbs_check and CHECK_DTBS only
validate required properties for enabled nodes, as confirmed by Rob
Herring. The xpcs node in rk3568.dtsi is status =3D "disabled", so
boards that include rk3568.dtsi without enabling XPCS will not trigger
any validation warnings. Only boards that enable it need to provide
phys and phy-names, and they do so at the board level.

The phys/phy-names properties cannot be moved into rk3568.dtsi anyway,
because the SerDes connection is board-specific: some boards use
combphy1 for SGMII, others use combphy2 (like Photonicat).

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
> [Severity: Low]
> These two node names take the deprecated branch of the fixed-clock
> $nodename schema.  Documentation/devicetree/bindings/clock/fixed-clock.ya=
ml
> has:
>
>   $nodename:
>     anyOf:
>       - description:
>           Preferred name is 'clock-<freq>' with <freq> being the output
>           frequency as defined in the 'clock-frequency' property.
>         pattern: "^clock-([0-9]+|[a-z0-9-]+)$"
>       - description: Any name allowed
>         deprecated: true
>
> xpcs-gmac0-clock and xpcs-gmac1-clock do not match the preferred
> pattern, so they land on the "Any name allowed" branch.  Newer Rockchip
> dtsi files use the preferred form already, for example rk3528.dtsi with
> xin24m: clock-xin24m and gmac0_clk: clock-gmac50m.
>
> Could these be named clock-xpcs-gmac0 and clock-xpcs-gmac1?  The labels
> xpcs_gmac0_clk / xpcs_gmac1_clk and all references would stay the same.

You're right, xpcs-gmac0-clock and xpcs-gmac1-clock do not match the
preferred clock-<freq> pattern in fixed-clock.yaml. I'll rename them to
clock-xpcs-gmac0 and clock-xpcs-gmac1. The labels xpcs_gmac0_clk and
xpcs_gmac1_clk will be match clock-output-names.

Best,
Coia

