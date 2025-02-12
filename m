Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157B4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=; b=N1K+BKqQGyOU9CPIHaBn3sxwXs
	VUrhB/c8I8DU40t2xJxRteJPjPqsK78rIWFzPKN8GberYqT9/XNOx2nFUEjTrggrV74xS0avK0sYN
	Rg86wQQdkUYEtZ5glSoY5jr5yi0XXpKMWgiJI9MNVtkuaYS8M+GBQ1MRCE5H/6BtN+hxLKQPsaw6E
	46yW9iqoq7AS0JR3PeswB4BAbcEtK14t9RK1WaFUF6rdIvf3gTZ9DUa9AjRTgNv+o1EwAs3+OCkis
	nK4f1ls/RoApVIODylOxQ00tLJFgFLrs/eqCekhYJ8M565XDJM7p1Fcvp18Jo5ZdAPneChEy8oOu7
	PQ95Ghhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLoI-000000097ur-1tNq;
	Wed, 12 Feb 2025 23:06:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLmi-000000097k0-0QLX;
	Wed, 12 Feb 2025 23:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=; b=ABZMAfQjii/wN6bjdC67QDPJJo
	RhNM6pLrQTMdBLWUXdG/oHKzcCwwRSLALgNE07WDoMWy59vFFRdcVGujI6lN65HUFbakg7Hf4SXZV
	r5enqsQUUPAP2Et/BnpLsX6qMkOaWGdUZ+8aBjNJjL4I1d1q90mQ1bM7gukNL6PdxLgkM/E3y03T/
	Dphufxj7ZafLWpJwNKT+zmKJ+EFlxGrOYIKnW09KW2m3pDQiDU0EpvZpLJ+c+J3Pm7tnUHiv2kyvb
	15vGJpTkRqluKeeRsIK05Vwcov4ijQbQknXFZ8HoDMqAjfhrpwBzWGuzPcjWXLd0aDe2DsdxhCg48
	7biUn7vw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLme-00000000sHN-0OLt;
	Wed, 12 Feb 2025 23:04:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab7f2b3d563so56377666b.1;
        Wed, 12 Feb 2025 15:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739401481; x=1740006281; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=;
        b=Ll3fM79w150YSFOt1KZOqotUjtvtPQMbQ0tWamUArXf56QQ0tS02sPeKKspKOHSqZR
         DL8I6U8fs8FnGSj74HKrIoV98tJiq2LpyucEZA3sU+UXCWP5wJXcUc84jqhADoYSxsOB
         OuH7sKR5cTzqJ+mHLLwZdlJUshUnpfYUsx+tHRP8uIX6ZNs3Oc3dDGg9CQX+7M475GNd
         XzShjn5hkrNhlIHrtbQTJ4kRLsXXNnqCmvykadBoEQn+vvdFY45FB5Lku43qrGoDP8qk
         bCTwb8p7O9CMHiqYBJNaEZicShPgrXNJT421ngYFR5JHpfNYgH0DYLYRFD2xRmcSggE1
         ni3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401481; x=1740006281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=;
        b=s7jX1VygcRXQ4KvoFlEECto4IlVfPH4NIukpkD37BZko0wTgTFzIKYPSHGZLqrebv8
         NDz/CPLVQOFfjrzS2dxhglG92DuefiahX0fiZZ0faLacgZD+dx4i5DCHw6ogTtClveCv
         sKztl4TVHADCRZRwJHAkawu2kClIg2q/vyvQcmEXxzqO9QTMwy5prsGavNJp9myRbmCw
         dHD41vnCtd/CMIYhOo0ozbsK5GVpYvpFX5a6ofl0dEOXVDaOdUEBNonZp7qhEhmfTqJO
         TQa/pJ4PEz9syRa7meHEbecQeIV4pdwc5Wum+ljCZKy0CHqp1vp8QTC85sbwG+qMJYgu
         56Gg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZvfE3nWo6H5cP/BWSNB8IpwoivDGEazwenL1n+tGgr5QTmsxc0jTe3PCQ/O92jRMS+W4eM2LZgtE3kr9Cj3L@lists.infradead.org, AJvYcCWwV+vyDsK1HhRqhkOF8d7nCQvuH5CF2A0xyKUQZggEOgaIP6Pk626SfyQQG97dyNIO0N13OVWoZkTGx44=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHJzcQExhSMiGIErJ71J2ClL4vcDLtNntjCI1q+8v6vF5OAh+Z
	iwWSyRUkS5qbQ1a6ZOk+sFvPliToMLzlyQroJMrHhEjIyqX5cAaf
