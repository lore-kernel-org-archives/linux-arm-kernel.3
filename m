Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879BBE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrI8qCQN85qm0XYiJc+jVTuy93Oh6KAdPLxuWkpi6aM=; b=458MgSselMol4VLRY6umRR+ffc
	n23+J+kEfIHbbpWTZFQVT4bSPJAlZYnAJ+9KAj/HZo3A5OXgZ4kCgs9eAysyyB8kc13f1e+M42h6/
	gioldOG0GuFFcDBXBrjf8M9a4EGhDUeSRUCV8kU6MM+Mt63LDOdKdgUhIYEQzC20ZPRfmj50sauHU
	ALqlrD52dut8xYoDeknHM3N+vTbU2Jl1bXeir3O/TuJJQ/eSWeonsI9vYBi5xygNNab3AEyylKStR
	SoWM6zCDtZRRKrWJr7PJpKfb9e1ydb7uBI+v1XY+KwTiTDk3dd8vJPAziblcPuI93fr54A/ZY1KRJ
	BabAGRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMLgU-00000005q4x-0t28;
	Sat, 14 Dec 2024 06:31:26 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMLfP-00000005pvk-0C6m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 06:30:20 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5f2ed0b70d6so1075832eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734157817; x=1734762617; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrI8qCQN85qm0XYiJc+jVTuy93Oh6KAdPLxuWkpi6aM=;
        b=mfISLPQe5qhWMSyGjRSOTcFZWsf6zeO7JY+4U0rbZB3MPKh9iTOwVj4+4Q+wUsPs9j
         Vlg5hVYihtizKsmG+axCkVNZizZ7kETzWzqjFxJizYoc6ocZcivd4UP+YnGTOT0e9KzL
         dkwSxx2NsPFhT7UpsPFBcB2rrAjbHheolE2KY+mUoi8HGLgceUtu0XygiDns8OtTQQrY
         hyviRyCyLijf57j6s/v6K9kopz/ZaUg268HA9DEb6AEOrDJ+ahNENAj4f7spYel7xczw
         mI/cjo/ni9s1eUh/+rOEjx3FM8gzp8aGEERKHLMG4q0hJxQsG0e+VcISb8rUg7+i7xIm
         TRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734157817; x=1734762617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrI8qCQN85qm0XYiJc+jVTuy93Oh6KAdPLxuWkpi6aM=;
        b=PtD07GlkbWrtitix1++jBiRnJD5/1QiQKVrdlai9EiZLC02cBo4xZXldReIowAPV3T
         yLUFMXu05fRw3/eNpxVnL65bfoLogTtOFxm5Ikc1rvX7ADtzkLYURQdTmndNZu6h1Eh4
         SRtrRyoCYPkm0txtPQ9L8n70C+Z0PoLmDfg2QoD0gM3r3SsBNaiOtBLEJDZKMqrrPFGJ
         awysA8w2s15YcJcEX28D47/PADVbnWSmVP2hkcLc6nC9GXvVWIFQ4cSYRieeMh8hj9Q3
         AGV2NLFgKHqWCzBPyl/5nECy93y+RFrWOyImTKiaFfakiqPSDlrA9Fi7BKRVMcRl90n1
         LM2g==
X-Forwarded-Encrypted: i=1; AJvYcCUTfqrK/a8V99iTSWwjcAOYO7AeKCOwtFAytOFIxBHWvN3eWiRx7d6C9QsLmWwOGsBeoOgR8W8eSuwC22cfbFy2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs25rid4cB4+IZx2LfcBeMJ0n0XDK26LHOX3xHlNAAOojyvEez
	/nSaJ19XHMQ5UTXlruOv1SD8x0tz/5UOTSNEYlYWxNIzb9zx740p/Wt5xBaJB/O0kORdK1x1Uir
	jr0EyCVflrDCeDK+DXVH9lOsZRbM=
