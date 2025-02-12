Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120C6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrtreOGrFy6HHZfLsMe2zUZL1+PbB03myiiB0TLgJeY=; b=zef2S5VHo3hyQcfKfCtO5cmcyV
	k2PVdLLVEFUYzUktLWOnNJQ+gpYls8YgP0kT58b40LzMS2VYBWfYoaMf/Sq+5qODL1Z5xC/uZJwl3
	9jPyI4Ul/SDAdPPL5eeB9qDQ7NOpV9+twUwGkk3atvbJFC+feNpfsXR+qkxxTg9PlRB29C5WoQ+fO
	JjrtwCFA7Lm4HD8wTs2K3gq9q3UAw/4tfoHMu7PZOFid43uZCSA69ytpotfSZEdW4Qwo5Za0wveJn
	5Zs2+RG+E9ANdrtfKOQYAhZfbWSxePe7caAc3Sv3j6zg2ipO8P269tuNy9ul8ngEMLO4qHx/K/+jM
	dq2tQ6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGvm-00000008OYb-1pN2;
	Wed, 12 Feb 2025 17:53:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGma-00000008MkQ-2DFO;
	Wed, 12 Feb 2025 17:44:21 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaec61d0f65so10244866b.1;
        Wed, 12 Feb 2025 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739382259; x=1739987059; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HrtreOGrFy6HHZfLsMe2zUZL1+PbB03myiiB0TLgJeY=;
        b=Gk/V4Q9e6l5USJK+MDd3VPJ9Wi44vtbvLAF894ZjAEq8oc6Nom+gTF/UFw5KGkhJiO
         sHIGxVRYn/XqjQmGuufM9CHHUUPHkhc9sE21b04WNOkIf35A0QE6vUsSof0A7UtzM40M
         sSL+yAJ3JjaQ0TWibaHWfcVT1ZrJAXqxSPeOl8G6R/BVnybgy4txl/jG0yP7pVVu8Ji4
         S/6TUnxkTroTZKIJzPtybrBHdjpa/7vdvZPy3WEW1wahAeciuq0uuZeACOb3/IUn7OBr
         zK6FDK1MbBez32nOoXLiIziIni2BirQk7YVChSa52vW8D2rPoz/03sNF0/rqvlnkx6Xv
         VVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739382259; x=1739987059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrtreOGrFy6HHZfLsMe2zUZL1+PbB03myiiB0TLgJeY=;
        b=m8pMET4ipQvziJkOZoCVcC/KXB8ynLbS/MqEskQ1MscRU4eAr4jN2oN6fpqIufzk2Z
         AJpkQ9BBHOwwvtXixrqZ6w2fTCOZ3Kb+8TscCtSzJ68m7y8D5eIGPWNvAAj4MrLoFfbj
         B2IjGhM6mb0nh4B/m6W/XhK0mnbEm6QkJCvmJxbEX1iDxaT/7jOTEBHGaDsvoql3ZKxS
         T9mZ4RSXFNYA31RRlYa1qaBhaMiWBA//3CRlvnLkxFMOQ54bYUClJsZ5B0eRQI0UwT0b
         85XZv40WiIHD26TtJKsEuJu1kO1MqDvQta9GyyzwBL6FvaDL5ccL4TzGrDIlyFXzsw8s
         1FYg==
X-Forwarded-Encrypted: i=1; AJvYcCXBXkbTK8fZbQU0+DG+eNSWwd5xjUF8qRq2/8icvKHmGg6Zo6VeEyV8kG7o6rrwoxtaLgFtWGKks7OhzD0=@lists.infradead.org, AJvYcCXfEkBIF36f6ctY6J0U/EiH9s+wex1k5nV2UZ2FLZVTlVqPkgp5Vp1TcSzyzPDE50kMrs48VDyj6UuH24IhWn4M@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3DVR1ODc58A/LZdrBJa6kp4rtOR07ZOfUiM3wDU/QddgaB6W4
	2lTiRaF7i0cP8TOeUs7r4jLdNU95f2XzlLc6Gqny0LTzWQzcB1V3
