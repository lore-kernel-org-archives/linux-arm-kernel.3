Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB0105F79D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2dyCthQPSviIjLo6GGJyjNwIRguOwqd/MGhvd/maVE=; b=IfwwPuKGeGxKGAUmE0ILwJi1+J
	IvPB8ZMBw+C6OYJe1kqrPWVjg+oFVP1bDmqBNck/YTza+effz93tfAahOQnRcCDOLTbtqxIByPjdF
	293kzFToZOHEI4vxoHi38elTjj/wL4LKbiTKTEsqyHKKvttFdPGlmnQehTkuwAw2PYnAs3pooXMGW
	41SgU4UJF1wlGmUQCvqfp1DSzB1lf7ASHAJQzCcAE586xO94P1L5TSrCFceRcvynVDbfX3MSJqLyL
	Q0ozHs1tKqtwv+aqZVvGauJ6+D1x6tv7dpybMCHXJetU08aD+xdlTk6tfE6Y78SfyeGITrz6EeIT9
	i0gsWalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10um-000000003I1-3Ewx;
	Fri, 13 Mar 2026 11:42:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10uh-000000003Hd-2Cv6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:42:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-663a6bb0fa1so1824627a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773402161; x=1774006961; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2dyCthQPSviIjLo6GGJyjNwIRguOwqd/MGhvd/maVE=;
        b=CwLFQhh9L6GN7DV7SmaL5CInx3/xDqdjUxE4GP2XFjRTq3e2zqcijfOLL8pIyOMSu0
         C6fdsxRhil6hbCSTqWREg0uiq/bQGskGg27nubgNlVSVssfK3OJjw/iUKdbD+y2JirWV
         vPIrPssOmcIeZFqydmUkNS9jCExPpMbNfLdOOqvZs9Ly6boBCQkr8OZIQWajp0CegaYC
         efPx3GPuap5rrs14tVFcZvu6qsTthO9fhCeoRkq4DbPfmvVz5tzmpNKVuzOPCXr7RKY8
         525zIoEN+2wuimL5giDbNhcYBCYcuMSAT7ah3tCYW3aCPiozVWdt21hLIrbazmzUklmv
         hj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773402161; x=1774006961;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2dyCthQPSviIjLo6GGJyjNwIRguOwqd/MGhvd/maVE=;
        b=lIlDvtSb33kIe0xTBkpo6DKJSbBdNuDYiHNiCoN0dPfOt7MWVxytVzdOvPqZgpVP+0
         eZtEByoVy2BgxA86htvvB9yrlTPaxQBZ3Hlz2zbG1nA1+KNTxVS+jszDXqgSuvefIrC+
         V8tjx7Gg2iv4wqiZ6tJlOBOLrgS6vWeBhvMuSqw5m+bv3ZJUhJJfLPjSWk1nEyVoMJUQ
         ya2A4LdXQmlYsHxFimgZCZ6DrDl8PrLQ4vfRrZeu0MHG6htFFeXdVUk7EfnbYWtz0qzc
         dkMbxRyi+qtF6C60npMIwDXpgFzVuiPhMeRzK0J9lMYhKf2/1MgfEaLhHk8N6tvgsEh9
         wpfA==
X-Forwarded-Encrypted: i=1; AJvYcCX8CYKqYhupQjW6BDfnvbuyZg0BiSiTBVXOE8oWoqeZC2qCd2tUPkQB+Mn2lDM1V7yWT5z0v20Wu9qM246Kb1uZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxOq52iAeuStQgckZo/8zxBB6D4Ig7yZ4PqTfw/wJd0wTKlOqLC
	eI3OkC1DGL5R+h+fE8kSMdnLe3LOLo40lJGpsInNlifXxXEnLME/O/EPW1IVEEtO0LE=
