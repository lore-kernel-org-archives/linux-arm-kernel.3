Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC6DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISejIS0NoteW5+822XXFLOsDwPRqdqjmt0InyJ7Yj2s=; b=zw2+Yqq9WqrZE1rEp8yBd+8KHj
	BCvfiozGGGW7e5N3WBC/wiLmuv83SyrH4s0iDyo+52Fyt1aQnn1KZrUd5kqTCbzq1SVjSZUb2YBnT
	17pNKhJdk0vrD/Tb/oRM5ScVQCPmv7r/9NZWK3MYA8hcEPvRXfDvz8mUw7dbhCa28bMTfyO6vPwc8
	WI2REUQFWiWBygZgaMp7aDIQJa8J5b8jr5fg+fCtj0zb/vz6Tm+uOrhDdhMLHK613Q3748IbM1n+h
	hWslwWBW/XrqFM/Q76eHJSt+QY3C3G8mf+BTupHHD3tynAiqaksYnnO/l0x9R0MzLx8HqD0HALbTG
	K7MNIDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fZf-00000005mkf-4Aw1;
	Tue, 15 Apr 2025 12:39:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fTc-00000005kyG-0hn0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:33:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3491154f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744720398; x=1745325198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISejIS0NoteW5+822XXFLOsDwPRqdqjmt0InyJ7Yj2s=;
        b=W51R8X7aPlUDUDAm05wm64h5p7JMaerkkLhcsdz6bTECfNvZc52G9K/ZKcIMNfiW+s
         GFbuy5fDO+3REcyx76Du22kSI5bBewVH2LKUMyn8NV1RPrusdKOqfxVu0bw6TKG5kEP3
         dP31cSTcDyhzqcQqA32wAkqYo+3RQ0zgsOGnr20jnlq9AD/ru+WOew1ya2FRcQ3guWsx
         EDN6jNA8DpDrRhUnJoCA+ElhjmRq5n+wutDS+QmskI+Xi788Eq/Wdo/afmT+OX4JmzjV
         jnbxydsE6sXUe9n7H9p/ErJ/VPQaZUDCeleQKLFo32P7aCWTRg4MbsFqXHgFwrdhbW7l
         8YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720398; x=1745325198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISejIS0NoteW5+822XXFLOsDwPRqdqjmt0InyJ7Yj2s=;
        b=FHBIoUF6wS4/fI9r5OVXERO1iJZBZjG520Cod4mqsT0GVJZYEAa5PULheY/+H5XA9G
         p598D7KKHNj9pfwpx3gXFrk1OV+XjNxiB+iPBATYPSMDA6GjTTJjsCbgQ+SPXcg6Xr0U
         DoTy1pMULW58r95wev0anZqPJvpdcIAtEuFHdp7oqaCYHzq7NPQButN9xJ7LzC1UYmHa
         YZFtHZEeikAaWss7UlEfyRoJFk89inwJyet21rEgOhg5wXGhKq5ttQPVOqcytDLdcuAk
         guGBxSD+ExNnlMZYhXnZv6EfakNnSMKKzwFTPMjD/zuvqDzxdR0yxI4FH574JeaTiTnO
         SqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4HpG105ayVNJnnUAFoOSlHOIz4jroyoO06K/M0TmupUNrccYPWJDnlQI4oxdA99qJfiJs/fpu6Gt4tOgbDher@lists.infradead.org
X-Gm-Message-State: AOJu0YxXjL0+DPTtoPDknybwYPQpkQxa4/5Mb2jqJSdoQWqQxfxO1xcc
	Vcfw8XFURKmOG8/oyVXqZNIAPVZAsqwO995SE8qYJFbmEBJ9n3U8iiMGyVUNCKSsjGN5jspsuyB
	oztvHmL4oh3Sopwa2kCvx8cKx43M=
X-Gm-Gg: ASbGncs5W96RJyA4R5o2bcgY9UmfZnCHhHahnjZ/GNir1z9krWHppAiJaCnx3cdb5tk
	5ZPrFt1iRTUDMiMlD5tGfHKZhLUkJhY8Ge73WR3/ekXw+suEc6aE6y+T9qXTzUsC2PPxueCkWPC
	yhwJKQstgOjVL0dpybDcgGh9o/rVgh8P0wt1xChXgiuKy3HiplkBGmvrqp7xJFV8pa
X-Google-Smtp-Source: AGHT+IFwJex1FRxNns/6VHFTGeLhVt+kuVcAblH1w86U7VFm3sR6UibK49iXZpLHLruiVNnIp7i8sraSXqWjt0jcORA=
X-Received: by 2002:a05:6000:4021:b0:39c:dfa:c3de with SMTP id
 ffacd0b85a97d-39eaaebc663mr13620738f8f.47.1744720397705; Tue, 15 Apr 2025
 05:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk> <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
In-Reply-To: <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 13:32:51 +0100
X-Gm-Features: ATxdqUFXWhW8_Nw5u1OaWa5-kTdFNmMYCXvTAenRwVBKAiwpOUnqgIySUTDSG10
Message-ID: <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_053320_203978_EB63FA49 
X-CRM114-Status: GOOD (  18.31  )
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

Hi Russell,

On Mon, Apr 14, 2025 at 7:14=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Russell,
>
> On Mon, Apr 14, 2025 at 5:57=E2=80=AFPM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > > +     gbeth->rstc =3D devm_reset_control_get_exclusive(dev, NULL);
> > > +     if (IS_ERR(gbeth->rstc))
> > > +             return PTR_ERR(gbeth->rstc);
> > > +
> > > +     gbeth->dev =3D dev;
> > > +     gbeth->regs =3D stmmac_res.addr;
> > > +     gbeth->plat_dat =3D plat_dat;
> > > +     plat_dat->bsp_priv =3D gbeth;
> > > +     plat_dat->set_clk_tx_rate =3D stmmac_set_clk_tx_rate;
> > > +     plat_dat->clks_config =3D renesas_gbeth_clks_config;
> > > +     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > > +                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > > +                        STMMAC_FLAG_SPH_DISABLE;
> > > +
> > > +     err =3D renesas_gbeth_clks_config(gbeth, true);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     err =3D stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> > > +     if (err)
> > > +             renesas_gbeth_clks_config(gbeth, false);
> > > +
> > > +     return err;
> > > +}
> > > +
> > > +static void renesas_gbeth_remove(struct platform_device *pdev)
> > > +{
> > > +     stmmac_dvr_remove(&pdev->dev);
> > > +
> > > +     renesas_gbeth_clks_config(get_stmmac_bsp_priv(&pdev->dev), fals=
e);
> > > +}
> >
> > Would calling renesas_gbeth_clks_config() in the suspend/resume paths
> > cause problems?
> >
> > If not, please consider using plat_dat->init() and plat_dat->exit()
> > to control these clocks, and then use devm_stmmac_pltfr_probe()
> > which will call the ->init and ->exit functions around the probe
> > as necessary and at removal time (and you won't need the remove
> > method.)
> >
On the RZ/G3E, the upstream support for testing S2R is not yet in a
usable state. So for now, I'll switch to using init/exit callbacks and
drop the PM callback.

Cheers,
Prabhakar