X-Gm-Gg: ASbGncvcU7PadX2fAbHUU4bJ2TZFLAW+KDS46mx/FEIYB6pzt9LFRqvVNlNZWUTiQs0
	KbyPVGnjYin2wIsDZsToLnsEUwhzKNxJQQDN/aBW39u+xgdpPjOfDcJAWF4c7/jizStDAq9dTBt
	BRPRNkDfNEpYtU8/HszsUl0iY4B3MCNkyAXDm8RVZFl+XwTpvO80soeBgDSVQ3UoOuke7683dUt
	VBslvwlgJLoY0P5CN5wCin3WwO5S+mVYK/Zta5j0gBYUoa1m3GAd7NgiJkvcb241MVGFBUy7H5B
	WOQiS0/aEKj5GbbG5bPJg3H7JJvMFS0l
X-Google-Smtp-Source: AGHT+IE13NRMWydnWFjBAbDzcuJOpocvAbpPyYkr9ja8EJrYZQxfsWwpOeQrG6UZLNr7eU9mjShGdg==
X-Received: by 2002:a17:907:3f1c:b0:ab7:1816:e8a with SMTP id a640c23a62f3a-aba5018d61dmr111884266b.36.1739401480710;
        Wed, 12 Feb 2025 15:04:40 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231f4dsm10687266b.23.2025.02.12.15.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:04:40 -0800 (PST)
