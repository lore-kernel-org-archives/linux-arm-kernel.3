Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318F8C02196
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybYhgoqvdEUqCkpSu+wLe1vUmUBCbbPBzWxAddTN9tM=; b=m2GK4KtO9PBcPcfudH3A7gFdWM
	hup0Ip2Yegi1j7BnaAo/ODC0UBXFu+7Hbmu36LP6cSeZdGNxopcZmNofl9DoXkUFoCNUpJWpws07n
	WJrCg4XotlOObf/Ysvvu02VeElihVHS78ysH5P3GGuCqIv8p+qqczswt6iuVpH2IRxKqyyq7+J83V
	z2vpNXyRn+PscviBrWBNv5zhuBHWu3lfTEPGGK48IfzBOg4hJ7ODVmc1MvNxJnpcKQ8E+oGG8D7S7
	DfLtevh3GKQFahe/BMshWmu5YKHjg1p7BG/32/znsAcegVf2pHK3GAukslUyi+mJ2D0wwhsBZY7gS
	DFzQnFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdT0-000000032UT-3ux1;
	Wed, 05 Feb 2025 11:21:15 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdRf-000000032NP-0nf6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 11:19:52 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6f4bc408e49so40886427b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 03:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1738754389; x=1739359189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybYhgoqvdEUqCkpSu+wLe1vUmUBCbbPBzWxAddTN9tM=;
        b=foIQy9VlNttYMo6rCNly/iMVAaNKGAS9M6sL2g2NJYpp+b3gb1AG7tRGDx+Rd0GAHe
         NfRBJtwuZZdmrNcSKuJTRNkGMX6wKfKE3pcYPuRL7798pLehR68jXNrt8tl5MxRft8V7
         DB/yEECIyxXLkRpL2Z2ykq/sWZ3st9aCN7lGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738754389; x=1739359189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybYhgoqvdEUqCkpSu+wLe1vUmUBCbbPBzWxAddTN9tM=;
        b=n1GCjcRki1lFKpL7KeIQnd+Qj1QGSFi3gP1qQ9EPes2D0Y+MvHURdtMW1Si7WrH9gj
         8F8Y0p9Bgzd86Rnz/9/HQwzb5UDS2Rh4v4OYHgzLyNKXN8/nXWh6U5JH11ehR/jDdXWD
         gwrkmX+5L53VOP9KhxkvEmb/nFVWkZMSVMezXvVByv/qx3RCTue9Q2X2H5eCW3yFEgn9
         dsr8E3vbCMNNGmRjn64sb2lJP7GKTcQ9A36WEfJfskT8pOq5fC84oVBHm4uYH8Shm2V8
         rKeRMFhu9KA0VQ+UBP9K+6csxL5XfRIHG3AY0+eVdE2o3QIVdiYnbl8lMiwIQRPpuXy4
         UCCg==
X-Forwarded-Encrypted: i=1; AJvYcCV0pwSCqn/lGUsiKEForM7bLdacoMLaynIVQOS5Y8MxE7QE2YAwoCe9Uij2FuS5F66ksIPpMD7MmDjFybnPORQy@lists.infradead.org
X-Gm-Message-State: AOJu0YyUTUKWIPG8Yh+aeFzhVMkhAWs0gBBYFgCRvQxH6HqFxPRpHck3
	7Gplium3PDKSnPyIfciL1PGxJFu9dxUqti2Lh59YdGBCmCRKGfEOOcdR4sWpcnl4FP4koswXAIV
	tER7VgP76ThTDnyyuWpVQ5swMVFAIzvamC3bZuw==
X-Gm-Gg: ASbGncsBFaugxZP/cHfK6W1kQPDW5Bj487oixtar2mv3Ksks6AC9MEPsM4HdyJ2Pzs9
	K5Tisl7LZi3QL9LLPpU6IQVcrhY07U8bFKoTednE7sCB+19iN6UB8dnED9DMd6xpOPb8KzAE=
X-Google-Smtp-Source: AGHT+IHrHyVnC3ucjf5CnroJR9CV5ZcoEk66TZwNGhnQNhqYfAzUhk+K50MujLR1SniK7HjaTQcDJUvQT8Lporl78yk=
X-Received: by 2002:a05:690c:7407:b0:6f7:409c:f645 with SMTP id
 00721157ae682-6f989e3acdemr19242597b3.4.1738754389549; Wed, 05 Feb 2025
 03:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com> <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
In-Reply-To: <20250205-clk-ssc-v2-3-fa73083caa92@nxp.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 5 Feb 2025 12:19:38 +0100
X-Gm-Features: AWEUYZl4J7MiWYs5V1DsV6zpiNupetaeRUoMIlCCJYHJv9tWjHggrdqzDtOIt9g
Message-ID: <CABGWkvqXf0ZmJKofrbahB5N5uer6ye6Q4s_PXz_Z61vG2pMu=g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: imx: pll14xx: support spread spectrum clock generation
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Abel Vesa <abelvesa@kernel.org>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_031951_252274_8BBC6F42 
X-CRM114-Status: GOOD (  22.27  )
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

On Wed, Feb 5, 2025 at 10:51=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add support for spread spectrum clock (SSC) generation to the pll14xxx
> driver.
>
> Co-developed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

It doesn=E2=80=99t seem right to me.
You can=E2=80=99t take 90% of my patch, where the SSC management was actual=
ly
implemented,
add 10%, and consider yourself the author of the patch.
Please correct it in version 3.

Thanks and regards,
Dario

