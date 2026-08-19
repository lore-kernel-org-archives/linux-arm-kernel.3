Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E65C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy+D+ESTTq/dSV8mhmm+rhMC+Crd5u0rz0n4yla+hGs=; b=4GUOskfTb3nu3ARAccFzOu3WDe
	EpJR6dFe/hGnqjQHKSgDRBD1vAkk0QRUYEjg+9ragptvkLbIyH4hRC2GwnqjVeJ4BTxeRCmMFcjCS
	IdkhB+0Ts+KazifuVrtxWBieFNCyJmfAqSFyn/80Qcu+3aDKozoBhi9uDTvEkhd6bu3acP6DnytnL
	X4bcByF6OsUPOzfD48MZvCmlC78VbacsJQop/slYGZz5wpKDxn6CkXplmNse3D18+cH0K6yYrbQRD
	KZEwdWyACZIUl3SZlKfHOIIa6Gp2HC26L9DNPAHiycGNlyBoqWK4lNMsTgCKbXRiWfKBroOcfXwkj
	3+oojOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgNR-00000009sPP-1Kpt;
	Wed, 19 Aug 2026 13:30:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgNP-00000009sPJ-3ho7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 13:30:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4166E4401A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 13:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295F51F01558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787146243;
	bh=Wy+D+ESTTq/dSV8mhmm+rhMC+Crd5u0rz0n4yla+hGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aPUasIj9J9ETAKkXY+xz3TK125/aXZYjKzFmuOkfbiiU6/19xiRkGoYKKBAsT8WxR
	 QBKYCqbs49DV3cgMcXgHT6zGootPM+lszjhmfFD9fcpQYefWkk1lRr56QoIqqH6iEN
	 rC6xB0mB9mkb1GOgRBaXc5IY5EMSRj8qW60VDICji5wM+RBJQog6XmfZXcVUfrNZVL
	 tI0TyZHQ+3I+wgbDVL/bPi+wsJQha090rSdqoQfAnpwtw64dUr2Wd12xOYZ93ECvLT
	 4oLbcbZ+qzeRb0Yb/VtQi4oH7EvFBO6jE2r5JxA6u49vhaerF/9ndVpaKe6aShnILS
	 GQJEhWHiA5uGg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b021916bd3so1526889e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 06:30:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RorFx0jswXNEfjaP1AEWu3lRe0F+kN/cnayx2i+6SwikUlBX0q5QtDKVCdarl3REz+SfrgVif8fwpJ8PKp3WzU+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9OLVpYNAiUSxeGo/PoX2SkeeklEEiicHAf0Wzy1/Vfz24ptTd
	6QIuLO8JmwprhZhaSmyjRX39RLq6mrcXExCmFFuHXHo3pcK1O3+d4mRk0g9vqjoXPC4yTo+zILh
	1SXo+63gDyxMrd/JH+VNayDJyOAT+AYE=
X-Received: by 2002:a05:6512:6d1:b0:5aa:5ef9:a33 with SMTP id
 2adb3069b0e04-5b478bdb85fmr1801632e87.25.1787146241774; Wed, 19 Aug 2026
 06:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-10-eb5e50b1a588@kernel.org> <CAPx+jO-ow2vo2wMxERLGse88wLoaR=HLdOWk6Qwv97ZdbE4R5Q@mail.gmail.com>
In-Reply-To: <CAPx+jO-ow2vo2wMxERLGse88wLoaR=HLdOWk6Qwv97ZdbE4R5Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 19 Aug 2026 15:30:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com>
X-Gm-Features: AcwNN1VzmKR08mtjCfHfPMShMvTxNHeVOcLQxu2aSZ4UbCwVZegKiNNfpCmjf24
Message-ID: <CAD++jLnzDmxW_SoJ9H1tS2_r+jd7A7FpLVp37nK=dOEPj=GExA@mail.gmail.com>
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

On Wed, Jul 8, 2026 at 5:53=E2=80=AFPM Ulf Hansson <ulf.hansson@oss.qualcom=
m.com> wrote:

> On Thu, Jun 18, 2026 at 7:01=E2=80=AFAM Linus Walleij <linusw@kernel.org>=
 wrote:
> >
> > Add a DB8500 regulator driver for the VAPE and VSMPS2 compatibility nod=
es.
> >
> > Back the regulator enable state with the corresponding power domains.
> >
> > This is done for off-chip consumers: the corresponding voltage rails ar=
e
> > routed out so they are used for powering different peripherals using
> > these voltages as supplies.
> >
> > Assisted-by: Codex:gpt-5-5
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
(...)
> > @@ -673,6 +673,7 @@ db8500-prcmu-regulators {
> >                                 // DB8500_REGULATOR_VAPE
> >                                 db8500_vape_reg: db8500_vape {
> >                                         regulator-always-on;
> > +                                       power-domains =3D <&pm_domains =
DOMAIN_VAPE>;
>
> Hmm, isn't this the other way around? The power-domains node should
> have a regulator supply?

They probably have that, but that is not what this is about,
it's the other way around.

> We may even consider to skip to model the regulator altogether and
> make the power domain operate directly on the prcmu instead.

That is what the series tries to do, as a whole. Sorry if that was unclear.=
..

What we do in this patch is to deal with the fact that two of the power
domains, when enabled, also turn on two external power rails outside
of the SoC.

Since external components such as I2C devices cannot really be
claimed as "being inside a power domain" they take a regulator.

This is based on my understanding that power domains is an
SoC-internal concept only, so there is a clear boundary if something
outside of the SoC starts to use such an externalized power rail.

All this regulator does is to make sure the corresponding power domain
is enabled when the regulator is enabled.

I will repost all the patches once v7.3-rc1 is out.

Yours,
Linus Walleij

