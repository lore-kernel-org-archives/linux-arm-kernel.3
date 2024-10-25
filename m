Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83BBD0BB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/svTJLUuZsHOgIxMPFLO/yUUNAOW9dJ4W1In0LnFdY=; b=yHIObzQblsombw
	EAnoVZnWURH9lKJjPQYgmIGtBA4Di+wHvzeIyZbOENXT+Jo4SRrx0InuTbT2OYV3cbJ3ZbUju5CV2
	jyZywpX3VKDaG/7msuBctg/xKWGpupBnNLmlqZK+DRRVUWk5ZPnd0wC5cHFCiLYaFDtYq3q0kZ+EC
	3Pz5Ga6d04/PC/172q3SpOWgFiJDd4kKAfAQQxKJyHgpTDiPXQ1/klCAjP1zGc91rjPfSzzHuIqMm
	vfjubmFTPZ7iDqhxSRdIG4kwOODPy7hRGcd7F1pkchXnA9gqusOfnx3TAwra2a2AzylVAphS6La63
	Q6ZTmnCfT/XvcQk+qJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Lyo-00000004AbA-1anP;
	Fri, 25 Oct 2024 15:11:58 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LdK-000000045Jd-0AqW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:49:47 +0000
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso20859741fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867781; x=1730472581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/svTJLUuZsHOgIxMPFLO/yUUNAOW9dJ4W1In0LnFdY=;
        b=PM47/C/hoN8n9OL4GTIsumPd8KplmaJ2r4bHoij49B1W3lYYGbmQSE57aLbjTbrzS6
         y1huaf6i3HTS7zQt3GjSSPo75rb9R0AfiW7c9DfzU766GB0PTJZIDVyh2YWaqzZHURc4
         jFy6AUQpKkO39+Fg2EMerKt8JKEh6ZhEGZTRer7B8hpYenAefwsUjsHDexdaswLXh2i0
         D9qJmKodbcZbt2PN0B9Vyp981jJDhBE3t5bzFPZrR84B/mpAi7r+myGeFqybQvohqDIP
         CQJAIMP5mDPp6wxcdg4ipKXOj4FX30YT3PzlOaL+FvL+CDpxIv/B4guRbhrrpN7MgO+X
         diTg==
X-Forwarded-Encrypted: i=1; AJvYcCW0ae1axirWGP43y78OIYzuowOsCgGy8L6QzdgR/AiufNLUplIeqEV/L9dx97QgbJ7VnAdjS6Xm97yVqeDdfVUj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr23X75hKO/eBO4ISQOiPU8SG5I8lnlNH2DOxxFs0VZnJ/CWXX
	8W0x1lNdVc0iDSqj3i43cNI7tF0B7YjwXqpY92TwfwzvnUrh+eb9/YZBoy0MG1U=
X-Google-Smtp-Source: AGHT+IGttOOo4t/G2Zz47ZAP3mSPi29uOMRyPcXw0aONSG7VlSh65KsmQbwVvz22N6ICNNiU3ZLYWw==
X-Received: by 2002:a2e:4e01:0:b0:2fb:6169:c42d with SMTP id 38308e7fff4ca-2fca8279527mr27188091fa.41.1729867780867;
        Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb461846bsm2120371fa.137.2024.10.25.07.49.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb518014b9so17404191fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdr7QfGu55RGc40QnbfEDhuZ0x4eepLDmeby4ixnTiJMY2JcWP9nQq0dpsaFXaaaNueC3PTBrlgvmuFnHXX1jl@lists.infradead.org
X-Received: by 2002:a05:651c:1504:b0:2fb:4c08:be08 with SMTP id
 38308e7fff4ca-2fca81d81c0mr28886391fa.11.1729867780288; Fri, 25 Oct 2024
 07:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241025105620.1891596-1-andre.przywara@arm.com>
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:49:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v676pzN6TX8xDHuESkGDLinCB9_3FLgKSmEBtxK2GSWxHQ@mail.gmail.com>
Message-ID: <CAGb2v676pzN6TX8xDHuESkGDLinCB9_3FLgKSmEBtxK2GSWxHQ@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Philippe Simons <simons.philippe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_074946_107998_26B91B5F 
X-CRM114-Status: GOOD (  30.91  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Oct 25, 2024 at 6:56=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The H616 user manual recommends to re-parent the CPU clock during
> frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
> at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
> after the factor changes have been applied.
>
> Add clock notifiers for the PLL and the CPU mux clock, using the existing
> notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source)=
,
> and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> correct algorithms.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> the manual states that those changes would be needed to safely change
> the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> fine without them, but Philippe reported problems on his H700 board.
> Posting this for reference at this point, to see if it helps people.
> I am not sure we should change this without it fixing any real issues.

IIRC we do this for all the other SoCs. But if you want to be cautious,
we can wait for Philippe to give a Tested-by?

ChenYu

> The same algorithm would apply to the A100/A133 (and the upcoming A523)
> as well.
>
> Cheers,
> Andre
>
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 84e406ddf9d12..85eea196f25e3 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -1095,11 +1095,24 @@ static const u32 usb2_clk_regs[] =3D {
>         SUN50I_H616_USB3_CLK_REG,
>  };
>
> +static struct ccu_mux_nb sun50i_h616_cpu_nb =3D {
> +       .common         =3D &cpux_clk.common,
> +       .cm             =3D &cpux_clk.mux,
> +       .delay_us       =3D 1, /* manual doesn't really say */
> +       .bypass_index   =3D 4, /* PLL_PERI0@600MHz, as recommended by man=
ual */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_cpu_nb =3D {
> +       .common         =3D &pll_cpux_clk.common,
> +       .enable         =3D BIT(29),      /* LOCK_ENABLE */
> +       .lock           =3D BIT(28),
> +};
> +
>  static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  {
>         void __iomem *reg;
>         u32 val;
> -       int i;
> +       int ret, i;
>
>         reg =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(reg))
> @@ -1152,7 +1165,18 @@ static int sun50i_h616_ccu_probe(struct platform_d=
evice *pdev)
>         val |=3D BIT(24);
>         writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
>
> -       return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_des=
c);
> +       ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_de=
sc);
> +       if (ret)
> +               return ret;
> +
> +       /* Reparent CPU during CPU PLL rate changes */
> +       ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> +                                 &sun50i_h616_cpu_nb);
> +
> +       /* Re-lock the CPU PLL after any rate changes */
> +       ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> +
> +       return 0;
>  }
>
>  static const struct of_device_id sun50i_h616_ccu_ids[] =3D {
> --
> 2.25.1
>

