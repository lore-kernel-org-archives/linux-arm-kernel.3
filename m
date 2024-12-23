Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DD4E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp1YxkvsR/8CN00+dpyPmbcZfQP2ZBedcDMsnGRxi5U=; b=EuGT9lG0X4kMC3+rFTihHSPOhD
	JEwRfboUsXAcZjiPfbMXr7dtXdT+x+ncK84gi5/+DKFO5RkxynRQLBzP7KwpIDe6AfWxVpNCZyNxM
	IwWnRv7DtnqtGNY26sp4aoMEpLbSWBkfQkZJIK6FAbfiZLogY53Ef+rou0hTQOaL/BXpzTzO+32nR
	k2qavI3RrS6M1LGYSkXzkOZ8UQS06UYVE1d5MdjldmZCSOrs5+CKhVChF7q1iia+uXMHFZAKSpwBo
	l5C/1fHkBY1jcQhh0Ep/5MDUOUmxeI+MxQTeWCnUq1u7reTCi9u2B0d9pNzVUCSULTFT7eHlbFh7s
	WOlzVC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdMj-00000009Yiy-49EH;
	Mon, 23 Dec 2024 08:00:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdLW-00000009YYx-1X9t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 07:59:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so44267205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 23:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734940760; x=1735545560; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fp1YxkvsR/8CN00+dpyPmbcZfQP2ZBedcDMsnGRxi5U=;
        b=oH4jQrjAbjtSmZIKoz05iCUeAoaIOAM4Fb9q63tTFFonlrJo04Txp1q2JgbNc56f+7
         AEZb+GDq1sD8s3MqEIWOkrCQPKXuCryTsXXoNfoOwLdEw3Lm8rFhvrZ8Fx4v229VeK1s
         MwmSMOKBUQPf0oMwl6rUzZJJc6qBoIylwCDLFIxxsIGGgdw1EjziB2lnIj2RDpJnil11
         BZPONzRT/dPAL9d6nq8ATdRujHBzufOsjm3ZmmXlW64OnPasE7oQSoXon66yS2JXNufe
         JRgN1pm1l24z2lqZtbhWs/e3TA8Lu23rl1mRzNr2ZYUWvKDn/pot0Zt+PGMlfINnVO0l
         BXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734940760; x=1735545560;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fp1YxkvsR/8CN00+dpyPmbcZfQP2ZBedcDMsnGRxi5U=;
        b=vKWaXRWO7niVqQkfDGurP23F2BRTNUQU1UNMiGvb+P60RSF1xk9ahZXxg940KjGNbs
         6w7Qbixp3ahRharTjvLnxGr8lyyukdREdX+vDZbMJX8R8xuY8T/jS2SGuV6RRO1Xay2R
         Ux256Y8YUQWu2FTXusSVnKJVDs+eNbIu6ye1DvZYXj2seLxTUSz9eZ6U7XJr9cSI2AXz
         /uJRE7n4GUbW35yWnfA+ly8HU5ZkqVP8S4zneIRlUPjADvN7KWYtBKusVityVebYhMNS
         Lqr315hehYMIwjRZ/md8SrmQzb0Dt5+Hj2p8o0I1F70aflYzxAxM5zwePkqCr67C4Ioo
         Waqg==
X-Forwarded-Encrypted: i=1; AJvYcCUynsvQJ/kGmdxyJ44Q1SobiRxuvpUxawmx5fXLKx7hCNG6bKHbP1PIH6EEsLZxA4QsdJFphGzB438AwEtc0e3L@lists.infradead.org
X-Gm-Message-State: AOJu0YxAiuHrcTTNHBJ9woSt3aBFC5MUjAmiRZDpZXVWi7keRxEyhlUE
	E/Kk+cyRRfx56/VtlIcHWYGXGrPKapuulIjGQaFNW0I3nLPcYL3TvfYdm2GtHKY=
X-Gm-Gg: ASbGncueZoIN8KYKWMO+AmQ81tkDRXnTRErx4ExAIJM+m9RIuR1Qd5DjfTN3EbyH+b1
	k4hHf3+H1ytpt0dBtycvrx+/ZcmiOaXH/GYaBgROO/c4qw2+sIOAy+4XLZ7NFxdjwuSNE7zueAi
	XGUSgJ/oGUUBWgd0BXruu443TOFdeXyDK4ht+Px31ExRR2R1hyZGmPK2/0X83lWl80mDViVIOjJ
	3EasoK0+Ds8GBmXXYEkJGDzcbJyje4u07/ityU6YiodVItxb+UugVM2XkWNcw==
X-Google-Smtp-Source: AGHT+IG+7q2Pk6kjCGK7xP+YYvFm+gtX/raK0+U2VnVE+LPf0nz5Qeq7UKxPj3BRYbDVBrwjQeR9hQ==
X-Received: by 2002:a05:600c:1c99:b0:434:f218:e1a8 with SMTP id 5b1f17b1804b1-436686476eamr98549695e9.19.1734940760198;
        Sun, 22 Dec 2024 23:59:20 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm126855745e9.27.2024.12.22.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 23:59:19 -0800 (PST)
