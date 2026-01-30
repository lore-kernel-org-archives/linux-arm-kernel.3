Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2C2D73EBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 05:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlTV89wrXWzzojHmqRNsNeMryN5g+8W1Ft/Vshjb7sg=; b=nY6OlW6sCjxODkbk5nm3JGhdP0
	TUkGu7MGN+23cgc0yDYwzUAoIJZc5W9G5gJ2kCou9/+FXoEMystLjcYAsdvDKOtIv89EUjIUDiNHQ
	3IlX3Phip6jXOgXNjpH7hM1+s9gCb8znagQif4HRPb+PavJ6WzCkE327Hr5v/G8pPQ+V5HH0b68Rs
	0AmbCVvNlEGgOEgdJ2hEwAmha2aTv8ma9RnATGa9mw40wNJDrHt+g9EAa0xrQrGdFXzs8zfYe3Cy/
	obg4RNUAQIm6T/17nSRJxgLDfw2OxfjqB0t4x+OSbbLIJh4KGznw+8Ni2+5AVmNzrMcpAFZNYT2Ns
	D8TbC+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlhEl-000000013oQ-0n5Z;
	Fri, 30 Jan 2026 05:40:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlhEi-000000013o5-1PJ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 05:40:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-435f177a8f7so863678f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 21:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769751602; x=1770356402; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nlTV89wrXWzzojHmqRNsNeMryN5g+8W1Ft/Vshjb7sg=;
        b=gzplh+Ex8ZR2F2qC5dChUYaSTBI5v3Ibg+shL32r38ji9QACFkqFND4Z40JGEhHHdn
         6HmQezab2X+GtndpOC37W08sU1u9ONDoevf0dzqDhnz+LM7V3MqtN8/GFCcKeryN51Rc
         2BNMf5jLk7Az88JVWqz47K0jdYfQgP7Aq5YzWfq4g9ptJEAcvf6VatN5BqSp7ol1zrJs
         eyXu0Xje/AVbDsFLywvRQLeC9+HkYRR0pV+9CMD5Xi8TM1G3ks1sCDjk0KcuPR92Wwyq
         RRY28sjufAtWdD3iUnKL43+TTv90H9EPAbHc3r/cuVhhAfSkR/XATJJeY3y7g6z6tZkr
         zS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769751602; x=1770356402;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlTV89wrXWzzojHmqRNsNeMryN5g+8W1Ft/Vshjb7sg=;
        b=PK9rwXjILSxQ00FCBY8/csXKBuLZlz0Hks5buCoA0rMhROPRDQPxWzDhqLFL8Cmlev
         5o35YTCt7m8JS9qheTFh/NR9aTYwh3fNJjkXwsOCJT7PlB+K9yInuia2D+l/4s6DD4cB
         FDszZiDMR7EdvgEqPjSB/2l3/ZjpfvTeaiWOfrPHpwxzAy6ODAOtB0dry2B88guWjhLj
         q9Vk6rhcFkk6DppmYcVTitQjOtuRIUCuGOCpHHlwIsDNdGXysONYQpo1YYnwyVpOg01I
         InUUEFpHW7IvE9METMaTmev/+ngMv/+DVfELzKvTnlQAJI/5850uTcnMdsbymyUr7PRm
         JNxA==
X-Forwarded-Encrypted: i=1; AJvYcCXEuyw6ZLybarer2nL3C0BRFxwVhB2cJXH0uXnoBT5r28AfBBVdBWAeCkCUkQSPUpwcUH6dqA1TmRUZZuwGrVtD@lists.infradead.org
X-Gm-Message-State: AOJu0YwH5Saw3VFKDdHakhTY+BgoRtTGPj9h8VJuR52avih3wEgKv54z
	t0rlOG8ckB5Q7Ea7v0CRiYaeRznk5kbyA92m1nTy1dBvAXnK1SM2s4TfRO5DcX2kxh8=
X-Gm-Gg: AZuq6aLmdr7/dy2GzZqevuWZb6lUmXY9vlfvRHkn0PuwSX67krhqy80BejGM5PVLt21
	4GNB6qgN7xNOxdFmXLnACoWvgdY6LJg4GQMKFrDqGyGh64tD8fp4zUw07r2utpBaH5tyiYd7nJa
	QtTvmoAHEz6GmhT0qdRJIburgTWjXZgEnmciYdg3dyjSPPD+nSrH+fIGrNURdi3UW7TP4B5nFPg
	1WpalPKiebJxpNG5nF50s5A34cK1vkoz/fl36ozvu+AOYr1BgA70VjjWoD0vpSVdkYGvih7jrxL
	SvOKZp4Sqdks0SU0ePi2IHmLWqjJlaJ9vfldmE+DyP2H252RXL6GBtt29lxD7rUQZyRqdkEwQyU
	ZQZZoCZQNcngJto7MpWjdb6RTfuGeC0kEL/caViR2whuTzmIN189RsGLREYFFhpEXny8qQ13J4/
	TZwuXAITdWOjhIxPO7EA==
