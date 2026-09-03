Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9C5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OzrPp0LDUlFbdGUKdXll1Tt+URbjSi3DsD/mLXpEpkc=; b=06Ih1d6J2Tei4rrT1P/27aYuEd
	g3nwneGfkYtXkf00snI7infN11XlYGc3kzzAxkEDKxt3rJsbOtR/vs+O0EunocHanf7XIBhIb8v62
	LH/GnIG5Vpn1E4NIcvDBW//qftXxqftSthJdSWYmUzib3gYZZotnubvJVue5IY3G4pCLv8p3gYbkE
	E3XkEE9G79fIxHl61RPRUKQ7gbmgm7LfCqH7x7aGgNn12RhrEaNtY6WooQtX0B9068wiTg+17hdfx
	jl+fqT+FIuYSqSWae1OnFif7i3Yt/geSmm6L3ms2gWGClZCZY10wbcVu23ZGuGfv/xDJM45QFqrDu
	WVhsbRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CP3-00000000NeE-31tb;
	Thu, 03 Sep 2026 18:43:13 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CP1-00000000NdO-0OW7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:43:12 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-90cdffe8e3eso2219836d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788460989; cv=none;
        d=google.com; s=arc-20260327;
        b=aG/UQNKSkD4N7xvl2qwyaRxOWX9MG2dDQimM5FAjs5SClc+Bju8ajZk7RPfloiZu7w
         l6EF+suL1tFuPJulQn283bZ1S0KGSEqQuFczT5JUWAu2TwkkZDTOgyfu+9OwOjlnCw3y
         s1rmgP6Mu1eyVZkb1tkB/PARfhJIlop2vCgp/cGkiUHdGMwrCdoaXBuswwYQbET3yIpj
         TULjKUKNY8rmnBfU6xk7CBrPlyIP36DzPpoAwqzp+2svbrHlb8kAuDo2Iulv8YghU07T
         dMib09PzFG1laeLqFSKjLdlF3gd3nfURX/UrYNmzcv8h4jCrkxGzH7oLt4lzqZfemflI
         l5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OzrPp0LDUlFbdGUKdXll1Tt+URbjSi3DsD/mLXpEpkc=;
        fh=CVzL6tDGDL+HAICxEB5kp3lH29xQJfLmCtPYl8cKvTA=;
        b=bZ+nEDZ2bE7uwQhCq9uURgmZyhRR050EyF1ny4koqrBNLct/UYHuGU6Lro76BgHFgy
         n3+UeVDkwkRwFmlvxQRqr5Xiv8Ae03sdswTCMuxAz9fp30NQxt6R2ZudSrzL7/5s3qXf
         D6jI4qHzkzRIo/8j08rg3n3XNxFIN99tHBe3ehOzjm/IZKeFXNH0f/dTtfPNQW7d2xLZ
         jK9E16BndeKb939Ao6SGwdACElmm0cmzNmOa8k5B6ELCsxJZgRPXMvCpKXvMKtlPx0Ky
         9EO5dnXtXH7Shl5weZ7no0Ulc8fLJzqFcIWA1e+zCe0AoPTb2H1iL2yPqx5LgG3Dw7xB
         7rJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788460989; x=1789065789; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzrPp0LDUlFbdGUKdXll1Tt+URbjSi3DsD/mLXpEpkc=;
        b=h5geqPVAUbZIgoPFIKLAFQ7BIf40blfVth9GGcksR7xu2MlYtAgNxdahQWkP4a1SlR
         5Lf+hPj2Al93ZE3JEMTDgxh1f8In5Zk5mRkdA9b7+0jMqrmvm5xUcZKUa/hqUeQXth7E
         qjMDjQuEx2+rGMiu++LS3HVfgKTHRlHt/40XlnuKUt+C1W9cL4xhYpQIJ58TbcbtQyJb
         cZs6+teyYeM8XWQ625hHh2hOlDgXNFt7Ul3YFv3ToXdiXkMsWPLJF8PTCWFlwRuuR8CK
         dOUL1lYabEokqQXBZFTG5rNK12PGExoJGy6/5jTbDuU8pLMOGSYsUXQqEzvnm1EvZzss
         acDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788460989; x=1789065789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OzrPp0LDUlFbdGUKdXll1Tt+URbjSi3DsD/mLXpEpkc=;
        b=Y7wkD1LP8lgeMOVjG2xZ7NkLTKvvOZsMpnEi8AcC2sFbRXqAP9sPNB4cw5ETlXNqwD
         0ALnyE8/+VQ5NvWbZYOcEvkZnMRqLsFWM5P4uCVAS/Df5pjfI0fbbKBZE5tP5kHchnK/
         9Isu+CubP3+YhjOKonHurquCo95HVLYVWVaQzadK4Kujn1dEs8OpyXjFHdaOkpScl45m
         C1GFt+CLJ17ErKDe2wPhFyHaszd6hO/RaFqaotgqRIVFkDQoasHO+QJ3eBqFs6tmr99m
         e17gtRxXANpNEiiA4FwatyfxT/TSupM+7Pb+hboYKrVJ/xj0MjUxy8X1A2GgeYDsLc1w
         /a0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/aiMjpSRA2SVqN+GiChJG/zlYDJe7+umWIUJ8E+dXbabcsH1XYa80p7UhiWhDpXJbYqSp84ZVxBzZ2mCNZIy2@lists.infradead.org
