Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09F6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 04:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNo7qe9Lz9mlSgoeITrfWOs7/oXxKQcv8brSPsNOFbQ=; b=b7VtodqHtBy1wX
	IA818TXHwjETaRpj/+kwKBrDbg8U8p36rNWcA6qyfddCKTOQaya7tTYpa+JDeZCZPX+y7fljA4x/Z
	eKrZ7uYp3oOFdCY2RywPqrGo+o3VoSZVOWgA/NxaXpcFuukAJHgYefPb2rZbQW1riYETAf+6c/VKK
	z4p5B9VU4TvNYYka5DabxWTa36tQ5xwj1g6EVORE0rfCLzhRYJ9RiuIZasSyum3heno4njhMJtSt+
	3Bqp6tUZx0RC2WGmVZMJ3Cvyg3ngRfc/H5tOZDZgoLjGeA/FfJ33eFky3Wc4MkDitTpzIAjTLm5Uc
	mGN0+dTWhfhGyiqK3F1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8tpJ-00000002so1-0gVY;
	Sun, 27 Apr 2025 04:41:13 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8tnM-00000002sg4-3oxN;
	Sun, 27 Apr 2025 04:39:13 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10956398so4128506e87.0;
        Sat, 26 Apr 2025 21:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728750; x=1746333550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNo7qe9Lz9mlSgoeITrfWOs7/oXxKQcv8brSPsNOFbQ=;
        b=wNGVN7jC53fx5WeRQ0lS+hV0BoMyJf3irvNcUMh0XGfrOo8hB4Tjddg6iehgQXlHx2
         drgxhyJRKLBWrswX189CZCy7QIAFOp7WMghkyu6yxCFgyrlT6Bv4yHWvTiqoSx+29lYN
         ODNOVqV7QdhkfymfrmTT9izPcK9rjkxbVy6DGIVdTuHyXeAQWt2FhYcWe9srX5/M4fuf
         ndIM9uaAra9/0AfpiKMThofpffKlw3D1FYAEGXsQ35tCTy40SVm1nr6mmK0gsALZubhK
         H0/e5hklzsLmFFW5MuBMTrLho78TU+tVyhFozo1ZPrDlBHO7bOtM6a100BtsU3VQ547a
         EL5w==
X-Forwarded-Encrypted: i=1; AJvYcCWoa2jxTRt+f/Ock8gLdsA3aDPiSXPhDND+11G8wL7B6FncORp2QOJH7/q4ppHhKYR4FbSGStWylRoiE40I@lists.infradead.org, AJvYcCXQAvLowUXW1/VwayqXQ+JNiMJp6gIbp0q3b/U8Ncts64tJjQmBxLLQgDbxN99Mok4ckxu2e4Kv7tyxC6jCIs5XLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEaj1TR4AiBjfn9VWiDZEvP04cxBsBGY2wmJUarinlpsPhD8/5
	7R+Gwv8lrpRO5aCDBDNf5tbBfSerSKbXGbYkIqoB8enhvo15rhW584og0bT/
X-Gm-Gg: ASbGncuhqDRHt8FK8C1+xgoX6oHeW4OD/EVjV8ZreCJ7peggIeDQODvlCdbS87eyJvy
	xS1BcyGK3/Qctgf+MslIBAkv4XbdsVsTqdD6CDJH1f1I+e3GemOAeaR21NdiPTcffLpTDfJjWM3
	gHs2J9Ni5txx6dbckCBSc6WazfbPuUKoHSW8zCZJkkpNdO83y8Hs0FYF0vwU2swU7DHmrALq4MC
	fdMvbYYzmSwcstoRU8jV525IHQH/MnzFlzCIhet+zzEWrhwf+6MJV33hpLiwexoH+48QiMrfRmb
	2bSPPdOCHkanl2JFxawFM9ZJb4O1/px5K/ReUj1gX6B7txnuAC1eJOimp7Aip0OopYcJOfI55A=
	=
X-Google-Smtp-Source: AGHT+IHMAdMz74N/iPYvpibEVeXhUesO/X5tupKSgC3C872/ZTlfitZxXGIfU+3QgyoozBc7+OSdZw==
X-Received: by 2002:a05:6512:6288:b0:54e:8189:2eac with SMTP id 2adb3069b0e04-54e81892f7fmr2772840e87.12.1745728749647;
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2595dsm1251560e87.39.2025.04.26.21.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30effbfaf61so41198891fa.0;
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtKOerDi/4CtbiqZgHzbUC3fJv2P0RAXA3yY+uVPzguDXGyhbAqVr4BCw6KZ87uIWjWgdYvu45Uvvp/zTzLIM6Pw==@lists.infradead.org, AJvYcCW2uw212wjbHlV865PtyAsDpXUPAwHCafOUTFH1pFDPvqI1D8EVedd+93Z2PSXGTadfEXJUlCbR8exO/ltz@lists.infradead.org
X-Received: by 2002:a05:651c:12c8:b0:30b:fc16:d482 with SMTP id
 38308e7fff4ca-317cc3b4babmr34833351fa.3.1745728749245; Sat, 26 Apr 2025
 21:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:38:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
X-Gm-Features: ATxdqUFqwWzMoc8bpc0UG6R3aiwwevesO0_bqj7uRg6TeOMZWI1Q6QZaB7zJ9oE
Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: sunxi: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_213912_950479_B8E4AEC8 
X-CRM114-Status: GOOD (  16.95  )
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

On Fri, Apr 4, 2025 at 7:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual drivers, even
> though their choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/sunxi/Kconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b175d=
ce798ac8b3268b0 100644
> --- a/drivers/clk/sunxi/Kconfig
> +++ b/drivers/clk/sunxi/Kconfig
> @@ -2,13 +2,13 @@
>  menuconfig CLK_SUNXI
>         bool "Legacy clock support for Allwinner SoCs"
>         depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
> -       default y
> +       default (ARM && ARCH_SUNXI)

Just wondering, shouldn't this change alone be enough? The remaining
Kconfig options are gated by this one.

ChenYU

>  if CLK_SUNXI
>
>  config CLK_SUNXI_CLOCKS
>         bool "Legacy clock drivers"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock drivers being used on older (A10, A13, A20,
>           A23, A31, A80) SoCs. These drivers are kept around for
> @@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
>
>  config CLK_SUNXI_PRCM_SUN6I
>         bool "Legacy A31 PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the A31 PRCM clocks. Those are
>           usually needed for the PMIC communication, mostly.
>
>  config CLK_SUNXI_PRCM_SUN8I
>         bool "Legacy sun8i PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the sun8i family PRCM clocks.
>           Those are usually needed for the PMIC communication,
> @@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
>
>  config CLK_SUNXI_PRCM_SUN9I
>         bool "Legacy A80 PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the A80 PRCM clocks. Those are
>           usually needed for the PMIC communication, mostly.
>
> --
> 2.45.2
>
>