X-Received: by 2002:a05:6000:1a8d:b0:435:b776:304c with SMTP id ffacd0b85a97d-435f3aaa5d0mr2448740f8f.30.1769751601650;
        Thu, 29 Jan 2026 21:40:01 -0800 (PST)
Received: from draszik.lan ([212.129.87.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm19280607f8f.11.2026.01.29.21.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 21:40:00 -0800 (PST)
Message-ID: <74eb8fb542966c46d0a8c77041aeef21dd1a7e14.camel@linaro.org>
Subject: Re: [PATCH v4 01/10] dt-bindings: soc: google: add
 google,gs101-dtzpc
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Fri, 30 Jan 2026 05:40:13 +0000
In-Reply-To: <20260129165531.GA1269692-robh@kernel.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
	 <20260128-gs101-pd-v4-1-cbe7bd5a4060@linaro.org>
	 <20260129165531.GA1269692-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_214004_445867_5DF62ABF 
X-CRM114-Status: GOOD (  29.37  )
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

Hi Rob,

On Thu, 2026-01-29 at 10:55 -0600, Rob Herring wrote:
> On Wed, Jan 28, 2026 at 04:10:50PM +0000, Andr=C3=A9 Draszik wrote:
> > The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
> > an interface to the protection bits that are included in the TrustZone
> > design in a secure system. It configures each area of the memory as
> > secure or non-secure.
>=20
> This sounds like what access-controllers binding is for. Does that work=
=20
> here?

Thank you for the pointer, and yes, I did consider it, but decided against
it in the end for the following reasons:

* downstream drivers don't actually do much with this, it's only used to
  issue a request to the firmware to save / restore the configuration
  when power domains are turned off / on (via SMC call). There is no
  actual configuration happening unlike e.g. the drivers/bus/stm32_*
  case. Configuration etc. seems to be handled statically in the firmware
  in my case.

* therefore I didn't write an actual driver for this compatible and my
  patches are proposing to simply issue the SMC from the power domain
  driver in the respective paths.
  What I observed without having a driver matching the compatible, Linux
  will defer binding of consumer drivers (power domain via phandle in my
  case) until the access controller driver has bound. Since no such driver
  exists in my case, Linux keeps deferring the binding of my power domain
  driver forever, meaning it doesn't probe.

Maybe this restriction could be loosened for cases like this instead. Or
maybe I do need to write a dtzpc driver with the only purpose to issue the
SMC calls at the right time. Having such a driver seemed like overkill,
though.

I realise not using access-controller in DT looks like working-around an
issue in the kernel, but due to the minimal interaction from the Linux-side
I was hoping for that to be OK.

What do you think?


Cheers,
Andre'

>=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0.../bindings/soc/google/google,gs101-dtzpc.yaml=C2=A0=C2=A0=C2=A0=
 | 42 ++++++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A02 files changed, 43 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-=
dtzpc.yaml
> > b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a8c61ce069d6910c47753bf=
14a792eb58e6ae182
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.y=
aml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung Exynos Distributed TruztZone Protection Control.
> > +
> > +description:
> > +=C2=A0 Distributed TrustZone Protection Control (D_TZPC) provides an i=
nterface to the
> > +=C2=A0 protection bits that are included in the TrustZone design in a =
secure system.
> > +=C2=A0 It configures each area of the memory as secure or non-secure.
> > +
> > +maintainers:
> > +=C2=A0 - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: google,gs101-dtzpc
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - clocks
> > +=C2=A0 - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/google,gs101.h>
> > +
> > +=C2=A0=C2=A0=C2=A0 dtzpc_hsi0: dtzpc@11010000 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "google,gs101-dtzpc";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x11010000 0x10000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&cmu_hsi0 CLK_GOUT_HSI0_D_T=
ZPC_HSI0_PCLK>;
> > +=C2=A0=C2=A0=C2=A0 };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a56f8f00aebb938aa765a8a6d66dfeb7f062dac8..98b2ef47c809ac0232e6941=
c9483b19d7c798bb4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10833,6 +10833,7 @@ P:	Documentation/process/maintainer-soc-clean-d=
ts.rst
> > =C2=A0C:	irc://irc.oftc.net/pixel6-kernel-dev
> > =C2=A0F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yam=
l
> > =C2=A0F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
> > +F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yam=
l
> > =C2=A0F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-=
intr-gen.yaml
> > =C2=A0F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
> > =C2=A0F:	arch/arm64/boot/dts/exynos/google/
> >=20
> > --=20
> > 2.52.0.457.g6b5491de43-goog
> >=20

