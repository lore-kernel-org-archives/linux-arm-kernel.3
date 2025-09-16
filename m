Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F2ACAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1/wO2aa6vwf2RnAiZIcGlD55m2MeNlNGw0Ms6XcA88=; b=f4ENVSkeBCHbfIM/qW4MqQAxDq
	6a/NR8WNeDP7Pir3ik5D0InnfTeiuy3G2VU6OE1875MOsou1Uq9JOrg8iWo7o6EC+oMux3r4cgE1n
	qr/eKTh2y7nDMH4NQ3gCtNNaZ/zQR45Y8R7idLPsvNhcHQoxKR2suieQTa2Um4WspblhQLAEjZVlK
	2A0JVe7gseSk8rata9SU+xzAoy7clMTjDOnhGGOi6N3mt09Y4GbkbJyonwCUgVZw+dAt0RLN6fyhT
	Csf8GWLTAbVjmfBqPSpvi4juZtcxrebUPzFdLNglY9rX4urzp06Ud92Ox8Xf+N1R2rm2RUXjH3i+f
	phMFL+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWFt-000000081FS-1chD;
	Tue, 16 Sep 2025 14:02:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWFq-000000081E9-2Uq6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:01:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b07d4d24d09so322576066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758031316; x=1758636116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1/wO2aa6vwf2RnAiZIcGlD55m2MeNlNGw0Ms6XcA88=;
        b=PooRtJGgj8sV3qZEyXFtksZ1R3kXNASE3BvyF6WyAdlokCcDLyutfsH5qyUfmnKWoI
         DdL7UEkSBQJgNNelSrhrCgXiJyt/85LR4ubkEFdnLFJ06zPJRfgZNKNd/d0kz/LZjNzA
         Kqq2ZClSrsSKkfc9YwQIBVeTvOWRNXOOV1laSeMlc9gCfG0HaXbLMJ4Sgk8tcOiKzkFb
         ZbaEuZuRv8Ktu1YagLUEbz8DhdFnZSBelx+Im7+dI2nKrT1SaYGQT7NXCSy5qyMpYL4g
         O6enXcT/Mj2d41RuNBMJW+tLlTD5kcItoX0xO5/xAvodY4qWU7lYhWfS5EV4kNG02TU3
         HQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031316; x=1758636116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1/wO2aa6vwf2RnAiZIcGlD55m2MeNlNGw0Ms6XcA88=;
        b=xPl4Mpb9G2uTYsRv/zHqIcJAv2MwIOvpcV95EqkKISyFkfNiSQ2X4R06y02QwAY9EV
         m+mETtLFsw+AigX36uECW9WFJW5Z/1NqB9tHccMSzvQOW/Y3VwohkiY9zD8YV8TQKWxu
         pTU3/7ObE8UIQLm0jYYcRUlkbnJanWYHf48bjZWeMKK7DqtuJM3/dur/5r728mErHOHc
         E7EiPg0iI/ciTCp2Cwt+wWypO46trPyQUAeF3ImhbJAApoz3/MTLomx1TktNy3vZfVS6
         oGVsJtpHawpxLAYX9e2F76uZywpG+mHyYtTkQHakzD405xjuVNS6FEk4Dy1hPEOEqu5R
         5BCg==
X-Forwarded-Encrypted: i=1; AJvYcCWiiMoIOu5A2KdKmZBHhcG5hi4Hc4fmoIuRuu2KLnwabILwVgQQqqq99OPT3rbmoL6oXHxSlMVvlf77VKFAp/0W@lists.infradead.org
X-Gm-Message-State: AOJu0YwIXwbCaxg5dGeTbOh0ppxh0/w4lgICY65XNIOU6wZeAGQx4tWc
	bgVQAPOlvc44S0nVtHxCLeP6B/PnmjUEctKteo4L30KP81ZqH/cAwi4EJLG0NWXE/HTyn8ikDOs
	e7O3mdiRYmmNeXmUQu+xLHWRHfSzh01M=
X-Gm-Gg: ASbGncvLTtoLGm6OwMK9VjXNNoYfh6JmzZkNzUq/RzwdEg+HfWuOLK9OBlQuKqi36qb
	gZqo6iacKs5m87m5wbVhnzP6CufYpoc8A9wWVGCREHhGjjqqMVfvHlVYMbT/SeCzQISgg0mckD7
	Mcw9AUIABuZdVcyLeZWEoOWMDjForvRsRFomlkz3NDrQSDkHfl7T2FjGJ4AU5npOQaU2R4GXy2i
	nHAvplA