X-Gm-Gg: ASbGncu36aO/HEYvkg1GyyJwfqUU5Y92iyaIKgNZFMRBoiULmltu/xBSlQmAhpKyF8P
	Ck7K4SoYdgc/CQquwMpzm5czTZ2Xg0wP9prkgsmmv0ba6XFLqFVFS5aJWtEZyJQXk/TXxrIX+
X-Google-Smtp-Source: AGHT+IEPJNPA+UMoRL6Nd8OnH+KQK573OcmBMtIxEoDNfscNNNsJvvjIErYdh1Oh7XBBo4k+5gmKzsFAb+yk48Ks7y8=
X-Received: by 2002:a05:6870:828a:b0:29e:255e:9540 with SMTP id
 586e51a60fabf-2a3aca46b43mr2859925fac.35.1734157817408; Fri, 13 Dec 2024
 22:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20230505052110.67514-1-me@crly.cz> <20230505052110.67514-2-me@crly.cz>
In-Reply-To: <20230505052110.67514-2-me@crly.cz>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 13 Dec 2024 22:29:51 -0800
Message-ID: <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux
To: Roman Beranek <me@crly.cz>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Icenowy Zheng <icenowy@aosc.io>, Ondrej Jirman <megi@xff.cz>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_223019_089353_2A821A64 
X-CRM114-Status: GOOD (  24.62  )
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

On Thu, May 4, 2023 at 10:34=E2=80=AFPM Roman Beranek <me@crly.cz> wrote:
>
> TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X),
> however MIPI DSI output only seems to work when PLL_MIPI is selected and
> thus the choice must be hardcoded in.
>
> Currently, this driver can't propagate rate change from N-K-M clocks
> (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> in setting of the TCON0 data clock rate, limiting the precision with
> which a target pixel clock can be matched.
>
> For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotclock
> can deviate up to 8% off target.

Hi Roman,

I'm a bit late, but this patch breaks the LCD on Pine64 Pinebook. When
TCON0 parent is pll-mipi, the panel is blank and I get vblank timeouts.

With this patch reverted it works if I force pll-video-2x as a parent for T=
CON0.

So for me RGB output doesn't seem to work with PLL_MIPI, but works
only with PLL_VIDEO0_2X. Any ideas on how to fix it?

Regards,
Vasily



> Signed-off-by: Roman Beranek <me@crly.cz>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng=
/ccu-sun50i-a64.c
> index 41519185600a..eb36f8f77d55 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -528,11 +528,18 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_p=
arents,
>                                  0x104, 0, 4, 24, 3, BIT(31),
>                                  CLK_SET_RATE_PARENT);
>
> +/*
> + * DSI output seems to work only when PLL_MIPI selected. Set it and prev=
ent
> + * the mux from reparenting.
> + */
> +#define SUN50I_A64_TCON0_CLK_REG       0x118
> +
>  static const char * const tcon0_parents[] =3D { "pll-mipi", "pll-video0-=
2x" };
>  static const u8 tcon0_table[] =3D { 0, 2, };
>  static SUNXI_CCU_MUX_TABLE_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,
>                                      tcon0_table, 0x118, 24, 3, BIT(31),
> -                                    CLK_SET_RATE_PARENT);
> +                                    CLK_SET_RATE_PARENT |
> +                                    CLK_SET_RATE_NO_REPARENT);
>
>  static const char * const tcon1_parents[] =3D { "pll-video0", "pll-video=
1" };
>  static const u8 tcon1_table[] =3D { 0, 2, };
> @@ -953,6 +960,11 @@ static int sun50i_a64_ccu_probe(struct platform_devi=
ce *pdev)
>
>         writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
>
> +       /* Set PLL MIPI as parent for TCON0 */
> +       val =3D readl(reg + SUN50I_A64_TCON0_CLK_REG);
> +       val &=3D ~GENMASK(26, 24);
> +       writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
> +
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_des=
c);
>         if (ret)
>                 return ret;
> --
> 2.32.0 (Apple Git-132)
>
>