Message-ID: <de4d99bf89f78a0a6e0a81dc6062af5e85d762aa.camel@gmail.com>
Subject: Re: [PATCH v3 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Chao Wei	
 <chao.wei@sophgo.com>
Date: Thu, 13 Feb 2025 00:04:39 +0100
In-Reply-To: <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
	 <20250212224347.1767819-2-alexander.sverdlin@gmail.com>
	 <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_230444_643093_21EE903A 
X-CRM114-Status: GOOD (  28.17  )
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

Hi Inochi!

On Thu, 2025-02-13 at 06:54 +0800, Inochi Amaoto wrote:
> On Wed, Feb 12, 2025 at 11:43:33PM +0100, Alexander Sverdlin wrote:
> > Make the peripheral device tree re-usable on ARM64 platform by moving C=
PU
> > core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> > cv18xx-intc.dtsi.
> >=20
> > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nuberin=
g
> > into "plic" interrupt-controller numbering.
> >=20
> > On RiscV side this patch has been dtc-compile-tested only. IRQ numbers
> > substitution with SOC_PERIPHERAL_IRQ() has been scripted in vim.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > Changelog:
> > v3:
> > - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint node=
s
> > were moved into cv18xx-intc.dtsi to reduce code duplication;
> > v2:
> > - instead of carving out peripherals' part, carve out ARCH-specifics (C=
PU
> > core, interrupt controllers) and spread them among 3 SoC .dtsi files wh=
ich
> > included cv18xx.dtsi;
> > - define a label for the "soc" node and use it in the newly introduced =
DTs;
> >=20
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 =
| 28 ++++---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0=C2=A0 =
| 28 ++++---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi=C2=A0 | 36 ++++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi | 23 ++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 91 ++++++---------------
> > =C2=A0 arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 34 ++++----
> > =C2=A0 7 files changed, 137 insertions(+), 105 deletions(-)
> > =C2=A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > =C2=A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> >=20
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1800b.dtsi
> > index aa1f5df100f0..9fb7dd2dab18 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -3,8 +3,12 @@
> > =C2=A0=C2=A0 * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > =C2=A0=C2=A0 */
> > =C2=A0=20
> > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > +
> > =C2=A0 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > +#include "cv18xx-cpu.dtsi"
> > =C2=A0 #include "cv18xx.dtsi"
> > +#include "cv18xx-intc.dtsi"
> > =C2=A0=20
> > =C2=A0 / {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1800b";
> > @@ -13,17 +17,23 @@ memory@80000000 {
> > =C2=A0=C2=A0		device_type =3D "memory";
> > =C2=A0=C2=A0		reg =3D <0x80000000 0x4000000>;
> > =C2=A0=C2=A0	};
> > +};
> > +
>=20
> > +&soc {
> > +	dma-noncoherent;
> > =C2=A0=20
> > -	soc {
> > -		pinctrl: pinctrl@3001000 {
> > -			compatible =3D "sophgo,cv1800b-pinctrl";
> > -			reg =3D <0x03001000 0x1000>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > -			reg-names =3D "sys", "rtc";
> > -		};
> > +	pinctrl: pinctrl@3001000 {
> > +		compatible =3D "sophgo,cv1800b-pinctrl";
> > +		reg =3D <0x03001000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +		reg-names =3D "sys", "rtc";
> > =C2=A0=C2=A0	};
> > =C2=A0 };
> > =C2=A0=20
>=20
> The origianl /soc path can be used to override things,=20
> why change it to the reference archor? I see no change
> for it.

https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org=
/
The corresponding label is being introduced in cv18xx.dtsi.

> > +&clk {
> > +	compatible =3D "sophgo,cv1800-clk";
> > +};
> > +
> > =C2=A0 &plic {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1800b-plic", "thead,c900-plic";
> > =C2=A0 };
> > @@ -31,7 +41,3 @@ &plic {
> > =C2=A0 &clint {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1800b-clint", "thead,c900-clint";
> > =C2=A0 };
> > -
> > -&clk {
> > -	compatible =3D "sophgo,cv1800-clk";
> > -};
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1812h.dtsi
> > index 8a1b95c5116b..f23c4dd6687d 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > @@ -3,10 +3,14 @@
> > =C2=A0=C2=A0 * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > =C2=A0=C2=A0 */
> > =C2=A0=20
> > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > +
> > =C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > =C2=A0 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
> > +#include "cv18xx-cpu.dtsi"
> > =C2=A0 #include "cv18xx.dtsi"
> > =C2=A0 #include "cv181x.dtsi"
> > +#include "cv18xx-intc.dtsi"
> > =C2=A0=20
> > =C2=A0 / {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1812h";
> > @@ -15,17 +19,23 @@ memory@80000000 {
> > =C2=A0=C2=A0		device_type =3D "memory";
> > =C2=A0=C2=A0		reg =3D <0x80000000 0x10000000>;
> > =C2=A0=C2=A0	};
> > +};
> > +
> > +&soc {
>=20
> > +	dma-noncoherent;
>=20
> I think this can be moved into cv18xx-cpu.dtsi file, and let
> all SoCs share it.

https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org=
/

If SOC_PERIPHERAL_IRQ() doesn't belong to -cpu.dtsi, then "dma-noncoherent;=
"
probably neither...

> > -	soc {
> > -		pinctrl: pinctrl@3001000 {
> > -			compatible =3D "sophgo,cv1812h-pinctrl";
> > -			reg =3D <0x03001000 0x1000>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > -			reg-names =3D "sys", "rtc";
> > -		};
> > +	pinctrl: pinctrl@3001000 {
> > +		compatible =3D "sophgo,cv1812h-pinctrl";
> > +		reg =3D <0x03001000 0x1000>,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > +		reg-names =3D "sys", "rtc";
> > =C2=A0=C2=A0	};
> > =C2=A0 };
> > =C2=A0=20
> > +&clk {
> > +	compatible =3D "sophgo,cv1810-clk";
> > +};
> > +
> > =C2=A0 &plic {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1812h-plic", "thead,c900-plic";
> > =C2=A0 };
> > @@ -33,7 +43,3 @@ &plic {
> > =C2=A0 &clint {
> > =C2=A0=C2=A0	compatible =3D "sophgo,cv1812h-clint", "thead,c900-clint";
> > =C2=A0 };
> > -
> > -&clk {
> > -	compatible =3D "sophgo,cv1810-clk";
> > -};
> >=20
> > [...]
> >=20
>=20
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi b/arch/riscv/b=
oot/dts/sophgo/cv18xx-intc.dtsi
> > new file mode 100644
> > index 000000000000..90817993a326
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> > @@ -0,0 +1,23 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +&soc {
> > +	interrupt-parent =3D <&plic>;
> > +
> > +	plic: interrupt-controller@70000000 {
> > +		reg =3D <0x70000000 0x4000000>;
> > +		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > +		interrupt-controller;
> > +		#address-cells =3D <0>;
> > +		#interrupt-cells =3D <2>;
> > +		riscv,ndev =3D <101>;
> > +	};
> > +
> > +	clint: timer@74000000 {
> > +		reg =3D <0x74000000 0x10000>;
> > +		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> > +	};
> > +};
>=20
>=20
> I think this file can be merged in to cv18xx-cpu.dtsi.
> clint and plic is more like a core specific device.

Yes, this can be done now, as long as SOC_PERIPHERAL_IRQ() remains
outside of the -cpu-intc.dtsi...

--=20
Alexander Sverdlin.


