Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266AAD358E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=; b=OyN2LOiWa5e03Ss2a83QtAi/T/
	WEwsfwAnh5ybLXWg04olrziDnbzYDeE/nzXeghLeSCOw6ulvf1Rvb8FQS+awRxsFfr3EWHpslbiZF
	IMXh9OlwNCN9M0fHWR8jAAQgcqO+K1bjJaSG075uyuywEolaUWKtk8pjIU1iBXDoX1THJEEvVeRqh
	Rem9ZoeJSzb7r9e0er9VkmjovKPB+or9xaRP97sxoEX4gecSLTDx7m/9WRFEA4REbgUwdsNWOxTqD
	KPzkrQTNaiUhhZHp4mnigCDnd901MrpF9aew2BZu8aoL1qjS7zjMjDqzrfsVI2m4KJtxWTDJgDJ7K
	iAGfqNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNje-0000000HU09-0CgZ;
	Thu, 29 Jan 2026 08:50:42 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNjb-0000000HTzk-4Bw0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 08:50:41 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-124a635476fso1013049c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 00:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769676638; cv=none;
        d=google.com; s=arc-20240605;
        b=bi4ovaRu49hKyolNXrdxVv91RyDUr53SuAxW5DImiOkMEfH8RjM4nT/QBPkBKMY0qa
         brP6/Ok8KUAv248B9L1MzeA6it1oPhciKLefidBoY3DNWgXWyFbA9IYDOPY0vPYKM/l7
         DfNT/MFtyGmP/6HFGvx9M3hIpDWSQWTGnm+frMjROkRV+Qlp9juoCgEt9qLO8/kTGDQV
         hG2yQLH6G4aFQAAHFDmU4+Df9c0+cwD3SZM89kO0kEje34Ji6lksswz9JlCShUlVZVI7
         ge5Q/ofRCSWDOfHX/orFg+42uB8LHyZZ16xvCERuFDok6+z3vnyCtfif1+AHkDqpXN3l
         CbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        fh=+ZfPf/33nkd3n9ti2Q7wd4rYB7X7KJ+NUmkj+c5HK6A=;
        b=WSq11taZtqK9uCPH3+FQaxLhdQT52K2nlf3zH6D92BiNnknvlZU6pkTaQjOaF9h0Ei
         +tM6Zy1Xj4DyvvHgdVlZm/AvRjyZtWDyLM2GVlRssImGVY5POmDIRhOxFfLXt54VSVk2
         aM2WOaLjtDgO1wLIyL6+nS3m5pNpDkpnDTToEfD6IqW1v4ZaUIgtJkKofRoGcjHwcONC
         TgS2B5RlXe9+lOmyr/xoTUYTeTQ5byHGuahauU5P/FvFvtpBfn6ZxA+zPtvg9pwrX6Em
         p8IF7C25zdr5zEdaWEM0tn9xxaZ+bXCIwsvz8xlrCPmYEho/TyqpaicumJMeEGbl7+m7
         KzMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769676638; x=1770281438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        b=OJPUftiIFI37MlSQg93ECIiZXc8jQaPeC6TWDwX/0PAk9C6YYPAPZ91KgVqdzfebsQ
         JRPM6t6FSOHUuV04T6tvwqt5z4Ra1w/oTHUM0aYrr4+5VC857cKyZSG8dZTIi+0byPQN
         itcHLjKZuat3deLT2CaRj1KoKISXzott7jDbYK5I4tQxczgFy36wY2Lq+q5ULpSj4Rj9
         TgTOEH79fNN0SaToVLoQgD6bX7dUfkCuRd67h5cOMqac1fYLs+dfXb1BRbah3OMSBe/q
         Ib5E2pBGC0muy3ZVylogpmRr2qfojdzyesp3qCvgfwj5DGmMdOItNB/eszwxsho2oqur
         F/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676638; x=1770281438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZvWUh8GJpUOtP+DEysTJdxrRMiFKkExrw02tL0FdIs=;
        b=v43rJBCDuVrDPdiv42hIgv/+FGhl349ha+NUh1iSmZbCxz3V4YS8PA3TYnTbvKtWZ2
         bf76SFoVGbRCcFYDZejLQma73MK8TyTrRdMC/P+bAeQ91srXFiLt4zbWE24DvD51C8Jl
         g1N5RZK5E9YVKdCDlwSXAdNgUxOrQTX3a+3feaMh/xXp1bc62LLIFhlGmvkmS8+1PPsE
         WqoAf35I9vMiUTCBMrp3lrsL0ED+VT1UyGmoksM7tBau1giQ6im66DLogprpt/OwlOSY
         jbTs+nFmLNm0jRZKoHk4GH5mrEo2lLfCkC/0ZXlRvqnbwz52TDgrQ44KIFsQdQIXA3Wv
         YwOw==
X-Forwarded-Encrypted: i=1; AJvYcCWFFJhpdWRdmH0MbJVvQmNxuVRLcKcJ+8CB6em/f4gRcySIRFqaHN/8aakkSIiqsr43ZG75U4nkpiFxKdzym9ES@lists.infradead.org
X-Gm-Message-State: AOJu0YxT9Dwg+pTnOmTgjO+l398ezhppLp3N1CFtQVZTgL7DUGqWgcOR
	HRLIuFkUdTRk+uZDjAtD9yLgcx/meAdLvIGOMnt+NOuQcFDxyq3ZOyG+Rf14iR0u1Yy+hGDbxUP
	ye/GrLF5qGr6iEs9MBMNswRoxIsXH2WQ=
