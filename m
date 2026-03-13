Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C571105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxLMf+p2GuGBniwtiAZ7R8MSn2ihPWUg3zgiw3eOsUw=; b=0ppMfnn4kMdUxtbVQTzGgTRYQ1
	Hqwj9IrvCCmB8J7/AnDamtOAvy5V65ILKz+ZVi7fGvoGd4QiHioiuROeL97zVpt9Ikbx4GEFaMA7O
	CaFa9dSuozBxRCt6faLpyFTAr4ryV/AzWtPH1UxI+EYbU1TwXidiuUg7OS38ABytfe8cyo+QV3ln1
	2ZIONAFaoNa5bpMWQy13FqH3+FiOGujJypQg6bnK0oFn8RGNSc1WPcCCHzpPj/Dsd8IZ1hh+JIYsk
	gPPxmaqXQAARYhR4CsUtuyPmNbolK8IDq3R31I17zV3c91LEn5qyijbgzIn+CvXSAiA02ZORHaTAr
	Foyp1yNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Hu-00000000Ljh-2KK2;
	Fri, 13 Mar 2026 14:14:50 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Hr-00000000LiZ-2Ydu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:14:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so3288757a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773411286; x=1774016086; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yxLMf+p2GuGBniwtiAZ7R8MSn2ihPWUg3zgiw3eOsUw=;
        b=w/k3tJtCSo2QPUgYSkiCpb1789rNGhZqzgoNeEaWP9DAiUz9FX+B2WAAowyk2/eVkl
         Nop/LNkYSrV6nlm5MBrPAIPQ8p9NcK3ypuk9uljMzZJdk+t85ik7s9LImDxx4OE8vGv2
         oYQJr67XThfHSamMSC8C7yrvuWbslYrCBdzOZbiKQMX2bbxAS8HTV7Tb55EKTrzgPMUH
         5dWvSnupo4aP/hFNQkh+c9uMKa0NS0lW8yeAjO6d3sY/ieaT3Y05Tm/L9gccnCaLi2UT
         xd9Ceb1fJjNs+wdoU+OvRKiatXEHuYC9ZZtOFOGDV7pmHbWdmUnje0eRkbkTcpUOi+IZ
         cofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411286; x=1774016086;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxLMf+p2GuGBniwtiAZ7R8MSn2ihPWUg3zgiw3eOsUw=;
        b=msYaLqhX+C28EBj8PtniQB21qGmrhTzI7GHmh+VejoLztyT+d2GqhL9tWWng7MSGrJ
         PksZEPXjWE1Whe14i3eVgifTkPGY3RwvDEmkLuVW6FkHbgQPxKb2vUQiP8TXzQ7/UIaB
         ZyBqIGw6y123WuSvB8zpDnSdN5hSOrHii0da6jsY+O+Dfrc6Y6UjVQE46m6K6IGE6Ee/
         c3MuO/GEYYFWlElubnV8loCY54AOQjv/Y0tuEPNP+un6WOcnQ33NAog2VuDT4QMPH1Ej
         QX63wkTdjEz1StZo4YzpJL1NBcvpCikEW/5S7YQhp+GGbnqMMhA/roM3fef1F79+BEFZ
         Hyfw==
X-Forwarded-Encrypted: i=1; AJvYcCUYap06+gv8RQbzD7q70k3CkPkoyNCMKxaKfA+MCkFIT4eb8kKa2vXwbCFJcBV6h80Z7kzcUug+e/Hs+3JvJW7x@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1gGo3+E25E4oVUhgUaawlqRbM4nKroPR1oqB6k1HMupkuHXkG
	2yWk7nS/AO4NO5YMJCzgaEjpdBruTXU1mf+Qd6FykOKyRUawqlVSZCaKJqMWFtkdPDo=
