Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F202DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMO1ehTiBUYEBAd5/n1ftLnQAH5SeU5tVjatLn3yZxo=; b=nJVfo2rwA+RbR+
	1mfJQtpQOoQ5T91t+NOCFKcMcPukicJc9fodPYgMXIWjBvJj+m67Le9LuGvpxvvZLC2MsofuFDho6
	5QqyJQE2LJXjsx/zTJA1yN/OL6HqdRnZOOvpreg+vFrKJK8GoW8CFTCbxaambcMYnMPKfgBZ8hz0o
	J7EGdICTXYTaTM/dLOc6VGsZyW2HTCIF/ei8y7JnErN2r3ggqKLQGmicgkMUrZbw4F81hu2F5nBO3
	dGcp6ep8772H7n1G1lo4P0Oj1UlXIHoqbFCkHtuAbTDE/nD87rbrDwHWvhZ6g7uOSuZU8acvqCWyZ
	PfS75KJtkFPZn8arX7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMxV-00000005mfu-46x1;
	Mon, 13 Jan 2025 16:06:33 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMRS-00000005eyT-2skR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:33:28 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f22fd6887so3799668e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782404; x=1737387204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMO1ehTiBUYEBAd5/n1ftLnQAH5SeU5tVjatLn3yZxo=;
        b=ECT6XDVzDIWE/JyZkfD9JGDmOh36qcmE53XJ7MdngQxTNtWC8olvzRIZDrdqgSMbdc
         beaaWEtkjK3hgUTxEtgglPTen4v44i4xZ763cGe3g66d7TKIZKkA617lyrjEc61BHjAp
         idfAVoagNeG6DCU47PnvrFYghLKrMeOkWJz298A3TANMMrpFqKJ9u1H56BGKLN/MewDC
         fYggDfaqzZpuBaKKOTVs3+WCukQQza32T56eBHVS2FcFaBnQ+V4+I2SPJuuTZsT0E8tR
         cu2YnVZ+ScfUqNZtKPyxJLc7fVP1rQ4w39TM7VYnXUqN9nOZ+87aQS9S8o7pgA6qSIbG
         Qawg==
X-Forwarded-Encrypted: i=1; AJvYcCWixauie1FmcD8ZTiqgyWbLGPrCmHZftB9YM9coVpDpbJHxxZ8nPmeUmexsChiakRsn1MXDrYQYTcv1n80AUnvM@lists.infradead.org
X-Gm-Message-State: AOJu0YxqO1zgbnMtqa+ciyo6Ye50ENm/xQyRu/aku6Kpj5ktyz/hx9ef
	MhlhscPfTqPtMtfeUO5jq2e5R247b8yQkKAjkwHH5CB4Ve94Px8zhzkktp7xc6k=
X-Gm-Gg: ASbGncu8TiyZAgwBSpIaU5Ls8oYBGN8GzbZSF4ZgLUg0Fi832ZBS2XuDJZuG7Oicol1
	XG+4zVahOqssj4pAKLiiiwqL83AMXBP5jzJuH8DqwPraqQ/hGwtbw/W01o3asyy7FZFZH/vKk+J
	5kks2f3q3WdMZYp0e+1k7SQwMdcC5JEAMsxFRO8K1KG+4L5noS2cw9LTqI3fvhUwXTKcbIwz/gX
	6nMoCXBKRWgvWsCKyBEqqgswNnl/t1qDYnBlEleXEAO2bqDW7L7kDH5f0VEabQs46M6ktaborMz
	QtWOWmBPIo910A==
X-Google-Smtp-Source: AGHT+IEZTh4Tt02xkhBE+RSstknMKXN+wkBCi2uqb6sPWOlqgJGF77uK5ugrwMS7/hFiF9enxjqddw==
X-Received: by 2002:a05:6512:15a8:b0:541:21f9:45b6 with SMTP id 2adb3069b0e04-54284801becmr6530626e87.37.1736782402705;
        Mon, 13 Jan 2025 07:33:22 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec11c9sm1394605e87.200.2025.01.13.07.33.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 07:33:22 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3061513d3a6so15923481fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 07:33:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6OFLJjIjBH5GEtUBPGB+fXoRvvPrSHIbWDDuSB4vOB7QIv1wDWbmCHeEPKCc/U+twqZAovitDiNXWhln9QgnV@lists.infradead.org
X-Received: by 2002:a05:651c:887:b0:306:124c:69d5 with SMTP id
 38308e7fff4ca-306124c6acamr38561941fa.34.1736782402241; Mon, 13 Jan 2025
 07:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20241025105620.1891596-1-andre.przywara@arm.com>
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Jan 2025 23:33:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v67aDGR=oVbBCv6M492L2MdcnuD8pugVciSeujy5Druw4A@mail.gmail.com>
X-Gm-Features: AbW1kvZj0Eas5i5rfPRkek1NJ1CRUjBzE3zaOM_q3BEvET2T34lYAwlvKL0KqfI
Message-ID: <CAGb2v67aDGR=oVbBCv6M492L2MdcnuD8pugVciSeujy5Druw4A@mail.gmail.com>
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Michael Turquette <mturquette@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Philippe Simons <simons.philippe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_073326_723282_15B1A4E6 
X-CRM114-Status: GOOD (  29.28  )
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

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Stephen, can you pick this one directly for -next?


Thanks
ChenYu

> ---
> Hi,
>
> the manual states that those changes would be needed to safely change
> the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> fine without them, but Philippe reported problems on his H700 board.
> Posting this for reference at this point, to see if it helps people.
> I am not sure we should change this without it fixing any real issues.
>
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

