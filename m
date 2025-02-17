Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71DCC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oT48PO3HfIeDjSDux1vBuhE4VoEwoL5q99u+4AwOVE8=; b=A386J1A/1rsfcG
	2Xre+8sRbwiU/tYo/R3FzNHzizODY43AjYpcBPF1Aro5UqqJLRuu4qCag44IE52rab/vypTAc5iDS
	4GH4KdJFASUp2avuZEBFg0JuEHp7/bZxQO0akuzWlL1SMxjE1LMoYyC5L66l1PqoD/8rCNmDCr63d
	MgkzJ6yEtfpMeaQEnjB+N+4T7xkyDqT3ZZnriwDBIM52qo4Dhg9mijWabZQK5hiFBaWxkPOFvm7zH
	WdLkgoZGx4eQwtFd4VBiCDTXUz+bsvo3MynD+7CeERukQB0AK+8uHqEngk0jWUYsZk42DK6HjhkJt
	FJVFgY4e1legKdqX0SRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3pf-00000005Ejt-0L9q;
	Mon, 17 Feb 2025 16:18:55 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3MD-000000057nN-3x7c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:48:31 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-545fed4642aso1739441e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807307; x=1740412107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oT48PO3HfIeDjSDux1vBuhE4VoEwoL5q99u+4AwOVE8=;
        b=KGOo1NfLKiY2R3NXlNbqEZKNF9I12ZIPA8QdhQ62JHDaVkgMThQIjdGMqBsWoWk7GJ
         qgMLkuGVZk8jtHjTx6h0+UHAZzlrwXZeupvAd2bcrzZ9LDV3glPfAF8ATd4ZnSAO+aNr
         LFjvIPhBXrnB/UDb4G/4BEyoH4c4K+rVZ9/O1LpWr9Fd0+qo/Zxb1zh/0Fk9jGHSdoNL
         QMi8GXm7wC6I+y3ITIDVInBuMWdSVRCbGIJ7utSnpC5iKKNFiiLKfrrIRq50q+kSlkV3
         0Wzl0o8SmKtcxOnKHHVt+6YggYqTU4/tPEv0oIweC+dEHxaAkss3mYCFWR7mza/gOf4n
         dmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1O3qax/6yS1ceR+WXQHZe49SBeXzmiGWrW5razp67VBP5QObx1dqSIDKjY2fLaE+NNGgQaXPthjIFjfm4jG7Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy73PSyMI6iEzzsOnk4a4g3ST38eL3SAv8LpXyskIboOgMeIMRK
	801anHz2MN5qa76o2La1NBf5uSzadWubnWW6YnZLMLqq9/Mu/JWZavBgHxq1
X-Gm-Gg: ASbGncvJYph0HswEflKrBbz5GFob3fZ6VnUyb1IhF+0wBUgjBpgRMsPe7VOENjwb4GH
	JgrYIK3StqLDwjhhvFg+AvoqRmaDgLl5poPpJwVUITp1Yubd8qyKa4mpBocE0cnirh2iu1NRHgq
	sLcNbxkAuYIkz7dJVb4AkTso3PEPNaupImh5Es5PHLDkjg7ZB9DYQuF8k5J2tv8/YSIbm4A/krg
	qSDz/pVZlJA1KpYDPSSKY69qFQfnGePVgCfwDiXqaSStx0IydjpXvQtgblrHJIjhc2C0iMXoya1
	TxP0JxgXguAL93kvuF+acKy0C+9i4GYFQByAuVCCFcizhLcZ
X-Google-Smtp-Source: AGHT+IH+ruTBlKNKROiuC04Q/08jy56RhyX78N6rvbMVDeyGaqT8TFAAycJvYLTePkOKo5iKufps0w==
X-Received: by 2002:a05:6512:33c9:b0:545:225d:6463 with SMTP id 2adb3069b0e04-5452fe8befdmr2369354e87.42.1739807307385;
        Mon, 17 Feb 2025 07:48:27 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461ab8a220sm731429e87.236.2025.02.17.07.48.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:48:26 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30a36eecb9dso7122711fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:48:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyaItJ5Atj/gaLVsOaENGPxn+7SiHPXbVtV98ZkEERW98gG4WPlz9H+PvwEOduwNd0Lq3oIPfGiZGH1zVtwCEc@lists.infradead.org
