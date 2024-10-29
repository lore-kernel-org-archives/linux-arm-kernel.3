Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD52DD3A697
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02fVgYCHwHYWz9XJLOuShixyFS6jMl+g475mqm/khNw=; b=G3t7WTUGcTCat+1QyU0rNDE+Rv
	20M/0LkP2hxhz/CCrZgZzNFj9VUCwFtVG/CMoTz5ylj6JhiVrqtodDBRLxWOSANU1WXo9nZPnEzfv
	8zASfhsc+2/676JiURc7jTy/K3lnhKzgdLow4jI8en7WvTtuPEhMOhcFJCk2DuaVd3JVl2+JcqxB8
	XbzumD3ebPgjZEJGxpV/+R6gp2RMn69G/qtN5z6297vz0dDqsiCQzio87CBC9MTVPH1B5SNUoi3Is
	83CLD3EfOn2unYRX3SbHTgAf+pmWesj0bJ4DtUmDnoYE+G8H1JiKUHKbp6czlw1F2wX4gQnRcfWZL
	GNNpvDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sXM-0000000Fj78-0FXv;
	Tue, 29 Oct 2024 20:09:56 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sV5-0000000Fiq7-1Znm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:07:36 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6e377e4aea3so53492167b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730232454; x=1730837254; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02fVgYCHwHYWz9XJLOuShixyFS6jMl+g475mqm/khNw=;
        b=sCAx2CZ3/Zx8LQYGMmYbE7V7B8Yv9MeJUzW85KOaqKjuHqucqezk81ODkF0kzRv0cE
         QTkRb/7EHKFDpvpHXeQS1JN6wlcR/d8fSXaR53rC6DOgRHEzadX8tEXSCRtW+opugDkh
         h322tSpFbmFBmqoF9ju8fL8CdDZqY95vfyQqQ3FY3HDTP1WaA0nSozxtV3P6z/jECQcl
         F2O/j33zhIn67XD2iElUJqq4I2SHnvF+3CrZqSjB0V/x2LgpFSpdkQuzuuHo3+XqCfcH
         DtK6XYgyqxutYET91nr80h2VuDz+1J4V7IvIh63dUqzLxiAhAdItXhXOpw/ROhPT3n6p
         2mLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730232454; x=1730837254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02fVgYCHwHYWz9XJLOuShixyFS6jMl+g475mqm/khNw=;
        b=agiMpkxIQVZjimSIPo6KBoe4mV95Do7krJturRrEG8EugXaqiilLsmi2kvhnM75ZKU
         4BvFHcP52AkUbzIJlNLHfirLprl0+hCO4Ada3W3ZTYAUu+ExC9FeDgeGmOMjxpPbbLNY
         PyutYa3LpD1Cap4vO8WGE56kcGCt+A76N+iuc/cfA3oFHl8irdYToEqVzTHNKlzIyuDi
         9BT05iCEKtWZhSs1VNDYyppfFkIDgS92Umlxgfi+XfiDn+zVUNQEnJzY0eZ1BIhBMQlC
         +mw6G5GcLK/iX7v3YkQjWT3zBSlTm4XGt/wCyJ+ZRO6rkQuzLVspKAGlv6vxJ7JpnKR9
         jDew==
X-Forwarded-Encrypted: i=1; AJvYcCVth0rBhNZRYbOdYVJJGHrPTTYSMlWRP8mB+wkw8iUxCAacaGLTSUQzvNBCgv06TjVsOv8pNpK/NnLgIAnP8pJ5@lists.infradead.org
X-Gm-Message-State: AOJu0YzzExIGb12pTqqt5ae1oL1nz/BgqDTmzWrhr4h0fcQ7T6j1wxBD
	CbhWM1BZBtGFl8djp3o7SpR5cG+3xS/Ze0MTxsAHYtW0mqrdYXIB+6eGw1Lt5VtYzdRU8JPSiLy
	KUH36/eA+u/+pMWJT4youD61c++D/If1D/z5/GQ==
X-Google-Smtp-Source: AGHT+IE6yjevMKWWK5dEWcL+udZz549JMdzzGNgSsO5RyF7/i8ZbdZi84RS0NDlaugK3ZRmt6j5woCgLHpdcq7icNZM=
X-Received: by 2002:a05:6902:161d:b0:e29:c45:9272 with SMTP id
 3f1490d57ef6-e3087a4ca3fmr11835983276.9.1730232453728; Tue, 29 Oct 2024
 13:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241029191131.2329414-1-peter.griffin@linaro.org>
In-Reply-To: <20241029191131.2329414-1-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 29 Oct 2024 15:07:23 -0500
Message-ID: <CAPLW+4=jK63MFCRuhDkT2RH-J6dYsd0qHf_f1EeWTdrGqGLn=A@mail.gmail.com>
Subject: Re: [PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs"
To: Peter Griffin <peter.griffin@linaro.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, krzk@kernel.org, 
	alim.akhtar@samsung.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_130735_446030_66063335 
X-CRM114-Status: GOOD (  19.02  )
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

On Tue, Oct 29, 2024 at 2:11=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.
>
> Now that we can register a SoC specific regmap with syscon using
> of_syscon_register_regmap() api we can switch back to using
> syscon_regmap_lookup_by_phandle() in the client drivers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/Kconfig       | 1 +
>  drivers/watchdog/s3c2410_wdt.c | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 684b9fe84fff..f3cd402e5795 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -549,6 +549,7 @@ config S3C2410_WATCHDOG
>         tristate "S3C6410/S5Pv210/Exynos Watchdog"
>         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE=
_TEST
>         select WATCHDOG_CORE
> +       select MFD_SYSCON if ARCH_EXYNOS
>         help
>           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
>           SoCs. This will reboot the system when the timer expires with
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 686cf544d0ae..349d30462c8c 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -24,9 +24,9 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> -#include <linux/soc/samsung/exynos-pmu.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
>                 return ret;
>
>         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> -               wdt->pmureg =3D exynos_get_pmu_regmap_by_phandle(dev->of_=
node,
> -                                                "samsung,syscon-phandle"=
);
> +               wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> +                                               "samsung,syscon-phandle")=
;
>                 if (IS_ERR(wdt->pmureg))
>                         return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> -                                            "PMU regmap lookup failed.\n=
");
> +                                            "syscon regmap lookup failed=
.\n");
>         }
>
>         wdt_irq =3D platform_get_irq(pdev, 0);
> --
> 2.47.0.163.g1226f6d8fa-goog
>
>

