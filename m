Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82264CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDMewuo9x/cu2BhGLPhUvUnCverX/+1L6wQ/8F1rHP8=; b=4HNgIRJtZNdLHmrdTc2KdvijHR
	1EVA2X/HKmM/Df+gysHESc7/46xLatEuq792RjJZdCGaVZpj3Bbftc/m788WQ0V69s2QhW8MTYwXb
	IJQU7xf3Zdz0ZheD4BsAQ6YAf2FJG5t40n3EWoFE2wfIaxnqs+kO+2H5xcIKYPuVmHn+YqYdPgBE5
	JE6GScEKj/KwGDLjJQKpuS81++amWMUpI5DQcSHimExo+3Dmk0wWold7tnx2UURSePV/g7An7v3l7
	rlJ+dCKsN3IYyqyl3Yx221Ika3yZG0H0hgAntVCvnTCKCE/Eq8f8ZlIO/8Nbs/YYjp3uFSGEepoI9
	1cKfZAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHgN-00000009nsf-3sdm;
	Tue, 19 Aug 2025 08:27:03 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoH6g-00000009j7F-0zAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:50:11 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89021b2569cso1064808241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589809; x=1756194609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDMewuo9x/cu2BhGLPhUvUnCverX/+1L6wQ/8F1rHP8=;
        b=L8FZ8pShAbOsZIYd7nc6W4m/Y9UB6KpzrgDc2nGH3gji0m5QVyw60WpaRFDzZCIFfq
         zy+CpcfpDn5lB2fC7aOvQ1todmmC2mXDy3CwNmDeiiOYfh1/AW9Zsq9nql2YNBp3fAT0
         qLywjsSr8M2hNtvnIjqKC9FRdw10W8o5ZDP1tNDlAlmVrre2/qa14syll9/uhwS4L7xk
         p7H5oEvuw3FbiPG86ZkgGSDFp0BKBWcTm4sj2OZDPPGM6oqdejxRLPYnti1HjyVQcbae
         2oo5K7NmSfx4uiEpPnLLXIFJe6++ykB5cnPkR+Revj2YizU7+u5gs1dVMfIOcIsLiMaG
         /63A==
X-Forwarded-Encrypted: i=1; AJvYcCWa5JSYh8snNs9cxEIPjyurkmZHkS9vfUgMflyhwf7P/LfnNurxtpdu6MNPGEVjJ8ofyOfKmBa9/n0u4nmGRKth@lists.infradead.org
X-Gm-Message-State: AOJu0YyapaEwpKUdqTxzoZK3XdFxFwzOKru0nvQLKQL+1GNCSdTZmb3K
	rg566ugbrsZ937YJ4GavGAH2/uL27zjr7C3Xn+kk+EC+kpWOrTHxYg1j+qzaQdQw
X-Gm-Gg: ASbGnctMP3eUCJGWDqgBZ3nAVJOzTlLWeZ0TPWB6cAOorgKLlzAZD1PuXwJ2mKKVrkU
	pr/VoZ/CRL9iXRru187ITtGHg+DMIi9RaKDcp95fd2bZXVurdeEAYpGjBZw+MLr7Wt87KhCp9iz
	HV07Y7TEX8vkY59+3kZViipBwayQndG6ooMsclikNfzJuolB5My4x6l3J0lRJ6uE85RgpjxIXk1
	EzhbTujz4jAdGv2xHqRC0QWc+LvhnluQKu2kkfK23znT597jnoSkmCEIkumlK7Sd0YyGvwNEn8J
	QQkuv7aPM2jclCunlCE7CBCHqu4MXn/vges6PuSWSjFFchuwMBDs4XN1xoQ9BFwmT9w0g0PlYjm
	21/X3RwpRyZBvbTi883Irjko/7+wP463PdE2W5ERZBaAoP9K0/nyQXzeDAjZu
