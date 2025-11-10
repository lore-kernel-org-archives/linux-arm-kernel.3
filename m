Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F96ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLRDHES8x7hy2Cq6bFhMakeR+ZtfEVkHELo4BsFny2w=; b=NTIEk15WOY9LSeRPDZ9mA6MIAZ
	RLpB8kl8ilCAbCjwbKQNfM9PFpDIRWboH64BAgziZPg5wZXAxeONu26ZAJkhaXbEfYjTP2NaV/oSK
	YCstiXi16zBRMae4/GfOMdQi/g6mXiwIyLAHsXVCqVeuTxpcLHBQ8A7ATnsz7SQVq7MNStlSo0b7U
	73rYSc1WZfe1MGPKzCK37yn0RpWLyKq2g/lCquchpeulRT4lUE4w4L1MzENyfHkRsUdxtJwoRss6y
	/KsAlHoYqj4JE3W71ZiBHdPU0f18k96Ge3qtMeZ7+oIMqrhC+kP1hEcNChG/yI3B4Pz7Lev1+bzci
	NyNbOULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN3g-00000004xhG-3cFQ;
	Mon, 10 Nov 2025 08:15:28 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN3d-00000004xgL-1gfR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 08:15:27 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dbde7f4341so2398598137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 00:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762523; x=1763367323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLRDHES8x7hy2Cq6bFhMakeR+ZtfEVkHELo4BsFny2w=;
        b=OVVElSz0UJ82O3TOJWZ0IuUoT3s82uIa5N4K7I+SMwHap8wR0DCwB585+EsllEu2aI
         raczoaDpwwuuAmXHt55QF0QrXZizNUOjbM1ScntNEqB6ebRzypuQzS2wIELMULWYd7Xv
         QoJDIgExOFSR2KZzPR/m9Yd/VXxCLLrjA7WizY9dvT4KpXv8uijf9M/7NaF5Raju+Ydk
         u+UZS9c/XAhinSqDOjZrXNYdBN1umIa3k9bIbPrePxRDotGeYhlRy0pfwVsg5pViHJM2
         Xk3eZnJt/pQhY0ZnIwDMsP0qY02aKXzT3NpmF6hmKtS1Kmd0oiUcXUla9wRS1UdWYQ8v
         JYpA==
X-Forwarded-Encrypted: i=1; AJvYcCVrK4Suy4eZ59Rj7s3JeqXT/mBZZ78+3WbWKo2rnxLalqAYnQFFhH7jVvnYM8yBwpse8bFciQ4tVLCvkNk70L2N@lists.infradead.org
X-Gm-Message-State: AOJu0YzPawvn1GDijcGtbTHDCGbpJM4GR/TyoorjSnmM/Iveeg6m+HVZ
	lR8bgDox/CZdEBTO76qVi8FmHLGeld4Sa0LabKhbkbCcV5w62wslp+K+sX389Lew
X-Gm-Gg: ASbGncuWmg4ouvFovGX5LQC3ApKtDdrzpOKqeOcJdlA9awonLKpP8KFbfbNsHiOyvvZ
	uYbWlE3VjlorEoyQ1AposUG63YZ3yRHZTGxVWaRd6LKxvESTM21UNLB6tYgi5AYHpPhzNbXq6iY
	OQo6yS6pePtOsIM+WGFPcK1nWtEr8ecfu3bEs9C59H+aK7NDWUrGKrcZFT40oMLE1gd+qds+fbM
	8+jxDiflclBx6S1tXA2y1VwgStwru/Pl8QA7KQNdybrAgNEfwkF/kKh+i1NtmvWBTcaqAbLSWgi
	1unTMbAVVlFHy8rfcRFGBFneZe0PjF9h7jMMh01IJ98SfmIDQwuaNEoDuLAfk+Oj5gmCI5KkT2T
	TTNJVZWm69vnBAUT81pEkoY30F2VtU0wJFcOCWT6+mHGbQ8GhMree4Uy0ug/RML3kebD1IIY8/v
	rJ1aHzczFMJwuhyCHGkHLN4WPrcb4JxayXLFSic1EcAA==
