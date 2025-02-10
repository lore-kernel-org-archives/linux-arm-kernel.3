Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DA5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0QSMz5PoYwxWIMQ1TQSMM0I1UZCTAzfF9T8ctLhX2A=; b=xnOtr1urQq10Hplp74lBIk2DhC
	x7UbVadXDkXeSNCYusV4QWhgYAUbZQCRF9bhDzSp7Te+wEMV/w8CHFQv32ZNQ8cOh5EhIuhMBZLlp
	UynTfA6mg8ZP5eAUlDs/+BhnR0PWh+SpW4+jvbcYHFG77Jl2/G1jbx8ex66KQYvfaduSNWT7+5VZ7
	u4XE6KX4fEv/gs/CwIkEQiDrGxeFbvMmWy4uIEUpA/enFwBhLGeNPQGcrcIhwengtCHpmzr1CWQso
	SOhK/WrPCazsCBcgC1U9QJVK0b/aKTecIkdr809VPob/IAnf39PFzG/cRVwZeF2G6Xnp+lXoOgPAa
	RI2rQMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUAH-000000001ow-2lcY;
	Mon, 10 Feb 2025 13:49:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thU6l-00000000106-3r9v;
	Mon, 10 Feb 2025 13:45:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38dd93ace00so820979f8f.1;
        Mon, 10 Feb 2025 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739195154; x=1739799954; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B0QSMz5PoYwxWIMQ1TQSMM0I1UZCTAzfF9T8ctLhX2A=;
        b=QacjOUrIrxU70rIyz1DIzMTd1/d5nwNppVE5mQVdEEFq1ieG6pHaddsOWPTSBXcLj8
         KSB0AnDsjViY5P2xVjX3QAcRbetu14dQsxanzI46vsHpkSfXS48qX9Eo13I/ndRHXbwT
         6sX/XRUPx0SbAm/81IDEjsvwRSb+RG07mBxPxBHZaITCUl6+11r2zI0tBYBKYYRmcASq
         YHTq3AHA0pW1eveR4wDFltV7t7geJNQGRuu6Yyb9Tr3Dv9mCJa44Ww/2ljqIdIYxN03Z
         erHIYKdX5FXgIQfm8vM1a5t0qAQjY/gmNnl3SkWzv7UVsUHkyudCM9oCGta+WMBHo5D6
         gxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195154; x=1739799954;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0QSMz5PoYwxWIMQ1TQSMM0I1UZCTAzfF9T8ctLhX2A=;
        b=K7FCH070ff35NfLELykj5VsVLEQCwjfKRwM+/PbaDc3HWTlnih/n4NneVxbcM0AG3k
         OFkT/ooBQqAdJ+5h+TWibB5RNtAyxwqL5aC96MaAsIkDimHBgv7hv2bX298BDCHNp+t6
         Pny8vMma8f3xOgVrHNkcuOmv5qdC1h+8rqu95JSbjkgCNrBTlJur0TT6DRPRD02/5hOW
         r8GfW2pSm1TlEU+QPIqxT0b5oER8r8OiIqhACY4tVoP/wKiNqY4yNfot4KKZ4aA47k0q
         mwvLRr4CKGkeCfJ47eIqkxgV6micGT0aQDxvQxh1O29l+YcKueDLdPHiKQzVO7HsOoWp
         lfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0vv2jc9EQLmM737a723N8eN+uiME3IpKiBiqbBHPOwU1m/gObHilAgw1/zK3B87UGixRQ5nkpkFvJQ2NVj0Yo@lists.infradead.org, AJvYcCWBz9kwhGSebgPGQXUarnXbcWvVRCF3p5X1dk41rSUg15pTz3owpY6Wxj4ODa7JJf+nz6jzZVxKsJLa82U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz10er5fsEhWfHUkrxkGaHkObD6sdIJlKJn3ttHHlgxDiEujUaf
	cvz5rDKqMusjSk1WB+dvqLP+iN7uS0F/wzKpGmfNEAjdihaX8Pkc
X-Gm-Gg: ASbGncuU11VJ75VkczzRB5GDUHRWEAbD13VOaNphgMTwz1E+OlxjERQXKfa3pBYWUwR
	4LBNUbF+09vtFes74qg+McHvbuVEO+eact7gGs3kdLyCignpwqTROpaV3YvlCPyqUcvAtKBgyKM
	V1HLrY/QDCRNdKoa9hOP+rU9PR3Q02r4yL4p30BwRs7oxJLTq4Xz/DXT5P6PbtQDFUyIF0oajty
	uyrKMmsVTfiQpnYqk9NmiSV7+g0kq0ZKKh6Ogtt02CGsxIW4Ledq0NQsfMMliKaLpvSdYc2iAV8
	uDvTomwqgdLrE8B1hQ4pfl8Mejfx9rDw
X-Google-Smtp-Source: AGHT+IH9uHWSiEXMVmzjpVAxMhboYo6LDwjJ5Xy7khI/V14PrgJYtGxDMf03BQTGcuTX+S72JWXzFg==
X-Received: by 2002:a05:6000:156e:b0:38d:c2d4:2399 with SMTP id ffacd0b85a97d-38dc9347ff2mr11108966f8f.41.1739195153957;
        Mon, 10 Feb 2025 05:45:53 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd21fe18sm9233159f8f.91.2025.02.10.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:45:53 -0800 (PST)
Message-ID: <7fa3501bd59697e65ab1387e25cb815180c3378c.camel@gmail.com>
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core
 and peripheral parts
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Date: Mon, 10 Feb 2025 14:45:51 +0100
In-Reply-To: <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
	 <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_054557_822042_D3A0747F 
X-CRM114-Status: GOOD (  16.36  )
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

Thanks for quick review Krzysztof!

On Mon, 2025-02-10 at 09:43 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2025 23:06, Alexander Sverdlin wrote:
> > Make the peripheral device tree re-usable on ARM64 platform by splittin=
g it
> > into CPU-core specific and peripheral parts.
> >=20
> > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nuberin=
g
> > into "plic" interrupt-controller numbering.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 313 ++++++++++++=
++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 305 +----------------
                                 ^^^^^^^^^^^
[1]

> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > @@ -0,0 +1,313 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#include <dt-bindings/clock/sophgo,cv1800.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +	osc: oscillator {
> > +		compatible =3D "fixed-clock";
>=20
> I really doubt that external oscillator is a peripheral. This is either
> part of board or the SoC.

This is actually a problem of the original cv18xx.dtsi [1]. Do you think
I need to fix it as part of my series? This would touch all the pure
RiscV boards (using CV18xx SoCs, not SG200x SoCs), which I could avoid
otherwise.

--=20
Alexander Sverdlin.