X-Gm-Gg: AZuq6aI2o7tmDAkGD80D2YGRCBpupOqaES4iUXiyRz3EB1Jzp1wx/QaCT6WpXs+rang
	21uQoM3Q2uzCWhB6lOaVWbMHFRiCoa3FAdPauiRlZyy3FCZwCQFhgP/J23ZniduU5xOughL7LPX
	9C535sJQq0/F20uyvpbj7sM5Po2/j2xB1HLguXt4fSErCp5l2sF8P6e3XoV2rvwC3WRyzIb0nes
	83628Xy405nYekEPBekQ4PIZl0OTe5zy94A6uo554W6270UNuRkDmzmmKpD4iFZw0qIWjXLc5Xz
	CTsBL74hnpSGT9WKldPFw2yh1oJ4AwVThvcdJj+EBqKBt3COn6Wr/Ol6K7ssmaSZWTDb1eL3p4E
	DZ+4uQo32urJTaP5nCyH4xDeU
X-Received: by 2002:a05:7022:24a9:b0:119:e55a:9c08 with SMTP id
 a92af1059eb24-124a0114330mr4531675c88.36.1769676638430; Thu, 29 Jan 2026
 00:50:38 -0800 (PST)
MIME-Version: 1.0
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com> <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Jan 2026 10:53:22 +0200
X-Gm-Features: AZwV_QiJoPjxBlGc_n241-eebqcvpnHRLF4wcryqHdHTimEnsnf5j3OD_trI938
Message-ID: <CAEnQRZCSQ2o-P8ABCf257UzcYhojfg1m4d=oCmCxcCYWZ1AsGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: imx8mp: Mark arm_a53_div as critical
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, "S.j. Wang" <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_005040_071005_AC816AA7 
X-CRM114-Status: GOOD (  20.86  )
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

Hi Nicolas,

I've tested this series on i.MX8MP and unfortunately it doesn't fix the iss=
ue.
This is the serial console output: https://pastebin.com/dvJQ0HBy

We can talk privately and can help you test if you have debug patches.

Reverting:

669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")

Makes everything work again.

thanks,
Daniel.

On Wed, Jan 28, 2026 at 8:40=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> It appears the i.MX8MP does not like when arm_a53_div, or rather the
> parent it depends on, sys_pll2_500m, is briefly turned off during
> __clk_core_init.
>
> In the past, this clock driver could get away with not declaring the
> clock as critical, as nothing ever fiddled with its parent that early
> on. However, after Commit 669917676e93 ("clk: Respect
> CLK_OPS_PARENT_ENABLE during recalc"), this changed.
>
> In order to guarantee that it keeps its parent enabled during
> __clk_core_init if it sets the flag CLK_OPS_PARENT_ENABLE, the clock
> must be marked as critical.
>
> Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/r/6239343.lOV4Wx5bFT@steina-w/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/imx/clk-imx8mp.c | 4 +++-
>  drivers/clk/imx/clk.h        | 4 ++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index fe6dac70f1a1..ee10f845faff 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -655,7 +655,9 @@ static int imx8mp_clocks_probe(struct platform_device=
 *pdev)
>         hws[IMX8MP_CLK_CLKOUT2_DIV] =3D imx_clk_hw_divider("clkout2_div",=
 "clkout2_sel", anatop_base + 0x128, 16, 4);
>         hws[IMX8MP_CLK_CLKOUT2] =3D imx_clk_hw_gate("clkout2", "clkout2_d=
iv", anatop_base + 0x128, 24);
>
> -       hws[IMX8MP_CLK_A53_DIV] =3D imx8m_clk_hw_composite_core("arm_a53_=
div", imx8mp_a53_sels, ccm_base + 0x8000);
> +       hws[IMX8MP_CLK_A53_DIV] =3D imx8m_clk_hw_composite_core_critical(=
"arm_a53_div",
> +                                                                      im=
x8mp_a53_sels,
> +                                                                      cc=
m_base + 0x8000);
>         hws[IMX8MP_CLK_A53_SRC] =3D hws[IMX8MP_CLK_A53_DIV];
>         hws[IMX8MP_CLK_A53_CG] =3D hws[IMX8MP_CLK_A53_DIV];
>         hws[IMX8MP_CLK_M7_CORE] =3D imx8m_clk_hw_composite_core("m7_core"=
, imx8mp_m7_sels, ccm_base + 0x8080);
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index aa5202f284f3..97cac1d623ca 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -454,6 +454,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *=
name,
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_DEFAU=
LT)
>
> +#define imx8m_clk_hw_composite_core_critical(name, parent_names, reg)  \
> +       _imx8m_clk_hw_composite(name, parent_names, reg, \
> +                       IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_CRITI=
CAL)
> +
>  #define imx8m_clk_hw_fw_managed_composite(name, parent_names, reg) \
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
>                         IMX_COMPOSITE_FW_MANAGED, \
>
> --
> 2.52.0
>
>