X-Received: by 2002:a2e:88c9:0:b0:309:2012:cc5d with SMTP id
 38308e7fff4ca-30927ad64e9mr23653441fa.24.1739807306250; Mon, 17 Feb 2025
 07:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-5-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-5-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:48:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
X-Gm-Features: AWEUYZlCDWHC9MbTz92hd57HNQUJnNXRSXbL_QnKKWLChMmYjVCum1sff3H_yMQ
Message-ID: <CAGb2v67V7PAOC8MLVzE5SwwvpogN_WLNhQnRVD2pikGVDHtJjA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: sunxi: support moved power configuration registers
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_074829_984750_66E51DD2 
X-CRM114-Status: GOOD (  22.91  )
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

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner pincontroller IP features some registers to control the
> withstand voltage of each pin group. So far those registers were always
> located at the same offset, but the A523 SoC has moved them (probably to
> accommodate all eleven pin banks).
>
> Add a flag to note this feature, and use that to program the registers
> either at offset 0x340 or 0x380. So far no pincontroller driver uses
> this flag, but we need it for the upcoming A523 support.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 15 +++++++++++----
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 83a031ceb29f2..a1057122272bd 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -736,9 +736,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi=
_pinctrl *pctl,
>                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
>
>                 raw_spin_lock_irqsave(&pctl->lock, flags);
> -               reg =3D readl(pctl->membase + PIO_POW_MOD_CTL_REG);
> +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
>                 reg &=3D ~BIT(bank);
> -               writel(reg | val, pctl->membase + PIO_POW_MOD_CTL_REG);
> +               writel(reg | val, pctl->membase + pctl->pow_mod_sel_offse=
t);
>                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
>
>                 fallthrough;
> @@ -746,9 +746,12 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunx=
i_pinctrl *pctl,
>                 val =3D uV <=3D 1800000 ? 1 : 0;
>
>                 raw_spin_lock_irqsave(&pctl->lock, flags);
> -               reg =3D readl(pctl->membase + PIO_POW_MOD_SEL_REG);
> +               reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset +
> +                           PIO_POW_MOD_SEL_OFS);
>                 reg &=3D ~(1 << bank);
> -               writel(reg | val << bank, pctl->membase + PIO_POW_MOD_SEL=
_REG);
> +               writel(reg | val << bank,
> +                      pctl->membase + pctl->pow_mod_sel_offset +
> +                      PIO_POW_MOD_SEL_OFS);
>                 raw_spin_unlock_irqrestore(&pctl->lock, flags);
>                 return 0;
>         default:
> @@ -1520,6 +1523,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_=
device *pdev,
>                 pctl->pull_regs_offset =3D PULL_REGS_OFFSET;
>                 pctl->dlevel_field_width =3D DLEVEL_FIELD_WIDTH;
>         }
> +       if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
> +               pctl->pow_mod_sel_offset =3D PIO_11B_POW_MOD_SEL_REG;
> +       else
> +               pctl->pow_mod_sel_offset =3D PIO_POW_MOD_SEL_REG;
>
>         pctl->irq_array =3D devm_kcalloc(&pdev->dev,
>                                        IRQ_PER_BANK * pctl->desc->irq_ban=
ks,
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 6cf721876d89d..a93385e456a57 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -87,9 +87,11 @@
>  #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
>  #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
>  #define SUNXI_PINCTRL_PORTF_SWITCH     BIT(9)
> +#define SUNXI_PINCTRL_ELEVEN_BANKS     BIT(10)
>
> -#define PIO_POW_MOD_SEL_REG    0x340
> -#define PIO_POW_MOD_CTL_REG    0x344
> +#define PIO_POW_MOD_SEL_REG            0x340
> +#define PIO_11B_POW_MOD_SEL_REG                0x380
> +#define PIO_POW_MOD_SEL_OFS            0x004

Shouldn't this be PIO_POW_MOD_CTL_OFS instead?

ChenYu

>
>  #define PIO_BANK_K_OFFSET              0x500
>
> @@ -173,6 +175,7 @@ struct sunxi_pinctrl {
>         u32                             bank_mem_size;
>         u32                             pull_regs_offset;
>         u32                             dlevel_field_width;
> +       u32                             pow_mod_sel_offset;
>  };
>
>  #define SUNXI_PIN(_pin, ...)                                   \
> --
> 2.46.3
>