X-Google-Smtp-Source: AGHT+IF6Zy4nzr1OXuX8lE0GqEoG4kJn0jZymLRdcAOKhzS2jAVa02oHblL7nubcp0VuU3f+RU4UUOjge2+K+7voqcc=
X-Received: by 2002:a17:907:9629:b0:afd:d994:7d1a with SMTP id
 a640c23a62f3a-b07c3ada566mr1656686866b.63.1758031315726; Tue, 16 Sep 2025
 07:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aMlgg_QpJOEDGcEA@monster> <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 16 Sep 2025 15:01:28 +0100
X-Gm-Features: AS18NWCVgZqFQH49bSZ6oVph3-y6Eo3LOyTc2vGW-dgo3A64cLzcN5-yV35knnc
Message-ID: <CA+V-a8snd9Qeb_Fbj=_E6Y28EUV-ad+PO=cZcWrZ2F1_RwscGw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/T2H SoC
To: Anders Roxell <anders.roxell@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_070158_660366_8E3B29B2 
X-CRM114-Status: GOOD (  25.71  )
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

Hi Andres and Geert,

On Tue, Sep 16, 2025 at 2:31=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Anders,
>
> On Tue, 16 Sept 2025 at 15:05, Anders Roxell <anders.roxell@linaro.org> w=
rote:
> > On 2025-09-08 11:59, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC=
,
> > > where the GMAC is connected through a MIIC PCS. Introduce a new
> > > `has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
> > > handling is required.
> > >
> > > When enabled, the driver parses the `pcs-handle` phandle, creates a P=
CS
> > > instance with `miic_create()`, and wires it into phylink. Proper clea=
nup
> > > is done with `miic_destroy()`. New init/exit/select hooks are added t=
o
> > > `plat_stmmacenet_data` for PCS integration.
> > >
> > > Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GB=
ETH
> > > driver so the PCS support is always available.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v2->v3:
> > > - Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_fl=
ags
> > >   as it is always set for all the SoCs.
> > > - Updated Kconfig to include RZ/T2H and RZ/N2H.
> > >
> > > v1->v2:
> > > - No changes.
> >
> > The following warning is seen when doing a defconfig build (make
> > defconfig) for arm64 on the Linux next-20250915 tag.
> >
> > First seen on next-20250915
> > Good: next-20250912
> > Bad: next-20250915
> >
> > Regression Analysis:
> > - New regression? yes
> > - Reproducibility? yes
> >
> > Build regression: WARNING: unmet direct dependencies detected for PCS_R=
ZN1_MIIC
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > This is the build warning:
> > WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
> >   Depends on [n]: NETDEVICES [=3Dy] && OF [=3Dy] && (ARCH_RZN1 [=3Dn] |=
| COMPILE_TEST [=3Dn])
> >   Selected by [m]:
> >   - DWMAC_RENESAS_GBETH [=3Dm] && NETDEVICES [=3Dy] && ETHERNET [=3Dy] =
&& NET_VENDOR_STMICRO [=3Dy] && STMMAC_ETH [=3Dm] && STMMAC_PLATFORM [=3Dm]=
 && OF [=3Dy] && (ARCH_RENESAS [=3Dy] || COMPILE_TEST [=3Dn])
> >
> > WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
> >   Depends on [n]: NETDEVICES [=3Dy] && OF [=3Dy] && (ARCH_RZN1 [=3Dn] |=
| COMPILE_TEST [=3Dn])
> >   Selected by [m]:
> >   - DWMAC_RENESAS_GBETH [=3Dm] && NETDEVICES [=3Dy] && ETHERNET [=3Dy] =
&& NET_VENDOR_STMICRO [=3Dy] && STMMAC_ETH [=3Dm] && STMMAC_PLATFORM [=3Dm]=
 && OF [=3Dy] && (ARCH_RENESAS [=3Dy] || COMPILE_TEST [=3Dn])
> > I: config: PASS in 0:00:01.592356
>
> Thanks for your report!
>
>     config DWMAC_RENESAS_GBETH
>         depends on OF && (ARCH_RENESAS || COMPILE_TEST)
>         select PCS_RZN1_MIIC
>
>     config PCS_RZN1_MIIC
>         depends on ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087 || COMPI=
LE_TEST
>
> "ARCH_RENESAS" is wider than "ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G0=
87".
> I would just change the latter to ARCH_RENESAS.
>
Thank you both. I'll create a patch updating it to use `ARCH_RENESAS`.

Cheers,
Prabhakar

