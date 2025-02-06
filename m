Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3D5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSEjI0/PhbFe1xLIAMNstyhshP1bNC0F9pZ0DzpzpJE=; b=iS6OLV3wzNdZWNfPvIUantEPFD
	STamEkBiqnfJPFRbNMEQMwfDmZTK25X4eTadRc8QXCpRdMAmpYLS2dY+HIIxc+ydFVep8qfw1lQiE
	p+0iGOHVtIFHod2PHll3kZR3/zTPb3mBD1Q3ngTatr+3mERV/jCMjFg3v7uwmJOgDvZ7KIOxs3m+l
	agkR4O7um4eO3Iro4/nmXI4zxSbdtWEjK+o1/dx1OTl2CoUCD6l0Nl2xPqlQMqYOndI1j7AoZopa9
	W0aidyYN2iXS6SagN5jiTbeFEaPJ+cGYroX5aZchobFj4B3xeRHiO1XV0UlsBTzqWWmv8Cremp54J
	1wcst1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3sb-00000006idG-2zNS;
	Thu, 06 Feb 2025 15:33:25 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3rE-00000006iQd-2P6L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:32:01 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6f4434b5305so8855237b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 07:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1738855919; x=1739460719; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSEjI0/PhbFe1xLIAMNstyhshP1bNC0F9pZ0DzpzpJE=;
        b=IWGnEHLvGwrwDKBoP4pmSCQZEPfYYR6ebX4pDva6DUApHQUBkpozw1nmtf8HG8eDIv
         CRPxmxNsOHt0IWA9u6mR2hFGTa5rUYzSNYwi7f01QNCEsjGW1zTrVuxdJpNf/6JDLyPL
         zIKz9wjXNBSePBKrHTb10TDVw7AbTYSYt+68M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738855919; x=1739460719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSEjI0/PhbFe1xLIAMNstyhshP1bNC0F9pZ0DzpzpJE=;
        b=H4qbuKVQSHq6FrJ6jnYeVln0AL6VC/1JtJ2X7W/jlUc1zou8poJ4Gx0InhhBP3uA7q
         XnNmpo+8j0GCgH6+FZeZ2C0zlSFkeIBxDJtOG/vCXOAkPLSEsFdXKSJJ0/4caoPDqJMX
         +t0cJ0Ldmht3qkUiSmqsrqgOkysRAXTzBvvR3Ixj5gys8XAuFcvLoSkolkz49WjMl5vI
         tqeWc1SIEowyLsTaqO50QWG2CyMboHogrrs+mLFeCRq0ZTQkyfrjzbqjjf1gj28mSW0q
         NSS5s+j50RyntxR11uD2HG1agQXW90h+95SfHQlwlSkKuhkBKZObufiP2pv05QzqUEMQ
         iE2A==
X-Forwarded-Encrypted: i=1; AJvYcCXGUYRpxJfU2aD2i1ZCB2puZA1+y4R1wfSY8+pwNY/DQ2veNA02vm5LOay9ITimP1+7VRCrXVHTbTTgYavDBcMW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk30qIYZguTu2RAP2okp73PCXc3iCVzX/PNgoNKXZbufckEpMO
	1I3F5Jhj9aSpGLyg90hKOvCS3KR22dhOmAHO0rz/kFjeMvMA6gfwehKP+Nd46jSb08mBBsGKu7W
	hSoTSoWDvU7CtPo/OyqHnRdJNxkgOS2p9BvWWRw==
X-Gm-Gg: ASbGncsRBPML6pxx2n5z3qY0Gznvsre9wjIMY528pLu/3CaKc+kdU9gHuSwJzUB7dVr
	9hyKGIS39aD0UO9/mKt4dh1YX4Ydi2i1kWAcv+bRwY36XWHLqZAhGhYLXbopMrdfsHJKpN8w=
X-Google-Smtp-Source: AGHT+IFBR4yKWi12OxeMKiZJ7mNefCRGP6DMSE17bw0bh1mSFoEoNgEKrlLuvfsnGxNrudo9/TnSwafSOEZjwfBjbM8=
X-Received: by 2002:a05:690c:691:b0:6f9:87da:b763 with SMTP id
 00721157ae682-6f989e2f6a4mr64301617b3.12.1738855919056; Thu, 06 Feb 2025
 07:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com> <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
 <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com> <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459F1CE0E8049355ADC9F3C88F62@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 6 Feb 2025 16:31:46 +0100
X-Gm-Features: AWEUYZnQk9hBdobcOkaoMUgqLWtL6CPT5MwibT2ZdKB14CAL3v3eIVCfdwwIt1Y
Message-ID: <CABGWkvrKe6az5XR=MvdMwBOfeXqd5yPoF4Yf4pqyyGPD4Kpvpg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock generation
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Abel Vesa <abelvesa@kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_073200_627887_1C865538 
X-CRM114-Status: GOOD (  37.96  )
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

Hi Peng,

