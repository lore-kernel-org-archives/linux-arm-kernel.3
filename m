Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A9105F793
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzplZJ4Qyk51rYHGGTOx2eXlOHiYAraldVZ2IfKSWm0=; b=shqXv2JKdpx25uxZPt2ahdP8Je
	9xeoEh12DqV70HZnGFxgOieZ1bw4P0cvUZC5Cts/2vcOohcHGYaeLQ3p44F7GsFfE5RkmKiN6DD9U
	o7AhIYnCdM4lH6ab5320tj6BFnsssfG0i86J1KVPfhDfMw3e/n93vNEWzvNZtgzogskxzwftZDkIq
	TkNB5Lim3ZN7nZtGdXn+tV9NrPGuPspuPV/O+sPZdeXGdNLFBlxgKystHOzloKRIKKWtWCTos5SQC
	t+xneS2cdJyrtCn2kZJa8Q8vL0prCzhKQFrlr/7DdByV0tXxIlo2mJQJFgtlV6tJwyI49RB6bnRRB
	F0g+ezKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1040-0000000HY2l-06K7;
	Fri, 13 Mar 2026 10:48:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w103x-0000000HY2P-3nv6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:48:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439c56e822eso2134217f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773398891; x=1774003691; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zzplZJ4Qyk51rYHGGTOx2eXlOHiYAraldVZ2IfKSWm0=;
        b=NBmHfbrUYBkIol34u75Vao+QnyVPknGWrAXY7E1PbMLzijbNCwgQL0WP9qbttxX+o6
         1HP14vRpnIYN0g3SXn3/QXwdj4qfivCKa06pxSfAQR9VYtlC2SSWNxdPgG73u7EZRrGe
         r30QuhW3VOjP6yiTFIy8mpHa3tlNZJxC+G3S6YPhXgmHVGCQWV2vcloly+3y1Eb2HzVF
         kZ05mLEx0mUA5cKQwVnVFxPBzDlSTMz53W6l+wKVvZx9MKPiNIs4SpyEVGWmPYfGu/tc
         wsExiyNEE7aL055dwlUzd9QNuL+P87kwVxVTQ2SgIKCcAyFySy0kD5X2jgoYRorNygE2
         y07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398891; x=1774003691;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzplZJ4Qyk51rYHGGTOx2eXlOHiYAraldVZ2IfKSWm0=;
        b=SyU53lyInM3SqDObS8Sezdt29j/3fsTPPZ62DglBrHbsUW4PjhduCQ8DqAtaG7+DWd
         a6vWctpoY79zMKr+Ef6WWPhVug6rUwWVvWP7vgHTc106VTGYVA2HVBuO7q/id5U2c2om
         4aXEZVjXBvInk31Y1LWObyDWA1Un4mvOwE/2YtLySxHdc3Rs88CT2apC9rfhrm1FqM/h
         vPfjRZslF54LSbr+lFJdW6NdXlpnv8Li9yB12XxbnXoMh9j6WptqTBK6kQhyMZjnyB1D
         3Z8QAJiym3+wzJLhFaHSQrbwQ5iYzJaGv0gTil6BEtOeDMyHFow6+SFXxotkB0pVmlRK
         gyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgTVeo/MQRrXkBqC7/+Yzuz3cVgVbCaUv2wTuHsKR2qqsCGs8C0P2wx04lQzTjShJiaYY1nlAKMv49sAz7b4hu@lists.infradead.org
X-Gm-Message-State: AOJu0YwR2LNvCZ+5U6LJzl1poGJQuADQUq7OHbZ++S7vCzawxZT73Fs+
	qHDG5IDd+QBR19Xp1ZttpMqVsqOmWw/vYYEVG7oX32DBozB09KMMUkWLPOewa3HH/mg=
X-Gm-Gg: ATEYQzwLoSEcEKJxZTGQ1a9k5MTJ40tidaTUaVKuH8dJ0SI3Osw3AdHHEFm5J366HCg
	F3zIEH8d3IMJYzxb2Z8AEaJ2k+EiaxFHTKfegpVWrXML0dCGjpEHmWxDgkKdbVqTelL5h72j/Ll
	jU8suF5oWOzyXoR6nG/a5BkRyk7Vy9nJ/wcR+4v61cJvAaLownhftCvQ3W+pCeIZbr54xKUOSt6
	waDs68GFCTa/qAcjbvj0b2Q8H52AN4OISYunWO7Sg2JHyzF0J7OKSKxyk0YgWDPEcUnY9Gz0IDr
	cidQhpKAfiq2f9+9Kuv5JsVMT4Yt41R1iLkbEbCjRkjlA78l43SC4QMnFaJ45O1i7nT08yGeI3w
	8RpeHJognWzdf7YfYWyVesNImlsP/VBxVYeCxav1ppkXzjqh2xjoXWzKmQ78ZdkkcpCB26Cc7T1
	SAsxxVmCdXvEFqY38gLA3qD4oGVaKyH8gZbcFoLJV2
X-Received: by 2002:a5d:588b:0:b0:439:b114:60c2 with SMTP id ffacd0b85a97d-43a04db64b2mr5501570f8f.34.1773398890938;
        Fri, 13 Mar 2026 03:48:10 -0700 (PDT)
Received: from draszik.lan ([212.129.81.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm19109536f8f.5.2026.03.13.03.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:48:10 -0700 (PDT)
Message-ID: <da0726da3e59d83985650e8281ed945018a356e4.camel@linaro.org>
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
Date: Fri, 13 Mar 2026 10:48:55 +0000
In-Reply-To: <20260312151228.GA3136988-robh@kernel.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
	 <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
	 <20260312151228.GA3136988-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_034813_964965_0640EE39 
X-CRM114-Status: GOOD (  11.90  )
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

On Thu, 2026-03-12 at 10:12 -0500, Rob Herring wrote:
> On Fri, Mar 06, 2026 at 10:29:55AM +0000, Andr=C3=A9 Draszik wrote:
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 system-controller@17460000 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "google=
,gs101-pmu";
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x17460000 0x=
10000>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 google,pmu-intr-gen-sy=
scon =3D <&pmu_intr_gen>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pd_g3d: power-domain@1e00 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 com=
patible =3D "google,gs101-pd";
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg=
 =3D <0x1e00 0x80>;
>=20
> I'm assuming 0x1e00 is an offset from 0x17460000. That's not what ranges=
=20
> says though. It says both addresses are in the same address space=20
> (system-controller@17460000 parent's address space). You need:
>=20
> ranges =3D <0x0 0x17460000 0x10000>;

Thanks Rob! On gs101, the PD driver can not do direct mmio. Instead it
needs to use the regmap that the parent has created and apply the
offset from the PD's reg property (using struct resource::start)
(patch 7).

When using ranges as per your suggestion that doesn't work anymore,
as resource->start isn't the offset anymore but the final physical
address, and using that in combination with the parent's regmap
doesn't give us the right address anymore.

Is there an alternative other than using completely arbitrary indices
like e.g. rockchip is doing?


Cheers,
Andre'