X-Gm-Gg: ATEYQzx7iUNwWN4XxQu61rgvoD0cmm8Jb4RvuoPQmp8Z2Fi3u6L485RQ4/xR2brxxVg
	byidMlc1KSvp5tYTHYVy6izCKmOtPSE7f0joQk7FF1+w/Ybt34XUaA/mM3UgWZ8btKK/SFCKVGX
	bygh0m+bi31WRj9BbXv1Ap2xNC0yDae+2YCch1po0op34glBtvVPNteKJtY+24mbIZ4asXPmPao
	4XMDLSa4Y0sKHATFgRJ7veJYQ/8ku29sExWNBPbkqPVPSQdesD2l3k/SyBhzN+4iaHZA7qbX3e6
	Mjo7xHSli6e3WRLKiRWnhyjm1Bige3OSoWnliX99Qh1AgSWhRW7BCE/bTZSRgMh9BA5zk6XCf9F
	ZqMaVECQ+8pMzTHzVilBXQosr53Nk4jThHC8MyvcSvj6cgWCJK5893Hw4S8NOfU0cr2yoOUpUSL
	dKwGFeR/GYW/jkJb5llAmqVcDm33pPOFCUVtdq7YZ6
X-Received: by 2002:a17:907:e98b:b0:b96:f6f1:e7d6 with SMTP id a640c23a62f3a-b97650e6e1emr210223966b.18.1773411285513;
        Fri, 13 Mar 2026 07:14:45 -0700 (PDT)
Received: from draszik.lan ([212.129.81.187])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cbf4879sm49502766b.17.2026.03.13.07.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:14:45 -0700 (PDT)
Message-ID: <82d2d515a38eabd78951effff1dbc459db864130.camel@linaro.org>
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
Date: Fri, 13 Mar 2026 14:15:31 +0000
In-Reply-To: <CAL_JsqKeSimB6OYFzOk2tWy-nbFez3qRwWrc=yD8uKDALYP8pA@mail.gmail.com>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
	 <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
	 <20260312151228.GA3136988-robh@kernel.org>
	 <da0726da3e59d83985650e8281ed945018a356e4.camel@linaro.org>
	 <CAL_JsqKeSimB6OYFzOk2tWy-nbFez3qRwWrc=yD8uKDALYP8pA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071447_669713_01030FEC 
X-CRM114-Status: GOOD (  20.97  )
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

On Fri, 2026-03-13 at 08:26 -0500, Rob Herring wrote:
> On Fri, Mar 13, 2026 at 5:48=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
> >=20
> > On Thu, 2026-03-12 at 10:12 -0500, Rob Herring wrote:
> > > On Fri, Mar 06, 2026 at 10:29:55AM +0000, Andr=C3=A9 Draszik wrote:
> > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 system-controller@17460000 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "go=
ogle,gs101-pmu";
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x1746000=
0 0x10000>;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 google,pmu-intr-ge=
n-syscon =3D <&pmu_intr_gen>;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pd_g3d: power-domain@1e=
00 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 compatible =3D "google,gs101-pd";
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reg =3D <0x1e00 0x80>;
> > >=20
> > > I'm assuming 0x1e00 is an offset from 0x17460000. That's not what ran=
ges
> > > says though. It says both addresses are in the same address space
> > > (system-controller@17460000 parent's address space). You need:
> > >=20
> > > ranges =3D <0x0 0x17460000 0x10000>;
> >=20
> > Thanks Rob! On gs101, the PD driver can not do direct mmio. Instead it
> > needs to use the regmap that the parent has created and apply the
> > offset from the PD's reg property (using struct resource::start)
> > (patch 7).
> >=20
> > When using ranges as per your suggestion that doesn't work anymore,
> > as resource->start isn't the offset anymore but the final physical
> > address, and using that in combination with the parent's regmap
> > doesn't give us the right address anymore.
>=20
> You are mixing kernel implementation details and h/w.

Just trying to get to the best solution, considering both.

> Are the
> registers in the child nodes MMIO or not? If not, then drop ranges. If
> they are, then what I suggested for ranges is correct.

While they are MMIO in theory and offsets into the parent's address
space, in practice access from the OS is not possible via mmio APIs,
only via the custom regmap created by the parent (which defers to the
EL3 firmware) - hence the driver's need for the offset from the
parent's base address.

> For MMIO, your kernel implementation options are what you suggested,
> do a regmap for each child, or use of_property_read_reg().

OK, I'll go with the first option then, thanks for your patience Rob!

Cheers,
Andre'