X-Gm-Gg: ASbGncsj4tIQ+wfejqPeC6ZtzEjJ4CJLOdW3VfA1EyK3FIJfQ+6G6dyIxghX99y5pEs
	ZTXzopXKFDRGaWAFrYadvO8WAKpPQ0gHPh+EImmy6g1eukHYsfmGEIYNkC0lO5IS5r7f3XImGV7
	l1ryyWASYzh6EZAsJ8zKnxDhB7JjaFEDkNAOvoAokHrCWvZQ+d5u3jnf/SeM5q82jwNkHtqCzqx
	pO4H+hzd8o1wnMwHTrqSat3L/6CripdPL8Uk0zUMorcXb2w1BTGjSwhYs5kxb3/bwi+8Z6NzYbo
	4YmFcJeQ7eIngnv+YEszP4n9saYwMVUU
X-Google-Smtp-Source: AGHT+IGXiN90fqBBtXBKAJxfVWN6FjbS5WH82cFrumS6AyosF6uuHB+mpyekgQzZiYjWjwTT1PPBcw==
X-Received: by 2002:a17:907:da3:b0:ab7:cc43:c52a with SMTP id a640c23a62f3a-aba501ab6aemr1428966b.52.1739382258565;
        Wed, 12 Feb 2025 09:44:18 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ba97704dsm719671166b.107.2025.02.12.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:44:18 -0800 (PST)
Message-ID: <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto
 <inochiama@gmail.com>, 	soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Chao Wei	
 <chao.wei@sophgo.com>
Date: Wed, 12 Feb 2025 18:44:15 +0100
In-Reply-To: <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
	 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
	 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
	 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
	 <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_094420_567318_16A4A52C 
X-CRM114-Status: GOOD (  26.11  )
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

Hi=20

