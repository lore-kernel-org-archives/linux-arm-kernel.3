Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E1BCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 13:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDQooxDkD5fz4sLWBIH6i0SDIPVUTbpTi303GssaIAI=; b=DKlCFkjvMWbQv6Ok+SEb+YUxzv
	gpQfRF3jIsM1kps6O4Rkoq4+6dO7Zm1Cg6Gr4YEd6M9ghA6kya4X3NEveaavKQMldaWzaxkRZwrbr
	GDjmmxZK5WKxEOE449kDl9om/kscFeEMe+jg+zJoPzcbchg9FfYzsRaTAAEafU9LgV5azS+Q8E+4y
	A61Ao9l28E9/K0PiGfOrTAVBlW9jGMtc9/FxOQSYTaWl5CLcYmDLkcj9uVYEdOA0aNeHnXOaHZylY
	ZClnAZTp+zsFGBrrFLqEz2DxyJNr2o7qTxE7fdCkBl2Z8mrhE0IYDCQQPIAkZ/8i2mzv0XV00zF39
	6D2RD+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVtF-00000007xvP-2DC8;
	Tue, 16 Sep 2025 13:38:37 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVtD-00000007xuu-2FjE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 13:38:36 +0000
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-826fe3b3e2bso340083385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 06:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758029913; x=1758634713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDQooxDkD5fz4sLWBIH6i0SDIPVUTbpTi303GssaIAI=;
        b=Z0W+itrh6JOU6CkUV8FNRJyzqQifzE6H45m2mHdwgsWGqsFE8ODTjtnQYeBbK0Zchw
         ehMNceH4Zoh4m1NZORmzMwy3mWWZOY2x8BNXOaqyyxNGLqjxyr+pPG+2aUac24l2A3y1
         vYxN15+yy57rxPC6wx8g2I6+kFpnl3yGIin0ShWn7ggmDxLg9zxL9PTkDMY7x9taPKcX
         aYUHWE26UVgP+d83jHc/wUTWDjJjE+x0Ey3sehkHPYiLZYPC6K3rEfVu4rEtibSq7tZT
         +BoinQZmNXHh9TawJ8bRRAjVv2sOVNOVA5GS3W/KICZB2ajJlXWeZXzhbOCdPeMSLSsY
         2c6g==
X-Forwarded-Encrypted: i=1; AJvYcCUDw6h/MmkDoKlH2U0K5nmEXNJxpGucjc2dFAzl19kF3t7+CXygb8wOqOK5MEEa+UX6huda+J1c5FCK4HWRtHud@lists.infradead.org
X-Gm-Message-State: AOJu0YzRRoji8w4CFSSXMTtnWBXAQvrFeFZUrc8KiCAGIYHvG8AXvTpc
	KJmOZbRSIJeF7RX2D7JkYS9y9yBIaF0xU31tWu/v6AJ05H3oXR0hW9evZQ7F7UDP
X-Gm-Gg: ASbGnctMxMPGWIv6+kP4S00IVUjw2pPVi9DpErpSwLT4dDQj2bk1ugoqyrv4fXi1eEF
	LUpxFTG4tve0oep1MOXJ3nMtEPos5T7FMzAWRq98qH7XPdKHWfmaV07lMHTQqoWmz1Oln41ZzQp
	hvMx00e5mbFELy5oCbQ6a4FEhACDWVGjXN4EvRtLJM+J1N8NEhOLlGYSraOm3uo1npKlaNO9ZFO
	IyJCvltFs0dtapYIDPHSqFucwNrgsLvk98xVrEg7+BtZbUiugtQT9e2BKiOmwE7V/K2/YIZx47y
	RdVQtPuyOjCG6Mi7oqrwjAlqIuxeEjZkXXMf4LD4rnSa58ZK1b6XXXVUGm3sOkwTYJeETwz1/co
	OkvhHmt+J55iOhfVhwKORFqzVLh350MuiABxNHjhkFjXUfRkyZexbu8aiWQ+A
X-Google-Smtp-Source: AGHT+IEQevdhMH1v8bgnbro9iukkGsicPdjMRuothPk3GqgayTvwc8V7XcbcYxoRSOktZBL5aE7cmQ==
X-Received: by 2002:a05:620a:a485:b0:809:8ef7:8546 with SMTP id af79cd13be357-824013d5ceemr2019682285a.75.1758029912759;
        Tue, 16 Sep 2025 06:38:32 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820ce19d151sm937328785a.50.2025.09.16.06.38.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 06:38:32 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-78393b448a1so19080236d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 06:38:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXnRjTcIymfCHmQtLM4H6QNZnANVfHbXaHgHYwPW8oYf4ISMs9yD1dcF2jYY0JIgnWLNc4bp0bKQ0DK8Axbjcl@lists.infradead.org
X-Received: by 2002:a05:6122:1d8c:b0:53b:174d:98f2 with SMTP id
 71dfb90a1353d-54a16b20009mr5200853e0c.3.1758029474999; Tue, 16 Sep 2025
 06:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <aMlgg_QpJOEDGcEA@monster>
In-Reply-To: <aMlgg_QpJOEDGcEA@monster>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 15:31:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
X-Gm-Features: AS18NWCih78Z1mvXR97O_iR6cJDURxsOD6O73Iub1rATQe0jxKnm2iY0iJuCAa8
Message-ID: <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/T2H SoC
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_063835_583090_5094A1E3 
X-CRM114-Status: GOOD (  29.89  )
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

Hi Anders,

On Tue, 16 Sept 2025 at 15:05, Anders Roxell <anders.roxell@linaro.org> wrote:
> On 2025-09-08 11:59, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
> > where the GMAC is connected through a MIIC PCS. Introduce a new
> > `has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
> > handling is required.
> >
> > When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
> > instance with `miic_create()`, and wires it into phylink. Proper cleanup
> > is done with `miic_destroy()`. New init/exit/select hooks are added to
> > `plat_stmmacenet_data` for PCS integration.
> >
> > Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
> > driver so the PCS support is always available.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
> >   as it is always set for all the SoCs.
> > - Updated Kconfig to include RZ/T2H and RZ/N2H.
> >
> > v1->v2:
> > - No changes.
>
> The following warning is seen when doing a defconfig build (make
> defconfig) for arm64 on the Linux next-20250915 tag.
>
> First seen on next-20250915
> Good: next-20250912
> Bad: next-20250915
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> This is the build warning:
> WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>   Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
>   Selected by [m]:
>   - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
>
> WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>   Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
>   Selected by [m]:
>   - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
> I: config: PASS in 0:00:01.592356

Thanks for your report!

    config DWMAC_RENESAS_GBETH
        depends on OF && (ARCH_RENESAS || COMPILE_TEST)
        select PCS_RZN1_MIIC

    config PCS_RZN1_MIIC
        depends on ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087 || COMPILE_TEST

"ARCH_RENESAS" is wider than "ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087".
I would just change the latter to ARCH_RENESAS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

