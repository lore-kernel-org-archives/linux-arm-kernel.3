Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C3FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDlfNVO3NueDu0Qi3f7HcF0fEdO1uHUOCWWSlLIIhqA=; b=n3xbpPCZYvMGoFGYpdf+Mr+aha
	yAfY8FMAi6eBXoNDtlb5+/DFmbIRngKu3L61VttQsprkt8St7BBLiRC4rjVz4keMrEi2IjEHcxxE3
	LZUp0W6+K5EMfvq09Q9AR6kpIq/bdE9NC+teChUi2B3RtjejoP9fqM2haVFoAvgRv+4qg0MQU7oA3
	Nvpthu/mDXp0TZj5HSXfJOjYO1qkWfVa0ImBYlZtl1N726TZ7lZUJZWFCzIxpGZcEj4gM+SxVWmCd
	4C1DabAVq1350Po/uVnjllHU7WV0PdHtTWowguHUUiGjSslbgjfsth6FQE5+GxP4QDKqy+j/qdbVS
	iJCwKKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixtZ-0000000FNy1-09gM;
	Fri, 14 Feb 2025 15:46:25 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixnQ-0000000FMSX-12pC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:40:05 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e549be93d5eso2436619276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739547603; x=1740152403; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDlfNVO3NueDu0Qi3f7HcF0fEdO1uHUOCWWSlLIIhqA=;
        b=pu1v172oCLjyOSU4QP9gZRfZfaBA59ETUqTHQZ9QDljxquuduyJPRmvcrNYDOQChpU
         eb8O4zDnaktFq447uAJ8USd+20sx1zg1halGo9zpYTjpwFj+JBtQTtikacrVblmq/UFU
         PJC+VfB1HGKaKK3ucZMO8qiVfr8nOpHlra0mxrKTlfN8K0xuG3ktMZmlnb1LDyMINoIv
         4p9SbkB+K3EZA24bsRHA8s15fP/Gjk6cCLs7LFILji5xur5pyjkvwvgqfhWCmxHygO+O
         kPSjBWKBtHNGpm6whB3m6JRzGXQcKQs2goOt+JoaEvnMgsakh3ju2l60lIhCkZ5xwPAq
         1Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739547603; x=1740152403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDlfNVO3NueDu0Qi3f7HcF0fEdO1uHUOCWWSlLIIhqA=;
        b=gSTdHWOPU7cZw2uQjuncP8CVChPZzZfFQn8QYXGsexJnegWvwK37QNveR/VT3ve6Bs
         bO1trW+1bLvLIZLOXO9U8oiYFaCOBVYKRfOvYWL0wmJl1H4uKQSf9ja/dR42pvZvUaCe
         v4uMY73fjOVejlU45NDv9WixyuUHkXQFTWSl5c+OUemhZ8hDM3MCoXJEgsxlQrctLbq7
         UPL4TXDu1w6KrHUjIXmdQkXXrwQ7XkyVK4IbSvJcVI93xaIWMnoAA4hbVk4hGpgg5stp
         63RObzg1wuQ6t9lhEs0gag4Z7gIUF+6Ncplmrx7nDXpXJiFQb2xv6J/u+89xUbpyNOI6
         zi0A==
X-Forwarded-Encrypted: i=1; AJvYcCWDjCv8TiwSHes9i+tM2JWOLg1FdD5j+7+Wekt7JonUuOYcibwKlYHhMrZmOLa+SsUIe65HDTAR8KSE1xHlX1EV@lists.infradead.org
X-Gm-Message-State: AOJu0YyeXIHJn86z4jsjoP5wf7+Ots1KjlvWtOVW6bJ0qNi9lsqO0ozJ
	w0d/gDm29+qk49dLIpBzbC5gl3HJqzc3W15lR6bl4E8bTEdPd74lwNYgP6JLiVOO08d4FGL2GHg
	/XQxHtNdJHwZtKrUmepfItpnvBjT8ofSksY6rkw==
X-Gm-Gg: ASbGncuYhkgyN4T9MgJO5F03C4Uk5rju2HyaomWUYHUeMdjdlU3AmZacJ1qeUzsqCM4
	RWPLI0+TI8EHc0pV308D+GSN0D1l4BbEOLFt+G9WeeZjR7TDhAroO2mgGvN8TN8ZZUfeJ/HOZY0
	dIbZc1V7LYUO05uKgfwNcOblviVLCcvp4=
X-Google-Smtp-Source: AGHT+IH8EDa+4ekuWWbXXBr/riLIN3JlPX6Dn3pM/FPKZAsai8Udd4H0wlop9vjoHOYPmZSk7PdvYO6YAK4exwTSyGU=
X-Received: by 2002:a05:6902:188e:b0:e58:173e:abcc with SMTP id
 3f1490d57ef6-e5da8102d3fmr8204636276.8.1739547603265; Fri, 14 Feb 2025
 07:40:03 -0800 (PST)