On Thu, Feb 6, 2025 at 1:53=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum
> > clock generation
> >
> > Hi Peng,
> >
> > On Wed, Feb 5, 2025 at 10:51=E2=80=AFAM Peng Fan (OSS)
> > <peng.fan@oss.nxp.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Add support for spread spectrum clock (SSC) generation to the
> > pll14xxx
> > > driver.
> > >
> > > Co-developed-by: Dario Binacchi
> > <dario.binacchi@amarulasolutions.com>
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > It doesn=E2=80=99t seem right to me.
> > You can=E2=80=99t take 90% of my patch, where the SSC management was
> > actually implemented, add 10%, and consider yourself the author of
> > the patch.
> > Please correct it in version 3.
>
> Ah. But if you look into the patches, 10% is not accurate
> per lines I change.
> you could see more changes compared with your patch
> https://lore.kernel.org/all/20250118124044.157308-18-dario.binacchi@amaru=
lasolutions.com/.
>
> 1. Use set_spread_spectrm ops
> 2. Use clk_spread_spectrum to replace imx_pll14xx_ssc
> 3. Drop imx_clk_pll14xx_ssc_parse_dt and clk_pll14xx_ssc_mod_type. This o=
ne would
>  count over 50% changes.
>
> The logic that I only did minor update is the function
> clk_pll1443x_enable_ssc with switching to use clk_spread_sectrum

Sorry if I miscounted the lines, but here we are not considering who
actually implemented
the algorithmic part of the SSC management and all the time spent
testing the code on more
than one platform/board with each submission of the series for all 9 versio=
ns.

[1] https://lore.kernel.org/all/20250118124044.157308-18-dario.binacchi@ama=
rulasolutions.com/

Your changes, which are unnecessary for the clk-scmi.c changes, only
serve to support the
DT binding `assigned-clock-sscs`, which, as Krzysztof also reiterated:

https://github.com/devicetree-org/dt-schema/pull/154

you should have proposed during the review of series [1]. You are the
NXP reviewer.

>
> If you think it is not fair, I could drop this patch in V3 and leave it t=
o you to handle.
> I take this patch in the patchset, mainly to ease your work and make

Sorry for quoting Krzysztof again, but:
"Three months iMX8 patchsets, multiple reviews and no single comment
from you till January!"

So please, if you really want to ease my work, then remove this patch
from this series and resume
reviewing series [1].

Thanks and regards,
Dario

