Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF2BCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 02:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0xO3eccx9J1JFeRrYmbh54SIcFbkNO2ChisP5DHSmA=; b=kmTQM8fmEvm1mF
	yMN3s32ebgkwoe2B6IBRuXvZDPt8MP++xyHyjEroG1a9e6wMEBuQ7qELqm4WP2AE0Z/IadbrE6R9t
	gWPS6ECc/WHZeWh7xcwsiDDPDRB9t69Yk2BBZkHwbqZxu7OYGPSFRPKLGT6YjxsasIxOg/pPDNiNr
	2rV+EVCtSWYmrAl7zMsIpSxBpDqPHfqaMwaiByQ8PkV61F0Y0MAct6jlO8DB+fB4g/JuoiLD6rt27
	84pmt4ZEm8/K1LJ+jE9pPlbgaWr651W9WFo5L/mTizH+yC72MYYVh67v5cLR4DS40yr0ze8m6TrkV
	o4JqEOkS+Lm36wthMkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDEV-0000000D1rY-2rpV;
	Mon, 27 Oct 2025 02:45:19 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDDES-0000000D1qh-0n0U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 02:45:17 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b6d6c11f39aso541453266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 19:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761533113; x=1762137913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0xO3eccx9J1JFeRrYmbh54SIcFbkNO2ChisP5DHSmA=;
        b=HTfwpgoOuKwuioavCp3/QLbhm5Utcrq4Hc5RSAHNc7FJC0hmMNL0Ngoy9bQ/3U4vu3
         iFX+0ycf/KBaJ+PA5THdwQoUeI6NHNsum+jt8ELnp0xZIun/bnQhQY87Oqm+v3P2C4op
         hdpIW6l1oDD5hHLVNMKVFZwq5qJD1Li2HHPrV8QV8cdWlmnZt7yXWlAj2w07E70XGWIP
         zEwn3t/llIE2RGQMZL0fPAchULQdL/V3YoDfZQGnNqd+aPPv1oOA1UwxxWFOVOjJvLUV
         lAmvvFJzVdyo6cycNrgRMpD9bp42A7k5/27bgLgoK8xBPpeZUG2n4rHrCnaEyIrkWXIE
         8jYA==
X-Forwarded-Encrypted: i=1; AJvYcCUghLSwAlwZZ9+F+LOGUg52RFnuOyIMEreHu21DLsctilM3doWTTKc+tHxc/XT57wKG/71u69qtve7Geo6D+3Rn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj2It2wMT2AVySX6Fgqf2jQrDH3HzQBGqLAmempb0Qq35WAVCH
	nea5SyXU97KDVzRQfqv1msfHGCeyInJ0FdBVsv4h5Ma3wIq/ieGnKuUu5gWsJh4XWwQ=
X-Gm-Gg: ASbGncvWx5rS7KdMUSyaiwMRML26p6YdMfXTDVqhO9QfRd+Arw8/dX5GZKaOIkjGIN5
	Dmm8Q9j8VTB3wo+OxNy8wvNzU5fpXgyFhk+uenHhLqDN8dSC38gR2yR6TRbkV00dF0v8oxN4ckj
	16mOxnxiC2B6rLwzfK9D2jv0qNo5R6ImotvGdQChKzjHN1HVdV5pjj3VZBMHUMbvqbeOCaMjE7e
	prodIiHxw3VD1B6uwpC09cgoKl6Sd6+mnmyS975/FICoswJPwycVItcBz3diHNmPmATVTML/c5R
	UeGg/XsaOpMDGnxqrEyWe5XOVyLVuj5Zw4PEWzHL5I3mWIvyq7F9Oph2Iza7HpX0ZFocjKCCEhg
	Wv7ke9d8i8KUdVsueNqR40YL4IWBVerdJEx0nzlUBpQRFns+wjkHv0zyG/A4gsZT9h6C+hd8Pdj
	zzB7VaSlNgNRYEP8DLfkao+oFQuJpj
X-Google-Smtp-Source: AGHT+IE9+IUraiGZ4lMi5lhuI6fi8DV3vOR7jQ35BTG1BtN5z28SXFSt6JjqVrU0P3J1GYH8lfUshA==
X-Received: by 2002:a17:907:bb49:b0:b45:eea7:e97c with SMTP id a640c23a62f3a-b6d51c30f7cmr1302544066b.47.1761533113473;
        Sun, 26 Oct 2025 19:45:13 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6c164sm5128804a12.5.2025.10.26.19.45.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 19:45:13 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso846449466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 19:45:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUbRyPFvocSY/LEge5mIAHqNejwbkvEXDJV3RG7MZLCpbDqrcrP0icToHEyIJ5dD1jyWd8v2ZjsDO4+mXmRi0U@lists.infradead.org
X-Received: by 2002:a05:651c:1509:b0:376:2802:84a8 with SMTP id
 38308e7fff4ca-378d6f87cf1mr39477651fa.46.1761532753914; Sun, 26 Oct 2025
 19:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251025043129.160454-1-iuncuim@gmail.com> <20251025043129.160454-3-iuncuim@gmail.com>
In-Reply-To: <20251025043129.160454-3-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 27 Oct 2025 10:39:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v656qzX3YrcuTt++=-r5JCyDKgGB8NYTAM3TpyRtAwdibw@mail.gmail.com>
X-Gm-Features: AWmQ_bltF2M2RvHvljsl22XgW5kEnSwcYVFG9c-kdXV1SwRk_st0sy4RKS89u_w
Message-ID: <CAGb2v656qzX3YrcuTt++=-r5JCyDKgGB8NYTAM3TpyRtAwdibw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] thermal/drivers/sun8i: add gpadc clock
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andre Przywara <andre.przywara@arm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_194516_237449_0979D2F9 
X-CRM114-Status: GOOD (  19.84  )
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

On Sat, Oct 25, 2025 at 12:32=E2=80=AFPM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> Some processors (e.g. Allwinner A523) require GPADC clocking activation f=
or
> temperature sensors to work. So let's add support for enabling it.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/thermal/sun8i_thermal.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 226747906..c02c398b0 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -66,6 +66,7 @@ struct tsensor {
>  };
>
>  struct ths_thermal_chip {
> +       bool            has_gpadc_clk;
>         bool            has_mod_clk;
>         bool            has_bus_clk_reset;
>         bool            needs_sram;

We could optimize this using bit fields instead. This can be done in a late=
r
patch if you want to do it.


ChenYu

> @@ -89,6 +90,7 @@ struct ths_device {
>         struct regmap_field                     *sram_regmap_field;
>         struct reset_control                    *reset;
>         struct clk                              *bus_clk;
> +       struct clk                              *gpadc_clk;
>         struct clk                              *mod_clk;
>         struct tsensor                          sensor[MAX_SENSOR_NUM];
>  };
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
>         if (tmdev->chip->needs_sram) {
>                 struct regmap *regmap;
>
> --
> 2.51.0
>
>