MIME-Version: 1.0
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-4-wachiturroxd150@gmail.com> <40370a0e-775b-42e3-bb6c-8cacaa0482cf@linaro.org>
 <Z67f+lDxISVubiJJ@droid-r8s> <2ed6c5d8-b559-4ffc-b08e-412bab1f7917@linaro.org>
In-Reply-To: <2ed6c5d8-b559-4ffc-b08e-412bab1f7917@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 14 Feb 2025 09:39:52 -0600
X-Gm-Features: AWEUYZlElBm9hQ_fT18iHek-VpX4yHKDlxdz_rBItX0Tc5O4FlTpOcx5z1N4lMA
Message-ID: <CAPLW+4mbJoLHJ7TDcn9z8-WOEAFSiH7wBMt4Rk3fsw0h1wSSMA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: exynos990: define all PERIC USI nodes
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>, alim.akhtar@samsung.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-serial@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_074004_292257_8144C1C1 
X-CRM114-Status: GOOD (  24.94  )
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

On Fri, Feb 14, 2025 at 12:49=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
>
>
> On 2/14/25 6:17 AM, Denzeel Oliva wrote:
> > On Thu, Feb 13, 2025 at 07:38:35AM +0000, Tudor Ambarus wrote:
>
> >> node properties shall be specified in a specific order. Follow similar
> >> nodes that are already accepted, gs101 is one.
> >
> > Not all Exynos SoCs will follow the same order
>
> you an fix them then. Please follow
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-o=
f-properties-in-device-node
>
> >
> >> <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> >
> > Is
> >
> > GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_4, "gout_peric0_top0_ipclk_4",
> >      "dout_peric0_uart_dbg",
> >      CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
> >      21, 0, 0), [Mainline CLK]
>
> I don't get this reasoning, sorry.
> >
> > You can find it in the cmucal-node.c driver downstream of the kernel. [=
0]
> >
> >>> +                   };
> >>> +           };
> >>> +
> >>> +           usi0: usi@105500c0 {
>
> cut
>
> >>> +                   serial_2: serial@10550000 {
> >>
> >> why not serial_0 since you're in USI0.
> >
> > Because it is simply displayed in the exynos9830-usi.dtsi [1]
>
> I don't think it matters what downstream specifies for labels. Use what
> common sense says.
>

Yeah, in upstream we don't care about downstream at all. Downstream
code is very often is quite low-quality and doesn't follow mainline
kernel conventions and best practices. Mentioning the downstream code
as an answer to questions like "why it was done this way?" would often
trigger people. In this case I think it should be consecutive
ordering, if there are no very good explanation why it shouldn't be
so. Then aliases can be used in the board dts if you need to keep a
fixed order in the system.

> >
> >>> +           };
> >>> +
> >>> +           usi_i2c_0: usi@105600c0 {
> >>> +                   compatible =3D "samsung,exynos990-usi", "samsung,=
exynos850-usi";
> >>> +                   reg =3D <0x105600c0 0x20>;
> >>> +                   samsung,sysreg =3D <&sysreg_peric0 0x1008>;
> >>> +                   samsung,mode =3D <USI_V2_I2C>;
> >>> +                   #address-cells =3D <1>;
> >>> +                   #size-cells =3D <1>;
> >>> +                   ranges;
> >>> +                   clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK=
_6>,
> >>> +                            <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_=
6>;
> >>> +                   clock-names =3D "pclk", "ipclk";
> >>> +                   status =3D "disabled";
> >>> +
> >>> +                   hsi2c_1: i2c@10560000 {
> >>> +                           compatible =3D "samsung,exynos990-hsi2c",
> >>> +                                        "samsung,exynosautov9-hsi2c"=
;
> >>> +                           reg =3D <0x10560000 0xc0>;
> >>> +                           interrupts =3D <GIC_SPI 398 IRQ_TYPE_LEVE=
L_HIGH>;
> >>> +                           pinctrl-names =3D "default";
> >>> +                           pinctrl-0 =3D <&hsi2c1_bus>;
> >>> +                           clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_T=
OP0_IPCLK_6>,
> >>> +                                    <&cmu_peric0 CLK_GOUT_PERIC0_TOP=
0_PCLK_6>;
> >>> +                           clock-names =3D "hsi2c", "hsi2c_pclk";
> >>> +                           #address-cells =3D <1>;
> >>> +                           #size-cells =3D <0>;
> >>> +                           status =3D "disabled";
> >>> +                   };
> >>
> >> shouldn't you define serial and SPI too?
> >
> > As shown in the node it only uses i2c which
> > corresponds to the exynos9830-usi.dts. [2]
>
> If you can't specify all the protocol modes for all the USI nodes, then
> make it clear in the commit message.
>