> assigned-clock-sscs moving forward, considering SCMI spec needs update
> (clk-scmi.c changes will not land soon).
>
> Regards
> Peng.
>
> >
> > Thanks and regards,
> > Dario
> >
> > > ---
> > >  drivers/clk/imx/clk-pll14xx.c | 66
> > > +++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 66 insertions(+)
> > >
> > > diff --git a/drivers/clk/imx/clk-pll14xx.c
> > > b/drivers/clk/imx/clk-pll14xx.c index
> > >
> > f290981ea13bdba3602af7aa44aaadfe0b78dcf9..3bdce762a9d651a6fb
> > 048dcbf58d
> > > b396af9d3aaf 100644
> > > --- a/drivers/clk/imx/clk-pll14xx.c
> > > +++ b/drivers/clk/imx/clk-pll14xx.c
> > > @@ -20,6 +20,8 @@
> > >  #define GNRL_CTL       0x0
> > >  #define DIV_CTL0       0x4
> > >  #define DIV_CTL1       0x8
> > > +#define SSCG_CTRL      0xc
> > > +
> > >  #define LOCK_STATUS    BIT(31)
> > >  #define LOCK_SEL_MASK  BIT(29)
> > >  #define CLKE_MASK      BIT(11)
> > > @@ -31,15 +33,26 @@
> > >  #define KDIV_MASK      GENMASK(15, 0)
> > >  #define KDIV_MIN       SHRT_MIN
> > >  #define KDIV_MAX       SHRT_MAX
> > > +#define SSCG_ENABLE    BIT(31)
> > > +#define MFREQ_CTL_MASK GENMASK(19, 12) #define
> > MRAT_CTL_MASK
> > > +GENMASK(9, 4)
> > > +#define SEL_PF_MASK    GENMASK(1, 0)
> > >
> > >  #define LOCK_TIMEOUT_US                10000
> > >
> > > +enum imx_pll14xx_ssc_mod_type {
> > > +       IMX_PLL14XX_SSC_DOWN_SPREAD,
> > > +       IMX_PLL14XX_SSC_UP_SPREAD,
> > > +       IMX_PLL14XX_SSC_CENTER_SPREAD, };
> > > +
> > >  struct clk_pll14xx {
> > >         struct clk_hw                   hw;
> > >         void __iomem                    *base;
> > >         enum imx_pll14xx_type           type;
> > >         const struct imx_pll14xx_rate_table *rate_table;
> > >         int rate_count;
> > > +       struct clk_spread_spectrum      ssc_conf;
> > >  };
> > >
> > >  #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw=
)
> > > @@ -349,6 +362,42 @@ static int clk_pll1416x_set_rate(struct
> > clk_hw *hw, unsigned long drate,
> > >         return 0;
> > >  }
> > >
> > > +static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned
> > long parent_rate,
> > > +                                   unsigned int pdiv, unsigned int
> > > +mdiv) {
> > > +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> > > +       struct clk_spread_spectrum *conf =3D &pll->ssc_conf;
> > > +       u32 sscg_ctrl, mfr, mrr, mod_type;
> > > +
> > > +       sscg_ctrl =3D readl_relaxed(pll->base + SSCG_CTRL);
> > > +       sscg_ctrl &=3D
> > > +               ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK |
> > > + SEL_PF_MASK);
> > > +
> > > +       mfr =3D parent_rate / (conf->modfreq * pdiv * (1 << 5));
> > > +       mrr =3D ((conf->spreaddepth / 100) * mdiv * (1 << 6)) / (100 =
*
> > > + mfr);
> > > +
> > > +       switch (conf->method) {
> > > +       case CLK_SSC_CENTER_SPREAD:
> > > +               mod_type =3D IMX_PLL14XX_SSC_CENTER_SPREAD;
> > > +               break;
> > > +       case CLK_SSC_UP_SPREAD:
> > > +               mod_type =3D IMX_PLL14XX_SSC_UP_SPREAD;
> > > +               break;
> > > +       case CLK_SSC_DOWN_SPREAD:
> > > +               mod_type =3D IMX_PLL14XX_SSC_DOWN_SPREAD;
> > > +               break;
> > > +       default:
> > > +               mod_type =3D IMX_PLL14XX_SSC_DOWN_SPREAD;
> > > +               break;
> > > +       }
> > > +
> > > +       sscg_ctrl |=3D SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK,
> > mfr) |
> > > +               FIELD_PREP(MRAT_CTL_MASK, mrr) |
> > > +               FIELD_PREP(SEL_PF_MASK, mod_type);
> > > +
> > > +       writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL); }
> > > +
> > >  static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long
> > drate,
> > >                                  unsigned long prate)  { @@ -370,6
> > > +419,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw,
> > unsigned long drate,
> > >                 writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
> > >                                pll->base + DIV_CTL1);
> > >
> > > +               if (pll->ssc_conf.enable)
> > > +                       clk_pll1443x_enable_ssc(hw, prate, rate.pdiv,
> > > + rate.mdiv);
> > > +
> > >                 return 0;
> > >         }
> > >
> > > @@ -410,6 +462,9 @@ static int clk_pll1443x_set_rate(struct
> > clk_hw *hw, unsigned long drate,
> > >         gnrl_ctl &=3D ~BYPASS_MASK;
> > >         writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
> > >
> > > +       if (pll->ssc_conf.enable)
> > > +               clk_pll1443x_enable_ssc(hw, prate, rate.pdiv,
> > > + rate.mdiv);
> > > +
> > >         return 0;
> > >  }
> > >
> > > @@ -465,6 +520,16 @@ static void clk_pll14xx_unprepare(struct
> > clk_hw *hw)
> > >         writel_relaxed(val, pll->base + GNRL_CTL);  }
> > >
> > > +static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
> > > +                                           struct clk_spread_spectru=
m
> > > +*clk_ss) {
> > > +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> > > +
> > > +       memcpy(&pll->ssc_conf, clk_ss, sizeof(pll->ssc_conf));
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static const struct clk_ops clk_pll1416x_ops =3D {
> > >         .prepare        =3D clk_pll14xx_prepare,
> > >         .unprepare      =3D clk_pll14xx_unprepare,
> > > @@ -485,6 +550,7 @@ static const struct clk_ops clk_pll1443x_ops
> > =3D {
> > >         .recalc_rate    =3D clk_pll14xx_recalc_rate,
> > >         .round_rate     =3D clk_pll1443x_round_rate,
> > >         .set_rate       =3D clk_pll1443x_set_rate,
> > > +       .set_spread_spectrum =3D clk_pll1443x_set_spread_spectrum,
> > >  };
> > >
> > >  struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const
> > char
> > > *name,
> > >
> > > --
> > > 2.37.1
> > >
> >
> >
> > --
> >
> > Dario Binacchi
> >
> > Senior Embedded Linux Developer
> >
> > dario.binacchi@amarulasolutions.com
> >
> > __________________________________
> >
> >
> > Amarula Solutions SRL
> >
> > Via Le Canevare 30, 31100 Treviso, Veneto, IT
> >
> > T. +39 042 243 5310
> > info@amarulasolutions.com
> >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F
> > www.amarulasolutions.com%2F&data=3D05%7C02%7Cpeng.fan%40nxp.
> > com%7Cbeaf5bdcc6694a5a1a1708dd45d701db%7C686ea1d3bc2b4c6
> > fa92cd99c5c301635%7C0%7C0%7C638743511953067272%7CUnkno
> > wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDA
> > wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C
> > %7C%7C&sdata=3DUFgy1bS7QJ7qenzKFTkPBNfOGn0V89CGR9NLOBka0U
> > 8%3D&reserved=3D0



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

