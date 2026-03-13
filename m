Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DBC105F7A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7w9iToPiAuzGu88WMIveHubY5MSgj9Fj9hiEM3gbv+o=; b=IefwZ/na4a0mhRzThIfNNgEiwV
	+WMlodT1dY4g+1h1QNAeQRHbI6X1uYqPkZlGSAO5XKoEnHb9S+KIXG0sxruZXAGsg+N2Pkw4IA0BK
	k0ui5GXP9WfvZi+JmKfF66VftxMWm37Tm/OaSuqD+YJKKmw0s9Q2PUAdrBJ22fLJ/ns+UVElYSWi3
	wIjIKOrVcluaFYJh/J/TIknxJloJ2mnqOMbmG76QBImYT5sGOWHDphbOoAe3vjkyE9BgU3lmgU4yK
	ZdUyjr4jaIh9AXHLTh5HGB8L3bpGf/YuN4IoRYnmAn3b4ADJY0x8iqzmS3P10YnIbxlbAaWDabwRG
	a99fYDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12XV-00000000EGt-0oFH;
	Fri, 13 Mar 2026 13:26:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12XU-00000000EF7-2rgo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:26:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E485660132
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 13:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B07AC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408411;
	bh=AISdWu8eVoLKl2jhVTe4EddyX7ECqkH20VxhG1FYrSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uwrZWzrVfHpeUB+OCnSFBHpLfCVLyREVSNNmz/haQVUWDBx/9Q45PkDIcCabwEMrh
	 rW0sibNFp8LiS3AAQMM3pLJsOu3hOqtXdgwO5QZQ8a3zQfOO2ROh3Ow6+GAUfPjHli
	 1/QcrcOuoJJE6AJdcvp5Wolly6LBX3lgsuLs+3AAajzMjC0k06Fhy0dxWdkWkAAudR
	 gZ6IhX0uLw0hPQ06A/Ji2XdzhOkyua2YI9B+Pc1AmUaRA0E9fvmHsTxRDehDakfO03
	 ImrQ6I1o8FjQ8QUq2ExbsnClXn1DUMdJUj5MyJEara0tYRvIDr1xRKjAkzHFZGPm21
	 1aPPNpZ5lrY0A==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-661b08b04deso2438944a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:26:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/GfanlqW/nHw/lY9V/e9Xlo73bbPlb1BImgycdrWAZhqAWlwczlh+ZvIvAPIIjfTMp7kVeD/9GQzucWynMpKA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt4PcWsS/TwFOslFpZNJLuNiSHuHApIzp9Uxpy/L+3DwRiljye
	qrMTkBT6QmhgciyhbVvu63U+iZkDqIzu+LVOV9qkez+ZIlTCW5/rT592aQacy+C4+6zz8LUXvdy
	F0IxxfQJ2AiOp+BEPliC1lBLS8qw6Jw==
X-Received: by 2002:a05:6402:1e91:b0:662:f822:d932 with SMTP id
 4fb4d7f45d1cf-663babbef8fmr1820274a12.15.1773408409847; Fri, 13 Mar 2026
 06:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
 <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org> <20260312151228.GA3136988-robh@kernel.org>
 <da0726da3e59d83985650e8281ed945018a356e4.camel@linaro.org>
In-Reply-To: <da0726da3e59d83985650e8281ed945018a356e4.camel@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Mar 2026 08:26:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKeSimB6OYFzOk2tWy-nbFez3qRwWrc=yD8uKDALYP8pA@mail.gmail.com>
X-Gm-Features: AaiRm50TuMWj7Ra8O56XpkSkM3G2RRk4u3p-yrp2uk72zHKmMKKqGtQffs4TDX4
Message-ID: <CAL_JsqKeSimB6OYFzOk2tWy-nbFez3qRwWrc=yD8uKDALYP8pA@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
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

On Fri, Mar 13, 2026 at 5:48=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> On Thu, 2026-03-12 at 10:12 -0500, Rob Herring wrote:
> > On Fri, Mar 06, 2026 at 10:29:55AM +0000, Andr=C3=A9 Draszik wrote:
> >
> > >      system-controller@17460000 {
> > >          compatible =3D "google,gs101-pmu";
> > >          reg =3D <0x17460000 0x10000>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <1>;
> > > +        ranges;
> > >
> > >          google,pmu-intr-gen-syscon =3D <&pmu_intr_gen>;
> > > +
> > > +        pd_g3d: power-domain@1e00 {
> > > +            compatible =3D "google,gs101-pd";
> > > +            reg =3D <0x1e00 0x80>;
> >
> > I'm assuming 0x1e00 is an offset from 0x17460000. That's not what range=
s
> > says though. It says both addresses are in the same address space
> > (system-controller@17460000 parent's address space). You need:
> >
> > ranges =3D <0x0 0x17460000 0x10000>;
>
> Thanks Rob! On gs101, the PD driver can not do direct mmio. Instead it
> needs to use the regmap that the parent has created and apply the
> offset from the PD's reg property (using struct resource::start)
> (patch 7).
>
> When using ranges as per your suggestion that doesn't work anymore,
> as resource->start isn't the offset anymore but the final physical
> address, and using that in combination with the parent's regmap
> doesn't give us the right address anymore.

You are mixing kernel implementation details and h/w. Are the
registers in the child nodes MMIO or not? If not, then drop ranges. If
they are, then what I suggested for ranges is correct.

For MMIO, your kernel implementation options are what you suggested,
do a regmap for each child, or use of_property_read_reg().

Rob

