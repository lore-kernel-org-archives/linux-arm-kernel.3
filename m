Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED442C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVEvLIPEcNpWvW+7WYHdCYmT4bTuxYZ+a3551AYtS/Q=; b=WoDIWyANj/uAb692azymoLlWic
	p+p1SM1n1sG2I6tNm7dH7xvSSYOCjgQIQpxCEjhn+YH7O5zPlVg0mtzQKphjxcXDEind+SdS5NA5W
	8jH8f2mkVBG+tbb7xDUSEluYENBlUfr1NxrC43mjtnFXTJRWi+kigwDUK6+6M55CJ9nuZ9/8BAOER
	j8goxc+jLfMSrvy28qwWvi+QCcy2nuGOhAFbi2EUQRXxkhq/mzIAOF+6Z0zPSrM+8QtThJ9keqnb0
	VSIcMEN4j45Gfg0kkYpn0TQwA0JV0f2TJOuqxPvp7gUMln0vWiZ67UYfHv43koZZah/VqFOpjWpcc
	+PeEmQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9UB-0000000CAxo-39tn;
	Thu, 20 Aug 2026 20:35:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9UA-0000000CAxh-1OjI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 20:35:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFDED44021
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 20:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA2E1F0155C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 20:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787258137;
	bh=LVEvLIPEcNpWvW+7WYHdCYmT4bTuxYZ+a3551AYtS/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hOg4onslcA38Hz1lx6d7G5Xr6jcrVkEEcFnoBs0zHrSlWtT5X5iddGpl09CaduWzo
	 PecB+yoWN/lPyN3F2hfFNxAS5JyU4onRiaKBNGmdN56nHSdPjjSc6UGl/gNhQeHgEW
	 QvI1FXqLJSl3wSwPJCd3jBLgliEx6yzqnEXgta8QhxMp9bezyA9acP4uB88mIp5A6i
	 /xBVDLen4o25gAGmhPTdGmZ66F0cGfTI2zVZRhNe+55Cgbxya6uSf9yeG4bd5CTgra
	 dbJBBxEhRBJSDTdf+xrPnCSvjXEQOzizXW8YCJtRteyJEkZXMOcbaCbwboXY+n08/e
	 Qsw9X5HhGW88w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeba09900bso243690e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 13:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvqlEclufPtnP15T1lOCTCYctSu/dNvnnIpK/P8mujg4jhaapAsRzT4h7FiHMpjczqnPZP+t9Y9NGXRlXkPHXr@lists.infradead.org
X-Gm-Message-State: AFuF++kZnsg5tjeQ5UizcjO/fgWYHrbQRD8On6aU+jlZee6up8zhhWdc
	wbXhnA/Gqja0GNRg2Pyz6M/xG7kGzAnzxdpyc10PVuTwec46TyUDJmolkHznIv07NTMh5HbShXY
	qNwih8e7MwXBQleCxksXO4Q7Ut4MBG/U=
X-Received: by 2002:a05:6512:8346:b0:5ae:9c19:165c with SMTP id
 2adb3069b0e04-5b4841e27d3mr252495e87.7.1787258136265; Thu, 20 Aug 2026
 13:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org>
 <CAPx+jO-ow2vo2wMxERLGse88wLoaR=HLdOWk6Qwv97ZdbE4R5Q@mail.gmail.com>
 <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com> <CAPx+jO-+hLsAdDC9Ep16cO52cA2c=xKeXvngkGqzoC0FyxXj+A@mail.gmail.com>
In-Reply-To: <CAPx+jO-+hLsAdDC9Ep16cO52cA2c=xKeXvngkGqzoC0FyxXj+A@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 22:35:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLnVsYhHjY5XB1kU8c-1bH4PGkR3quiEGVgkb_0_X-7hjw@mail.gmail.com>
X-Gm-Features: AcwNN1VO70LvbVfj0Q2UgJnPHtAU9I9kBvApsB1ktj4CqAz_-IVL1-eYcTJPSeg
Message-ID: <CAD++jLnVsYhHjY5XB1kU8c-1bH4PGkR3quiEGVgkb_0_X-7hjw@mail.gmail.com>
Subject: Re: [PATCH 10/11] regulator: db8500: Add power domain regulators
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Aug 20, 2026 at 12:24=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
> On Wed, Aug 19, 2026 at 3:30=E2=80=AFPM Linus Walleij <linusw@kernel.org>=
 wrote:

> > > > @@ -673,6 +673,7 @@ db8500-prcmu-regulators {
> > > >                                 // DB8500_REGULATOR_VAPE
> > > >                                 db8500_vape_reg: db8500_vape {
> > > >                                         regulator-always-on;
> > > > +                                       power-domains =3D <&pm_doma=
ins DOMAIN_VAPE>;
> > >
> > > Hmm, isn't this the other way around? The power-domains node should
> > > have a regulator supply?
> >
> > They probably have that, but that is not what this is about,
> > it's the other way around.
> >
> > > We may even consider to skip to model the regulator altogether and
> > > make the power domain operate directly on the prcmu instead.
> >
> > That is what the series tries to do, as a whole. Sorry if that was uncl=
ear...
> >
> > What we do in this patch is to deal with the fact that two of the power
> > domains, when enabled, also turn on two external power rails outside
> > of the SoC.
> >
> > Since external components such as I2C devices cannot really be
> > claimed as "being inside a power domain" they take a regulator.
>
> So with I2C devices you are not referring to the I2C controllers, right?
>
> Are you saying that these external I2C devices consume the same
> regulator as the power-domain DOMAIN_VAPE uses?
>
> I thought these types of external devices in general use a different
> voltage range. Moreover, do note that DOMAIN_VAPE also has
> corresponding OPPs (performance states) that change the voltage level
> based on the requested OPP. I am not sure an external I2C would be
> able to cope with that.

I did the mistake to trust the device trees :(

It seems all the device trees are buggy, because components
that should be connected to VSMPS2 from the AB8500 PMIC
have been instead connected to the DB8500 VSMPS2 power
domain... The one instance of VARM being used outside of the
SoC was a bug as well.

OK I go and fix this, worst case I add a fixed regulator for it,
it's an "always on except during sleep" type of thing.

We should be able to drop this patch entirely!

Yours,
Linus Walleij