X-Google-Smtp-Source: AGHT+IEr6FX+5yZOpARSZfUki/Ghvlj0vufoHJR+IqCnoFWLyhXFc5CAnwYwvpfBhNj6Peh7g3EOAg==
X-Received: by 2002:a05:6102:611c:20b0:5dd:c484:957a with SMTP id ada2fe7eead31-5ddc48498b8mr1614062137.21.1762762523412;
        Mon, 10 Nov 2025 00:15:23 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93727691ea7sm2480448241.8.2025.11.10.00.15.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 00:15:22 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9372164d768so1221049241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 00:15:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWaCciewQ8OV85imLm3XCMi9daNXimcIPzjSKyiZB09oD4OlXUiu38mb3I0urad/JVdsMOVO6VKM2mex/zY4G2P@lists.infradead.org
X-Received: by 2002:a05:6102:c8e:b0:5db:e179:1c2f with SMTP id
 ada2fe7eead31-5ddb9e00ddbmr3016566137.18.1762762522544; Mon, 10 Nov 2025
 00:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org> <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
In-Reply-To: <20251107-b4-m5441x-add-rng-support-v2-2-f91d685832b9@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 09:15:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com>
X-Gm-Features: AWmQ_bkP3DEy9lbUQUJXmebZYXL_ADR8ol219vUzw9saT-bIiR6N27eoovxyIr8
Message-ID: <CAMuHMdWL76hY-Pv30ooSM1J6XkVWbRXSLTDCjfpPOvhFN4tKyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_001525_449700_F208EAF2 
X-CRM114-Status: GOOD (  34.00  )
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

Hi Jean-Michel,

On Fri, 7 Nov 2025 at 11:29, Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Add platform device support for the MCF54418 RNGB hardware with clock
> enabled at platform initialization.
>
> The imx-rngc driver now uses devm_clk_get_optional() to support both
> Coldfire (always-on clock) and i.MX platforms (managed clock).
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

Thanks for your patch!

> --- a/drivers/char/hw_random/Kconfig
> +++ b/drivers/char/hw_random/Kconfig
> @@ -270,12 +270,13 @@ config HW_RANDOM_MXC_RNGA
>  config HW_RANDOM_IMX_RNGC
>         tristate "Freescale i.MX RNGC Random Number Generator"
>         depends on HAS_IOMEM
> -       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL || COMPILE_TEST
> +       depends on SOC_IMX25 || SOC_IMX6SL || SOC_IMX6SLL || SOC_IMX6UL || M5441x || COMPILE_TEST

Is the same RNG present in other Coldfire SoCs?

>         default HW_RANDOM
>         help
>           This driver provides kernel-side support for the Random Number
>           Generator Version C hardware found on some Freescale i.MX
>           processors. Version B is also supported by this driver.
> +         Also supports RNGB on Freescale MCF54418 (Coldfire V4e).
>
>           To compile this driver as a module, choose M here: the
>           module will be called imx-rngc.
> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index 241664a9b5d9ac7244f15cbe5d5302ca3787ebea..44f20a05de0a425cb6ff7b2a347b111750ac3702 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -353,12 +353,19 @@ static const struct of_device_id imx_rngc_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, imx_rngc_dt_ids);
>
> +static const struct platform_device_id imx_rngc_devtype[] = {
> +       { .name = "imx-rngc" },

I believe this is identical to KBUILD_MODNAME, so the .name below
should be sufficient for binding?

> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, imx_rngc_devtype);

Or do you need this mainly for the addition of MODULE_DEVICE_TABLE(),
i.e. the module is not auto-loaded based on just KBUILD_MODNAME?

> +
>  static struct platform_driver imx_rngc_driver = {
>         .driver = {
>                 .name = KBUILD_MODNAME,
                  ^^^^^^^^^^^^^^^^^^^^^^^

>                 .pm = pm_ptr(&imx_rngc_pm_ops),
>                 .of_match_table = imx_rngc_dt_ids,
>         },
> +       .id_table = imx_rngc_devtype,
>  };
>
>  module_platform_driver_probe(imx_rngc_driver, imx_rngc_probe);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

