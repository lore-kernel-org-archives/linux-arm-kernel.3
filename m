Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362A0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8+rtQC6XpTE2vRTh9EDlBtLhS/B0Gdgn+coAVMY1wQ=; b=JweUipDuPzVxbw
	w8T2fXmmGJvJalk8z+AvYx9Brpn86TzzgCKGP91XVBAvLfRAq5F2ANEcEexgov+3FQHxx1bhveDm7
	8ucrphzOFlGV1i+hjK2GW9nHB39+6IyDN5agU8OyslEm6BY6fEJsi/03nqN86KH+kEjhVzuEy4ZJG
	ro2whNxof/KtFZrizq3yAJdVLX8nKoEkZ/Sq6zpqx8opa1TFQJwNWHyzC9hnhMQg6jxIqsfYXJOcy
	AbwbxVgMsefiwmAKpBUKh+xKEKuXD8whssxq77qxU/ZBHxwh/uIlRmCGeL4FAI0lGHuaNQij1BZa0
	pg1urOakK5wC5QyJjINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaVcb-0000000GQdR-1CQ1;
	Sat, 12 Jul 2025 08:30:13 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaVYY-0000000GQDg-32m6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 08:26:04 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553dceb342aso2364669e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 01:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752308758; x=1752913558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8+rtQC6XpTE2vRTh9EDlBtLhS/B0Gdgn+coAVMY1wQ=;
        b=YzQI6oI/whxiHbSQSMxDI1+5lHDe0F4gzRxpZUezaw/n7h03KCT0bEU4kry07J4157
         KQGUm2+Zox0/Wx5C1JRdh8Vx1JMwRTOGksJAvQJTaINfgzpC/CpbuIMEFrHpn1rrAxgS
         l9WXQEeYWhivjwf+inrE68fHiXbgpf5vQrUdkUw70mdT0APTktqEogNId/+ics1jrlXK
         5SCDe6QMUq+h38wgQEnHCzjs9wtw9oKRUb8PkvTeNuryg+56y6B/LbmTvTeeiaGU4d8Y
         QAesxS4YcJ4NHfEbn+0mRH2Xnyca05gA+yxkZSmXlpGAQfDrfRcWM6X+TrJFNK2tKopG
         kZkg==
X-Forwarded-Encrypted: i=1; AJvYcCW6XMT2Cjk9Kreitw5tX7JfDKh72/neNCN5laEFFfL7sxU0TR7nBiIq7Jm92PSgd0WgmoG99j8o/DxnRsJ1N/Du@lists.infradead.org
X-Gm-Message-State: AOJu0YzgqA7VAoI6yqpupTK6zPcuRlKg1C8/HbQUlwQtJDqO5GtNPoeh
	3IE4eTZ3smARV3cyOsX5NmyjajhUANfOKxO1K+XF+TEvGCalu4liGKr74u73Hy3y
X-Gm-Gg: ASbGncszCVSgq8foxQO84dIcKkj8lvxn3At561tmysyxaQ/gFXoj0QxHms7lVRW79ss
	YpEauyBCvcWjufeZzTP9Mmz6JTLhRUuZQmRvqUB54ch8LQpB21nwI+vcORd/R82RKCfqbdPQrp2
	nh/CDMbMOh4Nft/dj5LKRQdPROT+rM3T+QuhDWzEu+SQuoJse0RL/YVyeGA10eqS2uXFJWz4PI+
	iKhc4dI7ipUFwINI5YcEkr0HYPCVmohze5sHil5z57cNcWivOZLS/KREa066LxzZ2wRgmDrta23
	ZuE1mjGLpoG1fbl8xi4pNDurUch62Xj6VQlXhJ8rWEhmEgaoRDAFVARa9xa2yHDWu7yz1qUDiHi
	B/1qOz+awxuUJgK8qIzinxxCGzpQKBhwg2GDFp0N1r1xPvn08goLc7aBkG4lfbpyAvw==
X-Google-Smtp-Source: AGHT+IH4dc1S9T5cE3EIj4McKjMWzuHg6kW4vdMHRZIB3gptaiAUxBqQO+eyhdnjKRdIVEHR/HJ2sg==
X-Received: by 2002:a05:6512:3c99:b0:553:abe6:e3e7 with SMTP id 2adb3069b0e04-55a046680c4mr1846053e87.47.1752308758113;
        Sat, 12 Jul 2025 01:25:58 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b7db78sm1289900e87.240.2025.07.12.01.25.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jul 2025 01:25:57 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b7123edb9so30938161fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 01:25:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXm7spGtnhCgaiBinjpKhPajtZ2Y+sj3Jcm6TmYBGqtXXdly5cknJkIEbCBJwUFOoqsKY/VnrPDMYiXkcTn3J9K@lists.infradead.org
X-Received: by 2002:a05:651c:b1e:b0:32b:7472:c334 with SMTP id
 38308e7fff4ca-330532dfcf4mr20735521fa.16.1752308755571; Sat, 12 Jul 2025
 01:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250703151132.2642378-1-iuncuim@gmail.com> <20250703151132.2642378-4-iuncuim@gmail.com>
In-Reply-To: <20250703151132.2642378-4-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 12 Jul 2025 16:25:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v66CnNEw0Rhh0SLnr73b+TPJXCZ_eY3n4nH8_9LiXj2Ydw@mail.gmail.com>
X-Gm-Features: Ac12FXymLasGX3Z5Rb9uWIApOu-xW47ktDWvJ_I7-HUhHhL0xFXKGGC-Mm7lvpI
Message-ID: <CAGb2v66CnNEw0Rhh0SLnr73b+TPJXCZ_eY3n4nH8_9LiXj2Ydw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] thermal/drivers/sun8i: add gpadc clock
To: iuncuim <iuncuim@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_012602_762772_BA7ADCFE 
X-CRM114-Status: GOOD (  18.69  )
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

On Thu, Jul 3, 2025 at 11:13=E2=80=AFPM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> Some processors (e.g. Allwinner A523) require GPADC clocking activation f=
or
> temperature sensors to work. So let's add support for enabling it.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 226747906..45aaf5348 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -66,8 +66,9 @@ struct tsensor {
>  };
>
>  struct ths_thermal_chip {
> -       bool            has_mod_clk;
> -       bool            has_bus_clk_reset;
> +       bool            has_gpadc_clk;
> +       bool            has_mod_clk;
> +       bool            has_bus_clk_reset;

What's with the random whitespace change here?

>         bool            needs_sram;
>         int             sensor_num;
>         int             offset;
> @@ -89,7 +90,8 @@ struct ths_device {
>         struct regmap_field                     *sram_regmap_field;
>         struct reset_control                    *reset;
>         struct clk                              *bus_clk;
> -       struct clk                              *mod_clk;
> +       struct clk                              *mod_clk;
> +       struct clk                              *gpadc_clk;

And here?

>         struct tsensor                          sensor[MAX_SENSOR_NUM];
>  };
>
> @@ -417,6 +419,12 @@ static int sun8i_ths_resource_init(struct ths_device=
 *tmdev)
>         if (ret)
>                 return ret;
>
> +       if (tmdev->chip->has_gpadc_clk) {
> +               tmdev->gpadc_clk =3D devm_clk_get_enabled(&pdev->dev, "gp=
adc");
> +               if (IS_ERR(tmdev->gpadc_clk))
> +                       return PTR_ERR(tmdev->gpadc_clk);
> +       }
> +

This looks correct.


ChenYu

>         if (tmdev->chip->needs_sram) {
>                 struct regmap *regmap;
>
> --
> 2.49.0
>