X-Gm-Gg: ATEYQzyDNFDnxRxHOWoQz3l2VX+CtRZodl6/WKpm/uKfV7y9inXO1mVrXeRiE0Vcjng
	6AKr20MUHUpz7h7jnGkpInq8Bhmr2o7s1YFqYUGAeH9Z8IAbkdeUT8vGmhOuW3CZIUxRzMfd2Nr
	Xc+KCwfcKoB/C86UcUbRFvFgi1RTnVPM3KmvljogxryvUhBGKvjU1WTL+ykt6+tLL/AfdqJ4W0r
	nCKQkN8jO3WbtlmcOUcN9fWnWmT8NI50UKlv67NdNaVibAFfVAKaDJK454myoPWeQxlA0TO7AEQ
	Z6tf4uMcLhZyWU0hLHwW36Y/H2X3tIwEgObWAfEmyLHmu0uzE7Lh7CD3rjJseaEjz4kvDMbmvPi
	dd+NOHw0hgMAG1b/H8q3G84xdZE4GtJmAeiLcGv3Zww+5Hk2YfFEvLhLay5KCkiNzMsaA1VZLLd
	T87zFckAvo9wAZ8q7QPQAPGrr6qnM0Wg==
X-Received: by 2002:a17:906:a291:b0:b97:c19:2972 with SMTP id a640c23a62f3a-b976500f96fmr117661566b.5.1773402160491;
        Fri, 13 Mar 2026 04:42:40 -0700 (PDT)
Received: from draszik.lan ([212.129.81.187])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf02b14sm40474666b.51.2026.03.13.04.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:42:40 -0700 (PDT)
Message-ID: <451f74528021a67b40a4d08fdd0e5c80f6a90025.camel@linaro.org>
Subject: Re: [PATCH v7 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
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
Date: Fri, 13 Mar 2026 11:43:24 +0000
In-Reply-To: <da0726da3e59d83985650e8281ed945018a356e4.camel@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
		 <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
		 <20260312151228.GA3136988-robh@kernel.org>
	 <da0726da3e59d83985650e8281ed945018a356e4.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_044243_619187_8C73E12F 
X-CRM114-Status: GOOD (  16.92  )
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

On Fri, 2026-03-13 at 10:48 +0000, Andr=C3=A9 Draszik wrote:
> On Thu, 2026-03-12 at 10:12 -0500, Rob Herring wrote:
> > On Fri, Mar 06, 2026 at 10:29:55AM +0000, Andr=C3=A9 Draszik wrote:
> >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 system-controller@17460000 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "goog=
le,gs101-pmu";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x17460000 =
0x10000>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 google,pmu-intr-gen-=
syscon =3D <&pmu_intr_gen>;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pd_g3d: power-domain@1e00=
 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
ompatible =3D "google,gs101-pd";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg =3D <0x1e00 0x80>;
> >=20
> > I'm assuming 0x1e00 is an offset from 0x17460000. That's not what range=
s=20
> > says though. It says both addresses are in the same address space=20
> > (system-controller@17460000 parent's address space). You need:
> >=20
> > ranges =3D <0x0 0x17460000 0x10000>;
>=20
> Thanks Rob! On gs101, the PD driver can not do direct mmio. Instead it
> needs to use the regmap that the parent has created and apply the
> offset from the PD's reg property (using struct resource::start)
> (patch 7).
>=20
> When using ranges as per your suggestion that doesn't work anymore,
> as resource->start isn't the offset anymore but the final physical
> address, and using that in combination with the parent's regmap
> doesn't give us the right address anymore.
>=20
> Is there an alternative other than using completely arbitrary indices
> like e.g. rockchip is doing?

My driver could of course peek into the parent and get the parent's
IORESOURCE_MEM and subtract that start address to get the offset
back.

Is that considered clean (enough)?

	ppdev =3D to_platform_device(dev->parent);
	pres =3D platform_get_resource(ppdev, IORESOURCE_MEM, 0);

	pd->regmap =3D syscon_node_to_regmap(dev->parent->of_node);

	pd->configuration_reg =3D res->start - pres->start;
	pd->status_reg =3D res->start - pres->start;


Cheers,
Andre'