X-Google-Smtp-Source: AGHT+IG8YeQfkBcN9yOTi8m+H1eRlHzKwts01M6HYGo4FCufh+sCtBqrV1t5HJ/hUbWG6GD9hE+fYA==
X-Received: by 2002:a05:6102:50a0:b0:4e5:9d76:e8c8 with SMTP id ada2fe7eead31-51923e3abbdmr439212137.18.1755589808874;
        Tue, 19 Aug 2025 00:50:08 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890278eb16fsm2340265241.17.2025.08.19.00.50.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:50:08 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-50f8bd52e06so1567128137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:50:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFIKZtDfcVyd039sq7ObeGH0//OKdLBKdZDdWuKE2iacLTaFFdB9PZZjg01yf+VYPFMgsEZe1VQXGPzIgyLV56@lists.infradead.org
X-Received: by 2002:a05:6102:26d3:b0:4f9:a927:d9f8 with SMTP id
 ada2fe7eead31-51922708edbmr391773137.8.1755589807543; Tue, 19 Aug 2025
 00:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com> <20250818162859.9661-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250818162859.9661-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 09:49:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGmbn1H2JV17+9gTYBbnEOmoR9vUevWVx5BTX973MfoQ@mail.gmail.com>
X-Gm-Features: Ac12FXxVEIoEldC7Y_cxbfmRxaBIBcU2E7FFzwjWz0bJ3Q0eWxEWXbpo_Rtft2U
Message-ID: <CAMuHMdUGmbn1H2JV17+9gTYBbnEOmoR9vUevWVx5BTX973MfoQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] thermal: renesas: rzg3e: Add thermal driver for
 the Renesas RZ/G3E SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, catalin.marinas@arm.com, will@kernel.org, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_005010_272572_928ED832 
X-CRM114-Status: GOOD (  28.37  )
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

Hi John,

On Mon, 18 Aug 2025 at 18:29, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ/G3E SoC integrates a Temperature Sensor Unit (TSU) block designed
> to monitor the chip's junction temperature. This sensor is connected to
> channel 1 of the APB port clock/reset and provides temperature measurements.
>
> It also requires calibration values stored in the system controller registers
> for accurate temperature measurement. Add a driver for the Renesas RZ/G3E TSU.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> v7: Refactored driver structure:
>   - removes splinlock usage
>   - updates polling timeout as per the datasheet
>   - uses average mode to be more accurate
>   - uses polling (faster than irq mode) for get_temp() while keeping IRQ for hw
>   trip-point cross detection.
>   - adds both runtime and sleep PM support

Thanks for the update!

I only looked at the code to obtain the trim register offsets.

> --- /dev/null
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c

> +static int rzg3e_thermal_parse_dt(struct rzg3e_thermal_priv *priv)
> +{
> +       struct device_node *np = priv->dev->of_node;
> +       struct of_phandle_args args;
> +       int ret;
> +
> +       ret = of_parse_phandle_with_args(np, "renesas,tsu-trim",
> +                                        "#address-cells", 0, &args);

of_parse_phandle_with_fixed_args(np, "renesas,tsu-trim", 1, 0, &args)

> +       if (ret)
> +               return dev_err_probe(priv->dev, ret,
> +                                    "Failed to parse renesas,tsu-trim\n");
> +
> +       if (args.args_count < 1) {

"!= 1", however, I think this test is no longer needed after moving
to of_parse_phandle_with_fixed_args().

> +               dev_err(priv->dev, "Invalid renesas,tsu-trim property\n");
> +               of_node_put(args.np);
> +               return -EINVAL;
> +       }
> +
> +       priv->trim_offset = args.args[0];
> +
> +       priv->syscon = syscon_node_to_regmap(args.np);
> +       of_node_put(args.np);
> +
> +       if (IS_ERR(priv->syscon))
> +               return dev_err_probe(priv->dev, PTR_ERR(priv->syscon),
> +                                    "Failed to get syscon regmap\n");
> +
> +       return 0;
> +}
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