> ---
>  drivers/clk/imx/clk-pll14xx.c | 66 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.=
c
> index f290981ea13bdba3602af7aa44aaadfe0b78dcf9..3bdce762a9d651a6fb048dcbf=
58db396af9d3aaf 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -20,6 +20,8 @@
>  #define GNRL_CTL       0x0
>  #define DIV_CTL0       0x4
>  #define DIV_CTL1       0x8
> +#define SSCG_CTRL      0xc
> +
>  #define LOCK_STATUS    BIT(31)
>  #define LOCK_SEL_MASK  BIT(29)
>  #define CLKE_MASK      BIT(11)
> @@ -31,15 +33,26 @@
>  #define KDIV_MASK      GENMASK(15, 0)
>  #define KDIV_MIN       SHRT_MIN
>  #define KDIV_MAX       SHRT_MAX
> +#define SSCG_ENABLE    BIT(31)
> +#define MFREQ_CTL_MASK GENMASK(19, 12)
> +#define MRAT_CTL_MASK  GENMASK(9, 4)
> +#define SEL_PF_MASK    GENMASK(1, 0)
>
>  #define LOCK_TIMEOUT_US                10000
>
> +enum imx_pll14xx_ssc_mod_type {
> +       IMX_PLL14XX_SSC_DOWN_SPREAD,
> +       IMX_PLL14XX_SSC_UP_SPREAD,
> +       IMX_PLL14XX_SSC_CENTER_SPREAD,
> +};
> +
>  struct clk_pll14xx {
>         struct clk_hw                   hw;
>         void __iomem                    *base;
>         enum imx_pll14xx_type           type;
>         const struct imx_pll14xx_rate_table *rate_table;
>         int rate_count;
> +       struct clk_spread_spectrum      ssc_conf;
>  };
>
>  #define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
> @@ -349,6 +362,42 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, =
unsigned long drate,
>         return 0;
>  }
>
> +static void clk_pll1443x_enable_ssc(struct clk_hw *hw, unsigned long par=
ent_rate,
> +                                   unsigned int pdiv, unsigned int mdiv)
> +{
> +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +       struct clk_spread_spectrum *conf =3D &pll->ssc_conf;
> +       u32 sscg_ctrl, mfr, mrr, mod_type;
> +
> +       sscg_ctrl =3D readl_relaxed(pll->base + SSCG_CTRL);
> +       sscg_ctrl &=3D
> +               ~(SSCG_ENABLE | MFREQ_CTL_MASK | MRAT_CTL_MASK | SEL_PF_M=
ASK);
> +
> +       mfr =3D parent_rate / (conf->modfreq * pdiv * (1 << 5));
> +       mrr =3D ((conf->spreaddepth / 100) * mdiv * (1 << 6)) / (100 * mf=
r);
> +
> +       switch (conf->method) {
> +       case CLK_SSC_CENTER_SPREAD:
> +               mod_type =3D IMX_PLL14XX_SSC_CENTER_SPREAD;
> +               break;
> +       case CLK_SSC_UP_SPREAD:
> +               mod_type =3D IMX_PLL14XX_SSC_UP_SPREAD;
> +               break;
> +       case CLK_SSC_DOWN_SPREAD:
> +               mod_type =3D IMX_PLL14XX_SSC_DOWN_SPREAD;
> +               break;
> +       default:
> +               mod_type =3D IMX_PLL14XX_SSC_DOWN_SPREAD;
> +               break;
> +       }
> +
> +       sscg_ctrl |=3D SSCG_ENABLE | FIELD_PREP(MFREQ_CTL_MASK, mfr) |
> +               FIELD_PREP(MRAT_CTL_MASK, mrr) |
> +               FIELD_PREP(SEL_PF_MASK, mod_type);
> +
> +       writel_relaxed(sscg_ctrl, pll->base + SSCG_CTRL);
> +}
> +
>  static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>                                  unsigned long prate)
>  {
> @@ -370,6 +419,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, u=
nsigned long drate,
>                 writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
>                                pll->base + DIV_CTL1);
>
> +               if (pll->ssc_conf.enable)
> +                       clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rat=
e.mdiv);
> +
>                 return 0;
>         }
>
> @@ -410,6 +462,9 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, u=
nsigned long drate,
>         gnrl_ctl &=3D ~BYPASS_MASK;
>         writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
>
> +       if (pll->ssc_conf.enable)
> +               clk_pll1443x_enable_ssc(hw, prate, rate.pdiv, rate.mdiv);
> +
>         return 0;
>  }
>
> @@ -465,6 +520,16 @@ static void clk_pll14xx_unprepare(struct clk_hw *hw)
>         writel_relaxed(val, pll->base + GNRL_CTL);
>  }
>
> +static int clk_pll1443x_set_spread_spectrum(struct clk_hw *hw,
> +                                           struct clk_spread_spectrum *c=
lk_ss)
> +{
> +       struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
> +
> +       memcpy(&pll->ssc_conf, clk_ss, sizeof(pll->ssc_conf));
> +
> +       return 0;
> +}
> +
>  static const struct clk_ops clk_pll1416x_ops =3D {
>         .prepare        =3D clk_pll14xx_prepare,
>         .unprepare      =3D clk_pll14xx_unprepare,
> @@ -485,6 +550,7 @@ static const struct clk_ops clk_pll1443x_ops =3D {
>         .recalc_rate    =3D clk_pll14xx_recalc_rate,
>         .round_rate     =3D clk_pll1443x_round_rate,
>         .set_rate       =3D clk_pll1443x_set_rate,
> +       .set_spread_spectrum =3D clk_pll1443x_set_spread_spectrum,
>  };
>
>  struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *na=
me,
>
> --
> 2.37.1
>


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