X-Gm-Message-State: AFuF++mAMDbAiGr3Qo1UU7JiE+zHX4JhmgCc084TUU7f/0ffra4i/m/j
	jt0og5rybnjx4Kc45rEtPGu0ZnK9H3RW+BtOXnVzNz+siAiu+9M09dGSeZsa8TpWIelo3tpKYnr
	RpS463MImINEPQULOJWsobOIg2zoTwIs=
X-Gm-Gg: AYBFou1txFuHKDua06gJ/4IjrMmfw8vZ7i4qIwjMhbNjO7aNhSHxXc9joPD/0BePSWA
	zZo5jGMSZigbYmXc9yEXADRW5d8wwwYf/RDEEyd/35KbZzKQECEM66XGj3lvA3Wbd9cjJo/4Xof
	TYyzpkA4MiMvado3zR5mwkQTNvieCJisxt+e2ivhYW9FzJstRBiqoWMlpTzJVP9vhYaxLaK7sGM
	Ws4nH9yTc59bYDd3wIDjxFGVPxe2pyNQdiEQhoR3wznuGUJBHmZx/W4Pbn4oFpaSbQnghnWcrLg
	HsZ4405Wjvwy5WDf/7NuBVzCT5qCHJ4yNrdIbHknnq2ZDyzfF6Nxu4OfCSAsYkeBB3AUv4ecD4k
	j/zaB0pyzrILbT8JMwmJTqlZyGfNuiRfCWkZceGY+dEEawpETFWgbNbuKeTXEPopWeXLY8Bxf2u
	Ti4JyqOlOD8H00pAv4bvwHcS1cO2lXdl12WrrINXs=
X-Received: by 2002:a05:6214:6284:10b0:910:cd4:23d with SMTP id
 6a1803df08f44-9103efc9476mr11569596d6.1.1788460989178; Thu, 03 Sep 2026
 11:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260802145109.728793-1-pbrobinson@gmail.com> <20260802145109.728793-3-pbrobinson@gmail.com>
 <apl6RddLcPz8Q2-O@apocalypse>
In-Reply-To: <apl6RddLcPz8Q2-O@apocalypse>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 3 Sep 2026 19:42:56 +0100
X-Gm-Features: AcwNN1VRi1a96Gg5w55HlJytQ0F6dgSbhL00dJcOBGvdwm_16-SGGl6OEiE4mpU
Message-ID: <CALeDE9NCSb_-DugUBkpa3iBBXbFxccfpt3gKw0-fN8czwnurSw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_114311_145910_B8E7FEA7 
X-CRM114-Status: GOOD (  19.95  )
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

Hi Andrea,

> > The thermal sensors on the bcm2712 (rpi5) are the same
> > infrastructure as on the bcm2711 (rpi4) so add those
> > details so we can get thermal monitoring on the device
> > as it can get quite hot.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 32 +++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > index ae1fc9d728c00..c73ed9e066662 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> > @@ -508,6 +508,18 @@ hdmi1: hdmi@7c706400 {
> >                       ddc = <&ddc1>;
> >                       status = "disabled";
> >               };
> > +
> > +             avs_monitor: avs-monitor@7d542000 {
> > +                     compatible = "brcm,bcm2711-avs-monitor",
> > +                                             "syscon", "simple-mfd";
> > +                     reg = <0x7d542000 0xf00>;
> > +                     status = "okay";
> > +
> > +                     thermal: thermal {
> > +                             compatible = "brcm,bcm2711-thermal";
> > +                             #thermal-sensor-cells = <0>;
> > +                     };
> > +             };
> >       };
> >
> >       axi: axi {
> > @@ -724,4 +736,24 @@ hvs: hvs@107c580000 {
> >               interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
> >               status = "disabled";
> >       };
> > +
> > +     thermal-zones {
> > +             cpu_thermal: cpu-thermal {
> > +                     polling-delay-passive = <1000>;
> > +                     polling-delay = <1000>;
> > +                     coefficients = <(-550) 450000>;
> > +                     thermal-sensors = <&thermal>;
> > +
> > +                     thermal_trips: trips {
> > +                             cpu_crit: cpu-crit {
> > +                                     temperature     = <110000>;
> > +                                     hysteresis      = <0>;
> > +                                     type            = "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling_maps: cooling-maps {
> > +                     };
> > +             };
> > +     };
> >  };
> > --
> > 2.55.0
> >
>
> Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?

It should apply cleanly against Florian's next branch here:
https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next