On Wed, 2025-02-12 at 17:46 +0100, Krzysztof Kozlowski wrote:
> > > > Make the peripheral device tree re-usable on ARM64 platform by movi=
ng CPU
> > > > core and interrupt controllers' parts into the respective per-SoC .=
dtsi
> > > > files.
> > > >=20
> > > > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nub=
ering
> > > > into "plic" interrupt-controller numbering.
> > > >=20
> > > > Have a nice refactoring side-effect that "plic" and "clint" "compat=
ible"
> > > > property is not specified outside of the corresponding device itsel=
f.
> > > >=20
> > > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > > ---
> > > > Changelog:
> > > > v2:
> > > > - instead of carving out peripherals' part, carve out ARCH-specific=
s (CPU
> > > > core, interrupt controllers) and spread them among 3 SoC .dtsi file=
s which
> > > > included cv18xx.dtsi;
> > > > - define a label for the "soc" node and use it in the newly introdu=
ced DTs;
> > > >=20
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0 | 6=
4 ++++++++++++---
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0 | 6=
4 ++++++++++++---
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 +++++++++++++=
+
> > > > =C2=A0arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 91 ++++++----------------
> > > > =C2=A0arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 64 ++++++++++++---
> > > > =C2=A06 files changed, 240 insertions(+), 102 deletions(-)
> > > > =C2=A0create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > > >=20
> > > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/b=
oot/dts/sophgo/cv1800b.dtsi
> > > > index aa1f5df100f0..eef2884b36f9 100644
> > > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > > @@ -3,6 +3,8 @@
> > > > =C2=A0 * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > > =C2=A0 */
> > > > =C2=A0
> > > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > > +
> > > > =C2=A0#include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > > > =C2=A0#include "cv18xx.dtsi"
> > > > =C2=A0
> > > > @@ -14,22 +16,62 @@ memory@80000000 {
> > > > =C2=A0		reg =3D <0x80000000 0x4000000>;
> > > > =C2=A0	};
> > > > =C2=A0
> > >=20
> > > > -	soc {
> > > > -		pinctrl: pinctrl@3001000 {
> > > > -			compatible =3D "sophgo,cv1800b-pinctrl";
> > > > -			reg =3D <0x03001000 0x1000>,
> > > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x05027000 0x1000>;
> > > > -			reg-names =3D "sys", "rtc";
> > >=20
> > >=20
> > > > +	cpus: cpus {
> > > > +		#address-cells =3D <1>;
> > > > +		#size-cells =3D <0>;
> > > > +		timebase-frequency =3D <25000000>;
> > > > +
> > > > +		cpu0: cpu@0 {
> > > > +			compatible =3D "thead,c906", "riscv";
> > > > +			device_type =3D "cpu";
> > > > +			reg =3D <0>;
> > > > +			d-cache-block-size =3D <64>;
> > > > +			d-cache-sets =3D <512>;
> > > > +			d-cache-size =3D <65536>;
> > > > +			i-cache-block-size =3D <64>;
> > > > +			i-cache-sets =3D <128>;
> > > > +			i-cache-size =3D <32768>;
> > > > +			mmu-type =3D "riscv,sv39";
> > > > +			riscv,isa =3D "rv64imafdc";
> > > > +			riscv,isa-base =3D "rv64i";
> > > > +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr"=
, "zicsr",
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei", "zihpm";
> > > > +
> > > > +			cpu0_intc: interrupt-controller {
> > > > +				compatible =3D "riscv,cpu-intc";
> > > > +				interrupt-controller;
> > > > +				#interrupt-cells =3D <1>;
> > > > +			};
> > > > =C2=A0		};
> > > > =C2=A0	};
> > > > =C2=A0};
> > >=20
> > > Make all soc definition include the common cpu file.=20
> > > Not just copy it.
> >=20
> > I was acting according to Krzysztof's suggestion:
> > https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel=
.org/
> >=20
> > Krzysztof, I can name the file cv18xx-cpu-intc.dtsi and pack CPU core +=
 interrupt
> > controllers into it. Would it make sense?
>=20
>=20
> I don't understand the original suggestion.

This is the snippet in question:

---[ cut ]---
#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)

/ {
	cpus: cpus {
		#address-cells =3D <1>;
		#size-cells =3D <0>;
		timebase-frequency =3D <25000000>;

		cpu0: cpu@0 {
			compatible =3D "thead,c906", "riscv";
			device_type =3D "cpu";
			reg =3D <0>;
			d-cache-block-size =3D <64>;
			d-cache-sets =3D <512>;
			d-cache-size =3D <65536>;
			i-cache-block-size =3D <64>;
			i-cache-sets =3D <128>;
			i-cache-size =3D <32768>;
			mmu-type =3D "riscv,sv39";
			riscv,isa =3D "rv64imafdc";
			riscv,isa-base =3D "rv64i";
			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zicsr"=
,
					       "zifencei", "zihpm";

			cpu0_intc: interrupt-controller {
				compatible =3D "riscv,cpu-intc";
				interrupt-controller;
				#interrupt-cells =3D <1>;
			};
		};
	};
};

&soc {
	interrupt-parent =3D <&plic>;
	dma-noncoherent;

	plic: interrupt-controller@70000000 {
		reg =3D <0x70000000 0x4000000>;
		interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
		interrupt-controller;
		#address-cells =3D <0>;
		#interrupt-cells =3D <2>;
		riscv,ndev =3D <101>;
	};

	clint: timer@74000000 {
		reg =3D <0x74000000 0x10000>;
		interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
	};
};
---[ cut ]---

Inochi's proposal is to put it into separate cv18xx-cpu-intc.dtsi and
include the latter in 3 other SoC-specific .dtsis. In v2 I've just
duplicated the above snippet 3 times (refer to diffstat above).

What are your thoughts? In Renesas everything is duplicated, I believe.
Sophgo outsources much smaller snippets into .dtsi (refer to cv181x.dtsi).=
=20

> Inochi, please trim unnecessary context from replies.

--=20
Alexander Sverdlin.