Message-ID: <e85505c808661bedf2cca2433ef4c06038505a5f.camel@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: exynos: gs101-pixel: add generic
 gs101-based Pixel support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Date: Mon, 23 Dec 2024 07:59:18 +0000
In-Reply-To: <33c7a520-dda9-4d3c-aa27-2f48786996a9@kernel.org>
References: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
	 <20241220-gs101-simplefb-v2-2-c10a8f9e490b@linaro.org>
	 <33c7a520-dda9-4d3c-aa27-2f48786996a9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_235922_418368_41100CE2 
X-CRM114-Status: GOOD (  36.15  )
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

Hi Krzysztof,

On Sun, 2024-12-22 at 12:42 +0100, Krzysztof Kozlowski wrote:
> On 20/12/2024 12:27, Andr=C3=A9 Draszik wrote:
> > In order to support Pixel 6 (Oriole), Pixel 6 Pro (Raven), and Pixel 6a
> > (Bluejay) correctly, we have to be able to distinguish them properly as
> > we add support for more features.
> >=20
> > For example, Raven has a larger display. There are other differences,
> > like battery design capacity, etc.
> >=20
> > To facilitate this, we create a generic gs101-based Pixel DT that can
> > work on any such gs101-based device. At the same time, we move the
>=20
> No, whatever insanity Android has there, please don't populate it to
> upstream.
>=20
> There is no such thing as "generic board" thus cannot be a
> "generic DTS".

I'll rephrase to gs101-based Pixel base board. Unless you have a better
suggestion.

>=20
> > Oriole specific parts that we have at the moment (display) into an
> > overlay, making it easy to add support for Raven and Bluejay in a
> > similar way.
> >=20
> > Note1:
> > Despite being an overlay, we instruct kbuild to create a merged
> > gs101-oriole.dtb and a gs101-oriole.dtbo. This way existing scripts can
> > keep working, but it also gives the option to just apply the overlay
> > before boot (e.g. by the bootloader).
> >=20
> > Note2:
> > I've changed the simple-framebuffer node to specify the memory via
> > memory-region instead of reg, as that avoids unnecessary duplication
> > (of the size), and it avoids having to specify #address-cells
> > and #size-cells in the chosen node (and duplicating this in the DTSO),
> > which is otherwise necessary to keep dt_binding_check happy and DT
> > validation working in general.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Note: MAINTAINERS doesn't need updating, it covers this whole directory
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++--
> > =C2=A0.../arm64/boot/dts/exynos/google/gs101-oriole.dtso | 33 +++++++++=
+++++++++++++
> > =C2=A0.../{gs101-oriole.dts =3D> gs101-pixel-generic.dts}=C2=A0 | 24 ++=
+++++---------
> > =C2=A03 files changed, 47 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/bo=
ot/dts/exynos/google/Makefile
> > index 0a6d5e1fe4ee..6e6b5319212a 100644
> > --- a/arch/arm64/boot/dts/exynos/google/Makefile
> > +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> > @@ -1,4 +1,6 @@
> > =C2=A0# SPDX-License-Identifier: GPL-2.0
> > =C2=A0
> > -dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
> > -	gs101-oriole.dtb \
> > +dtb-$(CONFIG_ARCH_EXYNOS) +=3D gs101-pixel-generic.dtb
> > +
> > +gs101-oriole-dtbs :=3D gs101-pixel-generic.dtb gs101-oriole.dtbo
> > +dtb-$(CONFIG_ARCH_EXYNOS) +=3D gs101-oriole.dtb
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dtso b/arch=
/arm64/boot/dts/exynos/google/gs101-oriole.dtso
> > new file mode 100644
> > index 000000000000..43572039cd07
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dtso
> > @@ -0,0 +1,33 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Oriole Device Tree
> > + *
> > + * Copyright 2021-2023 Google LLC
> > + * Copyright 2023-2024 Linaro Ltd
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&{/} {
> > +	model =3D "Oriole";
> > +	compatible =3D "google,gs101-oriole", "google,gs101-pixel", "google,g=
s101";
>=20
> Boards are not overlays. Board equals DTB.

You're saying this should move into a dts instead of dtso?
There are numerous boards upstream which use this same dtso
approach.

There is a base board, and also different versions of it,
oriole being one of them.

[...]

> > 	};
> > =C2=A0
> > =C2=A0	chosen {
> > -		#address-cells =3D <2>;
> > -		#size-cells =3D <1>;
> > -		ranges;
> > -
> > =C2=A0		/* Bootloader expects bootargs specified otherwise it crashes *=
/
> > =C2=A0		bootargs =3D "";
> > =C2=A0		stdout-path =3D &serial_0;
> > =C2=A0
> > =C2=A0		/* Use display framebuffer as setup by bootloader */
> > -		framebuffer0: framebuffer@fac00000 {
>=20
> I don't think this exists in current source. It does exist in thing I
> was applying, but then this does not make much sense: add a framebuffer
> which has to be changed, because it is not correct.
>=20
> I'll drop the framebuffer patch.

The framebuffer makes sense for the oriole version. I can fully remove this
node from this base board here, and just leave it in the versions.
That said, can you please expand how having a 'status=3Ddisabled' framebuff=
er
node is different from any other nodes that are enabled or modified by
overlays?

Cheers,
Andre'


